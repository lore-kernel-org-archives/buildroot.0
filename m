Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013EAC27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 08:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9828C42EC2;
	Thu, 20 Jun 2024 08:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VufbIau0Zv-t; Thu, 20 Jun 2024 08:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D12442EC5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D12442EC5;
	Thu, 20 Jun 2024 08:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 195781BF488
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 08:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13C9881407
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 08:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBQU2mDdtrIQ for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 08:42:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BCB081354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BCB081354
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BCB081354
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 08:42:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id AA15BC7A9B
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 08:39:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A452C240005;
 Thu, 20 Jun 2024 08:39:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 10:39:21 +0200
Message-Id: <20240620083924.2104785-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620083924.2104785-1-kory.maincent@bootlin.com>
References: <20240620083924.2104785-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718872772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HoIhn13OR/sFqoYWsbe8Xj84GdEStwQENaLEFpWAr4=;
 b=PQw6KIfZ/cUaQKYlTN01E71G8uJ9GkUG5fL6S+/N4YPachsp3rT04I1f+SHV5F/jhEISOf
 I9i8VnB4ANqxilgFSvHW4sxfSNZWXPu0DwG/Dc9lINmgMaMy+P8WETB5NV9aNmgk85YRq3
 HxOMHr1oM1w0HrDMFIjNJ/vkrAEuHLs5U3RcMuNTgPKaIsoWV7SUABvoWHLTbicVeS1lyg
 xaNRnikzngRv21CQh7i06FOLUllRCG3b4dwiyfsjhCAvyklvVpM9VLJh/zkJSygEM92IqC
 608wpfhPFLvYOQVm29w/n4IVbPpqCB8TzjP3278CjKXidEkezh3SV/j2EKEPBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PQw6KIfZ
Subject: [Buildroot] [PATCH 1/4] package/python-intelhex: Add support for
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
 package/python-intelhex/python-intelhex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-intelhex/python-intelhex.mk b/package/python-intelhex/python-intelhex.mk
index cc8b973f0f..56f758e643 100644
--- a/package/python-intelhex/python-intelhex.mk
+++ b/package/python-intelhex/python-intelhex.mk
@@ -12,3 +12,4 @@ PYTHON_INTELHEX_LICENSE = BSD-3-Clause
 PYTHON_INTELHEX_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
