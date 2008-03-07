From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Mar 2008 05:31:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20080307133112.2B452120188@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-07 05:31:11 -0800 (Fri, 07 Mar 2008)
New Revision: 21268

Log:
sdl: remove unused legacy patch


Removed:
   trunk/buildroot/package/sdl/sdl-1.2.11-patch_PAGE_SIZE.patch


Changeset:
Deleted: trunk/buildroot/package/sdl/sdl-1.2.11-patch_PAGE_SIZE.patch
===================================================================
--- trunk/buildroot/package/sdl/sdl-1.2.11-patch_PAGE_SIZE.patch	2008-03-07 13:31:07 UTC (rev 21267)
+++ trunk/buildroot/package/sdl/sdl-1.2.11-patch_PAGE_SIZE.patch	2008-03-07 13:31:11 UTC (rev 21268)
@@ -1,59 +0,0 @@
-diff -urN SDL-1.2.11.orig/src/video/fbcon/SDL_fbvideo.c SDL-1.2.11/src/video/fbcon/SDL_fbvideo.c
---- SDL-1.2.11.orig/src/video/fbcon/SDL_fbvideo.c	2006-05-17 06:16:06.000000000 +0300
-+++ SDL-1.2.11/src/video/fbcon/SDL_fbvideo.c	2007-06-24 22:19:41.000000000 +0300
-@@ -29,9 +29,17 @@
- #include <unistd.h>
- #include <sys/ioctl.h>
- #include <sys/mman.h>
--#include <asm/page.h>		/* For definition of PAGE_SIZE */
- #include <linux/vt.h>
- 
-+#if defined(linux)
-+#define HAS_MMAP_ANON
-+#include <sys/types.h>
-+#include <sys/mman.h>
-+#include <asm/page.h>   /* PAGE_SIZE */
-+#define HAS_SC_PAGESIZE /* _SC_PAGESIZE may be an enum for Linux */
-+#define HAS_GETPAGESIZE
-+#endif /* linux */
-+
- #include "SDL_video.h"
- #include "SDL_mouse.h"
- #include "../SDL_sysvideo.h"
-@@ -474,6 +482,7 @@
- 	unsigned int current_h;
- 	const char *SDL_fbdev;
- 	FILE *modesdb;
-+	int pagesize = -1;
- 
- 	/* Initialize the library */
- 	SDL_fbdev = SDL_getenv("SDL_FBDEV");
-@@ -545,9 +554,27 @@
- 		}
- 	}
- 
-+#if defined(_SC_PAGESIZE) && defined(HAS_SC_PAGESIZE)
-+	pagesize = sysconf(_SC_PAGESIZE);
-+#endif
-+#ifdef _SC_PAGE_SIZE
-+	if (pagesize == -1)
-+		pagesize = sysconf(_SC_PAGE_SIZE);
-+#endif
-+#ifdef HAS_GETPAGESIZE
-+	if (pagesize == -1)
-+		pagesize = getpagesize();
-+#endif
-+#ifdef PAGE_SIZE
-+	if (pagesize == -1)
-+		pagesize = PAGE_SIZE;
-+#endif
-+	if (pagesize == -1)
-+		pagesize = 4096;
-+
- 	/* Memory map the device, compensating for buggy PPC mmap() */
- 	mapped_offset = (((long)finfo.smem_start) -
--	                (((long)finfo.smem_start)&~(PAGE_SIZE-1)));
-+	                (((long)finfo.smem_start)&~(pagesize-1)));
- 	mapped_memlen = finfo.smem_len+mapped_offset;
- 	mapped_mem = do_mmap(NULL, mapped_memlen,
- 	                  PROT_READ|PROT_WRITE, MAP_SHARED, console_fd, 0);
