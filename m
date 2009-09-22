From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Sep 2009 23:20:55 +0200
Subject: [Buildroot] [git commit master] busybox: 1.15.1 fixes
Message-ID: <20090922212121.7FEE977739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8a83e8d7b8ee8e639730da6ab05b0f216fbadec0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.15.1-ash.patch           |   29 +++
 package/busybox/busybox-1.15.1-buildsys.patch      |   34 +++
 package/busybox/busybox-1.15.1-dd.patch            |   35 +++
 package/busybox/busybox-1.15.1-pidof_killall.patch |  250 ++++++++++++++++++++
 package/busybox/busybox-1.15.1-sed.patch           |   15 ++
 5 files changed, 363 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.15.1-ash.patch
 create mode 100644 package/busybox/busybox-1.15.1-buildsys.patch
 create mode 100644 package/busybox/busybox-1.15.1-dd.patch
 create mode 100644 package/busybox/busybox-1.15.1-pidof_killall.patch
 create mode 100644 package/busybox/busybox-1.15.1-sed.patch

diff --git a/package/busybox/busybox-1.15.1-ash.patch b/package/busybox/busybox-1.15.1-ash.patch
new file mode 100644
index 0000000..b77e45f
--- /dev/null
+++ b/package/busybox/busybox-1.15.1-ash.patch
@@ -0,0 +1,29 @@
+diff -urpN busybox-1.15.1/shell/ash.c busybox-1.15.1-ash/shell/ash.c
+--- busybox-1.15.1/shell/ash.c	2009-09-12 17:56:11.000000000 +0200
++++ busybox-1.15.1-ash/shell/ash.c	2009-09-16 16:29:09.609276492 +0200
+@@ -5553,7 +5553,7 @@ exptilde(char *startp, char *p, int flag
+ 	char *name;
+ 	struct passwd *pw;
+ 	const char *home;
+-	int quotes = flag & (EXP_FULL | EXP_CASE);
++	int quotes = flag & (EXP_FULL | EXP_CASE | EXP_REDIR);
+ 	int startloc;
+ 
+ 	name = p + 1;
+@@ -6321,7 +6321,7 @@ varvalue(char *name, int varflags, int f
+ 	int syntax;
+ 	int quoted = varflags & VSQUOTE;
+ 	int subtype = varflags & VSTYPE;
+-	int quotes = flags & (EXP_FULL | EXP_CASE);
++	int quotes = flags & (EXP_FULL | EXP_CASE | EXP_REDIR);
+ 
+ 	if (quoted && (flags & EXP_FULL))
+ 		sep = 1 << CHAR_BIT;
+@@ -6558,6 +6558,7 @@ evalvar(char *p, int flag, struct strlis
+ 		patloc = expdest - (char *)stackblock();
+ 		if (0 == subevalvar(p, /* str: */ NULL, patloc, subtype,
+ 				startloc, varflags,
++//TODO: | EXP_REDIR too? All other such places do it too
+ 				/* quotes: */ flag & (EXP_FULL | EXP_CASE),
+ 				var_str_list)
+ 		) {
diff --git a/package/busybox/busybox-1.15.1-buildsys.patch b/package/busybox/busybox-1.15.1-buildsys.patch
new file mode 100644
index 0000000..e63f8f8
--- /dev/null
+++ b/package/busybox/busybox-1.15.1-buildsys.patch
@@ -0,0 +1,34 @@
+diff -urpN busybox-1.15.1/miscutils/hdparm.c busybox-1.15.1-buildsys/miscutils/hdparm.c
+--- busybox-1.15.1/miscutils/hdparm.c	2009-09-12 17:55:36.000000000 +0200
++++ busybox-1.15.1-buildsys/miscutils/hdparm.c	2009-09-22 23:13:25.000000000 +0200
+@@ -15,6 +15,9 @@
+ /* must be _after_ libbb.h: */
+ #include <linux/hdreg.h>
+ #include <sys/mount.h>
++#if !defined(BLKGETSIZE64)
++# define BLKGETSIZE64 _IOR(0x12,114,size_t)
++#endif
+ 
+ /* device types */
+ /* ------------ */
+diff -urpN busybox-1.15.1/util-linux/fdisk.c busybox-1.15.1-buildsys/util-linux/fdisk.c
+--- busybox-1.15.1/util-linux/fdisk.c	2009-09-12 17:55:37.000000000 +0200
++++ busybox-1.15.1-buildsys/util-linux/fdisk.c	2009-09-22 23:13:25.000000000 +0200
+@@ -9,13 +9,16 @@
+ 
+ #ifndef _LARGEFILE64_SOURCE
+ /* For lseek64 */
+-#define _LARGEFILE64_SOURCE
++# define _LARGEFILE64_SOURCE
+ #endif
+ #include <assert.h>             /* assert */
+ #include <sys/mount.h>
+ #if !defined(BLKSSZGET)
+ # define BLKSSZGET _IO(0x12, 104)
+ #endif
++#if !defined(BLKGETSIZE64)
++# define BLKGETSIZE64 _IOR(0x12,114,size_t)
++#endif
+ #include "libbb.h"
+ 
+ /* Looks like someone forgot to add this to config system */
diff --git a/package/busybox/busybox-1.15.1-dd.patch b/package/busybox/busybox-1.15.1-dd.patch
new file mode 100644
index 0000000..a3e2676
--- /dev/null
+++ b/package/busybox/busybox-1.15.1-dd.patch
@@ -0,0 +1,35 @@
+diff -urpN busybox-1.15.1/coreutils/dd.c busybox-1.15.1-dd/coreutils/dd.c
+--- busybox-1.15.1/coreutils/dd.c	2009-09-12 17:55:58.000000000 +0200
++++ busybox-1.15.1-dd/coreutils/dd.c	2009-09-18 20:48:22.000000000 +0200
+@@ -286,25 +286,26 @@ int dd_main(int argc UNUSED_PARAM, char 
+ 	}
+ 
+ 	while (!(flags & FLAG_COUNT) || (G.in_full + G.in_part != count)) {
+-		if (flags & FLAG_NOERROR) /* Pre-zero the buffer if conv=noerror */
+-			memset(ibuf, 0, ibs);
+ 		n = safe_read(ifd, ibuf, ibs);
+ 		if (n == 0)
+ 			break;
+ 		if (n < 0) {
++			/* "Bad block" */
+ 			if (!(flags & FLAG_NOERROR))
+ 				goto die_infile;
+-			n = ibs;
+ 			bb_simple_perror_msg(infile);
+-			/* GNU dd with conv=noerror skips over "bad blocks" */
++			/* GNU dd with conv=noerror skips over bad blocks */
+ 			xlseek(ifd, ibs, SEEK_CUR);
++			/* conv=noerror,sync writes NULs,
++			 * conv=noerror just ignores input bad blocks */
++			n = 0;
+ 		}
+ 		if ((size_t)n == ibs)
+ 			G.in_full++;
+ 		else {
+ 			G.in_part++;
+ 			if (flags & FLAG_SYNC) {
+-				memset(ibuf + n, '\0', ibs - n);
++				memset(ibuf + n, 0, ibs - n);
+ 				n = ibs;
+ 			}
+ 		}
diff --git a/package/busybox/busybox-1.15.1-pidof_killall.patch b/package/busybox/busybox-1.15.1-pidof_killall.patch
new file mode 100644
index 0000000..43c0c80
--- /dev/null
+++ b/package/busybox/busybox-1.15.1-pidof_killall.patch
@@ -0,0 +1,250 @@
+diff -urpN busybox-1.15.1/libbb/procps.c busybox-1.15.1-pidof_killall/libbb/procps.c
+--- busybox-1.15.1/libbb/procps.c	2009-09-12 17:55:58.000000000 +0200
++++ busybox-1.15.1-pidof_killall/libbb/procps.c	2009-09-22 23:03:59.000000000 +0200
+@@ -134,8 +134,8 @@ static unsigned long fast_strtoul_16(cha
+ 	return n;
+ }
+ /* TOPMEM uses fast_strtoul_10, so... */
+-#undef ENABLE_FEATURE_FAST_TOP
+-#define ENABLE_FEATURE_FAST_TOP 1
++# undef ENABLE_FEATURE_FAST_TOP
++# define ENABLE_FEATURE_FAST_TOP 1
+ #endif
+ 
+ #if ENABLE_FEATURE_FAST_TOP
+@@ -198,14 +198,16 @@ procps_status_t* FAST_FUNC procps_scan(p
+ 		if (errno)
+ 			continue;
+ 
+-		/* After this point we have to break, not continue
+-		 * ("continue" would mean that current /proc/NNN
+-		 * is not a valid process info) */
++		/* After this point we can:
++		 * "break": stop parsing, return the data
++		 * "continue": try next /proc/XXX
++		 */
+ 
+ 		memset(&sp->vsz, 0, sizeof(*sp) - offsetof(procps_status_t, vsz));
+ 
+ 		sp->pid = pid;
+-		if (!(flags & ~PSSCAN_PID)) break;
++		if (!(flags & ~PSSCAN_PID))
++			break; /* we needed only pid, we got it */
+ 
+ #if ENABLE_SELINUX
+ 		if (flags & PSSCAN_CONTEXT) {
+@@ -218,7 +220,7 @@ procps_status_t* FAST_FUNC procps_scan(p
+ 
+ 		if (flags & PSSCAN_UIDGID) {
+ 			if (stat(filename, &sb))
+-				break;
++				continue; /* process probably exited */
+ 			/* Effective UID/GID, not real */
+ 			sp->uid = sb.st_uid;
+ 			sp->gid = sb.st_gid;
+@@ -234,10 +236,10 @@ procps_status_t* FAST_FUNC procps_scan(p
+ 			strcpy(filename_tail, "stat");
+ 			n = read_to_buf(filename, buf);
+ 			if (n < 0)
+-				break;
++				continue; /* process probably exited */
+ 			cp = strrchr(buf, ')'); /* split into "PID (cmd" and "<rest>" */
+ 			/*if (!cp || cp[1] != ' ')
+-				break;*/
++				continue;*/
+ 			cp[0] = '\0';
+ 			if (sizeof(sp->comm) < 16)
+ 				BUG_comm_size();
+@@ -257,12 +259,12 @@ procps_status_t* FAST_FUNC procps_scan(p
+ 				"%lu "                 /* start_time */
+ 				"%lu "                 /* vsize */
+ 				"%lu "                 /* rss */
+-#if ENABLE_FEATURE_TOP_SMP_PROCESS
++# if ENABLE_FEATURE_TOP_SMP_PROCESS
+ 				"%*s %*s %*s %*s %*s %*s " /*rss_rlim, start_code, end_code, start_stack, kstk_esp, kstk_eip */
+ 				"%*s %*s %*s %*s "         /*signal, blocked, sigignore, sigcatch */
+ 				"%*s %*s %*s %*s "         /*wchan, nswap, cnswap, exit_signal */
+ 				"%d"                       /*cpu last seen on*/
+-#endif
++# endif
+ 				,
+ 				sp->state, &sp->ppid,
+ 				&sp->pgid, &sp->sid, &tty,
+@@ -271,17 +273,17 @@ procps_status_t* FAST_FUNC procps_scan(p
+ 				&sp->start_time,
+ 				&vsz,
+ 				&rss
+-#if ENABLE_FEATURE_TOP_SMP_PROCESS
++# if ENABLE_FEATURE_TOP_SMP_PROCESS
+ 				, &sp->last_seen_on_cpu
+-#endif
++# endif
+ 				);
+ 
+ 			if (n < 11)
+-				break;
+-#if ENABLE_FEATURE_TOP_SMP_PROCESS
++				continue; /* bogus data, get next /proc/XXX */
++# if ENABLE_FEATURE_TOP_SMP_PROCESS
+ 			if (n < 11+15)
+ 				sp->last_seen_on_cpu = 0;
+-#endif
++# endif
+ 
+ 			/* vsz is in bytes and we want kb */
+ 			sp->vsz = vsz >> 10;
+@@ -311,14 +313,14 @@ procps_status_t* FAST_FUNC procps_scan(p
+ 			sp->vsz = fast_strtoul_10(&cp) >> 10;
+ 			/* vsz is in bytes but rss is in *PAGES*! Can you believe that? */
+ 			sp->rss = fast_strtoul_10(&cp) << sp->shift_pages_to_kb;
+-#if ENABLE_FEATURE_TOP_SMP_PROCESS
++# if ENABLE_FEATURE_TOP_SMP_PROCESS
+ 			/* (6): rss_rlim, start_code, end_code, start_stack, kstk_esp, kstk_eip */
+ 			/* (4): signal, blocked, sigignore, sigcatch */
+ 			/* (4): wchan, nswap, cnswap, exit_signal */
+ 			cp = skip_fields(cp, 14);
+ //FIXME: is it safe to assume this field exists?
+ 			sp->last_seen_on_cpu = fast_strtoul_10(&cp);
+-#endif
++# endif
+ #endif /* end of !ENABLE_FEATURE_TOP_SMP_PROCESS */
+ 
+ #if ENABLE_FEATURE_PS_ADDITIONAL_COLUMNS
+@@ -343,48 +345,48 @@ procps_status_t* FAST_FUNC procps_scan(p
+ 
+ 			strcpy(filename_tail, "smaps");
+ 			file = fopen_for_read(filename);
+-			if (!file)
+-				break;
+-			while (fgets(buf, sizeof(buf), file)) {
+-				unsigned long sz;
+-				char *tp;
+-				char w;
++			if (file) {
++				while (fgets(buf, sizeof(buf), file)) {
++					unsigned long sz;
++					char *tp;
++					char w;
+ #define SCAN(str, name) \
+ 	if (strncmp(buf, str, sizeof(str)-1) == 0) { \
+ 		tp = skip_whitespace(buf + sizeof(str)-1); \
+ 		sp->name += fast_strtoul_10(&tp); \
+ 		continue; \
+ 	}
+-				SCAN("Shared_Clean:" , shared_clean );
+-				SCAN("Shared_Dirty:" , shared_dirty );
+-				SCAN("Private_Clean:", private_clean);
+-				SCAN("Private_Dirty:", private_dirty);
++					SCAN("Shared_Clean:" , shared_clean );
++					SCAN("Shared_Dirty:" , shared_dirty );
++					SCAN("Private_Clean:", private_clean);
++					SCAN("Private_Dirty:", private_dirty);
+ #undef SCAN
+-				// f7d29000-f7d39000 rw-s ADR M:m OFS FILE
+-				tp = strchr(buf, '-');
+-				if (tp) {
+-					*tp = ' ';
+-					tp = buf;
+-					sz = fast_strtoul_16(&tp); /* start */
+-					sz = (fast_strtoul_16(&tp) - sz) >> 10; /* end - start */
+-					// tp -> "rw-s" string
+-					w = tp[1];
+-					// skipping "rw-s ADR M:m OFS "
+-					tp = skip_whitespace(skip_fields(tp, 4));
+-					// filter out /dev/something (something != zero)
+-					if (strncmp(tp, "/dev/", 5) != 0 || strcmp(tp, "/dev/zero\n") == 0) {
+-						if (w == 'w') {
+-							sp->mapped_rw += sz;
+-						} else if (w == '-') {
+-							sp->mapped_ro += sz;
++					// f7d29000-f7d39000 rw-s ADR M:m OFS FILE
++					tp = strchr(buf, '-');
++					if (tp) {
++						*tp = ' ';
++						tp = buf;
++						sz = fast_strtoul_16(&tp); /* start */
++						sz = (fast_strtoul_16(&tp) - sz) >> 10; /* end - start */
++						// tp -> "rw-s" string
++						w = tp[1];
++						// skipping "rw-s ADR M:m OFS "
++						tp = skip_whitespace(skip_fields(tp, 4));
++						// filter out /dev/something (something != zero)
++						if (strncmp(tp, "/dev/", 5) != 0 || strcmp(tp, "/dev/zero\n") == 0) {
++							if (w == 'w') {
++								sp->mapped_rw += sz;
++							} else if (w == '-') {
++								sp->mapped_ro += sz;
++							}
+ 						}
+-					}
+ //else printf("DROPPING %s (%s)\n", buf, tp);
+-					if (strcmp(tp, "[stack]\n") == 0)
+-						sp->stack += sz;
++						if (strcmp(tp, "[stack]\n") == 0)
++							sp->stack += sz;
++					}
+ 				}
++				fclose(file);
+ 			}
+-			fclose(file);
+ 		}
+ #endif /* TOPMEM */
+ #if ENABLE_FEATURE_PS_ADDITIONAL_COLUMNS
+@@ -393,23 +395,34 @@ procps_status_t* FAST_FUNC procps_scan(p
+ 
+ 			strcpy(filename_tail, "status");
+ 			file = fopen_for_read(filename);
+-			if (!file)
+-				break;
+-			while (fgets(buf, sizeof(buf), file)) {
+-				char *tp;
++			if (file) {
++				while (fgets(buf, sizeof(buf), file)) {
++					char *tp;
+ #define SCAN_TWO(str, name, statement) \
+ 	if (strncmp(buf, str, sizeof(str)-1) == 0) { \
+ 		tp = skip_whitespace(buf + sizeof(str)-1); \
+ 		sscanf(tp, "%u", &sp->name); \
+ 		statement; \
+ 	}
+-				SCAN_TWO("Uid:", ruid, continue);
+-				SCAN_TWO("Gid:", rgid, break);
++					SCAN_TWO("Uid:", ruid, continue);
++					SCAN_TWO("Gid:", rgid, break);
+ #undef SCAN_TWO
++				}
++				fclose(file);
+ 			}
+-			fclose(file);
+ 		}
+ #endif /* PS_ADDITIONAL_COLUMNS */
++		if (flags & PSSCAN_EXE) {
++			strcpy(filename_tail, "exe");
++			free(sp->exe);
++			sp->exe = xmalloc_readlink(filename);
++		}
++		/* Note: if /proc/PID/cmdline is empty,
++		 * code below "breaks". Therefore it must be
++		 * the last code to parse /proc/PID/xxx data
++		 * (we used to have /proc/PID/exe parsing after it
++		 * and were getting stale sp->exe).
++		 */
+ #if 0 /* PSSCAN_CMD is not used */
+ 		if (flags & (PSSCAN_CMD|PSSCAN_ARGV0)) {
+ 			free(sp->argv0);
+@@ -452,13 +465,9 @@ procps_status_t* FAST_FUNC procps_scan(p
+ 			}
+ 		}
+ #endif
+-		if (flags & PSSCAN_EXE) {
+-			strcpy(filename_tail, "exe");
+-			free(sp->exe);
+-			sp->exe = xmalloc_readlink(filename);
+-		}
+ 		break;
+-	}
++	} /* for (;;) */
++
+ 	return sp;
+ }
+ 
diff --git a/package/busybox/busybox-1.15.1-sed.patch b/package/busybox/busybox-1.15.1-sed.patch
new file mode 100644
index 0000000..7042bf0
--- /dev/null
+++ b/package/busybox/busybox-1.15.1-sed.patch
@@ -0,0 +1,15 @@
+diff -urpN busybox-1.15.1/editors/sed.c busybox-1.15.1-sed/editors/sed.c
+--- busybox-1.15.1/editors/sed.c	2009-09-12 17:55:58.000000000 +0200
++++ busybox-1.15.1-sed/editors/sed.c	2009-09-22 03:01:59.000000000 +0200
+@@ -690,10 +690,8 @@ static int do_subst_command(sed_cmd_t *s
+ 		if (sed_cmd->which_match)
+ 			break;
+ 
+-		if (*line == '\0')
+-			break;
+ //maybe (G.regmatch[0].rm_eo ? REG_NOTBOL : 0) instead of unconditional REG_NOTBOL?
+-	} while (regexec(current_regex, line, 10, G.regmatch, REG_NOTBOL) != REG_NOMATCH);
++	} while (*line && regexec(current_regex, line, 10, G.regmatch, REG_NOTBOL) != REG_NOMATCH);
+ 
+ 	/* Copy rest of string into output pipeline */
+ 	while (1) {
-- 
1.6.3.3
