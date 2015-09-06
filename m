From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Sep 2015 21:54:18 +0200
Subject: [Buildroot] [PATCH 1/5] package/freerdp: bump to master
In-Reply-To: <cover.1441569038.git.yann.morin.1998@free.fr>
References: <cover.1441569038.git.yann.morin.1998@free.fr>
Message-ID: <4e62ce63a1a98b7ad9a341e02310759e1c954b9c.1441569038.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we're packaging FreeRDP from the stable-1.1 branch, which has
not evolved since march 2015 and hasn't seen any release (not even a
tag) since July 2013. It is by all purpose and means, dead.

Other packages that may use FreeRDP (like weston) are now migrating to,
or have already migrated to using the API from master, which has changed
a bit from what was available on the stable-1.1 branch. So, those
packages now FTBFS.

However, FreeRDP still has not done a release from their master branch;
the last tag dates back to September 2014 and there are 1850+ changes on
top of that tag.

So, switch to using the currently-latest commit from master.

This version can also use gstreamer-1.x (in addition to gst-0.x), which
needs quite some rework on how we handle the dependency on gstreamer.
Drop gstreamer support entirely, support for gst-0.x and gst-1.x will be
re-added in a followup patch.

Similarly, a wayland client can now be built, support for which will
be added in a subsequent path; it is currently forcibly disabled.

The way the libraries are built has changed: the previous single library
has been split in multiple libraries, each implementing parts of the RDP
protocol.

Slight rewording of the prompts:
  - drop the 'install' for client and server.
  - drop 'freerdp' from the client and server comment

The location of the server keys has changed, so copy them from the new
location.

Finally, drop patches 1 and 3, applied upstrem; rename remaining
patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/0001-add-support-for-uclibc.patch  | 127 ---------------------
 ...s.patch => 0001-fix-building-shared-libs.patch} |   7 +-
 ...patch => 0002-add-support-for-tz-package.patch} |   0
 .../0003-dont-use-unavailable-c99-math.patch       |  95 ---------------
 package/freerdp/Config.in                          |  12 +-
 package/freerdp/freerdp.mk                         |  45 +++++---
 6 files changed, 38 insertions(+), 248 deletions(-)
 delete mode 100644 package/freerdp/0001-add-support-for-uclibc.patch
 rename package/freerdp/{0002-fix-building-shared-libs.patch => 0001-fix-building-shared-libs.patch} (92%)
 rename package/freerdp/{0004-add-support-for-tz-package.patch => 0002-add-support-for-tz-package.patch} (100%)
 delete mode 100644 package/freerdp/0003-dont-use-unavailable-c99-math.patch

