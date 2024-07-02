Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7660EC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F3181F42;
	Tue,  2 Jul 2024 06:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alw-hiIxMJ2K; Tue,  2 Jul 2024 06:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABAC681F7C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABAC681F7C;
	Tue,  2 Jul 2024 06:51:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1739B1BF97E
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1091440CDF
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lEwIrX7RI-z for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9BE440CCB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9BE440CCB
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C41A88389D; Tue,  2 Jul 2024 06:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 08:48:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cea0cf39d4e477e97f7ae21eeca9853d04fd3e6b
X-Git-Newrev: 8fae1e7f5f513e360a57c777e341a270fd353c88
X-Patchwork-Hint: ignore
Message-Id: <20240702065131.C41A88389D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libblockdev: fix patch fuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fae1e7f5f513e360a57c777e341a270fd353c88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, libblockdev fails to build with output:

    Applying 0001-Provide-replacement-function-for-strerror_l.patch using patch:
    patching file configure.ac
    patching file src/utils/module.c
    Hunk #1 FAILED at 28.

This commit fixes the Provide replacement function for strerror_l()
patch so that it applies.

Fixes:
http://autobuild.buildroot.net/results/df5/df54118cc7057ba8dd566515281b77c49a596a04

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../libblockdev/0001-Provide-replacement-function-for-strerror_l.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index f7f75c9c14..d073e16ac5 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -41,8 +41,8 @@ index 6557c3ab..5893f0ac 100644
  #include "logging.h"
 +#include "utils.h"
  
- #define UNUSED __attribute__((unused))
  
+ /**
 diff --git a/src/utils/utils.h b/src/utils/utils.h
 index 801a8b6e..b2bdf0d0 100644
 --- a/src/utils/utils.h
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
