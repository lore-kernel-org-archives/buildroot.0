Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D97C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 18:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D546560BC6;
	Tue,  8 Feb 2022 18:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lzsqp1YJh5GU; Tue,  8 Feb 2022 18:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CA0F60B88;
	Tue,  8 Feb 2022 18:05:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A12591BF2AF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 18:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F62960B88
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 18:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbF7p_Be0B7A for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 18:05:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5307607B0
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 18:05:34 +0000 (UTC)
Received: from opfedar03.francetelecom.fr (unknown [xx.xx.xx.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by opfedar26.francetelecom.fr (ESMTP service) with ESMTPS id 4JtWC05cw1zFq6V; 
 Tue,  8 Feb 2022 19:05:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644343532;
 bh=tS/oHQrqdGSDpThAv0jIDF3EEaNt26t2DK2Oqy+7t5k=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=dbc4+ljYQcSYxpAD2O2vS2V5QsHQq3pH5K2Rc9WpALGo7L/fR3+Cx4rkXI1pAvRHB
 xryEngT5UGrNVyzLtPS+p9FLBSjQ81PnYDbBT8EvfSgDboru9riKZELIQke///NYSD
 TBuGy3UUTyClCXrh8nFoTfy+7nnMBkuI2IDMEtljsR0hEpfnIKT+WfYCPcf3Yg48++
 jdg+vaJ/No/sRsbn1Dxs/aWmUUr42lwmPiRsieB9KqYSERc2SiUMVbLpPjQGBqT74M
 D9oS71cdzveoUdex0iehbv95lkOGCYrmwrCEUNNs6b28nC4/QwnaiULgPbBxDnhY3f
 /4i54mHo1whLg==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 08 Feb 2022 19:05:30 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 8 Feb 2022 19:05:28 +0100
Message-ID: <22854_1644343532_6202B0EC_22854_63_1_181af9d04551529f049a322dff7a44684beeabfc.1644343524.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644343524.git.yann.morin@orange.com>
References: <cover.1644343524.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX203.corporate.adroot.infra.ftgroup (10.115.26.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 1/3] package/pkg-cargo: allow packages to define
 download environment
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Currently, the cargo infrastructure forcibly sets the package _DL_ENV
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
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index e74a8358bc..66bea513e0 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -69,7 +69,7 @@ define inner-cargo-package
 $(2)_DOWNLOAD_DEPENDENCIES += host-rustc
 
 $(2)_DOWNLOAD_POST_PROCESS = cargo
-$(2)_DL_ENV = CARGO_HOME=$$(HOST_DIR)/share/cargo
+$(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
 
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE.
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
