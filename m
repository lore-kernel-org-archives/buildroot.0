From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 15:32:17 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: bump 1.17.x stable
	version
Message-ID: <20101124143327.06AFB8DCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3ac0c241d561f930da7fbad9f39763afed901a2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                          |    2 +-
 .../busybox-1.17.3/busybox-1.17.3-dnsd.patch       |   12 --------
 .../busybox-1.17.3/busybox-1.17.3-iproute.patch    |   13 --------
 .../busybox/busybox-1.17.3/busybox-1.17.3-ls.patch |   30 --------------------
 .../busybox-1.17.3/busybox-1.17.3-sort.patch       |   12 --------
 .../busybox-1.17.3/busybox-1.17.3-unicode.patch    |   12 --------
 6 files changed, 1 insertions(+), 80 deletions(-)
 delete mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-dnsd.patch
 delete mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch
 delete mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch
 delete mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-sort.patch
 delete mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-unicode.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 784ad52..e53046e 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -45,7 +45,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.14.4"	if BR2_BUSYBOX_VERSION_1_14_X
 	default "1.15.3"	if BR2_BUSYBOX_VERSION_1_15_X
 	default "1.16.2"	if BR2_BUSYBOX_VERSION_1_16_X
-	default "1.17.3"	if BR2_BUSYBOX_VERSION_1_17_X
+	default "1.17.4"	if BR2_BUSYBOX_VERSION_1_17_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-dnsd.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-dnsd.patch
deleted file mode 100644
index b135c14..0000000
--- a/package/busybox/busybox-1.17.3/busybox-1.17.3-dnsd.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urpN busybox-1.17.3/networking/dnsd.c busybox-1.17.3-dnsd/networking/dnsd.c
---- busybox-1.17.3/networking/dnsd.c	2010-10-09 21:57:14.000000000 +0200
-+++ busybox-1.17.3-dnsd/networking/dnsd.c	2010-10-29 00:37:43.066043841 +0200
-@@ -388,7 +388,7 @@ static int process_packet(struct dns_ent
- 	query_len = strlen(query_string) + 1;
- 	/* may be unaligned! */
- 	unaligned_type_class = (void *)(query_string + query_len);
--	query_len += sizeof(unaligned_type_class);
-+	query_len += sizeof(*unaligned_type_class);
- 	/* where to append answer block */
- 	answb = (void *)(unaligned_type_class + 1);
- 
diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch
deleted file mode 100644
index 03c749f..0000000
--- a/package/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -urpN busybox-1.17.3/networking/libiproute/iproute.c busybox-1.17.3-iproute/networking/libiproute/iproute.c
---- busybox-1.17.3/networking/libiproute/iproute.c	2010-10-09 21:57:14.000000000 +0200
-+++ busybox-1.17.3-iproute/networking/libiproute/iproute.c	2010-11-04 09:13:06.307919550 +0100
-@@ -791,8 +791,8 @@ static int iproute_get(char **argv)
- 				}
- 				req.r.rtm_dst_len = addr.bitlen;
- 			}
--			argv++;
- 		}
-+		argv++;
- 	}
- 
- 	if (req.r.rtm_dst_len == 0) {
diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch
deleted file mode 100644
index 1c4f895..0000000
--- a/package/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-diff -urpN busybox-1.17.3/coreutils/ls.c busybox-1.17.3-ls/coreutils/ls.c
---- busybox-1.17.3/coreutils/ls.c	2010-10-09 21:57:13.000000000 +0200
-+++ busybox-1.17.3-ls/coreutils/ls.c	2010-11-06 00:26:48.467049575 +0100
-@@ -184,7 +184,7 @@ static const unsigned opt_flags[] = {
- 	LIST_INO,                   /* i */
- 	LIST_LONG | STYLE_LONG,     /* l - remember LS_DISP_HR in mask! */
- 	LIST_SHORT | STYLE_SINGLE,  /* 1 */
--	0,                          /* g (don't show group) - handled via OPT_g */
-+	0,                          /* g (don't show owner) - handled via OPT_g */
- 	LIST_ID_NUMERIC,            /* n */
- 	LIST_BLOCKS,                /* s */
- 	DISP_ROWS,                  /* x */
-@@ -621,7 +621,7 @@ static NOINLINE unsigned list_single(con
- 	if (all_fmt & LIST_ID_NAME) {
- 		if (option_mask32 & OPT_g) {
- 			column += printf("%-8.8s ",
--				get_cached_username(dn->dstat.st_uid));
-+				get_cached_groupname(dn->dstat.st_gid));
- 		} else {
- 			column += printf("%-8.8s %-8.8s ",
- 				get_cached_username(dn->dstat.st_uid),
-@@ -631,7 +631,7 @@ static NOINLINE unsigned list_single(con
- #endif
- 	if (all_fmt & LIST_ID_NUMERIC) {
- 		if (option_mask32 & OPT_g)
--			column += printf("%-8u ", (int) dn->dstat.st_uid);
-+			column += printf("%-8u ", (int) dn->dstat.st_gid);
- 		else
- 			column += printf("%-8u %-8u ",
- 					(int) dn->dstat.st_uid,
diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-sort.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-sort.patch
deleted file mode 100644
index ebc9bf9..0000000
--- a/package/busybox/busybox-1.17.3/busybox-1.17.3-sort.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urpN busybox-1.17.3/coreutils/sort.c busybox-1.17.3-sort/coreutils/sort.c
---- busybox-1.17.3/coreutils/sort.c	2010-10-09 21:57:13.000000000 +0200
-+++ busybox-1.17.3-sort/coreutils/sort.c	2010-10-20 15:17:35.320293543 +0200
-@@ -412,7 +412,7 @@ int sort_main(int argc UNUSED_PARAM, cha
- #if ENABLE_FEATURE_SORT_BIG
- 	/* Open output file _after_ we read all input ones */
- 	if (option_mask32 & FLAG_o)
--		xmove_fd(xopen3(str_o, O_WRONLY, 0666), STDOUT_FILENO);
-+		xmove_fd(xopen3(str_o, O_WRONLY|O_CREAT|O_TRUNC, 0666), STDOUT_FILENO);
- #endif
- 	flag = (option_mask32 & FLAG_z) ? '\0' : '\n';
- 	for (i = 0; i < linecount; i++)
diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-unicode.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-unicode.patch
deleted file mode 100644
index dc3b02e..0000000
--- a/package/busybox/busybox-1.17.3/busybox-1.17.3-unicode.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urpN busybox-1.17.3/libbb/unicode.c busybox-1.17.3-unicode/libbb/unicode.c
---- busybox-1.17.3/libbb/unicode.c	2010-10-09 21:58:13.000000000 +0200
-+++ busybox-1.17.3-unicode/libbb/unicode.c	2010-10-29 00:48:36.951494079 +0200
-@@ -1006,7 +1006,7 @@ static char* FAST_FUNC unicode_conv_to_p
- 			}
- 		}
- 		if (stats)
--			stats->byte_count = stats->unicode_count = (d - dst);
-+			stats->byte_count = stats->unicode_count = stats->unicode_width = (d - dst);
- 		return dst;
- 	}
- 
-- 
1.7.2.2
