Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42355D15D8C
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 13:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6111E80D92;
	Mon, 21 Oct 2024 13:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElhTu14g6kd2; Mon, 21 Oct 2024 13:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A9A80D8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A9A80D8D;
	Mon, 21 Oct 2024 13:26:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBE75AF2
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 13:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BADA5607AF
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 13:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xce_mRrIiwx1 for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 13:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6DFC607A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6DFC607A8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6DFC607A8
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 13:26:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A4DC6000E;
 Mon, 21 Oct 2024 13:26:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Oct 2024 13:26:33 +0000
Message-Id: <20241021132634.2435063-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021132634.2435063-1-kory.maincent@bootlin.com>
References: <20241021132634.2435063-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729517202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7jD1Upmc0WOwiPsBsJYBsRVP5JKiOEOaZFCE5ba2oU=;
 b=YVLh3Ljp1ZHCdiKzzDvzFwplVML1uyqkojgrkwC16FoQM61Vwt5EkzKUHulf5krgyvV72Z
 Z8ckIcpbuQzddKTjyZnTfa+NPte9To4f1qkVxdCB80RC0X199eplzWBXlry9ZCeV0EqVEG
 NlxkshPsoc6Lr6cW6zkf3TlrJfY/zhY8XkawmUyN3SbnG8cX863T7hadXZAGkw7wWfYhwP
 /EyGWvdsZ+O3gFwNUDnO4sR0Qd5sINDwOVPh3MSp982RnP3bMJnHDbzndZlzZprGjrr3A3
 nBb2TaNmNIDKz8yGNVxaFjUootnLWs5AJ2nU6ygxycipJjjTNA7YeoJOehZdUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YVLh3Ljp
Subject: [Buildroot] [PATCH v7 2/3] package/python-click: Add support for
 host package
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
 package/python-click/python-click.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 0e29ff034e..3223ab39ce 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -12,3 +12,4 @@ PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
 PYTHON_CLICK_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