diff --git a/package/freerdp/0001-add-support-for-uclibc.patch b/package/freerdp/0001-add-support-for-uclibc.patch
deleted file mode 100644
index feefc45..0000000
--- a/package/freerdp/0001-add-support-for-uclibc.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 39ac68abaff0d7b59cbe80036aac37f41ad976ec Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 24 Sep 2014 13:54:15 +0100
-Subject: [PATCH] Add support for uClibc
-
-The stable-1.1 branch of freerdp fails to build when using a uClibc
-toolchain because it's using functions which are not implemented in
-uClibc, like eventfd_read, eventfd_write and futimes. That is causing
-build failures like these ones:
-
-../../libwinpr/synch/libwinpr-synch.so.0.1.0: undefined reference to
-`eventfd_read'
-../../libwinpr/synch/libwinpr-synch.so.0.1.0: undefined reference to
-`eventfd_write'
-
-../../common/libfreerdp-client.so.1.1.0: undefined reference to
-`futimes'
-
-This patch is based on this upstream patch:
-
-  https://github.com/FreeRDP/FreeRDP/commit/5f9c36da5d5cd3c5dce49f7b32fe011cb293f9ec/
-
-To support newer versions of uClibc and uclibc-ng this patch also includes a
-backported version of upstream commit 3b7d3190a16c (Fix build with newer
-uclibc versions, 2015-04-28)
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[baruch: merge in upstream commit 3b7d3190a16c]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- CMakeLists.txt                     |  3 +++
- channels/drive/client/drive_file.c | 12 +++++++++---
- config.h.in                        |  1 +
- winpr/libwinpr/synch/event.c       | 14 ++++++++++++++
- 4 files changed, 27 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 375e2d1b6845..5b7887601aa0 100755
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -276,6 +276,9 @@ endif()
- 
- if(UNIX OR CYGWIN)
- 	check_include_files(sys/eventfd.h HAVE_EVENTFD_H)
-+	if (HAVE_EVENTFD_H)
-+		check_symbol_exists(eventfd_read sys/eventfd.h WITH_EVENTFD_READ_WRITE)
-+	endif()
- 	set(X11_FEATURE_TYPE "RECOMMENDED")
- else()
- 	set(X11_FEATURE_TYPE "DISABLED")
-diff --git a/channels/drive/client/drive_file.c b/channels/drive/client/drive_file.c
-index 376b4fe74be7..b20f408aa356 100644
---- a/channels/drive/client/drive_file.c
-+++ b/channels/drive/client/drive_file.c
-@@ -480,7 +480,11 @@ BOOL drive_file_set_information(DRIVE_FILE* file, UINT32 FsInformationClass, UIN
- 	int status;
- 	char* fullpath;
- 	struct STAT st;
-+#if defined(ANDROID)
- 	struct timeval tv[2];
-+#else
-+	struct timespec tv[2];
-+#endif
- 	UINT64 LastWriteTime;
- 	UINT32 FileAttributes;
- 	UINT32 FileNameLength;
-@@ -501,15 +505,17 @@ BOOL drive_file_set_information(DRIVE_FILE* file, UINT32 FsInformationClass, UIN
- 				return FALSE;
- 
- 			tv[0].tv_sec = st.st_atime;
--			tv[0].tv_usec = 0;
- 			tv[1].tv_sec = (LastWriteTime > 0 ? FILE_TIME_RDP_TO_SYSTEM(LastWriteTime) : st.st_mtime);
--			tv[1].tv_usec = 0;
- #ifndef WIN32
- /* TODO on win32 */                        
- #ifdef ANDROID
-+			tv[0].tv_usec = 0;
-+			tv[1].tv_usec = 0;
- 			utimes(file->fullpath, tv);
- #else
--			futimes(file->fd, tv);
-+			tv[0].tv_nsec = 0;
-+			tv[1].tv_nsec = 0;
-+			futimens(file->fd, tv);
- #endif
- 
- 			if (FileAttributes > 0)
-diff --git a/config.h.in b/config.h.in
-index 2b8ec09c2afb..55c595d0e162 100755
---- a/config.h.in
-+++ b/config.h.in
-@@ -33,6 +33,7 @@
- #cmakedefine WITH_JPEG
- #cmakedefine WITH_WIN8
- #cmakedefine WITH_RDPSND_DSOUND
-+#cmakedefine WITH_EVENTFD_READ_WRITE
- 
- /* Plugins */
- #cmakedefine STATIC_CHANNELS
-diff --git a/winpr/libwinpr/synch/event.c b/winpr/libwinpr/synch/event.c
-index 173afafb7cc9..cb3f338178d9 100644
---- a/winpr/libwinpr/synch/event.c
-+++ b/winpr/libwinpr/synch/event.c
-@@ -115,6 +115,20 @@ HANDLE OpenEventA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCSTR lpName)
- 	return NULL;
- }
- 
-+#ifdef HAVE_EVENTFD_H
-+#if !defined(WITH_EVENTFD_READ_WRITE)
-+static int eventfd_read(int fd, eventfd_t* value)
-+{
-+	return (read(fd, value, sizeof(*value)) == sizeof(*value)) ? 0 : -1;
-+}
-+
-+static int eventfd_write(int fd, eventfd_t value)
-+{
-+	return (write(fd, &value, sizeof(value)) == sizeof(value)) ? 0 : -1;
-+}
-+#endif
-+#endif
-+
- BOOL SetEvent(HANDLE hEvent)
- {
- 	ULONG Type;
--- 
-1.7.1
-
diff --git a/package/freerdp/0002-fix-building-shared-libs.patch b/package/freerdp/0001-fix-building-shared-libs.patch
similarity index 92%
rename from package/freerdp/0002-fix-building-shared-libs.patch
rename to package/freerdp/0001-fix-building-shared-libs.patch
index 420f3d3..8922cb1 100644
--- a/package/freerdp/0002-fix-building-shared-libs.patch
+++ b/package/freerdp/0001-fix-building-shared-libs.patch
@@ -12,12 +12,15 @@ Cc: Samuel Martin <s.martin49@gmail.com>
 diff -durN freerdp-440916eae2e07463912d5fe507677e67096eb083.orig/winpr/tools/makecert/CMakeLists.txt freerdp-440916eae2e07463912d5fe507677e67096eb083/winpr/tools/makecert/CMakeLists.txt
 --- freerdp-440916eae2e07463912d5fe507677e67096eb083.orig/winpr/tools/makecert/CMakeLists.txt	2014-08-25 06:52:43.000000000 -0700
 +++ freerdp-440916eae2e07463912d5fe507677e67096eb083/winpr/tools/makecert/CMakeLists.txt	2014-10-24 15:39:39.600319523 -0700
-@@ -43,3 +43,8 @@
+@@ -37,4 +37,11 @@
+ add_subdirectory(cli)
  
  set_property(TARGET ${MODULE_NAME} PROPERTY FOLDER "WinPR/Tools")
- 
++
 +if(BUILD_SHARED_LIBS)
 +	# build libwinpr-makecert-tool.a with PIC because it is used to build
 +	# the shared library libxfreerdp-server.so.
 +	set_property(TARGET ${MODULE_NAME} PROPERTY POSITION_INDEPENDENT_CODE TRUE)
 +endif()
++
+ export_complex_library(LIBNAME ${MODULE_NAME})
diff --git a/package/freerdp/0004-add-support-for-tz-package.patch b/package/freerdp/0002-add-support-for-tz-package.patch
similarity index 100%
rename from package/freerdp/0004-add-support-for-tz-package.patch
rename to package/freerdp/0002-add-support-for-tz-package.patch
diff --git a/package/freerdp/0003-dont-use-unavailable-c99-math.patch b/package/freerdp/0003-dont-use-unavailable-c99-math.patch
deleted file mode 100644
index 1e23c0d..0000000
--- a/package/freerdp/0003-dont-use-unavailable-c99-math.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From c0d27019745184052bd428ba74a50de96053cea1 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 3 May 2015 20:46:22 +0300
-Subject: [PATCH] Don't use unavailable C99 long double math functions
-
-uClibc variants do not provide the C99 long double math functions like ceill,
-powl, etc.. For future compatibility use check_symbol_exists() to check
-whether these functions are available, and keep the result in
-HAVE_MATH_C99_LONG_DOUBLE. Use that instead of the fragile Cygwin version
-check in triodef.h.
-
-Fixes build failures under uClibc(-ng) like:
-
-../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `powl'
-../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `fmodl'
-../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `ceill'
-../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `log10l'
-../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `floorl'
-collect2: error: ld returned 1 exit status
-
-Backported from upstream commit
-https://github.com/FreeRDP/FreeRDP/commit/414663cc363108cb71a290de1c86a1b04384fb39
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- CMakeLists.txt                      |  3 +++
- config.h.in                         |  1 +
- winpr/libwinpr/utils/trio/triodef.h | 25 ++++++-------------------
- 3 files changed, 10 insertions(+), 19 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5b7887601aa0..177e44cfff10 100755
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -279,6 +279,9 @@ if(UNIX OR CYGWIN)
- 	if (HAVE_EVENTFD_H)
- 		check_symbol_exists(eventfd_read sys/eventfd.h WITH_EVENTFD_READ_WRITE)
- 	endif()
-+	list(APPEND CMAKE_REQUIRED_LIBRARIES m)
-+	check_symbol_exists(ceill math.h HAVE_MATH_C99_LONG_DOUBLE)
-+	list(REMOVE_ITEM CMAKE_REQUIRED_LIBRARIES m)
- 	set(X11_FEATURE_TYPE "RECOMMENDED")
- else()
- 	set(X11_FEATURE_TYPE "DISABLED")
-diff --git a/config.h.in b/config.h.in
-index 55c595d0e162..983310d5b9e6 100755
---- a/config.h.in
-+++ b/config.h.in
-@@ -34,6 +34,7 @@
- #cmakedefine WITH_WIN8
- #cmakedefine WITH_RDPSND_DSOUND
- #cmakedefine WITH_EVENTFD_READ_WRITE
-+#cmakedefine HAVE_MATH_C99_LONG_DOUBLE
- 
- /* Plugins */
- #cmakedefine STATIC_CHANNELS
-diff --git a/winpr/libwinpr/utils/trio/triodef.h b/winpr/libwinpr/utils/trio/triodef.h
-index 11c14b9c42c7..2a0479526f33 100644
---- a/winpr/libwinpr/utils/trio/triodef.h
-+++ b/winpr/libwinpr/utils/trio/triodef.h
-@@ -313,25 +313,12 @@ typedef void * trio_pointer_t;
- # define TRIO_COMPILER_SUPPORTS_LL
- #endif
- 
--#if defined(__CYGWIN__)
--/*
-- * Cygwin defines the macros for hosted C99, but does not support certain
-- * long double math functions.
-- */
--# include <cygwin/version.h>
--# define TRIO_CYGWIN_VERSION_API CYGWIN_VERSION_API_MAJOR * 1000 + \
--   CYGWIN_VERSION_API_MINOR
--/*
-- * Please change the version number below when the Cygwin API supports
-- * long double math functions (powl, fmodl, etc.)
-- */
--# if TRIO_CYGWIN_VERSION_API < 99999999
--#  define TRIO_NO_FLOORL 1
--#  define TRIO_NO_CEILL 1
--#  define TRIO_NO_POWL 1
--#  define TRIO_NO_FMODL 1
--#  define TRIO_NO_LOG10L 1
--# endif
-+#if !defined(HAVE_MATH_C99_LONG_DOUBLE)
-+# define TRIO_NO_FLOORL 1
-+# define TRIO_NO_CEILL 1
-+# define TRIO_NO_POWL 1
-+# define TRIO_NO_FMODL 1
-+# define TRIO_NO_LOG10L 1
- #endif
- 
- #endif /* TRIO_TRIODEF_H */
--- 
-2.1.4
-
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index f7d6550..ab8c3f5 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -3,15 +3,15 @@ config BR2_PACKAGE_FREERDP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_GST_PLUGINS_BASE if BR2_PACKAGE_GSTREAMER
-	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP if BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  FreeRDP is a free implementation of the Remote Desktop
 	  Protocol (RDP), released under the Apache license
 
