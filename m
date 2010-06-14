From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jun 2010 09:47:49 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: bump 1.16.x version
Message-ID: <20100614074913.6565B803F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6ed87eac98833db52fc76abbee70809a6adeafbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                      |    7 +-
 package/busybox/Config.in                    |    2 +-
 package/busybox/busybox-1.16.1-ash.patch     |   15 ---
 package/busybox/busybox-1.16.1-cpio.patch    |   51 ---------
 package/busybox/busybox-1.16.1-dhcpd.patch   |   12 --
 package/busybox/busybox-1.16.1-dnsd.patch    |   48 --------
 package/busybox/busybox-1.16.1-hwclock.patch |  152 --------------------------
 package/busybox/busybox-1.16.1-sed.patch     |   89 ---------------
 8 files changed, 5 insertions(+), 371 deletions(-)
 delete mode 100644 package/busybox/busybox-1.16.1-ash.patch
 delete mode 100644 package/busybox/busybox-1.16.1-cpio.patch
 delete mode 100644 package/busybox/busybox-1.16.1-dhcpd.patch
 delete mode 100644 package/busybox/busybox-1.16.1-dnsd.patch
 delete mode 100644 package/busybox/busybox-1.16.1-hwclock.patch
 delete mode 100644 package/busybox/busybox-1.16.1-sed.patch

diff --git a/CHANGES b/CHANGES
index a7fb6b3..bd35ac5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,9 +7,10 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, file, gawk, gstreamer, intltool,
-	ipsec-tools, iptables, libidn, lmbench, netperf, openssl, php,
-	qt, sqlite, tn5250, usbutils, xkeyboard-config
+	Updated/fixed packages: busybox, cdrkit, file, gawk,
+	gstreamer, intltool, ipsec-tools, iptables, libidn, lmbench,
+	netperf, openssl, php, qt, sqlite, tn5250, usbutils,
+	xkeyboard-config
 
 	Removed packages: modutils
 
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 68abf16..9e957e1 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -45,7 +45,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.13.4"	if BR2_BUSYBOX_VERSION_1_13_X
 	default "1.14.4"	if BR2_BUSYBOX_VERSION_1_14_X
 	default "1.15.3"	if BR2_BUSYBOX_VERSION_1_15_X
