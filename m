From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:28:42 +0200
Subject: [Buildroot] [git commit] devmem2: use a patch that actually applies
Message-ID: <20140629142941.0456F9D106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b04f8bf1377c947d95f4ab5cd78b2a7ec7a4f5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch provided by Colin Didier and Maxime Hadjinlian was not
applying properly. Fixes:

  http://autobuild.buildroot.org/results/c45/c45eb706fb35ffc87fede777c3d20479a90872ae/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../devmem2-0001-be-coherent-in-type-usage.patch   |   29 +++++++++++---------
 1 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/package/devmem2/devmem2-0001-be-coherent-in-type-usage.patch b/package/devmem2/devmem2-0001-be-coherent-in-type-usage.patch
index 541ac6e..1777387 100644
--- a/package/devmem2/devmem2-0001-be-coherent-in-type-usage.patch
+++ b/package/devmem2/devmem2-0001-be-coherent-in-type-usage.patch
@@ -1,7 +1,7 @@
-From 15eae3dbb3d6824a0fd478e2ce0fe879496bb72c Mon Sep 17 00:00:00 2001
-From: Colin Didier <colin.didier@devialet.com>
-Date: Thu, 19 Jun 2014 16:58:19 +0200
-Subject: [PATCH] be coherent in type usage
+From 6570e7afe1eebd64022b871b9ebd9a76be267f57 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 29 Jun 2014 16:27:49 +0200
+Subject: [PATCH] Be coherent in type usage
 
 - no need to use off_t because it is read from strtoul()
 - print unsigned int type correctly
@@ -10,40 +10,43 @@ When built with _FILE_OFFSET_BITS=64, off_t becomes an long long int
 and was printed as an unsigned int which lead to a garbled output.
 
 Signed-off-by: Colin Didier <colin.didier@devialet.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  devmem2.c | 7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)
 
 diff --git a/devmem2.c b/devmem2.c
-index 7732ecb..1ae06ef 100644
+index 7732ecb..7aa5c79 100644
 --- a/devmem2.c
 +++ b/devmem2.c
 @@ -58,8 +58,7 @@
  int main(int argc, char **argv) {
      int fd;
-     void *map_base, *virt_addr;
+     void *map_base, *virt_addr; 
 -	unsigned long read_result, writeval;
 -	off_t target;
 +	unsigned long target, read_result, writeval;
  	int access_type = 'w';
-
+ 	
  	if(argc < 2) {
 @@ -101,7 +100,7 @@ int main(int argc, char **argv) {
  			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
  			exit(2);
  	}
--    printf("Value at address 0x%X (%p): 0x%X\n", target, virt_addr, read_result);
-+    printf("Value at address 0x%lX (%p): 0x%lX\n", target, virt_addr, read_result);
+-    printf("Value at address 0x%X (%p): 0x%X\n", target, virt_addr, read_result); 
++    printf("Value@address 0x%lX (%p): 0x%X\n", target, virt_addr, read_result); 
      fflush(stdout);
-
+ 
  	if(argc > 3) {
 @@ -120,7 +119,7 @@ int main(int argc, char **argv) {
  				read_result = *((unsigned long *) virt_addr);
  				break;
  		}
--		printf("Written 0x%X; readback 0x%X\n", writeval, read_result);
-+		printf("Written 0x%lX; readback 0x%lX\n", writeval, read_result);
+-		printf("Written 0x%X; readback 0x%X\n", writeval, read_result); 
++		printf("Written 0x%lX; readback 0x%X\n", writeval, read_result); 
  		fflush(stdout);
  	}
+ 	
+-- 
+2.0.0
 
---
