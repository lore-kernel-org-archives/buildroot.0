Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11468C433FE
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 18:44:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B062A60EDF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 18:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B062A60EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B39040398;
	Mon, 20 Sep 2021 18:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bq4Zt9_btB_J; Mon, 20 Sep 2021 18:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEC8E403BA;
	Mon, 20 Sep 2021 18:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53D6A1BF23C
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 18:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50CDA403C0
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 18:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G58HNTNxXeBL for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 18:44:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5815C40398
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 18:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632163456;
 bh=Eas9QXvN6/7sWkJTeheXE+7B0xQrg+NF0sn3ad44kRk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=c7IxGbd37O3Tkh+iEQ153dNxtXD02c2Tx1Q2ecqiiU60saoYAxbnMIYQ4XHGIMwRV
 K/NSXoBxkYPIS9GjBHcsaIJmcBxla6VB97pXh/3UPxd9xCU8/tMow85irHN3Ea1jbw
 NlrHJhBb3rQQNM8xIAOyfww1/qqjTom9noP13yJk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.129]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MLR1V-1mBXyl20YN-00IWDk; Mon, 20 Sep 2021 20:44:16 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 20:44:15 +0200
Message-Id: <20210920184415.13599-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920184415.13599-1-ps.report@gmx.net>
References: <20210920184415.13599-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+uWBk3ru3ZjaARpAl5HFEMx8JFCWNhoDuqErXqzLVV2dSmIsK9w
 94j/vuia999S5tEJ1P0AhrpYjDWYQS06CmF6XJSdNdiX+5YuRB6SGa1oOeZ1nl3BmPfD7T3
 xGZELw74apH+DEu5i2FSqtajz7HdCPffxPxxyOwBkUnfsP/xUGJaxpwAPeFx0QGP0g43oir
 X9l/Tbd4JGrXqvUeGhYUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PveGe6x5AYQ=:jbB3s3OB3gxKdrZRMGeOO3
 XpeUfv6p6AcnQezyuWFqTF6XHootjswndcNVyG/Su8pxCPfSDByd5hNspfDGyItdZWk8VcJ1H
 FvSrOGjaEwnhtvW+Q3SNNuZY+50Sp4wvcJKb+HV7NIOH3LIOSlSYMBCGOFbMmQlndGnm17Txd
 wpy7bVUtjrYSvQFOFGtTXthX+LI1ER8vVzasqIFhL9JLq55KQRKAiSWvAI6XeGxuxBlzuCRXJ
 iN3WS3KfrvnwSLCqyZO5xk0fQ1ZC1IGG+Hjm5YxFoi1DK+Q7YiMpKuyJDvbybEy45plJ/mPSS
 JjKgq1UHErtXKGuZrVrKqNLjM/vsGZGQvtr0y4n4P3x5WmDOhvHt6+HruCHQ5oB7wMvY7OGOI
 dyZssL45QLADVfAq4V9xou+V6WsFI9/90odEtgkPrBW5pS1umgsfSpJQXIqHfO7hGZfLthaPB
 5nxEi9mRcx2LDnQAW+zZbSHoopZ6y/Jlk7tNlNI1e1uz1N7LPYCPGss6cVTuJiwypOrOpwtnG
 yy0XOay/VHw/OSk+TJHOfk3afcNR/DgkOetgfkm1f+Q1EdnPwdcgHjctC/iMOELenqE1I6YBp
 w57VTHwSSQfnCAVjYwZprqzznIF0aHh0R72ovlZvJkJVoc5zCmdNav458mNDboL8nfSPqw8/i
 bkGo8dtlnjGGzan4to976bKhcrODIqeXLlLEk+MhlB4crov8q2VeaY++eVsiDmJGfJ2a4/xgt
 1ENeTu4GIGXh+nxycOeAd8Z3G8qC75kfN7egQHDbX5lj+8IpPuzmm5gRj96kaPNkcISIEI7z6
 VQFY9gOahSDpEwS47BC7HPtvQpjjc+iLR5ftkFQ6AibsEeYG0JN2t1QjjIdwZPG8KYq6IlkTw
 zhw8hT59IudheaOtU1NjCgZj8UgIeojUd82NCcDTdhCXnonuajQFiQGUEsWLWLQ8zoOcc/nFQ
 QIThvKUE35SVKr0Pe9MXSilgD8iTeziGvou+QK7ZjSNr5vXsFewZGwaVp9nLrc7FZkVZZTkt+
 Zu8CEfeQFPJrNF97jVytuINktETRtd2mBhIOxu+SZ0DO0tg3vZW6DDHdaCLH5yEZ2be5fnuAS
 mzu5qIB+BA6G/U=
Subject: [Buildroot] [PATCH v1 2/2] package/iwd: bump version to 1.18
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Changelog (since 1.17, from [1]):

  ver 1.18:
    Add support for Access Point FILS IP Address Assignment IE.
    Add support for P2P GO-side 4-way handshake IP allocation.
    Add support for forcing SAE group 19 if BSS requires it.
    Fix issue with handling faulty SAE duplicate commits.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 9bd8f9c252..7c010ed891 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  6f946f823b0dc3205e4e72becf8ad1915448d194f5b10d8003e4c8c5a18e4ef7  iwd-1.17.tar.xz
+sha256  0225ab81579f027e0fcbf255517f432fcf355d14f3645c36813c71a441dfab55  iwd-1.18.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 9737f2c626..ecbe810316 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.17
+IWD_VERSION = 1.18
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
