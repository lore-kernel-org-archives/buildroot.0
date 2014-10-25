From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:32:55 +0200
Subject: [Buildroot] [git commit] aircrack-ng: don't use -ldl in a static
	lib configuration
Message-ID: <20141025103325.1719C9D831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68e8a10f97ffed4525c5a14b74679c682e8cbf61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit gets rid of the -ldl flag used when
BR2_PREFER_STATIC_LIB=y. First because it does not make sense: when
you use a pure static library configuration, you don't have shared
library support, so you don't have libdl.

The occurences of -ldl were added in commit
1141d99aae9e1b139509ad71c969e6705417a48b ("aircrack-ng: fix static
build") and commit bed1490d0f58dc963d2144f2fe6b705f9f36d848
("aircrack-ng: fix statically linked build"), at a time were sqlite
indeed was linked against libdl even in static library
configurations. But this is no longer the case since
bd56cd6b4cc75511ffacfe020a8de3c1aad44fc9 ("sqlite: Disable dynamic
extention if static library is seleted").

This means we can now get rid of the -ldl flag when building
aircrack-ng, which means it can build properly in a pure static
library configuration.

Fixes:

  http://autobuild.buildroot.org/results/bfd/bfd1ca4afdd32e3cc251aab7ee2ae5e5293ced1c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aircrack-ng/aircrack-ng.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index b3bc8f1..720c144 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -13,7 +13,7 @@ AIRCRACK_NG_DEPENDENCIES = openssl
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	AIRCRACK_NG_MAKE_OPTS = sqlite=true
 	AIRCRACK_NG_MAKE_OPTS += \
-		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -ldl -lpthread)"
+		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB),-lpthread)"
 
 	AIRCRACK_NG_DEPENDENCIES += sqlite
 else
@@ -21,7 +21,7 @@ else
 endif
 
 AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz \
-	$(if $(BR2_PREFER_STATIC_LIB),-ldl -lpthread)
+	$(if $(BR2_PREFER_STATIC_LIB),-lpthread)
 
 define AIRCRACK_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
