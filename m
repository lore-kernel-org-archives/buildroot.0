Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1609C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 524FB4090E;
	Thu,  6 Jan 2022 15:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zuski3TtpGUa; Thu,  6 Jan 2022 15:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC424294A;
	Thu,  6 Jan 2022 15:20:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF7241BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD95A4294A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 139hDM0Iohz8 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:19:59 +0000 (UTC)
X-Greylist: delayed 00:16:03 by SQLgrey-1.8.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A564E4090E
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 15:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=ucL5AtmOLApLFO20514YoH62jEIhCzn5ZajIK2TvjZA=; b=SL
 5WS5ogSd3asGYn+Y/eXfmSjcRuTreVdL3UHT1UnkgFPnPLrXtBB/IjyOiWVYCl+jVnPSIG3ciLBCx
 azyw/yTtHSZMye3VHkeSgQOP8wK3Cro6oWFrk+Y6CeEWkPE28L0BMhbbiqiFfhBnWJ8eKc6y8J2px
 FF4f8u7PsjCOYa45YRLsXCpmfgwXjQfDUp1fV9/vsRG+s/7iI02EBoQ+Oyd7Ai9WiIlvknxON2jMM
 jgAj6SdzOfrk0gbEZox8v+pGQ/ZCldSIz4/eQmoMOw4rNF1ff1H7YBDPRbTx6Jg53ssGu1jbt2FpC
 agIZWaEWkn6iEP/Gjt/jusIIutZbpBJg==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1n5UYV-0007JM-EV; Thu, 06 Jan 2022 15:19:55 +0000
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 15:19:42 +0000
Message-Id: <20220106151942.1506534-1-john@metanate.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authenticated: YES
Subject: [Buildroot] [PATCH] download/git: fix LFS support
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
Cc: John Keeping <john@metanate.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The original patch for commit cff428fe31 ("download/git: support Git
LFS") included a call to "git lfs install" but this was a problem as it
could modify ~/.gitconfig outside the dl/ tree.  When this was
updated it was thought that the modification to gitconfig was
unnecessary because the LFS fetch and checkout steps are performed
manually.

Unfortunately, this is not correct and the LFS checkout fails with:

	Cannot checkout LFS objects, Git LFS is not installed.

Add the call to "git lfs install", with the --local option so that only
the repository's .git/config is modified and not the user's global
~/.gitconfig.

This is also required for submodules as the parent repository's config
is not inherited.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: John Keeping <john@metanate.com>
---
 support/download/git | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/download/git b/support/download/git
index 41c3160099..1a1c315f73 100755
--- a/support/download/git
+++ b/support/download/git
@@ -209,10 +209,12 @@ fi
 
 # If there are large files then fetch them.
 if [ ${large_file} -eq 1 ]; then
+    _git lfs install --local
     _git lfs fetch
     _git lfs checkout
     # If there are also submodules, recurse into them,
     if [ ${recurse} -eq 1 ]; then
+        _git submodule foreach --recursive ${GIT} lfs install --local
         _git submodule foreach --recursive ${GIT} lfs fetch
         _git submodule foreach --recursive ${GIT} lfs checkout
     fi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
