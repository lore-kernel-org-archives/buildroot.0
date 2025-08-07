Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF41FC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 883F3804D1;
	Thu,  7 Aug 2025 17:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_NzYLkOrMUm; Thu,  7 Aug 2025 17:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F3C80504
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12F3C80504;
	Thu,  7 Aug 2025 17:19:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A974C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF2E340490
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJ7VvEs3RGLz for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B3554045F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B3554045F
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4968285C8D; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:40 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 325fa4b316bcee70947ce10fcdfd0aaba072337b
X-Git-Newrev: 09da162ef5dab0e08c811a6a11109623d903918a
X-Patchwork-Hint: ignore
Message-Id: <20250807171915.4968285C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 toolchain/toolchain-wrapper.c: slightly simplify cmdline copying
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

commit: https://git.buildroot.net/buildroot/commit/?id=09da162ef5dab0e08c811a6a11109623d903918a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

C99 section 5.1.2.2.1p2 mandates that:

- argv[argc] shall be a null pointer.

https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf

So we might as well copy the null pointer along in the memcpy() rather than
copy everything up to the null pointer and then add one afterwards for
simplicity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6b8ffbf97b9a5716c6d58758391adc8524c7d7fc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 toolchain/toolchain-wrapper.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 698d36b54f..eb17c3d3de 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -497,12 +497,8 @@ int main(int argc, char **argv)
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
