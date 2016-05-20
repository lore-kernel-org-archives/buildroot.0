From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 20 May 2016 12:01:00 +0100
Subject: [Buildroot] [PATCH v2 next 1/2] openmpi: new package
Message-ID: <1463742061-56758-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Disable Fortran by default.
 - Backport upstream patch into Buildroot.

 package/Config.in                                  |  1 +
 ...-check-if-fgetc-and-fputc-have-been-alrea.patch | 48 ++++++++++++++++++++++
 package/openmpi/Config.in                          | 27 ++++++++++++
 package/openmpi/openmpi.hash                       |  3 ++
 package/openmpi/openmpi.mk                         | 23 +++++++++++
 5 files changed, 102 insertions(+)
 create mode 100644 package/openmpi/0001-vt_iowrap.c-check-if-fgetc-and-fputc-have-been-alrea.patch
 create mode 100644 package/openmpi/Config.in
 create mode 100644 package/openmpi/openmpi.hash
 create mode 100644 package/openmpi/openmpi.mk

diff --git a/package/Config.in b/package/Config.in
index 8668612..0056beb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1177,6 +1177,7 @@ menu "Networking"
 	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
 	source "package/openldap/Config.in"
+	source "package/openmpi/Config.in"
 	source "package/openpgm/Config.in"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
diff --git a/package/openmpi/0001-vt_iowrap.c-check-if-fgetc-and-fputc-have-been-alrea.patch b/package/openmpi/0001-vt_iowrap.c-check-if-fgetc-and-fputc-have-been-alrea.patch
new file mode 100644
index 0000000..00562d0
--- /dev/null
+++ b/package/openmpi/0001-vt_iowrap.c-check-if-fgetc-and-fputc-have-been-alrea.patch
@@ -0,0 +1,48 @@
+From 56a27e5dce8fc78941f26ccb0e688f331fb0641e Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Tue, 17 May 2016 20:46:11 +0100
+Subject: [PATCH] vt_iowrap.c: check if fgetc and fputc have been already
+ defined
+
+This will fix an error like this one:
+
+vt_iowrap.c:1216:5: error: expected identifier or '(' before '__extension__'
+ int fgetc(FILE *stream)
+     ^
+vt_iowrap.c:1329:5: error: expected identifier or '(' before '__extension__'
+ int fputc(int c, FILE *stream)
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ ompi/contrib/vt/vt/vtlib/vt_iowrap.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/ompi/contrib/vt/vt/vtlib/vt_iowrap.c b/ompi/contrib/vt/vt/vtlib/vt_iowrap.c
+index 218b8a7..ba3e63d 100644
+--- a/ompi/contrib/vt/vt/vtlib/vt_iowrap.c
++++ b/ompi/contrib/vt/vt/vtlib/vt_iowrap.c
+@@ -1213,6 +1213,10 @@ size_t fwrite( const void *buf, size_t size, size_t nmemb, FILE *stream)
+ }
+ 
+ 
++/* fgetc may be defined as a macro, so we must disable it */
++#if defined(fgetc)
++# undef fgetc
++#endif
+ int fgetc(FILE *stream)
+ {
+ #define VT_IOWRAP_THISFUNCNAME fgetc
+@@ -1326,6 +1330,10 @@ char *gets(char *s)
+ }
+ 
+ 
++/* fputc may be defined as a macro, so we must disable it */
++#if defined(fputc)
++# undef fputc
++#endif
+ int fputc(int c, FILE *stream)
+ {
+ #define VT_IOWRAP_THISFUNCNAME fputc
+-- 
+2.7.3
+
diff --git a/package/openmpi/Config.in b/package/openmpi/Config.in
new file mode 100644
index 0000000..0307a62
--- /dev/null
+++ b/package/openmpi/Config.in
@@ -0,0 +1,27 @@
+comment "openmpi needs a toolchain w/ dynamic library, NPTL, wchar, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_OPENMPI
+	bool "openmpi"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	help
+	  A High Performance Message Passing Library.
+
+	  https://www.open-mpi.org/
+
+if BR2_PACKAGE_OPENMPI
+
+config BR2_PACKAGE_OPENMPI_EXTRACONF
+	string "Additional parameters for ./configure"
+	default ""
+	help
+	  Extra parameters that will be appended to openmpi's
+	  ./configure commandline.
+
+endif
diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
new file mode 100644
index 0000000..92152a2
--- /dev/null
+++ b/package/openmpi/openmpi.hash
@@ -0,0 +1,3 @@
+# From: https://www.open-mpi.org/software/ompi/v1.10/
+md5 b2f43d9635d2d52826e5ef9feb97fd4c  openmpi-1.10.2.tar.bz2
+sha1 03934fc0a2dd0d0d2d0459d714a976eabca938fb  openmpi-1.10.2.tar.bz2
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
new file mode 100644
index 0000000..7b19631
--- /dev/null
+++ b/package/openmpi/openmpi.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# openmpi
+#
+################################################################################
+
+OPENMPI_VERSION_MAJOR = 1.10
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).2
+OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
+OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
+OPENMPI_LICENSE = BSD
+OPENMPI_LICENSE_FILES = LICENSE
+OPENMPI_INSTALL_STAGING = YES
+
+# Disable fortran by default until we add BR2_TOOLCHAIN_HAS_FORTRAN
+# hidden symbol to our toolchain infrastructure
+OPENMPI_CONF_OPTS += --enable-mpi-fortran=no
+
+# The amount of configure options in openmpi is huge. Let the user to have the
+# posibility to pass the desired options in BR2_PACKAGE_OPENMPI_EXTRACONF.
+OPENMPI_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_OPENMPI_EXTRACONF))
+
+$(eval $(autotools-package))
-- 
2.7.3
