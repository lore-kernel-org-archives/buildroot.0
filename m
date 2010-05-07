From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 May 2010 21:32:26 +0200
Subject: [Buildroot] [PATCH 2/2] squashfs3: fix build when zlib isn't
	available on the host
In-Reply-To: <cover.1273260740.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273260740.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f6c18b97caeeae18ab2d8d19409183c6c905ec94.1273260740.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to pass CFLAGS and LDFLAGS, and to rename the patch so that it
actually gets applied.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ....patch => squashfs3-3.4-build-system-fix.patch} |   15 ++++++++++++---
 package/squashfs3/squashfs3.mk                     |    2 +-
 2 files changed, 13 insertions(+), 4 deletions(-)
 rename package/squashfs3/{squashfs-3.4-build-system-fix.patch => squashfs3-3.4-build-system-fix.patch} (66%)

diff --git a/package/squashfs3/squashfs-3.4-build-system-fix.patch b/package/squashfs3/squashfs3-3.4-build-system-fix.patch
similarity index 66%
rename from package/squashfs3/squashfs-3.4-build-system-fix.patch
rename to package/squashfs3/squashfs3-3.4-build-system-fix.patch
index 5b86b00..3c197eb 100644
--- a/package/squashfs3/squashfs-3.4-build-system-fix.patch
+++ b/package/squashfs3/squashfs3-3.4-build-system-fix.patch
@@ -9,9 +9,9 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 
 Index: squashfs3.4/squashfs-tools/Makefile
 ===================================================================
---- squashfs3.4.orig/squashfs-tools/Makefile
-+++ squashfs3.4/squashfs-tools/Makefile
-@@ -2,12 +2,12 @@ INSTALL_DIR = /usr/local/bin
+--- squashfs3.4.orig/squashfs-tools/Makefile	2008-08-26 09:10:13.000000000 +0200
++++ squashfs3.4/squashfs-tools/Makefile	2010-05-06 21:09:28.000000000 +0200
+@@ -2,12 +2,12 @@
  
  INCLUDEDIR = .
  
@@ -26,3 +26,12 @@ Index: squashfs3.4/squashfs-tools/Makefile
  
  mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h
  
+@@ -16,7 +16,7 @@
+ sort.o: sort.c squashfs_fs.h global.h sort.h
+ 
+ unsquashfs: unsquashfs.o
+-	$(CC) unsquashfs.o -lz -lpthread -lm -o $@
++	$(CC) $(LDFLAGS) unsquashfs.o -lz -lpthread -lm -o $@
+ 
+ unsquashfs.o: unsquashfs.c squashfs_fs.h read_fs.h global.h
+ 
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index 5504b14..69aab14 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -18,7 +18,7 @@ define SQUASHFS3_INSTALL_TARGET_CMDS
 endef
 
 define HOST_SQUASHFS3_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/
+ $(HOST_MAKE_ENV) $(MAKE) CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" -C $(@D)/squashfs-tools/
 endef
 
 define HOST_SQUASHFS3_INSTALL_CMDS
-- 
1.6.3.3
