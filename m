From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 22:35:32 +0200
Subject: [Buildroot] [git commit] package/vdr: new package
Message-ID: <20161025203622.3666C7FCB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=815e4f1a333b789ffd416e2a82f4e542d09cbcbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: minor tweaks.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                 |  1 +
 package/vdr/0001-getloadavg.patch | 55 ++++++++++++++++++++++++++++++++
 package/vdr/0002-libjpeg.patch    | 40 ++++++++++++++++++++++++
 package/vdr/Config.in             | 25 +++++++++++++++
 package/vdr/vdr.hash              |  4 +++
 package/vdr/vdr.mk                | 66 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 191 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f90336b..0a0cd6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1618,6 +1618,7 @@ endif
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
 	source "package/vde2/Config.in"
+	source "package/vdr/Config.in"
 	source "package/vnstat/Config.in"
 	source "package/vpnc/Config.in"
 	source "package/vsftpd/Config.in"
diff --git a/package/vdr/0001-getloadavg.patch b/package/vdr/0001-getloadavg.patch
new file mode 100644
index 0000000..3937c83
--- /dev/null
+++ b/package/vdr/0001-getloadavg.patch
@@ -0,0 +1,55 @@
+Fix compilation with uClibc
+
+Ported from
+https://github.com/stschake/buildroot-grasshopper/blob/master/package/torsmo/torsmo-0.18-uclibc-getloadavg.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uwNr vdr-2.3.1.org/skinlcars.c vdr-2.3.1/skinlcars.c
+--- vdr-2.3.1.org/skinlcars.c	2015-09-01 12:07:07.000000000 +0200
++++ vdr-2.3.1/skinlcars.c	2016-07-31 21:00:11.000000000 +0200
+@@ -1099,6 +1099,44 @@
+      }
+ }
+ 
++/* uclibc and dietlibc do not have this junk -ReneR */
++#if defined (__UCLIBC__) || defined (__dietlibc__)
++static int getloadavg (double loadavg[], int nelem)
++{
++  int fd;
++
++  fd = open ("/proc/loadavg", O_RDONLY);
++  if (fd < 0)
++    return -1;
++  else
++    {
++      char buf[65], *p;
++      ssize_t nread;
++      int i;
++
++      nread = read (fd, buf, sizeof buf - 1);
++      close (fd);
++      if (nread <= 0)
++	return -1;
++      buf[nread - 1] = '\0';
++
++      if (nelem > 3)
++	nelem = 3;
++      p = buf;
++      for (i = 0; i < nelem; ++i)
++	{
++	  char *endp;
++	  loadavg[i] = strtod (p, &endp);
++	  if (endp == p)
++	    return -1;
++	  p = endp;
++	}
++
++      return i;
++    }
++}
++#endif
++
+ void cSkinLCARSDisplayMenu::DrawLoad(void)
+ {
+   if (yb04) {
diff --git a/package/vdr/0002-libjpeg.patch b/package/vdr/0002-libjpeg.patch
new file mode 100644
index 0000000..dbd1f12
--- /dev/null
+++ b/package/vdr/0002-libjpeg.patch
@@ -0,0 +1,40 @@
+Fix compilation with libjpeg
+
+Patch inspired by upstream board:
+http://www.vdr-portal.de/board16-video-disk-recorder/board4-vdr-installation/p1189959-vdr-2-05-mit-libjpeg-9a-kommt-nicht-aus/#post1189959
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr vdr-2.3.1.org/tools.c vdr-2.3.1/tools.c
+--- vdr-2.3.1.org/tools.c	2015-09-10 15:17:55.000000000 +0200
++++ vdr-2.3.1/tools.c	2016-08-01 06:37:44.000000000 +0200
+@@ -1254,15 +1254,15 @@
+         }
+      else {
+         esyslog("ERROR: out of memory");
+-        return false;
++        return FALSE;
+         }
+      if (jcd->mem) {
+         cinfo->dest->next_output_byte = jcd->mem + Used;
+         cinfo->dest->free_in_buffer = jcd->size - Used;
+-        return true;
++        return TRUE;
+         }
+      }
+-  return false;
++  return FALSE;
+ }
+ 
+ static void JpegCompressTermDestination(j_compress_ptr cinfo)
+@@ -1307,8 +1307,8 @@
+   cinfo.in_color_space = JCS_RGB;
+ 
+   jpeg_set_defaults(&cinfo);
+-  jpeg_set_quality(&cinfo, Quality, true);
+-  jpeg_start_compress(&cinfo, true);
++  jpeg_set_quality(&cinfo, Quality, TRUE);
++  jpeg_start_compress(&cinfo, TRUE);
+ 
+   int rs = Width * 3;
+   JSAMPROW rp[Height];
diff --git a/package/vdr/Config.in b/package/vdr/Config.in
new file mode 100644
index 0000000..d283b46
--- /dev/null
+++ b/package/vdr/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_VDR
+	bool "vdr"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_TOOLCHAIN_USES_MUSL # _nl_msg_cat_cntr
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  This project describes how to build your own digital
+	  satellite receiver and Video Disk Recorder.
+
+	  http://www.tvdr.de
+
+comment "vdr needs a glibc or uClibc toolchain w/ C++, dynamic library, NPTL, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_TOOLCHAIN_USES_MUSL || !BR2_USE_WCHAR
diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
new file mode 100644
index 0000000..f076e58
--- /dev/null
+++ b/package/vdr/vdr.hash
@@ -0,0 +1,4 @@
+# From https://www.linuxtv.org/pipermail/vdr/2015-September/028872.html
+md5 391c2ed60e2f7d24563fe3ed5854bc4f  vdr-2.3.1.tar.bz2
+# Locally computed
+sha256 456d3f0ceb699b92ebeaf9ff4c0c68979724d10b01a89d5250133e6f4c262fa7  vdr-2.3.1.tar.bz2
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
new file mode 100644
index 0000000..1894def
--- /dev/null
+++ b/package/vdr/vdr.mk
@@ -0,0 +1,66 @@
+################################################################################
+#
+# vdr
+#
+################################################################################
+
+VDR_VERSION = 2.3.1
+VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
+VDR_SITE = ftp://ftp.tvdr.de/vdr/Developer
+VDR_LICENSE = GPLv2+
+VDR_LICENSE_FILES = COPYING
+VDR_INSTALL_STAGING = YES
+VDR_DEPENDENCIES = \
+	freetype \
+	fontconfig \
+	jpeg \
+	libcap
+
+VDR_INCLUDE_DIRS = -I$(STAGING_DIR)/usr/include/freetype2
+VDR_MAKE_FLAGS = \
+	NO_KBD=yes \
+	PLUGINLIBDIR=/usr/lib/vdr \
+	PREFIX=/usr \
+	VIDEODIR=/var/lib/vdr
+
+ifeq ($(BR2_NEEDS_GETTEXT),y)
+VDR_DEPENDENCIES += gettext
+VDR_LDFLAGS += -lintl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+VDR_DEPENDENCIES += libfribidi
+VDR_INCLUDE_DIRS += -I$(STAGING_DIR)/usr/include/fribidi
+VDR_LDFLAGS += -lfribidi
+VDR_MAKE_FLAGS += BIDI=1
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+VDR_DEPENDENCIES += libiconv
+VDR_LDFLAGS += -liconv
+endif
+
+VDR_MAKE_ENV = \
+	INCLUDES="$(VDR_INCLUDE_DIRS)" \
+	LDFLAGS="$(VDR_LDFLAGS)" \
+	$(VDR_MAKE_FLAGS)
+
+define VDR_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(VDR_MAKE_ENV) \
+		vdr vdr.pc include-dir
+endef
+
+define VDR_INSTALL_STAGING_CMDS
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(VDR_MAKE_ENV) \
+		DESTDIR=$(STAGING_DIR) \
+		install-dirs install-bin install-conf install-includes \
+		install-pc
+endef
+
+define VDR_INSTALL_TARGET_CMDS
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(VDR_MAKE_ENV) \
+		DESTDIR=$(TARGET_DIR) \
+		install-dirs install-bin install-conf
+endef
+
+$(eval $(generic-package))
