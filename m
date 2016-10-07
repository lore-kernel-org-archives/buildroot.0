From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 7 Oct 2016 13:06:14 -0500
Subject: [Buildroot] [v3 2/2] refpolicy: new package
In-Reply-To: <1468715720-2156-2-git-send-email-Aduskett@gmail.com>
References: <1468715720-2156-1-git-send-email-Aduskett@gmail.com>
 <1468715720-2156-2-git-send-email-Aduskett@gmail.com>
Message-ID: <CANQCQpYsoi5ypw9HmbKfecfk9oYt=b0tG340BEmO89DR8SobjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bryce,

On Sat, Jul 16, 2016 at 7:35 PM, Adam Duskett <aduskett@gmail.com> wrote:
> The patch is for adding selinux reference policy (refpolicy).
> It is a complete SELinux policy that can be used as the system policy
> for a variety of systems and used as the basis for creating other policies.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

CC'n Bryce as he wasn't on the mailing list for the original.

> ---
> Changes:
>
> Changes v2 - v3:
>  - Updated url.
>
> Changes v1 - v2:
>  - Updated version to 20151208
>  - Moved Fix-awk-references patch into base dir, as it still applies to the new
>    Version.
>  - Added custom policy name to menuconfig (default is buildroot).
>  - Added custom default boolean file.
>  - Added path for custom boolean file in menuconfig.
>  - Changed /selinux to newer /sys/fs/selinux in S00Selinux
>
>
>  package/Config.in                                  |    1 +
>  .../0001-Fix-awk-references-to-use-variable.patch  |   42 +
>  package/refpolicy/Config.in                        |  146 +++
>  package/refpolicy/S00selinux                       |  126 ++
>  package/refpolicy/booleans.conf                    | 1278 ++++++++++++++++++++
>  package/refpolicy/config                           |    8 +
>  package/refpolicy/modules.conf                     |  430 +++++++
>  package/refpolicy/refpolicy.hash                   |    2 +
>  package/refpolicy/refpolicy.mk                     |  118 ++
>  9 files changed, 2151 insertions(+)
>  create mode 100644 package/refpolicy/0001-Fix-awk-references-to-use-variable.patch
>  create mode 100644 package/refpolicy/Config.in
>  create mode 100644 package/refpolicy/S00selinux
>  create mode 100644 package/refpolicy/booleans.conf
>  create mode 100644 package/refpolicy/config
>  create mode 100644 package/refpolicy/modules.conf
>  create mode 100644 package/refpolicy/refpolicy.hash
>  create mode 100644 package/refpolicy/refpolicy.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index cc875e8..fcba5d0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1620,6 +1620,7 @@ endmenu
>
>  menu "Security"
>         source "package/policycoreutils/Config.in"
> +       source "package/refpolicy/Config.in"
>         source "package/setools/Config.in"
>  endmenu
>
> diff --git a/package/refpolicy/0001-Fix-awk-references-to-use-variable.patch b/package/refpolicy/0001-Fix-awk-references-to-use-variable.patch
> new file mode 100644
> index 0000000..8236fa2
> --- /dev/null
> +++ b/package/refpolicy/0001-Fix-awk-references-to-use-variable.patch
> @@ -0,0 +1,42 @@
> +From 1d4c826e8de366bccb93f167cd9be834ab5911c8 Mon Sep 17 00:00:00 2001
> +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> +Date: Fri, 8 May 2015 14:13:00 -0500
> +Subject: [PATCH] Fix awk references to use variable
> +
> +Ensure all awk calls use the variable setup in the makefile rather than
> +relying on the system.
> +
> +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> +---
> + Makefile | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 85d4cfb..3aa4b51 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -292,9 +292,9 @@ cmdline_mods := $(addsuffix .te,$(APPS_MODS))
> + cmdline_off := $(addsuffix .te,$(APPS_OFF))
> +
> + # extract settings from modules.conf
> +-mod_conf_base := $(addsuffix .te,$(sort $(shell awk '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configbase)") print $$1 }' $(mod_conf) 2> /dev/null)))
> +-mod_conf_mods := $(addsuffix .te,$(sort $(shell awk '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configmod)") print $$1 }' $(mod_conf) 2> /dev/null)))
> +-mod_conf_off := $(addsuffix .te,$(sort $(shell awk '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configoff)") print $$1 }' $(mod_conf) 2> /dev/null)))
> ++mod_conf_base := $(addsuffix .te,$(sort $(shell $(AWK) '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configbase)") print $$1 }' $(mod_conf) 2> /dev/null)))
> ++mod_conf_mods := $(addsuffix .te,$(sort $(shell $(AWK) '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configmod)") print $$1 }' $(mod_conf) 2> /dev/null)))
> ++mod_conf_off := $(addsuffix .te,$(sort $(shell $(AWK) '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configoff)") print $$1 }' $(mod_conf) 2> /dev/null)))
> +
> + base_mods := $(cmdline_base)
> + mod_mods := $(cmdline_mods)
> +@@ -308,7 +308,7 @@ off_mods += $(filter-out $(cmdline_off) $(cmdline_base) $(cmdline_mods), $(mod_c
> + off_mods += $(filter-out $(base_mods) $(mod_mods) $(off_mods),$(notdir $(detected_mods)))
> +
> + # filesystems to be used in labeling targets
> +-filesystems = $(shell mount | grep -v "context=" | egrep -v '\((|.*,)bind(,.*|)\)' | awk '/(ext[234]|btrfs| xfs| jfs).*rw/{print $$3}';)
> ++filesystems = $(shell mount | grep -v "context=" | egrep -v '\((|.*,)bind(,.*|)\)' | $(AWK) '/(ext[234]|btrfs| xfs| jfs).*rw/{print $$3}';)
> + fs_names := "btrfs ext2 ext3 ext4 xfs jfs"
> +
> + ########################################
> +--
> +1.9.1
> +
> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
> new file mode 100644
> index 0000000..5a46829
> --- /dev/null
> +++ b/package/refpolicy/Config.in
> @@ -0,0 +1,146 @@
> +config BR2_PACKAGE_REFPOLICY
> +       bool "refpolicy"
> +       select BR2_PACKAGE_POLICYCOREUTILS
> +       select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
> +       depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # policycoreutils
> +       help
> +         The SELinux Reference Policy project (refpolicy) is a
> +         complete SELinux policy that can be used as the system
> +         policy for a variety of systems and used as the basis
> +         for creating other policies. Reference Policy was originally
> +         based on the NSA example policy, but aims to accomplish
> +         many additional goals.
> +
> +         The current refpolicy does not fully support Buildroot
> +         and needs modifications to work with the default system
> +         file layout. These changes should be added as patches to
> +         the refpolicy that modify a single SELinux policy.
> +
> +         The refpolicy works for the most part in permissive mode. Only the
> +         basic set of utilities are enabled in the example policy config and
> +         some of the pathing in the policies is not correct. Individual
> +         policies would need to be tweaked to get everything functioning
> +         properly.
> +
> +comment "refpolicy needs a toolchain w/ threads, glibc or musl"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS \
> +               || !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +
> +if BR2_PACKAGE_REFPOLICY
> +
> +choice
> +prompt "SELinux policy type"
> +default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +
> +config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +bool "Standard"
> +help
> +Standard SELinux policy
> +
> +config BR2_PACKAGE_REFPOLICY_TYPE_MCS
> +bool "MCS"
> +help
> +SELinux policy with multi-catagory support
> +
> +config BR2_PACKAGE_REFPOLICY_TYPE_MLS
> +bool "MLS"
> +help
> +SELinux policy with multi-catagory and multi-level support
> +endchoice
> +
> +config BR2_PACKAGE_REFPOLICY_TYPE
> +       string
> +       default "standard" if BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +       default "mcs" if BR2_PACKAGE_REFPOLICY_TYPE_MCS
> +       default "mls" if BR2_PACKAGE_REFPOLICY_TYPE_MLS
> +
> +choice
> +prompt "SELinux default state"
> +default BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
> +bool "Enforcing"
> +help
> +SELinux security policy is enforced
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +bool "Permissive"
> +help
> +SELinux prints warnings instead of enforcing
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_DISABLE
> +bool "Disabled"
> +help
> +No SELinux policy is loaded
> +endchoice
> +
> +config BR2_PACKAGE_REFPOLICY_NAME
> +       string "Custom policy Name"
> +       default "Buildroot"
> +
> +config BR2_PACKAGE_REFPOLICY_STATE
> +       string
> +       default "permissive" if BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +       default "enforcing" if BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
> +       default "disabled" if BR2_PACKAGE_REFPOLICY_STATE_DISABLE
> +
> +config BR2_PACKAGE_REFPOLICY_MODULES_FILE
> +       string "Refpolicy modules configuration"
> +       default "package/refpolicy/modules.conf"
> +       help
> +         Location of a custom modules.conf file that lists the
> +         SELinux policy modules to be included in the compiled
> +         policy. See policy/modules.conf in the refpolicy sources for
> +         the complete list of available modules.
> +         NOTE: This file is only used if a Custom Git repo is
> +         not specified.
> +
> +config BR2_PACKAGE_REFPOLICY_BOOLEAN_FILE
> +       string "Refpolicy boolean configuration"
> +       default "package/refpolicy/booleans.conf"
> +       help
> +         Location of a custom booleans.conf file that lists the
> +         SELinux booleans to be set in the compiled
> +         policy. See policy/booleans.conf in the refpolicy sources for
> +         the complete list of available modules.
> +         NOTE: This file is only used if a Custom Git repo is
> +         not specified.
> +
> +config BR2_PACKAGE_REFPOLICY_MODULAR
> +       bool "Build a modular SELinux policy"
> +       help
> +         Select Y to build a modular SELinux policy. By default,
> +         a monolithic policy will be built to save space on the
> +         target. A modular policy can also be built if policies
> +         need to be modified without reloading the target.
> +
> +config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
> +       bool "Custom Git repository"
> +       select BR2_PACKAGE_REFPOLICY_CONTRIB
> +       help
> +        This option allows Buildroot to get the refpolicy source
> +        code from a Git repository. This option should generally
> +        be used to add custom SELinux policy to the base refpolicy
> +        without having to deal with lots of patches.
> +
> +        Please note that with the current configuration of the
> +        mainline refpolicy git repositories, a refpolicy and a
> +        refpolicy-contrib git repo must be specified. These are
> +        linked using a git submodule which does not get initialized
> +        during the Buildroot build.
> +
> +if BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
> +
> +config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL
> +       string "URL of custom repository"
> +
> +config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION
> +       string "Custom repository version"
> +       help
> +         Revision to use in the typical format used by Git
> +         e.g. a SHA id, a tag, branch, ..
> +
> +endif
> +
> +endif
> diff --git a/package/refpolicy/S00selinux b/package/refpolicy/S00selinux
> new file mode 100644
> index 0000000..4faccfb
> --- /dev/null
> +++ b/package/refpolicy/S00selinux
> @@ -0,0 +1,126 @@
> +#!/bin/sh
> +################################################################################
> +#
> +# This file labels the security contexts of memory based filesystems such as
> +# /dev/ and checks for auto relabel request if '/.autorelabel' file exists.
> +#
> +# This script is a heavily stripped down and modified version of the one used
> +# in CentOS 6.2
> +#
> +################################################################################
> +
> +failed()
> +{
> +   echo $1
> +   exit 1
> +}
> +
> +# Get SELinux config env vars
> +. /etc/selinux/config || failed "Failed to source the SELinux config"
> +
> +setup_selinux() {
> +   # Create required directories
> +   mkdir -p /etc/selinux/${SELINUXTYPE}/policy/ ||
> +         failed "Failed to create the policy folder"
> +   mkdir -p /etc/selinux/${SELINUXTYPE}/modules/active/modules || \
> +         failed "Failed to create the modules folder"
> +   if [ ! -f /etc/selinux/${SELINUXTYPE}/contexts/files/file_contexts.local ]
> +   then
> +      touch /etc/selinux/${SELINUXTYPE}/contexts/files/file_contexts.local || \
> +            failed "Failed to create the file_contexts.local file"
> +   fi
> +
> +   # Load the policy to activate it
> +   load_policy -i || failed "Failed to load the SELinux policy"
> +}
> +
> +relabel_selinux() {
> +   # if /sbin/init is not labeled correctly this process is running in the
> +   # wrong context, so a reboot will be required after relabel
> +   AUTORELABEL=
> +
> +   # Switch to Permissive mode
> +   echo "0" > /sys/fs/selinux/enforce || failed "Failed to disable enforcing mode"
> +
> +   echo
> +   echo "*** Warning -- SELinux ${SELINUXTYPE} policy relabel is required."
> +   echo "*** Relabeling could take a very long time, depending on file"
> +   echo "*** system size and speed of hard drives."
> +
> +   # Relabel mount points
> +   restorecon $(awk '!/^#/ && $4 !~ /noauto/ && $2 ~ /^\// { print $2 }' /etc/fstab) \
> +         >/dev/null 2>&1 || failed "Failed to relabel the mount points"
> +
> +   # Relabel file system
> +   echo "Relabeling file systems"
> +   restorecon -R -F / || failed "Failed to relabel the file system"
> +
> +   # Remove label
> +   rm -f  /.autorelabel || failed "Failed to remove the autorelabel flag"
> +
> +   # Reboot to activate relabeled file system
> +   echo "Automatic reboot in progress."
> +   reboot -f
> +}
> +
> +start() {
> +   printf "Initializing SELinux: "
> +
> +   # Check to see if the default policy has been installed
> +   if [ "`sestatus | grep "SELinux status" | grep enabled`" == "" ]; then
> +      if [ ! -f /etc/selinux/${SELINUXTYPE}/policy/policy.* ]
> +      then
> +         setup_selinux
> +      else
> +           # Load the policy to activate it
> +           load_policy -i || failed "Failed to load the SELinux policy"
> +      fi
> +   fi
> +
> +   # Check SELinux status
> +   SELINUX_STATE=
> +   if [ -e "/selinux/enforce" ] && [ "$(cat /proc/self/attr/current)" != "kernel" ]; then
> +      if [ -r "/selinux/enforce" ] ; then
> +         SELINUX_STATE=$(cat "/selinux/enforce")
> +      else
> +         # assume enforcing if you can't read it
> +         SELINUX_STATE=1
> +      fi
> +   fi
> +
> +   # Context Label /dev/
> +      /sbin/restorecon -R -F /dev 2>/dev/null
> +
> +   # Context Label tmpfs mounts.
> +   # using /proc/mounts to discover tmpfs mounts
> +      /sbin/restorecon -R -F $(awk '!/^#/ && $4 !~ /noauto/ && $2 ~ /^\// && $3 =="tmpfs" { print $2 }' /etc/fstab) >/dev/null 2>&1
> +
> +   # Clean up SELinux labels
> +      restorecon -F /etc/mtab /etc/ld.so.cache /etc/resolv.conf >/dev/null 2>&1
> +
> +   # Check for filesystem relabel request
> +   if [ -f /.autorelabel ] ; then
> +      relabel_selinux
> +   fi
> +
> +   echo "OK"
> +}
> +stop() {
> +   # There is nothing to do
> +   echo "OK"
> +}
> +
> +case "$1" in
> +   start)
> +      start
> +      ;;
> +   stop)
> +      stop
> +      ;;
> +   *)
> +      echo "Usage: $0 {start|stop}"
> +      exit 1
> +      ;;
> +esac
> +
> +exit $?
> diff --git a/package/refpolicy/booleans.conf b/package/refpolicy/booleans.conf
> new file mode 100644
> index 0000000..31c70b9
> --- /dev/null
> +++ b/package/refpolicy/booleans.conf
> @@ -0,0 +1,1278 @@
> +#
> +# Disable kernel module loading.
> +#
> +secure_mode_insmod = false
> +
> +#
> +# Boolean to determine whether the system permits loading policy, setting
> +# enforcing mode, and changing boolean values.  Set this to true and you
> +# have to reboot to set it back.
> +#
> +secure_mode_policyload = false
> +
> +#
> +# Enabling secure mode disallows programs, such as
> +# newrole, from transitioning to administrative
> +# user domains.
> +#
> +secure_mode = false
> +
> +#
> +# Control users use of ping and traceroute
> +#
> +user_ping = false
> +
> +#
> +# Determine whether ABRT can modify
> +# public files used for public file
> +# transfer services.
> +#
> +abrt_anon_write = false
> +
> +#
> +# Determine whether abrt-handle-upload
> +# can modify public files used for public file
> +# transfer services in /var/spool/abrt-upload/.
> +#
> +abrt_upload_watch_anon_write = true
> +
> +#
> +# Determine whether ABRT can run in
> +# the abrt_handle_event_t domain to
> +# handle ABRT event scripts.
> +#
> +abrt_handle_event = false
> +
> +#
> +# Determine whether amavis can
> +# use JIT compiler.
> +#
> +amavis_use_jit = false
> +
> +#
> +# Determine whether httpd can modify
> +# public files used for public file
> +# transfer services. Directories/Files must
> +# be labeled public_content_rw_t.
> +#
> +allow_httpd_anon_write = false
> +
> +#
> +# Determine whether httpd can use mod_auth_pam.
> +#
> +allow_httpd_mod_auth_pam = false
> +
> +#
> +# Determine whether httpd can use built in scripting.
> +#
> +httpd_builtin_scripting = false
> +
> +#
> +# Determine whether httpd can check spam.
> +#
> +httpd_can_check_spam = false
> +
> +#
> +# Determine whether httpd scripts and modules
> +# can connect to the network using TCP.
> +#
> +httpd_can_network_connect = true
> +
> +#
> +# Determine whether httpd scripts and modules
> +# can connect to cobbler over the network.
> +#
> +httpd_can_network_connect_cobbler = false
> +
> +#
> +# Determine whether scripts and modules can
> +# connect to databases over the network.
> +#
> +httpd_can_network_connect_db = false
> +
> +#
> +# Determine whether httpd can connect to
> +# ldap over the network.
> +#
> +httpd_can_network_connect_ldap = false
> +
> +#
> +# Determine whether httpd can connect
> +# to memcache server over the network.
> +#
> +httpd_can_network_connect_memcache = false
> +
> +#
> +# Determine whether httpd can act as a relay.
> +#
> +httpd_can_network_relay = false
> +
> +#
> +# Determine whether httpd daemon can
> +# connect to zabbix over the network.
> +#
> +httpd_can_network_connect_zabbix = false
> +
> +#
> +# Determine whether httpd can send mail.
> +#
> +httpd_can_sendmail = false
> +
> +#
> +# Determine whether httpd can communicate
> +# with avahi service via dbus.
> +#
> +httpd_dbus_avahi = false
> +
> +#
> +# Determine wether httpd can use support.
> +#
> +httpd_enable_cgi = false
> +
> +#
> +# Determine whether httpd can act as a
> +# FTP server by listening on the ftp port.
> +#
> +httpd_enable_ftp_server = false
> +
> +#
> +# Determine whether httpd can traverse
> +# user home directories.
> +#
> +httpd_enable_homedirs = false
> +
> +#
> +# Determine whether httpd gpg can modify
> +# public files used for public file
> +# transfer services. Directories/Files must
> +# be labeled public_content_rw_t.
> +#
> +httpd_gpg_anon_write = false
> +
> +#
> +# Determine whether httpd can execute
> +# its temporary content.
> +#
> +httpd_tmp_exec = false
> +
> +#
> +# Determine whether httpd scripts and
> +# modules can use execmem and execstack.
> +#
> +httpd_execmem = true
> +
> +#
> +# Determine whether httpd can connect
> +# to port 80 for graceful shutdown.
> +#
> +httpd_graceful_shutdown = false
> +
> +#
> +# Determine whether httpd can
> +# manage IPA content files.
> +#
> +httpd_manage_ipa = false
> +
> +#
> +# Determine whether httpd can use mod_auth_ntlm_winbind.
> +#
> +httpd_mod_auth_ntlm_winbind = false
> +
> +#
> +# Determine whether httpd can read
> +# generic user home content files.
> +#
> +httpd_read_user_content = true
> +
> +#
> +# Determine whether httpd can change
> +# its resource limits.
> +#
> +httpd_setrlimit = false
> +
> +#
> +# Determine whether httpd can run
> +# SSI executables in the same domain
> +# as system CGI scripts.
> +#
> +httpd_ssi_exec = false
> +
> +#
> +# Determine whether httpd can communicate
> +# with the terminal. Needed for entering the
> +# passphrase for certificates at the terminal.
> +#
> +httpd_tty_comm = false
> +
> +#
> +# Determine whether httpd can have full access
> +# to its content types.
> +#
> +httpd_unified = false
> +
> +#
> +# Determine whether httpd can use
> +# cifs file systems.
> +#
> +httpd_use_cifs = false
> +
> +#
> +# Determine whether httpd can
> +# use fuse file systems.
> +#
> +httpd_use_fusefs = false
> +
> +#
> +# Determine whether httpd can use gpg.
> +#
> +httpd_use_gpg = false
> +
> +#
> +# Determine whether httpd can use
> +# nfs file systems.
> +#
> +httpd_use_nfs = false
> +
> +#
> +# Determine whether awstats can
> +# purge httpd log files.
> +#
> +awstats_purge_apache_log_files = false
> +
> +#
> +# Determine whether Bind can bind tcp socket to http ports.
> +#
> +named_tcp_bind_http_port = false
> +
> +#
> +# Determine whether Bind can write to master zone files.
> +# Generally this is used for dynamic DNS or zone transfers.
> +#
> +named_write_master_zones = false
> +
> +#
> +# Determine whether boinc can execmem/execstack.
> +#
> +boinc_execmem = true
> +
> +#
> +# Determine whether cdrecord can read
> +# various content. nfs, samba, removable
> +# devices, user temp and untrusted
> +# content files
> +#
> +cdrecord_read_content = false
> +
> +#
> +# Determine whether clamscan can
> +# read user content files.
> +#
> +clamav_read_user_content_files_clamscan = false
> +
> +#
> +# Determine whether clamscan can read
> +# all non-security files.
> +#
> +clamav_read_all_non_security_files_clamscan = false
> +
> +#
> +# Determine whether can clamd use JIT compiler.
> +#
> +clamd_use_jit = false
> +
> +#
> +# Determine whether Cobbler can modify
> +# public files used for public file
> +# transfer services.
> +#
> +cobbler_anon_write = false
> +
> +#
> +# Determine whether Cobbler can connect
> +# to the network using TCP.
> +#
> +cobbler_can_network_connect = false
> +
> +#
> +# Determine whether Cobbler can access
> +# cifs file systems.
> +#
> +cobbler_use_cifs = false
> +
> +#
> +# Determine whether Cobbler can access
> +# nfs file systems.
> +#
> +cobbler_use_nfs = false
> +
> +#
> +# Determine whether collectd can connect
> +# to the network using TCP.
> +#
> +collectd_tcp_network_connect = false
> +
> +#
> +# Determine whether Condor can connect
> +# to the network using TCP.
> +#
> +condor_tcp_network_connect = false
> +
> +#
> +# Determine whether system cron jobs
> +# can relabel filesystem for
> +# restoring file contexts.
> +#
> +cron_can_relabel = false
> +
> +#
> +# Determine whether crond can execute jobs
> +# in the user domain as opposed to the
> +# the generic cronjob domain.
> +#
> +cron_userdomain_transition = false
> +
> +#
> +# Determine whether extra rules
> +# should be enabled to support fcron.
> +#
> +fcron_crond = false
> +
> +#
> +# Determine whether cvs can read shadow
> +# password files.
> +#
> +allow_cvs_read_shadow = false
> +
> +#
> +# Determine whether dbadm can manage
> +# generic user files.
> +#
> +dbadm_manage_user_files = false
> +
> +#
> +# Determine whether dbadm can read
> +# generic user files.
> +#
> +dbadm_read_user_files = false
> +
> +#
> +# Determine whether DHCP daemon
> +# can use LDAP backends.
> +#
> +dhcpd_use_ldap = false
> +
> +#
> +# Determine whether entropyd can use
> +# audio devices as the source for
> +# the entropy feeds.
> +#
> +entropyd_use_audio = false
> +
> +#
> +# Determine whether exim can connect to
> +# databases.
> +#
> +exim_can_connect_db = false
> +
> +#
> +# Determine whether exim can read generic
> +# user content files.
> +#
> +exim_read_user_files = false
> +
> +#
> +# Determine whether exim can create,
> +# read, write, and delete generic user
> +# content files.
> +#
> +exim_manage_user_files = false
> +
> +#
> +# Determine whether ftpd can modify
> +# public files used for public file
> +# transfer services. Directories/Files must
> +# be labeled public_content_rw_t.
> +#
> +allow_ftpd_anon_write = false
> +
> +#
> +# Determine whether ftpd can login to
> +# local users and can read and write
> +# all files on the system, governed by DAC.
> +#
> +allow_ftpd_full_access = false
> +
> +#
> +# Determine whether ftpd can use CIFS
> +# used for public file transfer services.
> +#
> +allow_ftpd_use_cifs = false
> +
> +#
> +# Determine whether ftpd can use NFS
> +# used for public file transfer services.
> +#
> +allow_ftpd_use_nfs = false
> +
> +#
> +# Determine whether ftpd can connect to
> +# databases over the TCP network.
> +#
> +ftpd_connect_db = false
> +
> +#
> +# Determine whether ftpd can bind to all
> +# unreserved ports for passive mode.
> +#
> +ftpd_use_passive_mode = false
> +
> +#
> +# Determine whether ftpd can connect to
> +# all unreserved ports.
> +#
> +ftpd_connect_all_unreserved = false
> +
> +#
> +# Determine whether ftpd can read and write
> +# files in user home directories.
> +#
> +ftp_home_dir = false
> +
> +#
> +# Determine whether sftpd can modify
> +# public files used for public file
> +# transfer services. Directories/Files must
> +# be labeled public_content_rw_t.
> +#
> +sftpd_anon_write = false
> +
> +#
> +# Determine whether sftpd-can read and write
> +# files in user home directories.
> +#
> +sftpd_enable_homedirs = false
> +
> +#
> +# Determine whether sftpd-can login to
> +# local users and read and write all
> +# files on the system, governed by DAC.
> +#
> +sftpd_full_access = false
> +
> +#
> +# Determine whether sftpd can read and write
> +# files in user ssh home directories.
> +#
> +sftpd_write_ssh_home = false
> +
> +#
> +# Determine whether Git CGI
> +# can search home directories.
> +#
> +git_cgi_enable_homedirs = false
> +
> +#
> +# Determine whether Git CGI
> +# can access cifs file systems.
> +#
> +git_cgi_use_cifs = false
> +
> +#
> +# Determine whether Git CGI
> +# can access nfs file systems.
> +#
> +git_cgi_use_nfs = false
> +
> +#
> +# Determine whether Git session daemon
> +# can bind TCP sockets to all
> +# unreserved ports.
> +#
> +git_session_bind_all_unreserved_ports = false
> +
> +#
> +# Determine whether calling user domains
> +# can execute Git daemon in the
> +# git_session_t domain.
> +#
> +git_session_users = false
> +
> +#
> +# Determine whether Git session daemons
> +# can send syslog messages.
> +#
> +git_session_send_syslog_msg = false
> +
> +#
> +# Determine whether Git system daemon
> +# can search home directories.
> +#
> +git_system_enable_homedirs = false
> +
> +#
> +# Determine whether Git system daemon
> +# can access cifs file systems.
> +#
> +git_system_use_cifs = false
> +
> +#
> +# Determine whether Git system daemon
> +# can access nfs file systems.
> +#
> +git_system_use_nfs = false
> +
> +#
> +# Determine whether Gitosis can send mail.
> +#
> +gitosis_can_sendmail = false
> +
> +#
> +# Determine whether GPG agent can manage
> +# generic user home content files. This is
> +# required by the --write-env-file option.
> +#
> +gpg_agent_env_file = false
> +
> +#
> +# Determine whether icecast can listen
> +# on and connect to any TCP port.
> +#
> +icecast_use_any_tcp_ports = false
> +
> +#
> +# Determine whether irc clients can
> +# listen on and connect to any
> +# unreserved TCP ports.
> +#
> +irc_use_any_tcp_ports = false
> +
> +#
> +# Determine whether java can make
> +# its stack executable.
> +#
> +allow_java_execstack = false
> +
> +#
> +# Determine whether kerberos is supported.
> +#
> +allow_kerberos = false
> +
> +#
> +# Determine whether logwatch can connect
> +# to mail over the network.
> +#
> +logwatch_can_network_connect_mail = false
> +
> +#
> +# Determine whether to support lpd server.
> +#
> +use_lpd_server = false
> +
> +#
> +# Determine whether mcelog supports
> +# client mode.
> +#
> +mcelog_client = false
> +
> +#
> +# Determine whether mcelog can execute scripts.
> +#
> +mcelog_exec_scripts = true
> +
> +#
> +# Determine whether mcelog can use all
> +# the user ttys.
> +#
> +mcelog_foreground = false
> +
> +#
> +# Determine whether mcelog supports
> +# server mode.
> +#
> +mcelog_server = false
> +
> +#
> +# Determine whether mcelog can use syslog.
> +#
> +mcelog_syslog = false
> +
> +#
> +# Determine whether minidlna can read generic user content.
> +#
> +minidlna_read_generic_user_content = false
> +
> +#
> +# Determine whether mozilla can
> +# make its stack executable.
> +#
> +mozilla_execstack = false
> +
> +#
> +# Determine whether mpd can traverse
> +# user home directories.
> +#
> +mpd_enable_homedirs = false
> +
> +#
> +# Determine whether mpd can use
> +# cifs file systems.
> +#
> +mpd_use_cifs = false
> +
> +#
> +# Determine whether mpd can use
> +# nfs file systems.
> +#
> +mpd_use_nfs = false
> +
> +#
> +# Determine whether mplayer can make
> +# its stack executable.
> +#
> +allow_mplayer_execstack = false
> +
> +#
> +# Determine whether mysqld can
> +# connect to all TCP ports.
> +#
> +mysql_connect_any = false
> +
> +#
> +# Determine whether confined applications
> +# can use nscd shared memory.
> +#
> +nscd_use_shm = false
> +
> +#
> +# Determine whether openvpn can
> +# read generic user home content files.
> +#
> +openvpn_enable_homedirs = false
> +
> +#
> +# Determine whether openvpn can
> +# connect to the TCP network.
> +#
> +openvpn_can_network_connect = false
> +
> +#
> +# Determine whether Polipo system
> +# daemon can access CIFS file systems.
> +#
> +polipo_system_use_cifs = false
> +
> +#
> +# Determine whether Polipo system
> +# daemon can access NFS file systems.
> +#
> +polipo_system_use_nfs = false
> +
> +#
> +# Determine whether calling user domains
> +# can execute Polipo daemon in the
> +# polipo_session_t domain.
> +#
> +polipo_session_users = false
> +
> +#
> +# Determine whether Polipo session daemon
> +# can send syslog messages.
> +#
> +polipo_session_send_syslog_msg = false
> +
> +#
> +# Determine whether portage can
> +# use nfs filesystems.
> +#
> +portage_use_nfs = false
> +
> +#
> +# Determine whether postfix local
> +# can manage mail spool content.
> +#
> +postfix_local_write_mail_spool = true
> +
> +#
> +# Determine whether pppd can
> +# load kernel modules.
> +#
> +pppd_can_insmod = false
> +
> +#
> +# Determine whether common users can
> +# run pppd with a domain transition.
> +#
> +pppd_for_user = false
> +
> +#
> +# Determine whether privoxy can
> +# connect to all tcp ports.
> +#
> +privoxy_connect_any = false
> +
> +#
> +# Determine whether puppet can
> +# manage all non-security files.
> +#
> +puppet_manage_all_files = false
> +
> +#
> +# Determine whether qemu has full
> +# access to the network.
> +#
> +qemu_full_network = false
> +
> +#
> +# Determine whether rgmanager can
> +# connect to the network using TCP.
> +#
> +rgmanager_can_network_connect = false
> +
> +#
> +# Determine whether fenced can
> +# connect to the TCP network.
> +#
> +fenced_can_network_connect = false
> +
> +#
> +# Determine whether fenced can use ssh.
> +#
> +fenced_can_ssh = false
> +
> +#
> +# Determine whether gssd can read
> +# generic user temporary content.
> +#
> +allow_gssd_read_tmp = false
> +
> +#
> +# Determine whether gssd can write
> +# generic user temporary content.
> +#
> +allow_gssd_write_tmp = false
> +
> +#
> +# Determine whether nfs can modify
> +# public files used for public file
> +# transfer services. Directories/Files must
> +# be labeled public_content_rw_t.
> +#
> +allow_nfsd_anon_write = false
> +
> +#
> +# Determine whether rsync can use
> +# cifs file systems.
> +#
> +rsync_use_cifs = false
> +
> +#
> +# Determine whether rsync can
> +# use fuse file systems.
> +#
> +rsync_use_fusefs = false
> +
> +#
> +# Determine whether rsync can use
> +# nfs file systems.
> +#
> +rsync_use_nfs = false
> +
> +#
> +# Determine whether rsync can
> +# run as a client
> +#
> +rsync_client = false
> +
> +#
> +# Determine whether rsync can
> +# export all content read only.
> +#
> +rsync_export_all_ro = false
> +
> +#
> +# Determine whether rsync can modify
> +# public files used for public file
> +# transfer services. Directories/Files must
> +# be labeled public_content_rw_t.
> +#
> +allow_rsync_anon_write = false
> +
> +#
> +# Determine whether samba can modify
> +# public files used for public file
> +# transfer services. Directories/Files must
> +# be labeled public_content_rw_t.
> +#
> +allow_smbd_anon_write = false
> +
> +#
> +# Determine whether samba can
> +# create home directories via pam.
> +#
> +samba_create_home_dirs = false
> +
> +#
> +# Determine whether samba can act as the
> +# domain controller, add users, groups
> +# and change passwords.
> +#
> +samba_domain_controller = false
> +
> +#
> +# Determine whether samba can
> +# act as a portmapper.
> +#
> +samba_portmapper = false
> +
> +#
> +# Determine whether samba can share
> +# users home directories.
> +#
> +samba_enable_home_dirs = false
> +
> +#
> +# Determine whether samba can share
> +# any content read only.
> +#
> +samba_export_all_ro = false
> +
> +#
> +# Determine whether samba can share any
> +# content readable and writable.
> +#
> +samba_export_all_rw = false
> +
> +#
> +# Determine whether samba can
> +# run unconfined scripts.
> +#
> +samba_run_unconfined = false
> +
> +#
> +# Determine whether samba can
> +# use nfs file systems.
> +#
> +samba_share_nfs = false
> +
> +#
> +# Determine whether samba can
> +# use fuse file systems.
> +#
> +samba_share_fusefs = false
> +
> +#
> +# Determine whether sanlock can use
> +# nfs file systems.
> +#
> +sanlock_use_nfs = false
> +
> +#
> +# Determine whether sanlock can use
> +# cifs file systems.
> +#
> +sanlock_use_samba = false
> +
> +#
> +# Determine whether sasl can
> +# read shadow files.
> +#
> +allow_saslauthd_read_shadow = false
> +
> +#
> +# Determine whether smartmon can support
> +# devices on 3ware controllers.
> +#
> +smartmon_3ware = false
> +
> +#
> +# Determine whether spamassassin
> +# clients can use the network.
> +#
> +spamassassin_can_network = false
> +
> +#
> +# Determine whether spamd can manage
> +# generic user home content.
> +#
> +spamd_enable_home_dirs = false
> +
> +#
> +# Determine whether squid can
> +# connect to all TCP ports.
> +#
> +squid_connect_any = false
> +
> +#
> +# Determine whether squid can run
> +# as a transparent proxy.
> +#
> +squid_use_tproxy = false
> +
> +#
> +# Determine whether telepathy connection
> +# managers can connect to generic tcp ports.
> +#
> +telepathy_tcp_connect_generic_network_ports = false
> +
> +#
> +# Determine whether telepathy connection
> +# managers can connect to any port.
> +#
> +telepathy_connect_all_ports = false
> +
> +#
> +# Determine whether tftp can modify
> +# public files used for public file
> +# transfer services. Directories/Files must
> +# be labeled public_content_rw_t.
> +#
> +tftp_anon_write = false
> +
> +#
> +# Determine whether tftp can manage
> +# generic user home content.
> +#
> +tftp_enable_homedir = false
> +
> +#
> +# Determine whether tor can bind
> +# tcp sockets to all unreserved ports.
> +#
> +tor_bind_all_unreserved_ports = false
> +
> +#
> +# Determine whether varnishd can
> +# use the full TCP network.
> +#
> +varnishd_connect_any = false
> +
> +#
> +# Determine whether attempts by
> +# vbetool to mmap low regions should
> +# be silently blocked.
> +#
> +vbetool_mmap_zero_ignore = false
> +
> +#
> +# Determine whether confined virtual guests
> +# can use serial/parallel communication ports.
> +#
> +virt_use_comm = false
> +
> +#
> +# Determine whether confined virtual guests
> +# can use executable memory and can make
> +# their stack executable.
> +#
> +virt_use_execmem = false
> +
> +#
> +# Determine whether confined virtual guests
> +# can use fuse file systems.
> +#
> +virt_use_fusefs = false
> +
> +#
> +# Determine whether confined virtual guests
> +# can use nfs file systems.
> +#
> +virt_use_nfs = false
> +
> +#
> +# Determine whether confined virtual guests
> +# can use cifs file systems.
> +#
> +virt_use_samba = false
> +
> +#
> +# Determine whether confined virtual guests
> +# can manage device configuration.
> +#
> +virt_use_sysfs = false
> +
> +#
> +# Determine whether confined virtual guests
> +# can use usb devices.
> +#
> +virt_use_usb = false
> +
> +#
> +# Determine whether confined virtual guests
> +# can interact with xserver.
> +#
> +virt_use_xserver = false
> +
> +#
> +# Determine whether confined virtual guests
> +# can use vfio for pci device pass through (vt-d).
> +#
> +virt_use_vfio = false
> +
> +#
> +# Determine whether webadm can
> +# manage generic user files.
> +#
> +webadm_manage_user_files = false
> +
> +#
> +# Determine whether webadm can
> +# read generic user files.
> +#
> +webadm_read_user_files = false
> +
> +#
> +# Determine whether attempts by
> +# wine to mmap low regions should
> +# be silently blocked.
> +#
> +wine_mmap_zero_ignore = false
> +
> +#
> +# Determine whether xend can
> +# run blktapctrl and tapdisk.
> +#
> +xend_run_blktap = false
> +
> +#
> +# Determine whether xen can
> +# use fusefs file systems.
> +#
> +xen_use_fusefs = false
> +
> +#
> +# Determine whether xen can
> +# use nfs file systems.
> +#
> +xen_use_nfs = false
> +
> +#
> +# Determine whether xen can
> +# use samba file systems.
> +#
> +xen_use_samba = false
> +
> +#
> +# Determine whether xguest can
> +# mount removable media.
> +#
> +xguest_mount_media = false
> +
> +#
> +# Determine whether xguest can
> +# configure network manager.
> +#
> +xguest_connect_network = false
> +
> +#
> +# Determine whether xguest can
> +# use blue tooth devices.
> +#
> +xguest_use_bluetooth = false
> +
> +#
> +# Determine whether zabbix can
> +# connect to all TCP ports
> +#
> +zabbix_can_network = false
> +
> +#
> +# Determine whether zebra daemon can
> +# manage its configuration files.
> +#
> +allow_zebra_write_config = false
> +
> +#
> +# Control the ability to mmap a low area of the address space,
> +# as configured by /proc/sys/kernel/mmap_min_addr.
> +#
> +mmap_low_allowed = false
> +
> +#
> +# Allow sysadm to debug or ptrace all processes.
> +#
> +allow_ptrace = false
> +
> +#
> +# Allow unprived users to execute DDL statement
> +#
> +sepgsql_enable_users_ddl = false
> +
> +#
> +# Allow transmit client label to foreign database
> +#
> +sepgsql_transmit_client_label = false
> +
> +#
> +# Allow database admins to execute DML statement
> +#
> +sepgsql_unconfined_dbadm = false
> +
> +#
> +# allow host key based authentication
> +#
> +allow_ssh_keysign = false
> +
> +#
> +# Allow ssh logins as sysadm_r:sysadm_t
> +#
> +ssh_sysadm_login = false
> +
> +#
> +# Allow ssh to use gpg-agent
> +#
> +ssh_use_gpg_agent = false
> +
> +#
> +# Allows clients to write to the X server shared
> +# memory segments.
> +#
> +allow_write_xshm = false
> +
> +#
> +# Allow xdm logins as sysadm
> +#
> +xdm_sysadm_login = false
> +
> +#
> +# Support X userspace object manager
> +#
> +xserver_object_manager = false
> +
> +#
> +# Allow users to resolve user passwd entries directly from ldap rather then using a sssd server
> +#
> +authlogin_nsswitch_use_ldap = false
> +
> +#
> +# Enable support for upstart as the init program.
> +#
> +init_upstart = false
> +
> +#
> +# Allow racoon to read shadow
> +#
> +racoon_read_shadow = false
> +
> +#
> +# Allow the mount command to mount any directory or file.
> +#
> +allow_mount_anyfile = false
> +
> +#
> +# Enable support for systemd-tmpfiles to manage all non-security files.
> +#
> +systemd_tmpfiles_manage_all = false
> +
> +#
> +# Allow users to connect to mysql
> +#
> +allow_user_mysql_connect = false
> +
> +#
> +# Allow users to connect to PostgreSQL
> +#
> +allow_user_postgresql_connect = false
> +
> +#
> +# Allow regular users direct mouse access
> +#
> +user_direct_mouse = false
> +
> +#
> +# Allow users to read system messages.
> +#
> +user_dmesg = false
> +
> +#
> +# Allow user to r/w files on filesystems
> +# that do not have extended attributes (FAT, CDROM, FLOPPY)
> +#
> +user_rw_noexattrfile = false
> +
> +#
> +# Allow w to display everyone
> +#
> +user_ttyfile_stat = false
> +
> +#
> +# Allow unconfined executables to make their heap memory executable.  Doing this is a really bad idea. Probably indicates a badly coded executable, but could indicate an attack. This executable should be reported in bugzilla
> +#
> +allow_execheap = false
> +
> +#
> +# Allow unconfined executables to map a memory region as both executable and writable, this is dangerous and the executable should be reported in bugzilla")
> +#
> +allow_execmem = false
> +
> +#
> +# Allow all unconfined executables to use libraries requiring text relocation that are not labeled textrel_shlib_t")
> +#
> +allow_execmod = false
> +
> +#
> +# Allow unconfined executables to make their stack executable.  This should never, ever be necessary. Probably indicates a badly coded executable, but could indicate an attack. This executable should be reported in bugzilla")
> +#
> +allow_execstack = false
> +
> +#
> +# Enable polyinstantiated directory support.
> +#
> +allow_polyinstantiation = false
> +
> +#
> +# Allow system to run with NIS
> +#
> +allow_ypbind = false
> +
> +#
> +# Allow logging in and using the system from /dev/console.
> +#
> +console_login = true
> +
> +#
> +# Enable reading of urandom for all domains.
> +#
> +#
> +#
> +#
> +# This should be enabled when all programs
> +# are compiled with ProPolice/SSP
> +# stack smashing protection.  All domains will
> +# be allowed to read from /dev/urandom.
> +#
> +global_ssp = false
> +
> +#
> +# Allow email client to various content.
> +# nfs, samba, removable devices, and user temp
> +# files
> +#
> +mail_read_content = false
> +
> +#
> +# Allow any files/directories to be exported read/write via NFS.
> +#
> +nfs_export_all_rw = false
> +
> +#
> +# Allow any files/directories to be exported read/only via NFS.
> +#
> +nfs_export_all_ro = false
> +
> +#
> +# Support NFS home directories
> +#
> +use_nfs_home_dirs = false
> +
> +#
> +# Support SAMBA home directories
> +#
> +use_samba_home_dirs = false
> +
> +#
> +# Allow users to run TCP servers (bind to ports and accept connection from
> +# the same domain and outside users)  disabling this forces FTP passive mode
> +# and may change other protocols.
> +#
> +user_tcp_server = false
> +
> diff --git a/package/refpolicy/config b/package/refpolicy/config
> new file mode 100644
> index 0000000..5eee807
> --- /dev/null
> +++ b/package/refpolicy/config
> @@ -0,0 +1,8 @@
> +# This file controls the state of SELinux on the system.
> +# SELINUX= can take one of these three values:
> +#     enforcing - SELinux security policy is enforced.
> +#     permissive - SELinux prints warnings instead of enforcing.
> +#     disabled - No SELinux policy is loaded.
> +SELINUX=permissive
> +# SELINUXTYPE= name of the selinux policy to use
> +SELINUXTYPE=refpolicy
> diff --git a/package/refpolicy/modules.conf b/package/refpolicy/modules.conf
> new file mode 100644
> index 0000000..2304dc4
> --- /dev/null
> +++ b/package/refpolicy/modules.conf
> @@ -0,0 +1,430 @@
> +#
> +# This file contains a listing of available modules.
> +# To prevent a module from  being used in policy
> +# creation, set the module name to "off".
> +#
> +# For monolithic policies, modules set to "base" and "module"
> +# will be built into the policy.
> +#
> +# For modular policies, modules set to "base" will be
> +# included in the base module.  "module" will be compiled
> +# as individual loadable modules.
> +#
> +
> +# Layer: kernel
> +# Module: corecommands
> +# Required in base
> +#
> +# Core policy for shells, and generic programs
> +# in /bin, /sbin, /usr/bin, and /usr/sbin.
> +#
> +corecommands = base
> +
> +# Layer: kernel
> +# Module: corenetwork
> +# Required in base
> +#
> +# Policy controlling access to network objects
> +#
> +corenetwork = base
> +
> +# Layer: kernel
> +# Module: devices
> +# Required in base
> +#
> +# Device nodes and interfaces for many basic system devices.
> +#
> +devices = base
> +
> +# Layer: kernel
> +# Module: domain
> +# Required in base
> +#
> +# Core policy for domains.
> +#
> +domain = base
> +
> +# Layer: kernel
> +# Module: files
> +# Required in base
> +#
> +# Basic filesystem types and interfaces.
> +#
> +files = base
> +
> +# Layer: kernel
> +# Module: alsa
> +# Required in base
> +#
> +# alsa types and interfaces.
> +#
> +alsa = base
> +
> +# Layer: kernel
> +# Module: mta
> +# Required in base
> +#
> +# mta types and interfaces.
> +#
> +mta = base
> +
> +# Layer: kernel
> +# Module: apache
> +# Required in base
> +#
> +# apache types and interfaces.
> +#
> +apache = base
> +
> +# Layer: kernel
> +# Module: filesystem
> +# Required in base
> +#
> +# Policy for filesystems.
> +#
> +filesystem = base
> +
> +# Layer: kernel
> +# Module: kernel
> +# Required in base
> +#
> +# Policy for kernel threads, proc filesystem,
> +# and unlabeled processes and objects.
> +#
> +kernel = base
> +
> +# Layer: kernel
> +# Module: mcs
> +# Required in base
> +#
> +# Multicategory security policy
> +#
> +mcs = base
> +
> +# Layer: kernel
> +# Module: mls
> +# Required in base
> +#
> +# Multilevel security policy
> +#
> +mls = base
> +
> +# Layer: kernel
> +# Module: selinux
> +# Required in base
> +#
> +# Policy for kernel security interface, in particular, selinuxfs.
> +#
> +selinux = base
> +
> +# Layer: kernel
> +# Module: terminal
> +# Required in base
> +#
> +# Policy for terminals.
> +#
> +terminal = base
> +
> +# Layer: kernel
> +# Module: ubac
> +# Required in base
> +#
> +# User-based access control policy
> +#
> +ubac = base
> +
> +# Layer: admin
> +# Module: bootloader
> +#
> +# Policy for the kernel modules, kernel image, and bootloader.
> +#
> +bootloader = module
> +
> +# Layer: admin
> +# Module: consoletype
> +#
> +# Determine of the console connected to the controlling terminal.
> +#
> +consoletype = module
> +
> +# Layer: admin
> +# Module: dmesg
> +#
> +# Policy for dmesg.
> +#
> +dmesg = module
> +
> +# Layer: admin
> +# Module: netutils
> +#
> +# Network analysis utilities
> +#
> +netutils = module
> +
> +# Layer: admin
> +# Module: su
> +#
> +# Run shells with substitute user and group
> +#
> +su = module
> +
> +# Layer: admin
> +# Module: sudo
> +#
> +# Execute a command with a substitute user
> +#
> +sudo = module
> +
> +# Layer: admin
> +# Module: usermanage
> +#
> +# Policy for managing user accounts.
> +#
> +usermanage = module
> +
> +# Layer: apps
> +# Module: seunshare
> +#
> +# Filesystem namespacing/polyinstantiation application.
> +#
> +seunshare = module
> +
> +# Layer: kernel
> +# Module: storage
> +#
> +# Policy controlling access to storage devices
> +#
> +storage = module
> +
> +# Layer: roles
> +# Module: auditadm
> +#
> +# Audit administrator role
> +#
> +auditadm = module
> +
> +# Layer: roles
> +# Module: logadm
> +#
> +# Log administrator role
> +#
> +logadm = module
> +
> +# Layer: roles
> +# Module: secadm
> +#
> +# Security administrator role
> +#
> +secadm = module
> +
> +# Layer: roles
> +# Module: staff
> +#
> +# Administrator's unprivileged user role
> +#
> +staff = module
> +
> +# Layer: roles
> +# Module: sysadm
> +#
> +# General system administration role
> +#
> +sysadm = module
> +
> +# Layer: roles
> +# Module: unprivuser
> +#
> +# Generic unprivileged user role
> +#
> +unprivuser = module
> +
> +# Layer: services
> +# Module: postgresql
> +#
> +# PostgreSQL relational database
> +#
> +postgresql = module
> +
> +# Layer: services
> +# Module: ssh
> +#
> +# Secure shell client and server policy.
> +#
> +ssh = module
> +
> +# Layer: services
> +# Module: xserver
> +#
> +# X Windows Server
> +#
> +xserver = module
> +
> +# Layer: system
> +# Module: application
> +#
> +# Policy for user executable applications.
> +#
> +application = module
> +
> +# Layer: system
> +# Module: authlogin
> +#
> +# Common policy for authentication and user login.
> +#
> +authlogin = module
> +
> +# Layer: system
> +# Module: clock
> +#
> +# Policy for reading and setting the hardware clock.
> +#
> +clock = module
> +
> +# Layer: system
> +# Module: fstools
> +#
> +# Tools for filesystem management, such as mkfs and fsck.
> +#
> +fstools = module
> +
> +# Layer: system
> +# Module: getty
> +#
> +# Policy for getty.
> +#
> +getty = module
> +
> +# Layer: system
> +# Module: hostname
> +#
> +# Policy for changing the system host name.
> +#
> +hostname = module
> +
> +# Layer: system
> +# Module: hotplug
> +#
> +# Policy for hotplug system, for supporting the
> +# connection and disconnection of devices at runtime.
> +#
> +hotplug = module
> +
> +# Layer: system
> +# Module: init
> +#
> +# System initialization programs (init and init scripts).
> +#
> +init = module
> +
> +# Layer: system
> +# Module: ipsec
> +#
> +# TCP/IP encryption
> +#
> +ipsec = module
> +
> +# Layer: system
> +# Module: iptables
> +#
> +# Policy for iptables.
> +#
> +iptables = module
> +
> +# Layer: system
> +# Module: libraries
> +#
> +# Policy for system libraries.
> +#
> +libraries = module
> +
> +# Layer: system
> +# Module: locallogin
> +#
> +# Policy for local logins.
> +#
> +locallogin = module
> +
> +# Layer: system
> +# Module: logging
> +#
> +# Policy for the kernel message logger and system logging daemon.
> +#
> +logging = module
> +
> +# Layer: system
> +# Module: lvm
> +#
> +# Policy for logical volume management programs.
> +#
> +lvm = module
> +
> +# Layer: system
> +# Module: miscfiles
> +#
> +# Miscelaneous files.
> +#
> +miscfiles = module
> +
> +# Layer: system
> +# Module: modutils
> +#
> +# Policy for kernel module utilities
> +#
> +modutils = module
> +
> +# Layer: system
> +# Module: mount
> +#
> +# Policy for mount.
> +#
> +mount = module
> +
> +# Layer: system
> +# Module: netlabel
> +#
> +# NetLabel/CIPSO labeled networking management
> +#
> +netlabel = module
> +
> +# Layer: system
> +# Module: selinuxutil
> +#
> +# Policy for SELinux policy and userland applications.
> +#
> +selinuxutil = module
> +
> +# Layer: system
> +# Module: setrans
> +#
> +# SELinux MLS/MCS label translation service.
> +#
> +setrans = module
> +
> +# Layer: system
> +# Module: sysnetwork
> +#
> +# Policy for network configuration: ifconfig and dhcp client.
> +#
> +sysnetwork = module
> +
> +# Layer: system
> +# Module: udev
> +#
> +# Policy for udev.
> +#
> +udev = module
> +
> +# Layer: system
> +# Module: unconfined
> +#
> +# The unconfined domain.
> +#
> +unconfined = module
> +
> +# Layer: system
> +# Module: userdomain
> +#
> +# Policy for user domains
> +#
> +userdomain = module
> +
> diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
> new file mode 100644
> index 0000000..c10de45
> --- /dev/null
> +++ b/package/refpolicy/refpolicy.hash
> @@ -0,0 +1,2 @@
> +#From https://github.com/TresysTechnology/refpolicy/wiki/DownloadRelease
> +sha256 2dd2f45a7132137afe8302805c3b7839739759b9ab73dd1815c01afe34ac99de  refpolicy-2.20151208.tar.bz2
> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> new file mode 100644
> index 0000000..edfda28
> --- /dev/null
> +++ b/package/refpolicy/refpolicy.mk
> @@ -0,0 +1,118 @@
> +################################################################################
> +#
> +# refpolicy
> +#
> +################################################################################
> +
> +REFPOLICY_VERSION = 2.20151208
> +REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
> +REFPOLICY_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/refpolicy/files
> +REFPOLICY_LICENSE = GPLv2
> +REFPOLICY_LICENSE_FILES = COPYING
> +
> +# Cannot use multiple threads to build the reference policy
> +REFPOLICY_MAKE = $(TARGET_MAKE_ENV) $(MAKE1)
> +
> +REFPOLICY_DEPENDENCIES += host-m4 host-checkpolicy host-policycoreutils \
> +       host-setools host-gawk host-python policycoreutils
> +
> +REFPOLICY_INSTALL_STAGING = YES
> +
> +
> +# To apply board specific customizations, create a refpolicy folder in
> +# BR2_GLOBAL_PATCH_DIR.  These patches will be applied after the patches
> +# in package/refpolicy
> +
> +# Passing the HOST_CONFIGURE_OPTS to the target build because all of the
> +# build utilities are expected to be on system. This fools the make files
> +# into using the host built utilities to compile the SELinux policy for
> +# the target.
> +#
> +# Note, the TEST_TOOLCHAIN option will also set the
> +# LD_LIBRARY_PATH at run time.
> +REFPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
> +       TEST_TOOLCHAIN="$(HOST_DIR)"
> +
> +# Build requires python2 to run
> +REFPOLICY_MAKE_ENV = \
> +       PYTHON="$(HOST_DIR)/usr/bin/python2" \
> +       AWK="$(HOST_DIR)/usr/bin/gawk" \
> +       M4="$(HOST_DIR)/usr/bin/m4"
> +
> +
> +ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
> +REFPOLICY_MONOLITHIC = n
> +else
> +REFPOLICY_MONOLITHIC = y
> +endif
> +
> +ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
> +define REFPOLICY_GIT_SUBMODULE_SETUP
> +       rsync -ar $(RSYNC_VCS_EXCLUSIONS) $(REFPOLICY_CONTRIB_DIR)/* \
> +               $(@D)/policy/modules/contrib/
> +endef
> +else
> +REFPOLICY_MODULES_FILE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_MODULES_FILE))
> +define REFPOLICY_CUSTOM_MODULES_CONF
> +       cp $(REFPOLICY_MODULES_FILE) $(@D)/policy/modules.conf
> +endef
> +
> +REFPOLICY_BOOLEAN_FILE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_BOOLEAN_FILE))
> +define REFPOLICY_CUSTOM_BOOLEAN_CONF
> +       cp $(REFPOLICY_BOOLEAN_FILE) $(@D)/policy/booleans.conf
> +endef
> +endif
> +
> +define REFPOLICY_CONFIGURE_CMDS
> +       $(REFPOLICY_GIT_SUBMODULE_SETUP)
> +       # If an external repo is used to build refpolicy, this preserves the
> +       # custom modules.conf which defines the enabled components.
> +       if [ -f $(@D)/policy/modules.conf ]; then \
> +               mv $(@D)/policy/modules.conf $(@D)/modules.conf.bk ; \
> +       fi
> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) bare \
> +               $(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
> +       $(SED) "/TYPE/c\TYPE = $(BR2_PACKAGE_REFPOLICY_TYPE)" $(@D)/build.conf
> +       $(SED) "/MONOLITHIC/c\MONOLITHIC = $(REFPOLICY_MONOLITHIC)" $(@D)/build.conf
> +       $(SED) "/NAME/c\NAME = $(BR2_PACKAGE_REFPOLICY_NAME)" $(@D)/build.conf
> +
> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) conf \
> +               $(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
> +       if [ -f $(@D)/modules.conf.bk ]; then \
> +               echo "[Preserved modules.conf]" ; \
> +               mv $(@D)/modules.conf.bk $(@D)/policy/modules.conf ; \
> +       fi
> +       $(REFPOLICY_CUSTOM_MODULES_CONF)
> +       $(REFPOLICY_CUSTOM_BOOLEAN_CONF)
> +endef
> +
> +define REFPOLICY_INSTALL_STAGING_CMDS
> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install-src install-headers \
> +               install-docs $(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define REFPOLICY_INSTALL_TARGET_CMDS
> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install \
> +               $(REFPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
> +       $(INSTALL) -m 0755 -D package/refpolicy/config $(TARGET_DIR)/etc/selinux/config
> +       $(SED) "/^SELINUXTYPE/c\SELINUXTYPE=$(BR2_PACKAGE_REFPOLICY_NAME)" \
> +               $(TARGET_DIR)/etc/selinux/config
> +       $(SED) "/^SELINUX=/c\SELINUX=$(BR2_PACKAGE_REFPOLICY_STATE)" \
> +               $(TARGET_DIR)/etc/selinux/config
> +       touch $(TARGET_DIR)/.autorelabel
> +       $(RM) $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/booleans
> +endef
> +
> +define REFPOLICY_INSTALL_INIT_SYSV
> +       $(INSTALL) -m 0755 -D package/refpolicy/S00selinux \
> +               $(TARGET_DIR)/etc/init.d/S00selinux
> +endef
> +
> +ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
> +$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/policy
> +$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/modules/active/modules
> +$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/contexts/files
> +touch $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/contexts/files/file_contexts.local
> +endif
> +
> +$(eval $(generic-package))
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
