From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  1 Feb 2009 19:36:57 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20090201193657.882F87653E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-01 19:36:56 +0000 (Sun, 01 Feb 2009)
New Revision: 25206

Log:
busybox: additional 1.13.2 fixes

Added:
   trunk/buildroot/package/busybox/busybox-1.13.2-init.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-modprobe.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.2-init.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-init.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-init.patch	2009-02-01 19:36:56 UTC (rev 25206)
@@ -0,0 +1,50 @@
+--- busybox-1.13.2/init/init.c	Wed Dec 31 04:06:45 2008
++++ busybox-1.13.2-init/init/init.c	Thu Jan 29 03:02:13 2009
+@@ -671,15 +671,14 @@
+  */
+ static void parse_inittab(void)
+ {
++#if ENABLE_FEATURE_USE_INITTAB
+ 	char *token[4];
+-	/* order must correspond to SYSINIT..RESTART constants */
+-	static const char actions[] ALIGN1 =
+-		"sysinit\0""respawn\0""askfirst\0""wait\0""once\0"
+-		"ctrlaltdel\0""shutdown\0""restart\0";
++	parser_t *parser = config_open2("/etc/inittab", fopen_for_read);
+ 
+-	parser_t *parser = config_open2(INITTAB, fopen_for_read);
+-	/* No inittab file -- set up some default behavior */
+-	if (parser == NULL) {
++	if (parser == NULL)
++#endif
++	{
++		/* No inittab file -- set up some default behavior */
+ 		/* Reboot on Ctrl-Alt-Del */
+ 		new_init_action(CTRLALTDEL, "reboot", "");
+ 		/* Umount all filesystems on halt/reboot */
+@@ -699,11 +698,17 @@
+ 		new_init_action(SYSINIT, INIT_SCRIPT, "");
+ 		return;
+ 	}
++
++#if ENABLE_FEATURE_USE_INITTAB
+ 	/* optional_tty:ignored_runlevel:action:command
+ 	 * Delims are not to be collapsed and need exactly 4 tokens
+ 	 */
+ 	while (config_read(parser, token, 4, 0, "#:",
+ 				PARSE_NORMAL & ~(PARSE_TRIM | PARSE_COLLAPSE))) {
++		/* order must correspond to SYSINIT..RESTART constants */
++		static const char actions[] ALIGN1 =
++			"sysinit\0""respawn\0""askfirst\0""wait\0""once\0"
++			"ctrlaltdel\0""shutdown\0""restart\0";
+ 		int action;
+ 		char *tty = token[0];
+ 
+@@ -727,6 +732,7 @@
+ 				parser->lineno);
+ 	}
+ 	config_close(parser);
++#endif
+ }
+ 
+ #if ENABLE_FEATURE_USE_INITTAB

Added: trunk/buildroot/package/busybox/busybox-1.13.2-modprobe.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-modprobe.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-modprobe.patch	2009-02-01 19:36:56 UTC (rev 25206)
@@ -0,0 +1,99 @@
+--- busybox-1.13.2/modutils/modutils-24.c	Sat Nov 29 07:48:56 2008
++++ busybox-1.13.2-modprobe/modutils/modutils-24.c	Sun Feb  1 00:08:26 2009
+@@ -2150,7 +2150,7 @@
+ 	sec->name = name;
+ 	sec->idx = newidx;
+ 	if (size)
+-		sec->contents = xmalloc(size);
++		sec->contents = xzalloc(size);
+ 
+ 	obj_insert_section_load_order(f, sec);
+ 
+@@ -2165,7 +2165,7 @@
+ 	int newidx = f->header.e_shnum++;
+ 	struct obj_section *sec;
+ 
+-	f->sections = xrealloc(f->sections, (newidx + 1) * sizeof(sec));
++	f->sections = xrealloc_vector(f->sections, 2, newidx);
+ 	f->sections[newidx] = sec = arch_new_section();
+ 
+ 	sec->header.sh_type = SHT_PROGBITS;
+@@ -2175,7 +2175,7 @@
+ 	sec->name = name;
+ 	sec->idx = newidx;
+ 	if (size)
+-		sec->contents = xmalloc(size);
++		sec->contents = xzalloc(size);
+ 
+ 	sec->load_next = f->load_order;
+ 	f->load_order = sec;
+@@ -2571,8 +2571,7 @@
+ 	/* Collect the modules' symbols.  */
+ 
+ 	if (nmod) {
+-		ext_modules = modules = xmalloc(nmod * sizeof(*modules));
+-		memset(modules, 0, nmod * sizeof(*modules));
++		ext_modules = modules = xzalloc(nmod * sizeof(*modules));
+ 		for (i = 0, mn = module_names, m = modules;
+ 				i < nmod; ++i, ++m, mn += strlen(mn) + 1) {
+ 			struct new_module_info info;
+@@ -2652,13 +2651,14 @@
+ }
+ 
+ 
+-static void  new_create_this_module(struct obj_file *f, const char *m_name)
++static void new_create_this_module(struct obj_file *f, const char *m_name)
+ {
+ 	struct obj_section *sec;
+ 
+ 	sec = obj_create_alloced_section_first(f, ".this", tgt_sizeof_long,
+ 			sizeof(struct new_module));
+-	memset(sec->contents, 0, sizeof(struct new_module));
++	/* done by obj_create_alloced_section_first: */
++	/*memset(sec->contents, 0, sizeof(struct new_module));*/
+ 
+ 	obj_add_symbol(f, SPFX "__this_module", -1,
+ 			ELF_ST_INFO(STB_LOCAL, STT_OBJECT), sec->idx, 0,
+@@ -2965,9 +2965,9 @@
+ 		if (i == f->header.e_shnum) {
+ 			struct obj_section *sec;
+ 
++			f->header.e_shnum++;
+ 			f->sections = xrealloc_vector(f->sections, 2, i);
+ 			f->sections[i] = sec = arch_new_section();
+-			f->header.e_shnum = i + 1;
+ 
+ 			sec->header.sh_type = SHT_PROGBITS;
+ 			sec->header.sh_flags = SHF_WRITE | SHF_ALLOC;
+@@ -3006,12 +3006,9 @@
+ 	for (i = 0; i < f->header.e_shnum; ++i) {
+ 		struct obj_section *s = f->sections[i];
+ 		if (s->header.sh_type == SHT_NOBITS) {
++			s->contents = NULL;
+ 			if (s->header.sh_size != 0)
+-				s->contents = memset(xmalloc(s->header.sh_size),
+-						0, s->header.sh_size);
+-			else
+-				s->contents = NULL;
+-
++				s->contents = xzalloc(s->header.sh_size);
+ 			s->header.sh_type = SHT_PROGBITS;
+ 		}
+ 	}
+@@ -3275,14 +3272,13 @@
+ 			case SHT_SYMTAB:
+ 			case SHT_STRTAB:
+ 			case SHT_RELM:
++				sec->contents = NULL;
+ 				if (sec->header.sh_size > 0) {
+-					sec->contents = xmalloc(sec->header.sh_size);
++					sec->contents = xzalloc(sec->header.sh_size);
+ 					fseek(fp, sec->header.sh_offset, SEEK_SET);
+ 					if (fread(sec->contents, sec->header.sh_size, 1, fp) != 1) {
+ 						bb_perror_msg_and_die("error reading ELF section data");
+ 					}
+-				} else {
+-					sec->contents = NULL;
+ 				}
+ 				break;
+ 
