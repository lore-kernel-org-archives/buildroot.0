From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  7 Jun 2008 00:46:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080607074602.A7DB43C5D5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-07 00:46:01 -0700 (Sat, 07 Jun 2008)
New Revision: 22254

Log:
busybox 1.10.x: bump version


Removed:
   trunk/buildroot/package/busybox/busybox-1.10.2-dnsd.patch
   trunk/buildroot/package/busybox/busybox-1.10.2-fuser.patch
   trunk/buildroot/package/busybox/busybox-1.10.2-hush.patch
   trunk/buildroot/package/busybox/busybox-1.10.2-ip.patch
   trunk/buildroot/package/busybox/busybox-1.10.2-mdev.patch
   trunk/buildroot/package/busybox/busybox-1.10.2-semicolon.patch
   trunk/buildroot/package/busybox/busybox-1.10.2-syslogd.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-06-07 05:19:31 UTC (rev 22253)
+++ trunk/buildroot/package/busybox/Config.in	2008-06-07 07:46:01 UTC (rev 22254)
@@ -50,7 +50,7 @@
 	default "1.7.5"		if BR2_BUSYBOX_VERSION_1_7_X
 	default "1.8.3"		if BR2_BUSYBOX_VERSION_1_8_X
 	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
-	default "1.10.2"	if BR2_BUSYBOX_VERSION_1_10_X
+	default "1.10.3"	if BR2_BUSYBOX_VERSION_1_10_X
 
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL

Deleted: trunk/buildroot/package/busybox/busybox-1.10.2-dnsd.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.2-dnsd.patch	2008-06-07 05:19:31 UTC (rev 22253)
+++ trunk/buildroot/package/busybox/busybox-1.10.2-dnsd.patch	2008-06-07 07:46:01 UTC (rev 22254)
@@ -1,87 +0,0 @@
---- busybox-1.10.2/libbb/udp_io.c	Sat Apr 19 05:50:33 2008
-+++ busybox-1.10.2-dnsd/libbb/udp_io.c	Thu May 22 19:40:32 2008
-@@ -36,11 +36,12 @@
- #else
- 	struct iovec iov[1];
- 	struct msghdr msg;
--	char cbuf[sizeof(struct in_pktinfo)
-+	union {
-+		char cmsg[CMSG_SPACE(sizeof(struct in_pktinfo))];
- #if ENABLE_FEATURE_IPV6 && defined(IPV6_PKTINFO)
--		| sizeof(struct in6_pktinfo) /* (a|b) is poor man's max(a,b) */
-+		char cmsg6[CMSG_SPACE(sizeof(struct in6_pktinfo))];
- #endif
--	];
-+	} u;
- 	struct cmsghdr* cmsgptr;
- 
- 	if (from->sa_family != AF_INET
-@@ -57,15 +58,15 @@
- 	iov[0].iov_base = buf;
- 	iov[0].iov_len = len;
- 
--	memset(cbuf, 0, sizeof(cbuf));
-+	memset(&u, 0, sizeof(u));
- 
- 	memset(&msg, 0, sizeof(msg));
- 	msg.msg_name = (void *)(struct sockaddr *)to; /* or compiler will annoy us */
- 	msg.msg_namelen = tolen;
- 	msg.msg_iov = iov;
- 	msg.msg_iovlen = 1;
--	msg.msg_control = cbuf;
--	msg.msg_controllen = sizeof(cbuf);
-+	msg.msg_control = &u;
-+	msg.msg_controllen = sizeof(u);
- 	msg.msg_flags = flags;
- 
- 	cmsgptr = CMSG_FIRSTHDR(&msg);
-@@ -89,6 +90,8 @@
- 		pktptr->ipi6_addr = ((struct sockaddr_in6*)from)->sin6_addr;
- 	}
- #endif
-+	msg.msg_controllen = cmsgptr->cmsg_len;
-+
- 	return sendmsg(fd, &msg, flags);
- #endif
- }
-@@ -109,7 +112,9 @@
- 	struct iovec iov[1];
- 	union {
- 		char cmsg[CMSG_SPACE(sizeof(struct in_pktinfo))];
-+#if ENABLE_FEATURE_IPV6 && defined(IPV6_PKTINFO)
- 		char cmsg6[CMSG_SPACE(sizeof(struct in6_pktinfo))];
-+#endif
- 	} u;
- 	struct cmsghdr *cmsgptr;
- 	struct msghdr msg;
---- busybox-1.10.2/networking/dnsd.c	Sat Apr 19 05:50:27 2008
-+++ busybox-1.10.2-dnsd/networking/dnsd.c	Thu May 22 19:40:32 2008
-@@ -194,7 +194,8 @@
- 			for (i = 1; i <= (int)(d->name[0]); i++)
- 				if (tolower(qs[i]) != d->name[i])
- 					break;
--			if (i > (int)(d->name[0])) {
-+			if (i > (int)(d->name[0]) ||
-+			    (d->name[0] == 1 && d->name[1] == '*')) {
- 				strcpy((char *)as, d->ip);
- #if DEBUG
- 				fprintf(stderr, " OK as:%s\n", as);
-@@ -202,7 +203,8 @@
- 				return 0;
- 			}
- 		} else if (type == REQ_PTR) { /* search by IP-address */
--			if (!strncmp((char*)&d->rip[1], (char*)&qs[1], strlen(d->rip)-1)) {
-+			if ((d->name[0] != 1 || d->name[1] != '*') &&
-+			    !strncmp((char*)&d->rip[1], (char*)&qs[1], strlen(d->rip)-1)) {
- 				strcpy((char *)as, d->name);
- 				return 0;
- 			}
-@@ -401,7 +403,7 @@
- 		r = process_packet(buf);
- 		if (r <= 0)
- 			continue;
--		send_to_from(udps, buf, r, 0, &to->u.sa, &from->u.sa, lsa->len);
-+		send_to_from(udps, buf, r, 0, &from->u.sa, &to->u.sa, lsa->len);
- 	}
- 	return 0;
- }

