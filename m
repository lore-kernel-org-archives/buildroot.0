From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu, 21 Jul 2016 09:20:56 -0300
Subject: [Buildroot] [PATCH] libarchive: fix build error when linking with
	lzma
Message-ID: <1469103656-22134-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails when linking with liblzma compiled without threads support.

./.libs/libarchive.so: undefined reference to `lzma_cputhreads'
./.libs/libarchive.so: undefined reference to `lzma_stream_encoder_mt'

So let's enable LZMA only when toolchain has threads support.

Fixes:
http://autobuild.buildroot.org/results/2cb7f8a056982d0b894d0e2531ef357e74c8b796
http://autobuild.buildroot.org/results/d12954fbd460d396f255158fa127f39ff9d2be8d
http://autobuild.buildroot.org/results/abe10c70f38423a212ab27d7d27e22174eaa5aab
Many more...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/libarchive/libarchive.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 6e9c0a1e867b..6d24258a6195 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -92,7 +92,8 @@ else
 LIBARCHIVE_CONF_OPTS += --without-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_XZ),y)
+# libarchive requires LZMA with thread support in the toolchain
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),$(BR2_PACKAGE_XZ),yy)
 LIBARCHIVE_DEPENDENCIES += xz
 LIBARCHIVE_CONF_OPTS += --with-lzma
 else
-- 
1.9.1
