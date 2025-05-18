Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D165C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5395B405ED;
	Sun, 18 May 2025 12:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8R_xCtSLhlW; Sun, 18 May 2025 12:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 873B940619
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 873B940619;
	Sun, 18 May 2025 12:52:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31733DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2319660630
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIHVku6ctxmP for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 676A56058B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 676A56058B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:52:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 617F886F1A; Sun, 18 May 2025 12:52:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:51:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 913bdcda44159e3b517b611dc7fbb2d105be343d
X-Git-Newrev: 53e1772682d86ed681ce41b4027bd34163023871
X-Patchwork-Hint: ignore
Message-Id: <20250518125227.617F886F1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/wrapper: check unsafe paths
 earlier
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=53e1772682d86ed681ce41b4027bd34163023871
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently check for unsafe paths right between adding our arguments,
and adding the one passed from the command line. This not very
consistent.

Unsafe paths can only come from the command line, as we are not adding
any of our own (hopefully, we know better!), so we can run the check as
early as possible.

Move the check very early, but not before we handle --help.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-wrapper.c | 44 +++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 8b1fb79dde..e644c1e7bb 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -319,6 +319,28 @@ int main(int argc, char **argv)
 		}
 	}
 
+	/* Check for unsafe library and header paths */
+	for (i = 1; i < argc; i++) {
+		const struct str_len_s *opt;
+		for (opt=unsafe_opts; opt->str; opt++ ) {
+			/* Skip any non-unsafe option. */
+			if (strncmp(argv[i], opt->str, opt->len))
+				continue;
+
+			/* Handle both cases:
+			 *  - path is a separate argument,
+			 *  - path is concatenated with option.
+			 */
+			if (argv[i][opt->len] == '\0') {
+				i++;
+				if (i == argc)
+					break;
+				check_unsafe_path(argv[i-1], argv[i], 0);
+			} else
+				check_unsafe_path(argv[i], argv[i] + opt->len, 1);
+		}
+	}
+
 #ifdef BR_CCACHE
 	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/bin/ccache", absbasedir);
 	if (ret >= sizeof(ccache_path)) {
@@ -475,28 +497,6 @@ int main(int argc, char **argv)
 #endif
 	}
 
-	/* Check for unsafe library and header paths */
-	for (i = 1; i < argc; i++) {
-		const struct str_len_s *opt;
-		for (opt=unsafe_opts; opt->str; opt++ ) {
-			/* Skip any non-unsafe option. */
-			if (strncmp(argv[i], opt->str, opt->len))
-				continue;
-
-			/* Handle both cases:
-			 *  - path is a separate argument,
-			 *  - path is concatenated with option.
-			 */
-			if (argv[i][opt->len] == '\0') {
-				i++;
-				if (i == argc)
-					break;
-				check_unsafe_path(argv[i-1], argv[i], 0);
-			} else
-				check_unsafe_path(argv[i], argv[i] + opt->len, 1);
-		}
-	}
-
 	/* append forward args */
 	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
 	cur += argc - 1;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
