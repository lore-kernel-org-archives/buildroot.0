Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995D1C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6020B6069E;
	Sat, 13 Jul 2024 09:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6adHPHpBbQv; Sat, 13 Jul 2024 09:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A108606C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A108606C0;
	Sat, 13 Jul 2024 09:10:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA5F81BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7D956069E
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivBiuMFsCyhy for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC28460683
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC28460683
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:10:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3410861E2; Sat, 13 Jul 2024 09:10:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:07:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fbd26f83169a206bdf9c36c85510a33c0e7a864
X-Git-Newrev: 9954315fc5b2026552a0f0175307ec8784b51578
X-Patchwork-Hint: ignore
Message-Id: <20240713091031.B3410861E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper: make gcc
 --help -v work correctly
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9954315fc5b2026552a0f0175307ec8784b51578
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

make "gcc --help -v" display all the options, some packages depend on this
https://bugs.busybox.net/show_bug.cgi?id=15231

Signed-off-by: Sagi Mor <sagimor6@gmail.com>
[Arnout: move the handling to the beginning and directly call execv]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
