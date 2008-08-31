From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 31 Aug 2008 14:45:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080831214503.CA9F43C72F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-31 14:45:03 -0700 (Sun, 31 Aug 2008)
New Revision: 23289

Log:
busybox: additional 1.12.0 patches

Added:
   trunk/buildroot/package/busybox/busybox-1.12.0-awk.patch
   trunk/buildroot/package/busybox/busybox-1.12.0-insmod.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.12.0-awk.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.0-awk.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.0-awk.patch	2008-08-31 21:45:03 UTC (rev 23289)
@@ -0,0 +1,53 @@
+--- busybox-1.12.0/editors/awk.c	Wed Aug  6 00:56:11 2008
++++ busybox-1.12.0-awk/editors/awk.c	Fri Aug 29 01:17:05 2008
+@@ -973,7 +973,12 @@
+ 
+ 		} else if (*p == '.' || isdigit(*p)) {
+ 			/* it's a number */
+-			t_double = strtod(p, &p);
++#if ENABLE_DESKTOP
++			if (p[0] == '0' && (p[1] | 0x20) == 'x')
++				t_double = strtoll(p, &p, 0);
++			else
++#endif
++				t_double = strtod(p, &p);
+ 			if (*p == '.')
+ 				syntax_error(EMSG_UNEXP_TOKEN);
+ 			tc = TC_NUMBER;
+@@ -2034,28 +2039,30 @@
+ 		setvar_p(res, s);
+ 		break;
+ 
++	/* Bitwise ops must assume that operands are unsigned. GNU Awk 3.1.5:
++	 * awk '{ print or(-1,1) }' gives "4.29497e+09", not "-2.xxxe+09" */
+ 	case B_an:
+-		setvar_i(res, (long)getvar_i(av[0]) & (long)getvar_i(av[1]));
++		setvar_i(res, (unsigned long)getvar_i(av[0]) & (unsigned long)getvar_i(av[1]));
+ 		break;
+ 
+ 	case B_co:
+-		setvar_i(res, ~(long)getvar_i(av[0]));
++		setvar_i(res, ~(unsigned long)getvar_i(av[0]));
+ 		break;
+ 
+ 	case B_ls:
+-		setvar_i(res, (long)getvar_i(av[0]) << (long)getvar_i(av[1]));
++		setvar_i(res, (unsigned long)getvar_i(av[0]) << (unsigned long)getvar_i(av[1]));
+ 		break;
+ 
+ 	case B_or:
+-		setvar_i(res, (long)getvar_i(av[0]) | (long)getvar_i(av[1]));
++		setvar_i(res, (unsigned long)getvar_i(av[0]) | (unsigned long)getvar_i(av[1]));
+ 		break;
+ 
+ 	case B_rs:
+-		setvar_i(res, (long)((unsigned long)getvar_i(av[0]) >> (unsigned long)getvar_i(av[1])));
++		setvar_i(res, (unsigned long)getvar_i(av[0]) >> (unsigned long)getvar_i(av[1]));
+ 		break;
+ 
+ 	case B_xo:
+-		setvar_i(res, (long)getvar_i(av[0]) ^ (long)getvar_i(av[1]));
++		setvar_i(res, (unsigned long)getvar_i(av[0]) ^ (unsigned long)getvar_i(av[1]));
+ 		break;
+ 
+ 	case B_lo:

Added: trunk/buildroot/package/busybox/busybox-1.12.0-insmod.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.0-insmod.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.0-insmod.patch	2008-08-31 21:45:03 UTC (rev 23289)
@@ -0,0 +1,101 @@
+--- busybox-1.12.0/modutils/insmod.c	Wed Aug  6 00:56:02 2008
++++ busybox-1.12.0-insmod/modutils/insmod.c	Thu Aug 28 23:38:35 2008
+@@ -2212,7 +2212,7 @@
+ 	sec->name = name;
+ 	sec->idx = newidx;
+ 	if (size)
+-		sec->contents = xmalloc(size);
++		sec->contents = xzalloc(size);
+ 
+ 	obj_insert_section_load_order(f, sec);
+ 
+@@ -2227,7 +2227,7 @@
+ 	int newidx = f->header.e_shnum++;
+ 	struct obj_section *sec;
+ 
+-	f->sections = xrealloc(f->sections, (newidx + 1) * sizeof(sec));
++	f->sections = xrealloc_vector(f->sections, 2, newidx);
+ 	f->sections[newidx] = sec = arch_new_section();
+ 
+ 	sec->header.sh_type = SHT_PROGBITS;
+@@ -2237,7 +2237,7 @@
+ 	sec->name = name;
+ 	sec->idx = newidx;
+ 	if (size)
+-		sec->contents = xmalloc(size);
++		sec->contents = xzalloc(size);
+ 
+ 	sec->load_next = f->load_order;
+ 	f->load_order = sec;
+@@ -2689,8 +2689,7 @@
+ 	/* Collect the modules' symbols.  */
+ 
+ 	if (nmod) {
+-		ext_modules = modules = xmalloc(nmod * sizeof(*modules));
+-		memset(modules, 0, nmod * sizeof(*modules));
++		ext_modules = modules = xzalloc(nmod * sizeof(*modules));
+ 		for (i = 0, mn = module_names, m = modules;
+ 				i < nmod; ++i, ++m, mn += strlen(mn) + 1) {
+ 			struct new_module_info info;
+@@ -2770,13 +2769,14 @@
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
+@@ -3124,12 +3124,9 @@
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
++				s->contents = xzalloc(s->header.sh_size),
+ 			s->header.sh_type = SHT_PROGBITS;
+ 		}
+ 	}
+@@ -3354,8 +3351,10 @@
+ 	}
+ 
+ 	shnum = f->header.e_shnum;
+-	f->sections = xmalloc(sizeof(struct obj_section *) * shnum);
+-	memset(f->sections, 0, sizeof(struct obj_section *) * shnum);
++	/* Growth of ->sections vector will be done by
++	 * xrealloc_vector(..., 2, ...), therefore we must allocate
++	 * at least 2^2 = 4 extra elements here. */
++	f->sections = xzalloc(sizeof(f->sections[0]) * (shnum + 4));
+ 
+ 	section_headers = alloca(sizeof(ElfW(Shdr)) * shnum);
+ 	fseek(fp, f->header.e_shoff, SEEK_SET);
+@@ -3391,14 +3390,13 @@
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
