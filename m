From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Nov 2017 20:38:21 +0100
Subject: [Buildroot] [PATCH 1/1] libupnp: add 1.8.3 version
Message-ID: <20171114193821.25188-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Branch 1.8.x of libupnp is not compatible with branch 1.6.x so add an
option to select the version. By default, libupnp-1.6.x is enabled.

Update gmrender-resurrect, igd2-for-linux, libupnpp, mediastreamer, mpd,
ushare and vlc to make them depends on libupnp-1.6.x instead of
selecting libupnp

vlc and igd2-for-linux should support libunp-1.8.x in their next version

gerbera package (based on MediaTomb) will soon be added and depends on
libupnp-1.8.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gmrender-resurrect/Config.in   |  9 +++++----
 package/igd2-for-linux/Config.in       |  7 ++++---
 package/libupnp/Config.in              | 14 ++++++++++++++
 package/libupnp/libupnp.hash           |  2 ++
 package/libupnp/libupnp.mk             |  4 ++++
 package/libupnpp/Config.in             |  8 ++++----
 package/mediastreamer/mediastreamer.mk |  2 +-
 package/mpd/Config.in                  |  5 ++++-
 package/ushare/Config.in               |  7 +++----
 package/vlc/vlc.mk                     |  2 +-
 10 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/package/gmrender-resurrect/Config.in b/package/gmrender-resurrect/Config.in
index db655ad7f..cfc69a8e9 100644
--- a/package/gmrender-resurrect/Config.in
+++ b/package/gmrender-resurrect/Config.in
@@ -1,16 +1,17 @@
 config BR2_PACKAGE_GMRENDER_RESURRECT
 	bool "gmrender-resurrect"
 	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2, libupnp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2
 	depends on BR2_USE_MMU # gstreamer1
+	depends on BR2_PACKAGE_LIBUPNP_1_6
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE # run-time only
-	select BR2_PACKAGE_LIBUPNP
 	help
 	  UPnP (DLNA) media renderer based on gstreamer
 
 	  https://github.com/hzeller/gmrender-resurrect
 
-comment "gmrender-resurrect needs a toolchain w/ wchar, threads"
+comment "gmrender-resurrect needs libupnp-1.6.x and a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_PACKAGE_LIBUPNP_1_6
diff --git a/package/igd2-for-linux/Config.in b/package/igd2-for-linux/Config.in
index 157cc6f30..9e5f7e9bd 100644
--- a/package/igd2-for-linux/Config.in
+++ b/package/igd2-for-linux/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_IGD2_FOR_LINUX
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBUPNP_1_6
 	select BR2_PACKAGE_IPTABLES # runtime
-	select BR2_PACKAGE_LIBUPNP
 	help
 	  This is The Linux UPnP Internet Gateway Device 2. It is
 	  modified from the original Linux UPnP Internet Gateway Device
@@ -20,6 +20,7 @@ config BR2_PACKAGE_IGD2_FOR_LINUX
 
 	  https://github.com/ffontaine/igd2-for-linux
 
-comment "igd2-for-linux needs a toolchain w/ threads, wchar"
+comment "igd2-for-linux needs libupnp-1.6.x and a toolchain w/ threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_PACKAGE_LIBUPNP_1_6
diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
index 7c6c37607..0a8e98c97 100644
--- a/package/libupnp/Config.in
+++ b/package/libupnp/Config.in
@@ -10,5 +10,19 @@ config BR2_PACKAGE_LIBUPNP
 
 	  http://pupnp.sourceforge.net/
 
+choice
+	prompt "libupnp version"
+	default BR2_PACKAGE_LIBUPNP_1_6
+	help
+	  Select the version of libupnp API you wish to use.
+
+config BR2_PACKAGE_LIBUPNP_1_6
+	bool "libupnp 1.6.x"
+
+config BR2_PACKAGE_LIBUPNP_1_8
+	bool "libupnp 1.8.x"
+
+endchoice
+
 comment "libupnp needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 10124618f..f73755d30 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,2 +1,4 @@
 # Locally computed:
 sha256	0bdfacb7fa8d99b78343b550800ff193264f92c66ef67852f87f042fd1a1ebbc	libupnp-1.6.22.tar.bz2
+sha256	9afa0b09faa9ebd9e8a6425ddbfe8d1d856544c49b1f86fde221219e569a308d	libupnp-1.8.3.tar.bz2
+sha256	0375955c8a79d6e8fa0792d45d00fc4e7710d7ac95bcbd27f9225a83f5c946fd	LICENSE
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index bf01b4d94..8ab58463d 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,11 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_LIBUPNP_1_8),y)
+LIBUPNP_VERSION = 1.8.3
+else
 LIBUPNP_VERSION = 1.6.22
+endif
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 32877ff56..62127b48e 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -1,16 +1,16 @@
 config BR2_PACKAGE_LIBUPNPP
 	bool "libupnpp"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_PACKAGE_LIBUPNP_1_6
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBUPNP
 	help
 	  The libupnpp C++ library wraps libupnp for easier use by
 	  upmpdcli and upplay.
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "libupnpp needs a toolchain w/ C++, threads, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "libupnpp needs libupnp-1.6.x and a toolchain w/ C++, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_PACKAGE_LIBUPNP_1_6
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 1276cfae1..d10c55c73 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -24,7 +24,7 @@ else
 MEDIASTREAMER_CONF_OPTS += --disable-alsa
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+ifeq ($(BR2_PACKAGE_LIBUPNP_1_6),y)
 MEDIASTREAMER_CONF_OPTS += --enable-upnp
 MEDIASTREAMER_DEPENDENCIES += libupnp
 else
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 5991b6f4b..6deddbc09 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -308,11 +308,14 @@ config BR2_PACKAGE_MPD_TCP
 
 config BR2_PACKAGE_MPD_UPNP
 	bool "UPnP"
+	depends on BR2_PACKAGE_LIBUPNP_1_6
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBUPNP
 	help
 	  Enable MPD UPnP client support.
 
+comment "UPnP client support needs libupnp-1.6.x"
+	depends on !BR2_PACKAGE_LIBUPNP_1_6
+
 endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index c3475b846..03dc92820 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_USHARE
 	bool "ushare"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	# ushare has a completely custom configure script that does
 	# broken things with library ordering, which breaks static
 	# linking.
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBUPNP
+	depends on BR2_PACKAGE_LIBUPNP_1_6
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
@@ -13,5 +12,5 @@ config BR2_PACKAGE_USHARE
 
 	  http://ushare.geexbox.org/
 
-comment "ushare needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "ushare needs libupnp-1.6.x and a toolchain with dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_LIBUPNP_1_6
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 4602f92c4..aeb05c411 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -281,7 +281,7 @@ else
 VLC_CONF_OPTS += --disable-theora
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+ifeq ($(BR2_PACKAGE_LIBUPNP_1_6),y)
 VLC_CONF_OPTS += --enable-upnp
 VLC_DEPENDENCIES += libupnp
 else
-- 
2.14.1
