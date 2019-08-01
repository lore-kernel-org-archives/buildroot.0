From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 20:12:19 +0200
Subject: [Buildroot] [git commit] package/cloop: bump to version 3.14.1.2
Message-ID: <20190801181058.803458B756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff68ca92cbe99701b395bd960fd6b336e833b711
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch, it is not needed anymore as CFLAGS/LDFLAGS are now
  correctly passed to extract_compressed_fs. CFLAGS/LDFLAGS are not
  passed to cloop_suspend but it isn't built. Moreover original CFLAGS
  are lost but this is acceptable)
- Switch site to http://snapshot.debian.org/archive/debian as
  http://debian-knoppix.alioth.debian.org/packages/sources/cloop is not
  available anymore
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cloop/0001-cflags.patch | 30 ------------------------------
 package/cloop/cloop.hash        |  8 ++++++--
 package/cloop/cloop.mk          |  6 +++---
 3 files changed, 9 insertions(+), 35 deletions(-)

diff --git a/package/cloop/0001-cflags.patch b/package/cloop/0001-cflags.patch
deleted file mode 100644
index c421dd7f8b..0000000000
--- a/package/cloop/0001-cflags.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Take into account the CFLAGS/LDFLAGS passed in the environment.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: host-cloop-2.634-1/Makefile
-===================================================================
---- host-cloop-2.634-1.orig/Makefile	2010-12-16 09:17:52.826555645 +0100
-+++ host-cloop-2.634-1/Makefile	2010-12-16 09:18:57.208713338 +0100
-@@ -15,7 +15,7 @@
- endif
- 
- ifdef APPSONLY
--CFLAGS:=-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -s -I. -fno-strict-aliasing -fno-common -fomit-frame-pointer 
-+CLOOP_CFLAGS:=-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -s -I. -fno-strict-aliasing -fno-common -fomit-frame-pointer 
- endif
- 
- KERNOBJ:=compressed_loop.o
-@@ -53,10 +53,10 @@
- 	( cd advancecomp-1.15 ; ./configure && $(MAKE) advfs )
- 
- extract_compressed_fs: extract_compressed_fs.c
--	$(CC) -Wall -O2 -s -o $@ $< -lz
-+	$(CC) $(CFLAGS) $(CLOOP_CFLAGS) $(LDFLAGS) -Wall -O2 -s -o $@ $< -lz
- 
- cloop_suspend: cloop_suspend.o
--	$(CC) -o $@ $<
-+	$(CC) $(CFLAGS) $(CLOOP_CFLAGS) $(LDFLAGS) -o $@ $<
- 
- clean:
- 	rm -rf create_compressed_fs extract_compressed_fs zoom *.o *.ko Module.symvers .cloop* .compressed_loop.* .tmp*
diff --git a/package/cloop/cloop.hash b/package/cloop/cloop.hash
index 9acbceb05d..7af1a9594d 100644
--- a/package/cloop/cloop.hash
+++ b/package/cloop/cloop.hash
@@ -1,2 +1,6 @@
-# From http://debian-knoppix.alioth.debian.org/packages/sources/cloop/cloop_2.634-1.dsc
-sha256	d6d03e2368e19f9c6c3a313e9c34cf0620d129ce26132a8805580d953769dbbd	cloop_2.634-1.tar.gz
+# From http://snapshot.debian.org/archive/debian/20150503T155713Z/pool/main/c/cloop/cloop_3.14.1.2.dsc
+sha256	ac344225b3a5c4ddbb0d4b20cd4874798b51427b707b53e2ee9fbdada7497c95	cloop_3.14.1.2.tar.xz
+
+# Hash for license files
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	advancecomp-1.15/COPYING
+sha256	1b1f89e94e131e259b9e334565c5c3500d4b8aa755b75c3f145ddcdff3b89124	README
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 585f422ce3..046d98c862 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CLOOP_VERSION = 2.634-1
-CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.gz
-CLOOP_SITE = http://debian-knoppix.alioth.debian.org/packages/sources/cloop
+CLOOP_VERSION = 3.14.1.2
+CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.xz
+CLOOP_SITE = http://snapshot.debian.org/archive/debian/20150503T155713Z/pool/main/c/cloop
 CLOOP_LICENSE = GPL-2.0 (module), GPL-2.0+ (advancecomp)
 CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING
 
