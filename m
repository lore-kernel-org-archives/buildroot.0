From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Sep 2008 04:54:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080922115418.048163C375@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-22 04:54:17 -0700 (Mon, 22 Sep 2008)
New Revision: 23453

Log:
busybox: more 1.12.0 patches

Added:
   trunk/buildroot/package/busybox/busybox-1.12.0-crontab_vi.patch
   trunk/buildroot/package/busybox/busybox-1.12.0-grep.patch
   trunk/buildroot/package/busybox/busybox-1.12.0-lineedit.patch

Modified:
   trunk/buildroot/package/busybox/busybox-1.12.0-insmod.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.12.0-crontab_vi.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.0-crontab_vi.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.0-crontab_vi.patch	2008-09-22 11:54:17 UTC (rev 23453)
@@ -0,0 +1,164 @@
+--- busybox-1.12.0/editors/vi.c	Wed Aug  6 00:56:11 2008
++++ busybox-1.12.0-crontab_vi/editors/vi.c	Sun Sep 21 17:30:47 2008
+@@ -147,10 +147,10 @@
+ #endif
+ 
+ 	smallint editing;        // >0 while we are editing a file
+-	                         // [code audit says "can be 0 or 1 only"]
++	                         // [code audit says "can be 0, 1 or 2 only"]
+ 	smallint cmd_mode;       // 0=command  1=insert 2=replace
+ 	int file_modified;       // buffer contents changed (counter, not flag!)
+-	int last_file_modified; // = -1;
++	int last_file_modified;  // = -1;
+ 	int fn_start;            // index of first cmd line file name
+ 	int save_argc;           // how many file names on cmd line
+ 	int cmdcnt;              // repetition count
+@@ -623,7 +623,7 @@
+ 		// These are commands that change text[].
+ 		// Remember the input for the "." command
+ 		if (!adding2q && ioq_start == NULL
+-		 && strchr(modifying_cmds, c)
++		 && c != '\0' && strchr(modifying_cmds, c)
+ 		) {
+ 			start_new_cmd_q(c);
+ 		}
+@@ -645,8 +645,8 @@
+ 	}
+ 	//-------------------------------------------------------------------
+ 
+-	place_cursor(rows, 0, FALSE);	// go to bottom of screen
+-	clear_to_eol();		// Erase to end of line
++	place_cursor(rows - 1, 0, FALSE); // go to bottom of screen
++	clear_to_eol(); // erase to end of line
+ 	cookmode();
+ #undef cur_line
+ }
+@@ -2009,9 +2009,9 @@
+ {
+ 	// get buffer for new cmd
+ 	// if there is a current cmd count put it in the buffer first
+-	if (cmdcnt > 0)
++	if (cmdcnt > 0) {
+ 		lmc_len = sprintf(last_modifying_cmd, "%d%c", cmdcnt, c);
+-	else { // just save char c onto queue
++	} else { // just save char c onto queue
+ 		last_modifying_cmd[0] = c;
+ 		lmc_len = 1;
+ 	}
+@@ -2157,21 +2157,21 @@
+ //----- Come here when we get a continue signal -------------------
+ static void cont_sig(int sig UNUSED_PARAM)
+ {
+-	rawmode();			// terminal to "raw"
+-	last_status_cksum = 0;	// force status update
+-	redraw(TRUE);		// re-draw the screen
++	rawmode(); // terminal to "raw"
++	last_status_cksum = 0; // force status update
++	redraw(TRUE); // re-draw the screen
+ 
+ 	signal(SIGTSTP, suspend_sig);
+ 	signal(SIGCONT, SIG_DFL);
+-	kill(my_pid, SIGCONT);
++	kill(my_pid, SIGCONT); // huh? why? we are already "continued"...
+ }
+ 
+ //----- Come here when we get a Suspend signal -------------------
+ static void suspend_sig(int sig UNUSED_PARAM)
+ {
+-	place_cursor(rows - 1, 0, FALSE);	// go to bottom of screen
+-	clear_to_eol();		// Erase to end of line
+-	cookmode();			// terminal to "cooked"
++	place_cursor(rows - 1, 0, FALSE); // go to bottom of screen
++	clear_to_eol(); // erase to end of line
++	cookmode(); // terminal to "cooked"
+ 
+ 	signal(SIGCONT, cont_sig);
+ 	signal(SIGTSTP, SIG_DFL);
+@@ -2247,18 +2247,20 @@
+ 
+ 	fflush(stdout);
+ 	n = chars_to_parse;
+-	// get input from User- are there already input chars in Q?
++	// get input from User - are there already input chars in Q?
+ 	if (n <= 0) {
+ 		// the Q is empty, wait for a typed char
++ again:
+ 		n = safe_read(STDIN_FILENO, readbuffer, sizeof(readbuffer));
+-		if (n < 0) {
+-			if (errno == EBADF || errno == EFAULT || errno == EINVAL
+-			 || errno == EIO)
+-				editing = 0; // want to exit
+-			errno = 0;
++		if (n <= 0) {
++			place_cursor(rows - 1, 0, FALSE); // go to bottom of screen
++			clear_to_eol(); // erase to end of line
++			cookmode(); // terminal to "cooked"
++			bb_error_msg_and_die("can't read user input");
+ 		}
+-		if (n <= 0)
+-			return 0;       // error
++		/* elsewhere we can get very confused by NULs */
++		if (readbuffer[0] == '\0')
++			goto again;
+ 		if (readbuffer[0] == 27) {
+ 			// This is an ESC char. Is this Esc sequence?
+ 			// Could be bare Esc key. See if there are any
+--- busybox-1.12.0/miscutils/crontab.c	Wed Aug  6 00:56:08 2008
++++ busybox-1.12.0-crontab_vi/miscutils/crontab.c	Sun Sep 21 17:30:47 2008
+@@ -93,6 +93,7 @@
+ 	char *new_fname;
+ 	char *user_name;  /* -u USER */
+ 	int fd;
++	int src_fd;
+ 	int opt_ler;
+ 
+ 	/* file [opts]     Replace crontab from file
+@@ -144,15 +145,15 @@
+ 		bb_show_usage();
+ 
+ 	/* Read replacement file under user's UID/GID/group vector */
++	src_fd = STDIN_FILENO;
+ 	if (!opt_ler) { /* Replace? */
+ 		if (!argv[0])
+ 			bb_show_usage();
+ 		if (NOT_LONE_DASH(argv[0])) {
+-			fd = open_as_user(pas, argv[0]);
+-			if (fd < 0)
++			src_fd = open_as_user(pas, argv[0]);
++			if (src_fd < 0)
+ 				bb_error_msg_and_die("user %s cannot read %s",
+ 						pas->pw_name, argv[0]);
+-			xmove_fd(fd, STDIN_FILENO);
+ 		}
+ 	}
+ 
+@@ -180,23 +181,23 @@
+ 		tmp_fname = xasprintf("%s.%u", crontab_dir, (unsigned)getpid());
+ 		/* No O_EXCL: we don't want to be stuck if earlier crontabs
+ 		 * were killed, leaving stale temp file behind */
+-		fd = xopen3(tmp_fname, O_RDWR|O_CREAT|O_TRUNC, 0600);
+-		xmove_fd(fd, STDIN_FILENO);
+-		fchown(STDIN_FILENO, pas->pw_uid, pas->pw_gid);
++		src_fd = xopen3(tmp_fname, O_RDWR|O_CREAT|O_TRUNC, 0600);
++		fchown(src_fd, pas->pw_uid, pas->pw_gid);
+ 		fd = open(pas->pw_name, O_RDONLY);
+ 		if (fd >= 0) {
+-			bb_copyfd_eof(fd, STDIN_FILENO);
++			bb_copyfd_eof(fd, src_fd);
+ 			close(fd);
++			xlseek(src_fd, 0, SEEK_SET);
+ 		}
++		close_on_exec_on(src_fd); /* don't want editor to see this fd */
+ 		edit_file(pas, tmp_fname);
+-		xlseek(STDIN_FILENO, 0, SEEK_SET);
+ 		/* fall through */
+ 
+ 	case 0: /* Replace (no -l, -e, or -r were given) */
+ 		new_fname = xasprintf("%s.new", pas->pw_name);
+ 		fd = open(new_fname, O_WRONLY|O_CREAT|O_TRUNC|O_APPEND, 0600);
+ 		if (fd >= 0) {
+-			bb_copyfd_eof(STDIN_FILENO, fd);
++			bb_copyfd_eof(src_fd, fd);
+ 			close(fd);
+ 			xrename(new_fname, pas->pw_name);
+ 		} else {

Added: trunk/buildroot/package/busybox/busybox-1.12.0-grep.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.0-grep.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.0-grep.patch	2008-09-22 11:54:17 UTC (rev 23453)
@@ -0,0 +1,78 @@
+--- busybox-1.12.0/findutils/grep.c	Sat Aug  9 18:14:59 2008
++++ busybox-1.12.0-grep/findutils/grep.c	Fri Sep 19 23:33:15 2008
+@@ -87,7 +87,11 @@
+ 
+ struct globals {
+ 	int max_matches;
++#if !ENABLE_EXTRA_COMPAT
+ 	int reflags;
++#else
++	RE_TRANSLATE_TYPE case_fold; /* RE_TRANSLATE_TYPE is [[un]signed] char* */
++#endif
+ 	smalluint invert_search;
+ 	smalluint print_filename;
+ 	smalluint open_errors;
+@@ -110,7 +114,19 @@
+ 	}; \
+ } while (0)
+ #define max_matches       (G.max_matches         )
++#if !ENABLE_EXTRA_COMPAT
+ #define reflags           (G.reflags             )
++#else
++#define case_fold         (G.case_fold           )
++/* http://www.delorie.com/gnu/docs/regex/regex_46.html */
++#define reflags           re_syntax_options
++#undef REG_NOSUB
++#undef REG_EXTENDED
++#undef REG_ICASE
++#define REG_NOSUB    bug:is:here /* should not be used */
++#define REG_EXTENDED RE_SYNTAX_EGREP
++#define REG_ICASE    bug:is:here /* should not be used */
++#endif
+ #define invert_search     (G.invert_search       )
+ #define print_filename    (G.print_filename      )
+ #define open_errors       (G.open_errors         )
+@@ -240,6 +256,7 @@
+ 					xregcomp(&gl->compiled_regex, gl->pattern, reflags);
+ #else
+ 					memset(&gl->compiled_regex, 0, sizeof(gl->compiled_regex));
++					gl->compiled_regex.translate = case_fold; /* for -i */
+ 					if (re_compile_pattern(gl->pattern, strlen(gl->pattern), &gl->compiled_regex))
+ 						bb_error_msg_and_die("bad regex '%s'", gl->pattern);
+ #endif
+@@ -532,17 +549,34 @@
+ 	if (ENABLE_FEATURE_GREP_FGREP_ALIAS && applet_name[0] == 'f')
+ 		option_mask32 |= OPT_F;
+ 
++#if !ENABLE_EXTRA_COMPAT
+ 	if (!(option_mask32 & (OPT_o | OPT_w)))
+ 		reflags = REG_NOSUB;
++#endif
+ 
+ 	if (ENABLE_FEATURE_GREP_EGREP_ALIAS
+ 	 && (applet_name[0] == 'e' || (option_mask32 & OPT_E))
+ 	) {
+ 		reflags |= REG_EXTENDED;
+ 	}
++#if ENABLE_EXTRA_COMPAT
++	else {
++		reflags = RE_SYNTAX_GREP;
++	}
++#endif
+ 
+-	if (option_mask32 & OPT_i)
++	if (option_mask32 & OPT_i) {
++#if !ENABLE_EXTRA_COMPAT
+ 		reflags |= REG_ICASE;
++#else
++		int i;
++		case_fold = xmalloc(256);
++		for (i = 0; i < 256; i++)
++			case_fold[i] = (unsigned char)i;
++		for (i = 'a'; i <= 'z'; i++)
++			case_fold[i] = (unsigned char)(i - ('a' - 'A'));
++#endif
++	}
+ 
+ 	argv += optind;
+ 	argc -= optind;

Modified: trunk/buildroot/package/busybox/busybox-1.12.0-insmod.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.0-insmod.patch	2008-09-22 08:11:05 UTC (rev 23452)
+++ trunk/buildroot/package/busybox/busybox-1.12.0-insmod.patch	2008-09-22 11:54:17 UTC (rev 23453)
@@ -1,6 +1,113 @@
 --- busybox-1.12.0/modutils/insmod.c	Wed Aug  6 00:56:02 2008
-+++ busybox-1.12.0-insmod/modutils/insmod.c	Thu Aug 28 23:38:35 2008
-@@ -2212,7 +2212,7 @@
++++ busybox-1.12.0-insmod/modutils/insmod.c	Sun Aug 31 23:56:28 2008
+@@ -1059,8 +1059,9 @@
+ 
+ 		case R_68K_PC8:
+ 			v -= dot;
+-			if ((ElfW(Sword))v > 0x7f ||
+-					(ElfW(Sword))v < -(ElfW(Sword))0x80) {
++			if ((ElfW(Sword))v > 0x7f
++			 || (ElfW(Sword))v < -(ElfW(Sword))0x80
++			) {
+ 				ret = obj_reloc_overflow;
+ 			}
+ 			*(char *)loc = v;
+@@ -1068,8 +1069,9 @@
+ 
+ 		case R_68K_PC16:
+ 			v -= dot;
+-			if ((ElfW(Sword))v > 0x7fff ||
+-					(ElfW(Sword))v < -(ElfW(Sword))0x8000) {
++			if ((ElfW(Sword))v > 0x7fff
++			 || (ElfW(Sword))v < -(ElfW(Sword))0x8000
++			) {
+ 				ret = obj_reloc_overflow;
+ 			}
+ 			*(short *)loc = v;
+@@ -1208,8 +1210,9 @@
+ 			{
+ 				Elf32_Addr word;
+ 
+-				if ((Elf32_Sword)v > 0x7fff ||
+-				    (Elf32_Sword)v < -(Elf32_Sword)0x8000) {
++				if ((Elf32_Sword)v > 0x7fff
++				 || (Elf32_Sword)v < -(Elf32_Sword)0x8000
++				) {
+ 					ret = obj_reloc_overflow;
+ 				}
+ 
+@@ -1238,8 +1241,9 @@
+ 				Elf32_Addr word;
+ 
+ 				v -= dot + 4;
+-				if ((Elf32_Sword)v > 0x7fff ||
+-				    (Elf32_Sword)v < -(Elf32_Sword)0x8000) {
++				if ((Elf32_Sword)v > 0x7fff
++				 || (Elf32_Sword)v < -(Elf32_Sword)0x8000
++				) {
+ 					ret = obj_reloc_overflow;
+ 				}
+ 
+@@ -1253,9 +1257,10 @@
+ 				Elf32_Addr word, gp;
+ 				/* get _gp */
+ 				gp = obj_symbol_final_value(f, obj_find_symbol(f, SPFX "_gp"));
+-				v-=gp;
+-				if ((Elf32_Sword)v > 0x7fff ||
+-						(Elf32_Sword)v < -(Elf32_Sword)0x8000) {
++				v -= gp;
++				if ((Elf32_Sword)v > 0x7fff
++				 || (Elf32_Sword)v < -(Elf32_Sword)0x8000
++				) {
+ 					ret = obj_reloc_overflow;
+ 				}
+ 
+@@ -2132,7 +2137,6 @@
+ 	for (sym = f->symtab[hash]; sym; sym = sym->next)
+ 		if (f->symbol_cmp(sym->name, name) == 0)
+ 			return sym;
+-
+ 	return NULL;
+ }
+ 
+@@ -2141,12 +2145,10 @@
+ 	if (sym) {
+ 		if (sym->secidx >= SHN_LORESERVE)
+ 			return sym->value;
+-
+ 		return sym->value + f->sections[sym->secidx]->header.sh_addr;
+-	} else {
+-		/* As a special case, a NULL sym has value zero.  */
+-		return 0;
+ 	}
++	/* As a special case, a NULL sym has value zero.  */
++	return 0;
+ }
+ 
+ static struct obj_section *obj_find_section(struct obj_file *f, const char *name)
+@@ -2156,7 +2158,6 @@
+ 	for (i = 0; i < n; ++i)
+ 		if (strcmp(f->sections[i]->name, name) == 0)
+ 			return f->sections[i];
+-
+ 	return NULL;
+ }
+ 
+@@ -2167,9 +2168,11 @@
+ 	af = a->header.sh_flags;
+ 
+ 	ac = 0;
+-	if (a->name[0] != '.' || strlen(a->name) != 10 ||
+-			strcmp(a->name + 5, ".init"))
++	if (a->name[0] != '.' || strlen(a->name) != 10
++	 || strcmp(a->name + 5, ".init") != 0
++	) {
+ 		ac |= 32;
++	}
+ 	if (af & SHF_ALLOC)
+ 		ac |= 16;
+ 	if (!(af & SHF_WRITE))
+@@ -2212,7 +2215,7 @@
  	sec->name = name;
  	sec->idx = newidx;
  	if (size)
@@ -9,7 +116,7 @@
  
  	obj_insert_section_load_order(f, sec);
  
-@@ -2227,7 +2227,7 @@
+@@ -2227,7 +2230,7 @@
  	int newidx = f->header.e_shnum++;
  	struct obj_section *sec;
  
@@ -18,7 +125,7 @@
  	f->sections[newidx] = sec = arch_new_section();
  
  	sec->header.sh_type = SHT_PROGBITS;
-@@ -2237,7 +2237,7 @@
+@@ -2237,7 +2240,7 @@
  	sec->name = name;
  	sec->idx = newidx;
  	if (size)
@@ -27,7 +134,7 @@
  
  	sec->load_next = f->load_order;
  	f->load_order = sec;
-@@ -2689,8 +2689,7 @@
+@@ -2689,8 +2692,7 @@
  	/* Collect the modules' symbols.  */
  
  	if (nmod) {
@@ -37,7 +144,7 @@
  		for (i = 0, mn = module_names, m = modules;
  				i < nmod; ++i, ++m, mn += strlen(mn) + 1) {
  			struct new_module_info info;
-@@ -2770,13 +2769,14 @@
+@@ -2770,13 +2772,14 @@
  }
  
  
@@ -54,7 +161,64 @@
  
  	obj_add_symbol(f, SPFX "__this_module", -1,
  			ELF_ST_INFO(STB_LOCAL, STT_OBJECT), sec->idx, 0,
-@@ -3124,12 +3124,9 @@
+@@ -2856,18 +2859,19 @@
+ 		/* We don't want to export symbols residing in sections that
+ 		   aren't loaded.  There are a number of these created so that
+ 		   we make sure certain module options don't appear twice.  */
+-
+-		loaded = alloca(sizeof(int) * (i = f->header.e_shnum));
++		i = f->header.e_shnum;
++		loaded = alloca(sizeof(int) * i);
+ 		while (--i >= 0)
+ 			loaded[i] = (f->sections[i]->header.sh_flags & SHF_ALLOC) != 0;
+ 
+ 		for (nsyms = i = 0; i < HASH_BUCKETS; ++i) {
+ 			struct obj_symbol *sym;
+-			for (sym = f->symtab[i]; sym; sym = sym->next)
++			for (sym = f->symtab[i]; sym; sym = sym->next) {
+ 				if (ELF_ST_BIND(sym->info) != STB_LOCAL
+ 						&& sym->secidx <= SHN_HIRESERVE
+ 						&& (sym->secidx >= SHN_LORESERVE
+-							|| loaded[sym->secidx])) {
++							|| loaded[sym->secidx])
++				) {
+ 					ElfW(Addr) ofs = nsyms * 2 * tgt_sizeof_void_p;
+ 
+ 					obj_symbol_patch(f, sec->idx, ofs, sym);
+@@ -2876,6 +2880,7 @@
+ 
+ 					nsyms++;
+ 				}
++			}
+ 		}
+ 
+ 		obj_extend_section(sec, nsyms * 2 * tgt_sizeof_char_p);
+@@ -2934,9 +2939,11 @@
+ 	}
+ 	sec = obj_find_section(f, ".data.init");
+ 	if (sec) {
+-		if (!module->runsize ||
+-				module->runsize > sec->header.sh_addr - m_addr)
++		if (!module->runsize
++		 || module->runsize > sec->header.sh_addr - m_addr
++		) {
+ 			module->runsize = sec->header.sh_addr - m_addr;
++		}
+ 	}
+ 	sec = obj_find_section(f, ARCHDATA_SEC_NAME);
+ 	if (sec && sec->header.sh_size) {
+@@ -3083,9 +3090,9 @@
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
+@@ -3124,12 +3131,9 @@
  	for (i = 0; i < f->header.e_shnum; ++i) {
  		struct obj_section *s = f->sections[i];
  		if (s->header.sh_type == SHT_NOBITS) {
@@ -69,9 +233,45 @@
  			s->header.sh_type = SHT_PROGBITS;
  		}
  	}
-@@ -3354,8 +3351,10 @@
+@@ -3222,8 +3226,8 @@
+ #if SHT_RELM == SHT_RELA
+ #if defined(__alpha__) && defined(AXP_BROKEN_GAS)
+ 			/* Work around a nasty GAS bug, that is fixed as of 2.7.0.9.  */
+-			if (!extsym || !extsym->st_name ||
+-					ELF_ST_BIND(extsym->st_info) != STB_LOCAL)
++			if (!extsym || !extsym->st_name
++			 || ELF_ST_BIND(extsym->st_info) != STB_LOCAL)
+ #endif
+ 				value += rel->r_addend;
+ #endif
+@@ -3329,16 +3333,17 @@
  	}
  
+ 	if (f->header.e_ident[EI_MAG0] != ELFMAG0
+-			|| f->header.e_ident[EI_MAG1] != ELFMAG1
+-			|| f->header.e_ident[EI_MAG2] != ELFMAG2
+-			|| f->header.e_ident[EI_MAG3] != ELFMAG3) {
++	 || f->header.e_ident[EI_MAG1] != ELFMAG1
++	 || f->header.e_ident[EI_MAG2] != ELFMAG2
++	 || f->header.e_ident[EI_MAG3] != ELFMAG3
++	) {
+ 		bb_error_msg_and_die("not an ELF file");
+ 	}
+ 	if (f->header.e_ident[EI_CLASS] != ELFCLASSM
+-			|| f->header.e_ident[EI_DATA] != (BB_BIG_ENDIAN
+-				? ELFDATA2MSB : ELFDATA2LSB)
+-			|| f->header.e_ident[EI_VERSION] != EV_CURRENT
+-			|| !MATCH_MACHINE(f->header.e_machine)) {
++	 || f->header.e_ident[EI_DATA] != (BB_BIG_ENDIAN ? ELFDATA2MSB : ELFDATA2LSB)
++	 || f->header.e_ident[EI_VERSION] != EV_CURRENT
++	 || !MATCH_MACHINE(f->header.e_machine)
++	) {
+ 		bb_error_msg_and_die("ELF file not for this architecture");
+ 	}
+ 	if (f->header.e_type != ET_REL) {
+@@ -3354,8 +3359,10 @@
+ 	}
+ 
  	shnum = f->header.e_shnum;
 -	f->sections = xmalloc(sizeof(struct obj_section *) * shnum);
 -	memset(f->sections, 0, sizeof(struct obj_section *) * shnum);
@@ -82,7 +282,7 @@
  
  	section_headers = alloca(sizeof(ElfW(Shdr)) * shnum);
  	fseek(fp, f->header.e_shoff, SEEK_SET);
-@@ -3391,14 +3390,13 @@
+@@ -3391,14 +3398,13 @@
  			case SHT_SYMTAB:
  			case SHT_STRTAB:
  			case SHT_RELM:
@@ -99,3 +299,35 @@
  				}
  				break;
  
+@@ -3860,16 +3866,20 @@
+ 	for (nsyms = i = 0; i < HASH_BUCKETS; ++i)
+ 		for (sym = f->symtab[i]; sym; sym = sym->next)
+ 			if (sym->secidx <= SHN_HIRESERVE
+-					&& (sym->secidx >= SHN_LORESERVE || loaded[sym->secidx]))
++			 && (sym->secidx >= SHN_LORESERVE || loaded[sym->secidx])
++			) {
+ 				++nsyms;
++			}
+ 
+ 	all = alloca(nsyms * sizeof(struct obj_symbol *));
+ 
+ 	for (i = 0, p = all; i < HASH_BUCKETS; ++i)
+ 		for (sym = f->symtab[i]; sym; sym = sym->next)
+ 			if (sym->secidx <= SHN_HIRESERVE
+-					&& (sym->secidx >= SHN_LORESERVE || loaded[sym->secidx]))
++			 && (sym->secidx >= SHN_LORESERVE || loaded[sym->secidx])
++			) {
+ 				*p++ = sym;
++			}
+ 
+ 	/* And list them.  */
+ 	printf("\nSymbols:\n");
+@@ -4265,7 +4275,7 @@
+ 	}
+ #else
+ 	len = MAXINT(ssize_t);
+-	map = xmalloc_open_read_close(filename, &len);
++	map = xmalloc_xopen_read_close(filename, &len);
+ #endif
+ 
+ 	if (init_module(map, len, options) != 0)

Added: trunk/buildroot/package/busybox/busybox-1.12.0-lineedit.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.0-lineedit.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.0-lineedit.patch	2008-09-22 11:54:17 UTC (rev 23453)
@@ -0,0 +1,145 @@
+--- busybox-1.12.0/libbb/lineedit.c	Wed Aug 20 02:48:13 2008
++++ busybox-1.12.0-lineedit/libbb/lineedit.c	Mon Sep 22 00:27:18 2008
+@@ -956,24 +956,33 @@
+ 
+ #if MAX_HISTORY > 0
+ 
++static void save_command_ps_at_cur_history(void)
++{
++	if (command_ps[0] != '\0') {
++		int cur = state->cur_history;
++		free(state->history[cur]);
++		state->history[cur] = xstrdup(command_ps);
++	}
++}
++
+ /* state->flags is already checked to be nonzero */
+-static void get_previous_history(void)
++static int get_previous_history(void)
+ {
+-	if (command_ps[0] != '\0' || state->history[state->cur_history] == NULL) {
+-		free(state->history[state->cur_history]);
+-		state->history[state->cur_history] = xstrdup(command_ps);
++	if ((state->flags & DO_HISTORY) && state->cur_history) {
++		save_command_ps_at_cur_history();
++		state->cur_history--;
++		return 1;
+ 	}
+-	state->cur_history--;
++	beep();
++	return 0;
+ }
+ 
+ static int get_next_history(void)
+ {
+ 	if (state->flags & DO_HISTORY) {
+-		int ch = state->cur_history;
+-		if (ch < state->cnt_history) {
+-			get_previous_history(); /* save the current history line */
+-			state->cur_history = ch + 1;
+-			return state->cur_history;
++		if (state->cur_history < state->cnt_history) {
++			save_command_ps_at_cur_history(); /* save the current history line */
++			return ++state->cur_history;
+ 		}
+ 	}
+ 	beep();
+@@ -995,6 +1004,7 @@
+ 		for (hi = state->cnt_history; hi > 0;) {
+ 			hi--;
+ 			free(state->history[hi]);
++			state->history[hi] = NULL;
+ 		}
+ 
+ 		for (hi = 0; hi < MAX_HISTORY;) {
+@@ -1006,7 +1016,7 @@
+ 			l = strlen(hl);
+ 			if (l >= MAX_LINELEN)
+ 				hl[MAX_LINELEN-1] = '\0';
+-			if (l == 0 || hl[0] == ' ') {
++			if (l == 0) {
+ 				free(hl);
+ 				continue;
+ 			}
+@@ -1043,19 +1053,27 @@
+ 
+ 	if (!(state->flags & DO_HISTORY))
+ 		return;
+-
++	if (str[0] == '\0')
++		return;
+ 	i = state->cnt_history;
+-	free(state->history[MAX_HISTORY]);
+-	state->history[MAX_HISTORY] = NULL;
+-	/* After max history, remove the oldest command */
++	/* Don't save dupes */
++	if (i && strcmp(state->history[i-1], str) == 0)
++		return;
++
++	free(state->history[MAX_HISTORY]); /* redundant, paranoia */
++	state->history[MAX_HISTORY] = NULL; /* redundant, paranoia */
++
++	/* If history[] is full, remove the oldest command */
++	/* we need to keep history[MAX_HISTORY] empty, hence >=, not > */
+ 	if (i >= MAX_HISTORY) {
+ 		free(state->history[0]);
+ 		for (i = 0; i < MAX_HISTORY-1; i++)
+ 			state->history[i] = state->history[i+1];
++		/* i == MAX_HISTORY-1 */
+ 	}
+-// Maybe "if (!i || strcmp(history[i-1], command) != 0) ..."
+-// (i.e. do not save dups?)
++	/* i <= MAX_HISTORY-1 */
+ 	state->history[i++] = xstrdup(str);
++	/* i <= MAX_HISTORY */
+ 	state->cur_history = i;
+ 	state->cnt_history = i;
+ #if ENABLE_FEATURE_EDITING_SAVEHISTORY
+@@ -1432,6 +1450,13 @@
+ 		}
+ 	}
+ #endif
++
++#if 0
++	for (ic = 0; ic <= MAX_HISTORY; ic++)
++		bb_error_msg("history[%d]:'%s'", ic, state->history[ic]);
++	bb_error_msg("cur_history:%d cnt_history:%d", state->cur_history, state->cnt_history);
++#endif
++
+ 	/* Print out the command prompt */
+ 	parse_and_put_prompt(prompt);
+ 
+@@ -1540,11 +1565,8 @@
+ 		vi_case(CTRL('P')|vbit:)
+ 		vi_case('k'|vbit:)
+ 			/* Control-p -- Get previous command from history */
+-			if ((state->flags & DO_HISTORY) && state->cur_history > 0) {
+-				get_previous_history();
++			if (get_previous_history())
+ 				goto rewrite_line;
+-			}
+-			beep();
+ 			break;
+ #endif
+ 
+@@ -1733,10 +1755,8 @@
+ #if MAX_HISTORY > 0
+ 			case 'A':
+ 				/* Up Arrow -- Get previous command from history */
+-				if ((state->flags & DO_HISTORY) && state->cur_history > 0) {
+-					get_previous_history();
++				if (get_previous_history())
+ 					goto rewrite_line;
+-				}
+ 				beep();
+ 				break;
+ 			case 'B':
+@@ -1746,7 +1766,7 @@
+  rewrite_line:
+ 				/* Rewrite the line with the selected history item */
+ 				/* change command */
+-				command_len = strlen(strcpy(command, state->history[state->cur_history]));
++				command_len = strlen(strcpy(command, state->history[state->cur_history] ? : ""));
+ 				/* redraw and go to eol (bol, in vi */
+ 				redraw(cmdedit_y, (state->flags & VI_MODE) ? 9999 : 0);
+ 				break;
