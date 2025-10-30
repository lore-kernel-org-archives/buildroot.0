Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73193CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 19:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CA34156A;
	Thu, 30 Oct 2025 19:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQZO6SLoa0_W; Thu, 30 Oct 2025 19:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1FB94156E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1FB94156E;
	Thu, 30 Oct 2025 19:54:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B01A0160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FA4640D90
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUdkDM9rD-y9 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 19:54:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D8CD40D58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D8CD40D58
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D8CD40D58
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:54:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cb2.dip0.t-ipconnect.de [91.58.12.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5DD81A4C5B17;
 Thu, 30 Oct 2025 20:54:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38424)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vEYik-000000002CT-0WMm;
 Thu, 30 Oct 2025 19:54:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Date: Thu, 30 Oct 2025 20:54:05 +0100
Message-ID: <20251030195405.1475836-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030195405.1475836-1-bernd@kuhls.net>
References: <20251030195405.1475836-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761854046;
 bh=O53/CGqpkuJlycsU6EhRllQiT2YTtraRd2w90CbzLLg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=d3dbT7uoD78Z3mmTMjE8pRsz7ifd/KnaDDGXBx3Pj2QXb5CWACdu/MDqUDHxuoRdH
 YUm/z3n+hmaqRURWorQZj/AbcNef57a7Yy9y1eF0zFguZ5qMnj6MpW5UHD/sqjNXA5
 VomdSVI1O1OYQcOVxc9vfbux9N7UWZpTh4tAVlJXsJbiKcSa1ofY+r0/WPd1y1i4GJ
 ywlIjjc7iEmMRw1PL6ry0ERmeR4stM9sxhNB6ab3AwY9DJp8bVXgRN2jOdY4ECiV5n
 ZpQsd5HJ5+bKkq8lC6SPmTkWxFiDG4Ek8lLDMPagUKnb+gGHILBbHY125nywtJHLll
 ASSYD/NyOIskA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=d3dbT7uo
Subject: [Buildroot] [PATCH 2/2] package/quota: bump version to 4.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://sourceforge.net/p/linuxquota/code/ci/v4.10/tree/Changelog

Removed patch which is included in this release.
Added two upstream patches to fix build errors.

Removed md5 hash, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/quota/0001-Fix-building-on-musl.patch | 234 ------------------
 .../0001-setproject-fix-openat-call.patch     |  41 +++
 .../0002-setproject-Fix-openWRT-build.patch   |  32 +++
 package/quota/quota.hash                      |   7 +-
 package/quota/quota.mk                        |   4 +-
 5 files changed, 78 insertions(+), 240 deletions(-)
 delete mode 100644 package/quota/0001-Fix-building-on-musl.patch
 create mode 100644 package/quota/0001-setproject-fix-openat-call.patch
 create mode 100644 package/quota/0002-setproject-Fix-openWRT-build.patch

