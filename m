Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA29C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 17:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C4F4129E;
	Sun, 20 Jul 2025 17:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARYKu3ceXur5; Sun, 20 Jul 2025 17:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0A9A41285
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0A9A41285;
	Sun, 20 Jul 2025 17:03:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7920F127
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AD7E61003
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTLIW_yjS2kZ for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 17:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0D0160E73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0D0160E73
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:03:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF77D8689F; Sun, 20 Jul 2025 17:03:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 18:32:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91b9d8c32b3c5793b795558d6890a168819df3e3
X-Git-Newrev: 6b8ffbf97b9a5716c6d58758391adc8524c7d7fc
X-Patchwork-Hint: ignore
Message-Id: <20250720170314.AF77D8689F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper.c: slightly
 simplify cmdline copying
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b8ffbf97b9a5716c6d58758391adc8524c7d7fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C99 section 5.1.2.2.1p2 mandates that:

- argv[argc] shall be a null pointer.

https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf

So we might as well copy the null pointer along in the memcpy() rather than
copy everything up to the null pointer and then add one afterwards for
simplicity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 toolchain/toolchain-wrapper.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 703d2fc042..d0bf124926 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -503,12 +503,8 @@ int main(int argc, char **argv)
 #endif
 	}
 
-	/* append forward args */
-	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
-	cur += argc - 1;
-
-	/* finish with NULL termination */
-	*cur = NULL;
+	/* append forward args and terminating NULL */
+	memcpy(cur, &argv[1], sizeof(char *) * argc);
 
 	exec_args = args;
 #ifdef BR_CCACHE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
