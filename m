From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 13:22:17 +0200
Subject: [Buildroot] [git commit] toolchain-external: add a specific check
	to avoid Angstrom toolchains
Message-ID: <20131014112355.714959B9FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1247850d44daafa5c7835f26da88e347b330b536
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk                               |   18 ++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |    1 +
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 95120cd..a8944ce 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -324,3 +324,21 @@ check_cross_compiler_exists = \
 		echo "Cannot execute cross-compiler '$${__CROSS_CC}'" ; \
 		exit 1 ; \
 	fi
+
+#
+# Check for toolchains known not to work with Buildroot. For now, we
+# only check for Angstrom toolchains, by looking at the vendor part of
+# the host tuple.
+#
+# $1: cross-gcc path
+#
+check_unusable_toolchain = \
+	__CROSS_CC=$(strip $1) ; \
+	vendor=`$${__CROSS_CC} -dumpmachine | cut -f2 -d'-'` ; \
+	if test "$${vendor}" = "angstrom" ; then \
+		echo "Angstrom toolchains are not pure toolchains: they contain" ; \
+		echo "many other libraries than just the C library, which makes" ; \
+		echo "them unsuitable as external toolchains for build systems" ; \
+		echo "such as Buildroot." ; \
+		exit 1 ; \
+	fi
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b5b1ce7..d41cc7c 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -371,6 +371,7 @@ endif
 # type of C library and all C library features.
 define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
+	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
 	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/(.*/)?libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
