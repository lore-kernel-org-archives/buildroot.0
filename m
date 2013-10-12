From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Oct 2013 12:14:42 +0200
Subject: [Buildroot] [PATCH] toolchain-external: add a specific check to
	avoid Angstrom toolchains
Message-ID: <1381572882-22592-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Angstrom toolchains available at
http://www.angstrom-distribution.org/toolchains/ are not usable as
external toolchains in Buildroot, because they are not pure toolchains
with just the C library, but instead complete SDKs with many
cross-compiled libraries (Gtk, Qt, glib, neon, sqlite, X.org, and many
more, approximately 200 MB of libraries).

Buildroot cannot use such toolchains, and while this is documented in
our manual, some users still try to do this. Today, one such user came
on the IRC channel, reporting a build problem, which we started
investigating, only to realize after a long time that he was using an
Angstrom toolchain.

To avoid this problem in the future, we explicitly check if the
toolchain is from Angstrom by looking at the vendor part of the tuple
exposed by the toolchain: as soon as it is
<something>-angstrom-<something-else>, we reject the toolchain with an
explanation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                               | 18 ++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  1 +
 2 files changed, 19 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 95120cd..d81e561 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -324,3 +324,21 @@ check_cross_compiler_exists = \
 		echo "Cannot execute cross-compiler '$${__CROSS_CC}'" ; \
 		exit 1 ; \
 	fi
+
+#
+# Check for toolchains known to not work with Buildroot. To check for
+# Angstrom toolchains, we're taking the "Target: " line in the output
+# of gcc -v, and look at the vendor part of the tuple.
+#
+# $1: cross-gcc path
+#
+check_wrong_toolchain = \
+	__CROSS_CC=$(strip $1) ; \
+	vendor=`$${__CROSS_CC} -v 2>&1 | sed -n '/^Target/s/Target: [^-]*-\([^-]*\)-.*/\1/p'` ; \
+	if test $${vendor} = "angstrom" ; then \
+		echo "Angstrom toolchains are not pure toolchains: they contain" ; \
+		echo "many other libraries than just the C library, which makes" ; \
+		echo "them unsuitable as external toolchains for build systems" ; \
+		echo "such as Buildroot" ; \
+		exit 1 ; \
+	fi
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b5b1ce7..102bcfd 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -371,6 +371,7 @@ endif
 # type of C library and all C library features.
 define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
+	$(Q)$(call check_wrong_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
 	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/(.*/)?libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
-- 
1.8.1.2
