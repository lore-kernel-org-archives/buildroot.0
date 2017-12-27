From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 27 Dec 2017 16:50:03 +0200
Subject: [Buildroot] [PATCH 1/1] gcc: Add support for --enable-default-pie
 configure option.
Message-ID: <20171227145003.1669-1-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this option GCC will make PIE binaries by default. To override this
default behaviour, use -no-pie

https://gcc.gnu.org/onlinedocs/gcc-6.2.0/gcc/Link-Options.html

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/gcc/Config.in.host | 10 ++++++++++
 package/gcc/gcc.mk         |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 70cce0a5c5..bf646fa07b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -152,3 +152,13 @@ config BR2_GCC_ENABLE_GRAPHITE
 
 comment "graphite support needs gcc >= 5.x"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
+config BR2_GCC_ENABLE_DEFAULT_PIE
+	bool "Enable default PIE support"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	help
+	  This option enables the GCC to make PIE
+	  binaries by default.
+
+comment "default PIE support needs gcc >= 6.x"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 27fc1e987c..0910fb3932 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -183,6 +183,10 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
+ifeq ($(BR2_GCC_ENABLE_DEFAULT_PIE),y)
+HOST_GCC_COMMON_CONF_OPTS += --enable-default-pie
+endif
+
 ifeq ($(BR2_arc)$(BR2_or1k),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
-- 
2.13.6