Deleted: trunk/buildroot/package/busybox/busybox-1.10.2-fuser.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.2-fuser.patch	2008-06-07 05:19:31 UTC (rev 22253)
+++ trunk/buildroot/package/busybox/busybox-1.10.2-fuser.patch	2008-06-07 07:46:01 UTC (rev 22254)
@@ -1,29 +0,0 @@
---- busybox-1.10.2/procps/fuser.c	Sat Apr 19 06:03:13 2008
-+++ busybox-1.10.2-fuser/procps/fuser.c	Wed May 28 16:53:35 2008
-@@ -208,6 +208,7 @@
- 	return plist;
- }
- 
-+/* NB: does chdir internally */
- static pid_list *scan_proc_pids(inode_list *ilist)
- {
- 	DIR *d;
-@@ -215,7 +216,8 @@
- 	pid_t pid;
- 	pid_list *plist;
- 
--	d = opendir(".");
-+	xchdir("/proc");
-+	d = opendir("/proc");
- 	if (!d)
- 		return NULL;
- 
-@@ -329,7 +331,7 @@
- 		pp++;
- 	}
- 
--	plist = scan_proc_pids(ilist);
-+	plist = scan_proc_pids(ilist); /* changes dir to "/proc" */
- 
- 	if (!plist)
- 		return EXIT_FAILURE;

Deleted: trunk/buildroot/package/busybox/busybox-1.10.2-hush.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.2-hush.patch	2008-06-07 05:19:31 UTC (rev 22253)
+++ trunk/buildroot/package/busybox/busybox-1.10.2-hush.patch	2008-06-07 07:46:01 UTC (rev 22254)
@@ -1,57 +0,0 @@
---- busybox-1.10.2/shell/hush.c	Sat Apr 19 05:50:31 2008
-+++ busybox-1.10.2-hush/shell/hush.c	Mon May 26 00:32:40 2008
-@@ -699,9 +699,18 @@
- 	BLTIN(NULL, NULL, NULL)
- };
- 
-+/* Signals are grouped, we handle them in batches */
-+static void set_misc_sighandler(void (*handler)(int))
-+{
-+	bb_signals(0
-+		+ (1 << SIGINT)
-+		+ (1 << SIGQUIT)
-+		+ (1 << SIGTERM)
-+		, handler);
-+}
-+
- #if ENABLE_HUSH_JOB
- 
--/* Signals are grouped, we handle them in batches */
- static void set_fatal_sighandler(void (*handler)(int))
- {
- 	bb_signals(0
-@@ -725,14 +734,6 @@
- 		+ (1 << SIGTTOU)
- 		, handler);
- }
--static void set_misc_sighandler(void (*handler)(int))
--{
--	bb_signals(0
--		+ (1 << SIGINT)
--		+ (1 << SIGQUIT)
--		+ (1 << SIGTERM)
--		, handler);
--}
- /* SIGCHLD is special and handled separately */
- 
- static void set_every_sighandler(void (*handler)(int))
-@@ -815,7 +816,6 @@
- 
- #define set_fatal_sighandler(handler)   ((void)0)
- #define set_jobctrl_sighandler(handler) ((void)0)
--#define set_misc_sighandler(handler)    ((void)0)
- #define hush_exit(e)                    exit(e)
- 
- #endif /* JOB */
-@@ -3907,8 +3907,10 @@
- 				/* give up */
- 				interactive_fd = 0;
- 		}
--		if (interactive_fd)
-+		if (interactive_fd) {
- 			fcntl(interactive_fd, F_SETFD, FD_CLOEXEC);
-+			set_misc_sighandler(SIG_IGN);
-+		}
- 	}
- #endif
- 

