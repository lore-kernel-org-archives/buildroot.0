Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7ECC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8993404D5;
	Thu, 19 Jan 2023 10:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8993404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBqqY70OLXiW; Thu, 19 Jan 2023 10:04:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3542B40377;
	Thu, 19 Jan 2023 10:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3542B40377
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 230511BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1DCF82241
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1DCF82241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pM8HYA3sFImH for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:04:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3FE3821E1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3FE3821E1
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:04:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPLcRa5SmyndqhHdc0smyaEvwOMhhpTAqemsifIVtNNaj+7yZUakJLtuEYQlbNCfX81axCvUIaYpe5R5Ddusk+t3Nx0Kg6G2pWIPd2Vs8tONehdvdlixmG7iPlzxvhhwt2MdHpsfrlVRmbW1iBfmr3RrmhTWw6Hj255RfYgLqcFQdW9kpPve9IMTtfZDAdYwcPyYQQCghvnlQkdNfx/x1wl4Oqbx0WBeAUokJ5kV5zrj8HVa/BPYN5uozlni1SQa9Ck/xR+8fwPPwXLSgmAAjImf77Qj8PxfS3vnouhxcO13S9IyFkSFunK0nEsvMfuzd7XH6+Jagzdb1PnnZ/YGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyJriOsstsXi8hEPrbMV453uIMDyuKwOuH7YGHs34L8=;
 b=bL+jMQpMnvz/2UtESye7GWgKHSNnelmBz4qq3suqLbXOIO1NjW+W8NJSjl6LE7tt1bkfjGe6dyl7rD3jRWwOLF3qsMAsemHMfR9XdtBKb1gnl/5nLkNwP9DNr6dx0Lun9iYK17jTcbq/OmdlSIStK2aH7Y4W6DBgWyJqu22g6pIPfGNTYaDpil/2VLnGPjgFqFkRSBNBdB0QYUPo/xeuuvYORvpRVXBSkTK34fzSnvGIdKofBxW4kDarwmg2XAEmKLJbgO4oCzr4A72+eDiMd7WtKeD1KdqFqQp52+Nv83pXBe2vSZNhzs2lFw3S010K5bc5ULruf8XmkXeVZjhX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS8P190MB1111.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:04:27 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:04:27 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 20/45] package/gcr: switch to https download
