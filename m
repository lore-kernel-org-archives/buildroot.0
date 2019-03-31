From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 13:56:52 +0200
Subject: [Buildroot] [git commit] package/vdr: bump to version 2.4.0
Message-ID: <20190331115536.3E2EE8476B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=573d15b0790cfd2838cf0544ded79b415e20f5a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add a dependency to glibc for execinfo.h and drop first patch (as it
  was useful only for uclibc)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vdr/0001-getloadavg.patch                  | 55 ----------------------
 .../vdr/{0002-libjpeg.patch => 0001-libjpeg.patch} |  0
 package/vdr/Config.in                              |  6 +--
 package/vdr/vdr.hash                               |  7 +--
 package/vdr/vdr.mk                                 |  4 +-
 5 files changed, 9 insertions(+), 63 deletions(-)

diff --git a/package/vdr/0001-getloadavg.patch b/package/vdr/0001-getloadavg.patch
deleted file mode 100644
index 3937c83dd8..0000000000
--- a/package/vdr/0001-getloadavg.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Fix compilation with uClibc
-
-Ported from
-https://github.com/stschake/buildroot-grasshopper/blob/master/package/torsmo/torsmo-0.18-uclibc-getloadavg.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uwNr vdr-2.3.1.org/skinlcars.c vdr-2.3.1/skinlcars.c
---- vdr-2.3.1.org/skinlcars.c	2015-09-01 12:07:07.000000000 +0200
-+++ vdr-2.3.1/skinlcars.c	2016-07-31 21:00:11.000000000 +0200
-@@ -1099,6 +1099,44 @@
-      }
- }
- 
-+/* uclibc and dietlibc do not have this junk -ReneR */
-+#if defined (__UCLIBC__) || defined (__dietlibc__)
-+static int getloadavg (double loadavg[], int nelem)
-+{
-+  int fd;
-+
-+  fd = open ("/proc/loadavg", O_RDONLY);
-+  if (fd < 0)
-+    return -1;
-+  else
-+    {
-+      char buf[65], *p;
-+      ssize_t nread;
-+      int i;
-+
-+      nread = read (fd, buf, sizeof buf - 1);
-+      close (fd);
-+      if (nread <= 0)
-+	return -1;
-+      buf[nread - 1] = '\0';
-+
-+      if (nelem > 3)
-+	nelem = 3;
-+      p = buf;
-+      for (i = 0; i < nelem; ++i)
-+	{
-+	  char *endp;
-+	  loadavg[i] = strtod (p, &endp);
-+	  if (endp == p)
-+	    return -1;
-+	  p = endp;
-+	}
-+
-+      return i;
-+    }
-+}
-+#endif
-+
- void cSkinLCARSDisplayMenu::DrawLoad(void)
- {
-   if (yb04) {
diff --git a/package/vdr/0002-libjpeg.patch b/package/vdr/0001-libjpeg.patch
similarity index 100%
rename from package/vdr/0002-libjpeg.patch
rename to package/vdr/0001-libjpeg.patch
diff --git a/package/vdr/Config.in b/package/vdr/Config.in
index 65117f5461..712364a971 100644
--- a/package/vdr/Config.in
+++ b/package/vdr/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_VDR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
-	depends on !BR2_TOOLCHAIN_USES_MUSL # _nl_msg_cat_cntr
+	depends on BR2_TOOLCHAIN_USES_GLIBC #??execinfo.h
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_FONTCONFIG
@@ -18,9 +18,9 @@ config BR2_PACKAGE_VDR
 
 	  http://www.tvdr.de
 
-comment "vdr needs a glibc or uClibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9"
+comment "vdr needs a glibc toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		BR2_TOOLCHAIN_USES_MUSL || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index 2ced98d967..e9cee9a5b5 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,4 +1,5 @@
-# From https://www.linuxtv.org/pipermail/vdr/2017-May/029263.html
-md5 01fabef4d20ec01f11d53354d99a9642  vdr-2.3.5.tar.bz2
+# From https://www.linuxtv.org/pipermail/vdr/2018-April/029407.html
+md5 12c6a3abeadfa915fcfe736bb047a3ab  vdr-2.4.0.tar.bz2
 # Locally computed
-sha256 323fd01e4f8daef24bbdcb906023d18c998a204a22de110d1cb0089532e818b5  vdr-2.3.5.tar.bz2
+sha256 93af49fe87048073dc38ef5e6c71e9704344d730f21c261afac69e3c937f8cce  vdr-2.4.0.tar.bz2
+sha256 ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index 242c5798d1..67e160c8f0 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.3.5
+VDR_VERSION = 2.4.0
 VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
-VDR_SITE = ftp://ftp.tvdr.de/vdr/Developer
+VDR_SITE = ftp://ftp.tvdr.de/vdr
 VDR_LICENSE = GPL-2.0+
 VDR_LICENSE_FILES = COPYING
 VDR_INSTALL_STAGING = YES
