From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 25 Jun 2007 13:42:41 +0300
Subject: [Buildroot] PATCH: fix SDL-1.2.11 PAGE_SIZE missing definition
Message-ID: <20070625134241.07169998@newbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

When SDL configured to use fbcon, the build is failed because PAGE_SIZE is undeclared in <asm/page.h> 
referred from src/video/fbcon/SDL_fbvideo.c

Instead we are using libc functions to know PAGE_SIZE and only as last resort make it hardcoded to 4096.
The patch below fixes the problem.

Best regards,
Ivan

----------------

diff -urN buildroot.old/package/sdl/SDL-1.2.11-patch_PAGE_SIZE.patch buildroot.new/package/sdl/SDL-1.2.11-patch_PAGE_SIZE.patch
--- buildroot.old/package/sdl/SDL-1.2.11-patch_PAGE_SIZE.patch	1970-01-01 03:00:00 +0300
+++ buildroot.new/package/sdl/SDL-1.2.11-patch_PAGE_SIZE.patch	2007-06-24 22:24:16 +0300
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
diff -urN buildroot.old/package/sdl/sdl.mk buildroot.new/package/sdl/sdl.mk
--- buildroot.old/package/sdl/sdl.mk	2007-05-18 10:15:18 +0300
+++ buildroot.new/package/sdl/sdl.mk	2007-06-25 13:30:52 +0300
@@ -16,6 +16,7 @@
 
 $(SDL_DIR)/.unpacked: $(DL_DIR)/$(SDL_SOURCE)
 	$(SDL_CAT) $(DL_DIR)/$(SDL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(SDL_DIR) package/sdl sdl\*.patch
 	touch $(SDL_DIR)/.unpacked
 
 $(SDL_DIR)/.configured: $(SDL_DIR)/.unpacked
