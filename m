From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Nov 2014 22:43:35 +0100
Subject: [Buildroot] [git commit] package/aircrack-ng: fix static build
Message-ID: <20141116221147.3C759B5ABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d26d6e63e02dce6323fb886b85dc4ffe669eaab6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Two fixes in one:

  - openssl's libcrypto needs -lz, but because aircrack-ng does not use
    pkg-config, it misses this dependency. The proper fix would be to
    use pkg-config, like is done for pcre with patch
    0001-Makefile-use-pkg-config-to-find-libpcre-it-s-more-cros.patch
    but adding -lz is much easier.

  - sqlite needs -lpthread, so -lpthread must be added _after_ -lsqlite,
    but we currently add it before. So, force -lpthread after -lsqlite
    when we are doing a static build.

Fixes:
    http://autobuild.buildroot.net/results/1ea/1ea877851e9d2aeeaf9d320bef12321ec2925b5b/
    http://autobuild.buildroot.net/results/cdf/cdf0203fc99d5f7e41e508f6d9edb78a0f0ea732/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aircrack-ng/aircrack-ng.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 30298f5..c7fcb63 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -14,7 +14,7 @@ AIRCRACK_NG_MAKE_OPTS = unstable=true
 
 # Account for libpthread in static
 AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) \
-	$(if $(BR2_PREFER_STATIC_LIB),-lpthread)
+	$(if $(BR2_PREFER_STATIC_LIB),-lpthread -lz)
 
 # libnl support has issues when building static
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
@@ -39,9 +39,10 @@ else
 	AIRCRACK_NG_MAKE_OPTS += pcre=false
 endif
 
+# Duplicate -lpthread, because it is also needed by sqlite
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	AIRCRACK_NG_DEPENDENCIES += sqlite
-	AIRCRACK_NG_MAKE_OPTS += sqlite=true LIBSQL="-lsqlite3"
+	AIRCRACK_NG_MAKE_OPTS += sqlite=true LIBSQL="-lsqlite3 $(if $(BR2_PREFER_STATIC_LIB),-lpthread)"
 else
 	AIRCRACK_NG_MAKE_OPTS += sqlite=false
 endif
