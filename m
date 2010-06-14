From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jun 2010 09:47:49 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: add 1.16.2 devmem fix
	for access to the highest page
Message-ID: <20100614074913.961D1803F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f4b7efe504a028035dd121e38caff2c781183ef9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From busybox git.

Devmem used to always map 2 pages in case the access would cross a page
boundary, which fails if you try to access the highest page.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.16.2-devmem.patch |   76 +++++++++++++++++++++++++++
 1 files changed, 76 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.2-devmem.patch

diff --git a/package/busybox/busybox-1.16.2-devmem.patch b/package/busybox/busybox-1.16.2-devmem.patch
new file mode 100644
index 0000000..f7d1d1d
--- /dev/null
+++ b/package/busybox/busybox-1.16.2-devmem.patch
@@ -0,0 +1,76 @@
+From 351ef7188a1a2e2f154bbda6f703c2d3f4af6d79 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 14 Apr 2010 13:37:25 -0700
+Subject: [PATCH] devmem: map two pages only if it is necessary
+
+function                                             old     new   delta
+devmem_main                                          463     469      +6
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ miscutils/devmem.c |   21 ++++++++++++++-------
+ 1 files changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/miscutils/devmem.c b/miscutils/devmem.c
+index e13dedc..39b5808 100644
+--- a/miscutils/devmem.c
++++ b/miscutils/devmem.c
+@@ -13,9 +13,9 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 	uint64_t read_result;
+ 	uint64_t writeval = writeval; /* for compiler */
+ 	off_t target;
+-	unsigned page_size = getpagesize();
++	unsigned page_size, mapped_size, offset_in_page;
+ 	int fd;
+-	int width = 8 * sizeof(int);
++	unsigned width = 8 * sizeof(int);
+ 
+ 	/* devmem ADDRESS [WIDTH [VALUE]] */
+ // TODO: options?
+@@ -50,15 +50,22 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 		if (argv[3])
+ 			writeval = bb_strtoull(argv[3], NULL, 0);
+ 	} else { /* argv[2] == NULL */
+-		/* make argv[3] to be a valid thing to use */
++		/* make argv[3] to be a valid thing to fetch */
+ 		argv--;
+ 	}
+ 	if (errno)
+-		bb_show_usage(); /* bb_strtouXX failed */
++		bb_show_usage(); /* one of bb_strtouXX failed */
+ 
+ 	fd = xopen("/dev/mem", argv[3] ? (O_RDWR | O_SYNC) : (O_RDONLY | O_SYNC));
++	mapped_size = page_size = getpagesize();
++	offset_in_page = (unsigned)target & (page_size - 1);
++	if (offset_in_page + width > page_size) {
++		/* This access spans pages.
++		 * Must map two pages to make it possible: */
++		mapped_size *= 2;
++	}
+ 	map_base = mmap(NULL,
+-			page_size * 2 /* in case value spans page */,
++			mapped_size,
+ 			argv[3] ? (PROT_READ | PROT_WRITE) : PROT_READ,
+ 			MAP_SHARED,
+ 			fd,
+@@ -68,7 +75,7 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 
+ //	printf("Memory mapped at address %p.\n", map_base);
+ 
+-	virt_addr = (char*)map_base + (target & (page_size - 1));
++	virt_addr = (char*)map_base + offset_in_page;
+ 
+ 	if (!argv[3]) {
+ 		switch (width) {
+@@ -119,7 +126,7 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 	}
+ 
+ 	if (ENABLE_FEATURE_CLEAN_UP) {
+-		if (munmap(map_base, page_size * 2) == -1)
++		if (munmap(map_base, mapped_size) == -1)
+ 			bb_perror_msg_and_die("munmap");
+ 		close(fd);
+ 	}
+-- 
+1.7.1
+
-- 
1.7.1
