From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 25 Sep 2013 14:32:50 -0500
Subject: [Buildroot] [PATCH v3 15/16] refpolicy: new package
In-Reply-To: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1380137571-688-16-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v2 -> v3:
  - Changes patch naming convention (suggested by Thomas).
  - Added dependencies on BR2_TOOLCHAIN_HAS_THREADS and BR2_LARGEFILE (suggested by Thomas).
  - Removed configure option for a specific patch folder (suggested by Thomas).
  - Removed distribution configuration option (suggested by Thomas).
  - Changed the monolithic configuration option to a modular configuration option (suggested by Thomas).
  - Removed the refpolicy name option (suggested by Thomas).
  - Corrected gramatical and comment errors (suggested by Thomas).
  - Multiple style corrections to the mk file (suggested by Thomas).
  - Added a comment to clairfy the usage of the the host build options for a target build.
Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format.
  - Fixed the patch naming to match the standard 4 digit numbering.
  - Changed package dependencies into selects in the config.

 package/Config.in                                  |    1 +
 package/refpolicy/Config.in                        |   58 +
 package/refpolicy/S12selinux                       |  134 +++
 package/refpolicy/config                           |    8 +
 .../refpolicy-0001-gentoo-hardened-fixes.patch     | 1250 ++++++++++++++++++++
 package/refpolicy/refpolicy.mk                     |   80 ++
 6 files changed, 1531 insertions(+), 0 deletions(-)
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/S12selinux
 create mode 100755 package/refpolicy/config
 create mode 100644 package/refpolicy/refpolicy-0001-gentoo-hardened-fixes.patch
 create mode 100644 package/refpolicy/refpolicy.mk

diff --git a/package/Config.in b/package/Config.in
index 538a791..dfe6dc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -921,6 +921,7 @@ endmenu
 
 menu "Security"
 source "package/policycoreutils/Config.in"
