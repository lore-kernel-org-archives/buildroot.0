Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556E7C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 18:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 082F98264A;
	Tue,  8 Feb 2022 18:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05jxWOLCTauL; Tue,  8 Feb 2022 18:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18B79818AC;
	Tue,  8 Feb 2022 18:05:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65B651BF2AF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 18:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61AD6824DD
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 18:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dDENLzxLHhGM for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 18:05:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C877813E9
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 18:05:37 +0000 (UTC)
Received: from opfedar05.francetelecom.fr (unknown [xx.xx.xx.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar21.francetelecom.fr (ESMTP service) with ESMTPS id 4JtWC31CbXz7tlw; 
 Tue,  8 Feb 2022 19:05:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644343535;
 bh=CddJMuDXphO9ybxkOFyKBUnyI0sdwlBGocJ5vPsXhlo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=vvQKeNh387tH+1cA0yQWV7EsrAh1ywBliC7OQTwB1D9jVVmVjYVzGN3/JZiM8a16N
 Ydyv2SVSgDEQncayT3Mv1POu0aCpyUmtTUH5gahsEz+GdFg+5wDJRIEWGSWycV9kiy
 ylNiO5a6hmWdRCrBm3fHje5rSnfs2qCrUFEpTPSX/asN7hdlr0xROzIdHAn21gPFoN
 wLhZi8B52NotIKfVgEDDydh+F1l74MJhRQ6N400z4WiPtcx0A71K2FdoEjBqkJ/OmC
 Sehoz1wnC3cwuWQbKrOPR+QPurz1kjTpJ6pYiTE41pgsyqQfOyhhAYAYSYFsyClce5
 jWEeQFqT2avTg==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 08 Feb 2022 19:05:32 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 8 Feb 2022 19:05:29 +0100
Message-ID: <30606_1644343535_6202B0EF_30606_119_1_9d53b11cbc235d413367e901185b296b2c82b589.1644343524.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644343524.git.yann.morin@orange.com>
References: <cover.1644343524.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX103.corporate.adroot.infra.ftgroup (10.115.26.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 2/3] package/pkg-golang: allow packages to
 define download environment
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Currently, the golang infrastructure forcibly sets the package _DL_ENV
variable, instead of appending to it, which prevents packages from
providing their own download environment variables.

We fix that by using an append-assignment.

Note: when introduced, that variable was explicitly not documented, and
is supposed to only be used by packages infrastructures. However, that
variable exists, and it can be (ab)used by br2-external packages (most
probably to ill effects, but heh!). We anyway leave it undocumented,
like _ROOTFS_PRE_CMD_HOOKS.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Stewart <christian@paral.in>
Cc: Anisse Astier <anisse@astier.eu>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 35bcb1673b..69eae02830 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -83,7 +83,7 @@ endef
 $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 
 $(2)_DOWNLOAD_POST_PROCESS = go
-$(2)_DL_ENV = \
+$(2)_DL_ENV += \
 	$(HOST_GO_COMMON_ENV) \
 	GOPROXY=direct \
 	BR_GOMOD=$$($(2)_GOMOD)
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
