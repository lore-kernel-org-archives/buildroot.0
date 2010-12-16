From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Dec 2010 10:47:34 +0100
Subject: [Buildroot] [PATCH 1/1] cloop: bump and fix package
In-Reply-To: <cover.1292492846.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292492846.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0d679df871b997afde6b8bd5aceac6c831cafd45.1292492846.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On a machine without zlib-dev installed, cloop must really on the
host-zlib compiled by Buildroot, but due to the horrible cloop build
system, this didn't happen and the build was failing.

Therefore, we now pass all the $(HOST_CONFIGURE_OPTS) when building
cloop, and we fix the Makefile so that it takes into CFLAGS/LDFLAGS
passed in the environment or command-line and do not override them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cloop/cloop-2.634-1-cflags.patch |   30 ++++++++++++++++++++++++++++++
 package/cloop/cloop.mk                   |    5 ++---
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 package/cloop/cloop-2.634-1-cflags.patch

diff --git a/package/cloop/cloop-2.634-1-cflags.patch b/package/cloop/cloop-2.634-1-cflags.patch
new file mode 100644
index 0000000..c421dd7
--- /dev/null
+++ b/package/cloop/cloop-2.634-1-cflags.patch
@@ -0,0 +1,30 @@
+Take into account the CFLAGS/LDFLAGS passed in the environment.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: host-cloop-2.634-1/Makefile
+===================================================================
+--- host-cloop-2.634-1.orig/Makefile	2010-12-16 09:17:52.826555645 +0100
++++ host-cloop-2.634-1/Makefile	2010-12-16 09:18:57.208713338 +0100
+@@ -15,7 +15,7 @@
+ endif
+ 
+ ifdef APPSONLY
+-CFLAGS:=-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -s -I. -fno-strict-aliasing -fno-common -fomit-frame-pointer 
++CLOOP_CFLAGS:=-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -s -I. -fno-strict-aliasing -fno-common -fomit-frame-pointer 
+ endif
+ 
+ KERNOBJ:=compressed_loop.o
+@@ -53,10 +53,10 @@
+ 	( cd advancecomp-1.15 ; ./configure && $(MAKE) advfs )
+ 
+ extract_compressed_fs: extract_compressed_fs.c
+-	$(CC) -Wall -O2 -s -o $@ $< -lz
++	$(CC) $(CFLAGS) $(CLOOP_CFLAGS) $(LDFLAGS) -Wall -O2 -s -o $@ $< -lz
+ 
+ cloop_suspend: cloop_suspend.o
+-	$(CC) -o $@ $<
++	$(CC) $(CFLAGS) $(CLOOP_CFLAGS) $(LDFLAGS) -o $@ $<
+ 
+ clean:
+ 	rm -rf create_compressed_fs extract_compressed_fs zoom *.o *.ko Module.symvers .cloop* .compressed_loop.* .tmp*
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 4c16098..53ff72e 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -1,12 +1,11 @@
-CLOOP_VERSION=2.631-1
+CLOOP_VERSION=2.634-1
 CLOOP_SOURCE=cloop_$(CLOOP_VERSION).tar.gz
 CLOOP_SITE=http://debian-knoppix.alioth.debian.org/packages/sources/cloop
 
 HOST_CLOOP_DEPENDENCIES = host-zlib
 
 define HOST_CLOOP_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE1) \
-   CFLAGS="$(HOST_CFLAGS) -Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DUSE_ERROR_SILENT" -C $(@D) APPSONLY=yes
+	$(HOST_CONFIGURE_OPTS) $(HOST_MAKE_ENV) $(MAKE1) -C $(@D) APPSONLY=yes
 endef
 
 define HOST_CLOOP_INSTALL_CMDS
-- 
1.7.0.4
