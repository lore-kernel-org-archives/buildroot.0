Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034F8C30653
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 16:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3877741714;
	Thu, 27 Jun 2024 16:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ho8GYR9kXhfo; Thu, 27 Jun 2024 16:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5524F41702
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5524F41702;
	Thu, 27 Jun 2024 16:09:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47CD31BF3E8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 16:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7E50415E3
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 16:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63aADVKXSKYA for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 16:09:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7015415E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7015415E4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7015415E4
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 16:09:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEA58240006;
 Thu, 27 Jun 2024 16:09:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 18:09:07 +0200
Message-Id: <20240627160910.3545859-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627160910.3545859-1-kory.maincent@bootlin.com>
References: <20240627160910.3545859-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719504560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7jD1Upmc0WOwiPsBsJYBsRVP5JKiOEOaZFCE5ba2oU=;
 b=bFHI861rcmFaAOteGKi42YXC8sa5RLbgI6AiO3rFEoup7w14f5loGDzasC5TaLy4gfWipB
 9xR9B7dkuIe9DqXc/etyZSBuoPC8Cral8T3I6ymvWLyRvvph5ylVQPB+PTzueEKBIKYgG9
 SWRrICfMnPZxC1FDv/YVY0jnWHjpSKmgZRqC9nxruZ5GwUWyqHUcv4YMib7p8hezmwS9jB
 4qk19Gt4sYf1xb8yURkUKqyBqpW3O/M96NPWEJMWF815g8JiXqhf7U4Hp5TncTxuvwQIhl
 KkwW3GfmqgUMgx8p8HzwzzaVKg8sBm/pSm04yku0ZhD2RPTt5LXA3sRarmVa8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bFHI861r
Subject: [Buildroot] [PATCH v2 2/4] package/python-click: Add support for
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