-	  This only installs the freerdp library.
+	  This only installs the freerdp libraries.
 
 	  http://www.freerdp.com/
 
@@ -24,7 +24,7 @@ config BR2_PACKAGE_FREERDP
 if BR2_PACKAGE_FREERDP
 
 config BR2_PACKAGE_FREERDP_SERVER
-	bool "build server"
+	bool "server"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
@@ -32,13 +32,13 @@ config BR2_PACKAGE_FREERDP_SERVER
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 
 config BR2_PACKAGE_FREERDP_CLIENT
-	bool "build client"
+	bool "client"
 	default y
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 
-comment "freerdp server and client need X.Org"
+comment "server and client need X.Org"
 	depends on !BR2_PACKAGE_XORG7
 
 endif
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 0d10ef8..9205169 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# Changeset on the stable-1.1 branch
-FREERDP_VERSION = 770c67d340d5f0a7b48d53a1ae0fc23aff748fc4
+# Changeset on the master branch
+FREERDP_VERSION = 17834af7bb378f85a3b3cc4dcadaa5125a337e16
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
-FREERDP_DEPENDENCIES = openssl zlib
+FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
@@ -15,13 +15,7 @@ FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev
 
-ifeq ($(BR2_PACKAGE_GSTREAMER),y)
-FREERDP_CONF_OPTS += -DWITH_GSTREAMER=ON
-# freerdp needs gstinterface and gstapp from gst-plugins-base
-FREERDP_DEPENDENCIES += gstreamer gst-plugins-base
-else
-FREERDP_CONF_OPTS += -DWITH_GSTREAMER=OFF
-endif
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF -DWITH_GSTREAMER_1_0=OFF
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPTS += -DWITH_CUPS=ON
@@ -70,16 +64,17 @@ endif
 #---------------------------------------
 # Enabling server and/or client
 
