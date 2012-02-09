From: Trevor Woerner <twoerner@gmail.com>
Date: Thu,  9 Feb 2012 16:56:20 -0500
Subject: [Buildroot] [PATCH v2 fbdirect] Font handling in directfb requires
	libbz2
Message-ID: <1328824580-28004-1-git-send-email-twoerner@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Trevor Woerner <twoerner@gmail.com>

One of the libraries which is built by directfb, libidirectfbfont_ft2.so,
requires libbz2:

/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidirectfbfont_ft2.so
        libdirect-1.4.so.6 => /usr/lib/libdirect-1.4.so.6 (0x401a9000)
        libdirectfb-1.4.so.6 => /usr/lib/libdirectfb-1.4.so.6 (0x400f6000)
        libfusion-1.4.so.6 => /usr/lib/libfusion-1.4.so.6 (0x40199000)
        libz.so.1 => /usr/lib/libz.so.1 (0x4003a000)
        libfreetype.so.6 => /usr/lib/libfreetype.so.6 (0x401c5000)
        libm.so.6 => /lib/libm.so.6 (0x40237000)
        libdl.so.2 => /lib/libdl.so.2 (0x4008f000)
        libpthread.so.0 => /lib/libpthread.so.0 (0x4009a000)
        libc.so.6 => /lib/libc.so.6 (0x402aa000)
        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x400b9000)
        libbz2.so.1 => /usr/lib/libbz2.so.1 (0x403d1000)
        /lib/ld-2.9.so (0x40069000)

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 package/bzip2/bzip2.mk       |    3 ++-
 package/directfb/directfb.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index d3bb2b0..8e6ae92 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -60,6 +60,7 @@ define BZIP2_INSTALL_TARGET_CMDS
 	(cd $(TARGET_DIR)/usr/lib; \
 		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1.0; \
 		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so; \
+		ln -snf libbz2.so.$(BZIP2_SONAME) libbz2.so.1; \
 	)
 	(cd $(TARGET_DIR)/usr/bin; \
 		ln -snf bzip2 bunzip2; \
@@ -102,4 +103,4 @@ define HOST_BZIP2_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
\ No newline at end of file
+$(eval $(call GENTARGETS,host))
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 977d272..8fd8d5e 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -23,7 +23,7 @@ DIRECTFB_CONF_OPT = \
 	--disable-video4linux2 \
 	--without-tools
 
-DIRECTFB_DEPENDENCIES = freetype zlib
+DIRECTFB_DEPENDENCIES = freetype zlib bzip2
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
 DIRECTFB_CONF_OPT += --enable-multi --enable-fusion
-- 
1.7.9.GIT
