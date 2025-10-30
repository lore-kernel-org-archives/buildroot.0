Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB90CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 19:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F31188294A;
	Thu, 30 Oct 2025 19:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkSfdw3I3Aiu; Thu, 30 Oct 2025 19:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA9ED8297F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9ED8297F;
	Thu, 30 Oct 2025 19:54:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26F21CD
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 151FE41559
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29NFskIJ9gJy for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 19:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 487734153C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 487734153C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 487734153C
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:54:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cb2.dip0.t-ipconnect.de [91.58.12.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20C03A4C5757;
 Thu, 30 Oct 2025 20:54:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38424)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vEYij-000000002CT-3uJi;
 Thu, 30 Oct 2025 19:54:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Date: Thu, 30 Oct 2025 20:54:04 +0100
Message-ID: <20251030195405.1475836-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761854046;
 bh=5I6XQSS72O7TiLeknnpic4zYtzawUnrCa/EMjx/UaWI=;
 h=From:To:Cc:Subject:Date:From;
 b=T9/HYVpIvCDThJHwII24Ha6GJNqN8Zl/wEnVv9hIFmjkCyou3lZBwk8fCKYyHOC+P
 PzNL7KsvSWwIGOnMH456IIOJP2WeN7s0VD8d4fn6s0/uPh4Hw6eDxGQ2Z//kwKioCH
 A7G19r3PqBp5IC7H7e4VoX/CRr0YDGTmPF7qxGjy7grcVQtrpkFX+vwjqw+rQdArLj
 t0xZCxHY9O3XZ+CC0cSpkVnBlbMLJGs1EoR6aOL911P5NqRynAX2kZOScuw3CttFvy
 kvGaPr0sQzWIIMh//Mbey3neZXA7z+eU5cVTDa6TXJz7OsnMzMK//uNprR+9B7MFzZ
 /QyaNw/7L6+QA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=T9/HYVpI
Subject: [Buildroot] [PATCH 1/2] package/quota: Fix building on musl
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

Add upstream commit to fix musl build.

Fixes:
https://autobuild.buildroot.net/results/7de/7de6acab2b10d1b6b7d5e95104f1f2686bcd126b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/quota/0001-Fix-building-on-musl.patch | 234 ++++++++++++++++++
 1 file changed, 234 insertions(+)
 create mode 100644 package/quota/0001-Fix-building-on-musl.patch

