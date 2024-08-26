Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99319C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 08:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68833405BD;
	Mon, 26 Aug 2024 08:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2LgPlyBBK-4; Mon, 26 Aug 2024 08:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A681405B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A681405B9;
	Mon, 26 Aug 2024 08:06:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB2801BF2A1
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 08:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B69954056D
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 08:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxVcF2EXbv50 for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 08:06:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB13C404EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB13C404EC
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 08:06:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2EA486318; Mon, 26 Aug 2024 08:06:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 10:05:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74f327e2869841b499d66cac6a7bd8a83b1269f5
X-Git-Newrev: 2383768cdf03ad78a89a0b4355c4e1a576c2d219
X-Patchwork-Hint: ignore
Message-Id: <20240826080613.B2EA486318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proftpd: fix group name preventing
 server from starting
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

commit: https://git.buildroot.net/buildroot/commit/?id=2383768cdf03ad78a89a0b4355c4e1a576c2d219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace the group name 'nogroup' with 'nobody' in the default ProFTPD
configuration file. This fixes the following error when starting the
server:

  proftpd[110]: fatal: Group: Unknown group 'nogroup' on line 30 of '/etc/proftpd.conf'

Fixes: 0d887cc2b4 ("system: replace nogroup with nobody")
Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index cd7d232672..72a0fe9354 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -130,6 +130,7 @@ endif
 define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
 	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf
+	$(SED) 's/^\(Group\s\+\)nogroup/\1nobody/' $(TARGET_DIR)/etc/proftpd.conf
 	$(PROFTPD_INSTALL_FTPQUOTA)
 	$(PROFTPD_INSTALL_FTPASSWD)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
