Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1939C27C55
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 18:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EEB060664;
	Mon, 10 Jun 2024 18:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwWrfMWLL3j5; Mon, 10 Jun 2024 18:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54956608BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54956608BD;
	Mon, 10 Jun 2024 18:20:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 572A71BF3ED
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 18:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 509D540606
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 18:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQLPvafjzv8u for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 18:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F3FF40603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F3FF40603
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F3FF40603
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 18:20:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AIKECF028133
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 13:20:14 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AIKE4p018978
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 13:20:14 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 13:20:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 13:20:14 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AIKElQ044339;
 Mon, 10 Jun 2024 13:20:14 -0500
Date: Mon, 10 Jun 2024 13:20:11 -0500
Message-ID: <20240610-k3-mainline-v1-0-57ec7cfa0bfb@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANtDZ2YC/x3M3QpAQBBA4VfRXJsarJ+8ilxsDCYM7UpK++42l
 9/FOS94dsIe2uQFx7d4OTQiSxMYFqszo4zRkFNuqMoI1wJ3K7qJMjalIWsM1VU5QixOx5M8/60
 DVH4u6EP4APUv2pdkAAAA
To: Bryan Brattlof <bb@ti.com>, Buildroot Mailing List
 <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=bb@ti.com;
 h=from:subject:message-id; bh=klGHotHCW/byr08lVfUq0Lmqa3EbPKu6NfJe+ULJwuM=;
 b=owNCWmg5MUFZJlNZJXdcnwAAcP/////btn9/vry+7Z3f3eon3d17T4/DDPflxn8d3zb1pm8wA
 RsYGJAPU00NPUAA0MjQAA0ABoAAAGmmmgaAAGgDTRoB6j1HqZD1GaJ7Smh6ZQygHqGmjRkMm1AA
 0Bo00MmmgDRoaDJtRoNDRoZA9TQ2owjR6ho0YmnohiaZA0ZAB0NlPUG0mQ000yBiaNMhoZMQDQB
 kyGIYQ0aZBgjQ0ZDQAaNNMJoNGmTQDQAA6Ae0VfnAs76BmQ5yb9ZI1WFQvdd4i+kPnHgCMLD17e
 GIayOpxqK4kLzaKepTefK0vnEImJxGfsz4wRzlsnwR3Ag72baRLzu7OpmxEhLfv+PLRh7AebaNo
 CUUQNOY45/WhlpZpxLuADnRKHnMubKweT6TuEyV/eRZBYRDUTAFTTXEkyTe5R8GSqGYpN3AJj5b
 BVBJGQWvfGCIxY0BJjlLqFWBQ852O9BXlTMh4nsKRG7V++1ZNDwDhL4/rC8gMCGPstTjIxuVgky
 zWyC97UyAtL1FCTz4TOCmlSSkEHupJFD6HBq8cV5a7yVwhHakg56gzkZrCTlcmmLe9A9O/z7JHD
 GIiOkZ9LaXbdw/B7mdXzFIGOqZtgZQAuz9dUZnhtCCCqjQ1yyLcuSF8s6Kbg0Tl0aA1icGtPZKT
 6w7I1D/8XckU4UJAld1yfA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1718043614;
 bh=jGewavSFhPKX530eq0G1dBeRkARBebrxcCoQOQFS0Is=;
 h=From:Subject:Date:To;
 b=mDWqZIOepW0J4PEoQBuDfD7uC/oqJnWJcZ5A8XMZuZjDHVjPY18uy9116GNbqiROT
 DcKrWx1bfEp6QuouMibuWtUPgRe+4QRdwDJEMhirF0x2hcH3TI9qvTus980fsOgsgH
 z4mXSOUA2tvuLEapoLSkIwmd1aXdr/y9xB7iALgw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=mDWqZIOe
Subject: [Buildroot] [PATCH -next 0/2] configs/ti_am6*: move to mainline
 Linux
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

TI heavily encourages developers internally to work with the open source 
community to enable all our SoCs there rather than develop these 
features on our vendor trees. Because of this there are very few 
features or bug fixes in our vendor trees that haven't been sent to the 
project's source.

So for the next Buildroot release I would like to migrate TI's reference 
boards to track the latest Linux release to ensure we will always have 
the latest features and bug fixes for the reference boards and SoCs.

This small series moves the AM62x and AM64x to the latest Linux release.

Thanks for reviewing,
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (2):
      configs/ti_am62x_sk_defconfig: track mainline Linux
      configs/ti_am64x_sk_defconfig: track mainline Linux

 configs/ti_am62x_sk_defconfig | 3 ---
 configs/ti_am64x_sk_defconfig | 5 +----
 2 files changed, 1 insertion(+), 7 deletions(-)
---
base-commit: 035651209f4a975cb5413b3911f5598db73e4822
change-id: 20240610-k3-mainline-8540a440765d

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
