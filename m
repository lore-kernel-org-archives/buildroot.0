Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F67D5B873
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B0BE40B37;
	Mon, 15 Dec 2025 22:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxXBymcRcJsn; Mon, 15 Dec 2025 22:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FB1640B2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839027;
	bh=Ftsxz5FOYuKEjBkvKPB8u/ErBEnO0kP3UnZp69W0mUo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iYK4sKLoVxX11zQKc/RHf8X60kzUSb+Zfq+65mstqFt462RDncQN6UZ5zXRh9Uu7+
	 hG1sL5foAuohPBRMY39gzTKNbaIOR1Q0CMRVVOp+lhr7md4nXUr8PwqvTMAik/hdo8
	 BZbtv+sBb1iXw6nfy8n8gIKrK8bOT3o+EwoxcDCLIx5QM0vm7ujsN5SJomHUbELouz
	 HyXlvdpKEU5az4R4tHiFwajZosWWwjyXlGPZgfaZ0fMppgYiBLPQM16zythXYCuZ07
	 w9GEuYXhdTkOgujSYtWTzHNHCrr6PFmJqVQCbmll9eTSE/Nc1waFVnVM6Df4bRREG4
	 sBVKUpdZ6P7sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FB1640B2A;
	Mon, 15 Dec 2025 22:50:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0382C219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1E9B60EE3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0DVgSl6tuFy for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B16C560F30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B16C560F30
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B16C560F30
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 74587C19D28
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:49:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D807F60664;
 Mon, 15 Dec 2025 22:50:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8D18F119429AE; Mon, 15 Dec 2025 23:50:21 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Dec 2025 23:49:45 +0100
Message-ID: <20251215224952.1253359-14-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839022; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=/+nvqBs9OYZmG8Foo3CnwDAp4CQj6Ta+4OILq2eo084=;
 b=Idd60rRCqlFypRH7+Pb2OgRC8vP6SXfhEstvNXFkh3Z4ysVvZVTrI99iEHYpdgih1WbKBg
 Boq6DNoSEHCWmU7kDKv3oTRiYPy2z7Fg3FXIm3jJvMAwZ7b3ziJOWSUCa95DBgRjSvC0Mk
 mbcO5Mi3adse/7fQXHpwzoE2X4O0ufuERdEzLr90qah3MftROB2CX7heVWiWVe31wl5RQo
 KVJcqCRGyyoOIBPIV4XLBCeekrti3i3ugEUd7kmqVV10A/9ln4NSqydjWVgQ+0xniDmsZj
 MIf11LZkcvoveB8g53FOpVmalZl26KfUiyvdat6OkAuOUEwJXvTWzXK2cajIKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Idd60rRC
Subject: [Buildroot] [PATCH 13/13] package/pkg-generic.mk: remove trace of
 rpi-userland
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that the package is removed, having a trace of it in a comment is
no longer very useful.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0a1e29a04e..dd440e4062 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -400,7 +400,7 @@ $(BUILD_DIR)/%/.stamp_dircleaned:
 # argument 3 is the lower-case name of the provider
 #
 # example:
-#   $(call virt-provides-single,libegl,LIBEGL,rpi-userland)
+#   $(call virt-provides-single,libegl,LIBEGL,imx-gpu-viv)
 ################################################################################
 define virt-provides-single
 ifneq ($$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))),$(3))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
