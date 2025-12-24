Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D5FE77378
	for <buildroot@archiver.kernel.org>; Wed, 24 Dec 2025 15:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A92F58148A;
	Wed, 24 Dec 2025 15:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6T2z-13KWEA; Wed, 24 Dec 2025 15:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB15E8144F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766588956;
	bh=LdXyxCzu670nYG/MFfDhSp1TntSgDb7EQvFsUzrVKR4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=T1v1U8BYKrpoYVDq6/HrpiTpDghpH3+twWbxA2i0eOXJpQocIK5j3dt1xDaXpwJ7F
	 H8dDbV5UAFyobUjskOmvtAC61tFz89nJsPrrQZSAuyBXYT0NlrXR38sUj7EQukZJmk
	 4zW//wYNfuPHMiENZKVPUZg6pFsahYYLFzPNuOHCVYK/VrCm2Xfmh78/0AlsqsU6S/
	 HoVnfm9ZSel8sWHNyH6SgDbBByQeflZRkZdNKhOroqb6t3GwZmzbhKcpdBlBHeWfY9
	 hEJH3ePq35whSa5YQgzHBqBWg0Jl5jEKnqCrEh61vFSVZIcOvv+T7DDsph1u6OP7Hw
	 0m3UVT1/W3kJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB15E8144F;
	Wed, 24 Dec 2025 15:09:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51E87BE
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 15:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43EFC40398
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 15:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ezl1tui9V3X5 for <buildroot@buildroot.org>;
 Wed, 24 Dec 2025 15:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C2C5400C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C2C5400C0
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C2C5400C0
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 15:09:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 22C471A23E5
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 15:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D44786073D;
 Wed, 24 Dec 2025 15:09:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E9DD102F18E1; Wed, 24 Dec 2025 16:09:07 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 24 Dec 2025 16:09:00 +0100
Message-ID: <20251224150901.247846-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766588950; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=E0g37WvGdNiAJD8Gcix4jYggJLvnpd7aX5LkBAOtecI=;
 b=giurb4rcUOga2wketf8+j6IWa6yq8qX+QFGOTOZ5d5mA5PCxWbbx5addYswAxe2jZkSvM6
 gLTT7XD915cVRL5t5Kjz+So6+Cl/lew1A6qhWq68Zp1t2IOes1fBaiktkb4P9N625buKXI
 org7seMOBerNe/XMw2UhVzmJ+ih+VttGpj58uD7Z7RmyzDkWjn+KEQ9NPY+tu7OWqEq9aR
 UsJYSlo3JcjjPQl5CMuoQHY+neNZjqHK39eUll9cizgzJZrfosc9nWQuvwMUbtmChP4Ij1
 y1hw0d22c160PpoC75Tl3sKxg/c9OWRAs8xG+Qasv31OjnYq9NVuH8IBm7qELw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=giurb4rc
Subject: [Buildroot] [PATCH] package/evilwm: convert to generic-package to
 fix build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ./configure script of evilwm is not an autotools-based configure
script, it's an ersatz of configure script that generates a
config.mk. Unfortunately, it assumes that the value passed to --host=
is the prefix of the cross-compiler, which is not necessarily the
case, for example when external toolchains are used in Buildroot.

This causes build failures such as:

make[1]: s390x-buildroot-linux-gnu-gcc: No such file or directory

To fix this issue, we stop using autotools-package and instead
implement a basic generic-package whose configure step simply creates
config.mk with the right variables.

Fixes:

  https://autobuild.buildroot.net/results/25040ce7e94acf8f92c24db895d7dea081de1d7a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/evilwm/evilwm.mk | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
index 78b531095b..5e86e1a00a 100644
--- a/package/evilwm/evilwm.mk
+++ b/package/evilwm/evilwm.mk
@@ -11,11 +11,20 @@ EVILWM_LICENSE_FILES = README
 
 EVILWM_DEPENDENCIES = xlib_libX11 xlib_libXrandr
 
-define EVILWM_INSTALL_XSESSION_FILE
+define EVILWM_CONFIGURE_CMDS
+	echo "CC = $(TARGET_CC)" > $(@D)/config.mk
+	echo "CFLAGS = $(TARGET_CFLAGS)" >> $(@D)/config.mk
+	echo "LDFLAGS = $(TARGET_LDFLAGS)" >> $(@D)/config.mk
+endef
+
+define EVILWM_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define EVILWM_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	$(INSTALL) -m 0755 -D package/evilwm/xsession \
 		$(TARGET_DIR)/root/.xsession
 endef
 
-EVILWM_POST_INSTALL_TARGET_HOOKS += EVILWM_INSTALL_XSESSION_FILE
-
-$(eval $(autotools-package))
+$(eval $(generic-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
