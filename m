From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  3 Jan 2021 20:25:48 +0100
Subject: [Buildroot] [PATCH v1] package/bind: disable backtrace support
Message-ID: <20210103192548.13720-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable backtrace support, fixes linking failure for uclibc/musl based
toolchains.

Fixes:

  - http://autobuild.buildroot.net/results/7a1a140314bc8d134f9eeb95ef2e46e7fb0ce9fd/

  .../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'

  - http://autobuild.buildroot.net/results/f0db5fe7fc6860b7270c784989c451e2e7aa2afb/

  .../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'

  - http://autobuild.buildroot.net/results/cb963298885df37f1e5c4d3ab3989773c01c54fc/

  .../arm-buildroot-linux-musleabihf/bin/ld: ../isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bind/bind.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0df2467bc5..ab42762e12 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -30,7 +30,8 @@ BIND_CONF_OPTS = \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
 	--with-gssapi=no \
-	--enable-filter-aaaa
+	--enable-filter-aaaa \
+	--disable-backtrace
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BIND_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
-- 
2.29.2