diff --git a/package/quota/0001-Fix-building-on-musl.patch b/package/quota/0001-Fix-building-on-musl.patch
new file mode 100644
index 0000000000..df6c32fb34
--- /dev/null
+++ b/package/quota/0001-Fix-building-on-musl.patch
@@ -0,0 +1,234 @@
+From e73c5b48e12c3f02e532864a1107cdc8a4feafc3 Mon Sep 17 00:00:00 2001
+From: Brahmajit Das <brahmajit.xyz@gmail.com>
+Date: Sun, 14 Jul 2024 07:58:50 +0000
+Subject: [PATCH] Fix building on musl
+
+basename(3) is defined in libgen.h in MUSL. Include libgen.h where
+basename(3) is used.
+
+Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
+Signed-off-by: Jan Kara <jack@suse.cz>
+
+Upstream: https://sourceforge.net/p/linuxquota/code/ci/e73c5b48e12c3f02e532864a1107cdc8a4feafc3/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ convertquota.c |  1 +
+ edquota.c      | 11 ++++++-----
+ quota.c        |  1 +
+ quota_nld.c    |  1 +
+ quotacheck.c   |  1 +
+ quotaon.c      |  1 +
+ quotastats.c   |  1 +
+ quotasync.c    |  1 +
+ repquota.c     |  1 +
+ rquota_svc.c   |  1 +
+ setquota.c     |  1 +
+ warnquota.c    |  1 +
+ xqmstats.c     |  1 +
+ 13 files changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/convertquota.c b/convertquota.c
+index 6c8a553..4eb05ed 100644
+--- a/convertquota.c
++++ b/convertquota.c
+@@ -14,6 +14,7 @@
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ 
+ #include <endian.h>
+ 
+diff --git a/edquota.c b/edquota.c
+index 20ca306..c5b27cf 100644
+--- a/edquota.c
++++ b/edquota.c
+@@ -20,6 +20,7 @@
+ #include <stdlib.h>
+ #include <fcntl.h>
+ #include <getopt.h>
++#include <libgen.h>
+ 
+ #include "pot.h"
+ #include "quotaops.h"
+@@ -38,7 +39,7 @@ char *progname;
+ static int flags, quotatype;
+ static int fmt = -1;
+ static char *protoname;
+-static char *dirname;
++static char *dir_name;
+ 
+ static void usage(void)
+ {
+@@ -138,7 +139,7 @@ static int parse_options(int argc, char **argv)
+ 				  exit(1);
+ 			  break;
+ 		  case 'f':
+-			  dirname = optarg;
++			  dir_name = optarg;
+ 			  break;
+ 		  case 256:
+ 			  flags |= FL_NUMNAMES;
+@@ -176,7 +177,7 @@ static void copy_prototype(int argc, char **argv, struct quota_handle **handles)
+ 	protoprivs = getprivs(protoid, handles, 0);
+ 	while (argc-- > 0) {
+ 		id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
+-		curprivs = getprivs(id, handles, !dirname);
++		curprivs = getprivs(id, handles, !dir_name);
+ 		if (!curprivs)
+ 			die(1, _("Cannot get quota information for user %s\n"), *argv);
+ 		argv++;
+@@ -223,7 +224,7 @@ int main(int argc, char **argv)
+ 	argv += ret;
+ 
+ 	init_kernel_interface();
+-	handles = create_handle_list(dirname ? 1 : 0, dirname ? &dirname : NULL, quotatype, fmt,
++	handles = create_handle_list(dir_name ? 1 : 0, dir_name ? &dir_name : NULL, quotatype, fmt,
+ 			(flags & FL_NO_MIXED_PATHS) ? 0 : IOI_NFS_MIXED_PATHS,
+ 			(flags & FL_REMOTE) ? 0 : MS_LOCALONLY);
+ 	if (!handles[0]) {
+@@ -296,7 +297,7 @@ int main(int argc, char **argv)
+ 	else {
+ 		for (; argc > 0; argc--, argv++) {
+ 			id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
+-			curprivs = getprivs(id, handles, !dirname);
++			curprivs = getprivs(id, handles, !dir_name);
+ 			if (!curprivs)
+ 				die(1, _("Cannot get quota information for user %s.\n"), *argv);
+ 			if (flags & FL_EDIT_TIMES) {
+diff --git a/quota.c b/quota.c
+index a60de12..66b0fa3 100644
+--- a/quota.c
++++ b/quota.c
+@@ -20,6 +20,7 @@
+ #include <unistd.h>
+ #include <limits.h>
+ #include <ctype.h>
++#include <libgen.h>
+ #ifdef RPC
+ #include <rpc/rpc.h>
+ #include "rquota.h"
+diff --git a/quota_nld.c b/quota_nld.c
+index 58a62af..710b556 100644
+--- a/quota_nld.c
++++ b/quota_nld.c
+@@ -26,6 +26,7 @@
+ #include <fcntl.h>
+ #include <limits.h>
+ #include <signal.h>
++#include <libgen.h>
+ #include <sys/stat.h>
+ #include <asm/types.h>
+ 
+diff --git a/quotacheck.c b/quotacheck.c
+index e2c3bbd..fa1d297 100644
+--- a/quotacheck.c
++++ b/quotacheck.c
+@@ -19,6 +19,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <errno.h>
++#include <libgen.h>
+ 
+ #include <sys/stat.h>
+ #include <sys/types.h>
+diff --git a/quotaon.c b/quotaon.c
+index 351c851..17b6bcc 100644
+--- a/quotaon.c
++++ b/quotaon.c
+@@ -13,6 +13,7 @@
+ #include <string.h>
+ #include <stdlib.h>
+ #include <stdarg.h>
++#include <libgen.h>
+ 
+ #include "quotaon.h"
+ #include "quota.h"
+diff --git a/quotastats.c b/quotastats.c
+index a059812..4076a7d 100644
+--- a/quotastats.c
++++ b/quotastats.c
+@@ -24,6 +24,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <signal.h>
++#include <libgen.h>
+ 
+ #include "pot.h"
+ #include "common.h"
+diff --git a/quotasync.c b/quotasync.c
+index cad2a20..e90b24a 100644
+--- a/quotasync.c
++++ b/quotasync.c
+@@ -7,6 +7,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ 
+ #include "pot.h"
+ #include "common.h"
+diff --git a/repquota.c b/repquota.c
+index e79fc4d..8e509bd 100644
+--- a/repquota.c
++++ b/repquota.c
+@@ -18,6 +18,7 @@
+ #include <pwd.h>
+ #include <grp.h>
+ #include <getopt.h>
++#include <libgen.h>
+ 
+ #include "pot.h"
+ #include "common.h"
+diff --git a/rquota_svc.c b/rquota_svc.c
+index 6e856bb..c17df13 100644
+--- a/rquota_svc.c
++++ b/rquota_svc.c
+@@ -34,6 +34,7 @@
+ #include <signal.h>
+ #include <errno.h>
+ #include <netconfig.h>
++#include <libgen.h>
+ #ifdef HOSTS_ACCESS
+ #include <tcpd.h>
+ #include <netdb.h>
+diff --git a/setquota.c b/setquota.c
+index c517ab1..9e4b2fa 100644
+--- a/setquota.c
++++ b/setquota.c
+@@ -18,6 +18,7 @@
+ #include <time.h>
+ #include <ctype.h>
+ #include <stdlib.h>
++#include <libgen.h>
+ 
+ #if defined(RPC)
+ #include "rquota.h"
+diff --git a/warnquota.c b/warnquota.c
+index 2882fee..6f63ce7 100644
+--- a/warnquota.c
++++ b/warnquota.c
+@@ -31,6 +31,7 @@
+ #include <time.h>
+ #include <getopt.h>
+ #include <locale.h>
++#include <libgen.h>
+ #ifdef HAVE_NL_LANGINFO
+ #include <langinfo.h>
+ #endif
+diff --git a/xqmstats.c b/xqmstats.c
+index 59b1d66..345b060 100644
+--- a/xqmstats.c
++++ b/xqmstats.c
+@@ -8,6 +8,7 @@
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <string.h>
++#include <libgen.h>
+ #include "common.h"
+ #include "pot.h"
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
