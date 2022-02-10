Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15A4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 15:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA06F408C1;
	Thu, 10 Feb 2022 15:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJEhQ81lpydW; Thu, 10 Feb 2022 15:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AFB5408D4;
	Thu, 10 Feb 2022 15:29:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBC641BF3DB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B281040393
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XoibiU2wENN3 for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 15:29:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BC954055F
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 15:29:32 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar21.francetelecom.fr (ESMTP service) with ESMTPS id 4Jvgf21wzkz7tkM; 
 Thu, 10 Feb 2022 16:29:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644506970;
 bh=9ReCXlpaCme9o6bQINqxrhK/ZBrBPbHbiY5zq2RzUUc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=GrgyRCUd6wm4C9v47iZkghQXnyPR/EhhEPoQY31vY2bapt/nY0e1Yi+W11UeK5mjH
 mPBqMoRt++ashGYeX5ZODbag2ab2fLSqrI0YV6agSk7dgmkX1R7aj8EqxcgY+2Bref
 sHTWXkWRxH0nMKJ0droIpuaUuZiSgtLpT9XyQY1jdsH3/RY0nkL9tzbqveT6LwRR/D
 GWNgi67r3YjZJeIHjHBz5HtdJIQ1m4NJUq6MQcQLRVT3w07rJsRydHBrwp3iaP7yp6
 rKn4lDI2bQfUUeISUD8tfCExUGLWOmrMk8yBqtlsr4tDJ4qgKkgLUvva1N/M0AFnbE
 /IIq1gF2Wm0SA==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 16:29:28 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 10 Feb 2022 16:29:24 +0100
Message-ID: <19116_1644506970_62052F5A_19116_77_1_cb2a6466cea018c4bf8b8877140a9f389bb7918f.1644506959.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644506959.git.yann.morin@orange.com>
References: <cover.1644506959.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX307.corporate.adroot.infra.ftgroup
 (10.115.27.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 1/5 v3] package/pkg-cargo: allow packages to
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
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