Thread-Index: AQHZK+vI8JNC/tsq802vGujIRPuKLQ==
Date: Thu, 19 Jan 2023 10:04:27 +0000
Message-ID: <VI1P190MB0493D6278BEA947FF47C20C79FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS8P190MB1111:EE_
x-ms-office365-filtering-correlation-id: b67faca3-0dbb-4e1b-3213-08dafa048c8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M5wu6Dz9dIbHE/oOmvmivAKi6QBrUZ6GzUn/Na+aQ1p7wb+xr7kfuWWTB0lNmSKHAsx2r6ffGCX++0PvoPH6Z4rEMmdgG/H3Y8oATtklWUEEagzLtOKgK56GePy0JQ3sjnpdIJrSnUmahtc7K4uIhtVvnDxAd/Kx72vkr9C2iJpTtv98w7/pNu9+sYextlmc50bBKxH5Z91x8/+Gwrn9VSwVFbMc9z8BuMcsLYwHCilITF6qyTMAnMmLB2AxoXZgLqfLv60jbS3iel4kvXVfuCla1Ex6kMVVg53Z67a20DA1YhFyMPADSyxvW4UQbFoXwbnHPd5GRiK7c70v4gwWZPTBDXz2CSC9JzhVeR1qd4aK4fGg7OHWpEoI5/hhPpxtie6prnvuJqGYogcjzN+NoJl8wQJ5ceRU/Oy086XwRjkvt263xTRXt53a5zZDCN3CQOudVk72GQyJcNpT3s2Oboo9R+u89BXadJt7som5RHxdtuz315D2A4aGAsv8U+V/JyKAzgf1wFIsCAe3nVN1qLxUdszgbimMK8X8+Tqua7hWc3MTN/kJCfQYFhteea/DmLam9CVx9Ff/SKdz1ycrDgSpSE88MecwVAVs/ERbj/845eRByZqZ7St7P0OCG9xjY4+IyDQxyuXHIkV9MvDuynxvLEbJUIwJCTxYTYqad7+9FpYgb+xA92obrpAJ/xoU8M/NeYvBwAufCQ4TwWYFllHK9wDeYyDPjZkY4pCp0Yk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39840400004)(136003)(396003)(366004)(451199015)(83380400001)(52536014)(8936002)(41300700001)(316002)(6916009)(64756008)(66476007)(76116006)(8676002)(66946007)(66556008)(66446008)(38070700005)(86362001)(55016003)(2906002)(5660300002)(38100700002)(7696005)(71200400001)(6506007)(9686003)(186003)(26005)(966005)(122000001)(478600001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sJJsam86pX5a1pcaRib9WiS5maEFA/vQpbm8pnJMOE6fOcpneF8nWzMLPU?=
 =?iso-8859-1?Q?SH+vndVqdK5kU8R1iMS06TQzU2t3zaKTvo2f62AlAqOd+9fN2sC/FuxoCP?=
 =?iso-8859-1?Q?Z458cTVxzQ6bTvB2OJYvN8ImUbjwj9Fmbzh3oBN/4iuLlM6fu+HudKSTHP?=
 =?iso-8859-1?Q?V2Rl1MKlYjHfGHdLLVnGWhN1X9+YvIIPOq+eHGXAcIqK8BBDYY9Vth/Gss?=
 =?iso-8859-1?Q?4fBrwMylNQHY1DQ6ukdNHtxhQDFTCSjxEjXSQAb6KNO2AXnqH0Q5muJW3D?=
 =?iso-8859-1?Q?KxsSBRjs0tUOgu5wcZGgwy36/dBIpuNCJhk4Sr+s2MCU2RZkksCG4qRDQD?=
 =?iso-8859-1?Q?6JT5XVfRJEl1niek6oE+RwZHGzeCLXX0gaQDWSJuUTpgFNE83I3CwslGvY?=
 =?iso-8859-1?Q?7+nAsN9JZbFP76MxwKXLcJ5tGsLSZREma9hQHZmnrCjtPD5cc3bwEELQbY?=
 =?iso-8859-1?Q?SWhkGyETatih1BQtks7g1nXLBdF7I22cDojvpFg9Aq4kSj7pUGh67COe1N?=
 =?iso-8859-1?Q?XTLP2y8Ktg+1V1ujvk5w7C7qZehX/6cUyAoYTMqctixZdv5EtqUZiXMk8s?=
 =?iso-8859-1?Q?u3h1Z8ATyc4YDzCS2yY3HqQr151eecMFZ7EgO7DYgmZbhgos4E5e+Td/q4?=
 =?iso-8859-1?Q?bbterRdTRd8t3XDgd81RS/wJ725bidFH9U9JBNAKjPndlKwkX1mmphHvYH?=
 =?iso-8859-1?Q?HxQ8124ahI+XQt3guOxq8B+8Fqgd0yxUGW2+q5galLkgQZKD7GDvCBTJHc?=
 =?iso-8859-1?Q?jwes7ihznmy+QojcPdGo6I3G93bFE2/V9Xsk7xScyAUAqIsxw0NIndndx4?=
 =?iso-8859-1?Q?8UGBcSwLVskibsUUzg6PzR4mABZN0lBUdin8QILJd1JsYZ049iuHUvFwUS?=
 =?iso-8859-1?Q?zEL3aeVQRlkB3y1L2OaCnWlE8J5na1pbOPYi1/6BidKkiOa4tmearXOsZt?=
 =?iso-8859-1?Q?9TLJxfIVG8LTi6VWMy/74iIpbFsBw0Y/bApDmA5WB+BFBApgvV/oPXN5wJ?=
 =?iso-8859-1?Q?nkFhaVQtooLTFCZVJdizGFnCk8O8Z1NnhWnexrFCY9UHG68lTgLBwotS4J?=
 =?iso-8859-1?Q?fUnxkHZ0BzIKMJV2gInaBq+H1Fuvg7jNmcGRKo2DB1xYJ/39ISoUIFaj99?=
 =?iso-8859-1?Q?ve+qMiJBEDknzut6qSNXOMc7myxowLfhPIi2ounhJj/gzMgaY2u+tzvGwH?=
 =?iso-8859-1?Q?3TloujeLUFVlwwqsYInZnG3RVk/rM9WFkm82xUyCOtws19TQU5YPH0kEfW?=
 =?iso-8859-1?Q?+4khY3Q69Ycs9pHeKArdCscd5u2XytTT1z8eCGBcmVyzEcOf9Kwet9ITVu?=
 =?iso-8859-1?Q?I3XG69y6oZs4uHJo37ybWZqdZg9BRYluNtQsa+Zye2E+mQDIvc42t0/OMy?=
 =?iso-8859-1?Q?7k4JsbOs4eY1RJevR+TS3iHEVkkH4un0jH+Id3N31al36dVOP7p9s6Z5wJ?=
 =?iso-8859-1?Q?gVxseVWbAM84pTLvAsi+aKDoGtLcYdP6ZjMprg2yGInjKu+m3xDBlNiv3S?=
 =?iso-8859-1?Q?pDUL7g6tqmldLgldqFyksqqgP3mM4MYgkqxAbiHOVbJZ7ZRy+tQytMjcnK?=
 =?iso-8859-1?Q?dJEkZ5ppABR1uuzq7wohdl745bM9aaKYPo50N1DtJw/h/9zxGcCh2dDA+B?=
 =?iso-8859-1?Q?gtQiyWD5Xtq7k=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b67faca3-0dbb-4e1b-3213-08dafa048c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:04:27.0729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nu7Y3ymbRGMWyQiBJbZ7qTQ1fAlg51+j5yVuv0W2+RtO5CxfmFAwnTAMKItkDvRxopFROwqDqpqiIk/omCU38Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyJriOsstsXi8hEPrbMV453uIMDyuKwOuH7YGHs34L8=;
 b=ir9nr+5632OZu0bwGq9B9yg6MI+qAJmAStccdVIPPrd0IAZv0mfd0EnelghsYbn4lM3naurteQh3fg61OkSXH23zHg5aU1OQeGxP+UmwBGrlaD5IHg1jpwJjC8EwPeFc+PBtuUgI04hKbbnbIeacxJozWml8W2kKD3O4/vFjjzY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=ir9nr+56
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 20/45] package/gcr: switch to https download
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/gcr/gcr.hash | 2 +-
 package/gcr/gcr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcr/gcr.hash b/package/gcr/gcr.hash
index e6074a9991..f6cc44e97d 100644
--- a/package/gcr/gcr.hash
+++ b/package/gcr/gcr.hash
@@ -1,3 +1,3 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.40/gcr-3.40.0.sha256sum
+# From https://download.gnome.org/sources/gcr/3.40/gcr-3.40.0.sha256sum
 sha256  b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5  gcr-3.40.0.tar.xz
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index d479de82d3..3a8c01729f 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -6,7 +6,7 @@
 
 GCR_VERSION_MAJOR = 3.40
 GCR_VERSION = $(GCR_VERSION_MAJOR).0
-GCR_SITE = http://ftp.acc.umu.se/pub/gnome/sources/gcr/$(GCR_VERSION_MAJOR)
+GCR_SITE = https://download.gnome.org/sources/gcr/$(GCR_VERSION_MAJOR)
 GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
 GCR_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
