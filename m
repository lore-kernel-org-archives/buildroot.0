From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:12:42 +0200
Subject: [Buildroot] [git commit] vlc: fix build on or1k
Message-ID: <20180912191143.A50C186357@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5809d456ef798d7effd7e82dd5320027767549d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vlc 3.0.4 is also affected by gcc bug internal compiler error on or1k

hw/vaapi/vlc_vaapi.c: In function 'pool_pic_destroy_cb':
hw/vaapi/vlc_vaapi.c:568:1: internal compiler error: in merge_overlapping_regs, at regrename.c:304
 }

Fixes:
 - http://autobuild.buildroot.org/results/771e88e7fb06714dd4b7246f82b95dffcedde343

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 073dbf5b40..73f84d5eb2 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -17,7 +17,7 @@ VLC_INSTALL_STAGING = YES
 
 # gcc bug internal compiler error: in merge_overlapping_regs, at
 # regrename.c:304. This bug is fixed since gcc 6.
-ifeq ($(BR2_microblaze):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
+ifeq ($(BR2_microblaze)$(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
 VLC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
 VLC_CONF_OPTS += --disable-optimizations
 endif
