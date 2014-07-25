From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jul 2014 22:06:27 +0200
Subject: [Buildroot] [PATCH v2] toolchain: include C libraries in legal-info
Message-ID: <1406318787-3993-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So far, the legal-info infrastructure was not exporting the legal
info for the C libraries. This is because the legal-info only acts
on packages defined in $(TARGETS).

But the C libraries are never added to $(TARGETS), since there is no
corresponding BR2_PACKAGE_<C-LIBRARY>.

This patch adds such symbols for the 4 C libraries we support in our
internal backend: uClibc, glibc, eglibc and musl.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>

---
Tested by building the toolchain of the defconfig, which is
uClibc-based. Tests not replicated to other C libraries.

---
Changes v1 -> v2:
  - remove debug code  (Thomas)
  - add explanations missing for musl
---
 package/glibc/Config.in  | 10 ++++++++++
 package/musl/Config.in   |  5 +++++
 package/uclibc/Config.in |  5 +++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/musl/Config.in

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index c2d6231..df1e273 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -1,5 +1,10 @@
 if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 
+# For legal-info
+config BR2_PACKAGE_EGLIBC
+	bool
+	default y
+
 choice
 	prompt "eglibc version"
 	default BR2_EGLIBC_VERSION_2_18
@@ -18,6 +23,11 @@ endif
 
 if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
+# For legal-info
+config BR2_PACKAGE_GLIBC
+	bool
+	default y
+
 choice
 	prompt "glibc version"
 	default BR2_GLIBC_VERSION_2_18
diff --git a/package/musl/Config.in b/package/musl/Config.in
new file mode 100644
index 0000000..0aa3537
--- /dev/null
+++ b/package/musl/Config.in
@@ -0,0 +1,5 @@
+# For legal-info
+config BR2_PACKAGE_MUSL
+	bool
+	depends on BR2_TOOLCHAIN_USES_MUSL
+	default y
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 0838b6c..851ad1e 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -1,5 +1,10 @@
 if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
+# For legal-info
+config BR2_PACKAGE_UCLIBC
+	bool
+	default y
+
 comment "uClibc Options"
 
 choice
-- 
1.9.1