diff --git a/package/quota/0001-Fix-building-on-musl.patch b/package/quota/0001-Fix-building-on-musl.patch
deleted file mode 100644
index df6c32fb34..0000000000
--- a/package/quota/0001-Fix-building-on-musl.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From e73c5b48e12c3f02e532864a1107cdc8a4feafc3 Mon Sep 17 00:00:00 2001
-From: Brahmajit Das <brahmajit.xyz@gmail.com>
-Date: Sun, 14 Jul 2024 07:58:50 +0000
-Subject: [PATCH] Fix building on musl
-
-basename(3) is defined in libgen.h in MUSL. Include libgen.h where
-basename(3) is used.
-
-Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
-Signed-off-by: Jan Kara <jack@suse.cz>
-
-Upstream: https://sourceforge.net/p/linuxquota/code/ci/e73c5b48e12c3f02e532864a1107cdc8a4feafc3/
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- convertquota.c |  1 +
- edquota.c      | 11 ++++++-----
- quota.c        |  1 +
- quota_nld.c    |  1 +
- quotacheck.c   |  1 +
- quotaon.c      |  1 +
- quotastats.c   |  1 +
- quotasync.c    |  1 +
- repquota.c     |  1 +
- rquota_svc.c   |  1 +
- setquota.c     |  1 +
- warnquota.c    |  1 +
- xqmstats.c     |  1 +
- 13 files changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/convertquota.c b/convertquota.c
-index 6c8a553..4eb05ed 100644
---- a/convertquota.c
-+++ b/convertquota.c
-@@ -14,6 +14,7 @@
- #include <fcntl.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include <endian.h>
- 
-diff --git a/edquota.c b/edquota.c
-index 20ca306..c5b27cf 100644
---- a/edquota.c
-+++ b/edquota.c
-@@ -20,6 +20,7 @@
- #include <stdlib.h>
- #include <fcntl.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "quotaops.h"
-@@ -38,7 +39,7 @@ char *progname;
- static int flags, quotatype;
- static int fmt = -1;
- static char *protoname;
--static char *dirname;
-+static char *dir_name;
- 
- static void usage(void)
- {
-@@ -138,7 +139,7 @@ static int parse_options(int argc, char **argv)
- 				  exit(1);
- 			  break;
- 		  case 'f':
--			  dirname = optarg;
-+			  dir_name = optarg;
- 			  break;
- 		  case 256:
- 			  flags |= FL_NUMNAMES;
-@@ -176,7 +177,7 @@ static void copy_prototype(int argc, char **argv, struct quota_handle **handles)
- 	protoprivs = getprivs(protoid, handles, 0);
- 	while (argc-- > 0) {
- 		id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
--		curprivs = getprivs(id, handles, !dirname);
-+		curprivs = getprivs(id, handles, !dir_name);
- 		if (!curprivs)
- 			die(1, _("Cannot get quota information for user %s\n"), *argv);
- 		argv++;
-@@ -223,7 +224,7 @@ int main(int argc, char **argv)
- 	argv += ret;
- 
- 	init_kernel_interface();
--	handles = create_handle_list(dirname ? 1 : 0, dirname ? &dirname : NULL, quotatype, fmt,
-+	handles = create_handle_list(dir_name ? 1 : 0, dir_name ? &dir_name : NULL, quotatype, fmt,
- 			(flags & FL_NO_MIXED_PATHS) ? 0 : IOI_NFS_MIXED_PATHS,
- 			(flags & FL_REMOTE) ? 0 : MS_LOCALONLY);
- 	if (!handles[0]) {
-@@ -296,7 +297,7 @@ int main(int argc, char **argv)
- 	else {
- 		for (; argc > 0; argc--, argv++) {
- 			id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
--			curprivs = getprivs(id, handles, !dirname);
-+			curprivs = getprivs(id, handles, !dir_name);
- 			if (!curprivs)
- 				die(1, _("Cannot get quota information for user %s.\n"), *argv);
- 			if (flags & FL_EDIT_TIMES) {
-diff --git a/quota.c b/quota.c
-index a60de12..66b0fa3 100644
---- a/quota.c
-+++ b/quota.c
-@@ -20,6 +20,7 @@
- #include <unistd.h>
- #include <limits.h>
- #include <ctype.h>
-+#include <libgen.h>
- #ifdef RPC
- #include <rpc/rpc.h>
- #include "rquota.h"
-diff --git a/quota_nld.c b/quota_nld.c
-index 58a62af..710b556 100644
---- a/quota_nld.c
-+++ b/quota_nld.c
-@@ -26,6 +26,7 @@
- #include <fcntl.h>
- #include <limits.h>
- #include <signal.h>
-+#include <libgen.h>
- #include <sys/stat.h>
- #include <asm/types.h>
- 
-diff --git a/quotacheck.c b/quotacheck.c
-index e2c3bbd..fa1d297 100644
---- a/quotacheck.c
-+++ b/quotacheck.c
-@@ -19,6 +19,7 @@
- #include <unistd.h>
- #include <stdlib.h>
- #include <errno.h>
-+#include <libgen.h>
- 
- #include <sys/stat.h>
- #include <sys/types.h>
-diff --git a/quotaon.c b/quotaon.c
-index 351c851..17b6bcc 100644
---- a/quotaon.c
-+++ b/quotaon.c
-@@ -13,6 +13,7 @@
- #include <string.h>
- #include <stdlib.h>
- #include <stdarg.h>
-+#include <libgen.h>
- 
- #include "quotaon.h"
- #include "quota.h"
-diff --git a/quotastats.c b/quotastats.c
-index a059812..4076a7d 100644
---- a/quotastats.c
-+++ b/quotastats.c
-@@ -24,6 +24,7 @@
- #include <errno.h>
- #include <string.h>
- #include <signal.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "common.h"
-diff --git a/quotasync.c b/quotasync.c
-index cad2a20..e90b24a 100644
---- a/quotasync.c
-+++ b/quotasync.c
-@@ -7,6 +7,7 @@
- #include <string.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "common.h"
-diff --git a/repquota.c b/repquota.c
-index e79fc4d..8e509bd 100644
---- a/repquota.c
-+++ b/repquota.c
-@@ -18,6 +18,7 @@
- #include <pwd.h>
- #include <grp.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "common.h"
-diff --git a/rquota_svc.c b/rquota_svc.c
-index 6e856bb..c17df13 100644
---- a/rquota_svc.c
-+++ b/rquota_svc.c
-@@ -34,6 +34,7 @@
- #include <signal.h>
- #include <errno.h>
- #include <netconfig.h>
-+#include <libgen.h>
- #ifdef HOSTS_ACCESS
- #include <tcpd.h>
- #include <netdb.h>
-diff --git a/setquota.c b/setquota.c
-index c517ab1..9e4b2fa 100644
---- a/setquota.c
-+++ b/setquota.c
-@@ -18,6 +18,7 @@
- #include <time.h>
- #include <ctype.h>
- #include <stdlib.h>
-+#include <libgen.h>
- 
- #if defined(RPC)
- #include "rquota.h"
-diff --git a/warnquota.c b/warnquota.c
-index 2882fee..6f63ce7 100644
---- a/warnquota.c
-+++ b/warnquota.c
-@@ -31,6 +31,7 @@
- #include <time.h>
- #include <getopt.h>
- #include <locale.h>
-+#include <libgen.h>
- #ifdef HAVE_NL_LANGINFO
- #include <langinfo.h>
- #endif
-diff --git a/xqmstats.c b/xqmstats.c
-index 59b1d66..345b060 100644
---- a/xqmstats.c
-+++ b/xqmstats.c
-@@ -8,6 +8,7 @@
- #include <stdio.h>
- #include <unistd.h>
- #include <string.h>
-+#include <libgen.h>
- #include "common.h"
- #include "pot.h"
- 
--- 
-2.47.3
-
diff --git a/package/quota/0001-setproject-fix-openat-call.patch b/package/quota/0001-setproject-fix-openat-call.patch
new file mode 100644
index 0000000000..3c5d523e1e
--- /dev/null
+++ b/package/quota/0001-setproject-fix-openat-call.patch
@@ -0,0 +1,41 @@
+From d9852bd5b76ca65f283929e803b87343942ecb1f Mon Sep 17 00:00:00 2001
+From: Konstantin Demin <rockdrilla@gmail.com>
+Date: Tue, 1 Jul 2025 14:35:36 +0200
+Subject: [PATCH] setproject: fix openat() call
+
+It looks like that openat() call was copy-pasted from above fstatat() call.
+However, manpage for openat() doesn't mention AT_SYMLINK_NOFOLLOW.
+Furthermore, AT_SYMLINK_NOFOLLOW constant value (0x100) sometimes (!) clashes
+with O_CREAT constant value which is defined as 0100 (0x40) OR 0x100 (yes, two
+different values for the same constant appear in headers). This produces build
+errors when fortifying defines (-D_FORTIFY_SOURCE) are in effect (e.g. with
+glibc 2.41). In order to keep correct behavior, use O_NOFOLLOW instead of
+AT_SYMLINK_NOFOLLOW.
+
+Fixes: e61d46c65899ced9599c93a6128f19d8759fcad8
+Signed-off-by: Konstantin Demin <rockdrilla@gmail.com>
+Signed-off-by: Jan Kara <jack@suse.cz>
+
+Upstream: https://sourceforge.net/p/linuxquota/code/ci/d9852bd5b76ca65f283929e803b87343942ecb1f/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setproject.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setproject.c b/setproject.c
+index 3047c3d..e688dcd 100644
+--- a/setproject.c
++++ b/setproject.c
+@@ -73,7 +73,7 @@ static void setproject_recurse(int dirfd, unsigned id, unsigned dev)
+ 		if (!S_ISDIR(st.st_mode) && !S_ISREG(st.st_mode))
+ 			continue;
+ 
+-		int fd = openat(dirfd, d->d_name, AT_SYMLINK_NOFOLLOW);
++		int fd = openat(dirfd, d->d_name, O_NOFOLLOW);
+ 		if (fd < 0) {
+ 			errstr(_("error opening %s: %m"), d->d_name);
+ 			errno = 0;
+-- 
+2.47.3
+
diff --git a/package/quota/0002-setproject-Fix-openWRT-build.patch b/package/quota/0002-setproject-Fix-openWRT-build.patch
new file mode 100644
index 0000000000..04cc5fab04
--- /dev/null
+++ b/package/quota/0002-setproject-Fix-openWRT-build.patch
@@ -0,0 +1,32 @@
+From 41ba7031ca4852739dd1f66102d34e4a98490906 Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Tue, 1 Jul 2025 15:41:56 +0200
+Subject: [PATCH] setproject: Fix openWRT build
+
+basename() needs libgen.h include in openWRT build environment. Add it.
+
+Reported-by: "W. Michael Petullo" <mike@flyn.org>
+Signed-off-by: Jan Kara <jack@suse.cz>
+
+Upstream: https://sourceforge.net/p/linuxquota/code/ci/41ba7031ca4852739dd1f66102d34e4a98490906/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setproject.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/setproject.c b/setproject.c
+index e688dcd..4308435 100644
+--- a/setproject.c
++++ b/setproject.c
+@@ -13,6 +13,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <unistd.h>
++#include <libgen.h>
+ 
+ #include <linux/fs.h>
+ 
+-- 
+2.47.3
+
diff --git a/package/quota/quota.hash b/package/quota/quota.hash
index 5b083c911c..e82c1f2c64 100644
--- a/package/quota/quota.hash
+++ b/package/quota/quota.hash
@@ -1,7 +1,6 @@
-# From http://sourceforge.net/projects/linuxquota/files/quota-tools/4.09/ (click on info button)
-md5  f85c2e15d9a735640675ff4977b57bb6  quota-4.09.tar.gz
-sha1  5c215d869626b532be2773f4161bdcc8b9f97126  quota-4.09.tar.gz
+# From https://sourceforge.net/projects/linuxquota/files/quota-tools/4.10/
+sha1  343f26a6f1b6a8dbbd7d89045b0c087efb08d553  quota-4.10.tar.gz
 
 # Locally calculated
-sha256  9cdaca154bc92afc3117f0e5f5b3208dd5f84583af1cf061c39baa0a2bb142f9  quota-4.09.tar.gz
+sha256  a04a0cafca29c15be8b6ac660e06188bccb802c19efe2e7c19ed7f3d667ecf5e  quota-4.10.tar.gz
 sha256  32a5fd41e7a257f7f0373988ea8d45cebdbf376060703c242c11c000751b1203  COPYING
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 1b6a4b1975..f22ebe41c4 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QUOTA_VERSION = 4.09
-QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
+QUOTA_VERSION = 4.10
+QUOTA_SITE = https://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_LICENSE = GPL-2.0+
 QUOTA_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
