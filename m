Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A47C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF1C610E3;
	Thu, 19 Jan 2023 10:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF1C610E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0cgPbohCejPC; Thu, 19 Jan 2023 10:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6757860C20;
	Thu, 19 Jan 2023 10:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6757860C20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF20D1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C72E341848
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C72E341848
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLe-43SVaodx for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:18:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 889A341862
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 889A341862
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQsa/RM6BsRXkihc8f6I+z2R9Obi1yXS0REFAoGwuDCnLUamiwIopFil2CQMY9LPR8GjAosoEdXyVrS3otipjQ0fzzELDpcxh88tggpmzXwsBCQHXfZOFSgAvjZdReg0UlrvN5b9o/aerzrxsNy6Zm/JM2Xmhh3CrF0+7qQz6nmKgusz2mwXIzM7IatiwC2OGKijs5vkUXZKCu0fSzrd0AwoNaPfUP/y7QOF0QISl9tPR0xFIBLbAjqBWqlBSfa6/FlTl1C6n5A0ukHpuYryNrPhFuPBgW+Rc2X4Pvc0oQsOsbFsEvoO+hBHxE1+MU9gay7rTpWhY1Ba947TuFenbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I3KHVmtCWLOBGzUtTyzmprwKNi0r1muL8cuJ3wZ7sI=;
 b=bOZOI2QC+4jGfxc9zU6ejcVdp8tOBoVJW5iLxj2b1yTvoHSVHHMQCXxNzXHyjOoXtwFaaXmx8vZWqhjujEwfGkvvhWArvhXL8NqyHuT6SrYn2U7Bety9vEootbPSx+she5ZybVnsK3W+SnrSiLdaEKUVPrdRA0X8GCt/NcWgsbzr0ISKDXlB+/6bK6dLlJAHX8KcjGkLbjOGHt0PLAS94czi+xuO5R0PGObqjNhzV/zCL90lNnVX6fMAxTev7yxCqQyXcVSftQGhJ28HCZTBhbxoy1Z4i/NpYX989evuLzpbx1JyVyXkJlB9zthqPKbSiS2TINmOGzqoi2WxFhx8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PRAP190MB1716.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:27a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:18:11 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:18:11 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 45/45] package/vte: switch to https download
