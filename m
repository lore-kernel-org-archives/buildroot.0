From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:36:09 +0200
Subject: [Buildroot] [git commit] leveldb: fix static build
Message-ID: <20160908203621.70D6C81D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e14ae6f9e4058a136e153bb89669c1fc329a6376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 1.19 Makefile variable names changed. Update the build command
accordingly.

While at it, remove variables that Makefile doesn't use anymore. This change
means that the static library is always build, even when BR2_SHARED_LIBS=y,
since the static library name is hard coded in leveldb Makefile.

Fixes:
http://autobuild.buildroot.net/results/00c/00c8c5a1d6001eaebfe2a9f848dd292c91bf6a79/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/leveldb/leveldb.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 2ce3e4a..ca2ed70 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -11,17 +11,9 @@ LEVELDB_LICENSE_FILES = LICENSE
 LEVELDB_INSTALL_STAGING = YES
 LEVELDB_DEPENDENCIES = snappy
 
-# We will pass optimisation level via CFLAGS so remove leveldb default
-LEVELDB_MAKE_ARGS += OPTIM=
-
-# Disable the static library for shared only build
-ifeq ($(BR2_SHARED_LIBS),y)
-LEVELDB_MAKE_ARGS += LIBRARY=
-endif
-
 # Disable the shared library for static only build
 ifeq ($(BR2_STATIC_LIBS),y)
-LEVELDB_MAKE_ARGS += SHARED=
+LEVELDB_MAKE_ARGS += SHARED_LIBS= SHARED_PROGRAMS=
 endif
 
 define LEVELDB_BUILD_CMDS