+source "package/refpolicy/Config.in"
 source "package/sepolgen/Config.in"
 source "package/setools/Config.in"
 endmenu
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
new file mode 100644
index 0000000..ee54889
--- /dev/null
+++ b/package/refpolicy/Config.in
@@ -0,0 +1,58 @@
+config BR2_PACKAGE_REFPOLICY
+	bool "refpolicy"
+	select BR2_PACKAGE_POLICYCOREUTILS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
+	help
+	  The SELinux Reference Policy project (refpolicy) is a 
+	  complete SELinux policy that can be used as the system 
+	  policy for a variety of systems and used as the basis 
+	  for creating other policies. Reference Policy was originally 
+	  based on the NSA example policy, but aims to accomplish 
+	  many additional goals. 
+	  
+	  The current refpolicy does not fully support Buildroot
+	  and needs modifications to work with the default system
+	  file layout.  These changes should be added as patches to
+	  the refpolicy that modify a single SELinux policy.
+
+comment "refpolicy support requires a toolchain with large file and threading support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+
+if BR2_PACKAGE_REFPOLICY
+
+choice
+	prompt "SELinux policy type"
+	default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+
+	config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+		bool "Standard"
+		help
+		  Standard SELinux policy
+	
+	config BR2_PACKAGE_REFPOLICY_TYPE_MCS
+		bool "MCS"
+		help
+		  SELinux policy with multi-catagory support
+	
+	config BR2_PACKAGE_REFPOLICY_TYPE_MLS
+		bool "MLS"
+		help
+		  SELinux policy with multi-catagory and multi-level support
+endchoice
+
+config BR2_PACKAGE_REFPOLICY_TYPE
+	string
+	default "standard" if BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+	default "mcs" if BR2_PACKAGE_REFPOLICY_TYPE_MCS
+	default "mls" if BR2_PACKAGE_REFPOLICY_TYPE_MLS
+
+config BR2_PACKAGE_REFPOLICY_MODULAR
+	bool "Build a modular SELinux policy"
+	help
+	  Select Y to build a modular SELinux policy. By default,
+	  a monolithing policy will be built to save space on the
+	  target. A modular policy can also be built if policies
+	  need to be modified without reloading the target.
+
+endif
diff --git a/package/refpolicy/S12selinux b/package/refpolicy/S12selinux
new file mode 100644
index 0000000..0ceea97
--- /dev/null
+++ b/package/refpolicy/S12selinux
@@ -0,0 +1,134 @@
+#!/bin/sh
+################################################################################
+#
+# This file labels the security contexts of memory based filesystems such as
+# /dev/ and checks for auto relabel request if '/.autorelabel' file exists.
+# The 'stop' argument drops the security mode to 'permissive'.
+#
+# This script is a heavily stripped down and modified version of the one used
+# in CentOS 6.2
+#
+################################################################################
+
+failed()
+{
+   echo $1
+   exit 1
+}
+
+setup_selinux() {
+   # Get SELinux config env vars
+   . /etc/selinux/config || failed "Failed to source the SELinux config"
+
+   # Create required directories
+   mkdir -p /etc/selinux/${SELINUXTYPE}/policy/ || 
+         failed "Failed to create the policy folder"
+   mkdir -p /etc/selinux/${SELINUXTYPE}/modules/active/modules || \
+         failed "Failed to create the modules folder"
+   if [ ! -f /etc/selinux/${SELINUXTYPE}/contexts/files/file_contexts.local ]
+   then
+      touch /etc/selinux/${SELINUXTYPE}/contexts/files/file_contexts.local || \
+            failed "Failed to create the file_contexts.local file"
+   fi
+   
+   # Install modules
+   semodule -v -s ${SELINUXTYPE} -b /usr/share/selinux/${SELINUXTYPE}/base.pp \
+         -i $(ls /usr/share/selinux/${SELINUXTYPE}/*.pp | grep -v base) || \
+         failed "Failed to install the base policy"
+   
+   # Load the policy to activate it
+   load_policy -i || failed "Failed to load the SELinux policy"
+}
+
+relabel_selinux() {
+   # if /sbin/init is not labeled correctly this process is running in the
+   # wrong context, so a reboot will be required after relabel
+   AUTORELABEL=
+
+   # Get SELinux config env vars
+   . /etc/selinux/config || failed "Failed to source the SELinux config"
+
+   # Switch to Permissive mode
+   echo "0" > /selinux/enforce || failed "Failed to disable enforcing mode"
+
+   echo
+   echo "*** Warning -- SELinux ${SELINUXTYPE} policy relabel is required."
+   echo "*** Relabeling could take a very long time, depending on file"
+   echo "*** system size and speed of hard drives."
+
+   # Relabel mount points
+   restorecon $(awk '!/^#/ && $4 !~ /noauto/ && $2 ~ /^\// { print $2 }' /etc/fstab) \
+         >/dev/null 2>&1 || failed "Failed to relabel the mount points"
+   
+   # Relabel file system
+   echo "Relabeling file systems"
+   restorecon -R -F / || failed "Failed to relabel the file system"
+
+   # Remove label
+   rm -f  /.autorelabel || failed "Failed to remove the autorelabel flag"
+   
+   # Reboot to activate relabeled file system
+   echo "Automatic reboot in progress."
+   reboot -f
+}
+
+start() {
+   echo -n "Initializing SELinux: "
+
+   # Check to see if the default policy has been installed
+   if [ "`sestatus | grep "SELinux status" | grep enabled`" == "" ]; then
+      setup_selinux
+   fi
+
+   # Check SELinux status
+   SELINUX_STATE=
+   if [ -e "/selinux/enforce" ] && [ "$(cat /proc/self/attr/current)" != "kernel" ]; then
+      if [ -r "/selinux/enforce" ] ; then
+         SELINUX_STATE=$(cat "/selinux/enforce")
+      else
+         # assume enforcing if you can't read it
+         SELINUX_STATE=1
+      fi
+   fi
+
+   # Context Label /dev/
+   if [ -n "$SELINUX_STATE" -a -x /sbin/restorecon ] && fgrep " /dev " /proc/mounts >/dev/null 2>&1 ; then
+      /sbin/restorecon -R -F /dev 2>/dev/null
+   fi
+
+   # Context Label tmpfs mounts
+   if [ -n "$SELINUX_STATE" -a -x /sbin/restorecon ]; then
+      /sbin/restorecon -R -F $(awk '!/^#/ && $4 !~ /noauto/ && $2 ~ /^\// && $3 =="tmpfs" { print $2 }' /etc/fstab) >/dev/null 2>&1
+   fi
+
+   # Clean up SELinux labels
+   if [ -n "$SELINUX_STATE" -a -x /sbin/restorecon ]; then
+      restorecon -F /etc/mtab /etc/ld.so.cache /etc/resolv.conf >/dev/null 2>&1
+   fi
+
+   # Check for filesystem relabel request
+   if [ -f /.autorelabel ] ; then
+      relabel_selinux
+   fi
+
+   echo "OK"
+}  
+stop() {
+   # There is nothing to do
+   echo "OK" 
+}
+
+case "$1" in
+   start)
+      start
+      ;;
+   stop)
+      stop
+      ;;
+   *)
+      echo "Usage: $0 {start|stop}"
+      exit 1
+      ;;
+esac
+
+exit $?
diff --git a/package/refpolicy/config b/package/refpolicy/config
new file mode 100755
index 0000000..5eee807
--- /dev/null
+++ b/package/refpolicy/config
@@ -0,0 +1,8 @@
+# This file controls the state of SELinux on the system.
+# SELINUX= can take one of these three values:
+#     enforcing - SELinux security policy is enforced.
+#     permissive - SELinux prints warnings instead of enforcing.
+#     disabled - No SELinux policy is loaded.
+SELINUX=permissive
+# SELINUXTYPE= name of the selinux policy to use
+SELINUXTYPE=refpolicy
diff --git a/package/refpolicy/refpolicy-0001-gentoo-hardened-fixes.patch b/package/refpolicy/refpolicy-0001-gentoo-hardened-fixes.patch
new file mode 100644
index 0000000..c1c398f
--- /dev/null
+++ b/package/refpolicy/refpolicy-0001-gentoo-hardened-fixes.patch
@@ -0,0 +1,1250 @@
+From: Dominick Grift <dominick.grift@gmail.com>
+Date: Fri, 16 Aug 2013 07:07:37 +0000 (+0200)
+Subject: Fix monolithic built
+X-Git-Url: http://git.overlays.gentoo.org/gitweb/?p=proj%2Fhardened-refpolicy.git;a=commitdiff_plain;h=86500de7
+
+Fix monolithic built
+
+Make unconfined_cronjob_t declaration mandatory, because else monolithic
+built fails due to duplicate declaration
+
+Deprecate kerberos_keytab_template:
+
+Keytab type declarations have to be mandatory, because else monolithic
+built fails due to out-of-scope
+
+This keytab solution does not make sense in its current implementation,
+as many corresponding file context specs are missing, and there are no
+type transtion rules
+
+Replaced two deprecated interface calls
+
+Signed-off-by: Dominick Grift <dominick.grift@gmail.com>
+---
+
+diff --git a/policy/modules/contrib/apache.if b/policy/modules/contrib/apache.if
+index a1d1131..655cbe1 100644
+--- a/policy/modules/contrib/apache.if
++++ b/policy/modules/contrib/apache.if
+@@ -1203,9 +1203,9 @@ interface(`apache_admin',`
+ 		attribute httpd_script_domains, httpd_htaccess_type;
+ 		type httpd_t, httpd_config_t, httpd_log_t;
+ 		type httpd_modules_t, httpd_lock_t, httpd_helper_t;
+-		type httpd_var_run_t, httpd_keytab_t, httpd_passwd_t;
++		type httpd_var_run_t, httpd_passwd_t, httpd_suexec_t;
+ 		type httpd_suexec_tmp_t, httpd_tmp_t, httpd_rotatelogs_t;
+-		type httpd_initrc_exec_t, httpd_suexec_t;
++		type httpd_initrc_exec_t, httpd_keytab_t;
+ 	')
+ 
+ 	allow $1 { httpd_script_domains httpd_t httpd_helper_t }:process { ptrace signal_perms };
+@@ -1222,7 +1222,7 @@ interface(`apache_admin',`
+ 	miscfiles_manage_public_files($1)
+ 
+ 	files_search_etc($1)
+-	admin_pattern($1, { httpd_config_t httpd_keytab_t })
++	admin_pattern($1, { httpd_keytab_t httpd_config_t })
+ 
+ 	logging_search_logs($1)
+ 	admin_pattern($1, httpd_log_t)
+diff --git a/policy/modules/contrib/apache.te b/policy/modules/contrib/apache.te
+index 0da7cc3..99bb9b5 100644
+--- a/policy/modules/contrib/apache.te
++++ b/policy/modules/contrib/apache.te
+@@ -1,4 +1,4 @@
+-policy_module(apache, 2.7.0)
++policy_module(apache, 2.7.1)
+ 
+ ########################################
+ #
+@@ -283,6 +283,9 @@ role httpd_helper_roles types httpd_helper_t;
+ type httpd_initrc_exec_t;
+ init_script_file(httpd_initrc_exec_t)
+ 
++type httpd_keytab_t;
++files_type(httpd_keytab_t)
++
+ type httpd_lock_t;
+ files_lock_file(httpd_lock_t)
+ 
+@@ -391,6 +394,8 @@ allow httpd_t httpd_config_t:dir list_dir_perms;
+ read_files_pattern(httpd_t, httpd_config_t, httpd_config_t)
+ read_lnk_files_pattern(httpd_t, httpd_config_t, httpd_config_t)
+ 
++allow httpd_t httpd_keytab_t:file read_file_perms;
++
+ allow httpd_t httpd_lock_t:file manage_file_perms;
+ files_lock_filetrans(httpd_t, httpd_lock_t, file)
+ 
+@@ -781,10 +786,11 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(httpd, httpd_t)
+ 	kerberos_manage_host_rcache(httpd_t)
++	kerberos_read_keytab(httpd_t)
+ 	kerberos_tmp_filetrans_host_rcache(httpd_t, file, "HTTP_23")
+ 	kerberos_tmp_filetrans_host_rcache(httpd_t, file, "HTTP_48")
++	kerberos_use(httpd_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/automount.if b/policy/modules/contrib/automount.if
+index 089430a..f24e369 100644
+--- a/policy/modules/contrib/automount.if
++++ b/policy/modules/contrib/automount.if
+@@ -153,6 +153,7 @@ interface(`automount_admin',`
+ 	gen_require(`
+ 		type automount_t, automount_lock_t, automount_tmp_t;
+ 		type automount_var_run_t, automount_initrc_exec_t;
++		type automount_keytab_t;
+ 	')
+ 
+ 	allow $1 automount_t:process { ptrace signal_perms };
+@@ -163,6 +164,9 @@ interface(`automount_admin',`
+ 	role_transition $2 automount_initrc_exec_t system_r;
+ 	allow $2 system_r;
+ 
++	files_list_etc($1)
++	admin_pattern($1, automount_keytab_t)
++
+ 	files_list_var($1)
+ 	admin_pattern($1, automount_lock_t)
+ 
+diff --git a/policy/modules/contrib/automount.te b/policy/modules/contrib/automount.te
+index d4e58ea..27d2f40 100644
+--- a/policy/modules/contrib/automount.te
++++ b/policy/modules/contrib/automount.te
+@@ -1,4 +1,4 @@
+-policy_module(automount, 1.14.0)
++policy_module(automount, 1.14.1)
+ 
+ ########################################
+ #
+@@ -12,8 +12,8 @@ init_daemon_domain(automount_t, automount_exec_t)
+ type automount_initrc_exec_t;
+ init_script_file(automount_initrc_exec_t)
+ 
+-type automount_var_run_t;
+-files_pid_file(automount_var_run_t)
++type automount_keytab_t;
++files_type(automount_keytab_t)
+ 
+ type automount_lock_t;
+ files_lock_file(automount_lock_t)
+@@ -22,6 +22,9 @@ type automount_tmp_t;
+ files_tmp_file(automount_tmp_t)
+ files_mountpoint(automount_tmp_t)
+ 
++type automount_var_run_t;
++files_pid_file(automount_var_run_t)
++
+ ########################################
+ #
+ # Local policy
+@@ -36,6 +39,8 @@ allow automount_t self:rawip_socket create_socket_perms;
+ 
+ can_exec(automount_t, automount_exec_t)
+ 
++allow automount_t automount_keytab_t:file read_file_perms;
++
+ allow automount_t automount_lock_t:file manage_file_perms;
+ files_lock_filetrans(automount_t, automount_lock_t, file)
+ 
+@@ -143,8 +148,9 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(automount, automount_t)
+ 	kerberos_read_config(automount_t)
++	kerberos_read_keytab(automount_t)
++	kerberos_use(automount_t)
+ 	kerberos_dontaudit_write_config(automount_t)
+ ')
+ 
+diff --git a/policy/modules/contrib/bind.if b/policy/modules/contrib/bind.if
+index 866a1e2..531a8f2 100644
+--- a/policy/modules/contrib/bind.if
++++ b/policy/modules/contrib/bind.if
+@@ -364,6 +364,7 @@ interface(`bind_admin',`
+ 		type named_t, named_tmp_t, named_log_t;
+ 		type named_cache_t, named_zone_t, named_initrc_exec_t;
+ 		type dnssec_t, ndc_t, named_conf_t, named_var_run_t;
++		type named_keytab_t;
+ 	')
+ 
+ 	allow $1 { named_t ndc_t }:process { ptrace signal_perms };
+@@ -381,7 +382,7 @@ interface(`bind_admin',`
+ 	admin_pattern($1, named_log_t)
+ 
+ 	files_list_etc($1)
+-	admin_pattern($1, named_conf_t)
++	admin_pattern($1, { named_keytab_t named_conf_t })
+ 
+ 	files_list_var($1)
+ 	admin_pattern($1, { dnssec_t named_cache_t named_zone_t })
+diff --git a/policy/modules/contrib/bind.te b/policy/modules/contrib/bind.te
+index b01e493..1241123 100644
+--- a/policy/modules/contrib/bind.te
++++ b/policy/modules/contrib/bind.te
+@@ -1,4 +1,4 @@
+-policy_module(bind, 1.13.0)
++policy_module(bind, 1.13.1)
+ 
+ ########################################
+ #
+@@ -44,6 +44,9 @@ files_type(named_cache_t)
+ type named_initrc_exec_t;
+ init_script_file(named_initrc_exec_t)
+ 
++type named_keytab_t;
++files_type(named_keytab_t)
++
+ type named_log_t;
+ logging_log_file(named_log_t)
+ 
+@@ -84,7 +87,7 @@ read_lnk_files_pattern(named_t, named_conf_t, named_conf_t)
+ manage_files_pattern(named_t, named_cache_t, named_cache_t)
+ manage_lnk_files_pattern(named_t, named_cache_t, named_cache_t)
+ 
+-can_exec(named_t, named_exec_t)
++allow named_t named_keytab_t:file read_file_perms;
+ 
+ append_files_pattern(named_t, named_log_t, named_log_t)
+ create_files_pattern(named_t, named_log_t, named_log_t)
+@@ -100,6 +103,8 @@ manage_files_pattern(named_t, named_var_run_t, named_var_run_t)
+ manage_sock_files_pattern(named_t, named_var_run_t, named_var_run_t)
+ files_pid_filetrans(named_t, named_var_run_t, { dir file sock_file })
+ 
++can_exec(named_t, named_exec_t)
++
+ allow named_t named_zone_t:dir list_dir_perms;
+ read_files_pattern(named_t, named_zone_t, named_zone_t)
+ read_lnk_files_pattern(named_t, named_zone_t, named_zone_t)
+@@ -182,7 +187,8 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(named, named_t)
++	kerberos_read_keytab(named_t)
++	kerberos_use(named_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/cron.te b/policy/modules/contrib/cron.te
+index d865049..41bb279 100644
+--- a/policy/modules/contrib/cron.te
++++ b/policy/modules/contrib/cron.te
+@@ -1,4 +1,4 @@
+-policy_module(cron, 2.6.0)
++policy_module(cron, 2.6.1)
+ 
+ gen_require(`
+ 	class passwd rootok;
+@@ -701,22 +701,22 @@ optional_policy(`
+ # Unconfined local policy
+ #
+ 
+-optional_policy(`
+-	type unconfined_cronjob_t;
+-	domain_type(unconfined_cronjob_t)
+-	domain_cron_exemption_target(unconfined_cronjob_t)
++type unconfined_cronjob_t;
++domain_type(unconfined_cronjob_t)
++domain_cron_exemption_target(unconfined_cronjob_t)
+ 
+-	dontaudit crond_t unconfined_cronjob_t:process { noatsecure siginh rlimitinh };
++dontaudit crond_t unconfined_cronjob_t:process { noatsecure siginh rlimitinh };
+ 
+-	unconfined_domain(unconfined_cronjob_t)
++tunable_policy(`cron_userdomain_transition',`
++	dontaudit crond_t unconfined_cronjob_t:process transition;
++	dontaudit crond_t unconfined_cronjob_t:fd use;
++	dontaudit crond_t unconfined_cronjob_t:key manage_key_perms;
++',`
++	allow crond_t unconfined_cronjob_t:process transition;
++	allow crond_t unconfined_cronjob_t:fd use;
++	allow crond_t unconfined_cronjob_t:key manage_key_perms;
++')
+ 
+-	tunable_policy(`cron_userdomain_transition',`
+-		dontaudit crond_t unconfined_cronjob_t:process transition;
+-		dontaudit crond_t unconfined_cronjob_t:fd use;
+-		dontaudit crond_t unconfined_cronjob_t:key manage_key_perms;
+-	',`
+-		allow crond_t unconfined_cronjob_t:process transition;
+-		allow crond_t unconfined_cronjob_t:fd use;
+-		allow crond_t unconfined_cronjob_t:key manage_key_perms;
+-	')
++optional_policy(`
++	unconfined_domain(unconfined_cronjob_t)
+ ')
+diff --git a/policy/modules/contrib/cvs.if b/policy/modules/contrib/cvs.if
+index 9fa7ffb..64775fd 100644
+--- a/policy/modules/contrib/cvs.if
++++ b/policy/modules/contrib/cvs.if
+@@ -59,7 +59,7 @@ interface(`cvs_exec',`
+ interface(`cvs_admin',`
+ 	gen_require(`
+ 		type cvs_t, cvs_tmp_t, cvs_initrc_exec_t;
+-		type cvs_data_t, cvs_var_run_t;
++		type cvs_data_t, cvs_var_run_t, cvs_keytab_t;
+ 	')
+ 
+ 	allow $1 cvs_t:process { ptrace signal_perms };
+@@ -70,6 +70,9 @@ interface(`cvs_admin',`
+ 	role_transition $2 cvs_initrc_exec_t system_r;
+ 	allow $2 system_r;
+ 
++	files_search_etc($1)
++	admin_pattern($1, cvs_keytab_t)
++
+ 	files_list_tmp($1)
+ 	admin_pattern($1, cvs_tmp_t)
+ 
+diff --git a/policy/modules/contrib/cvs.te b/policy/modules/contrib/cvs.te
+index 6c544e5..17df324 100644
+--- a/policy/modules/contrib/cvs.te
++++ b/policy/modules/contrib/cvs.te
+@@ -1,4 +1,4 @@
+-policy_module(cvs, 1.10.0)
++policy_module(cvs, 1.10.1)
+ 
+ ########################################
+ #
+@@ -24,6 +24,9 @@ files_type(cvs_data_t)
+ type cvs_initrc_exec_t;
+ init_script_file(cvs_initrc_exec_t)
+ 
++type cvs_keytab_t;
++files_type(cvs_keytab_t)
++
+ type cvs_tmp_t;
+ files_tmp_file(cvs_tmp_t)
+ 
+@@ -44,6 +47,8 @@ manage_dirs_pattern(cvs_t, cvs_data_t, cvs_data_t)
+ manage_files_pattern(cvs_t, cvs_data_t, cvs_data_t)
+ manage_lnk_files_pattern(cvs_t, cvs_data_t, cvs_data_t)
+ 
++allow cvs_t cvs_keytab_t:file read_file_perms;
++
+ manage_dirs_pattern(cvs_t, cvs_tmp_t, cvs_tmp_t)
+ manage_files_pattern(cvs_t, cvs_tmp_t, cvs_tmp_t)
+ files_tmp_filetrans(cvs_t, cvs_tmp_t, { dir file })
+@@ -87,8 +92,9 @@ tunable_policy(`allow_cvs_read_shadow',`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(cvs, cvs_t)
+ 	kerberos_read_config(cvs_t)
++	kerberos_read_keytab(cvs_t)
++	kerberos_use(cvs_t)
+ 	kerberos_dontaudit_write_config(cvs_t)
+ ')
+ 
+diff --git a/policy/modules/contrib/cyrus.if b/policy/modules/contrib/cyrus.if
+index 6508280..83bfda6 100644
+--- a/policy/modules/contrib/cyrus.if
++++ b/policy/modules/contrib/cyrus.if
+@@ -61,6 +61,7 @@ interface(`cyrus_admin',`
+ 	gen_require(`
+ 		type cyrus_t, cyrus_tmp_t, cyrus_var_lib_t;
+ 		type cyrus_var_run_t, cyrus_initrc_exec_t;
++		type cyrus_keytab_t;
+ 	')
+ 
+ 	allow $1 cyrus_t:process { ptrace signal_perms };
+@@ -71,6 +72,9 @@ interface(`cyrus_admin',`
+ 	role_transition $2 cyrus_initrc_exec_t system_r;
+ 	allow $2 system_r;
+ 
++	files_list_etc($1)
++	admin_pattern($1, cyrus_keytab_t)
++
+ 	files_list_tmp($1)
+ 	admin_pattern($1, cyrus_tmp_t)
+ 
+diff --git a/policy/modules/contrib/cyrus.te b/policy/modules/contrib/cyrus.te
+index 0cef3ef..4283f2d 100644
+--- a/policy/modules/contrib/cyrus.te
++++ b/policy/modules/contrib/cyrus.te
+@@ -1,4 +1,4 @@
+-policy_module(cyrus, 1.13.0)
++policy_module(cyrus, 1.13.1)
+ 
+ ########################################
+ #
+@@ -12,6 +12,9 @@ init_daemon_domain(cyrus_t, cyrus_exec_t)
+ type cyrus_initrc_exec_t;
+ init_script_file(cyrus_initrc_exec_t)
+ 
++type cyrus_keytab_t;
++files_type(cyrus_keytab_t)
++
+ type cyrus_tmp_t;
+ files_tmp_file(cyrus_tmp_t)
+ 
+@@ -41,6 +44,8 @@ allow cyrus_t self:unix_dgram_socket sendto;
+ allow cyrus_t self:unix_stream_socket { accept connectto listen };
+ allow cyrus_t self:tcp_socket { accept listen };
+ 
++allow cyrus_t cyrus_keytab_t:file read_file_perms;
++
+ manage_dirs_pattern(cyrus_t, cyrus_tmp_t, cyrus_tmp_t)
+ manage_files_pattern(cyrus_t, cyrus_tmp_t, cyrus_tmp_t)
+ files_tmp_filetrans(cyrus_t, cyrus_tmp_t, { dir file })
+@@ -116,7 +121,8 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(cyrus, cyrus_t)
++	kerberos_read_keytab(cyrus_t)
++	kerberos_use(cyrus_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/dovecot.if b/policy/modules/contrib/dovecot.if
+index dbcac59..d5badb7 100644
+--- a/policy/modules/contrib/dovecot.if
++++ b/policy/modules/contrib/dovecot.if
+@@ -143,6 +143,7 @@ interface(`dovecot_admin',`
+ 		type dovecot_spool_t, dovecot_var_lib_t, dovecot_initrc_exec_t;
+ 		type dovecot_var_run_t, dovecot_cert_t, dovecot_passwd_t;
+ 		type dovecot_tmp_t, dovecot_auth_tmp_t, dovecot_deliver_tmp_t;
++		type dovecot_keytab_t;
+ 	')
+ 
+ 	allow $1 dovecot_t:process { ptrace signal_perms };
+@@ -154,7 +155,7 @@ interface(`dovecot_admin',`
+ 	allow $2 system_r;
+ 
+ 	files_list_etc($1)
+-	admin_pattern($1, dovecot_etc_t)
++	admin_pattern($1, { dovecot_keytab_t dovecot_etc_t })
+ 
+ 	logging_list_logs($1)
+ 	admin_pattern($1, dovecot_var_log_t)
+diff --git a/policy/modules/contrib/dovecot.te b/policy/modules/contrib/dovecot.te
+index 3a6e733..0aabc7e 100644
+--- a/policy/modules/contrib/dovecot.te
++++ b/policy/modules/contrib/dovecot.te
+@@ -1,4 +1,4 @@
+-policy_module(dovecot, 1.16.0)
++policy_module(dovecot, 1.16.1)
+ 
+ ########################################
+ #
+@@ -38,6 +38,9 @@ files_config_file(dovecot_etc_t)
+ type dovecot_initrc_exec_t;
+ init_script_file(dovecot_initrc_exec_t)
+ 
++type dovecot_keytab_t;
++files_type(dovecot_keytab_t)
++
+ type dovecot_passwd_t;
+ files_type(dovecot_passwd_t)
+ 
+@@ -99,6 +102,8 @@ allow dovecot_t dovecot_cert_t:dir list_dir_perms;
+ allow dovecot_t dovecot_cert_t:file read_file_perms;
+ allow dovecot_t dovecot_cert_t:lnk_file read_lnk_file_perms;
+ 
++allow dovecot_t dovecot_keytab_t:file read_file_perms;
++
+ manage_dirs_pattern(dovecot_t, dovecot_tmp_t, dovecot_tmp_t)
+ manage_files_pattern(dovecot_t, dovecot_tmp_t, dovecot_tmp_t)
+ files_tmp_filetrans(dovecot_t, dovecot_tmp_t, { file dir })
+@@ -182,9 +187,10 @@ tunable_policy(`use_samba_home_dirs',`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(dovecot, dovecot_t)
+ 	kerberos_manage_host_rcache(dovecot_t)
++	kerberos_read_keytab(dovecot_t)
+ 	kerberos_tmp_filetrans_host_rcache(dovecot_t, file, "imap_0")
++	kerberos_use(dovecot_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/exim.if b/policy/modules/contrib/exim.if
+index 6041113..94a8269 100644
+--- a/policy/modules/contrib/exim.if
++++ b/policy/modules/contrib/exim.if
+@@ -244,6 +244,7 @@ interface(`exim_admin',`
+ 	gen_require(`
+ 		type exim_t, exim_spool_t, exim_log_t;
+ 		type exim_var_run_t, exim_initrc_exec_t, exim_tmp_t;
++		type exim_keytab_t;
+ 	')
+ 
+ 	allow $1 exim_t:process { ptrace signal_perms };
+@@ -254,6 +255,9 @@ interface(`exim_admin',`
+ 	role_transition $2 exim_initrc_exec_t system_r;
+ 	allow $2 system_r;
+ 
++	files_search_etc($1)
++	admin_pattern($1, exim_keytab_t)
++
+ 	files_search_spool($1)
+ 	admin_pattern($1, exim_spool_t)
+ 
+diff --git a/policy/modules/contrib/exim.te b/policy/modules/contrib/exim.te
+index c9c04ee..7e8cf42 100644
+--- a/policy/modules/contrib/exim.te
++++ b/policy/modules/contrib/exim.te
+@@ -1,4 +1,4 @@
+-policy_module(exim, 1.6.0)
++policy_module(exim, 1.6.1)
+ 
+ ########################################
+ #
+@@ -45,6 +45,9 @@ mta_agent_executable(exim_exec_t)
+ type exim_initrc_exec_t;
+ init_script_file(exim_initrc_exec_t)
+ 
++type exim_keytab_t;
++files_type(exim_keytab_t)
++
+ type exim_log_t;
+ logging_log_file(exim_log_t)
+ 
+@@ -68,6 +71,8 @@ allow exim_t self:fifo_file rw_fifo_file_perms;
+ allow exim_t self:unix_stream_socket { accept listen };
+ allow exim_t self:tcp_socket { accept listen };
+ 
++allow exim_t exim_keytab_t:file read_file_perms;
++
+ append_files_pattern(exim_t, exim_log_t, exim_log_t)
+ create_files_pattern(exim_t, exim_log_t, exim_log_t)
+ setattr_files_pattern(exim_t, exim_log_t, exim_log_t)
+@@ -188,7 +193,8 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(exim, exim_t)
++	kerberos_read_keytab(exim_t)
++	kerberos_use(exim_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/ftp.if b/policy/modules/contrib/ftp.if
+index d062080..4498143 100644
+--- a/policy/modules/contrib/ftp.if
++++ b/policy/modules/contrib/ftp.if
+@@ -176,6 +176,7 @@ interface(`ftp_admin',`
+ 		type ftpd_etc_t, ftpd_lock_t, sftpd_t;
+ 		type ftpd_var_run_t, xferlog_t, anon_sftpd_t;
+ 		type ftpd_initrc_exec_t, ftpdctl_tmp_t;
++		type ftpd_keytab_t;
+ 	')
+ 
+ 	allow $1 { ftpd_t ftpdctl_t sftpd_t anon_sftpd }:process { ptrace signal_perms };
+@@ -192,7 +193,7 @@ interface(`ftp_admin',`
+ 	admin_pattern($1, { ftpd_tmp_t ftpdctl_tmp_t })
+ 
+ 	files_list_etc($1)
+-	admin_pattern($1, ftpd_etc_t)
++	admin_pattern($1, { ftpd_etc_t ftpd_keytab_t })
+ 
+ 	files_list_var($1)
+ 	admin_pattern($1, ftpd_lock_t)
+diff --git a/policy/modules/contrib/ftp.te b/policy/modules/contrib/ftp.te
+index 544c512..36838c2 100644
+--- a/policy/modules/contrib/ftp.te
++++ b/policy/modules/contrib/ftp.te
+@@ -1,4 +1,4 @@
+-policy_module(ftp, 1.15.0)
++policy_module(ftp, 1.15.1)
+ 
+ ########################################
+ #
+@@ -124,6 +124,9 @@ files_config_file(ftpd_etc_t)
+ type ftpd_initrc_exec_t;
+ init_script_file(ftpd_initrc_exec_t)
+ 
++type ftpd_keytab_t;
++files_type(ftpd_keytab_t)
++
+ type ftpd_lock_t;
+ files_lock_file(ftpd_lock_t)
+ 
+@@ -176,6 +179,8 @@ allow ftpd_t self:key manage_key_perms;
+ 
+ allow ftpd_t ftpd_etc_t:file read_file_perms;
+ 
++allow ftpd_t ftpd_keytab_t:file read_file_perms;
++
+ allow ftpd_t ftpd_lock_t:file manage_file_perms;
+ files_lock_filetrans(ftpd_t, ftpd_lock_t, file)
+ 
+@@ -359,8 +364,9 @@ optional_policy(`
+ optional_policy(`
+ 	selinux_validate_context(ftpd_t)
+ 
+-	kerberos_keytab_template(ftpd, ftpd_t)
++	kerberos_read_keytab(ftpd_t)
+ 	kerberos_tmp_filetrans_host_rcache(ftpd_t, file, "host_0")
++	kerberos_use(ftpd_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/kerberos.if b/policy/modules/contrib/kerberos.if
+index f9de9fc..f6c00d8 100644
+--- a/policy/modules/contrib/kerberos.if
++++ b/policy/modules/contrib/kerberos.if
+@@ -354,22 +354,7 @@ interface(`kerberos_etc_filetrans_keytab',`
+ ## </param>
+ #
+ template(`kerberos_keytab_template',`
+-
+-	########################################
+-	#
+-	# Declarations
+-	#
+-
+-	type $1_keytab_t;
+-	files_type($1_keytab_t)
+-
+-	########################################
+-	#
+-	# Policy
+-	#
+-
+-	allow $2 $1_keytab_t:file read_file_perms;
+-
++	refpolicywarn(`$0($*) has been deprecated.')
+ 	kerberos_read_keytab($2)
+ 	kerberos_use($2)
+ ')
+diff --git a/policy/modules/contrib/ldap.if b/policy/modules/contrib/ldap.if
+index de2508e..7f09b4a 100644
+--- a/policy/modules/contrib/ldap.if
++++ b/policy/modules/contrib/ldap.if
+@@ -116,7 +116,7 @@ interface(`ldap_admin',`
+ 		type slapd_t, slapd_tmp_t, slapd_replog_t;
+ 		type slapd_lock_t, slapd_etc_t, slapd_var_run_t;
+ 		type slapd_initrc_exec_t, slapd_log_t, slapd_cert_t;
+-		type slapd_db_t;
++		type slapd_db_t, slapd_keytab_t;
+ 	')
+ 
+ 	allow $1 slapd_t:process { ptrace signal_perms };
+@@ -128,7 +128,7 @@ interface(`ldap_admin',`
+ 	allow $2 system_r;
+ 
+ 	files_list_etc($1)
+-	admin_pattern($1, { slapd_etc_t slapd_db_t slapd_cert_t })
++	admin_pattern($1, { slapd_etc_t slapd_db_t slapd_cert_t slapd_keytab_t })
+ 
+ 	files_list_locks($1)
+ 	admin_pattern($1, slapd_lock_t)
+diff --git a/policy/modules/contrib/ldap.te b/policy/modules/contrib/ldap.te
+index 71b00f8..131dc88 100644
+--- a/policy/modules/contrib/ldap.te
++++ b/policy/modules/contrib/ldap.te
+@@ -1,4 +1,4 @@
+-policy_module(ldap, 1.11.0)
++policy_module(ldap, 1.11.1)
+ 
+ ########################################
+ #
+@@ -21,6 +21,9 @@ files_config_file(slapd_etc_t)
+ type slapd_initrc_exec_t;
+ init_script_file(slapd_initrc_exec_t)
+ 
++type slapd_keytab_t;
++files_type(slapd_keytab_t)
++
+ type slapd_lock_t;
+ files_lock_file(slapd_lock_t)
+ 
+@@ -60,6 +63,8 @@ manage_lnk_files_pattern(slapd_t, slapd_db_t, slapd_db_t)
+ 
+ allow slapd_t slapd_etc_t:file read_file_perms;
+ 
++allow slapd_t slapd_keytab_t:file read_file_perms;
++
+ allow slapd_t slapd_lock_t:file manage_file_perms;
+ files_lock_filetrans(slapd_t, slapd_lock_t, file)
+ 
+@@ -131,11 +136,12 @@ ifdef(`distro_gentoo',`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(slapd, slapd_t)
+ 	kerberos_manage_host_rcache(slapd_t)
++	kerberos_read_keytab(slapd_t)
+ 	kerberos_tmp_filetrans_host_rcache(slapd_t, file, "ldapmap1_0")
+ 	kerberos_tmp_filetrans_host_rcache(slapd_t, file, "ldap_487")
+ 	kerberos_tmp_filetrans_host_rcache(slapd_t, file, "ldap_55")
++	kerberos_use(slapd_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/postfix.if b/policy/modules/contrib/postfix.if
+index 6e26d71..8e7d1e7 100644
+--- a/policy/modules/contrib/postfix.if
++++ b/policy/modules/contrib/postfix.if
+@@ -714,6 +714,7 @@ interface(`postfix_admin',`
+ 		type postfix_initrc_exec_t, postfix_prng_t, postfix_etc_t;
+ 		type postfix_data_t, postfix_var_run_t, postfix_public_t;
+ 		type postfix_private_t, postfix_map_tmp_t, postfix_exec_t;
++		type postfix_keytab_t;
+ 	')
+ 
+ 	allow $1 postfix_domain:process { ptrace signal_perms };
+@@ -725,7 +726,7 @@ interface(`postfix_admin',`
+ 	allow $2 system_r;
+ 
+ 	files_search_etc($1)
+-	admin_pattern($1, { postfix_prng_t postfix_etc_t postfix_exec_t })
++	admin_pattern($1, { postfix_prng_t postfix_etc_t postfix_exec_t postfix_keytab_t })
+ 
+ 	files_search_spool($1)
+ 	admin_pattern($1, { postfix_public_t postfix_private_t postfix_spool_type })
+diff --git a/policy/modules/contrib/postfix.te b/policy/modules/contrib/postfix.te
+index 0cb7938..dd7259f 100644
+--- a/policy/modules/contrib/postfix.te
++++ b/policy/modules/contrib/postfix.te
+@@ -1,4 +1,4 @@
+-policy_module(postfix, 1.15.0)
++policy_module(postfix, 1.15.1)
+ 
+ ########################################
+ #
+@@ -36,6 +36,9 @@ files_config_file(postfix_etc_t)
+ type postfix_exec_t;
+ application_executable_file(postfix_exec_t)
+ 
++type postfix_keytab_t;
++files_type(postfix_keytab_t)
++
+ postfix_server_domain_template(local)
+ mta_mailserver_delivery(postfix_local_t)
+ 
+@@ -209,6 +212,8 @@ allow postfix_master_t postfix_etc_t:file rw_file_perms;
+ allow postfix_master_t postfix_data_t:dir manage_dir_perms;
+ allow postfix_master_t postfix_data_t:file manage_file_perms;
+ 
++allow postfix_master_t postfix_keytab_t:file read_file_perms;
++
+ allow postfix_master_t postfix_map_exec_t:file { mmap_file_perms ioctl lock };
+ 
+ allow postfix_master_t { postfix_postdrop_exec_t postfix_postqueue_exec_t }:file getattr_file_perms;
+@@ -314,7 +319,8 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(postfix, postfix_t)
++	kerberos_read_keytab(postfix_master_t)
++	kerberos_use(postfix_master_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/procmail.te b/policy/modules/contrib/procmail.te
+index fbbc398..cc426e6 100644
+--- a/policy/modules/contrib/procmail.te
++++ b/policy/modules/contrib/procmail.te
+@@ -1,4 +1,4 @@
+-policy_module(procmail, 1.13.0)
++policy_module(procmail, 1.13.1)
+ 
+ ########################################
+ #
+@@ -122,7 +122,7 @@ optional_policy(`
+ 	postfix_read_spool_files(procmail_t)
+ 	postfix_read_local_state(procmail_t)
+ 	postfix_read_master_state(procmail_t)
+-	postfix_rw_master_pipes(procmail_t)
++	postfix_rw_inherited_master_pipes(procmail_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/qmail.te b/policy/modules/contrib/qmail.te
+index 83cccf9..8742944 100644
+--- a/policy/modules/contrib/qmail.te
++++ b/policy/modules/contrib/qmail.te
+@@ -1,4 +1,4 @@
+-policy_module(qmail, 1.6.0)
++policy_module(qmail, 1.6.1)
+ 
+ ########################################
+ #
+@@ -42,6 +42,9 @@ qmail_child_domain_template(qmail_send, qmail_start_t)
+ qmail_child_domain_template(qmail_smtpd, qmail_tcp_env_t)
+ qmail_child_domain_template(qmail_splogger, qmail_start_t)
+ 
++type qmail_keytab_t;
++files_type(qmail_keytab_t)
++
+ type qmail_spool_t;
+ files_type(qmail_spool_t)
+ 
+@@ -241,6 +244,8 @@ allow qmail_smtpd_t self:process signal_perms;
+ allow qmail_smtpd_t self:fifo_file write_fifo_file_perms;
+ allow qmail_smtpd_t self:tcp_socket create_socket_perms;
+ 
++allow qmail_smtpd_t qmail_keytab_t:file read_file_perms;
++
+ allow qmail_smtpd_t qmail_queue_exec_t:file read_file_perms;
+ 
+ dev_read_rand(qmail_smtpd_t)
+@@ -253,7 +258,8 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(qmail, qmail_smtpd_t)
++	kerberos_read_keytab(qmail_smtpd_t)
++	kerberos_use(qmail_smtpd_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/rlogin.te b/policy/modules/contrib/rlogin.te
+index 20696cc..5916f81 100644
+--- a/policy/modules/contrib/rlogin.te
++++ b/policy/modules/contrib/rlogin.te
+@@ -1,4 +1,4 @@
+-policy_module(rlogin, 1.11.0)
++policy_module(rlogin, 1.11.1)
+ 
+ ########################################
+ #
+@@ -16,6 +16,9 @@ term_login_pty(rlogind_devpts_t)
+ type rlogind_home_t;
+ userdom_user_home_content(rlogind_home_t)
+ 
++type rlogind_keytab_t;
++files_type(rlogind_keytab_t)
++
+ type rlogind_tmp_t;
+ files_tmp_file(rlogind_tmp_t)
+ 
+@@ -37,6 +40,8 @@ term_create_pty(rlogind_t, rlogind_devpts_t)
+ 
+ allow rlogind_t rlogind_home_t:file read_file_perms;
+ 
++allow rlogind_t rlogind_keytab_t:file read_file_perms;
++
+ manage_dirs_pattern(rlogind_t, rlogind_tmp_t, rlogind_tmp_t)
+ manage_files_pattern(rlogind_t, rlogind_tmp_t, rlogind_tmp_t)
+ files_tmp_filetrans(rlogind_t, rlogind_tmp_t, { dir file })
+@@ -98,9 +103,10 @@ tunable_policy(`use_samba_home_dirs',`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(rlogind, rlogind_t)
++	kerberos_read_keytab(rlogind_t)
+ 	kerberos_tmp_filetrans_host_rcache(rlogind_t, file, "host_0")
+ 	kerberos_manage_host_rcache(rlogind_t)
++	kerberos_use(rlogind_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/rpc.if b/policy/modules/contrib/rpc.if
+index 07f5eb0..157afd9 100644
+--- a/policy/modules/contrib/rpc.if
++++ b/policy/modules/contrib/rpc.if
+@@ -394,7 +394,7 @@ interface(`rpc_admin',`
+ 		attribute rpc_domain;
+ 		type nfsd_initrc_exec_t, rpcd_initrc_exec_t, exports_t;
+ 		type var_lib_nfs_t, rpcd_var_run_t, gssd_tmp_t;
+-		type nfsd_ro_t, nfsd_rw_t;
++		type nfsd_ro_t, nfsd_rw_t, gssd_keytab_t;
+ 	')
+ 
+ 	allow $1 rpc_domain:process { ptrace signal_perms };
+@@ -406,7 +406,7 @@ interface(`rpc_admin',`
+  	allow $2 system_r;
+ 
+ 	files_list_etc($1)
+-	admin_pattern($1, exports_t)
++	admin_pattern($1, { gssd_keytab_t exports_t })
+ 
+ 	files_list_var_lib($1)
+ 	admin_pattern($1, var_lib_nfs_t)
+diff --git a/policy/modules/contrib/rpc.te b/policy/modules/contrib/rpc.te
+index 1e6b44d..a8de8bd 100644
+--- a/policy/modules/contrib/rpc.te
++++ b/policy/modules/contrib/rpc.te
+@@ -1,4 +1,4 @@
+-policy_module(rpc, 1.15.0)
++policy_module(rpc, 1.15.1)
+ 
+ ########################################
+ #
+@@ -30,6 +30,9 @@ files_config_file(exports_t)
+ 
+ rpc_domain_template(gssd)
+ 
++type gssd_keytab_t;
++files_type(gssd_keytab_t)
++
+ type gssd_tmp_t;
+ files_tmp_file(gssd_tmp_t)
+ 
+@@ -271,6 +274,8 @@ allow gssd_t self:capability { dac_override dac_read_search setuid sys_nice };
+ allow gssd_t self:process { getsched setsched };
+ allow gssd_t self:fifo_file rw_fifo_file_perms;
+ 
++allow gssd_t gssd_keytab_t:file read_file_perms;
++
+ manage_dirs_pattern(gssd_t, gssd_tmp_t, gssd_tmp_t)
+ manage_files_pattern(gssd_t, gssd_tmp_t, gssd_tmp_t)
+ files_tmp_filetrans(gssd_t, gssd_tmp_t, { file dir })
+@@ -309,9 +314,10 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(gssd, gssd_t)
+ 	kerberos_manage_host_rcache(gssd_t)
++	kerberos_read_keytab(gssd_t)
+ 	kerberos_tmp_filetrans_host_rcache(gssd_t, file, "nfs_0")
++	kerberos_use(gssd_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/rshd.te b/policy/modules/contrib/rshd.te
+index 575e3e3..864e089 100644
+--- a/policy/modules/contrib/rshd.te
++++ b/policy/modules/contrib/rshd.te
+@@ -1,4 +1,4 @@
+-policy_module(rshd, 1.8.0)
++policy_module(rshd, 1.8.1)
+ 
+ ########################################
+ #
+@@ -10,6 +10,9 @@ type rshd_exec_t;
+ auth_login_pgm_domain(rshd_t)
+ inetd_tcp_service_domain(rshd_t, rshd_exec_t)
+ 
++type rshd_keytab_t;
++files_type(rshd_keytab_t)
++
+ ########################################
+ #
+ # Local policy
+@@ -20,6 +23,8 @@ allow rshd_t self:process { signal_perms setsched setpgid setexec };
+ allow rshd_t self:fifo_file rw_fifo_file_perms;
+ allow rshd_t self:tcp_socket create_stream_socket_perms;
+ 
++allow rshd_t rshd_keytab_t:file read_file_perms;
++
+ kernel_read_kernel_sysctls(rshd_t)
+ 
+ corenet_all_recvfrom_unlabeled(rshd_t)
+@@ -54,9 +59,10 @@ tunable_policy(`use_samba_home_dirs',`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(rshd, rshd_t)
+ 	kerberos_manage_host_rcache(rshd_t)
++	kerberos_read_keytab(rshd_t)
+ 	kerberos_tmp_filetrans_host_rcache(rshd_t, file, "host_0")
++	kerberos_use(rshd_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/samba.if b/policy/modules/contrib/samba.if
+index aee75af..50d07fb 100644
+--- a/policy/modules/contrib/samba.if
++++ b/policy/modules/contrib/samba.if
+@@ -689,6 +689,7 @@ interface(`samba_admin',`
+ 		type samba_etc_t, samba_share_t, samba_initrc_exec_t;
+ 		type swat_var_run_t, swat_tmp_t, winbind_log_t;
+ 		type winbind_var_run_t, winbind_tmp_t;
++		type smbd_keytab_t;
+ 	')
+ 
+ 	allow $1 { nmbd_t smbd_t }:process { ptrace signal_perms };
+@@ -700,7 +701,7 @@ interface(`samba_admin',`
+ 	allow $2 system_r;
+ 
+ 	files_list_etc($1)
+-	admin_pattern($1, samba_etc_t)
++	admin_pattern($1, { samba_etc_t smbd_keytab_t })
+ 
+ 	logging_list_logs($1)
+ 	admin_pattern($1, { samba_log_t winbind_log_t })
+diff --git a/policy/modules/contrib/samba.te b/policy/modules/contrib/samba.te
+index 54b89a6..98daaef 100644
+--- a/policy/modules/contrib/samba.te
++++ b/policy/modules/contrib/samba.te
+@@ -1,4 +1,4 @@
+-policy_module(samba, 1.16.0)
++policy_module(samba, 1.16.1)
+ 
+ #################################
+ #
+@@ -142,6 +142,9 @@ type smbd_t;
+ type smbd_exec_t;
+ init_daemon_domain(smbd_t, smbd_exec_t)
+ 
++type smbd_keytab_t;
++files_type(smbd_keytab_t)
++
+ type smbd_tmp_t;
+ files_tmp_file(smbd_tmp_t)
+ 
+@@ -271,6 +274,8 @@ allow smbd_t { swat_t winbind_t smbcontrol_t nmbd_t }:process { signal signull }
+ 
+ allow smbd_t samba_etc_t:file { rw_file_perms setattr_file_perms };
+ 
++allow smbd_t smbd_keytab_t:file read_file_perms;
++
+ manage_dirs_pattern(smbd_t, samba_log_t, samba_log_t)
+ append_files_pattern(smbd_t, samba_log_t, samba_log_t)
+ create_files_pattern(smbd_t, samba_log_t, samba_log_t)
+@@ -468,8 +473,8 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
++	kerberos_read_keytab(smbd_t)
+ 	kerberos_use(smbd_t)
+-	kerberos_keytab_template(smbd, smbd_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/sasl.if b/policy/modules/contrib/sasl.if
+index b2f388a..8c3c151 100644
+--- a/policy/modules/contrib/sasl.if
++++ b/policy/modules/contrib/sasl.if
+@@ -39,6 +39,7 @@ interface(`sasl_connect',`
+ interface(`sasl_admin',`
+ 	gen_require(`
+ 		type saslauthd_t, saslauthd_var_run_t, saslauthd_initrc_exec_t;
++		type saslauthd_keytab_t;
+ 	')
+ 
+ 	allow $1 saslauthd_t:process { ptrace signal_perms };
+@@ -49,6 +50,9 @@ interface(`sasl_admin',`
+ 	role_transition $2 saslauthd_initrc_exec_t system_r;
+ 	allow $2 system_r;
+ 
++	files_list_etc($1)
++	admin_pattern($1, saslauthd_keytab_t)
++
+ 	files_list_pids($1)
+ 	admin_pattern($1, saslauthd_var_run_t)
+ ')
+diff --git a/policy/modules/contrib/sasl.te b/policy/modules/contrib/sasl.te
+index 20ebffb..6c3bc20 100644
+--- a/policy/modules/contrib/sasl.te
++++ b/policy/modules/contrib/sasl.te
+@@ -1,4 +1,4 @@
+-policy_module(sasl, 1.15.0)
++policy_module(sasl, 1.15.1)
+ 
+ ########################################
+ #
+@@ -20,6 +20,9 @@ init_daemon_domain(saslauthd_t, saslauthd_exec_t)
+ type saslauthd_initrc_exec_t;
+ init_script_file(saslauthd_initrc_exec_t)
+ 
++type saslauthd_keytab_t;
++files_type(saslauthd_keytab_t)
++
+ type saslauthd_var_run_t;
+ files_pid_file(saslauthd_var_run_t)
+ 
+@@ -34,6 +37,8 @@ allow saslauthd_t self:process { setsched signal_perms };
+ allow saslauthd_t self:fifo_file rw_fifo_file_perms;
+ allow saslauthd_t self:unix_stream_socket { accept listen };
+ 
++allow saslauthd_t saslauthd_keytab_t:file read_file_perms;
++
+ manage_dirs_pattern(saslauthd_t, saslauthd_var_run_t, saslauthd_var_run_t)
+ manage_files_pattern(saslauthd_t, saslauthd_var_run_t, saslauthd_var_run_t)
+ manage_sock_files_pattern(saslauthd_t, saslauthd_var_run_t, saslauthd_var_run_t)
+@@ -92,9 +97,10 @@ tunable_policy(`allow_saslauthd_read_shadow',`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(saslauthd, saslauthd_t)
++	kerberos_read_keytab(saslauthd_t)
+ 	kerberos_manage_host_rcache(saslauthd_t)
+ 	kerberos_tmp_filetrans_host_rcache(saslauthd_t, file, "host_0")
++	kerberos_use(saslauthd_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/sendmail.if b/policy/modules/contrib/sendmail.if
+index 88e753f..35ad2a7 100644
+--- a/policy/modules/contrib/sendmail.if
++++ b/policy/modules/contrib/sendmail.if
+@@ -354,6 +354,7 @@ interface(`sendmail_admin',`
+ 	gen_require(`
+ 		type sendmail_t, sendmail_initrc_exec_t, sendmail_log_t;
+ 		type sendmail_tmp_t, sendmail_var_run_t, unconfined_sendmail_t;
++		type sendmail_keytab_t;
+ 	')
+ 
+ 	allow $1 { unconfined_sendmail_t sendmail_t }:process { ptrace signal_perms };
+@@ -363,6 +364,9 @@ interface(`sendmail_admin',`
+ 	domain_system_change_exemption($1)
+ 	role_transition $2 sendmail_initrc_exec_t system_r;
+ 
++	files_list_etc($1)
++	admin_pattern($1, sendmail_keytab_t)
++
+ 	logging_list_logs($1)
+ 	admin_pattern($1, sendmail_log_t)
+ 
+diff --git a/policy/modules/contrib/sendmail.te b/policy/modules/contrib/sendmail.te
+index 320db21..12700b4 100644
+--- a/policy/modules/contrib/sendmail.te
++++ b/policy/modules/contrib/sendmail.te
+@@ -1,4 +1,4 @@
+-policy_module(sendmail, 1.12.0)
++policy_module(sendmail, 1.12.1)
+ 
+ ########################################
+ #
+@@ -13,6 +13,9 @@ roleattribute system_r sendmail_unconfined_roles;
+ type sendmail_initrc_exec_t;
+ init_script_file(sendmail_initrc_exec_t)
+ 
++type sendmail_keytab_t;
++files_type(sendmail_keytab_t)
++
+ type sendmail_log_t;
+ logging_log_file(sendmail_log_t)
+ 
+@@ -43,6 +46,8 @@ allow sendmail_t self:fifo_file rw_fifo_file_perms;
+ allow sendmail_t self:unix_stream_socket { accept listen };
+ allow sendmail_t self:tcp_socket { accept listen };
+ 
++allow sendmail_t sendmail_keytab_t:file read_file_perms;
++
+ allow sendmail_t sendmail_log_t:dir setattr_dir_perms;
+ append_files_pattern(sendmail_t, sendmail_log_t, sendmail_log_t)
+ create_files_pattern(sendmail_t, sendmail_log_t, sendmail_log_t)
+@@ -154,7 +159,8 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(sendmail, sendmail_t)
++	kerberos_read_keytab(sendmail_t)
++	kerberos_use(sendmail_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/spamassassin.te b/policy/modules/contrib/spamassassin.te
+index 02fba54..cc58e35 100644
+--- a/policy/modules/contrib/spamassassin.te
++++ b/policy/modules/contrib/spamassassin.te
+@@ -1,4 +1,4 @@
+-policy_module(spamassassin, 2.6.0)
++policy_module(spamassassin, 2.6.1)
+ 
+ ########################################
+ #
+@@ -262,7 +262,7 @@ optional_policy(`
+ 	postfix_domtrans_postdrop(spamc_t)
+ 	postfix_search_spool(spamc_t)
+ 	postfix_rw_local_pipes(spamc_t)
+-	postfix_rw_master_pipes(spamc_t)
++	postfix_rw_inherited_master_pipes(spamc_t)
+ ')
+ 
+ ########################################
+diff --git a/policy/modules/contrib/telnet.te b/policy/modules/contrib/telnet.te
+index b9e2061..bcef8b5 100644
+--- a/policy/modules/contrib/telnet.te
++++ b/policy/modules/contrib/telnet.te
+@@ -1,4 +1,4 @@
+-policy_module(telnet, 1.11.0)
++policy_module(telnet, 1.11.1)
+ 
+ ########################################
+ #
+@@ -12,6 +12,9 @@ inetd_service_domain(telnetd_t, telnetd_exec_t)
+ type telnetd_devpts_t;
+ term_login_pty(telnetd_devpts_t)
+ 
++type telnetd_keytab_t;
++files_type(telnetd_keytab_t)
++
+ type telnetd_tmp_t;
+ files_tmp_file(telnetd_tmp_t)
+ 
+@@ -30,6 +33,8 @@ allow telnetd_t self:fifo_file rw_fifo_file_perms;
+ allow telnetd_t telnetd_devpts_t:chr_file { rw_chr_file_perms setattr_chr_file_perms };
+ term_create_pty(telnetd_t, telnetd_devpts_t)
+ 
++allow telnetd_t telnetd_keytab_t:file read_file_perms;
++
+ manage_dirs_pattern(telnetd_t, telnetd_tmp_t, telnetd_tmp_t)
+ manage_files_pattern(telnetd_t, telnetd_tmp_t, telnetd_tmp_t)
+ files_tmp_filetrans(telnetd_t, telnetd_tmp_t, { file dir })
+@@ -85,9 +90,10 @@ tunable_policy(`use_samba_home_dirs',`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(telnetd, telnetd_t)
++	kerberos_read_keytab(telnetd_t)
+ 	kerberos_tmp_filetrans_host_rcache(telnetd_t, file, "host_0")
+ 	kerberos_manage_host_rcache(telnetd_t)
++	kerberos_use(telnetd_t)
+ ')
+ 
+ optional_policy(`
+diff --git a/policy/modules/contrib/virt.if b/policy/modules/contrib/virt.if
+index e30a42e..c8bc302 100644
+--- a/policy/modules/contrib/virt.if
++++ b/policy/modules/contrib/virt.if
+@@ -1148,7 +1148,7 @@ interface(`virt_admin',`
+ 		type virt_bridgehelper_t, virt_qmf_t, virt_var_lib_t;
+ 		type virt_var_run_t, virt_tmp_t, virt_log_t;
+ 		type virt_lock_t, svirt_var_run_t, virt_etc_rw_t;
+-		type virt_etc_t, svirt_cache_t;
++		type virt_etc_t, svirt_cache_t, virtd_keytab_t;
+ 	')
+ 
+ 	allow $1 { virt_domain svirt_lxc_domain virtd_t }:process { ptrace signal_perms };
+@@ -1168,7 +1168,7 @@ interface(`virt_admin',`
+ 	admin_pattern($1, { virt_tmp_type virt_tmp_t })
+ 
+ 	files_search_etc($1)
+-	admin_pattern($1, { virt_etc_t virt_etc_rw_t })
++	admin_pattern($1, { virt_etc_t virt_etc_rw_t virtd_keytab_t })
+ 
+ 	logging_search_logs($1)
+ 	admin_pattern($1, virt_log_t)
+diff --git a/policy/modules/contrib/virt.te b/policy/modules/contrib/virt.te
+index 9230f0d..f2916f7 100644
+--- a/policy/modules/contrib/virt.te
++++ b/policy/modules/contrib/virt.te
+@@ -1,4 +1,4 @@
+-policy_module(virt, 1.7.0)
++policy_module(virt, 1.7.1)
+ 
+ ########################################
+ #
+@@ -142,6 +142,9 @@ domain_subj_id_change_exemption(virtd_t)
+ type virtd_initrc_exec_t;
+ init_script_file(virtd_initrc_exec_t)
+ 
++type virtd_keytab_t;
++files_type(virtd_keytab_t)
++
+ ifdef(`enable_mcs',`
+ 	init_ranged_daemon_domain(virtd_t, virtd_exec_t, s0 - mcs_systemhigh)
+ ')
+@@ -438,6 +441,8 @@ manage_dirs_pattern(virtd_t, virt_content_t, virt_content_t)
+ manage_files_pattern(virtd_t, virt_content_t, virt_content_t)
+ filetrans_pattern(virtd_t, virt_home_t, virt_content_t, dir, "isos")
+ 
++allow virtd_t virtd_keytab_t:file read_file_perms;
++
+ allow virtd_t svirt_var_run_t:file relabel_file_perms;
+ manage_dirs_pattern(virtd_t, svirt_var_run_t, svirt_var_run_t)
+ manage_files_pattern(virtd_t, svirt_var_run_t, svirt_var_run_t)
+@@ -700,7 +705,8 @@ optional_policy(`
+ ')
+ 
+ optional_policy(`
+-	kerberos_keytab_template(virtd, virtd_t)
++	kerberos_read_keytab(virtd_t)
++	kerberos_use(virtd_t)
+ ')
+ 
+ optional_policy(`
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
new file mode 100644
index 0000000..2b7b2b0
--- /dev/null
+++ b/package/refpolicy/refpolicy.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# refpolicy
+#
+################################################################################
+
+REFPOLICY_VERSION = 2.20130424
+REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
+REFPOLICY_SITE = http://oss.tresys.com/files/refpolicy/
+REFPOLICY_LICENSE = GPLv2
+REFPOLICY_LICENSE_FILES = COPYING
+
+# Cannot use multiple threads to build the reference policy
+REFPOLICY_MAKE = $(TARGET_MAKE_ENV) $(MAKE1)
+
+REFPOLICY_DEPENDENCIES = host-m4 host-checkpolicy host-policycoreutils \
+	host-setools host-python-pyxml policycoreutils
+
+REFPOLICY_INSTALL_STAGING = YES
+
+# To apply board specific customizations, create a refpolicy folder in
+# BR2_GLOBAL_PATCH_DIR.  These patches will be applied after the patches
+# in package/refpolicy
+
+# Pointing to the host compiler to build a sort application during the build.
+# The host compiler tools are not used for any part of the refpolicy build.
+# Note, the TEST_TOOLCHAIN option will also set the
+# LD_LIBRARY_PATH at run time.
+REFPOLICY_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
+	TEST_TOOLCHAIN="$(HOST_DIR)"
+
+ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
+	BR2_PACKAGE_REFPOLICY_MONOLITHIC = n
+else
+	BR2_PACKAGE_REFPOLICY_MONOLITHIC = y
+endif
+
+define REFPOLICY_CONFIGURE_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) bare $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+	$(SED) "/TYPE/c\TYPE = $(BR2_PACKAGE_REFPOLICY_TYPE)" $(@D)/build.conf
+	$(SED) "/MONOLITHIC/c\MONOLITHIC = $(BR2_PACKAGE_REFPOLICY_MONOLITHIC)" $(@D)/build.conf
+	$(REFPOLICY_MAKE) -C $(@D) conf $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define REFPOLICY_BUILD_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define REFPOLICY_CLEAN_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) clean $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define REFPOLICY_INSTALL_STAGING_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) install-src install-headers install-docs \
+		$(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define REFPOLICY_INSTALL_TARGET_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) install $(REFPOLICY_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+	$(INSTALL) -m 0755 -D package/refpolicy/config $(TARGET_DIR)/etc/selinux/config
+	$(SED) "/^SELINUXTYPE/c\SELINUXTYPE=$(BR2_PACKAGE_REFPOLICY_NAME)" \
+		$(TARGET_DIR)/etc/selinux/config
+endef
+
+define REFPOLICY_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/refpolicy/S12selinux \
+		$(TARGET_DIR)/etc/init.d/S12selinux
+endef
+
+define REFPOLICY_POLICY_COMPILE
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/policy
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/modules/active/modules
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/contexts/files
+	touch $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/contexts/files/file_contexts.local
+endef
+ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
+	REFPOLICY_POST_INSTALL_TARGET_HOOKS += REFPOLICY_POLICY_COMPILE
+endif
+
+$(eval $(generic-package))
-- 
1.7.1
