From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 Feb 2012 11:15:22 +0100
Subject: [Buildroot] [git commit] lttng-libust: add the dependency on
	util-linux
Message-ID: <20120205134245.59188909C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e40b680fb485eacc3d9c1d64cbce2140fb47178
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This dependency was missing in the initial addition of the package to
Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
