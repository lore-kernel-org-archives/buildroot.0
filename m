Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA427C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7775D80E38;
	Fri,  9 Aug 2024 19:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlBzlAXtz9U2; Fri,  9 Aug 2024 19:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79DAE80ED0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79DAE80ED0;
	Fri,  9 Aug 2024 19:34:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC8D1BF2F5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25503414CC
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZRWmM90W5Ws for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D02B414C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D02B414C9
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:34:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1827884CF1; Fri,  9 Aug 2024 19:34:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 21:28:26 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f112f05b8ff4da7fb7b53dcbc296fad9e058df27
X-Git-Newrev: ab1facc33a5f0f29e1854de4066a8c1e6677454f
X-Patchwork-Hint: ignore
Message-Id: <20240809193400.1827884CF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 toolchain/toolchain-wrapper: make gcc --help -v work correctly
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab1facc33a5f0f29e1854de4066a8c1e6677454f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

make "gcc --help -v" display all the options, some packages depend on this
https://bugs.busybox.net/show_bug.cgi?id=15231

Signed-off-by: Sagi Mor <sagimor6@gmail.com>
[Arnout: move the handling to the beginning and directly call execv]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 9954315fc5b2026552a0f0175307ec8784b51578)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-wrapper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index f66e588bfd..e436889760 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -310,6 +310,17 @@ int main(int argc, char **argv)
 		perror(__FILE__ ": overflow");
 		return 3;
 	}
+
+	/* skip all processing --help is specified */
+	for (i = 1; i < argc; i++) {
+		if (!strcmp(argv[i], "--help")) {
+			argv[0] = path;
+			if (execv(path, argv))
+				perror(path);
+			return 1;
+		}
+	}
+
 #ifdef BR_CCACHE
 	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/bin/ccache", absbasedir);
 	if (ret >= sizeof(ccache_path)) {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
