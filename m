From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Jul 2017 22:03:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/x265: disable altivec on ppc64
Message-ID: <20170723200339.12575-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable altivec support until gcc problems are fixed:
https://bitbucket.org/multicoreware/x265/issues/320/fail-to-build-on-power8-le#comment-34076791

Fixes
http://autobuild.buildroot.net/results/419/41910d44ff98c60a6bb9fd3b6a10bd4d0b98d646/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x265/x265.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 2907ba373..2facf2c1d 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -16,6 +16,12 @@ ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X265_DEPENDENCIES += host-yasm
 endif
 
+# disable altivec, it has build issues
+# https://bitbucket.org/multicoreware/x265/issues/320/
+ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
+X265_CONF_OPTS += -DENABLE_ALTIVEC=OFF
+endif
+
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 X265_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_PIC=ON
 else
-- 
2.11.0
