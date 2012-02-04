From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Feb 2012 15:48:45 +0100
Subject: [Buildroot] [PATCH 4/7] lttng-libust: add the dependency on
	util-linux
In-Reply-To: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a0d85d82de2395276de40242f75143c3165bc5c8.1328366921.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This dependency was missing in the initial addition of the package to
Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/Config.in       |    8 ++++++++
 package/lttng-libust/lttng-libust.mk |    2 +-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 335a956..ae74bed 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_LTTNG_LIBUST
 	bool "lttng-libust"
 	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	# util-linux needs wchar and largefile
+	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
 	help
 	  Userspace tracing library for the Lttng tracing
 	  infrastructure. It allows userspace programs to create
@@ -8,3 +13,6 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	  events gathered by LTTng.
 
 	  http://lttng.org
+
+comment "lttng-libust needs WCHAR and LARGEFILE support"
+	depends on !(BR2_USE_WCHAR || BR2_LARGEFILE)
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index a2cef2a..ebe14ca 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -3,6 +3,6 @@ LTTNG_LIBUST_VERSION = 1.9.2
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.gz
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
-LTTNG_LIBUST_DEPENDENCIES    = liburcu
+LTTNG_LIBUST_DEPENDENCIES    = liburcu util-linux
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.4.1
