From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 04:12:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20070625111251.89289A45FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 04:12:51 -0700 (Mon, 25 Jun 2007)
New Revision: 18926

Log:
- use sysconf to obtain the pagesize (Ivan Kuten)


Added:
   trunk/buildroot/package/sdl/SDL-1.2.11-patch_PAGE_SIZE.patch

Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Added: trunk/buildroot/package/sdl/SDL-1.2.11-patch_PAGE_SIZE.patch
===================================================================
--- trunk/buildroot/package/sdl/SDL-1.2.11-patch_PAGE_SIZE.patch	                        (rev 0)
+++ trunk/buildroot/package/sdl/SDL-1.2.11-patch_PAGE_SIZE.patch	2007-06-25 11:12:51 UTC (rev 18926)
@@ -0,0 +1,59 @@
+diff -urN SDL-1.2.11.orig/src/video/fbcon/SDL_fbvideo.c SDL-1.2.11/src/video/fbcon/SDL_fbvideo.c
+--- SDL-1.2.11.orig/src/video/fbcon/SDL_fbvideo.c	2006-05-17 06:16:06.000000000 +0300
++++ SDL-1.2.11/src/video/fbcon/SDL_fbvideo.c	2007-06-24 22:19:41.000000000 +0300
+@@ -29,9 +29,17 @@
+ #include <unistd.h>
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+-#include <asm/page.h>		/* For definition of PAGE_SIZE */
+ #include <linux/vt.h>
+ 
++#if defined(linux)
++#define HAS_MMAP_ANON
++#include <sys/types.h>
++#include <sys/mman.h>
++#include <asm/page.h>   /* PAGE_SIZE */
++#define HAS_SC_PAGESIZE /* _SC_PAGESIZE may be an enum for Linux */
++#define HAS_GETPAGESIZE
++#endif /* linux */
++
+ #include "SDL_video.h"
+ #include "SDL_mouse.h"
+ #include "../SDL_sysvideo.h"
+@@ -474,6 +482,7 @@
+ 	unsigned int current_h;
+ 	const char *SDL_fbdev;
+ 	FILE *modesdb;
++	int pagesize = -1;
+ 
+ 	/* Initialize the library */
+ 	SDL_fbdev = SDL_getenv("SDL_FBDEV");
+@@ -545,9 +554,27 @@
+ 		}
+ 	}
+ 
++#if defined(_SC_PAGESIZE) && defined(HAS_SC_PAGESIZE)
++	pagesize = sysconf(_SC_PAGESIZE);
++#endif
++#ifdef _SC_PAGE_SIZE
++	if (pagesize == -1)
++		pagesize = sysconf(_SC_PAGE_SIZE);
++#endif
++#ifdef HAS_GETPAGESIZE
++	if (pagesize == -1)
++		pagesize = getpagesize();
++#endif
++#ifdef PAGE_SIZE
++	if (pagesize == -1)
++		pagesize = PAGE_SIZE;
++#endif
++	if (pagesize == -1)
++		pagesize = 4096;
++
+ 	/* Memory map the device, compensating for buggy PPC mmap() */
+ 	mapped_offset = (((long)finfo.smem_start) -
+-	                (((long)finfo.smem_start)&~(PAGE_SIZE-1)));
++	                (((long)finfo.smem_start)&~(pagesize-1)));
+ 	mapped_memlen = finfo.smem_len+mapped_offset;
+ 	mapped_mem = do_mmap(NULL, mapped_memlen,
+ 	                  PROT_READ|PROT_WRITE, MAP_SHARED, console_fd, 0);

Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2007-06-25 11:07:11 UTC (rev 18925)
+++ trunk/buildroot/package/sdl/sdl.mk	2007-06-25 11:12:51 UTC (rev 18926)
@@ -16,13 +16,12 @@
 
 $(SDL_DIR)/.unpacked: $(DL_DIR)/$(SDL_SOURCE)
 	$(SDL_CAT) $(DL_DIR)/$(SDL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(SDL_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(SDL_DIR) package/sdl sdl\*.patch
+	touch $@
 
 $(SDL_DIR)/.configured: $(SDL_DIR)/.unpacked
-	(cd $(SDL_DIR); \
+	(cd $(SDL_DIR); rm -rf config.cache ; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS)" \
-	LDFLAGS="$(TARGET_LDFLAGS)" \
 	./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -43,15 +42,15 @@
 		--disable-esd \
 		--disable-nasm \
 		--disable-video-x11 );
-	touch $(SDL_DIR)/.configured
+	touch $@
 
 $(SDL_DIR)/.compiled: $(SDL_DIR)/.configured
 	$(MAKE) -C $(SDL_DIR) 
-	touch $(SDL_DIR)/.compiled
+	touch $@
 
 $(STAGING_DIR)/usr/lib/libSDL.so: $(SDL_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_DIR) install;
-	touch -c $(STAGING_DIR)/usr/lib/libSDL.so
+	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libSDL.so: $(STAGING_DIR)/usr/lib/libSDL.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL*.so* $(TARGET_DIR)/usr/lib/
