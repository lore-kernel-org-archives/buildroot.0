From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 23:49:16 +0100
Subject: [Buildroot] [git commit] php: fix C++ link issue
Message-ID: <20121117225526.A8FE09A081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5995d68f953aa0066eeaa245e2db52cc147de0d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The intl module is implemented in C++, but PHP fails to use g++ as the
compiler for the final link. As a workaround, tell it to link
with libstdc++.

Fixes:

  http://autobuild.buildroot.org/results/13eefdf2121fa1aea7a844bbed8b6cbce3b45996/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 6ac9f29..0dfb6db 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -102,6 +102,10 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
 	PHP_CONF_OPT += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += icu
+	# The intl module is implemented in C++, but PHP fails to use
+	# g++ as the compiler for the final link. As a workaround,
+	# tell it to link libstdc++.
+	PHP_CONF_ENV += EXTRA_LIBS="-lstdc++"
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
