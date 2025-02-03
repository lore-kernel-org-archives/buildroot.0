Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1E3C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7DC64F49E;
	Fri, 28 Feb 2025 17:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ned-wjGQva8t; Fri, 28 Feb 2025 17:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8080D50183
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8080D50183;
	Fri, 28 Feb 2025 17:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12F0B1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6EE442F06
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CtCXlWgDDXrW for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B69B4297D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B69B4297D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8796B87A55; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 12:42:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 85376a71814eefb00212caa6b2d526fcddfbb084
X-Git-Newrev: ab0aac817936b53c613dc77907dd04480a9d0896
X-Patchwork-Hint: ignore
Message-Id: <20250228163024.8796B87A55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain/toolchain-wrapper.c:
 do not pass linker flags if not linking
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
Content-Type: multipart/mixed; boundary="===============1031825053918073139=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1031825053918073139==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ab0aac817936b53c613dc77907dd04480a9d0896
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/55

When gcc sees a linker option (-Wl,..) it executes the linker, leading to
confusing error messages if no source files are provided, E.G.:

% gcc
gcc: fatal error: no input files
compilation terminated.

% gcc -Wl,-z,now
/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/12/../../../x86_64-linux-gnu/Scrt1.o: in function `_start':
(.text+0x17): undefined reference to `main'
collect2: error: ld returned 1 exit status

It is not really trivial to detect in the wrapper if linking will be done,
but we can at least check if any non-option arguments (E.G.  source/object
files) are passed and skip the -Wl,.. options if not.

% ./host/bin/aarch64-linux-gcc
aarch64-linux-gcc.br_real: fatal error: no input files
compilation terminated.

With this fixed we no longer need the special case for --help -v from commit
9954315fc5b2 ("toolchain/toolchain-wrapper: make gcc --help -v work
correctly"), so drop that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-wrapper.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index db11cdb6ab..8b1fb79dde 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -245,7 +245,7 @@ int main(int argc, char **argv)
 	char *progpath = argv[0];
 	char *basename;
 	char *env_debug;
-	int ret, i, count = 0, debug = 0, found_shared = 0;
+	int ret, i, count = 0, debug = 0, found_shared = 0, found_nonoption = 0;
 
 	/* Debug the wrapper to see arguments it was called with.
 	 * If environment variable BR2_DEBUG_WRAPPER is:
@@ -311,13 +311,11 @@ int main(int argc, char **argv)
 		return 3;
 	}
 
-	/* skip all processing --help is specified */
+	/* any non-option (E.G. source / object files) arguments passed? */
 	for (i = 1; i < argc; i++) {
-		if (!strcmp(argv[i], "--help")) {
-			argv[0] = path;
-			if (execv(path, argv))
-				perror(path);
-			return 1;
+		if (argv[i][0] != '-') {
+			found_nonoption = 1;
+			break;
 		}
 	}
 
@@ -342,8 +340,11 @@ int main(int argc, char **argv)
 	}
 
 	/* start with predefined args */
-	memcpy(cur, predef_args, sizeof(predef_args));
-	cur += sizeof(predef_args) / sizeof(predef_args[0]);
+	for (i = 0; i < sizeof(predef_args) / sizeof(predef_args[0]); i++) {
+		/* skip linker flags when we know we are not linking */
+		if (found_nonoption || strncmp(predef_args[i], "-Wl,", strlen("-Wl,")))
+			*cur++ = predef_args[i];
+	}
 
 #ifdef BR_FLOAT_ABI
 	/* add float abi if not overridden in args */
@@ -463,7 +464,7 @@ int main(int argc, char **argv)
 		    !strcmp(argv[i], "-D__UBOOT__"))
 			break;
 	}
-	if (i == argc) {
+	if (i == argc && found_nonoption) {
 		/* https://wiki.gentoo.org/wiki/Hardened/Toolchain#Mark_Read-Only_Appropriate_Sections */
 #ifdef BR2_RELRO_PARTIAL
 		*cur++ = "-Wl,-z,relro";

--===============1031825053918073139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1031825053918073139==--
