From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:40 +0200
Subject: [Buildroot] [PATCH 15/15] docs/manual: add a section about SELinux
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-16-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add documentation about how to use SELinux in Buildroot, and what are
the available mechanisms to extend and customize the SELinux policy.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 docs/manual/manual.txt          |  2 +
 docs/manual/selinux-support.txt | 66 +++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 docs/manual/selinux-support.txt

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 48de65ee1033..b5cc044805b1 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -38,6 +38,8 @@ include::common-usage.txt[]
 
 include::customize.txt[]
 
+include::selinux-support.txt[]
+
 include::faq-troubleshooting.txt[]
 
 include::known-issues.txt[]
diff --git a/docs/manual/selinux-support.txt b/docs/manual/selinux-support.txt
new file mode 100644
index 000000000000..613b1c8f2275
--- /dev/null
+++ b/docs/manual/selinux-support.txt
@@ -0,0 +1,66 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[selinux]]
+== Using +SELinux+ in Buildroot
+
+https://selinuxproject.org[SELinux] is a Linux kernel security module enforcing
+access control policies. In addition to the traditional file permissions and
+access control lists, +SELinux+ allows to write rules for users or processes to
+access specific functions of resources (files, sockets...).
+
++SELinux+ has three modes of operating: +Enforcing+, +Permissive+ and
++Disabled+.  If not +Disabled+, the kernel will apply the policy and
+non-authorized actions will be denied in +Enforcing+ mode or logged and reported
+in +Permissive+ mode.  +Permissive+ mode is often used for troubleshooting
+SELinux issues. In Buildroot this is controlled by the
++BR2_PACKAGE_REFPOLICY_POLICY_STATE_*+ configuration options.
+
+By default in Buildroot the +SELinux+ policy is provided by the upstream
+https://github.com/SELinuxProject/refpolicy[refpolicy] project, enabled with
++BR2_PACKAGE_REFPOLICY+.
+
+[[enabling-selinux]]
+=== Enabling SELinux support
+
+To have proper support for +SELinux+ in a Buildroot generated system, the
+following configuration needs to be enabled:
+
+* +BR2_PACKAGE_REFPOLICY+
+* +BR2_PACKAGE_POLICYCOREUTILS+
+
+The Linux kernel configuration must also enable +SELinux+ support with
++CONFIG_SECURITY_SELINUX+, +CONFIG_LSM+ (or using the +lsm+ kernel
+parameter) and extended attributes in filesystems (+CONFIG_EXT2_FS_XATTR+ for
++ext2+, +CONFIG_SQUASHFS_XATTR+ for +squashfs+, etc...).
+
+[[selinux-policy-tweaking]]
+=== SELinux policy tweaking
+
+The +SELinux refpolicy+ contains modules that can be enabled or disabled when
+being built. In Buildroot the non-base modules are disabled by default and ways
+to enable them are provided:
+
+- Packages can enable a list of +SELinux+ modules within the +refpolicy+ with
+  the +<packagename>_SELINUX_MODULES+ variable.
+- Packages can provide additional +SELinux+ modules by putting them (.fc, .if
+  and .te files) in +package/<packagename>/selinux/+.
+- Extra +SELinux+ modules can be added if in directories pointed by the
+  +BR2_REFPOLICY_EXTRA_MODULES_DIRS+ configuration variable.
+- Additional modules in the +refpolicy+ can be enabled if listed in the
+  +BR2_REFPOLICY_EXTRA_MODULES_DEPENDENCIES+ configuration variable.
+
+Buildroot also allows to completely override the +refpolicy+. This allows to
+provide a full custom policy designed specifically for a given system. When
+going this way, all of the above mechanisms are disabled: no extra +SElinux+
+module is added to the policy, and all the available modules within the custom
+policy are enabled and built into the final binary policy. The custom policy
+must be a fork of the official
+https://github.com/SELinuxProject/refpolicy[refpolicy].
+
+In order to fully override the +refpolicy+ the following configuration variables
+have to be set:
+
+- +BR2_PACKAGE_REFPOLICY_CUSTOM_GIT+
+- +BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL+
+- +BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION+
-- 
2.26.2
