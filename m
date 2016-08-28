From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Aug 2016 12:06:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libarchive: fix static linking
	against libpthread
Message-ID: <20160828100645.12137-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e94/e943ee5abc06b1812d7b34976e3a807859958935/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libarchive/libarchive.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index bcf92f9..11425fd 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -110,6 +110,11 @@ else
 LIBARCHIVE_CONF_OPTS += --without-lzma
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+# forgets to link with -pthread breaking static link
+LIBARCHIVE_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -pthread"
+endif
+
 # The only user of host-libarchive needs zlib support
 HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
 HOST_LIBARCHIVE_CONF_OPTS = \
-- 
2.9.3
