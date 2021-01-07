From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu,  7 Jan 2021 14:53:06 +0100
Subject: [Buildroot] [PATCH 2/3] package/refpolicy: Add a buildroot module
In-Reply-To: <20210107135307.1762186-1-maxime.chevallier@bootlin.com>
References: <20210107135307.1762186-1-maxime.chevallier@bootlin.com>
Message-ID: <20210107135307.1762186-3-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Booting a system on an embedded platform is quite different to what the
refpolicy was originally designed to support, which is general purpose
distributions.

This means that we have to enable specific rules for our embedded sytem
to work. For now, we implement that as a buildroot-specific module, but
this could in the future be upstreamed as part of the refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../refpolicy/selinux-modules/buildroot.fc    |   0
 .../refpolicy/selinux-modules/buildroot.if    |   1 +
 .../refpolicy/selinux-modules/buildroot.te    | 121 ++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 package/refpolicy/selinux-modules/buildroot.fc
 create mode 100644 package/refpolicy/selinux-modules/buildroot.if
 create mode 100644 package/refpolicy/selinux-modules/buildroot.te

diff --git a/package/refpolicy/selinux-modules/buildroot.fc b/package/refpolicy/selinux-modules/buildroot.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/refpolicy/selinux-modules/buildroot.if b/package/refpolicy/selinux-modules/buildroot.if
new file mode 100644
index 0000000000..acf797e604
--- /dev/null
+++ b/package/refpolicy/selinux-modules/buildroot.if
@@ -0,0 +1 @@
+## <summary>Buildroot rules</summary>
diff --git a/package/refpolicy/selinux-modules/buildroot.te b/package/refpolicy/selinux-modules/buildroot.te
new file mode 100644
index 0000000000..1f973c9e18
--- /dev/null
+++ b/package/refpolicy/selinux-modules/buildroot.te
@@ -0,0 +1,121 @@
+policy_module(buildroot, 1.0.0)
+
+gen_require(`
+	type sysctl_kernel_t;
+	type systemd_generator_t;
+	type systemd_hw_t;
+	type usr_t;
+	type var_run_t;
+	type file_context_t;
+	type var_log_t;
+	type user_home_dir_t;
+	type getty_t;
+	type systemd_networkd_t;
+	type system_dbusd_runtime_t;
+	type net_conf_t;
+	type bin_t;
+	type system_dbusd_var_lib_t;
+	type systemd_tmpfiles_t;
+	type init_t;
+	type var_spool_t;
+	type init_runtime_t;
+	type syslogd_t;
+	type udev_t;
+	type ntpd_t;
+	type auditd_log_t;
+	type system_dbusd_t;
+	type sysctl_t;
+	type local_login_t;
+	type systemd_resolved_t;
+	type tty_device_t;
+	type restorecond_t;
+	type getty_runtime_t;
+	type etc_t;
+	type selinux_config_t;
+	type proc_t;
+	class capability { audit_control dac_override };
+	class process setfscreate;
+	class chr_file { ioctl open read write };
+	class netlink_audit_socket nlmsg_write;
+	class unix_stream_socket connectto;
+	class dir { add_name create getattr open read relabelfrom relabelto search watch write };
+	class file { create execute lock open read relabelfrom relabelto watch write };
+	class sock_file { read watch write };
+	class filesystem getattr;
+')
+
+#============= getty_t ==============
+allow getty_t getty_runtime_t:file watch;
+allow getty_t init_runtime_t:dir read;
+allow getty_t init_runtime_t:sock_file write;
+allow getty_t init_t:unix_stream_socket connectto;
+allow getty_t sysctl_kernel_t:dir search;
+allow getty_t sysctl_kernel_t:file { open read };
+allow getty_t sysctl_t:dir search;
+
+#============= local_login_t ==============
+allow local_login_t bin_t:file execute;
+allow local_login_t proc_t:filesystem getattr;
+allow local_login_t var_log_t:file { create lock open read write };
+allow local_login_t var_run_t:dir { add_name write };
+allow local_login_t var_run_t:file { create lock open read write };
+
+#============= restorecond_t ==============
+allow restorecond_t etc_t:dir watch;
+allow restorecond_t file_context_t:file { open read };
+allow restorecond_t selinux_config_t:file watch;
+allow restorecond_t user_home_dir_t:dir watch;
+allow restorecond_t var_log_t:dir watch;
+allow restorecond_t var_run_t:dir watch;
+
+#============= syslogd_t ==============
+allow syslogd_t self:capability audit_control;
+allow syslogd_t self:netlink_audit_socket nlmsg_write;
+
+#============= system_dbusd_t ==============
+allow system_dbusd_t init_t:unix_stream_socket connectto;
+
+#============= systemd_generator_t ==============
+allow systemd_generator_t self:capability dac_override;
+allow systemd_generator_t self:process setfscreate;
+allow systemd_generator_t tty_device_t:chr_file { ioctl open read write };
+
+#============= systemd_hw_t ==============
+allow systemd_hw_t init_runtime_t:dir search;
+
+#============= systemd_networkd_t ==============
+allow systemd_networkd_t net_conf_t:dir { getattr open read search };
+allow systemd_networkd_t system_dbusd_runtime_t:dir read;
+allow systemd_networkd_t system_dbusd_runtime_t:sock_file read;
+allow systemd_networkd_t var_run_t:dir read;
+
+#============= systemd_resolved_t ==============
+allow systemd_resolved_t system_dbusd_runtime_t:dir read;
+allow systemd_resolved_t system_dbusd_runtime_t:sock_file read;
+allow systemd_resolved_t var_run_t:dir read;
+
+#============= systemd_tmpfiles_t ==============
+allow systemd_tmpfiles_t auditd_log_t:dir { create getattr open read relabelfrom relabelto };
+
+#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
+allow systemd_tmpfiles_t etc_t:dir relabelfrom;
+
+#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
+allow systemd_tmpfiles_t etc_t:file { relabelfrom relabelto };
+allow systemd_tmpfiles_t init_t:unix_stream_socket connectto;
+
+#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
+allow systemd_tmpfiles_t system_dbusd_var_lib_t:dir read;
+
+#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
+allow systemd_tmpfiles_t usr_t:dir read;
+
+#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
+allow systemd_tmpfiles_t usr_t:file { open read };
+
+#!!!! This avc can be allowed using the boolean 'systemd_tmpfiles_manage_all'
+allow systemd_tmpfiles_t var_spool_t:dir create;
+
+#============= udev_t ==============
+allow udev_t init_runtime_t:dir read;
+allow udev_t net_conf_t:dir { getattr open read };
-- 
2.25.4
