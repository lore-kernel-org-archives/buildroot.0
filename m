From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu,  7 Jan 2021 14:53:05 +0100
Subject: [Buildroot] [PATCH 1/3] package/refpolicy: Add patches pending the
 next release
In-Reply-To: <20210107135307.1762186-1-maxime.chevallier@bootlin.com>
References: <20210107135307.1762186-1-maxime.chevallier@bootlin.com>
Message-ID: <20210107135307.1762186-2-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to be able to run a basic system in enforcing mode, we need to
apply a few patches on top of RELEASE_2_20200818.

This allows us to fix a few pending issues, most notably with systemd v246.

Patch 0001 is a squash of a few patches written by Antoine Tenart that
are already in the refpolicy master branch.

Patches 2, 3 and 4 are also in the master branch, and are needed by
subsequen patches so that systemd-tmpfiles and agetty can make use of
nsswitch.

Patches 5 and 6 are part of a pull-request that haven't been merged yet,
that addresses the issues with agetty and systemd-tmpfiles :
https://github.com/SELinuxProject/refpolicy/pull/330

Patch 7 fixes the current issue with systemd v246 that is related to
sytemd-udevd now being a symlink to udevadm.

The fix for that has been submitted on the refpolicy mailing-list, with
the review process ongoing :
https://lore.kernel.org/selinux-refpolicy/2b5b0f1e-2576-23f4-4ab4-26f8fcfb2c30 at ieee.org/T/#t

Finally, Patch 8 addresses issues for which there's no clear strategy
yet for upstreaming in the refpolicy.

Hopefully, most of these patches should be dropped once the next
refpolicy version is published.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../refpolicy/0001-pending-next-release.patch | 673 ++++++++++++++++++
 ...-private-type-for-run-systemd-userdb.patch | 130 ++++
 .../0003-authlogin-connect-to-userdb.patch    |  92 +++
 ...0004-systemd-logind-utilize-nsswitch.patch |  33 +
 ...0005-getty-utilize-auth_use_nsswitch.patch |  40 ++
 ...d-tmpfiles-utilize-auth_use_nsswitch.patch |  32 +
 .../refpolicy/0007-first-udevadm-patch.patch  | 130 ++++
 ...ing-Fixes-for-Buildroot-to-boot-in-e.patch | 190 +++++
 8 files changed, 1320 insertions(+)
 create mode 100644 package/refpolicy/0001-pending-next-release.patch
 create mode 100644 package/refpolicy/0002-systemd-private-type-for-run-systemd-userdb.patch
 create mode 100644 package/refpolicy/0003-authlogin-connect-to-userdb.patch
 create mode 100644 package/refpolicy/0004-systemd-logind-utilize-nsswitch.patch
 create mode 100644 package/refpolicy/0005-getty-utilize-auth_use_nsswitch.patch
 create mode 100644 package/refpolicy/0006-systemd-tmpfiles-utilize-auth_use_nsswitch.patch
 create mode 100644 package/refpolicy/0007-first-udevadm-patch.patch
 create mode 100644 package/refpolicy/0008-pending-upstreaming-Fixes-for-Buildroot-to-boot-in-e.patch

