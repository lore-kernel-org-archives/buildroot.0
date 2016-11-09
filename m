From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:50:12 +0100
Subject: [Buildroot] [git commit branch/next] kodi: allow enablement of
	libamcodec as codec if selected
Message-ID: <20161109215031.173718183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00e7d119ec16cd64f89cb21a2ea715e2bfc3dc73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

allow usage of amcodec if kodi is built and libamcodec is selected

Signed-off-by: Dagg Stompler <daggs@gmx.com>
[Thomas: fix KODI_INCLUDES definition in RPi case, fix indentation.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/0012-Fix_includes_in_amcodec.patch | 38 +++++++++++++++++++++++++
 package/kodi/kodi.mk                            | 17 +++++++++--
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/package/kodi/0012-Fix_includes_in_amcodec.patch b/package/kodi/0012-Fix_includes_in_amcodec.patch
new file mode 100644
index 0000000..4a6d44f
--- /dev/null
+++ b/package/kodi/0012-Fix_includes_in_amcodec.patch
@@ -0,0 +1,38 @@
+commit 4bbb21aa5cee6b2f40759aa8b1bd65246a237f79
+Author: Alex Deryskyba <alex@codesnake.com>
+Date:   Wed May 4 01:38:27 2016 +0200
+
+    [aml] Fix includes in amcodec/codec.h to make them relative
+
+[Taken from upstream commit
+https://github.com/xbmc/xbmc/commit/4bbb21aa5cee6b2f40759aa8b1bd65246a237f79.]
+Signed-off-by: Dagg Stompler <daggs@gmx.com>
+
+diff --git a/tools/depends/target/libamplayer/libamplayer/include/amcodec/codec.h b/tools/depends/target/libamplayer/libamplayer/include/amcodec/codec.h
+index 187d4d5..632c24e 100644
+--- a/tools/depends/target/libamplayer/libamplayer/include/amcodec/codec.h
++++ b/tools/depends/target/libamplayer/libamplayer/include/amcodec/codec.h
+@@ -12,8 +12,8 @@
+ #ifndef CODEC_CTRL_H_
+ #define CODEC_CTRL_H_
+ 
+-#include <codec_type.h>
+-#include <codec_error.h>
++#include "codec_type.h"
++#include "codec_error.h"
+ 
+ 
+ int codec_init(codec_para_t *);
+diff --git a/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in b/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in
+index a1a3447..1bf5a89 100644
+--- a/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in
++++ b/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in
+@@ -24,8 +24,6 @@ endif
+ ifeq (@USE_LIBAMCODEC@,1)
+ SRCS += AMLCodec.cpp
+ SRCS += DVDVideoCodecAmlogic.cpp
+-INCLUDES += -I$(prefix)/include/amcodec
+-INCLUDES += -I$(prefix)/include/amplayer
+ endif
+ 
+ ifeq (@USE_ANDROID@,1)
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e0361da..de4d308 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -96,9 +96,10 @@ endif
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 KODI_DEPENDENCIES += rpi-userland
 KODI_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
-KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
-	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
-	LIBS="-lvcos -lvchostif"
+KODI_INCLUDES += \
+	-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
+	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux
+KODI_LIBS = -lvcos -lvchostif
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
@@ -113,6 +114,16 @@ KODI_DEPENDENCIES += imx-vpuwrap
 KODI_CONF_OPTS += --enable-codec=imxvpu
 endif
 
+ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
+KODI_DEPENDENCIES += libamcodec
+KODI_CONF_OPTS += --enable-codec=amcodec
+KODI_INCLUDES += -I$(STAGING_DIR)/usr/include/amcodec
+endif
+
+KODI_CONF_ENV += \
+	INCLUDES="$(KODI_INCLUDES)" \
+	LIBS="$(KODI_LIBS)"
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 KODI_CONF_OPTS += --enable-libcap
 KODI_DEPENDENCIES += libcap
