From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Jun 2014 13:23:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: Add optional dependency
	to libiconv
Message-ID: <1402313033-31085-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To get reproducable builds depend on libiconv if needed.

tvheadend configure either shows

  checking for cc libiconv ...                      fail

or

  checking for cc libiconv ...                      ok

depending on the presence of libiconv, and gets linked

output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/tvheadend | grep NEEDED | grep iconv
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]

Tested with minimal defconfig

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_PACKAGE_LIBICONV=y
BR2_PACKAGE_TVHEADEND=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index c582c07..4d0a16d 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -14,6 +14,10 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+TVHEADEND_DEPENDENCIES += libiconv
+endif
+
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
 define TVHEADEND_CONFIGURE_CMDS
-- 
1.7.10.4
