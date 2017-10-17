From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Oct 2017 17:42:12 +0300
Subject: [Buildroot] [PATCH 1/2] msgpack: fix build without threads support
Message-ID: <10b0beaaa7f14fb4847cb2c1d7cdda39ce6aa566.1508251333.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some example code depends on pthreads. Disable examples build when no
threads support is available.

Fixes:
http://autobuild.buildroot.net/results/f5d/f5d493dbe65cbe58d0924176efbd12e4a078f3ee/
http://autobuild.buildroot.net/results/813/81387649d9dbdfe4ccba9c7d0885aa8bd5239938/
http://autobuild.buildroot.net/results/9d4/9d486fca93136bb9dbf22c9101186d9d1fc0eb66/

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/msgpack/msgpack.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index f6f3ab0c83f9..ff8581ecb8c9 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -10,4 +10,8 @@ MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
 MSGPACK_INSTALL_STAGING = YES
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+MSGPACK_CONF_OPTS += -DMSGPACK_BUILD_EXAMPLES=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.14.2