+# Clients and server interface must always be enabled to build the
+# corresponding libraries.
+FREERDP_CONF_OPTS += -DWITH_SERVER_INTERFACE=ON
+FREERDP_CONF_OPTS += -DWITH_CLIENT_INTERFACE=ON
+
 ifeq ($(BR2_PACKAGE_FREERDP_SERVER),y)
-FREERDP_CONF_OPTS += -DWITH_SERVER=ON -DWITH_SERVER_INTERFACE=ON
-else
-FREERDP_CONF_OPTS += -DWITH_SERVER=OFF -DWITH_SERVER_INTERFACE=OFF
+FREERDP_CONF_OPTS += -DWITH_SERVER=ON
 endif
 
 ifeq ($(BR2_PACKAGE_FREERDP_CLIENT),y)
-FREERDP_CONF_OPTS += -DWITH_CLIENT=ON -DWITH_CLIENT_INTERFACE=ON
-else
-FREERDP_CONF_OPTS += -DWITH_CLIENT=OFF -DWITH_CLIENT_INTERFACE=OFF
+FREERDP_CONF_OPTS += -DWITH_CLIENT=ON
 endif
 
 #---------------------------------------
@@ -170,6 +165,20 @@ FREERDP_CONF_OPTS += -DWITH_X11=OFF
 
 endif # ! SERVER && ! CLIENT
 
