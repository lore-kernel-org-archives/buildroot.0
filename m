From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:12:12 +0100
Subject: [Buildroot] [git commit] package/libusb: bump version to 1.0.21
Message-ID: <20170321221215.CF299825DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f8ba21bf4649160149022d5bc7a32f875fd3d7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libusb/0001-parallel-make.patch | 162 --------------------------------
 package/libusb/libusb.hash              |   2 +-
 package/libusb/libusb.mk                |   4 +-
 3 files changed, 2 insertions(+), 166 deletions(-)

diff --git a/package/libusb/0001-parallel-make.patch b/package/libusb/0001-parallel-make.patch
deleted file mode 100644
index a326e99..0000000
--- a/package/libusb/0001-parallel-make.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-Fix parallel build
-
-This patch is a partial backport of
-https://github.com/libusb/libusb/commit/3dc781ce3ecd0315cfc0b4fdcef9e062990f289b
-
-Signed-off-by: Jeroen Roovers <jer@airfi.aero>
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -36,6 +36,7 @@ m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RU
- 
- AC_PREREQ([2.50])
- AC_PROG_CC
-+AC_PROG_CXX
- LT_INIT
- LT_LANG([Windows Resource])
- AC_C_INLINE
-@@ -91,7 +92,6 @@ case $host in
- 	;;
- *-haiku*)
- 	AC_MSG_RESULT([Haiku])
--	AC_CONFIG_SUBDIRS([libusb/os/haiku])
- 	backend="haiku"
- 	threads="posix"
- 	;;
-@@ -193,6 +193,7 @@ AM_CONDITIONAL(OS_HAIKU, test "x$backend
- AM_CONDITIONAL(THREADS_POSIX, test "x$threads" = xposix)
- AM_CONDITIONAL(CREATE_IMPORT_LIB, test "x$create_import_lib" = "xyes")
- AM_CONDITIONAL(USE_UDEV, test "x$enable_udev" = xyes)
-+AM_CONDITIONAL(USE_USBDK, test "x$enable_usbdk" = xyes)
- if test "$threads" = posix; then
- 	AC_DEFINE(THREADS_POSIX, 1, [Use POSIX Threads])
- fi
---- a/libusb/Makefile.am
-+++ b/libusb/Makefile.am
-@@ -4,58 +4,66 @@ AUTOMAKE_OPTIONS = subdir-objects
- 
- lib_LTLIBRARIES = libusb-1.0.la
- 
--POSIX_POLL_SRC = os/poll_posix.c
--LINUX_USBFS_SRC = os/linux_usbfs.c
--DARWIN_USB_SRC = os/darwin_usb.c
-+POSIX_POLL_SRC = os/poll_posix.h os/poll_posix.c
-+POSIX_THREADS_SRC = os/threads_posix.h os/threads_posix.c
-+WINDOWS_POLL_SRC = os/poll_windows.h os/poll_windows.c
-+WINDOWS_THREADS_SRC = os/threads_windows.h os/threads_windows.c
-+LINUX_USBFS_SRC = os/linux_usbfs.h os/linux_usbfs.c
-+DARWIN_USB_SRC = os/darwin_usb.h os/darwin_usb.c
- OPENBSD_USB_SRC = os/openbsd_usb.c
- NETBSD_USB_SRC = os/netbsd_usb.c
--WINDOWS_USB_SRC = os/poll_windows.c os/windows_usb.c libusb-1.0.rc libusb-1.0.def
--WINCE_USB_SRC = os/wince_usb.c os/wince_usb.h
--
--DIST_SUBDIRS = 
--
--EXTRA_DIST = $(LINUX_USBFS_SRC) $(DARWIN_USB_SRC) $(OPENBSD_USB_SRC) \
--	$(NETBSD_USB_SRC) $(WINDOWS_USB_SRC) $(WINCE_USB_SRC) \
--	$(POSIX_POLL_SRC) \
--	os/threads_posix.c os/threads_windows.c \
-+WINDOWS_COMMON_SRC = os/windows_nt_common.h os/windows_nt_common.c \
-+                     os/windows_common.h libusb-1.0.rc libusb-1.0.def
-+WINDOWS_USB_SRC = os/windows_winusb.h os/windows_winusb.c
-+WINDOWS_USBDK_SRC = os/windows_usbdk.h os/windows_usbdk.c
-+WINCE_USB_SRC = os/wince_usb.h os/wince_usb.c
-+HAIKU_USB_SRC = os/haiku_usb.h os/haiku_usb_backend.cpp \
-+		os/haiku_usb_raw.h os/haiku_usb_raw.cpp os/haiku_pollfs.cpp
-+
-+EXTRA_DIST = $(POSIX_POLL_SRC) $(POSIX_THREADS_SRC) \
-+	$(WINDOWS_POLL_SRC) $(WINDOWS_THREADS_SRC) \
-+	$(LINUX_USBFS_SRC) $(DARWIN_USB_SRC) \
-+	$(OPENBSD_USB_SRC) $(NETBSD_USB_SRC) \
-+	$(WINDOWS_COMMON_SRC) $(WINDOWS_USB_SRC) $(WINDOWS_USBDK_SRC) \
-+        $(WINCE_USB_SRC) $(HAIKU_USB_SRC) \
- 	os/linux_udev.c os/linux_netlink.c
- 
--dist-hook:
--	cp -r os/haiku $(distdir)/os/haiku
--	rm -rf $(distdir)/os/haiku/autom4te.cache
--
- if OS_LINUX
- 
- if USE_UDEV
--OS_SRC = $(LINUX_USBFS_SRC) $(POSIX_POLL_SRC) \
--	os/linux_udev.c
-+OS_SRC = $(LINUX_USBFS_SRC) os/linux_udev.c
- else
--OS_SRC = $(LINUX_USBFS_SRC) $(POSIX_POLL_SRC) \
--	os/linux_netlink.c
-+OS_SRC = $(LINUX_USBFS_SRC) os/linux_netlink.c
- endif
- 
- endif
- 
- if OS_DARWIN
--OS_SRC = $(DARWIN_USB_SRC) $(POSIX_POLL_SRC)
-+OS_SRC = $(DARWIN_USB_SRC)
- AM_CFLAGS_EXT = -no-cpp-precomp
- endif
- 
- if OS_OPENBSD
--OS_SRC = $(OPENBSD_USB_SRC) $(POSIX_POLL_SRC)
-+OS_SRC = $(OPENBSD_USB_SRC)
- endif
- 
- if OS_NETBSD
--OS_SRC = $(NETBSD_USB_SRC) $(POSIX_POLL_SRC)
-+OS_SRC = $(NETBSD_USB_SRC)
- endif
- 
- if OS_HAIKU
--OS_SRC = $(POSIX_POLL_SRC)
--SUBDIRS = os/haiku
-+noinst_LTLIBRARIES = libusb_haiku.la
-+libusb_haiku_la_SOURCES = $(HAIKU_USB_SRC)
-+libusb_1_0_la_LIBADD = libusb_haiku.la
- endif
- 
- if OS_WINDOWS
--OS_SRC = $(WINDOWS_USB_SRC)
-+
-+if USE_USBDK
-+OS_SRC = $(WINDOWS_USBDK_SRC) $(WINDOWS_COMMON_SRC)
-+else
-+OS_SRC = $(WINDOWS_USB_SRC) $(WINDOWS_COMMON_SRC)
-+endif
- 
- .rc.lo:
- 	$(AM_V_GEN)$(LIBTOOL) $(AM_V_lt) $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --tag=RC --mode=compile $(RC) $(RCFLAGS) -i $< -o $@
-@@ -69,22 +77,23 @@ if CREATE_IMPORT_LIB
- 	$(AM_V_GEN)$(DLLTOOL) $(DLLTOOLFLAGS) --kill-at --input-def $(srcdir)/libusb-1.0.def --dllname $@ --output-lib .libs/$@.a
- endif
- 
-+if OS_WINDOWS
-+POLL_SRC = $(WINDOWS_POLL_SRC)
-+else
-+POLL_SRC = $(POSIX_POLL_SRC)
-+endif
-+
- if THREADS_POSIX
--THREADS_SRC = os/threads_posix.h os/threads_posix.c
-+THREADS_SRC = $(POSIX_THREADS_SRC)
- else
--THREADS_SRC = os/threads_windows.h os/threads_windows.c
-+THREADS_SRC = $(WINDOWS_THREADS_SRC)
- endif
- 
- libusb_1_0_la_CFLAGS = $(AM_CFLAGS)
- libusb_1_0_la_LDFLAGS = $(LTLDFLAGS)
--libusb_1_0_la_SOURCES = libusbi.h core.c descriptor.c io.c strerror.c sync.c \
--	os/linux_usbfs.h os/darwin_usb.h os/windows_usb.h os/windows_common.h \
--	hotplug.h hotplug.c $(THREADS_SRC) $(OS_SRC) \
--	os/poll_posix.h os/poll_windows.h
--
--if OS_HAIKU
--libusb_1_0_la_LIBADD = os/haiku/libhaikuusb.la
--endif
-+libusb_1_0_la_SOURCES = libusbi.h libusb.h version.h version_nano.h \
-+	core.c descriptor.c hotplug.h hotplug.c io.c strerror.c sync.c \
-+	$(POLL_SRC) $(THREADS_SRC) $(OS_SRC)
- 
- hdrdir = $(includedir)/libusb-1.0
- hdr_HEADERS = libusb.h
diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index c809896..0415aab 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  cb057190ba0a961768224e4dc6883104c6f945b2bf2ef90d7da39e7c1834f7ff  libusb-1.0.20.tar.bz2
+sha256 7dce9cce9a81194b7065ee912bcd55eeffebab694ea403ffb91b67db66b1824b  libusb-1.0.21.tar.bz2
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 4d05feb..26ace1b 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,15 +5,13 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).20
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).21
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPLv2.1+
 LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
-# 0001-parallel-make.patch
-LIBUSB_AUTORECONF = YES
 
 # Avoid the discovery of udev for the host variant
 HOST_LIBUSB_CONF_OPTS = --disable-udev
