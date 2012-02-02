From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 12:43:46 +0100
Subject: [Buildroot] [git commit] fis: make fis list more like RedBoot's
	output
Message-ID: <20120202114617.D10999095E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8b320a7080cc75ed2de49728812681803b29c0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The output of 'fis list' does not fit cleanly on an 80 column
terminal.  This modifies the output to fit and more closely
resemble the output from RedBoot.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fis/fis-003-list_output.patch |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/fis/fis-003-list_output.patch b/package/fis/fis-003-list_output.patch
new file mode 100644
index 0000000..6c1e4eb
--- /dev/null
+++ b/package/fis/fis-003-list_output.patch
@@ -0,0 +1,21 @@
+--- fis.orig/fis.c	2010-05-12 10:22:10.000000000 -0700
++++ fis/fis.c	2010-05-12 10:19:24.000000000 -0700
+@@ -142,8 +142,8 @@
+ 
+ static void dump_desc(FILE* f, const struct fis_image_desc* d)
+ {
+-  fprintf(f,"%16s: flash addr = 0x%08x, mem addr = 0x%08x, size = 0x%08x, checksum = 0x%08x\n",
+-             d->name, d->flash_base, d->mem_base, d->size, d->file_cksum);
++  fprintf(f,"%-16s  0x%08x  0x%08x  0x%08x  0x%08x  0x%08x\n",
++             d->name, d->flash_base, d->mem_base, d->size, d->entry_point, d->file_cksum);
+   for (unsigned int i=0; i<(sizeof(d->skips)/4); ++i) {
+     if (d->skips[i]==0x736b6970 || d->skips[i]==0x70696b73) { // "skip"
+       uint32_t offset = d->skips[i+1];
+@@ -400,6 +400,7 @@
+   CHECK(fd=open(device,O_RDONLY),-1);
+   dir_t dir;
+   load_dir(fd,offset,&size,swap_endianness,&dir);
++  fprintf(stdout,"Name              FLASH addr  Mem addr    Length      Entry point Checksum\n");
+   FOR_EACH_DIR_ENTRY(dir,i) {
+     dump_desc(stdout,get(i));
+   }
