Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D041C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 17:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F422783F4C;
	Sun, 20 Jul 2025 17:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUxRrBi3Ma9e; Sun, 20 Jul 2025 17:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F00983EE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F00983EE6;
	Sun, 20 Jul 2025 17:03:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 909E5127
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8299541285
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLoqKr0PzdJB for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 17:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C855541279
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C855541279
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:03:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8A21868A6; Sun, 20 Jul 2025 17:03:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 18:32:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b8ffbf97b9a5716c6d58758391adc8524c7d7fc
X-Git-Newrev: 00b30f887ac24eb1fb12509fb197ef5891ec332e
X-Patchwork-Hint: ignore
Message-Id: <20250720170314.B8A21868A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper.c: get rid of
 EXCLUSIVE_ARGS
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=00b30f887ac24eb1fb12509fb197ef5891ec332e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rather than having a hard coded amount of exclusive args (with the risk of
overflow when new logic is added), simplify the argument buffer allocation
logic to always allocate room for DEFAULT_MAX_ARGS (1024) arguments and just
realloc to grow for the rare situation where that is not enough.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 toolchain/toolchain-wrapper.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index d0bf124926..9fb96a276a 100644
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
@@ -252,6 +236,7 @@ int main(int argc, char **argv)
 	char *basename;
 	char *env_debug;
 	int ret, i, count = 0, debug = 0, found_shared = 0, found_nonoption = 0;
+	size_t n_args;
 
 	/* Debug the wrapper to see arguments it was called with.
 	 * If environment variable BR2_DEBUG_WRAPPER is:
@@ -360,8 +345,7 @@ int main(int argc, char **argv)
 		return 3;
 	}
 
-	cur = args = malloc(sizeof(predef_args) +
-			    (sizeof(char *) * (argc + EXCLUSIVE_ARGS)));
+	cur = args = malloc(DEFAULT_MAX_ARGS * sizeof(char *));
 	if (args == NULL) {
 		perror(__FILE__ ": malloc");
 		return 2;
@@ -503,8 +487,17 @@ int main(int argc, char **argv)
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