diff --git a/package/refpolicy/0001-pending-next-release.patch b/package/refpolicy/0001-pending-next-release.patch
new file mode 100644
index 0000000000..e049845638
--- /dev/null
+++ b/package/refpolicy/0001-pending-next-release.patch
@@ -0,0 +1,673 @@
+From 2566e2dac2c759392e0b9f3d442b8489b726cb10 Mon Sep 17 00:00:00 2001
+From: Antoine Tenart <antoine.tenart@bootlin.com>
+Date: Mon, 31 Aug 2020 15:38:13 +0200
+Subject: [PATCH 1/8] [pending next release]
+
+udev: allow udevadm to retrieve xattrs
+
+Fixes:
+
+avc:  denied  { getattr } for  pid=50 comm="udevadm" name="/" dev="vda"
+ino=2 scontext=system_u:system_r:udevadm_t
+tcontext=system_u:object_r:fs_t tclass=filesystem permissive=0
+
+avc:  denied  { getattr } for  pid=52 comm="udevadm" name="/" dev="vda"
+ino=2 scontext=system_u:system_r:udevadm_t
+tcontext=system_u:object_r:fs_t tclass=filesystem permissive=0
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+locallogin: allow login to get attributes of procfs
+
+Fixes:
+avc:  denied  { getattr } for  pid=88 comm="login" name="/" dev="proc"
+ino=1 scontext=system_u:system_r:local_login_t
+tcontext=system_u:object_r:proc_t tclass=filesystem permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+logging: allow systemd-journal to write messages to the audit socket
+
+Fixes:
+
+avc:  denied  { nlmsg_write } for  pid=46 comm="systemd-journal"
+scontext=system_u:system_r:syslogd_t
+tcontext=system_u:system_r:syslogd_t tclass=netlink_audit_socket
+permissive=1
+
+avc:  denied  { nlmsg_write } for  pid=46 comm="systemd-journal"
+scontext=system_u:system_r:syslogd_t
+tcontext=system_u:system_r:syslogd_t tclass=netlink_audit_socket
+permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+sysnetwork: allow to read network configuration files
+
+Fixes:
+
+avc:  denied  { getattr } for  pid=55 comm="systemd-udevd"
+path="/etc/systemd/network" dev="vda" ino=128
+scontext=system_u:system_r:udev_t tcontext=system_u:object_r:net_conf_t
+tclass=dir permissive=1
+
+avc:  denied  { getattr } for  pid=55 comm="systemd-udevd"
+path="/etc/systemd/network" dev="vda" ino=128
+scontext=system_u:system_r:udev_t tcontext=system_u:object_r:net_conf_t
+tclass=dir permissive=1
+
+avc:  denied  { read } for  pid=55 comm="systemd-udevd" name="network"
+dev="vda" ino=128 scontext=system_u:system_r:udev_t
+tcontext=system_u:object_r:net_conf_t tclass=dir permissive=1
+
+avc:  denied  { read } for  pid=55 comm="systemd-udevd" name="network"
+dev="vda" ino=128 scontext=system_u:system_r:udev_t
+tcontext=system_u:object_r:net_conf_t tclass=dir permissive=1
+
+avc:  denied  { open } for  pid=55 comm="systemd-udevd"
+path="/etc/systemd/network" dev="vda" ino=128
+scontext=system_u:system_r:udev_t tcontext=system_u:object_r:net_conf_t
+tclass=dir permissive=1
+
+avc:  denied  { open } for  pid=55 comm="systemd-udevd"
+path="/etc/systemd/network" dev="vda" ino=128
+scontext=system_u:system_r:udev_t tcontext=system_u:object_r:net_conf_t
+tclass=dir permissive=1
+
+avc:  denied  { getattr } for  pid=59 comm="systemd-network"
+path="/etc/systemd/network" dev="vda" ino=128
+scontext=system_u:system_r:systemd_networkd_t
+tcontext=system_u:object_r:net_conf_t tclass=dir permissive=1
+
+avc:  denied  { read } for  pid=59 comm="systemd-network" name="network"
+dev="vda" ino=128 scontext=system_u:system_r:systemd_networkd_t
+tcontext=system_u:object_r:net_conf_t tclass=dir permissive=1
+
+avc:  denied  { open } for  pid=59 comm="systemd-network"
+path="/etc/systemd/network" dev="vda" ino=128
+scontext=system_u:system_r:systemd_networkd_t
+tcontext=system_u:object_r:net_conf_t tclass=dir permissive=1
+
+avc:  denied  { search } for  pid=59 comm="systemd-network"
+name="network" dev="vda" ino=128
+scontext=system_u:system_r:systemd_networkd_t
+tcontext=system_u:object_r:net_conf_t tclass=dir permissive=1
+
+avc:  denied  { getattr } for  pid=55 comm="systemd-udevd"
+path="/etc/systemd/network" dev="vda" ino=128
+scontext=system_u:system_r:udev_t tcontext=system_u:object_r:net_conf_t
+tclass=dir permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+dbus: add two interfaces to allow reading from directories and named sockets
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+dbus: allow clients to list runtime dirs and named sockets
+
+Fixes:
+
+avc:  denied  { read } for  pid=77 comm="systemd-resolve" name="dbus"
+dev="tmpfs" ino=2748 scontext=system_u:system_r:systemd_resolved_t
+tcontext=system_u:object_r:system_dbusd_runtime_t tclass=dir
+permissive=1
+
+avc:  denied  { read } for  pid=77 comm="systemd-resolve"
+name="system_bus_socket" dev="tmpfs" ino=2765
+scontext=system_u:system_r:systemd_resolved_t
+tcontext=system_u:object_r:system_dbusd_runtime_t tclass=sock_file
+permissive=1
+
+avc:  denied  { read } for  pid=59 comm="systemd-network" name="dbus"
+dev="tmpfs" ino=2777 scontext=system_u:system_r:systemd_networkd_t
+tcontext=system_u:object_r:system_dbusd_runtime_t tclass=dir
+permissive=1
+
+avc:  denied  { read } for  pid=59 comm="systemd-network"
+name="system_bus_socket" dev="tmpfs" ino=2791
+scontext=system_u:system_r:systemd_networkd_t
+tcontext=system_u:object_r:system_dbusd_runtime_t tclass=sock_file
+permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+systemd: add extra systemd_generator_t rules
+
+Fixes:
+
+avc:  denied  { setfscreate } for  pid=41 comm="systemd-getty-g"
+scontext=system_u:system_r:systemd_generator_t
+tcontext=system_u:system_r:systemd_generator_t tclass=process
+permissive=1
+
+avc:  denied  { dac_override } for  pid=40 comm="systemd-fstab-g"
+capability=1  scontext=system_u:system_r:systemd_generator_t
+tcontext=system_u:system_r:systemd_generator_t tclass=capability
+permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+systemd: allow systemd-hwdb to search init runtime directories
+
+Fixes:
+
+avc:  denied  { search } for  pid=54 comm="systemd-hwdb" name="systemd"
+dev="tmpfs" ino=664 scontext=system_u:system_r:systemd_hw_t
+tcontext=system_u:object_r:init_runtime_t tclass=dir permissive=1
+
+avc:  denied  { search } for  pid=54 comm="systemd-hwdb" name="systemd"
+dev="tmpfs" ino=664 scontext=system_u:system_r:systemd_hw_t
+tcontext=system_u:object_r:init_runtime_t tclass=dir permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+systemd: allow systemd-network to get attributes of fs
+
+Fixes:
+
+avc:  denied  { getattr } for  pid=57 comm="systemd-network" name="/"
+dev="vda" ino=2 scontext=system_u:system_r:systemd_networkd_t
+tcontext=system_u:object_r:fs_t tclass=filesystem permissive=0
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+systemd: allow systemd-resolve to read in tmpfs
+
+Fixes:
+avc:  denied  { read } for  pid=76 comm="systemd-resolve" name="/"
+dev="tmpfs" ino=651 scontext=system_u:system_r:systemd_resolved_t
+tcontext=system_u:object_r:var_run_t tclass=dir permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+corecommands: add entry for Busybox shell
+
+Fixes:
+
+vc:  denied  { execute } for  pid=87 comm="login" name="sh" dev="vda"
+ino=408 scontext=system_u:system_r:local_login_t
+tcontext=system_u:object_r:bin_t tclass=file permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+systemd: allow systemd-getty-generator to read and write unallocated ttys
+
+Fixes:
+
+avc:  denied  { read write } for  pid=40 comm="systemd-getty-g"
+name="ttyS0" dev="devtmpfs" ino=612
+scontext=system_u:system_r:systemd_generator_t
+tcontext=system_u:object_r:tty_device_t tclass=chr_file permissive=1
+
+avc:  denied  { open } for  pid=40 comm="systemd-getty-g"
+path="/dev/ttyS0" dev="devtmpfs" ino=612
+scontext=system_u:system_r:systemd_generator_t
+tcontext=system_u:object_r:tty_device_t tclass=chr_file permissive=1
+
+avc:  denied  { ioctl } for  pid=40 comm="systemd-getty-g"
+path="/dev/ttyS0" dev="devtmpfs" ino=612 ioctlcmd=0x5401
+scontext=system_u:system_r:systemd_generator_t
+tcontext=system_u:object_r:tty_device_t tclass=chr_file permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+systemd: allow systemd-network to list the runtime directory
+
+Fixes:
+
+avc:  denied  { read } for  pid=58 comm="systemd-network" name="/"
+dev="tmpfs" ino=652 scontext=system_u:system_r:systemd_networkd_t
+tcontext=system_u:object_r:var_run_t tclass=dir permissive=1
+
+avc:  denied  { read } for  pid=58 comm="systemd-network" name="/"
+dev="tmpfs" ino=652 scontext=system_u:system_r:systemd_networkd_t
+tcontext=system_u:object_r:var_run_t tclass=dir permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+ntp: allow systemd-timesyn to watch dbus objects
+
+Fixes:
+
+avc:  denied  { watch } for  pid=68 comm="systemd-timesyn"
+path="/run/dbus" dev="tmpfs" ino=2707 scontext=system_u:system_r:ntpd_t
+tcontext=system_u:object_r:system_dbusd_runtime_t tclass=dir
+permissive=1
+
+avc:  denied  { watch } for  pid=68 comm="systemd-timesyn"
+path="/run/dbus/system_bus_socket" dev="tmpfs" ino=2716
+scontext=system_u:system_r:ntpd_t
+tcontext=system_u:object_r:system_dbusd_runtime_t tclass=sock_file
+permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+ntp: allow systemd-timesyn to setfscreate
+
+Fixes:
+
+avc:  denied  { setfscreate } for  pid=68 comm="systemd-timesyn"
+scontext=system_u:system_r:ntpd_t tcontext=system_u:system_r:ntpd_t
+tclass=process permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+logging: add an interface to relabel auditd log directories
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+systemd: allow systemd-tmpfile to manage the audit log
+
+Fixes:
+
+avc:  denied  { create } for  pid=57 comm="systemd-tmpfile" name="audit"
+scontext=system_u:system_r:systemd_tmpfiles_t
+tcontext=system_u:object_r:auditd_log_t tclass=dir permissive=1
+
+avc:  denied  { create } for  pid=57 comm="systemd-tmpfile" name="audit"
+scontext=system_u:system_r:systemd_tmpfiles_t
+tcontext=system_u:object_r:auditd_log_t tclass=dir permissive=1
+
+avc:  denied  { read } for  pid=57 comm="systemd-tmpfile" name="audit"
+dev="vda" ino=1942 scontext=system_u:system_r:systemd_tmpfiles_t
+tcontext=system_u:object_r:auditd_log_t tclass=dir permissive=1
+
+avc:  denied  { open } for  pid=57 comm="systemd-tmpfile"
+path="/var/log/audit" dev="vda" ino=1942
+scontext=system_u:system_r:systemd_tmpfiles_t
+tcontext=system_u:object_r:auditd_log_t tclass=dir permissive=1
+
+avc:  denied  { read } for  pid=57 comm="systemd-tmpfile" name="audit"
+dev="vda" ino=1942 scontext=system_u:system_r:systemd_tmpfiles_t
+tcontext=system_u:object_r:auditd_log_t tclass=dir permissive=1
+
+avc:  denied  { open } for  pid=57 comm="systemd-tmpfile"
+path="/var/log/audit" dev="vda" ino=1942
+scontext=system_u:system_r:systemd_tmpfiles_t
+tcontext=system_u:object_r:auditd_log_t tclass=dir permissive=1
+
+avc:  denied  { getattr } for  pid=57 comm="systemd-tmpfile"
+path="/var/log/audit" dev="vda" ino=1942
+scontext=system_u:system_r:systemd_tmpfiles_t
+tcontext=system_u:object_r:auditd_log_t tclass=dir permissive=1
+
+avc:  denied  { getattr } for  pid=57 comm="systemd-tmpfile"
+path="/var/log/audit" dev="vda" ino=1942
+scontext=system_u:system_r:systemd_tmpfiles_t
+tcontext=system_u:object_r:auditd_log_t tclass=dir permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+systemd: allow systemd-tmpfile to relabel auditd log directories
+
+Fixes:
+
+avc:  denied  { relabelfrom } for  pid=57 comm="systemd-tmpfile"
+name="audit" dev="vda" ino=1942
+scontext=system_u:system_r:systemd_tmpfiles_t
+tcontext=system_u:object_r:auditd_log_t tclass=dir permissive=1
+
+avc:  denied  { relabelto } for  pid=57 comm="systemd-tmpfile"
+name="audit" dev="vda" ino=1942
+scontext=system_u:system_r:systemd_tmpfiles_t
+tcontext=system_u:object_r:auditd_log_t tclass=dir permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+locallogin: allow login to create /run/utmp with the right attributes
+
+This allows systems based on Busybox to have 'login' create and use
+/run/utmp correctly.
+
+Fixes:
+
+avc:  denied  { write } for  pid=82 comm="login" name="/" dev="tmpfs"
+ino=652 scontext=system_u:system_r:local_login_t
+tcontext=system_u:object_r:var_run_t tclass=dir permissive=1
+
+avc:  denied  { add_name } for  pid=82 comm="login" name="utmp"
+scontext=system_u:system_r:local_login_t
+tcontext=system_u:object_r:var_run_t tclass=dir permissive=1
+
+avc:  denied  { create } for  pid=82 comm="login" name="utmp"
+scontext=system_u:system_r:local_login_t
+tcontext=system_u:object_r:var_run_t tclass=file permissive=1
+
+avc:  denied  { write open } for  pid=82 comm="login" path="/run/utmp"
+dev="tmpfs" ino=4199 scontext=system_u:system_r:local_login_t
+tcontext=system_u:object_r:var_run_t tclass=file permissive=1
+
+avc:  denied  { read } for  pid=82 comm="login" name="utmp" dev="tmpfs"
+ino=4199 scontext=system_u:system_r:local_login_t
+tcontext=system_u:object_r:var_run_t tclass=file permissive=1
+
+avc:  denied  { lock } for  pid=82 comm="login" path="/run/utmp"
+dev="tmpfs" ino=4199 scontext=system_u:system_r:local_login_t
+tcontext=system_u:object_r:var_run_t tclass=file permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+getty: allow agetty to read /proc/sys/kernel/random/boot_id
+
+Fixes:
+
+avc:  denied  { search } for  pid=78 comm="agetty" name="sys" dev="proc"
+ino=4026531854 scontext=system_u:system_r:getty_t
+tcontext=system_u:object_r:sysctl_t tclass=dir permissive=1
+
+avc:  denied  { search } for  pid=78 comm="agetty" name="kernel"
+dev="proc" ino=638 scontext=system_u:system_r:getty_t
+tcontext=system_u:object_r:sysctl_kernel_t tclass=dir permissive=1
+
+avc:  denied  { read } for  pid=78 comm="agetty" name="boot_id"
+dev="proc" ino=1087 scontext=system_u:system_r:getty_t
+tcontext=system_u:object_r:sysctl_kernel_t tclass=file permissive=1
+
+avc:  denied  { open } for  pid=78 comm="agetty"
+path="/proc/sys/kernel/random/boot_id" dev="proc" ino=1087
+scontext=system_u:system_r:getty_t
+tcontext=system_u:object_r:sysctl_kernel_t tclass=file permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+getty: allow agetty to watch its reload file
+
+Fixes:
+
+avc:  denied  { watch } for  pid=78 comm="agetty"
+path="/run/agetty.reload" dev="tmpfs" ino=3497
+scontext=system_u:system_r:getty_t
+tcontext=system_u:object_r:getty_runtime_t tclass=file permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+
+logging: allow systemd-journal to use audit_control on itself
+
+Fixes:
+
+avc:  denied  { audit_control } for  pid=46 comm="systemd-journal"
+capability=30  scontext=system_u:system_r:syslogd_t
+tcontext=system_u:system_r:syslogd_t tclass=capability permissive=1
+
+avc:  denied  { audit_control } for  pid=46 comm="systemd-journal"
+capability=30  scontext=system_u:system_r:syslogd_t
+tcontext=system_u:system_r:syslogd_t tclass=capability permissive=1
+
+Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
+---
+ policy/modules/kernel/corecommands.fc |  1 +
+ policy/modules/services/dbus.if       | 38 +++++++++++++++++++++++++++
+ policy/modules/services/ntp.te        |  4 +++
+ policy/modules/system/getty.te        |  2 ++
+ policy/modules/system/locallogin.te   |  4 +++
+ policy/modules/system/logging.if      | 19 ++++++++++++++
+ policy/modules/system/logging.te      |  4 +--
+ policy/modules/system/sysnetwork.if   |  2 ++
+ policy/modules/system/systemd.te      | 10 +++++++
+ policy/modules/system/udev.te         |  2 ++
+ 10 files changed, 84 insertions(+), 2 deletions(-)
+
+diff --git a/policy/modules/kernel/corecommands.fc b/policy/modules/kernel/corecommands.fc
+index b473850d4..4c18154ce 100644
+--- a/policy/modules/kernel/corecommands.fc
++++ b/policy/modules/kernel/corecommands.fc
+@@ -155,6 +155,7 @@ ifdef(`distro_gentoo',`
+ /usr/bin/sesh			--	gen_context(system_u:object_r:shell_exec_t,s0)
+ /usr/bin/scponly		--	gen_context(system_u:object_r:shell_exec_t,s0)
+ /usr/bin/scponlyc		--	gen_context(system_u:object_r:shell_exec_t,s0)
++/usr/bin/sh			--	gen_context(system_u:object_r:shell_exec_t,s0)
+ /usr/bin/smrsh			--	gen_context(system_u:object_r:shell_exec_t,s0)
+ /usr/bin/tcsh			--	gen_context(system_u:object_r:shell_exec_t,s0)
+ /usr/bin/yash			--	gen_context(system_u:object_r:shell_exec_t,s0)
+diff --git a/policy/modules/services/dbus.if b/policy/modules/services/dbus.if
+index 146262d88..501d70fda 100644
+--- a/policy/modules/services/dbus.if
++++ b/policy/modules/services/dbus.if
+@@ -143,6 +143,8 @@ interface(`dbus_system_bus_client',`
+ 	stream_connect_pattern($1, system_dbusd_runtime_t, system_dbusd_runtime_t, system_dbusd_t)
+ 
+ 	dbus_read_config($1)
++	dbus_list_system_bus_runtime($1)
++	dbus_read_system_bus_runtime_named_sockets($1)
+ ')
+ 
+ #######################################
+@@ -594,6 +596,24 @@ interface(`dbus_watch_system_bus_runtime_dirs',`
+ 	allow $1 system_dbusd_runtime_t:dir watch;
+ ')
+ 
++########################################
++## <summary>
++##	List system bus runtime directories.
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`dbus_list_system_bus_runtime',`
++	gen_require(`
++		type system_dbusd_runtime_t;
++	')
++
++	allow $1 system_dbusd_runtime_t:dir list_dir_perms;
++')
++
+ ########################################
+ ## <summary>
+ ##	Watch system bus runtime named sockets.
+@@ -612,6 +632,24 @@ interface(`dbus_watch_system_bus_runtime_named_sockets',`
+ 	allow $1 system_dbusd_runtime_t:sock_file watch;
+ ')
+ 
++########################################
++## <summary>
++##	Read system bus runtime named sockets.
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`dbus_read_system_bus_runtime_named_sockets',`
++	gen_require(`
++		type system_dbusd_runtime_t;
++	')
++
++	allow $1 system_dbusd_runtime_t:sock_file read;
++')
++
+ ########################################
+ ## <summary>
+ ##	Unconfined access to DBUS.
+diff --git a/policy/modules/services/ntp.te b/policy/modules/services/ntp.te
+index b178d915b..6d18bb894 100644
+--- a/policy/modules/services/ntp.te
++++ b/policy/modules/services/ntp.te
+@@ -139,10 +139,14 @@ userdom_dontaudit_use_unpriv_user_fds(ntpd_t)
+ userdom_list_user_home_dirs(ntpd_t)
+ 
+ ifdef(`init_systemd',`
++	allow ntpd_t self:process setfscreate;
++
+ 	allow ntpd_t ntpd_unit_t:file read_file_perms;
+ 
+ 	dbus_system_bus_client(ntpd_t)
+ 	dbus_connect_system_bus(ntpd_t)
++	dbus_watch_system_bus_runtime_dirs(ntpd_t)
++	dbus_watch_system_bus_runtime_named_sockets(ntpd_t)
+ 	init_dbus_chat(ntpd_t)
+ 	init_get_system_status(ntpd_t)
+ 	init_list_unit_dirs(ntpd_t)
+diff --git a/policy/modules/system/getty.te b/policy/modules/system/getty.te
+index ce9e4dedb..26459a413 100644
+--- a/policy/modules/system/getty.te
++++ b/policy/modules/system/getty.te
+@@ -47,6 +47,7 @@ allow getty_t getty_log_t:file { append_file_perms create_file_perms setattr_fil
+ logging_log_filetrans(getty_t, getty_log_t, file)
+ 
+ allow getty_t getty_runtime_t:dir watch;
++allow getty_t getty_runtime_t:file watch;
+ manage_files_pattern(getty_t, getty_runtime_t, getty_runtime_t)
+ files_runtime_filetrans(getty_t, getty_runtime_t, file)
+ 
+@@ -55,6 +56,7 @@ allow getty_t getty_tmp_t:dir manage_dir_perms;
+ files_tmp_filetrans(getty_t, getty_tmp_t, { file dir })
+ 
+ kernel_read_system_state(getty_t)
++kernel_read_kernel_sysctls(getty_t)
+ 
+ # these two needed for receiving faxes
+ corecmd_exec_bin(getty_t)
+diff --git a/policy/modules/system/locallogin.te b/policy/modules/system/locallogin.te
+index c4b9bd7bb..59e812e1a 100644
+--- a/policy/modules/system/locallogin.te
++++ b/policy/modules/system/locallogin.te
+@@ -59,6 +59,7 @@ kernel_read_system_state(local_login_t)
+ kernel_read_kernel_sysctls(local_login_t)
+ kernel_search_key(local_login_t)
+ kernel_link_key(local_login_t)
++kernel_getattr_proc(local_login_t)
+ 
+ corecmd_list_bin(local_login_t)
+ # cjp: these are probably not needed:
+@@ -103,6 +104,9 @@ files_read_world_readable_sockets(local_login_t)
+ # for when /var/mail is a symlink
+ files_read_var_symlinks(local_login_t)
+ 
++init_runtime_filetrans_utmp(local_login_t)
++init_manage_utmp(local_login_t)
++
+ fs_search_auto_mountpoints(local_login_t)
+ 
+ storage_dontaudit_getattr_fixed_disk_dev(local_login_t)
+diff --git a/policy/modules/system/logging.if b/policy/modules/system/logging.if
+index 693acf7d9..ff9494b11 100644
+--- a/policy/modules/system/logging.if
++++ b/policy/modules/system/logging.if
+@@ -367,6 +367,25 @@ interface(`logging_manage_audit_log',`
+ 	dontaudit $1 auditd_log_t:file map;
+ ')
+ 
++########################################
++## <summary>
++##	Relabel from and to audit log directory type.
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++## <rolecap/>
++#
++interface(`logging_relabel_audit_log_dirs',`
++	gen_require(`
++		type auditd_log_t;
++	')
++
++	allow $1 auditd_log_t:dir relabel_dir_perms;
++')
++
+ ########################################
+ ## <summary>
+ ##	Execute klogd in the klog domain.
+diff --git a/policy/modules/system/logging.te b/policy/modules/system/logging.te
+index 849494db5..53ee4240a 100644
+--- a/policy/modules/system/logging.te
++++ b/policy/modules/system/logging.te
+@@ -523,8 +523,8 @@ ifdef(`init_systemd',`
+ 	# for systemd-journal
+ 	allow syslogd_t self:netlink_audit_socket connected_socket_perms;
+ 	allow syslogd_t self:capability2 audit_read;
+-	allow syslogd_t self:capability { chown setgid setuid sys_ptrace };
+-	allow syslogd_t self:netlink_audit_socket { getattr getopt read setopt write };
++	allow syslogd_t self:capability { audit_control chown setgid setuid sys_ptrace };
++	allow syslogd_t self:netlink_audit_socket { getattr getopt read setopt write nlmsg_write };
+ 
+ 	# remove /run/log/journal when switching to permanent storage
+ 	allow syslogd_t var_log_t:dir rmdir;
+diff --git a/policy/modules/system/sysnetwork.if b/policy/modules/system/sysnetwork.if
+index 2d58238af..f646ac647 100644
+--- a/policy/modules/system/sysnetwork.if
++++ b/policy/modules/system/sysnetwork.if
+@@ -346,6 +346,8 @@ interface(`sysnet_read_config',`
+ 	')
+ 
+ 	files_search_etc($1)
++	files_search_runtime($1)
++	allow $1 net_conf_t:dir list_dir_perms;
+ 	allow $1 net_conf_t:file read_file_perms;
+ 
+ 	ifdef(`distro_debian',`
+diff --git a/policy/modules/system/systemd.te b/policy/modules/system/systemd.te
+index 54c2a2139..c20bd6f35 100644
+--- a/policy/modules/system/systemd.te
++++ b/policy/modules/system/systemd.te
+@@ -362,6 +362,8 @@ seutil_search_default_contexts(systemd_coredump_t)
+ #
+ 
+ allow systemd_generator_t self:fifo_file rw_fifo_file_perms;
++allow systemd_generator_t self:capability dac_override;
++allow systemd_generator_t self:process setfscreate;
+ 
+ corecmd_getattr_bin_files(systemd_generator_t)
+ 
+@@ -400,6 +402,8 @@ storage_raw_read_fixed_disk(systemd_generator_t)
+ 
+ systemd_log_parse_environment(systemd_generator_t)
+ 
++term_use_unallocated_ttys(systemd_generator_t)
++
+ optional_policy(`
+ 	fstools_exec(systemd_generator_t)
+ ')
+@@ -456,6 +460,7 @@ files_search_runtime(systemd_hw_t)
+ selinux_get_fs_mount(systemd_hw_t)
+ 
+ init_read_state(systemd_hw_t)
++init_search_runtime(systemd_hw_t)
+ 
+ seutil_read_config(systemd_hw_t)
+ seutil_read_file_contexts(systemd_hw_t)
+@@ -777,6 +782,8 @@ dev_write_kmsg(systemd_networkd_t)
+ files_read_etc_files(systemd_networkd_t)
+ files_watch_runtime_dirs(systemd_networkd_t)
+ files_watch_root_dirs(systemd_networkd_t)
++files_list_runtime(systemd_networkd_t)
++fs_getattr_xattr_fs(systemd_networkd_t)
+ 
+ auth_use_nsswitch(systemd_networkd_t)
+ 
+@@ -1084,6 +1091,7 @@ auth_use_nsswitch(systemd_resolved_t)
+ 
+ files_watch_root_dirs(systemd_resolved_t)
+ files_watch_runtime_dirs(systemd_resolved_t)
++files_list_runtime(systemd_resolved_t)
+ 
+ init_dgram_send(systemd_resolved_t)
+ 
+@@ -1228,6 +1236,8 @@ logging_relabel_syslogd_tmp_files(systemd_tmpfiles_t)
+ logging_relabel_syslogd_tmp_dirs(systemd_tmpfiles_t)
+ logging_setattr_syslogd_tmp_files(systemd_tmpfiles_t)
+ logging_setattr_syslogd_tmp_dirs(systemd_tmpfiles_t)
++logging_manage_audit_log(systemd_tmpfiles_t)
++logging_relabel_audit_log_dirs(systemd_tmpfiles_t)
+ 
+ miscfiles_manage_man_pages(systemd_tmpfiles_t)
+ miscfiles_relabel_man_cache(systemd_tmpfiles_t)
+diff --git a/policy/modules/system/udev.te b/policy/modules/system/udev.te
+index f5cf89197..a0b0b1cfc 100644
+--- a/policy/modules/system/udev.te
++++ b/policy/modules/system/udev.te
+@@ -421,3 +421,5 @@ kernel_read_kernel_sysctls(udevadm_t)
+ kernel_read_system_state(udevadm_t)
+ 
+ seutil_read_file_contexts(udevadm_t)
++
++fs_getattr_xattr_fs(udevadm_t)
+-- 
+2.25.4
+
diff --git a/package/refpolicy/0002-systemd-private-type-for-run-systemd-userdb.patch b/package/refpolicy/0002-systemd-private-type-for-run-systemd-userdb.patch
new file mode 100644
index 0000000000..a940f85b10
--- /dev/null
+++ b/package/refpolicy/0002-systemd-private-type-for-run-systemd-userdb.patch
@@ -0,0 +1,130 @@
+From 2964da73ee63e939bf744047346199e31fd9fba6 Mon Sep 17 00:00:00 2001
+From: bauen1 <j2468h@gmail.com>
+Date: Thu, 4 Jun 2020 10:30:19 +0200
+Subject: [PATCH 2/8] systemd: private type for /run/systemd/userdb
+
+Signed-off-by: bauen1 <j2468h@gmail.com>
+---
+ policy/modules/system/init.te    |  3 ++
+ policy/modules/system/systemd.fc |  1 +
+ policy/modules/system/systemd.if | 56 ++++++++++++++++++++++++++++++++
+ policy/modules/system/systemd.te |  3 ++
+ 4 files changed, 63 insertions(+)
+
+diff --git a/policy/modules/system/init.te b/policy/modules/system/init.te
+index 9bc7cf934..c52addb84 100644
+--- a/policy/modules/system/init.te
++++ b/policy/modules/system/init.te
+@@ -469,6 +469,9 @@ ifdef(`init_systemd',`
+ 	systemd_relabelto_journal_dirs(init_t)
+ 	systemd_relabelto_journal_files(init_t)
+ 	systemd_rw_networkd_netlink_route_sockets(init_t)
++	systemd_manage_userdb_runtime_sock_files(init_t)
++	systemd_manage_userdb_runtime_dirs(init_t)
++	systemd_filetrans_userdb_runtime_dirs(init_t)
+ 
+ 	term_create_devpts_dirs(init_t)
+ 	term_create_ptmx(init_t)
+diff --git a/policy/modules/system/systemd.fc b/policy/modules/system/systemd.fc
+index b48612f19..29986a92f 100644
+--- a/policy/modules/system/systemd.fc
++++ b/policy/modules/system/systemd.fc
+@@ -70,6 +70,7 @@
+ /run/systemd/seats(/.*)?	gen_context(system_u:object_r:systemd_sessions_runtime_t,s0)
+ /run/systemd/sessions(/.*)?	gen_context(system_u:object_r:systemd_sessions_runtime_t,s0)
+ /run/systemd/users(/.*)?	gen_context(system_u:object_r:systemd_logind_runtime_t,s0)
++/run/systemd/userdb(/.*)?	gen_context(system_u:object_r:systemd_userdb_runtime_t,s0)
+ /run/systemd/inhibit(/.*)?	gen_context(system_u:object_r:systemd_logind_inhibit_runtime_t,s0)
+ /run/systemd/nspawn(/.*)?	gen_context(system_u:object_r:systemd_nspawn_runtime_t,s0)
+ /run/systemd/machines(/.*)?	gen_context(system_u:object_r:systemd_machined_runtime_t,s0)
+diff --git a/policy/modules/system/systemd.if b/policy/modules/system/systemd.if
+index 262c26d18..895437e78 100644
+--- a/policy/modules/system/systemd.if
++++ b/policy/modules/system/systemd.if
+@@ -426,6 +426,42 @@ interface(`systemd_signull_logind',`
+ 	allow $1 systemd_logind_t:process signull;
+ ')
+ 
++########################################
++## <summary>
++##  Manage systemd userdb runtime directories.
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`systemd_manage_userdb_runtime_dirs', `
++	gen_require(`
++		type systemd_userdb_runtime_t;
++	')
++
++	manage_dirs_pattern($1, systemd_userdb_runtime_t, systemd_userdb_runtime_t)
++')
++
++########################################
++## <summary>
++##  Manage socket files under /run/systemd/userdb .
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`systemd_manage_userdb_runtime_sock_files', `
++	gen_require(`
++		type systemd_userdb_runtime_t;
++	')
++
++	manage_sock_files_pattern($1, systemd_userdb_runtime_t, systemd_userdb_runtime_t)
++')
++
+ ########################################
+ ## <summary>
+ ##	Allow reading /run/systemd/machines
+@@ -528,6 +564,26 @@ interface(`systemd_filetrans_passwd_runtime_dirs',`
+ 	init_runtime_filetrans($1, systemd_passwd_runtime_t, dir, "ask-password")
+ ')
+ 
++########################################
++## <summary>
++##  Transition to systemd_userdb_runtime_t when
++##  creating the userdb directory inside an init runtime
++##  directory.
++## </summary>
++## <param name="domain">
++##  <summary>
++##  Domain allowed access.
++##  </summary>
++## </param>
++#
++interface(`systemd_filetrans_userdb_runtime_dirs', `
++	gen_require(`
++		type systemd_userdb_runtime_t;
++	')
++
++	init_runtime_filetrans($1, systemd_userdb_runtime_t, dir, "userdb")
++')
++
+ ######################################
+ ## <summary>
+ ##  Allow to domain to create systemd-passwd symlink
+diff --git a/policy/modules/system/systemd.te b/policy/modules/system/systemd.te
+index c20bd6f35..4e0a993bc 100644
+--- a/policy/modules/system/systemd.te
++++ b/policy/modules/system/systemd.te
+@@ -242,6 +242,9 @@ init_system_domain(systemd_user_runtime_dir_t, systemd_user_runtime_dir_exec_t)
+ type systemd_user_tmpfs_t;
+ userdom_user_tmpfs_file(systemd_user_tmpfs_t)
+ 
++type systemd_userdb_runtime_t;
++files_runtime_file(systemd_userdb_runtime_t)
++
+ #
+ # Unit file types
+ #
+-- 
+2.25.4
+
diff --git a/package/refpolicy/0003-authlogin-connect-to-userdb.patch b/package/refpolicy/0003-authlogin-connect-to-userdb.patch
new file mode 100644
index 0000000000..035c2faf93
--- /dev/null
+++ b/package/refpolicy/0003-authlogin-connect-to-userdb.patch
@@ -0,0 +1,92 @@
+From 95a16e0e3aeb58c294727f11cc922aa3959148a8 Mon Sep 17 00:00:00 2001
+From: bauen1 <j2468h@gmail.com>
+Date: Thu, 4 Jun 2020 17:45:35 +0200
+Subject: [PATCH 3/8] authlogin: connect to userdb
+
+Signed-off-by: bauen1 <j2468h@gmail.com>
+---
+ policy/modules/system/authlogin.te |  4 ++++
+ policy/modules/system/init.if      | 19 +++++++++++++++++++
+ policy/modules/system/systemd.if   | 21 +++++++++++++++++++++
+ 3 files changed, 44 insertions(+)
+
+diff --git a/policy/modules/system/authlogin.te b/policy/modules/system/authlogin.te
+index 9d2ccc5f5..78c8c223c 100644
+--- a/policy/modules/system/authlogin.te
++++ b/policy/modules/system/authlogin.te
+@@ -426,6 +426,10 @@ files_read_etc_files(nsswitch_domain)
+ 
+ sysnet_dns_name_resolve(nsswitch_domain)
+ 
++ifdef(`init_systemd', `
++	systemd_stream_connect_userdb(nsswitch_domain)
++')
++
+ tunable_policy(`authlogin_nsswitch_use_ldap',`
+ 	miscfiles_read_generic_certs(nsswitch_domain)
+ 	sysnet_use_ldap(nsswitch_domain)
+diff --git a/policy/modules/system/init.if b/policy/modules/system/init.if
+index 66482eb35..3a60ebd42 100644
+--- a/policy/modules/system/init.if
++++ b/policy/modules/system/init.if
+@@ -923,6 +923,25 @@ interface(`init_stream_connect',`
+ 	allow $1 init_t:unix_stream_socket getattr;
+ ')
+ 
++########################################
++## <summary>
++##	Connect to init with a unix socket.
++##  Without any additional permissions.
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`init_unix_stream_socket_connectto',`
++	gen_require(`
++		type init_t;
++	')
++
++	allow $1 init_t:unix_stream_socket connectto;
++')
++
+ ########################################
+ ## <summary>
+ ##	Inherit and use file descriptors from init.
+diff --git a/policy/modules/system/systemd.if b/policy/modules/system/systemd.if
+index 895437e78..c8f33d51d 100644
+--- a/policy/modules/system/systemd.if
++++ b/policy/modules/system/systemd.if
+@@ -462,6 +462,27 @@ interface(`systemd_manage_userdb_runtime_sock_files', `
+ 	manage_sock_files_pattern($1, systemd_userdb_runtime_t, systemd_userdb_runtime_t)
+ ')
+ 
++########################################
++## <summary>
++##  Connect to /run/systemd/userdb/io.systemd.DynamicUser .
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`systemd_stream_connect_userdb', `
++	gen_require(`
++		type systemd_userdb_runtime_t;
++	')
++
++	init_search_runtime($1)
++	allow $1 systemd_userdb_runtime_t:dir list_dir_perms;
++	allow $1 systemd_userdb_runtime_t:sock_file write_sock_file_perms;
++	init_unix_stream_socket_connectto($1)
++')
++
+ ########################################
+ ## <summary>
+ ##	Allow reading /run/systemd/machines
+-- 
+2.25.4
+
diff --git a/package/refpolicy/0004-systemd-logind-utilize-nsswitch.patch b/package/refpolicy/0004-systemd-logind-utilize-nsswitch.patch
new file mode 100644
index 0000000000..6f2a42b50a
--- /dev/null
+++ b/package/refpolicy/0004-systemd-logind-utilize-nsswitch.patch
@@ -0,0 +1,33 @@
+From ba33ef18434eadbaa4598cbc33babca4c2feb1bb Mon Sep 17 00:00:00 2001
+From: bauen1 <j2468h@gmail.com>
+Date: Thu, 4 Jun 2020 18:41:21 +0200
+Subject: [PATCH 4/8] systemd-logind: utilize nsswitch
+
+Signed-off-by: bauen1 <j2468h@gmail.com>
+---
+ policy/modules/system/systemd.te | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/policy/modules/system/systemd.te b/policy/modules/system/systemd.te
+index 4e0a993bc..d427c2323 100644
+--- a/policy/modules/system/systemd.te
++++ b/policy/modules/system/systemd.te
+@@ -555,7 +555,6 @@ dev_setattr_video_dev(systemd_logind_t)
+ 
+ domain_obj_id_change_exemption(systemd_logind_t)
+ 
+-files_read_etc_files(systemd_logind_t)
+ files_search_runtime(systemd_logind_t)
+ 
+ fs_getattr_cgroup(systemd_logind_t)
+@@ -579,6 +578,7 @@ term_setattr_unallocated_ttys(systemd_logind_t)
+ term_use_unallocated_ttys(systemd_logind_t)
+ 
+ auth_manage_faillog(systemd_logind_t)
++auth_use_nsswitch(systemd_logind_t)
+ 
+ init_dbus_send_script(systemd_logind_t)
+ init_get_all_units_status(systemd_logind_t)
+-- 
+2.25.4
+
diff --git a/package/refpolicy/0005-getty-utilize-auth_use_nsswitch.patch b/package/refpolicy/0005-getty-utilize-auth_use_nsswitch.patch
new file mode 100644
index 0000000000..b98fe7f055
--- /dev/null
+++ b/package/refpolicy/0005-getty-utilize-auth_use_nsswitch.patch
@@ -0,0 +1,40 @@
+From f557951567cde1a1b108bedba1b960e222450b5c Mon Sep 17 00:00:00 2001
+From: Maxime Chevallier <maxime.chevallier@bootlin.com>
+Date: Tue, 5 Jan 2021 16:32:06 +0100
+Subject: [PATCH 5/8] getty: utilize auth_use_nsswitch
+
+Fixes :
+
+denied  { read } for  pid=80 comm="agetty" name="userdb" dev="tmpfs" ino=809 scontext=system_u:system_r:getty_t tcontext=system_u:object_r:systemd_userdb_runtime_t tclass=dir permissive=1
+
+denied  { open } for  pid=80 comm="agetty" path="/run/systemd/userdb" dev="tmpfs" ino=809 scontext=system_u:system_r:getty_t tcontext=system_u:object_r:systemd_userdb_runtime_t tclass=dir permissive=1
+
+denied  { getattr } for  pid=80 comm="agetty" path="/run/systemd/userdb" dev="tmpfs" ino=809 scontext=system_u:system_r:getty_t tcontext=system_u:object_r:systemd_userdb_runtime_t tclass=dir permissive=1
+
+denied  { search } for  pid=80 comm="agetty" name="userdb" dev="tmpfs" ino=809 scontext=system_u:system_r:getty_t tcontext=system_u:object_r:systemd_userdb_runtime_t tclass=dir permissive=1
+
+denied  { write } for  pid=80 comm="agetty" name="io.systemd.DynamicUser" dev="tmpfs" ino=811 scontext=system_u:system_r:getty_t tcontext=system_u:object_r:systemd_userdb_runtime_t tclass=sock_file permissive=1
+
+denied  { connectto } for  pid=80 comm="agetty" path="/run/systemd/userdb/io.systemd.DynamicUser" scontext=system_u:system_r:getty_t tcontext=system_u:system_r:init_t tclass=unix_stream_socket permissive=1
+
+Suggested-by: Antoine Tenart <atenart@kernel.org>
+Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
+---
+ policy/modules/system/getty.te | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/policy/modules/system/getty.te b/policy/modules/system/getty.te
+index 26459a413..a96c726f8 100644
+--- a/policy/modules/system/getty.te
++++ b/policy/modules/system/getty.te
+@@ -85,6 +85,7 @@ term_setattr_unallocated_ttys(getty_t)
+ term_setattr_console(getty_t)
+ 
+ auth_rw_login_records(getty_t)
++auth_use_nsswitch(getty_t)
+ 
+ init_rw_utmp(getty_t)
+ 
+-- 
+2.25.4
+
diff --git a/package/refpolicy/0006-systemd-tmpfiles-utilize-auth_use_nsswitch.patch b/package/refpolicy/0006-systemd-tmpfiles-utilize-auth_use_nsswitch.patch
new file mode 100644
index 0000000000..fd0c6f6889
--- /dev/null
+++ b/package/refpolicy/0006-systemd-tmpfiles-utilize-auth_use_nsswitch.patch
@@ -0,0 +1,32 @@
+From a579743ba62b28c4b41b84b975b4fd3c17ca8865 Mon Sep 17 00:00:00 2001
+From: Maxime Chevallier <maxime.chevallier@bootlin.com>
+Date: Tue, 5 Jan 2021 16:37:37 +0100
+Subject: [PATCH 6/8] systemd-tmpfiles: utilize auth_use_nsswitch
+
+Fixes :
+
+denied  { write } for  pid=49 comm="systemd-tmpfile" name="io.systemd.DynamicUser" dev="tmpfs" ino=811 scontext=system_u:system_r:systemd_tmpfiles_t tcontext=system_u:object_r:systemd_userdb_runtime_t tclass=sock_file permissive=1
+
+denied  { connectto } for  pid=49 comm="systemd-tmpfile" path="/run/systemd/userdb/io.systemd.DynamicUser" scontext=system_u:system_r:systemd_tmpfiles_t tcontext=system_u:system_r:init_t tclass=unix_stream_socket permissive=1
+
+Suggested-by: Antoine Tenart <atenart@kernel.org>
+Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
+---
+ policy/modules/system/systemd.te | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/policy/modules/system/systemd.te b/policy/modules/system/systemd.te
+index d427c2323..b6369a048 100644
+--- a/policy/modules/system/systemd.te
++++ b/policy/modules/system/systemd.te
+@@ -1223,6 +1223,7 @@ auth_manage_var_auth(systemd_tmpfiles_t)
+ auth_relabel_lastlog(systemd_tmpfiles_t)
+ auth_relabel_login_records(systemd_tmpfiles_t)
+ auth_setattr_login_records(systemd_tmpfiles_t)
++auth_use_nsswitch(systemd_tmpfiles_t)
+ 
+ init_manage_utmp(systemd_tmpfiles_t)
+ init_manage_var_lib_files(systemd_tmpfiles_t)
+-- 
+2.25.4
+
diff --git a/package/refpolicy/0007-first-udevadm-patch.patch b/package/refpolicy/0007-first-udevadm-patch.patch
new file mode 100644
index 0000000000..4c60642bfd
--- /dev/null
+++ b/package/refpolicy/0007-first-udevadm-patch.patch
@@ -0,0 +1,130 @@
+From deff1027637e45fa3c6df3b01356e8aa397cae3a Mon Sep 17 00:00:00 2001
+From: Russell Coker <russell@coker.com.au>
+Date: Fri, 11 Dec 2020 13:27:49 +1100
+Subject: [PATCH 7/8] first udevadm patch
+
+As Chris noted in a previous message the udevadm_t domain could be used from
+other places.  This patch allows for that possibility in the near future but
+for the moment just makes a system bootable in enforcing mode right now.
+
+Also I didn't remove the context entries for udevadm even though on systems
+with a recent systemd they won't exist.  At this time leaving them there
+may provide the best compatability options.
+
+Finally I added a udev_runtime_t watch because the need for that appeared
+when I was working on this.
+
+Signed off by Russell Coker
+
+Maxime: Pending a new version and merging in the upstream refpolicy :
+https://lore.kernel.org/selinux-refpolicy/2b5b0f1e-2576-23f4-4ab4-26f8fcfb2c30 at ieee.org/T/#t
+Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
+---
+ policy/modules/system/udev.fc |  5 ++---
+ policy/modules/system/udev.if | 22 ++--------------------
+ policy/modules/system/udev.te |  6 +++---
+ 3 files changed, 7 insertions(+), 26 deletions(-)
+
+diff --git a/policy/modules/system/udev.fc b/policy/modules/system/udev.fc
+index 0ae7571cd..3a830fb30 100644
+--- a/policy/modules/system/udev.fc
++++ b/policy/modules/system/udev.fc
+@@ -10,7 +10,7 @@
+ /etc/udev/scripts/.+ --	gen_context(system_u:object_r:udev_helper_exec_t,s0)
+ 
+ /usr/bin/udev		--	gen_context(system_u:object_r:udev_exec_t,s0)
+-/usr/bin/udevadm	--	gen_context(system_u:object_r:udevadm_exec_t,s0)
++/usr/bin/udevadm	--	gen_context(system_u:object_r:udev_exec_t,s0)
+ /usr/bin/udevd		--	gen_context(system_u:object_r:udev_exec_t,s0)
+ /usr/bin/udevinfo	--	gen_context(system_u:object_r:udev_exec_t,s0)
+ /usr/bin/udevsend	--	gen_context(system_u:object_r:udev_exec_t,s0)
+@@ -22,7 +22,7 @@ ifdef(`distro_debian',`
+ ')
+ 
+ /usr/sbin/udev		--	gen_context(system_u:object_r:udev_exec_t,s0)
+-/usr/sbin/udevadm	--	gen_context(system_u:object_r:udevadm_exec_t,s0)
++/usr/sbin/udevadm	--	gen_context(system_u:object_r:udev_exec_t,s0)
+ /usr/sbin/udevd		--	gen_context(system_u:object_r:udev_exec_t,s0)
+ /usr/sbin/udevsend	--	gen_context(system_u:object_r:udev_exec_t,s0)
+ /usr/sbin/udevstart	--	gen_context(system_u:object_r:udev_exec_t,s0)
+@@ -32,7 +32,6 @@ ifdef(`distro_redhat',`
+ /usr/sbin/start_udev --	gen_context(system_u:object_r:udev_exec_t,s0)
+ ')
+ 
+-/usr/lib/systemd/systemd-udevd -- gen_context(system_u:object_r:udev_exec_t,s0)
+ /usr/lib/udev/udev-acl --	gen_context(system_u:object_r:udev_exec_t,s0)
+ 
+ /usr/share/virtualbox/VBoxCreateUSBNode\.sh	--	gen_context(system_u:object_r:udev_helper_exec_t,s0)
+diff --git a/policy/modules/system/udev.if b/policy/modules/system/udev.if
+index bdfd373da..bc3b2a0fc 100644
+--- a/policy/modules/system/udev.if
++++ b/policy/modules/system/udev.if
+@@ -548,10 +548,10 @@ interface(`udev_manage_runtime_files',`
+ #
+ interface(`udevadm_domtrans',`
+ 	gen_require(`
+-		type udevadm_t, udevadm_exec_t;
++		type udevadm_t, udev_exec_t;
+ 	')
+ 
+-	domtrans_pattern($1, udevadm_exec_t, udevadm_t)
++	domtrans_pattern($1, udev_exec_t, udevadm_t)
+ ')
+ 
+ ########################################
+@@ -579,21 +579,3 @@ interface(`udevadm_run',`
+ 	udevadm_domtrans($1)
+ 	roleattribute $2 udevadm_roles;
+ ')
+-
+-########################################
+-## <summary>
+-##	Execute udevadm in the caller domain.
+-## </summary>
+-## <param name="domain">
+-##	<summary>
+-##	Domain allowed access.
+-##	</summary>
+-## </param>
+-#
+-interface(`udevadm_exec',`
+-	gen_require(`
+-		type udevadm_exec_t;
+-	')
+-
+-	can_exec($1, udevadm_exec_t)
+-')
+diff --git a/policy/modules/system/udev.te b/policy/modules/system/udev.te
+index a0b0b1cfc..7b1e34978 100644
+--- a/policy/modules/system/udev.te
++++ b/policy/modules/system/udev.te
+@@ -8,6 +8,7 @@ attribute_role udevadm_roles;
+ 
+ type udev_t;
+ type udev_exec_t;
++typealias udev_exec_t alias udevadm_exec_t;
+ type udev_helper_exec_t;
+ kernel_domtrans_to(udev_t, udev_exec_t)
+ domain_obj_id_change_exemption(udev_t)
+@@ -17,9 +18,7 @@ init_daemon_domain(udev_t, udev_exec_t)
+ init_named_socket_activation(udev_t, udev_runtime_t)
+ 
+ type udevadm_t;
+-type udevadm_exec_t;
+-init_system_domain(udevadm_t, udevadm_exec_t)
+-application_domain(udevadm_t, udevadm_exec_t)
++application_domain(udevadm_t, udev_exec_t)
+ role udevadm_roles types udevadm_t;
+ 
+ type udev_etc_t alias etc_udev_t;
+@@ -86,6 +85,7 @@ manage_files_pattern(udev_t, udev_runtime_t, udev_runtime_t)
+ manage_lnk_files_pattern(udev_t, udev_runtime_t, udev_runtime_t)
+ manage_sock_files_pattern(udev_t, udev_runtime_t, udev_runtime_t)
+ files_runtime_filetrans(udev_t, udev_runtime_t, dir, "udev")
++allow udev_t udev_runtime_t:dir watch;
+ 
+ kernel_load_module(udev_t)
+ kernel_read_system_state(udev_t)
+-- 
+2.25.4
+
diff --git a/package/refpolicy/0008-pending-upstreaming-Fixes-for-Buildroot-to-boot-in-e.patch b/package/refpolicy/0008-pending-upstreaming-Fixes-for-Buildroot-to-boot-in-e.patch
new file mode 100644
index 0000000000..e4047db918
--- /dev/null
+++ b/package/refpolicy/0008-pending-upstreaming-Fixes-for-Buildroot-to-boot-in-e.patch
@@ -0,0 +1,190 @@
+From 9628f919142887b29d59023558a1005ecdbc8a8c Mon Sep 17 00:00:00 2001
+From: Maxime Chevallier <maxime.chevallier@bootlin.com>
+Date: Tue, 5 Jan 2021 11:56:12 +0100
+Subject: [PATCH 8/8] [pending upstreaming] Fixes for Buildroot to boot in
+ enforcing mode
+
+Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
+---
+ policy/modules/kernel/files.if   | 18 ++++++++++++++
+ policy/modules/services/dbus.if  | 18 ++++++++++++++
+ policy/modules/system/logging.te |  1 +
+ policy/modules/system/systemd.te | 41 ++++++++++++++++++++++++++++++++
+ 4 files changed, 78 insertions(+)
+
+diff --git a/policy/modules/kernel/files.if b/policy/modules/kernel/files.if
+index 2b453301e..e05708457 100644
+--- a/policy/modules/kernel/files.if
++++ b/policy/modules/kernel/files.if
+@@ -2918,6 +2918,24 @@ interface(`files_manage_etc_dirs',`
+ 	manage_dirs_pattern($1, etc_t, etc_t)
+ ')
+ 
++########################################
++## <summary>
++##	Relabel directories from etc_t.
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`files_relabelfrom_etc_dirs',`
++	gen_require(`
++		type etc_t;
++	')
++
++	allow $1 etc_t:dir relabelfrom;
++')
++
+ ########################################
+ ## <summary>
+ ##	Relabel directories to etc_t.
+diff --git a/policy/modules/services/dbus.if b/policy/modules/services/dbus.if
+index 501d70fda..d315c1f2a 100644
+--- a/policy/modules/services/dbus.if
++++ b/policy/modules/services/dbus.if
+@@ -356,6 +356,24 @@ interface(`dbus_relabel_lib_dirs',`
+ 	allow $1 system_dbusd_var_lib_t:dir { relabelfrom relabelto };
+ ')
+ 
++########################################
++## <summary>
++##	Manage system dbus lib directory.
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`dbus_manage_lib_dirs',`
++	gen_require(`
++		type system_dbusd_var_lib_t;
++	')
++
++	manage_dirs_pattern($1, system_dbusd_var_lib_t, system_dbusd_var_lib_t)
++')
++
+ ########################################
+ ## <summary>
+ ##	Create, read, write, and delete
+diff --git a/policy/modules/system/logging.te b/policy/modules/system/logging.te
+index 53ee4240a..b7c1b5c17 100644
+--- a/policy/modules/system/logging.te
++++ b/policy/modules/system/logging.te
+@@ -403,6 +403,7 @@ allow syslogd_t syslog_conf_t:dir list_dir_perms;
+ allow syslogd_t devlog_t:sock_file manage_sock_file_perms;
+ files_runtime_filetrans(syslogd_t, devlog_t, sock_file)
+ init_runtime_filetrans(syslogd_t, devlog_t, sock_file, "dev-log")
++allow syslogd_t init_runtime_t:file { open read };
+ 
+ # create/append log files.
+ manage_files_pattern(syslogd_t, var_log_t, var_log_t)
+diff --git a/policy/modules/system/systemd.te b/policy/modules/system/systemd.te
+index b6369a048..d633cec8f 100644
+--- a/policy/modules/system/systemd.te
++++ b/policy/modules/system/systemd.te
+@@ -398,6 +398,7 @@ init_read_generic_units_symlinks(systemd_generator_t)
+ init_read_script_files(systemd_generator_t)
+ 
+ kernel_use_fds(systemd_generator_t)
++kernel_getattr_proc(systemd_generator_t)
+ kernel_read_system_state(systemd_generator_t)
+ kernel_read_kernel_sysctls(systemd_generator_t)
+ 
+@@ -454,6 +455,7 @@ optional_policy(`
+ #
+ 
+ kernel_read_kernel_sysctls(systemd_hw_t)
++kernel_getattr_proc(systemd_hw_t)
+ 
+ allow systemd_hw_t systemd_hwdb_t:file { manage_file_perms relabelfrom relabelto };
+ files_etc_filetrans(systemd_hw_t, systemd_hwdb_t, file)
+@@ -763,6 +765,7 @@ manage_dirs_pattern(systemd_networkd_t, systemd_networkd_runtime_t, systemd_netw
+ manage_files_pattern(systemd_networkd_t, systemd_networkd_runtime_t, systemd_networkd_runtime_t)
+ manage_lnk_files_pattern(systemd_networkd_t, systemd_networkd_runtime_t, systemd_networkd_runtime_t)
+ 
++kernel_getattr_proc(systemd_networkd_t)
+ kernel_read_system_state(systemd_networkd_t)
+ kernel_read_kernel_sysctls(systemd_networkd_t)
+ kernel_read_network_state(systemd_networkd_t)
+@@ -1175,10 +1178,41 @@ allow systemd_tmpfiles_t systemd_journal_t:file { relabelfrom relabelto };
+ allow systemd_tmpfiles_t systemd_tmpfiles_conf_t:dir list_dir_perms;
+ allow systemd_tmpfiles_t systemd_tmpfiles_conf_type:file read_file_perms;
+ 
++# Buildroot specific rules, pending upstream solution either in the refpolicy
++# or in Buildroot through the use of booleans
++#
++allow systemd_tmpfiles_t auditd_log_t:dir { create getattr open read relabelfrom relabelto };
++
++#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
++allow systemd_tmpfiles_t etc_t:dir relabelfrom;
++
++#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
++allow systemd_tmpfiles_t etc_t:file { relabelfrom relabelto };
++allow systemd_tmpfiles_t init_t:unix_stream_socket connectto;
++
++#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
++allow systemd_tmpfiles_t system_dbusd_var_lib_t:dir read;
++allow systemd_tmpfiles_t init_var_lib_t:dir create;
++allow systemd_tmpfiles_t sysfs_t:file { open write };
++allow systemd_tmpfiles_t init_runtime_t:file { open read getattr };
++
++#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
++allow systemd_tmpfiles_t usr_t:dir read;
++
++#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
++allow systemd_tmpfiles_t usr_t:file { open read };
++
++#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
++allow systemd_tmpfiles_t var_spool_t:dir create;
++
++
+ kernel_getattr_proc(systemd_tmpfiles_t)
+ kernel_read_kernel_sysctls(systemd_tmpfiles_t)
+ kernel_read_network_state(systemd_tmpfiles_t)
+ 
++dbus_read_lib_files(systemd_tmpfiles_t)
++dbus_manage_lib_dirs(systemd_tmpfiles_t)
++
+ dev_getattr_fs(systemd_tmpfiles_t)
+ dev_manage_all_dev_nodes(systemd_tmpfiles_t)
+ dev_read_urand(systemd_tmpfiles_t)
+@@ -1190,11 +1224,15 @@ files_manage_all_runtime_dirs(systemd_tmpfiles_t)
+ files_delete_usr_files(systemd_tmpfiles_t)
+ files_list_home(systemd_tmpfiles_t)
+ files_list_locks(systemd_tmpfiles_t)
++files_manage_etc_dirs(systemd_tmpfiles_t)
++files_relabel_etc_files(systemd_tmpfiles_t)
++files_manage_generic_spool_dirs(systemd_tmpfiles_t)
+ files_manage_generic_tmp_dirs(systemd_tmpfiles_t)
+ files_manage_var_dirs(systemd_tmpfiles_t)
+ files_manage_var_lib_dirs(systemd_tmpfiles_t)
+ files_purge_tmp(systemd_tmpfiles_t)
+ files_read_etc_files(systemd_tmpfiles_t)
++files_read_usr_files(systemd_tmpfiles_t)
+ files_read_etc_runtime_files(systemd_tmpfiles_t)
+ files_relabel_all_lock_dirs(systemd_tmpfiles_t)
+ files_relabel_all_runtime_dirs(systemd_tmpfiles_t)
+@@ -1204,6 +1242,7 @@ files_relabel_var_lib_dirs(systemd_tmpfiles_t)
+ files_relabelfrom_home(systemd_tmpfiles_t)
+ files_relabelto_home(systemd_tmpfiles_t)
+ files_relabelto_etc_dirs(systemd_tmpfiles_t)
++files_relabelfrom_etc_dirs(systemd_tmpfiles_t)
+ # for /etc/mtab
+ files_manage_etc_symlinks(systemd_tmpfiles_t)
+ 
+@@ -1233,6 +1272,8 @@ init_read_state(systemd_tmpfiles_t)
+ init_relabel_utmp(systemd_tmpfiles_t)
+ init_relabel_var_lib_dirs(systemd_tmpfiles_t)
+ 
++logging_read_audit_log(systemd_tmpfiles_t)
++logging_manage_audit_log(systemd_tmpfiles_t)
+ logging_manage_generic_logs(systemd_tmpfiles_t)
+ logging_manage_generic_log_dirs(systemd_tmpfiles_t)
+ logging_relabel_generic_log_dirs(systemd_tmpfiles_t)
+-- 
+2.25.4
+
-- 
2.25.4
