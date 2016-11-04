From: Dagg Stompler <daggs@gmx.com>
Date: Fri,  4 Nov 2016 17:47:27 +0200
Subject: [Buildroot] [PATCH v5] kodi: allow enablement of libamcodec as
	codec if selected
Message-ID: <20161104154727.19939-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

allow usage of amcodec if kodi is built and libamcodec is selected

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---

v4 -> v5:
 - add description and signed off to the kodi patch. (Thomas Petazzoni).

v3 -> v4:
 - properly define the includes for amcodec when cross compiling.

v2 -> v3:
 - fix change after kodi.mk was changed.

v1 -> v2:
 - fixed mail title and comment

 .../0012-support_libamcodec_cross_compile.patch    | 24 ++++++++++++++++++++++
 package/kodi/kodi.mk                               |  4 ++++
 2 files changed, 28 insertions(+)
 create mode 100644 package/kodi/0012-support_libamcodec_cross_compile.patch

diff --git a/package/kodi/0012-support_libamcodec_cross_compile.patch b/package/kodi/0012-support_libamcodec_cross_compile.patch
new file mode 100644
index 0000000..97feb8c
--- /dev/null
+++ b/package/kodi/0012-support_libamcodec_cross_compile.patch
@@ -0,0 +1,24 @@
+kodi: fix amcodec includes for cross compilation.
+
+when building kodi over buildroot with amcodec set, the include paths differs from
+native installation. this occurs because the prefix is not set.
+so by supplying the LIBAMCODEC_INCLUDE_PATH upon compilation, this issue is resolved.
+
+Signed-off-by: Dagg Stompler <daggs@gmx.com>
+
+--- a/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in	2016-11-04 11:46:19.000000000 +0200
++++ b/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in	2016-11-04 11:47:13.000000000 +0200
+@@ -26,8 +26,11 @@ endif
+ ifeq (@USE_LIBAMCODEC@,1)
+ SRCS += AMLCodec.cpp
+ SRCS += DVDVideoCodecAmlogic.cpp
+-INCLUDES += -I$(prefix)/include/amcodec
+-INCLUDES += -I$(prefix)/include/amplayer
++ifeq (${LIBAMCODEC_INCLUDE_PATH},)
++LIBAMCODEC_INCLUDE_PATH=$(prefix)
++endif
++INCLUDES += -I${LIBAMCODEC_INCLUDE_PATH}/include/amcodec
++INCLUDES += -I${LIBAMCODEC_INCLUDE_PATH}/include/amplayer
+ endif
+
+ ifeq (@USE_ANDROID@,1)
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e0361da..66aa017 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -111,6 +111,10 @@ endif
 ifeq ($(BR2_PACKAGE_IMX_VPUWRAP),y)
 KODI_DEPENDENCIES += imx-vpuwrap
 KODI_CONF_OPTS += --enable-codec=imxvpu
+else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
+KODI_DEPENDENCIES += libamcodec
+KODI_CONF_OPTS += --enable-codec=amcodec
+KODI_MAKE_OPTS += LIBAMCODEC_INCLUDE_PATH=${STAGING_DIR}/usr
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-- 
2.10.2
