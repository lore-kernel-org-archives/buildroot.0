From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed,  2 Nov 2016 18:46:24 +0100
Subject: [Buildroot] [PATCH] tinyalsa: bump version to 1.0.2
Message-ID: <20161102174624.25414-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tinyalsa has started doing release, so we will use it.

With this release, both our patches were applied mainline:
    - 0001-tinypcminfo-make-function-pcm_get_format_name-static.patch [1]
    - 0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch [2]

The Makefile has changed a lot, so we take advantage of that to simplify
our package.

1. https://github.com/tinyalsa/tinyalsa/commit/7d204edfe87f4e22105bcaeb750d69ac769afdd6
2. https://github.com/tinyalsa/tinyalsa/commit/c8333f8c7a4e4b9549abeef7530b2cd20a18e537

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 ...-make-function-pcm_get_format_name-static.patch | 45 ----------------------
 ...clude-time.h-to-get-struct-timespec-proto.patch | 33 ----------------
 package/tinyalsa/tinyalsa.hash                     |  2 +-
 package/tinyalsa/tinyalsa.mk                       | 20 +++++-----
 4 files changed, 10 insertions(+), 90 deletions(-)
 delete mode 100644 package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch
 delete mode 100644 package/tinyalsa/0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch

diff --git a/package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch b/package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch
deleted file mode 100644
index 4c8d48f..0000000
--- a/package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 10d82df8d920ceec4be9028a4939f96d6f407e81 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 26 Aug 2015 09:20:13 +0200
-Subject: [PATCH] tinypcminfo: make function pcm_get_format_name() static
-
-When building tinyalsa with gcc 5.x, the following warnings appear:
-
-tinypcminfo.c:97:52: warning: 'format_lookup' is static but used in inline function 'pcm_get_format_name' which is not static
-     return bit_index < ARRAY_SIZE(format_lookup) ? format_lookup[bit_index] : NULL;
-                                                    ^
-tinypcminfo.c:97:35: warning: 'format_lookup' is static but used in inline function 'pcm_get_format_name' which is not static
-     return bit_index < ARRAY_SIZE(format_lookup) ? format_lookup[bit_index] : NULL;
-
-And the build fails with:
-
-tinypcminfo.o: In function `main':
-tinypcminfo.c:(.text+0x2f0): undefined reference to `pcm_get_format_name'
-collect2: error: ld returned 1 exit status
-
-To fix this, this patch marks the pcm_get_format_name() as static,
-since it's anyway only used in tinypcminfo.c.
-
-Submitted upstream: https://github.com/tinyalsa/tinyalsa/pull/61
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tinypcminfo.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tinypcminfo.c b/tinypcminfo.c
-index b2d11bc..99eec34 100644
---- a/tinypcminfo.c
-+++ b/tinypcminfo.c
-@@ -92,7 +92,7 @@ static const char *format_lookup[] = {
- /* Returns a human readable name for the format associated with bit_index,
-  * NULL if bit_index is not known.
-  */
--inline const char *pcm_get_format_name(unsigned bit_index)
-+static inline const char *pcm_get_format_name(unsigned bit_index)
- {
-     return bit_index < ARRAY_SIZE(format_lookup) ? format_lookup[bit_index] : NULL;
- }
--- 
-2.5.0
-
diff --git a/package/tinyalsa/0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch b/package/tinyalsa/0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch
deleted file mode 100644
index 1b5d43c..0000000
--- a/package/tinyalsa/0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c8333f8c7a4e4b9549abeef7530b2cd20a18e537 Mon Sep 17 00:00:00 2001
-From: rofl0r <retnyg@gmx.net>
-Date: Mon, 12 Oct 2015 12:57:09 +0100
-Subject: [PATCH] asound.h: include <time.h> to get struct timespec prototype
-
-without including it, we get
-In file included from mixer.c:44:0:
-include/sound/asound.h:337:18: error: field 'trigger_tstamp' has incomplete type
-include/sound/asound.h:338:18: error: field 'tstamp' has incomplete type
-etc.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit c8333f8c7a4e
-
- include/sound/asound.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/sound/asound.h b/include/sound/asound.h
-index a041628ec28e..7c6de81673f5 100644
---- a/include/sound/asound.h
-+++ b/include/sound/asound.h
-@@ -12,6 +12,7 @@
- #ifndef __SOUND_ASOUND_H
- #define __SOUND_ASOUND_H
- 
-+#include <time.h>
- #include <linux/types.h>
- 
- #define SNDRV_PROTOCOL_VERSION(major, minor, subminor) (((major)<<16)|((minor)<<8)|(subminor))
--- 
-2.8.1
-
diff --git a/package/tinyalsa/tinyalsa.hash b/package/tinyalsa/tinyalsa.hash
index 5182b00..e07b419 100644
--- a/package/tinyalsa/tinyalsa.hash
+++ b/package/tinyalsa/tinyalsa.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  a15abd57e74a2c41dbc57cac6fae39a28d2643e9aa48263399de37481b9647d3  tinyalsa-f2a7b6d3d81bd337a540d56704b4aaa7bdb046fe.tar.gz
+sha256  b3f22f762cca8edc692d239a9793a66b11aa5447dcee009e53987f5850f405e3  tinyalsa-v1.0.2.tar.gz
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index 816f683..4cd01d5 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYALSA_VERSION = f2a7b6d3d81bd337a540d56704b4aaa7bdb046fe
+TINYALSA_VERSION = v1.0.2
 TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3c
 TINYALSA_INSTALL_STAGING = YES
@@ -14,19 +14,17 @@ define TINYALSA_BUILD_CMDS
 endef
 
 define TINYALSA_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libtinyalsa.so \
-		$(STAGING_DIR)/usr/lib/libtinyalsa.so
-	$(INSTALL) -D -m 0644 $(@D)/include/tinyalsa/asoundlib.h \
-		$(STAGING_DIR)/usr/include/tinyalsa/asoundlib.h
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(@D) \
+		CROSS_COMPILE="$(TARGET_CROSS)" \
+		DESTDIR="$(STAGING_DIR)" install
 endef
 
 define TINYALSA_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libtinyalsa.so \
-		$(TARGET_DIR)/usr/lib/libtinyalsa.so
-	$(INSTALL) -D -m 0755 $(@D)/tinyplay $(TARGET_DIR)/usr/bin/tinyplay
-	$(INSTALL) -D -m 0755 $(@D)/tinycap $(TARGET_DIR)/usr/bin/tinycap
-	$(INSTALL) -D -m 0755 $(@D)/tinymix $(TARGET_DIR)/usr/bin/tinymix
-	$(INSTALL) -D -m 0755 $(@D)/tinypcminfo $(TARGET_DIR)/usr/bin/tinypcminfo
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(@D) \
+		CROSS_COMPILE="$(TARGET_CROSS)" \
+		DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
-- 
2.9.3
