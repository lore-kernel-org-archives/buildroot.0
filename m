From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Aug 2016 12:21:21 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libarchive: fix static linking
	against libpthread
Message-ID: <20160828102121.13601-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e94/e943ee5abc06b1812d7b34976e3a807859958935/

This commit also fixes fwup:
http://autobuild.buildroot.net/results/36b/36b0c6b68209ddd1b0f2db8449392af36876411f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Changed LIBARCHIVE_CONF_ENV from using LDFLAGS to using LIBS, this
    way -lpthread is included in libarchive.pc fixing linking problems
    in other packages using libarchive
    This patch follows the advice from Khem Raj:
    http://lists.busybox.net/pipermail/buildroot/2016-August/169712.html

 package/libarchive/libarchive.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index bcf92f9..d007f49 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -110,6 +110,12 @@ else
 LIBARCHIVE_CONF_OPTS += --without-lzma
 endif
 
+ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+# libarchive uses pthreads if available, but forgets to link with it
+# breaking static builds
+LIBARCHIVE_CONF_ENV = LIBS="-lpthread"
+endif
+
 # The only user of host-libarchive needs zlib support
 HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
 HOST_LIBARCHIVE_CONF_OPTS = \
-- 
2.9.3
