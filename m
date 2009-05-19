From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 May 2009 12:01:57 +0200
Subject: [Buildroot] [git commit] busybox: additional 1.14.0 fixes
Message-ID: <20090519100223.9F8ED77875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7ed91a957000fc16fd85720c70fb2e4561e1433
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.14.0-awk.patch    |   21 ++++++
 package/busybox/busybox-1.14.0-depmod.patch |   90 ++++++++++++++++++++++++++
 package/busybox/busybox-1.14.0-gzip.patch   |   91 +++++++++++++++++++++++++++
 package/busybox/busybox.mk                  |    2 +-
 4 files changed, 203 insertions(+), 1 deletions(-)
 create mode 100644 package/busybox/busybox-1.14.0-awk.patch
 create mode 100644 package/busybox/busybox-1.14.0-depmod.patch
 create mode 100644 package/busybox/busybox-1.14.0-gzip.patch

diff --git a/package/busybox/busybox-1.14.0-awk.patch b/package/busybox/busybox-1.14.0-awk.patch
new file mode 100644
index 0000000..ef194ea
--- /dev/null
+++ b/package/busybox/busybox-1.14.0-awk.patch
@@ -0,0 +1,21 @@
+--- busybox-1.14.0/editors/awk.c	Tue Apr 14 01:43:09 2009
++++ busybox-1.14.0-awk/editors/awk.c	Mon May 18 23:49:29 2009
+@@ -1571,13 +1571,14 @@
+ 				n++; /* we saw yet another delimiter */
+ 			} else {
+ 				pmatch[0].rm_eo = l;
+-				if (s[l]) pmatch[0].rm_eo++;
++				if (s[l])
++					pmatch[0].rm_eo++;
+ 			}
+ 			memcpy(s1, s, l);
+ 			/* make sure we remove *all* of the separator chars */
+-			while (l < pmatch[0].rm_eo) {
+-				s1[l++] = '\0';
+-			}
++			do {
++				s1[l] = '\0';
++			} while (++l < pmatch[0].rm_eo);
+ 			nextword(&s1);
+ 			s += pmatch[0].rm_eo;
+ 		} while (*s);
diff --git a/package/busybox/busybox-1.14.0-depmod.patch b/package/busybox/busybox-1.14.0-depmod.patch
new file mode 100644
index 0000000..c66aba3
--- /dev/null
+++ b/package/busybox/busybox-1.14.0-depmod.patch
@@ -0,0 +1,90 @@
+--- busybox-1.14.0/modutils/depmod.c	Tue Apr 14 01:42:55 2009
++++ busybox-1.14.0-depmod/modutils/depmod.c	Mon May 18 22:37:14 2009
+@@ -40,26 +40,28 @@
+ 	ARG_r = (1<<6)  /* Compat dummy. Linux Makefile uses it */
+ };
+ 
+-static int FAST_FUNC parse_module(const char *fname, struct stat *sb,
+-				  void *data, int UNUSED_PARAM depth)
++static int FAST_FUNC parse_module(const char *fname, struct stat *sb UNUSED_PARAM,
++				  void *data, int depth UNUSED_PARAM)
+ {
++	char modname[MODULE_NAME_LEN];
+ 	module_info **first = (module_info **) data;
+ 	char *image, *ptr;
+ 	module_info *info;
+-	size_t len = sb->st_size;
++	/* Arbitrary. Was sb->st_size, but that breaks .gz etc */
++	size_t len = (64*1024*1024 - 4096);
+ 
+ 	if (strrstr(fname, ".ko") == NULL)
+ 		return TRUE;
+ 
+ 	image = xmalloc_open_zipped_read_close(fname, &len);
+-	info = xzalloc(sizeof(module_info));
++	info = xzalloc(sizeof(*info));
+ 
+ 	info->next = *first;
+ 	*first = info;
+ 
+ 	info->dnext = info->dprev = info;
+ 	info->name = xasprintf("/%s", fname);
+-	info->modname = filename2modname(fname, NULL);
++	info->modname = xstrdup(filename2modname(fname, modname));
+ 	for (ptr = image; ptr < image + len - 10; ptr++) {
+ 		if (strncmp(ptr, "depends=", 8) == 0) {
+ 			char *u;
+@@ -69,12 +71,14 @@
+ 				if (*u == '-')
+ 					*u = '_';
+ 			ptr += string_to_llist(ptr, &info->dependencies, ",");
+-		} else if (ENABLE_FEATURE_MODUTILS_ALIAS &&
+-			   strncmp(ptr, "alias=", 6) == 0) {
++		} else if (ENABLE_FEATURE_MODUTILS_ALIAS
++		 && strncmp(ptr, "alias=", 6) == 0
++		) {
+ 			llist_add_to(&info->aliases, xstrdup(ptr + 6));
+ 			ptr += strlen(ptr);
+-		} else if (ENABLE_FEATURE_MODUTILS_SYMBOLS &&
+-			   strncmp(ptr, "__ksymtab_", 10) == 0) {
++		} else if (ENABLE_FEATURE_MODUTILS_SYMBOLS
++		 && strncmp(ptr, "__ksymtab_", 10) == 0
++		) {
+ 			ptr += 10;
+ 			if (strncmp(ptr, "gpl", 3) == 0 ||
+ 			    strcmp(ptr, "strings") == 0)
+@@ -199,10 +203,17 @@
+ 	if (!(option_mask32 & ARG_n))
+ 		xfreopen_write("modules.alias", stdout);
+ 	for (m = modules; m != NULL; m = m->next) {
++		const char *fname = bb_basename(m->name);
++		int fnlen = strchrnul(fname, '.') - fname;
+ 		while (m->aliases) {
+-			printf("alias %s %s\n",
++			/* Last word can well be m->modname instead,
++			 * but depmod from module-init-tools 3.4
++			 * uses module basename, i.e., no s/-/_/g.
++			 * (pathname and .ko.* are still stripped)
++			 * Mimicking that... */
++			printf("alias %s %.*s\n",
+ 				(char*)llist_pop(&m->aliases),
+-				m->modname);
++				fnlen, fname);
+ 		}
+ 	}
+ #endif
+@@ -210,10 +221,12 @@
+ 	if (!(option_mask32 & ARG_n))
+ 		xfreopen_write("modules.symbols", stdout);
+ 	for (m = modules; m != NULL; m = m->next) {
++		const char *fname = bb_basename(m->name);
++		int fnlen = strchrnul(fname, '.') - fname;
+ 		while (m->symbols) {
+-			printf("alias symbol:%s %s\n",
++			printf("alias symbol:%s %.*s\n",
+ 				(char*)llist_pop(&m->symbols),
+-				m->modname);
++				fnlen, fname);
+ 		}
+ 	}
+ #endif
diff --git a/package/busybox/busybox-1.14.0-gzip.patch b/package/busybox/busybox-1.14.0-gzip.patch
new file mode 100644
index 0000000..014425b
--- /dev/null
+++ b/package/busybox/busybox-1.14.0-gzip.patch
@@ -0,0 +1,91 @@
+--- busybox-1.14.0/archival/gzip.c	Tue Apr 14 01:42:55 2009
++++ busybox-1.14.0-gzip/archival/gzip.c	Mon May 18 22:36:12 2009
+@@ -389,19 +389,6 @@
+ }
+ 
+ /* ===========================================================================
+- * Clear input and output buffers
+- */
+-static void clear_bufs(void)
+-{
+-	G1.outcnt = 0;
+-#ifdef DEBUG
+-	G1.insize = 0;
+-#endif
+-	G1.isize = 0;
+-}
+-
+-
+-/* ===========================================================================
+  * Run a set of bytes through the crc shift register.  If s is a NULL
+  * pointer, then initialize the crc shift register contents instead.
+  * Return the current crc in either case.
+@@ -2019,7 +2006,37 @@
+ {
+ 	struct stat s;
+ 
+-	clear_bufs();
++	/* Clear input and output buffers */
++	G1.outcnt = 0;
++#ifdef DEBUG
++	G1.insize = 0;
++#endif
++	G1.isize = 0;
++
++	/* Reinit G2.xxx */
++	memset(&G2, 0, sizeof(G2));
++	G2.l_desc.dyn_tree     = G2.dyn_ltree;
++	G2.l_desc.static_tree  = G2.static_ltree;
++	G2.l_desc.extra_bits   = extra_lbits;
++	G2.l_desc.extra_base   = LITERALS + 1;
++	G2.l_desc.elems        = L_CODES;
++	G2.l_desc.max_length   = MAX_BITS;
++	//G2.l_desc.max_code     = 0;
++	G2.d_desc.dyn_tree     = G2.dyn_dtree;
++	G2.d_desc.static_tree  = G2.static_dtree;
++	G2.d_desc.extra_bits   = extra_dbits;
++	//G2.d_desc.extra_base   = 0;
++	G2.d_desc.elems        = D_CODES;
++	G2.d_desc.max_length   = MAX_BITS;
++	//G2.d_desc.max_code     = 0;
++	G2.bl_desc.dyn_tree    = G2.bl_tree;
++	//G2.bl_desc.static_tree = NULL;
++	G2.bl_desc.extra_bits  = extra_blbits,
++	//G2.bl_desc.extra_base  = 0;
++	G2.bl_desc.elems       = BL_CODES;
++	G2.bl_desc.max_length  = MAX_BL_BITS;
++	//G2.bl_desc.max_code    = 0;
++
+ 	s.st_ctime = 0;
+ 	fstat(STDIN_FILENO, &s);
+ 	zip(s.st_ctime);
+@@ -2064,29 +2081,6 @@
+ 	SET_PTR_TO_GLOBALS(xzalloc(sizeof(struct globals) + sizeof(struct globals2))
+ 			+ sizeof(struct globals));
+ 	barrier();
+-	G2.l_desc.dyn_tree    = G2.dyn_ltree;
+-	G2.l_desc.static_tree = G2.static_ltree;
+-	G2.l_desc.extra_bits  = extra_lbits;
+-	G2.l_desc.extra_base  = LITERALS + 1;
+-	G2.l_desc.elems       = L_CODES;
+-	G2.l_desc.max_length  = MAX_BITS;
+-	//G2.l_desc.max_code    = 0;
+-
+-	G2.d_desc.dyn_tree    = G2.dyn_dtree;
+-	G2.d_desc.static_tree = G2.static_dtree;
+-	G2.d_desc.extra_bits  = extra_dbits;
+-	//G2.d_desc.extra_base  = 0;
+-	G2.d_desc.elems       = D_CODES;
+-	G2.d_desc.max_length  = MAX_BITS;
+-	//G2.d_desc.max_code    = 0;
+-
+-	G2.bl_desc.dyn_tree    = G2.bl_tree;
+-	//G2.bl_desc.static_tree = NULL;
+-	G2.bl_desc.extra_bits  = extra_blbits,
+-	//G2.bl_desc.extra_base  = 0;
+-	G2.bl_desc.elems       = BL_CODES;
+-	G2.bl_desc.max_length  = MAX_BL_BITS;
+-	//G2.bl_desc.max_code    = 0;
+ 
+ 	/* Allocate all global buffers (for DYN_ALLOC option) */
+ 	ALLOC(uch, G1.l_buf, INBUFSIZ);
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fcec41a..4f1d038 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -92,7 +92,7 @@ endif
 
 
 $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.config
-	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+q	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR)
-- 
1.6.0.6
