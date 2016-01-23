From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 10:44:55 +0100
Subject: [Buildroot] [PATCH 1/3] package/tvheadend: bump version
Message-ID: <1453542297-12086-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Default configure options were changed in
https://github.com/tvheadend/tvheadend/commit/ad9b54ad908fdc9a069c734234958ae8ad1eb38f
enabling the download of the source of libhdhomerun and its static
build which will lead to a link error because the host compiler is used
for that build. Therefore disable the static build of libhdhomerun by
tvheadend's build system like we do for ffmpeg.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/0001-no-check_config.patch | 4 ++--
 package/tvheadend/tvheadend.hash             | 2 +-
 package/tvheadend/tvheadend.mk               | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/tvheadend/0001-no-check_config.patch b/package/tvheadend/0001-no-check_config.patch
index 6a0cddd..361ebcd 100644
--- a/package/tvheadend/0001-no-check_config.patch
+++ b/package/tvheadend/0001-no-check_config.patch
@@ -12,12 +12,12 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
 --- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-09 14:47:43.780025330 +0100
 +++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:48:40.836539093 +0100
-@@ -516,7 +516,7 @@
+@@ -566,7 +566,7 @@
  	$(ROOTDIR)/configure $(CONFIGURE_ARGS)
  
  # Binary
 -${PROG}: .config.mk make_webui $(OBJS)
 +${PROG}: make_webui $(OBJS)
- 	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
+ 	$(pCC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
  
  # Object
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 9a8432a..de7bc46 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	28b01f22f2d8efa201a782c1fbac68e4818e8982fd02c51497f492c9e547da67	tvheadend-66e5d277a59db723a8718afb3bdbef63824fa050.tar.gz
+sha256	0caf44de3baaf115d80410b660d99e49a42f50792397254e8f21b6e1c5ca58ef	tvheadend-1aa0073be39119f5d0d79212e6c83c470904a161.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 5f28d4a..43ff979 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 66e5d277a59db723a8718afb3bdbef63824fa050
+TVHEADEND_VERSION = 1aa0073be39119f5d0d79212e6c83c470904a161
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -74,6 +74,7 @@ define TVHEADEND_CONFIGURE_CMDS
 			--enable-dvbscan			\
 			--enable-bundle				\
 			--disable-libffmpeg_static		\
+			--disable-hdhomerun_static		\
 			$(TVHEADEND_CONF_OPTS)			\
 	)
 endef
-- 
2.7.0.rc3
