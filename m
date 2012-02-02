From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 12:43:49 +0100
Subject: [Buildroot] [git commit] fis: sort output of fis list
Message-ID: <20120202114617.DE8A390962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5256c77b46fb2fd9bf84dd790a7b8de873b7dcd9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This sorts the output of 'fis list' using the flash_base address
similar to the output from RedBoot.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fis/fis-004-sorted_list.patch |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/fis/fis-004-sorted_list.patch b/package/fis/fis-004-sorted_list.patch
new file mode 100644
index 0000000..6854977
--- /dev/null
+++ b/package/fis/fis-004-sorted_list.patch
@@ -0,0 +1,30 @@
+--- fis.orig/fis.c	2010-05-12 11:09:22.000000000 -0700
++++ fis/fis.c	2010-05-12 11:05:45.000000000 -0700
+@@ -401,9 +401,24 @@
+   dir_t dir;
+   load_dir(fd,offset,&size,swap_endianness,&dir);
+   fprintf(stdout,"Name              FLASH addr  Mem addr    Length      Entry point Checksum\n");
+-  FOR_EACH_DIR_ENTRY(dir,i) {
+-    dump_desc(stdout,get(i));
+-  }
++  uint32_t last_addr = 0;
++  bool image_found;
++  do {
++    uint32_t lowest_addr = 0xffffffff;
++    iter_t index;
++    image_found = false;
++    FOR_EACH_DIR_ENTRY(dir,i) {
++      const struct fis_image_desc *d = get(i);
++      if ((d->flash_base >= last_addr) && (d->flash_base < lowest_addr)) {
++        lowest_addr = d->flash_base;
++        image_found = true;
++        index = i;
++      }
++    }
++    if (image_found)
++      dump_desc(stdout,get(index));
++    last_addr = lowest_addr + 1;
++  } while (image_found == true);
+ }
+ 
+ 
