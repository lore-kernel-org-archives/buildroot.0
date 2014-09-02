From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Sep 2014 23:12:03 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/lame: Fix compile on 32bit Intel
	with gcc-4.9.x
Message-ID: <1409692323-11816-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Better gcc version detection (Arnout)

 package/lame/lame.mk |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index 938b759..af67a3e 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -23,6 +23,19 @@ ifeq ($(BR2_PACKAGE_NCURSES),y)
 LAME_DEPENDENCIES += ncurses
 endif
 
+# cross compiling on 32bit Intel is broken with gcc-4.9.x, for details see
+# http://lists.linuxfromscratch.org/pipermail/blfs-dev/2014-April/027259.html
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56145
+ifeq ($(BR2_i386),y)
+define LAME_COMPILE_FIX
+	if $(TARGET_CC) --version | grep -q '4\.9'; then \
+		$(SED) '/xmmintrin\.h/d' $(@D)/configure; \
+	fi
+endef
+endif
+
+LAME_POST_PATCH_HOOKS += LAME_COMPILE_FIX
+
 ifeq ($(BR2_ENDIAN),"BIG")
 define LAME_BIGENDIAN_ARCH
 	echo "#define WORDS_BIGENDIAN 1" >>$(@D)/config.h
-- 
1.7.10.4
