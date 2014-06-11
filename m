From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 15:18:20 +0200
Subject: [Buildroot] [git commit] package/tvheadend: Add optional dependency
	to libiconv
Message-ID: <20140611131923.D72909CFA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a27065eb038f7f8d38d9ba82c5030f16d2628a04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To get reproducable builds depend on libiconv if needed.

tvheadend configure either shows

  checking for cc libiconv ...                      fail

or

  checking for cc libiconv ...                      ok

depending on the presence of libiconv, and gets linked

output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/tvheadend | grep NEEDED | grep iconv
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]

Please note that libiconv is not a hard-dependency.

Tested with minimal defconfig

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_PACKAGE_LIBICONV=y
BR2_PACKAGE_TVHEADEND=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/tvheadend.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
