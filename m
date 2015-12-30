From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 30 Dec 2015 11:10:50 +0100
Subject: [Buildroot] [PATCH v3] package/tpm-tools: fix build with locale
	support
Message-ID: <1451470250-27174-1-git-send-email-s.martin49@gmail.com>
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
changes v2->v3:
- rework the patch to not alter LIBS values (ThomasP)

changes v1->v2:
- use @INTLLIBS@ instead of $(INTLLIBS) (ThomasP)
- shrink a bit the patch title (ThomasP)
---
 ...-make-sure-libintl-is-in-LDFLAGS-when-nee.patch | 104 +++++++++++++++++++++
 package/tpm-tools/Config.in                        |   1 +
 package/tpm-tools/tpm-tools.mk                     |   5 +-
 3 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 package/tpm-tools/0002-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when-nee.patch

diff --git a/package/tpm-tools/0002-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when-nee.patch b/package/tpm-tools/0002-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when-nee.patch
new file mode 100644
index 0000000..fac7b2c
--- /dev/null
+++ b/package/tpm-tools/0002-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when-nee.patch
@@ -0,0 +1,104 @@
+Fetched from: http://sourceforge.net/p/trousers/mailman/message/34728585/
+Upstream status: Submitted
+
+From 924cbdfc67ca405aa4df2f9d3787365618b58630 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Wed, 30 Dec 2015 00:06:33 +0100
+Subject: [PATCH] Makefile.am: make sure libintl is in LDFLAGS when needed
+
+The build-system internally builds a couple of static libraries used to
+build the final programs.
+
+When linking these libraries and the final programs, we need to
+explicitly tell libtool to link with libintl in order to resolve all the
+missing symbols.
+
+This is done in the appropriate LDADD/LIBADD variables (or the per-target
+*_LDADD/*_LIBADD ones when they do not default to LDADD or LIBADD), for
+any sources using gettext/libintl functionalities.
+
+This change fixes build failures [2,3] in cross-compilation, triggered by
+Buildroot buildfarms [1].
+
+[1] http://autobuild.buildroot.org/
+[2] http://autobuild.buildroot.org/?reason=tpm-tools-1.3.8
+[3] http://autobuild.buildroot.org/results/c82/c82a6c1f41c561b15f10e7b7ffcaed15fa0ec895/build-end.log
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ lib/Makefile.am           | 6 +++---
+ src/cmds/Makefile.am      | 2 +-
+ src/data_mgmt/Makefile.am | 2 +-
+ src/tpm_mgmt/Makefile.am  | 2 +-
+ 4 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index cef6a2f..c1d7009 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -44,7 +44,7 @@ libtpm_utils_la_SOURCES	=	tpm_utils.c \
+ #
+ # TSPI interface library
+ libtpm_tspi_la_SOURCES	=	tpm_tspi.c
+-libtpm_tspi_la_LIBADD	=	libtpm_utils.la -ldl
++libtpm_tspi_la_LIBADD	=	libtpm_utils.la -ldl @INTLLIBS@
+ 
+ #
+ # PKCS#11 interface library
+@@ -52,7 +52,7 @@ if P11_SUPPORT
+ noinst_LTLIBRARIES	+=	libtpm_pkcs11.la
+ 
+ libtpm_pkcs11_la_SOURCES=	tpm_pkcs11.c
+-libtpm_pkcs11_la_LIBADD	=	libtpm_utils.la
++libtpm_pkcs11_la_LIBADD	=	libtpm_utils.la @INTLLIBS@
+ endif
+ 
+ #
+@@ -80,4 +80,4 @@ endif
+ # Unseal library - for addition to existing apps, counter part of seal cmd
+ libtpm_unseal_la_SOURCES =	tpm_unseal.c
+ libtpm_unseal_la_LDFLAGS =	-shared -version-info 1:0:0
+-libtpm_unseal_la_LIBADD  =	-ltspi  libtpm_tspi.la
++libtpm_unseal_la_LIBADD  =	-ltspi  libtpm_tspi.la @INTLLIBS@
+diff --git a/src/cmds/Makefile.am b/src/cmds/Makefile.am
+index de73ecf..27fc9ef 100644
+--- a/src/cmds/Makefile.am
++++ b/src/cmds/Makefile.am
+@@ -30,7 +30,7 @@ else
+ AM_CPPFLAGS	=	-I$(top_srcdir)/include -D_LINUX
+ endif
+ 
+-LDADD		=	$(top_builddir)/lib/libtpm_tspi.la -ltspi $(top_builddir)/lib/libtpm_unseal.la -ltpm_unseal -lcrypto
++LDADD		=	$(top_builddir)/lib/libtpm_tspi.la -ltspi $(top_builddir)/lib/libtpm_unseal.la -ltpm_unseal -lcrypto @INTLLIBS@
+ 
+ tpm_sealdata_SOURCES = tpm_sealdata.c
+ tpm_unsealdata_SOURCES = tpm_unsealdata.c
+diff --git a/src/data_mgmt/Makefile.am b/src/data_mgmt/Makefile.am
+index f8bf41c..de505e4 100644
+--- a/src/data_mgmt/Makefile.am
++++ b/src/data_mgmt/Makefile.am
+@@ -38,7 +38,7 @@ noinst_HEADERS =	data_common.h \
+ # Common build flags
+ AM_CPPFLAGS	=	-I$(top_srcdir)/include -D_LINUX
+ 
+-LDADD		=	$(top_builddir)/lib/libtpm_pkcs11.la -ltspi -ldl
++LDADD		=	$(top_builddir)/lib/libtpm_pkcs11.la -ltspi -ldl @INTLLIBS@
+ 
+ 
+ #
+diff --git a/src/tpm_mgmt/Makefile.am b/src/tpm_mgmt/Makefile.am
+index 195fba9..7ca47c9 100644
+--- a/src/tpm_mgmt/Makefile.am
++++ b/src/tpm_mgmt/Makefile.am
+@@ -55,7 +55,7 @@ else
+ AM_CPPFLAGS	=	-I$(top_srcdir)/include -D_LINUX
+ endif
+ 
+-LDADD		=	$(top_builddir)/lib/libtpm_tspi.la -ltspi
++LDADD		=	$(top_builddir)/lib/libtpm_tspi.la -ltspi @INTLLIBS@
+ 
+ tpm_startup_SOURCES =		tpm_startup.c
+ tpm_reset_SOURCES =		tpm_reset.c
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
