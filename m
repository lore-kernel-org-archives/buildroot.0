From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 29 Dec 2015 22:14:32 +0100
Subject: [Buildroot] [PATCH v2] package/tpm-tools: fix build with locale
	support
Message-ID: <1451423672-24575-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tpm-tools needs to link with libintl when locale support is enabled.

However, tpm-tools' build-system internally builds a couple of static libraries
used to build the final programs.
When linking these libraries or the final programs, we need to explicitly tell
the linker to link with libintl in order to resolve all the missing symbols.

Fixes:
  http://autobuild.buildroot.org/results/560/56020558ec298ac4007bf7f6ce030b3f2fa1157d/
  http://autobuild.buildroot.org/results/17f/17fc6ca79765fd9ecdacec4f5a2b58caa554d48d/
  http://autobuild.buildroot.org/results/2d2/2d2c655429df62da2b8746a564fc064609e96001/
  http://autobuild.buildroot.org/results/d52/d5259b83e7a269bca019d024366aa201f5a174fd/
  http://autobuild.buildroot.org/results/11c/11cb0d1e51459e75e5f376cb07ce0188f8f050c4/
  http://autobuild.buildroot.org/results/bad/bad9a97b4fff00732f2efb043bbb76a99963c491/
  http://autobuild.buildroot.org/results/2f8/2f8bd534e6fcd9d356fe9087cb1394b9b2c4192c/
  and many others...

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: No? Rubinstein <nrubinstein@aldebaran.com>

---
changes v1->v2:
- use @INTLLIBS@ instead of $(INTLLIBS) (ThomasP)
- shrink a bit the patch title (ThomasP)
---
 ...e.am-make-sure-libintl-is-in-LDFLAGS-when.patch | 40 ++++++++++++++++++++++
 package/tpm-tools/Config.in                        |  1 +
 package/tpm-tools/tpm-tools.mk                     |  5 ++-
 3 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 package/tpm-tools/0002-lib-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when.patch

diff --git a/package/tpm-tools/0002-lib-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when.patch b/package/tpm-tools/0002-lib-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when.patch
new file mode 100644
index 0000000..eee92c1
--- /dev/null
+++ b/package/tpm-tools/0002-lib-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when.patch
@@ -0,0 +1,40 @@
+From bbea0774bda411784294b01131bca60428124844 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Mon, 28 Dec 2015 11:04:11 +0100
+Subject: [PATCH] lib/Makefile.am: make sure libintl is in LDFLAGS when needed
+
+The build-system internally builds a couple of static libraries used to
+build the final programs.
+
+When linking these libraries and the final programs, we need to
+explicitly tell the linker to link with libintl in order to resolve all
+the missing symbols.
+
+Use LIBS instead of LDADD/LIBADD to make sure the libintl is added to
+all linker commands (both libraries and programs).
+
+Note that LDADD/LIBADD are the defaults for foo_LDADD/foo_LIBADD, so
+adding the libintl flags to the LDADD/LIBADD variables is not enough
+when the per-target foo_LDADD/foo_LIBADD are set in Makefile.am.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ lib/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index cef6a2f..36e2b3c 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -28,6 +28,8 @@ lib_LTLIBRARIES		= 	libtpm_unseal.la
+ noinst_LTLIBRARIES	=	libtpm_tspi.la	\
+ 				libtpm_utils.la
+ 
++LIBS	+= @INTLLIBS@
++
+ #
+ # Common build flags (with gettext support)
+ AM_CPPFLAGS		=	-I$(top_srcdir)/include -D_LINUX -DLOCALEDIR=\"$(localedir)\"
+-- 
+2.6.4
+
diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
index d54be3e..dd59aaa 100644
--- a/package/tpm-tools/Config.in
+++ b/package/tpm-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TPM_TOOLS
 	bool "tpm-tools"
 	select BR2_PACKAGE_TROUSERS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # trousers
 	depends on !BR2_STATIC_LIBS # trousers
 	help
diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
index 20df489..9dd844d 100644
--- a/package/tpm-tools/tpm-tools.mk
+++ b/package/tpm-tools/tpm-tools.mk
@@ -10,7 +10,10 @@ TPM_TOOLS_SITE = http://downloads.sourceforge.net/project/trousers/tpm-tools/$(T
 TPM_TOOLS_STRIP_COMPONENTS = 2
 TPM_TOOLS_LICENSE = Common Public License Version 1.0
 TPM_TOOLS_LICENSE_FILES = LICENSE
-TPM_TOOLS_DEPENDENCIES = trousers openssl
+TPM_TOOLS_DEPENDENCIES = trousers openssl \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+# lib/Makefile.am is patched
+TPM_TOOLS_AUTORECONF = YES
 
 TPM_TOOLS_CONF_OPTS = --disable-pkcs11-support
 
-- 
2.6.4
