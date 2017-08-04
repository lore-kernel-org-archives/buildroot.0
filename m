From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 Aug 2017 06:02:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/snappy: remove pthread handling for
	static builds
Message-ID: <20170804040248.8773-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed out by Thomas[1] the special handling of libpthread for
static builds is not needed anymore.

Tested with the following musl & uclibc defconfigs which also fix build
errors:
http://autobuild.buildroot.net/results/39f/39f9fc4300ddca19e8a533765b46838003752000/
http://autobuild.buildroot.net/results/886/8860b9259f7a3aecb2ddbfa787be048072bd347b/

[1] http://lists.busybox.net/pipermail/buildroot/2017-July/199549.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/snappy/snappy.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index f5df6bf1f..a537ade57 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -11,13 +11,4 @@ SNAPPY_LICENSE_FILES = COPYING
 SNAPPY_INSTALL_STAGING = YES
 SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_TESTS=OFF
 
-# libsnappy links with libstdc++. Some libstdc++/arch variants use
-# pthread symbols for internal locking if built with thread
-# support. libstdc++ does not have a .pc file, and its .la file does
-# not mention -pthread.  So, static linkig to libstdc++ will fail if
-# -pthread is not explicity linked to. Only do that for static builds.
-ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
-SNAPPY_CONF_OPTS += LIBS=-pthread
-endif
-
 $(eval $(cmake-package))
-- 
2.11.0