+#---------------------------------------
+# Post-install hooks to cleanup and install missing stuff
+
+# Shadow server is always installed, no matter what, so we manually
+# remove it if the user does not want the server.
+ifeq ($(BR2_PACKAGE_FREERDP_SERVER),)
+define FREERDP_RM_SHADOW_SERVER
+	rm -f $(TARGET_DIR)/usr/bin/freerdp-shadow
+endef
+FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_RM_SHADOW_SERVER
+endif # ! server
+
+FREERDP_CONF_OPTS += -DWITH_WAYLAND=OFF
+
 # Install the server key and certificate, so that a client can connect.
 # A user can override them with its own in a post-build script, if needed.
 # We install them even if the server is not enabled, since another server
@@ -177,9 +186,9 @@ endif # ! SERVER && ! CLIENT
 # backend). Key and cert are installed world-readable, so non-root users
 # can start a server.
 define FREERDP_INSTALL_KEYS
-	$(INSTALL) -m 0644 -D $(@D)/server/X11/server.key \
+	$(INSTALL) -m 0644 -D $(@D)/server/Sample/server.key \
 		      $(TARGET_DIR)/etc/freerdp/keys/server.key
-	$(INSTALL) -m 0644 -D $(@D)/server/X11/server.crt \
+	$(INSTALL) -m 0644 -D $(@D)/server/Sample/server.crt \
 		      $(TARGET_DIR)/etc/freerdp/keys/server.crt
 endef
 FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_INSTALL_KEYS
-- 
1.9.1
