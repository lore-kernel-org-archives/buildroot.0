Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543FACD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 18:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 559A140067;
	Mon,  1 Apr 2024 18:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51gBQDf39koY; Mon,  1 Apr 2024 18:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2943F40092
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2943F40092;
	Mon,  1 Apr 2024 18:53:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90BF81BF28E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DF1B608F6
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGCmbNJG8394 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 18:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B154D608B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B154D608B8
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 18:53:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A2CF846CD; Mon,  1 Apr 2024 18:53:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 20:52:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cb421c16f9aa026eabe050d94664c137f93eff5
X-Git-Newrev: ccb4e5db5cbfe91dfd00e173ef481de313c828b8
X-Patchwork-Hint: ignore
Message-Id: <20240401185317.9A2CF846CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: emit library name
 along with check function name
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccb4e5db5cbfe91dfd00e173ef481de313c828b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when we generate .checkpackageignore, we store, for each
error, only the name of the function that generated that error.

Although we currently do not have two check libs that have same-name
check functions, there is nothing that would prevent that, and there
is no reason why two unrelated libs could not implement checks with
the same name.

If such a situation were to arise, we'd have no way, when parsing the
ignore list (in-tree: .checkpackageignore), to know which of the libs
the exclusion would apply to.

Fix that by storing both the library and function names together. The
leading "checkpackagelib." (with the trailing dot, 16 chars) is removed
for brevity, because it's present in all libs' names.

As a consequence, regenerate .checkpackageignore.

Note: people using that script to validate their br2-external trees will
also have to regenerate their own exclusion list if they have one.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore | 2682 +++++++++++++++++++++++++--------------------------
 utils/check-package |    2 +-
 2 files changed, 1342 insertions(+), 1342 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
