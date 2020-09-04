From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 14:47:29 +0200
Subject: [Buildroot] [git commit] docs/manual: add a section about SELinux
Message-ID: <20200904123952.1BE288185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c38c1cde0d8b3e58643407edef7eb0e06a70b8de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add documentation about how to use SELinux in Buildroot, and what are
the available mechanisms to extend and customize the SELinux policy.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
[Thomas: misc improvements.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/manual.txt          |  2 ++
 docs/manual/selinux-support.txt | 74 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 48de65ee10..b5cc044805 100644
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
index 0000000000..21137ae6c3
--- /dev/null
+++ b/docs/manual/selinux-support.txt
@@ -0,0 +1,74 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[selinux]]
+== Using SELinux in Buildroot
+
+https://selinuxproject.org[SELinux] is a Linux kernel security module
+enforcing access control policies. In addition to the traditional file
+permissions and access control lists, +SELinux+ allows to write rules
+for users or processes to access specific functions of resources
+(files, sockets...).
+
+_SELinux_ has three modes of operation:
+
+* _Disabled_: the policy is not applied
+* _Permissive_: the policy is applied, and non-authorized actions are
+  simply logged. This mode is often used for troubleshooting SELinux
+  issues.
+* _Enforcing_: the policy is applied, and non-authorized actions are
+  denied
+
+In Buildroot the mode of operation is controlled by the
++BR2_PACKAGE_REFPOLICY_POLICY_STATE_*+ configuration options. The
+Linux kernel also has various configuration options that affect how
++SELinux+ is enabled (see +security/selinux/Kconfig+ in the Linux
+kernel sources).
+
+By default in Buildroot the +SELinux+ policy is provided by the
+upstream https://github.com/SELinuxProject/refpolicy[refpolicy]
+project, enabled with +BR2_PACKAGE_REFPOLICY+.
+
+[[enabling-selinux]]
+=== Enabling SELinux support
+
+To have proper support for +SELinux+ in a Buildroot generated system,
+the following configuration options must be enabled:
+
+* +BR2_PACKAGE_LIBSELINUX+
+* +BR2_PACKAGE_REFPOLICY+
+
+In addition, your filesystem image format must support extended
+attributes.
+
+[[selinux-policy-tweaking]]
+=== SELinux policy tweaking
+
+The +SELinux refpolicy+ contains modules that can be enabled or
+disabled when being built. Each module provide a number of +SELinux+
+rules. In Buildroot the non-base modules are disabled by default and
+several ways to enable such modules are provided:
+
+- Packages can enable a list of +SELinux+ modules within the +refpolicy+ using
+  the +<packagename>_SELINUX_MODULES+ variable.
+- Packages can provide additional +SELinux+ modules by putting them (.fc, .if
+  and .te files) in +package/<packagename>/selinux/+.
+- Extra +SELinux+ modules can be added in directories pointed by the
+  +BR2_REFPOLICY_EXTRA_MODULES_DIRS+ configuration option.
+- Additional modules in the +refpolicy+ can be enabled if listed in the
+  +BR2_REFPOLICY_EXTRA_MODULES_DEPENDENCIES+ configuration option.
+
+Buildroot also allows to completely override the +refpolicy+. This
+allows to provide a full custom policy designed specifically for a
+given system. When going this way, all of the above mechanisms are
+disabled: no extra +SElinux+ module is added to the policy, and all
+the available modules within the custom policy are enabled and built
+into the final binary policy. The custom policy must be a fork of the
+official https://github.com/SELinuxProject/refpolicy[refpolicy].
+
+In order to fully override the +refpolicy+ the following configuration
+variables have to be set:
+
+- +BR2_PACKAGE_REFPOLICY_CUSTOM_GIT+
+- +BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL+
+- +BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION+
