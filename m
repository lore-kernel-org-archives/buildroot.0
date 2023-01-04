Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE004C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 16:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 569C481FD8;
	Wed,  4 Jan 2023 16:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 569C481FD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjuRcyjzoxTh; Wed,  4 Jan 2023 16:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A1581FDA;
	Wed,  4 Jan 2023 16:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A1581FDA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF25F1BF5DF
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CDE481F99
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CDE481F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vK38acnSfSdp for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B765581FAA
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B765581FAA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A75368756A; Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:52:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93036af53fbbd566a800a12fa8979000ea4fa31f
X-Git-Newrev: c4ce9d01c4244252e18302aa97653e573359dba6
X-Patchwork-Hint: ignore
Message-Id: <20230104165453.A75368756A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "pptp-linux: fix build with high
 BR2_JLEVEL settings"
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4ce9d01c4244252e18302aa97653e573359dba6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ffc4afe084a76e7246bd373c73b706f512a86c2b.

Commit from 2012 "ffc4afe084 pptp-linux: fix build with high BR2_JLEVEL
settings" added <pkg>_MAKE to a generic package, but the generic infra
does not take this symbol into account.

The build issue was fixed in 2013 with commit "a5b8081b89 pptp-linux:
fix parallel build" by adding a patch file.

So drop the bogus PPTP_LINUX_MAKE.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pptp-linux/pptp-linux.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 7fd0733977..b6c740e710 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -7,7 +7,6 @@
 PPTP_LINUX_VERSION = 1.10.0
 PPTP_LINUX_SITE = http://downloads.sourceforge.net/project/pptpclient/pptp/pptp-$(PPTP_LINUX_VERSION)
 PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
-PPTP_LINUX_MAKE = $(MAKE1)
 PPTP_LINUX_LICENSE = GPL-2.0+
 PPTP_LINUX_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
