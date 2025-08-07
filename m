Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6248C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D8A4606BA;
	Thu,  7 Aug 2025 17:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OL4QsT_85vQO; Thu,  7 Aug 2025 17:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DA2E606B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA2E606B6;
	Thu,  7 Aug 2025 17:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE82F31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B804400D9
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J21R8r8oUTg7 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5310E40066
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5310E40066
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5156386FE1; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:42 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 09da162ef5dab0e08c811a6a11109623d903918a
X-Git-Newrev: 7b8400f71b51a69d7f43969ba9db358823266549
X-Patchwork-Hint: ignore
Message-Id: <20250807171915.5156386FE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 toolchain/toolchain-wrapper.c: get rid of EXCLUSIVE_ARGS
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b8400f71b51a69d7f43969ba9db358823266549
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Rather than having a hard coded amount of exclusive args (with the risk of
overflow when new logic is added), simplify the argument buffer allocation
logic to always allocate room for DEFAULT_MAX_ARGS (1024) arguments and just
realloc to grow for the rare situation where that is not enough.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 00b30f887ac24eb1fb12509fb197ef5891ec332e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 toolchain/toolchain-wrapper.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index eb17c3d3de..480a1ed5f1 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -36,25 +36,9 @@ static char sysroot[PATH_MAX];
 static char _time_[sizeof("-D__TIME__=\"HH:MM:SS\"")];
 static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
 
-/**
- * GCC errors out with certain combinations of arguments (examples are
- * -mfloat-abi={hard|soft} and -m{little|big}-endian), so we have to ensure
- * that we only pass the predefined one to the real compiler if the inverse
- * option isn't in the argument list.
- * This specifies the worst case number of extra arguments we might pass
- * Currently, we may have:
- * 	-mfloat-abi=
- * 	-march=
- * 	-mcpu=
- * 	-D__TIME__=
- * 	-D__DATE__=
- * 	-Wno-builtin-macro-redefined
- * 	-Wl,-z,now
- * 	-Wl,-z,relro
- * 	-fPIE
- * 	-pie
- */
-#define EXCLUSIVE_ARGS	10
+/* Maximum amount of arguments to reserve space for by default.
+   Must be > predef_args */
+#define DEFAULT_MAX_ARGS	1024
 
 static char *predef_args[] = {
 #ifdef BR_CCACHE
@@ -246,6 +230,7 @@ int main(int argc, char **argv)
 	char *basename;
 	char *env_debug;
 	int ret, i, count = 0, debug = 0, found_shared = 0, found_nonoption = 0;
+	size_t n_args;
 
 	/* Debug the wrapper to see arguments it was called with.
 	 * If environment variable BR2_DEBUG_WRAPPER is:
@@ -354,8 +339,7 @@ int main(int argc, char **argv)
 		return 3;
 	}
 
-	cur = args = malloc(sizeof(predef_args) +
-			    (sizeof(char *) * (argc + EXCLUSIVE_ARGS)));
+	cur = args = malloc(DEFAULT_MAX_ARGS * sizeof(char *));
 	if (args == NULL) {
 		perror(__FILE__ ": malloc");
 		return 2;
@@ -497,8 +481,17 @@ int main(int argc, char **argv)
 #endif
 	}
 
+        n_args = (cur - args);
+        if ((n_args + argc) > DEFAULT_MAX_ARGS) {
+		args = realloc(args, (n_args + argc) * sizeof(char *));
+		if (args == NULL) {
+			perror(__FILE__ ": realloc");
+			return 2;
+		}
+        }
+
 	/* append forward args and terminating NULL */
-	memcpy(cur, &argv[1], sizeof(char *) * argc);
+	memcpy(&args[n_args], &argv[1], sizeof(char *) * argc);
 
 	exec_args = args;
 #ifdef BR_CCACHE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
