Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C378C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 15:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5A0940243;
	Mon,  7 Mar 2022 15:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBqEOayv3qOQ; Mon,  7 Mar 2022 15:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0250940200;
	Mon,  7 Mar 2022 15:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B2CB1BF313
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 15:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB80813E2
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 15:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3cvpdZCd-Mt0 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 15:43:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97B0C813B1
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 15:43:01 +0000 (UTC)
Received: from opfedar00.francetelecom.fr (unknown [xx.xx.xx.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar27.francetelecom.fr (ESMTP service) with ESMTPS id 4KC2m31bN1z2xPV; 
 Mon,  7 Mar 2022 16:42:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1646667779;
 bh=tWpXibZqwpVpFZ1r0AvIvRqivM3rx33RV3VTeKowr4s=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=Vj7QXGLLh/CjMA3mEKtD3wN6LJ/P4/u4lipxNph2GpaBxUjwTlIRb5uMGryglI/Aw
 +jHtSpOZ24ubVUn/UuKlJyEv+t3gzNQgis3aGsdE1mDD0zntmwJtY/8juXU7ox8Xr3
 7FlQS9QnZbfvX0GDoVR9sfip2r48T6pDkpcaQvLmv91/zldMXw8LdqwDmAHjNQUtIw
 o4tuK7uotDU90MBq9xS4V0w7gudQyvuBz34R5Ju/SEStJTDoRgUqPUxPZmJpe4v+Qv
 W4abCBXxJKWXUdvAj3YFRRF9UNpzBXpht84jDwNn4txMGLrVVRBO1aw9WLIufRXIjV
 h4g8vA1jiRyVA==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 07 Mar 2022 16:42:57 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 7 Mar 2022 16:42:56 +0100
Message-ID: <817_1646667779_62262803_817_313_1_9705b574ea82a36b8f676e04876817b58ebb6e3c.1646667776.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH] package/pkg-golang: fix build with per-package
 directories
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

Build with per-package directory is broken, because go is not found in
the PATH, when trying to download and vendor a go package.

This is because FOO_DL_ENV contains $(HOST_GO_COMMON_ENV), which defines
the PATH as PATH=$(BR_PATH). This is correct, except this is expanded at
the time the golang-package macro is evaluated, which means PATH
contains the 'global' BR_PATH, i.e.: $(O)/host/bin:$(O)/host/sbin:...

However, with PPD, this does not yet exist at build time; only the
per-package hoqt directory exists.

We want to have it expanded at the time the recipe is run, so like all
other variables, we need to $$-expand it.

At the same time, also $$-expand two other variables (even though those
are benign, it is better for consistency that they be $$-expanded).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Anisse Astier <anisse@astier.eu>
Cc: Christian Stewart <christian@paral.in>
---
 package/pkg-golang.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index ddefdf1214..f1c5cfd350 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -45,7 +45,7 @@ $(2)_BUILD_OPTS += \
 	-modcacherw \
 	-tags "$$($(2)_TAGS)" \
 	-trimpath \
-	-p $(PARALLEL_JOBS)
+	-p $$(PARALLEL_JOBS)
 
 # Target packages need the Go compiler on the host at download time (for
 # vendoring), and at build and install time.
@@ -86,7 +86,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
-	$(HOST_GO_COMMON_ENV) \
+	$$(HOST_GO_COMMON_ENV) \
 	GOPROXY=direct \
 	BR_GOMOD=$$($(2)_GOMOD)
 
@@ -134,7 +134,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(TARGET_DIR)/usr/bin/$$(d)
+		$$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(TARGET_DIR)/usr/bin/$$(d)
 	)
 endef
 endif
@@ -143,7 +143,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(HOST_DIR)/bin/$$(d)
+		$$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(HOST_DIR)/bin/$$(d)
 	)
 endef
 endif
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
