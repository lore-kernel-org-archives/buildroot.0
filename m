From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 18:05:01 +0100
Subject: [Buildroot] [git commit] package/pamtester: new package
Message-ID: <20190204170659.D8FC58385A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dfad425cc6e1664a0e39dad9150a45943d304bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Utility for testing pluggable authentication modules (PAM) facility.

While specifically designed to help PAM module authors to test their
modules, that might also be handy for system administrators interested
in building a centralised authentication system using common standards
such as NIS, SASL and LDAP.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Peter: drop spelling fix patch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/pamtester/Config.in      | 15 +++++++++++++++
 package/pamtester/pamtester.hash |  3 +++
 package/pamtester/pamtester.mk   | 13 +++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a04ab45533..59e1f32ba9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -426,6 +426,7 @@ F:	package/intel-microcode/
 F:	package/libpam-radius-auth/
 F:	package/libpam-tacplus/
 F:	package/modem-manager/
+F:	package/pamtester/
 F:	package/pcm-tools/
 F:	package/perl-file-util/
 F:	package/skeleton-custom/
diff --git a/package/Config.in b/package/Config.in
index 9082ed9956..bca61f14ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2163,6 +2163,7 @@ menu "System tools"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
 	source "package/openvmtools/Config.in"
+	source "package/pamtester/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
diff --git a/package/pamtester/Config.in b/package/pamtester/Config.in
new file mode 100644
index 0000000000..19b76d3f53
--- /dev/null
+++ b/package/pamtester/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PAMTESTER
+	bool "pamtester"
+	depends on BR2_PACKAGE_LINUX_PAM
+	help
+	  A tiny utility for testing pluggable authentication modules
+	  (PAM) facility. While specifically designed to help PAM module
+	  authors to test their modules, that might also be handy for
+	  system administrators interested in building a centralised
+	  authentication system using common standards such as NIS, SASL
+	  and LDAP.
+
+	  http://pamtester.sourceforge.net/
+
+comment "pamtester depends on linux-pam"
+	depends on !BR2_PACKAGE_LINUX_PAM
diff --git a/package/pamtester/pamtester.hash b/package/pamtester/pamtester.hash
new file mode 100644
index 0000000000..17497e3159
--- /dev/null
+++ b/package/pamtester/pamtester.hash
@@ -0,0 +1,3 @@
+# from https://sourceforge.net/projects/pamtester/files/pamtester/0.1.2/
+sha1   33bcc610d7f208b50a0a23c144bdbd1e2cae4ac6  pamtester-0.1.2.tar.gz
+sha256 1e3922a8ab0907c1f3bcc3e00005ef88930e50d0890f40a6a39f5f83b05f05cc LICENSE
diff --git a/package/pamtester/pamtester.mk b/package/pamtester/pamtester.mk
new file mode 100644
index 0000000000..b09e4d1cc0
--- /dev/null
+++ b/package/pamtester/pamtester.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# pamtester
+#
+################################################################################
+
+PAMTESTER_VERSION = 0.1.2
+PAMTESTER_SITE = https://download.sourceforge.net/project/pamtester/pamtester/$(PAMTESTER_VERSION)
+PAMTESTER_DEPENDENCIES = linux-pam
+PAMTESTER_LICENSE = BSD-3-Clause
+PAMTESTER_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
