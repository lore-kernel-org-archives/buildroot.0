From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 24 Oct 2014 12:09:40 +0400
Subject: [Buildroot] [PATCH] package/aircrack-ng: add dependency on !
	BR2_PREFER_STATIC_LIB
Message-ID: <1414138180-24607-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that BR2_PREFER_STATIC_LIB means "do not build dynamic libs and
build statically linked applications" this package just can't be built
in case BR2_PREFER_STATIC_LIB is selected. Add that to dependencies and
drop conditional LDFLAGS manipulations.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/aircrack-ng/Config.in      |    5 +++--
 package/aircrack-ng/aircrack-ng.mk |    5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 314184f..a7a61cb 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -5,11 +5,12 @@ config BR2_PACKAGE_AIRCRACK_NG
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_IW # runtime
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  A set of tools for auditing wireless networks
 
 	  http://www.aircrack-ng.org/
 
-comment "aircrack-ng needs a toolchain w/ largefile, threads"
+comment "aircrack-ng needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index b3bc8f1..6df3e63 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -13,15 +13,14 @@ AIRCRACK_NG_DEPENDENCIES = openssl
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	AIRCRACK_NG_MAKE_OPTS = sqlite=true
 	AIRCRACK_NG_MAKE_OPTS += \
-		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -ldl -lpthread)"
+		LIBSQL="-lsqlite3"
 
 	AIRCRACK_NG_DEPENDENCIES += sqlite
 else
 	AIRCRACK_NG_MAKE_OPTS = sqlite=false
 endif
 
-AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz \
-	$(if $(BR2_PREFER_STATIC_LIB),-ldl -lpthread)
+AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz
 
 define AIRCRACK_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
-- 
1.7.7.6
