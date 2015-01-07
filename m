From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  7 Jan 2015 11:10:45 -0600
Subject: [Buildroot] [PATCH v2 10/28] repolicy: base policy modifications
	for embedded target
In-Reply-To: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420650663-49350-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420650663-49350-11-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
[Matt W:
  - Cleaned up headers

 package/refpolicy/0002-baseDirectoryChanges.patch  | 32 ++++++++
 package/refpolicy/0003-filesChanges.patch          | 62 ++++++++++++++
 package/refpolicy/0004-initChanges.patch           | 20 +++++
 package/refpolicy/0005-selinuxutilChanges.patch    | 96 ++++++++++++++++++++++
 package/refpolicy/0006-sshChanges.patch            | 22 +++++
 package/refpolicy/0007-loggingChanges.patch        | 80 ++++++++++++++++++
 package/refpolicy/0008-mountChanges.patch          | 11 +++
 package/refpolicy/0009-sysadmChanges.patch         | 24 ++++++
 package/refpolicy/0010-authloginChanges.patch      | 14 ++++
 package/refpolicy/0011-localloginChanges.patch     | 13 +++
 package/refpolicy/0012-udevChanges.patch           | 14 ++++
 package/refpolicy/0013-netutilsChanges.patch       | 13 +++
 package/refpolicy/0014-devicesChanges.patch        | 48 +++++++++++
 .../{0002-awk-fix.patch => 0015-awk-fix.patch}     |  0
 .../refpolicy/0016-enablePolyinstantiation.patch   | 11 +++
 15 files changed, 460 insertions(+)
 create mode 100644 package/refpolicy/0002-baseDirectoryChanges.patch
 create mode 100644 package/refpolicy/0003-filesChanges.patch
 create mode 100644 package/refpolicy/0004-initChanges.patch
 create mode 100644 package/refpolicy/0005-selinuxutilChanges.patch
 create mode 100644 package/refpolicy/0006-sshChanges.patch
 create mode 100644 package/refpolicy/0007-loggingChanges.patch
 create mode 100644 package/refpolicy/0008-mountChanges.patch
 create mode 100644 package/refpolicy/0009-sysadmChanges.patch
 create mode 100644 package/refpolicy/0010-authloginChanges.patch
 create mode 100644 package/refpolicy/0011-localloginChanges.patch
 create mode 100644 package/refpolicy/0012-udevChanges.patch
 create mode 100644 package/refpolicy/0013-netutilsChanges.patch
 create mode 100644 package/refpolicy/0014-devicesChanges.patch
 rename package/refpolicy/{0002-awk-fix.patch => 0015-awk-fix.patch} (100%)
 create mode 100644 package/refpolicy/0016-enablePolyinstantiation.patch

diff --git a/package/refpolicy/0002-baseDirectoryChanges.patch b/package/refpolicy/0002-baseDirectoryChanges.patch
new file mode 100644
index 0000000..36957c0
--- /dev/null
+++ b/package/refpolicy/0002-baseDirectoryChanges.patch
@@ -0,0 +1,32 @@
+################################################################################
+# Copyright 2012-2015, Rockwell Collins.  All rights reserved.
+################################################################################
+#
+# Making changes for base folders in our build.  
+#
+# /data - usr_t
+# /apps - usr_t
+# /lib64 - lib_t
+#
+diff -urN output/build/refpolicy-2.20120725/policy/modules/kernel/files.fc output/build/refpolicy-2.20120725-changes/policy/modules/kernel/files.fc
+diff -urN output/build/refpolicy-2.20120725/policy/modules/system/libraries.fc output/build/refpolicy-2.20120725-changes/policy/modules/system/libraries.fc
+--- a/policy/modules/system/libraries.fc	2012-05-10 09:26:34.000000000 -0500
++++ b/policy/modules/system/libraries.fc	2012-09-06 12:52:25.000000000 -0500
+@@ -36,6 +36,7 @@
+ # /lib(64)?
+ #
+ /lib					-d	gen_context(system_u:object_r:lib_t,s0)
++/lib64					-l	gen_context(system_u:object_r:lib_t,s0)
+ /lib/.*						gen_context(system_u:object_r:lib_t,s0)
+ /lib/ld-[^/]*\.so(\.[^/]*)*		--	gen_context(system_u:object_r:ld_so_t,s0)
+ 
+--- a/policy/modules/system/sysnetwork.fc	2012-09-11 08:28:21.954620259 -0500
++++ b/policy/modules/system/sysnetwork.fc	2012-09-11 08:28:32.133742548 -0500
+@@ -24,6 +24,7 @@
+ /etc/hosts\.deny.*	--	gen_context(system_u:object_r:net_conf_t,s0)
+ /etc/denyhosts.*	--	gen_context(system_u:object_r:net_conf_t,s0)
+ /etc/resolv\.conf.*	--	gen_context(system_u:object_r:net_conf_t,s0)
++/tmp/resolv\.conf.*	--	gen_context(system_u:object_r:net_conf_t,s0)
+ /etc/yp\.conf.*		--	gen_context(system_u:object_r:net_conf_t,s0)
+ 
+ /etc/dhcp3(/.*)?		gen_context(system_u:object_r:dhcp_etc_t,s0)
diff --git a/package/refpolicy/0003-filesChanges.patch b/package/refpolicy/0003-filesChanges.patch
new file mode 100644
index 0000000..0747d07
--- /dev/null
+++ b/package/refpolicy/0003-filesChanges.patch
@@ -0,0 +1,62 @@
+################################################################################
+# Copyright 2012-2015, Rockwell Collins.  All rights reserved.
+################################################################################
+--- a/policy/modules/kernel/files.fc	2012-06-26 08:46:32.000000000 -0500
++++ b/policy/modules/kernel/files.fc	2012-10-17 15:28:41.000000000 -0500
+@@ -36,6 +36,11 @@
+ /boot/System\.map(-.*)?	--	gen_context(system_u:object_r:system_map_t,s0)
+ 
+ #
++# /data
++#
++/data			-d	gen_context(system_u:object_r:usr_t,s0)
++
++#
+ # /emul
+ #
+ /emul			-d	gen_context(system_u:object_r:usr_t,s0)
+@@ -48,6 +53,7 @@
+ /etc/.*				gen_context(system_u:object_r:etc_t,s0)
+ /etc/\.fstab\.hal\..+	--	gen_context(system_u:object_r:etc_runtime_t,s0)
+ /etc/blkid(/.*)?		gen_context(system_u:object_r:etc_runtime_t,s0)
++/etc/blkid.tab(.*)?	--	gen_context(system_u:object_r:etc_runtime_t,s0)
+ /etc/cmtab		--	gen_context(system_u:object_r:etc_runtime_t,s0)
+ /etc/fstab\.REVOKE	--	gen_context(system_u:object_r:etc_runtime_t,s0)
+ /etc/ioctl\.save	--	gen_context(system_u:object_r:etc_runtime_t,s0)
+@@ -164,7 +170,7 @@
+ #
+ # /run
+ #
+-/run			-d	gen_context(system_u:object_r:var_run_t,s0-mls_systemhigh)
++/run			-l	gen_context(system_u:object_r:var_run_t,s0-mls_systemhigh)
+ /run/.*				gen_context(system_u:object_r:var_run_t,s0)
+ /run/.*\.*pid			<<none>>
+ /run/lock(/.*)?			gen_context(system_u:object_r:var_lock_t,s0)
+--- a/policy/modules/kernel/files.if	2012-07-24 07:48:06.000000000 -0500
++++ b/policy/modules/kernel/files.if	2012-10-17 15:14:13.000000000 -0500
+@@ -6264,6 +6264,25 @@
+ 
+ ########################################
+ ## <summary>
++##	Read the contents of generic spool
++##	symlinks (/var/spool).
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`files_read_spool_lnk',`
++	gen_require(`
++		type var_t, var_spool_t;
++	')
++
++	read_lnk_files_pattern($1, var_t, var_spool_t)
++')
++
++########################################
++## <summary>
+ ##	Do not audit attempts to search generic
+ ##	spool directories.
+ ## </summary>
diff --git a/package/refpolicy/0004-initChanges.patch b/package/refpolicy/0004-initChanges.patch
new file mode 100644
index 0000000..33c06f8
--- /dev/null
+++ b/package/refpolicy/0004-initChanges.patch
@@ -0,0 +1,20 @@
+--- a/policy/modules/system/init.te	2012-07-25 13:33:04.000000000 -0500
++++ b/policy/modules/system/init.te	2012-09-07 09:41:21.000000000 -0500
+@@ -96,6 +96,7 @@
+ 
+ # Use capabilities. old rule:
+ allow init_t self:capability ~sys_module;
++allow init_t self:capability2 syslog;
+ # is ~sys_module really needed? observed:
+ # sys_boot
+ # sys_tty_config
+--- a/policy/modules/system/init.fc	2012-05-10 09:18:41.000000000 -0500
++++ b/policy/modules/system/init.fc	2012-09-07 15:15:31.000000000 -0500
+@@ -58,6 +58,7 @@
+ # /var
+ #
+ /var/run/utmp		--	gen_context(system_u:object_r:initrc_var_run_t,s0)
++/tmp/utmp		--	gen_context(system_u:object_r:initrc_var_run_t,s0)
+ /var/run/runlevel\.dir		gen_context(system_u:object_r:initrc_var_run_t,s0)
+ /var/run/random-seed	--	gen_context(system_u:object_r:initrc_var_run_t,s0)
+ /var/run/setmixer_flag	--	gen_context(system_u:object_r:initrc_var_run_t,s0)
diff --git a/package/refpolicy/0005-selinuxutilChanges.patch b/package/refpolicy/0005-selinuxutilChanges.patch
new file mode 100644
index 0000000..fc12a50
--- /dev/null
+++ b/package/refpolicy/0005-selinuxutilChanges.patch
@@ -0,0 +1,96 @@
+################################################################################
+# Copyright 2012-2015, Rockwell Collins.  All rights reserved.
+################################################################################
+--- a/policy/modules/system/selinuxutil.fc	2012-05-10 09:27:24.000000000 -0500
++++ b/policy/modules/system/selinuxutil.fc	2012-10-17 13:42:40.961227129 -0500
+@@ -51,3 +51,4 @@
+ # /var/run
+ #
+ /var/run/restorecond\.pid	--	gen_context(system_u:object_r:restorecond_var_run_t,s0)
++/tmp/restorecond\.pid	--	gen_context(system_u:object_r:restorecond_var_run_t,s0)
+--- a/policy/modules/system/selinuxutil.te	2012-07-25 13:33:04.000000000 -0500
++++ b/policy/modules/system/selinuxutil.te	2012-10-17 15:14:28.000000000 -0500
+@@ -144,7 +144,7 @@
+ # directory search permissions for path to source and binary policy files
+ files_search_etc(checkpolicy_t)
+ 
+-fs_getattr_xattr_fs(checkpolicy_t)
++fs_getattr_all_fs(checkpolicy_t)
+ 
+ term_use_console(checkpolicy_t)
+ 
+@@ -176,7 +176,7 @@
+ files_read_etc_files(load_policy_t)
+ files_read_etc_runtime_files(load_policy_t)
+ 
+-fs_getattr_xattr_fs(load_policy_t)
++fs_getattr_all_fs(load_policy_t)
+ 
+ mls_file_read_all_levels(load_policy_t)
+ 
+@@ -244,6 +244,7 @@
+ corecmd_read_bin_symlinks(newrole_t)
+ 
+ dev_read_urand(newrole_t)
++dev_search_sysfs(newrole_t)
+ 
+ domain_use_interactive_fds(newrole_t)
+ # for when the user types "exec newrole" at the command line:
+@@ -253,7 +254,7 @@
+ files_read_var_files(newrole_t)
+ files_read_var_symlinks(newrole_t)
+ 
+-fs_getattr_xattr_fs(newrole_t)
++fs_getattr_all_fs(newrole_t)
+ fs_search_auto_mountpoints(newrole_t)
+ 
+ mls_file_read_all_levels(newrole_t)
+@@ -323,6 +324,7 @@
+ 
+ allow restorecond_t restorecond_var_run_t:file manage_file_perms;
+ files_pid_filetrans(restorecond_t, restorecond_var_run_t, file)
++files_tmp_filetrans(restorecond_t, restorecond_var_run_t, file)
+ 
+ kernel_use_fds(restorecond_t)
+ kernel_rw_pipes(restorecond_t)
+@@ -330,7 +332,7 @@
+ 
+ fs_relabelfrom_noxattr_fs(restorecond_t)
+ fs_dontaudit_list_nfs(restorecond_t)
+-fs_getattr_xattr_fs(restorecond_t)
++fs_getattr_all_fs(restorecond_t)
+ fs_list_inotifyfs(restorecond_t)
+ 
+ selinux_validate_context(restorecond_t)
+@@ -388,7 +390,7 @@
+ files_read_etc_files(run_init_t)
+ files_dontaudit_search_all_dirs(run_init_t)
+ 
+-fs_getattr_xattr_fs(run_init_t)
++fs_getattr_all_fs(run_init_t)
+ 
+ mls_rangetrans_source(run_init_t)
+ 
+@@ -543,6 +545,13 @@
+ kernel_dontaudit_list_all_sysctls(setfiles_t)
+ 
+ dev_relabel_all_dev_nodes(setfiles_t)
++dev_search_sysfs(setfiles_t)
++
++# Need to be able to write to /dev/console before it is relabeled
++dev_rw_generic_chr_files(setfiles_t)
++
++# Need for the /var/spool symlink configuration
++files_read_spool_lnk(setfiles_t);
+ 
+ domain_use_interactive_fds(setfiles_t)
+ domain_dontaudit_search_all_domains_state(setfiles_t)
+@@ -553,7 +562,7 @@
+ files_relabel_all_files(setfiles_t)
+ files_read_usr_symlinks(setfiles_t)
+ 
+-fs_getattr_xattr_fs(setfiles_t)
++fs_getattr_all_fs(setfiles_t)
+ fs_list_all(setfiles_t)
+ fs_search_auto_mountpoints(setfiles_t)
+ fs_relabelfrom_noxattr_fs(setfiles_t)
diff --git a/package/refpolicy/0006-sshChanges.patch b/package/refpolicy/0006-sshChanges.patch
new file mode 100644
index 0000000..a942812
--- /dev/null
+++ b/package/refpolicy/0006-sshChanges.patch
@@ -0,0 +1,22 @@
+--- a/policy/modules/services/ssh.te	2012-03-30 07:48:20.000000000 -0500
++++ b/policy/modules/services/ssh.te	2012-09-07 15:37:30.000000000 -0500
+@@ -10,7 +10,7 @@
+ ## allow host key based authentication
+ ## </p>
+ ## </desc>
+-gen_tunable(allow_ssh_keysign, false)
++gen_tunable(allow_ssh_keysign, true)
+ 
+ ## <desc>
+ ## <p>
+@@ -233,6 +233,10 @@
+ manage_sock_files_pattern(sshd_t, sshd_tmp_t, sshd_tmp_t)
+ files_tmp_filetrans(sshd_t, sshd_tmp_t, { dir file sock_file })
+ 
++logging_send_syslog_msg(sshd_t)
++
++init_manage_utmp(sshd_t)
++
+ kernel_search_key(sshd_t)
+ kernel_link_key(sshd_t)
+ 
diff --git a/package/refpolicy/0007-loggingChanges.patch b/package/refpolicy/0007-loggingChanges.patch
new file mode 100644
index 0000000..24f203f
--- /dev/null
+++ b/package/refpolicy/0007-loggingChanges.patch
@@ -0,0 +1,80 @@
+################################################################################
+# Copyright 2012-2015, Rockwell Collins.  All rights reserved.
+################################################################################
+--- a/policy/modules/system/logging.fc	2012-05-04 08:14:47.000000000 -0500
++++ b/policy/modules/system/logging.fc	2012-10-16 08:44:24.000000000 -0500
+@@ -56,21 +56,21 @@
+ /var/named/chroot/dev/log -s	gen_context(system_u:object_r:devlog_t,s0)
+ ')
+ 
+-/var/run/audit_events	-s	gen_context(system_u:object_r:auditd_var_run_t,mls_systemhigh)
+-/var/run/audispd_events	-s	gen_context(system_u:object_r:audisp_var_run_t,mls_systemhigh)
+-/var/run/auditd\.pid	--	gen_context(system_u:object_r:auditd_var_run_t,mls_systemhigh)
+-/var/run/auditd_sock	-s	gen_context(system_u:object_r:auditd_var_run_t,mls_systemhigh)
+-/var/run/klogd\.pid	--	gen_context(system_u:object_r:klogd_var_run_t,s0)
+-/var/run/log		-s	gen_context(system_u:object_r:devlog_t,s0)
+-/var/run/metalog\.pid	--	gen_context(system_u:object_r:syslogd_var_run_t,s0)
+-/var/run/syslogd\.pid	--	gen_context(system_u:object_r:syslogd_var_run_t,mls_systemhigh)
+-/var/run/syslog-ng.ctl	--	gen_context(system_u:object_r:syslogd_var_run_t,s0)
+-/var/run/syslog-ng(/.*)?	gen_context(system_u:object_r:syslogd_var_run_t,s0)
++/tmp/audit_events	-s	gen_context(system_u:object_r:auditd_var_run_t,mls_systemhigh)
++/tmp/audispd_events	-s	gen_context(system_u:object_r:audisp_var_run_t,mls_systemhigh)
++/tmp/auditd\.pid	--	gen_context(system_u:object_r:auditd_var_run_t,mls_systemhigh)
++/tmp/auditd_sock	-s	gen_context(system_u:object_r:auditd_var_run_t,mls_systemhigh)
++/tmp/klogd\.pid	--	gen_context(system_u:object_r:klogd_tmp_t,s0)
++/tmp/log		-s	gen_context(system_u:object_r:devlog_t,s0)
++/tmp/metalog\.pid	--	gen_context(system_u:object_r:syslogd_tmp_t,s0)
++/tmp/syslogd\.pid	--	gen_context(system_u:object_r:syslogd_tmp_t,mls_systemhigh)
++/tmp/syslog-ng.ctl	--	gen_context(system_u:object_r:syslogd_tmp_t,s0)
++/tmp/syslog-ng(/.*)?	gen_context(system_u:object_r:syslogd_tmp_t,s0)
+ 
+-/var/spool/audit(/.*)?		gen_context(system_u:object_r:audit_spool_t,mls_systemhigh)
+-/var/spool/bacula/log(/.*)? 	gen_context(system_u:object_r:var_log_t,s0)
+-/var/spool/postfix/pid	-d	gen_context(system_u:object_r:var_run_t,s0)
+-/var/spool/plymouth/boot\.log	gen_context(system_u:object_r:var_log_t,mls_systemhigh)
+-/var/spool/rsyslog(/.*)? 	gen_context(system_u:object_r:var_log_t,s0)
++/tmp/audit(/.*)?		gen_context(system_u:object_r:audit_spool_t,mls_systemhigh)
++/tmp/bacula/log(/.*)? 	gen_context(system_u:object_r:var_log_t,s0)
++/tmp/postfix/pid	-d	gen_context(system_u:object_r:var_run_t,s0)
++/tmp/plymouth/boot\.log	gen_context(system_u:object_r:var_log_t,mls_systemhigh)
++/tmp/rsyslog(/.*)? 	gen_context(system_u:object_r:var_log_t,s0)
+ 
+ /var/tinydns/log/main(/.*)?	gen_context(system_u:object_r:var_log_t,s0)
+--- a/policy/modules/system/logging.te	2012-07-25 13:33:04.000000000 -0500
++++ b/policy/modules/system/logging.te	2012-09-18 08:25:54.000000000 -0500
+@@ -50,7 +50,7 @@
+ 
+ type klogd_t;
+ type klogd_exec_t;
+-init_daemon_domain(klogd_t, klogd_exec_t)
++init_domain(klogd_t, klogd_exec_t)
+ 
+ type klogd_tmp_t;
+ files_tmp_file(klogd_tmp_t)
+@@ -63,7 +63,7 @@
+ 
+ type syslogd_t;
+ type syslogd_exec_t;
+-init_daemon_domain(syslogd_t, syslogd_exec_t)
++init_domain(syslogd_t, syslogd_exec_t)
+ 
+ type syslogd_initrc_exec_t;
+ init_script_file(syslogd_initrc_exec_t)
+@@ -97,6 +97,9 @@
+ read_files_pattern(auditctl_t, auditd_etc_t, auditd_etc_t)
+ allow auditctl_t auditd_etc_t:dir list_dir_perms;
+ 
++# Need for the /var/spool symlink configuration
++files_read_spool_lnk(auditctl_t);
++
+ # Needed for adding watches
+ files_getattr_all_dirs(auditctl_t)
+ files_getattr_all_files(auditctl_t)
+@@ -143,6 +146,7 @@
+ manage_files_pattern(auditd_t, auditd_var_run_t, auditd_var_run_t)
+ manage_sock_files_pattern(auditd_t, auditd_var_run_t, auditd_var_run_t)
+ files_pid_filetrans(auditd_t, auditd_var_run_t, { file sock_file })
++files_tmp_filetrans(auditd_t, auditd_var_run_t, { file sock_file })
+ 
+ kernel_read_kernel_sysctls(auditd_t)
+ # Needs to be able to run dispatcher.  see /etc/audit/auditd.conf
diff --git a/package/refpolicy/0008-mountChanges.patch b/package/refpolicy/0008-mountChanges.patch
new file mode 100644
index 0000000..35a5398
--- /dev/null
+++ b/package/refpolicy/0008-mountChanges.patch
@@ -0,0 +1,11 @@
+--- a/policy/modules/system/mount.te	2012-07-25 13:33:04.000000000 -0500
++++ b/policy/modules/system/mount.te	2012-09-17 09:14:29.000000000 -0500
+@@ -92,7 +92,7 @@
+ files_dontaudit_write_all_mountpoints(mount_t)
+ files_dontaudit_setattr_all_mountpoints(mount_t)
+ 
+-fs_getattr_xattr_fs(mount_t)
++fs_getattr_all_fs(mount_t)
+ fs_getattr_cifs(mount_t)
+ fs_mount_all_fs(mount_t)
+ fs_unmount_all_fs(mount_t)
diff --git a/package/refpolicy/0009-sysadmChanges.patch b/package/refpolicy/0009-sysadmChanges.patch
new file mode 100644
index 0000000..bbb5b52
--- /dev/null
+++ b/package/refpolicy/0009-sysadmChanges.patch
@@ -0,0 +1,24 @@
+--- a/policy/modules/roles/sysadm.te	2012-07-25 13:33:05.000000000 -0500
++++ b/policy/modules/roles/sysadm.te	2012-09-18 15:27:15.000000000 -0500
+@@ -39,6 +39,10 @@
+ userdom_manage_user_home_dirs(sysadm_t)
+ userdom_home_filetrans_user_home_dir(sysadm_t)
+ 
++# Add blk and chr files for dataloading
++files_manage_isid_type_blk_files(sysadm_t)
++files_manage_isid_type_chr_files(sysadm_t)
++
+ ifdef(`direct_sysadm_daemon',`
+ 	optional_policy(`
+ 		init_run_daemon(sysadm_t, sysadm_r)
+@@ -270,6 +274,10 @@
+ ')
+ 
+ optional_policy(`
++	ppp_run(sysadm_t, sysadm_r)
++')
++
++optional_policy(`
+ 	pyzor_role(sysadm_r, sysadm_t)
+ ')
+ 
diff --git a/package/refpolicy/0010-authloginChanges.patch b/package/refpolicy/0010-authloginChanges.patch
new file mode 100644
index 0000000..aa8334e
--- /dev/null
+++ b/package/refpolicy/0010-authloginChanges.patch
@@ -0,0 +1,14 @@
+--- a/policy/modules/system/authlogin.te	2012-07-25 13:33:04.000000000 -0500
++++ b/policy/modules/system/authlogin.te	2012-09-18 07:11:17.000000000 -0500
+@@ -109,8 +109,10 @@
+ files_read_etc_files(chkpwd_t)
+ # for nscd
+ files_dontaudit_search_var(chkpwd_t)
++files_dontaudit_search_tmp(chkpwd_t)
++dev_dontaudit_search_sysfs(chkpwd_t)
+ 
+-fs_dontaudit_getattr_xattr_fs(chkpwd_t)
++fs_dontaudit_getattr_all_fs(chkpwd_t)
+ 
+ term_dontaudit_use_console(chkpwd_t)
+ term_dontaudit_use_unallocated_ttys(chkpwd_t)
diff --git a/package/refpolicy/0011-localloginChanges.patch b/package/refpolicy/0011-localloginChanges.patch
new file mode 100644
index 0000000..2f2f770
--- /dev/null
+++ b/package/refpolicy/0011-localloginChanges.patch
@@ -0,0 +1,13 @@
+################################################################################
+# Copyright 2012-2015, Rockwell Collins.  All rights reserved.
+################################################################################
+--- a/policy/modules/system/locallogin.te	2012-05-04 08:14:47.000000000 -0500
++++ b/policy/modules/system/locallogin.te	2012-10-18 08:38:32.000000000 -0500
+@@ -86,6 +86,7 @@
+ dev_dontaudit_setattr_misc_dev(local_login_t)
+ dev_dontaudit_getattr_scanner_dev(local_login_t)
+ dev_dontaudit_setattr_scanner_dev(local_login_t)
++dev_dontaudit_getattr_sysfs_fs(local_login_t)
+ dev_dontaudit_search_sysfs(local_login_t)
+ dev_dontaudit_getattr_video_dev(local_login_t)
+ dev_dontaudit_setattr_video_dev(local_login_t)
diff --git a/package/refpolicy/0012-udevChanges.patch b/package/refpolicy/0012-udevChanges.patch
new file mode 100644
index 0000000..acd7a6a
--- /dev/null
+++ b/package/refpolicy/0012-udevChanges.patch
@@ -0,0 +1,14 @@
+################################################################################
+# Copyright 2012-2015, Rockwell Collins.  All rights reserved.
+################################################################################
+--- a/policy/modules/system/udev.fc	2012-05-04 08:14:47.000000000 -0500
++++ b/policy/modules/system/udev.fc	2012-10-17 15:02:24.000000000 -0500
+@@ -29,7 +29,7 @@
+ /usr/bin/udevinfo --	gen_context(system_u:object_r:udev_exec_t,s0)
+ 
+ /var/run/PackageKit/udev(/.*)? gen_context(system_u:object_r:udev_var_run_t,s0)
+-/var/run/udev(/.*)?	gen_context(system_u:object_r:udev_tbl_t,s0)
++/tmp/udev(/.*)?	gen_context(system_u:object_r:udev_var_run_t,s0)
+ 
+ ifdef(`distro_debian',`
+ /var/run/xen-hotplug -d	gen_context(system_u:object_r:udev_var_run_t,s0)
diff --git a/package/refpolicy/0013-netutilsChanges.patch b/package/refpolicy/0013-netutilsChanges.patch
new file mode 100644
index 0000000..06b6c8e
--- /dev/null
+++ b/package/refpolicy/0013-netutilsChanges.patch
@@ -0,0 +1,13 @@
+################################################################################
+# Copyright 2012-2015, Rockwell Collins.  All rights reserved.
+################################################################################
+--- a/policy/modules/admin/netutils.te	2012-05-04 08:14:47.000000000 -0500
++++ b/policy/modules/admin/netutils.te	2012-10-18 07:25:25.000000000 -0500
+@@ -105,6 +105,7 @@
+ 
+ allow ping_t self:capability { setuid net_raw };
+ dontaudit ping_t self:capability sys_tty_config;
++allow ping_t self:process { getcap setcap };
+ allow ping_t self:tcp_socket create_socket_perms;
+ allow ping_t self:rawip_socket { create ioctl read write bind getopt setopt };
+ allow ping_t self:packet_socket { create ioctl read write bind getopt setopt };
diff --git a/package/refpolicy/0014-devicesChanges.patch b/package/refpolicy/0014-devicesChanges.patch
new file mode 100644
index 0000000..4f480df
--- /dev/null
+++ b/package/refpolicy/0014-devicesChanges.patch
@@ -0,0 +1,48 @@
+################################################################################
+# Copyright 2012-2015, Rockwell Collins.  All rights reserved.
+################################################################################
+--- a/policy/modules/kernel/devices.if	2012-05-10 08:25:34.000000000 -0500
++++ b/policy/modules/kernel/devices.if	2012-10-18 08:40:43.000000000 -0500
+@@ -3836,6 +3836,42 @@
+ 
+ ########################################
+ ## <summary>
++##	Get attributes of sysfs filesystems.
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`dev_getattr_sysfs_fs',`
++	gen_require(`
++		type sysfs_t;
++	')
++
++	allow $1 sysfs_t:filesystem getattr;
++')
++
++########################################
++## <summary>
++##	Don't audit get attributes of sysfs filesystems.
++## </summary>
++## <param name="domain">
++##	<summary>
++##	Domain allowed access.
++##	</summary>
++## </param>
++#
++interface(`dev_dontaudit_getattr_sysfs_fs',`
++	gen_require(`
++		type sysfs_t;
++	')
++
++	dontaudit $1 sysfs_t:filesystem getattr;
++')
++
++########################################
++## <summary>
+ ##	Search the sysfs directories.
+ ## </summary>
+ ## <param name="domain">
diff --git a/package/refpolicy/0002-awk-fix.patch b/package/refpolicy/0015-awk-fix.patch
similarity index 100%
rename from package/refpolicy/0002-awk-fix.patch
rename to package/refpolicy/0015-awk-fix.patch
diff --git a/package/refpolicy/0016-enablePolyinstantiation.patch b/package/refpolicy/0016-enablePolyinstantiation.patch
new file mode 100644
index 0000000..d91b4b1
--- /dev/null
+++ b/package/refpolicy/0016-enablePolyinstantiation.patch
@@ -0,0 +1,11 @@
+--- a/policy/global_tunables	2012-03-30 07:48:20.000000000 -0500
++++ b/policy/global_tunables	2012-09-13 09:31:38.000000000 -0500
+@@ -37,7 +37,7 @@
+ ## Enable polyinstantiated directory support.
+ ## </p>
+ ## </desc>
+-gen_tunable(allow_polyinstantiation,false)
++gen_tunable(allow_polyinstantiation,true)
+ 
+ ## <desc>
+ ## <p>
-- 
1.9.1
