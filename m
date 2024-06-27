Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36958C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 16:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6279A4172F;
	Thu, 27 Jun 2024 16:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFpm-PokqRCC; Thu, 27 Jun 2024 16:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F68341724
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F68341724;
	Thu, 27 Jun 2024 16:09:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD731BF3E8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 16:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AFB060E2D
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 16:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QiY6jDr5o6R for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 16:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A91960704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A91960704
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A91960704
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 16:09:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07ACF24000D;
 Thu, 27 Jun 2024 16:09:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 18:09:08 +0200
Message-Id: <20240627160910.3545859-4-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627160910.3545859-1-kory.maincent@bootlin.com>
References: <20240627160910.3545859-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719504561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ddf5cp0qZswzd7uS3aFTz0WCxjQzsL9BgNlU+SV04DY=;
 b=ZZUq7SCGT9caTqMuDOtCwfg05cdb1N2VjYSy+ODR5bFCubXs1LijHRbTXeGFpyp475pxi3
 V/kYQzqLhSc/oA6hcW9Jq+unaKyy5AFRJvKDB5gLoeGRlV0MUWY1sqxsXftNMJadfBdcs4
 sRFGHLie6v3M0MlCYs+lweZCo2zd+goGxSe6HPfQSuNPx03huOx6YPLxXReThhQgmYpKj0
 Fswhl4Dr0VAPeh69sl3H38bGMrh3Jzv4x0pkoI697cKE7wG9jLYLn40ashzDc5VPOyQKaC
 +Na9sjl/JNZVE78Vo/Mze7idjExRQzvyRTt7Id2byMMFg7K0ZEia0KbqBHmZ9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZZUq7SCG
Subject: [Buildroot] [PATCH v2 3/4] package/python-cbor2: Add support for
 host package
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, thomas.petazzoni@bootlin.com,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the host package to enable future support for
TrustedFirmware-M, which depends on it.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/python-cbor2/python-cbor2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 5040301867..e0e9bfd920 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -12,5 +12,8 @@ PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
+HOST_PYTHON_CBOR2_SETUP_TYPE = pep517
+HOST_PYTHON_CBOR2_DEPENDENCIES += host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