-	default "1.16.1"	if BR2_BUSYBOX_VERSION_1_16_X
+	default "1.16.2"	if BR2_BUSYBOX_VERSION_1_16_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
diff --git a/package/busybox/busybox-1.16.1-ash.patch b/package/busybox/busybox-1.16.1-ash.patch
deleted file mode 100644
index 629874e..0000000
--- a/package/busybox/busybox-1.16.1-ash.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff -urpN busybox-1.16.1/shell/ash.c busybox-1.16.1-ash/shell/ash.c
---- busybox-1.16.1/shell/ash.c	2010-03-28 19:44:04.000000000 +0200
-+++ busybox-1.16.1-ash/shell/ash.c	2010-04-26 14:18:36.000000000 +0200
-@@ -5424,7 +5424,11 @@ rmescapes(char *str, int flag)
- 		size_t fulllen = len + strlen(p) + 1;
- 
- 		if (flag & RMESCAPE_GROW) {
-+			int strloc = str - (char *)stackblock();
- 			r = makestrspace(fulllen, expdest);
-+			/* p and str may be invalidated by makestrspace */
-+			str = (char *)stackblock() + strloc;
-+			p = str + len;
- 		} else if (flag & RMESCAPE_HEAP) {
- 			r = ckmalloc(fulllen);
- 		} else {
diff --git a/package/busybox/busybox-1.16.1-cpio.patch b/package/busybox/busybox-1.16.1-cpio.patch
deleted file mode 100644
index e8282bd..0000000
--- a/package/busybox/busybox-1.16.1-cpio.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-diff -urpN busybox-1.16.1/archival/cpio.c busybox-1.16.1-cpio/archival/cpio.c
---- busybox-1.16.1/archival/cpio.c	2010-03-20 03:58:07.000000000 +0100
-+++ busybox-1.16.1-cpio/archival/cpio.c	2010-04-27 08:15:37.000000000 +0200
-@@ -424,7 +424,7 @@ int cpio_main(int argc UNUSED_PARAM, cha
- 	if (archive_handle->cpio__blocks != (off_t)-1
- 	 && !(opt & CPIO_OPT_QUIET)
- 	) {
--		printf("%"OFF_FMT"u blocks\n", archive_handle->cpio__blocks);
-+		fprintf(stderr, "%"OFF_FMT"u blocks\n", archive_handle->cpio__blocks);
- 	}
- 
- 	return EXIT_SUCCESS;
-diff -urpN busybox-1.16.1/testsuite/cpio.tests busybox-1.16.1-cpio/testsuite/cpio.tests
---- busybox-1.16.1/testsuite/cpio.tests	2010-03-28 19:59:59.000000000 +0200
-+++ busybox-1.16.1-cpio/testsuite/cpio.tests	2010-04-27 08:15:37.000000000 +0200
-@@ -32,7 +32,7 @@ rm -rf cpio.testdir cpio.testdir2 2>/dev
- # testing "test name" "command" "expected result" "file input" "stdin"
- 
- testing "cpio extracts zero-sized hardlinks" \
--"$ECHO -ne '$hexdump' | bzcat | cpio -i; echo \$?;
-+"$ECHO -ne '$hexdump' | bzcat | cpio -i 2>&1; echo \$?;
- ls -ln cpio.testdir | $FILTER_LS" \
- "\
- 1 blocks
-@@ -45,7 +45,7 @@ ls -ln cpio.testdir | $FILTER_LS" \
- 
- test x"$SKIP_KNOWN_BUGS" = x"" && {
- # Currently fails. Numerous buglets: "1 blocks" versus "1 block",
--# "1 block" must go to stderr, does not list cpio.testdir/x and cpio.testdir/y
-+# does not list cpio.testdir/x and cpio.testdir/y
- testing "cpio lists hardlinks" \
- "$ECHO -ne '$hexdump' | bzcat | cpio -t 2>&1; echo \$?" \
- "\
-@@ -70,7 +70,7 @@ ln cpio.testdir/nonempty cpio.testdir/no
- mkdir cpio.testdir2
- 
- testing "cpio extracts zero-sized hardlinks 2" \
--"find cpio.testdir | cpio -H newc --create | (cd cpio.testdir2 && cpio -i); echo \$?;
-+"find cpio.testdir | cpio -H newc --create | (cd cpio.testdir2 && cpio -i 2>&1); echo \$?;
- ls -ln cpio.testdir2/cpio.testdir | $FILTER_LS" \
- "\
- 2 blocks
-@@ -87,7 +87,7 @@ ls -ln cpio.testdir2/cpio.testdir | $FIL
- # Was trying to create "/usr/bin", correct is "usr/bin".
- rm -rf cpio.testdir
- testing "cpio -p with absolute paths" \
--"echo /usr/bin | cpio -dp cpio.testdir; echo \$?;
-+"echo /usr/bin | cpio -dp cpio.testdir 2>&1; echo \$?;
- ls cpio.testdir" \
- "\
- 1 blocks
diff --git a/package/busybox/busybox-1.16.1-dhcpd.patch b/package/busybox/busybox-1.16.1-dhcpd.patch
deleted file mode 100644
index 6867e24..0000000
--- a/package/busybox/busybox-1.16.1-dhcpd.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urpN busybox-1.16.1/networking/udhcp/leases.c busybox-1.16.1-dhcpd/networking/udhcp/leases.c
---- busybox-1.16.1/networking/udhcp/leases.c	2010-03-28 19:43:36.000000000 +0200
-+++ busybox-1.16.1-dhcpd/networking/udhcp/leases.c	2010-05-15 20:47:08.000000000 +0200
-@@ -64,6 +64,8 @@ struct dyn_lease* FAST_FUNC add_lease(
- 		oldest->hostname[0] = '\0';
- 		if (hostname) {
- 			char *p;
-+
-+			hostname_len++; /* include NUL */
- 			if (hostname_len > sizeof(oldest->hostname))
- 				hostname_len = sizeof(oldest->hostname);
- 			p = safe_strncpy(oldest->hostname, hostname, hostname_len);
diff --git a/package/busybox/busybox-1.16.1-dnsd.patch b/package/busybox/busybox-1.16.1-dnsd.patch
deleted file mode 100644
index bbcd116..0000000
--- a/package/busybox/busybox-1.16.1-dnsd.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-diff -urpN busybox-1.16.1/include/platform.h busybox-1.16.1-dnsd/include/platform.h
---- busybox-1.16.1/include/platform.h	2010-03-28 19:43:35.000000000 +0200
-+++ busybox-1.16.1-dnsd/include/platform.h	2010-04-14 19:06:10.000000000 +0200
-@@ -291,10 +291,12 @@ typedef unsigned smalluint;
- #if 1 /* if needed: !defined(arch1) && !defined(arch2) */
- # define ALIGN1 __attribute__((aligned(1)))
- # define ALIGN2 __attribute__((aligned(2)))
-+# define ALIGN4 __attribute__((aligned(4)))
- #else
- /* Arches which MUST have 2 or 4 byte alignment for everything are here */
- # define ALIGN1
- # define ALIGN2
-+# define ALIGN4
- #endif
- 
- 
-diff -urpN busybox-1.16.1/networking/dnsd.c busybox-1.16.1-dnsd/networking/dnsd.c
---- busybox-1.16.1/networking/dnsd.c	2010-03-28 19:43:36.000000000 +0200
-+++ busybox-1.16.1-dnsd/networking/dnsd.c	2010-04-26 14:20:25.000000000 +0200
-@@ -44,10 +44,15 @@ struct dns_head {
- 	uint16_t nauth;
- 	uint16_t nadd;
- };
-+/* Structure used to access type and class fields.
-+ * They are totally unaligned, but gcc 4.3.4 thinks that pointer of type uint16_t*
-+ * is 16-bit aligned and replaces 16-bit memcpy (in move_from_unaligned16 macro)
-+ * with aligned halfword access on arm920t!
-+ * Oh well. Slapping PACKED everywhere seems to help: */
- struct dns_prop {
--	uint16_t type;
--	uint16_t class;
--};
-+	uint16_t type PACKED;
-+	uint16_t class PACKED;
-+} PACKED;
- /* element of known name, ip address and reversed ip address */
- struct dns_entry {
- 	struct dns_entry *next;
-@@ -459,7 +464,8 @@ int dnsd_main(int argc UNUSED_PARAM, cha
- 	unsigned lsa_size;
- 	int udps, opts;
- 	uint16_t port = 53;
--	uint8_t buf[MAX_PACK_LEN + 1];
-+	/* Ensure buf is 32bit aligned (we need 16bit, but 32bit can't hurt) */
-+	uint8_t buf[MAX_PACK_LEN + 1] ALIGN4;
- 
- 	opts = getopt32(argv, "vi:c:t:p:d", &listen_interface, &fileconf, &sttl, &sport);
- 	//if (opts & 0x1) // -v
diff --git a/package/busybox/busybox-1.16.1-hwclock.patch b/package/busybox/busybox-1.16.1-hwclock.patch
deleted file mode 100644
index 63350ae..0000000
--- a/package/busybox/busybox-1.16.1-hwclock.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-diff -urpN busybox-1.16.1/util-linux/hwclock.c busybox-1.16.1-hwclock/util-linux/hwclock.c
---- busybox-1.16.1/util-linux/hwclock.c	2010-03-19 19:58:07.000000000 -0700
-+++ busybox-1.16.1-hwclock/util-linux/hwclock.c	2010-04-14 09:29:37.889208237 -0700
-@@ -109,10 +109,53 @@ static void to_sys_clock(const char **pp
- 
- static void from_sys_clock(const char **pp_rtcname, int utc)
- {
--#define TWEAK_USEC 200
--	struct tm tm_time;
-+#if 1
- 	struct timeval tv;
-+	struct tm tm_time;
-+	int rtc;
-+
-+	rtc = rtc_xopen(pp_rtcname, O_WRONLY);
-+	gettimeofday(&tv, NULL);
-+	/* Prepare tm_time */
-+	if (sizeof(time_t) == sizeof(tv.tv_sec)) {
-+		if (utc)
-+			gmtime_r((time_t*)&tv.tv_sec, &tm_time);
-+		else
-+			localtime_r((time_t*)&tv.tv_sec, &tm_time);
-+	} else {
-+		time_t t = tv.tv_sec;
-+		if (utc)
-+			gmtime_r(&t, &tm_time);
-+		else
-+			localtime_r(&t, &tm_time);
-+	}
-+#else
-+/* Bloated code which tries to set hw clock with better precision.
-+ * On x86, even though code does set hw clock within <1ms of exact
-+ * whole seconds, apparently hw clock (at least on some machines)
-+ * doesn't reset internal fractional seconds to 0,
-+ * making all this a pointless excercise.
-+ */
-+	/* If we see that we are N usec away from whole second,
-+	 * we'll sleep for N-ADJ usecs. ADJ corrects for the fact
-+	 * that CPU is not infinitely fast.
-+	 * On infinitely fast CPU, next wakeup would be
-+	 * on (exactly_next_whole_second - ADJ). On real CPUs,
-+	 * this difference between current time and whole second
-+	 * is less than ADJ (assuming system isn't heavily loaded).
-+	 */
-+	/* Small value of 256us gives very precise sync for 2+ GHz CPUs.
-+	 * Slower CPUs will fail to sync and will go to bigger
-+	 * ADJ values. qemu-emulated armv4tl with ~100 MHz
-+	 * performance ends up using ADJ ~= 4*1024 and it takes
-+	 * 2+ secs (2 tries with successively larger ADJ)
-+	 * to sync. Even straced one on the same qemu (very slow)
-+	 * takes only 4 tries.
-+	 */
-+#define TWEAK_USEC 256
- 	unsigned adj = TWEAK_USEC;
-+	struct tm tm_time;
-+	struct timeval tv;
- 	int rtc = rtc_xopen(pp_rtcname, O_WRONLY);
- 
- 	/* Try to catch the moment when whole second is close */
-@@ -124,55 +167,64 @@ static void from_sys_clock(const char **
- 
- 		t = tv.tv_sec;
- 		rem_usec = 1000000 - tv.tv_usec;
--		if (rem_usec < 1024) {
--			/* Less than 1ms to next second. Good enough */
-+		if (rem_usec < adj) {
-+			/* Close enough */
-  small_rem:
- 			t++;
- 		}
- 
--		/* Prepare tm */
-+		/* Prepare tm_time from t */
- 		if (utc)
- 			gmtime_r(&t, &tm_time); /* may read /etc/xxx (it takes time) */
- 		else
- 			localtime_r(&t, &tm_time); /* same */
--		tm_time.tm_isdst = 0;
-+
-+		if (adj >= 32*1024) {
-+			break; /* 32 ms diff and still no luck?? give up trying to sync */
-+		}
- 
- 		/* gmtime/localtime took some time, re-get cur time */
- 		gettimeofday(&tv, NULL);
- 
--		if (tv.tv_sec < t /* may happen if rem_usec was < 1024 */
--		 || (tv.tv_sec == t && tv.tv_usec < 1024)
-+		if (tv.tv_sec < t /* we are still in old second */
-+		 || (tv.tv_sec == t && tv.tv_usec < adj) /* not too far into next second */
- 		) {
--			/* We are not too far into next second. Good. */
--			break;
--		}
--		adj += 32; /* 2^(10-5) = 2^5 = 32 iterations max */
--		if (adj >= 1024) {
--			/* Give up trying to sync */
--			break;
-+			break; /* good, we are in sync! */
- 		}
- 
--		/* Try to sync up by sleeping */
- 		rem_usec = 1000000 - tv.tv_usec;
--		if (rem_usec < 1024) {
--			goto small_rem; /* already close, don't sleep */
-+		if (rem_usec < adj) {
-+			t = tv.tv_sec;
-+			goto small_rem; /* already close to next sec, don't sleep */
- 		}
--		/* Need to sleep.
--		 * Note that small adj on slow processors can make us
--		 * to always overshoot tv.tv_usec < 1024 check on next
--		 * iteration. That's why adj is increased on each iteration.
--		 * This also allows it to be reused as a loop limiter.
--		 */
--		usleep(rem_usec - adj);
--	}
- 
--	xioctl(rtc, RTC_SET_TIME, &tm_time);
-+		/* Try to sync up by sleeping */
-+		usleep(rem_usec - adj);
- 
--	/* Debug aid to find "good" TWEAK_USEC.
-+		/* Jump to 1ms diff, then increase fast (x2): EVERY loop
-+		 * takes ~1 sec, people won't like slowly converging code here!
-+		 */
-+	//bb_error_msg("adj:%d tv.tv_usec:%d", adj, (int)tv.tv_usec);
-+		if (adj < 512)
-+			adj = 512;
-+		/* ... and if last "overshoot" does not look insanely big,
-+		 * just use it as adj increment. This makes convergence faster.
-+		 */
-+		if (tv.tv_usec < adj * 8) {
-+			adj += tv.tv_usec;
-+			continue;
-+		}
-+		adj *= 2;
-+	}
-+	/* Debug aid to find "optimal" TWEAK_USEC with nearly exact sync.
- 	 * Look for a value which makes tv_usec close to 999999 or 0.
--	 * for 2.20GHz Intel Core 2: TWEAK_USEC ~= 200
-+	 * For 2.20GHz Intel Core 2: optimal TWEAK_USEC ~= 200
- 	 */
--	//bb_error_msg("tv.tv_usec:%d adj:%d", (int)tv.tv_usec, adj);
-+	//bb_error_msg("tv.tv_usec:%d", (int)tv.tv_usec);
-+#endif
-+
-+	tm_time.tm_isdst = 0;
-+	xioctl(rtc, RTC_SET_TIME, &tm_time);
- 
- 	if (ENABLE_FEATURE_CLEAN_UP)
- 		close(rtc);
diff --git a/package/busybox/busybox-1.16.1-sed.patch b/package/busybox/busybox-1.16.1-sed.patch
deleted file mode 100644
index 0376cc9..0000000
--- a/package/busybox/busybox-1.16.1-sed.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-diff -urpN busybox-1.16.1/editors/sed.c busybox-1.16.1-sed/editors/sed.c
---- busybox-1.16.1/editors/sed.c	2010-03-28 19:43:35.000000000 +0200
-+++ busybox-1.16.1-sed/editors/sed.c	2010-05-12 01:46:57.000000000 +0200
-@@ -487,7 +487,7 @@ static const char *parse_cmd_args(sed_cm
- static void add_cmd(const char *cmdstr)
- {
- 	sed_cmd_t *sed_cmd;
--	int temp;
-+	unsigned len, n;
- 
- 	/* Append this line to any unfinished line from last time. */
- 	if (G.add_cmd_line) {
-@@ -496,12 +496,14 @@ static void add_cmd(const char *cmdstr)
- 		cmdstr = G.add_cmd_line = tp;
- 	}
- 
--	/* If this line ends with backslash, request next line. */
--	temp = strlen(cmdstr);
--	if (temp && cmdstr[--temp] == '\\') {
-+	/* If this line ends with unescaped backslash, request next line. */
-+	n = len = strlen(cmdstr);
-+	while (n && cmdstr[n-1] == '\\')
-+		n--;
-+	if ((len - n) & 1) { /* if odd number of trailing backslashes */
- 		if (!G.add_cmd_line)
- 			G.add_cmd_line = xstrdup(cmdstr);
--		G.add_cmd_line[temp] = '\0';
-+		G.add_cmd_line[len-1] = '\0';
- 		return;
- 	}
- 
-@@ -936,7 +938,15 @@ static void process_files(void)
- 		/* Skip blocks of commands we didn't match */
- 		if (sed_cmd->cmd == '{') {
- 			if (sed_cmd->invert ? matched : !matched) {
--				while (sed_cmd->cmd != '}') {
-+				unsigned nest_cnt = 0;
-+				while (1) {
-+					if (sed_cmd->cmd == '{')
-+						nest_cnt++;
-+					if (sed_cmd->cmd == '}') {
-+						nest_cnt--;
-+						if (nest_cnt == 0)
-+							break;
-+					}
- 					sed_cmd = sed_cmd->next;
- 					if (!sed_cmd)
- 						bb_error_msg_and_die("unterminated {");
-@@ -1031,7 +1041,7 @@ static void process_files(void)
- 		case 'c':
- 			/* Only triggers on last line of a matching range. */
- 			if (!sed_cmd->in_match)
--				sed_puts(sed_cmd->string, NO_EOL_CHAR);
-+				sed_puts(sed_cmd->string, '\n');
- 			goto discard_line;
- 
- 		/* Read file, append contents to output */
-diff -urpN busybox-1.16.1/testsuite/sed.tests busybox-1.16.1-sed/testsuite/sed.tests
---- busybox-1.16.1/testsuite/sed.tests	2010-03-20 03:58:07.000000000 +0100
-+++ busybox-1.16.1-sed/testsuite/sed.tests	2010-05-12 01:46:57.000000000 +0200
-@@ -248,4 +248,28 @@ testing "sed beginning (^) matches only 
- 	">/usr</>lib<\n" "" \
- 	"/usr/lib\n"
- 
-+testing "sed c" \
-+	"sed 'crepl'" \
-+	"repl\nrepl\n" "" \
-+	"first\nsecond\n"
-+
-+testing "sed nested {}s" \
-+	"sed '/asd/ { p; /s/ { s/s/c/ }; p; q }'" \
-+	"qwe\nasd\nacd\nacd\n" "" \
-+	"qwe\nasd\nzxc\n"
-+
-+testing "sed a cmd ended by double backslash" \
-+	"sed -e '/| one /a \\
-+	| three \\\\' -e '/| one-/a \\
-+	| three-* \\\\'" \
-+'	| one \\
-+	| three \\
-+	| two \\
-+' '' \
-+'	| one \\
-+	| two \\
-+'
-+
-+# testing "description" "arguments" "result" "infile" "stdin"
-+
- exit $FAILCOUNT
-- 
1.7.1
