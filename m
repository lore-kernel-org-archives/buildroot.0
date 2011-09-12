From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 13:57:14 +0200
Subject: [Buildroot] [git commit] musepack: disable parallel build
Message-ID: <20110912121423.4739C8D588@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d5b35e2c700c7316c90a0aee9710382e8b10e2cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The musepack build system contains a race condition, which gets triggered by
high BR2_JLEVEL settings - It tries to link against libmpcdec before it is
created:

Linking C executable mpcgain
/scratch/peko/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.4.6/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: cannot find -lmpcdec
collect2: ld returned 1 exit status
make[3]: *** [mpcgain/mpcgain] Error 1

Fix it by disabling parallel build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/musepack/musepack.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/musepack/musepack.mk b/package/multimedia/musepack/musepack.mk
index 21601eb..1e5ebcf 100644
--- a/package/multimedia/musepack/musepack.mk
+++ b/package/multimedia/musepack/musepack.mk
@@ -9,5 +9,6 @@ MUSEPACK_SITE = http://files.musepack.net/source
 MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
+MUSEPACK_MAKE = $(MAKE1)
 
 $(eval $(call CMAKETARGETS,package/multimedia,musepack))
-- 
1.7.3.4