Thread-Index: AQHZK+6c6qgy4Ke3SUGZDtE/GG1wYg==
Date: Thu, 19 Jan 2023 10:18:11 +0000
Message-ID: <VI1P190MB0493E25A7412E589EDB4F8169FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PRAP190MB1716:EE_
x-ms-office365-filtering-correlation-id: 882e2ce8-2461-49ff-c782-08dafa0677ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qjf9u4mpAM4iUtyYcc6AC4h7+eygSRgO2UpJnez4XG75rqhKHHTDHyqe2bOLEhlOMwFxMSQtqIIW51jfdWxrL6chl88/TF0fgcMrUjYSS6IXq6MffcF/jRcs4qPy+LRfTOdytZx/4OjiKmVE8UXVGaTgsV9F5fA2eewP8u0mZ4k6nBYNiMojYBmPC8gQazSPIQ1l8kbVyXenQzzDBUbrHOJBZbLJsyvKUGnM6zKE6FEeTvYKeYo0y9/0aphnGFR5uZeaanuGvmmOOXRUySqgYZWygUr3XAi2tP+XZ2GNx4ZVyQHbZgbncmyuslkf896GHrPB8CLh4GdRUf5y1tzbh0Xn4L47hs4MJBV9Q1zFYMggZvYYiQplfrkVQ2jIXyGHbCQEnrtwwH1Uy65UvdklTSO5L86zfchAyIIAaopey1DMsKGQLUcM2p846T+/VISz0cudmvUZmk9ZVqgEOOU8UhxnwwfYtwqX0aDS94r5PFXpMXpsrIBSEZNvFYwY4UXvF7FcA38wmAJ7AVukXfSy7E+1NejSQy1p9dhfFOc+VvKpT8g3KnNflMsP1RNLBiy8WmXuUkUGK24rEC65Jer9+NDU6t6MuSsEg9zhejtM2ryfhxkVFI/T4PjUm5woBg0k8N8cLLWTq4DRjwMWMFOs3HhJQ2K+HzreE8u2OC3gzwprRUYzwtWMZdG3puc4VZ6lp9miWH51twvLZ52eHReaJfqau26NmeQ8xajpuvbhB18=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39840400004)(396003)(366004)(451199015)(478600001)(8676002)(6916009)(9686003)(26005)(52536014)(86362001)(41300700001)(83380400001)(966005)(71200400001)(8936002)(186003)(7696005)(5660300002)(38100700002)(33656002)(6506007)(316002)(122000001)(76116006)(64756008)(66446008)(66946007)(38070700005)(66556008)(66476007)(2906002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dhgT6Rg2djreBQ3dMYFU+Q7UijDUW1QpBvAdOpzmHMFLAnN9QGcpgEtvls?=
 =?iso-8859-1?Q?i/KlJokrBBmo+m/1JtkFPvvQDmAMw2mqSQ5BFZfmzmZZHhG6bNGNdn5hqP?=
 =?iso-8859-1?Q?VPH1+WPqN2UyMy6KenPoXvZjM9Wd+YDIpY3fbxjRdtChYhv4W5Em/hr8HS?=
 =?iso-8859-1?Q?DC3vOA5gVVHllmaGzFcAuYf7PoIbiegwsuhCmNLjAjkbxPWd7alK2wXCv8?=
 =?iso-8859-1?Q?QGAyg3NxPiXiN3IMgOp86dxmgRXbrFIyPoEhSgTVMa/L04Dp7juSSUyp8L?=
 =?iso-8859-1?Q?5qeCQ0fZAi8pSiM/auES2lNXzb7Yn/s3lS8v2DAUOsG+w96x9SA99tpdVk?=
 =?iso-8859-1?Q?3n03nhY2aw9uoVhT1Aif+CemTA0xhBVadquTbEkcQoflTPQ1fviZxHSLkJ?=
 =?iso-8859-1?Q?eQ/Sq8qLCPVE4aEo6XH4tFXHxv3UgbGmswcpZDFFp52TaGwNmHRAe/1lS2?=
 =?iso-8859-1?Q?6fZxhCDrFtYrpHi/Gx2xJ3WMSjvdy81dxTqCMnnU/xC8ZRJ0PH85HMSCPj?=
 =?iso-8859-1?Q?L9cYZk2e7fbdNR51v8LkKcgbjbf5qyjz7zFmsSVeMCRksTGZ7CpeigNHnn?=
 =?iso-8859-1?Q?i+0je0fAJSiCHnsu8inpan+LlbAROWykFLMPEcfQNpxBmVog1UGnoArlkH?=
 =?iso-8859-1?Q?j6gq7NRm3jk49TQx5J1L5j+N5xcoV3GeNoI4zTlmPOSFawaXqm5c6mjm+i?=
 =?iso-8859-1?Q?PPnVYWd81OgEd6paEK2hINWpkhVZJT0n8EClhptKgwnHkZ58DlURBtpkxS?=
 =?iso-8859-1?Q?+srvZ9kYf95Teq56aSu9O88PpcwI4AfQxluGeUvCzloCavPJ0F1a6lu3L5?=
 =?iso-8859-1?Q?bhK00DJLualaSTi9zKjIM9N0j7GYrEbNJ0GbaiDb9lOhPTn1SfCD8YFobz?=
 =?iso-8859-1?Q?kEINJ9X1UgaVNQYIfUDs5MvhRfWzrEbaQwOA+DoHHgZx6F/OdtxXtoxR/d?=
 =?iso-8859-1?Q?qzXXTClFvpu0HfYUwmhZN3N7CKgmMjb/CVcjYEfJ4sBWleV2202UvaoV3z?=
 =?iso-8859-1?Q?/EsD8DvDYwbUAIyWmybyUHK4fi9SEvVUc0VGIrhZMqjUzJ8yaCaMmQEWUc?=
 =?iso-8859-1?Q?CP3amGLAeNi72DRGkrMT972429w2juwwXq3X7qk+yIgFMY+GBmQHEg9uyT?=
 =?iso-8859-1?Q?mpWiOjoQ4zdjIfCoSwqO6RnbgcODeVBDrZx/rrYV5OoIXrTUbjVMZjOEaT?=
 =?iso-8859-1?Q?2Ya0hSh+anOKKIUs6NAQejXhcAln4AsiNeELauP+NwgvAV33jjZt5vLOne?=
 =?iso-8859-1?Q?6B3QaDtJvURuL0N+zApv33Mdf7RuoLYaSwYs31gupTLXEDnggS/xXZ7abo?=
 =?iso-8859-1?Q?0UaqmFKNhBw60kEVUyEcZ96/2FTuFX35XI5PMe76YLMLqm1QARj5J11EwH?=
 =?iso-8859-1?Q?byQIYQX8ELRtvEmMFbrk5+w7OPiZNpgFowqR53AoZQ9SpECKtMrAND6jot?=
 =?iso-8859-1?Q?lN3PM6n9Z3HQztFeFegMlM88h2no9CcYyHFhZ7Y8I2ryQDqWF6xYovqsN8?=
 =?iso-8859-1?Q?dmCN6Fqsqvy21Oao2r44CqrjTh6feVCa/pM/GNwMefTDgKCF1vYCnNrUZM?=
 =?iso-8859-1?Q?D/eqvdswDlipdgchQA4UR8S8CQ2eMD5K4unI37RslMYKA5/5cgMrxAd1Fi?=
 =?iso-8859-1?Q?0aH4QvqDxbJrY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 882e2ce8-2461-49ff-c782-08dafa0677ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:18:11.0750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZWUjPqpuPaepikfi3xevuGQiss1K8A9YvjIs+HU3WmQsfDJdsvLbJyS0fTqw6WZOxbPIWpkMfOOGKSLcLoRaTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP190MB1716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3I3KHVmtCWLOBGzUtTyzmprwKNi0r1muL8cuJ3wZ7sI=;
 b=fvTPjsxphQErZsGmL/o6iS08u+ALNd5flb69VQtn4iki5+uKU+hpF+H8FHq4zk9WZY9ZwbPUUNAqOyQBlHC4dYTZmCm5KIVDZ/BW3sXMOQ99MM0figKrwWBdF3GWz7MWaeK/FxpwNRlPrcBn/O4V0bTXreDuFsFPDCVMzvQPMxE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=fvTPjsxp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 45/45] package/vte: switch to https download
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
 package/vte/vte.hash | 2 +-
 package/vte/vte.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vte/vte.hash b/package/vte/vte.hash