Deleted: trunk/buildroot/package/busybox/busybox-1.10.2-ip.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.2-ip.patch	2008-06-07 05:19:31 UTC (rev 22253)
+++ trunk/buildroot/package/busybox/busybox-1.10.2-ip.patch	2008-06-07 07:46:01 UTC (rev 22254)
@@ -1,11 +0,0 @@
---- busybox-1.10.2/networking/libiproute/ip_parse_common_args.c	Sat Apr 19 05:50:26 2008
-+++ busybox-1.10.2-ip/networking/libiproute/ip_parse_common_args.c	Sat May 31 09:32:09 2008
-@@ -54,7 +54,7 @@
- 				break;
- 			}
- 		}
--		arg = index_in_strings(ip_common_commands, opt);
-+		arg = index_in_substrings(ip_common_commands, opt);
- 		if (arg < 0)
- 			bb_show_usage();
- 		if (arg == ARG_oneline) {

Deleted: trunk/buildroot/package/busybox/busybox-1.10.2-mdev.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.2-mdev.patch	2008-06-07 05:19:31 UTC (rev 22253)
+++ trunk/buildroot/package/busybox/busybox-1.10.2-mdev.patch	2008-06-07 07:46:01 UTC (rev 22254)
@@ -1,31 +0,0 @@
---- busybox-1.10.2/util-linux/mdev.c	Thu May  8 17:22:48 2008
-+++ busybox-1.10.2-mdev/util-linux/mdev.c	Sat May 24 18:43:40 2008
-@@ -72,8 +72,14 @@
- 	/* Determine device name, type, major and minor */
- 	device_name = bb_basename(path);
- 	/* http://kernel.org/doc/pending/hotplug.txt says that only
--	 * "/sys/block/..." is for block devices. "sys/bus" etc is not! */
--	type = (strncmp(&path[5], "block/", 6) == 0 ? S_IFBLK : S_IFCHR);
-+	 * "/sys/block/..." is for block devices. "/sys/bus" etc is not!
-+	 * Since kernel 2.6.25 block devices are also in /sys/class/block. */
-+	/* TODO: would it be acceptable to just use strstr(path, "/block/")? */
-+	if (strncmp(&path[5], "class/block/"+6, 6) != 0
-+	 && strncmp(&path[5], "class/block/", 12) != 0)
-+	        type = S_IFCHR;
-+	else
-+	        type = S_IFBLK;
- 
- 	if (ENABLE_FEATURE_MDEV_CONF) {
- 		FILE *fp;
-@@ -172,8 +178,9 @@
- 					/* substitute %1..9 with off[1..9], if any */
- 					n = 0;
- 					s = val;
--					while (*s && *s++ == '%')
--						n++;
-+					while (*s)
-+						if (*s++ == '%')
-+							n++;
- 
- 					p = alias = xzalloc(strlen(val) + n * strlen(device_name));
- 					s = val + 1;

Deleted: trunk/buildroot/package/busybox/busybox-1.10.2-semicolon.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.2-semicolon.patch	2008-06-07 05:19:31 UTC (rev 22253)
+++ trunk/buildroot/package/busybox/busybox-1.10.2-semicolon.patch	2008-06-07 07:46:01 UTC (rev 22254)
@@ -1,22 +0,0 @@
---- busybox-1.10.2/networking/interface.c	Sat Apr 19 05:50:27 2008
-+++ busybox-1.10.2-semicolon/networking/interface.c	Thu May 15 21:40:04 2008
-@@ -223,7 +223,7 @@
- 	char *pos;
- 	unsigned int i;
- 
--	if (!buff);
-+	if (!buff)
- 		buff = xmalloc(sizeof(struct sockaddr) * 3 + 1);
- 	pos = buff;
- 	for (i = 0; i < sizeof(struct sockaddr); i++) {
---- busybox-1.10.2/networking/isrv_identd.c	Sat Apr 19 05:50:27 2008
-+++ busybox-1.10.2-semicolon/networking/isrv_identd.c	Thu May 15 21:40:04 2008
-@@ -113,7 +113,7 @@
- 		strncpy(bogouser, argv[optind], sizeof(bogouser));
- 
- 	/* Daemonize if no -f and no -i and no -w */
--	if (!(opt & OPT_fiw));
-+	if (!(opt & OPT_fiw))
- 		bb_daemonize_or_rexec(0, argv);
- 
- 	/* Where to log in inetd modes? "Classic" inetd

Deleted: trunk/buildroot/package/busybox/busybox-1.10.2-syslogd.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.2-syslogd.patch	2008-06-07 05:19:31 UTC (rev 22253)
+++ trunk/buildroot/package/busybox/busybox-1.10.2-syslogd.patch	2008-06-07 07:46:01 UTC (rev 22254)
@@ -1,16 +0,0 @@
---- busybox-1.10.2/sysklogd/syslogd.c	Sat Apr 19 05:50:29 2008
-+++ busybox-1.10.2-syslogd/sysklogd/syslogd.c	Sat May 24 23:02:56 2008
-@@ -347,10 +347,11 @@
- 				sprintf(newFile, "%s.%d", G.logFilePath, i);
- 				if (i == 0) break;
- 				sprintf(oldFile, "%s.%d", G.logFilePath, --i);
--				xrename(oldFile, newFile);
-+				/* ignore errors - file might be missing */
-+				rename(oldFile, newFile);
- 			}
- 			/* newFile == "f.0" now */
--			xrename(G.logFilePath, newFile);
-+			rename(G.logFilePath, newFile);
- 			fl.l_type = F_UNLCK;
- 			fcntl(G.logFD, F_SETLKW, &fl);
- 			close(G.logFD);
