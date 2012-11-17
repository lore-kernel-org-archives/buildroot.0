From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 23:24:06 +0100
Subject: [Buildroot] [PATCH 08/10] php: fix C++ link issue
In-Reply-To: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a16e175cd75cefb1127b0deff5ce25e9cf4bb044.1353191025.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The intl module is implemented in C++, but PHP fails to use g++ as the
compiler for the final link. As a workaround, tell it to link
with libstdc++.

Fixes:

  http://autobuild.buildroot.org/results/13eefdf2121fa1aea7a844bbed8b6cbce3b45996/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |    4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.7.9.5