index 90818d31f3..8c84dfce1a 100644
--- a/package/vte/vte.hash
+++ b/package/vte/vte.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/vte/0.66/vte-0.66.2.sha256sum
+# Hash from: https://download.gnome.org/sources/vte/0.66/vte-0.66.2.sha256sum
 sha256  e89974673a72a0a06edac6d17830b82bb124decf0cb3b52cebc92ec3ff04d976  vte-0.66.2.tar.xz
 
 # Hash for license file:
diff --git a/package/vte/vte.mk b/package/vte/vte.mk
index ceb2f09d67..a68d96aa12 100644
--- a/package/vte/vte.mk
+++ b/package/vte/vte.mk
@@ -7,7 +7,7 @@
 VTE_VERSION_MAJOR = 0.66
 VTE_VERSION = $(VTE_VERSION_MAJOR).2
 VTE_SOURCE = vte-$(VTE_VERSION).tar.xz
-VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/$(VTE_VERSION_MAJOR)
+VTE_SITE = https://download.gnome.org/sources/vte/$(VTE_VERSION_MAJOR)
 VTE_DEPENDENCIES = host-pkgconf libgtk3 pcre2 $(TARGET_NLS_DEPENDENCIES)
 VTE_LICENSE = LGPL-3.0+
 VTE_LICENSE_FILES = COPYING.LGPL3
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
