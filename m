Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC487C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E0F1404D5;
	Thu, 19 Jan 2023 09:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E0F1404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsgiAiGeXytq; Thu, 19 Jan 2023 09:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A16C40AD5;
	Thu, 19 Jan 2023 09:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A16C40AD5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF281BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF06F60A46
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF06F60A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWLmTvuPoh38 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:54:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6AAE60A68
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2082.outbound.protection.outlook.com [40.107.247.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6AAE60A68
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:54:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5pTaZbod1HFsFXQRh7WcHls6NLOfQEZ1LRA5zcLRsYsZ0ITyMeMy1fWEcqbkfVC61fpA0fRr9qy83exoSYXBkKzSvk1Hn9uDipWu8vBBI77XkWwhDQGuhIW/6Nnog2LE4riqCHcl2eCR68J/2fV/m2YNQ8mMAHZQkjiw9MmhzH/c3Xz1VVFCbxE3sV4CIYwSCpO9uHLhv+G1Jh6beccWVf+V1ky5H0v2Vprpa+1X0pFx10TWNH7zUg/s+HvKtn3pSR96GKW0Wt/sSe2nHVRVDRabiPzGB4ROjBgn8wcEAlHVXB1dlL8Y5eixD4h6j/p+xvizykRbA1tP25TIpmW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCJy3RYRrJoh7eF3z7Zh1V0P7Q5hm14K/i4s/n4U/Cc=;
 b=jTOV10c0z12lDondXrQN2DjzlSkC1d5sHLNOucZbv2EzCNrF3LKe2ZtDXIs8odM/nXPSsTrW+SGGYBj9d0AgLP2HioVSr4DRdZzoz8faNQ8iy9g2S0MYjh3knDKuo0Jwv+MbtdHd9Y6TMmEJjcexRol5jEZ0L/epDjzJEZYJC/+KrAfQiokZ9FGDvo2EElydAjpgcF9CQS9cTpqpTKKrVtxsfgNKsRdkNQcgRzXsjqT+/1wGO+fWzmpbbTtts7Ore7LFtTPu0Du0sR5mLzJ1dnaEE5LEz1XR/N26GKqwv1Lw70qst4izpvA9zTgtPzkj+OZZWByQ4xOh6bErev9OdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0793.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 09:54:42 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:54:42 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 10/45] package/gobject-introspection: switch to https
 download
Thread-Index: AQHZK+rRTfObvKnqZ0yzXzqOVl151g==
Date: Thu, 19 Jan 2023 09:54:42 +0000
Message-ID: <VI1P190MB0493ECC9BB75AE6838E7909F9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0793:EE_
x-ms-office365-filtering-correlation-id: 00563219-1b89-4667-322e-08dafa033007
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yPbSGz5pQbBXvU1YIaWG0ZHpIux9NtZOpA3/nr2YicL1C6YVoXS9/p/t5tdmj5zp2+jKjSpcNqSj8HpRJ14ORUJup+HVMjeNwR4V3LXEJ3YRp9DbEhQBnyTUFvTiozbuOSDtZIPkZ4o9M+0q7B9yQ7spMmq16hhQOzKCEL+hRDXAFOAD0+x/AdZknlSVrSvlOcbJBmVbP006H4/FFWJB6jHwU0hVpw1vOcmjliMmLe+yBhebr3maXyp/iIPG/0Yynmug50JnsyyOTx7Oleg2MhLgcU4Noiored/3tkLGkuWYXDgDeCxF9767IuZLVNLjqz66+pVcVnndF12h8uBqJq+DJNBXI55pRj6eB5wD/v8gL2baY5G5DKDFsVnMLuFbSrrD3yDXXlTaDodH2OTz7b/XUrLZHWpG92OUgJEgqbw29BDFrekoidfCo9R4GWskLaWW3980sRjzIXm9qvbLvli17IYvzX3Ueq73mMTPVasH3/QcChLQso7zunje7llTxYBuz10CajLUF75nsSpiYud6UFdga9moTvwjFUjF8GpdkWbt7EtfmdVBxbVB6LS8fbz9gYZg45/z2SY8sxyi2FoFXRIy/5IwYE6jQTxukb2G2FRBEbndog3GcjWvgk2H/pG9Aesix5h/A40LOQnmbpA3ojNAPGZEcVpwMGtOFOF6JgqCEaTkXm/LjsGODytIJBoohIioS6PTuPg1rMLs7VbaqgJjTrPwokzplhC2GUQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39840400004)(366004)(451199015)(38100700002)(122000001)(33656002)(38070700005)(86362001)(8936002)(52536014)(41300700001)(5660300002)(316002)(66446008)(76116006)(66946007)(66476007)(64756008)(66556008)(8676002)(6916009)(2906002)(55016003)(83380400001)(71200400001)(966005)(478600001)(7696005)(26005)(6506007)(9686003)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wETpCDXv+JF9nBLJLchdMmISOFs6nq/vODcMuUcculoKLntQWaiAFcOFDh?=
 =?iso-8859-1?Q?YVB0lcuH31R5mHMgPApQT8d0l8NX1owxBt/WeCF8bGMzeBm5pLivMViVaV?=
 =?iso-8859-1?Q?lfVXUlCGwvVCBOQO4L3rmHjsQk3rAjnxdccuZayZkkL21qD7PuF1MPiQ+N?=
 =?iso-8859-1?Q?8T7hVM1R04l1iBLB2u8dX4VwnnbK1HNc7IQK10gqGpKklQOP0EDeQFGyAP?=
 =?iso-8859-1?Q?r2pWoT7kcTevzzR7cfpNNoVwcTQS8kGNMEIKN3tpGDu1AAoLlQTsmoh9r0?=
 =?iso-8859-1?Q?nrxS4CX+h6obwS8aHyPtWfe9W9IwMUgsE5CmSgyNLtLCoHtnuhPcTGQeG1?=
 =?iso-8859-1?Q?AYzaAzvfWKxxXmUTPZeMdAnr8m90/OOY585GdDlQRztUS3I29L+97QpX19?=
 =?iso-8859-1?Q?QSwRLpOk3YqL62MB20bl447FQg4u6OVpGIs0fvuKzH96TuQHr8N7DwR0MJ?=
 =?iso-8859-1?Q?WUQjzOn6U5KudM6tboiwvivcybOjtICIozyY0lkRw0wS0Nxm4NH2x8CKvG?=
 =?iso-8859-1?Q?jWnkZbY2Onc33UDXasiFEhuNtuNBq69Fu/5C2TnkqEihqsJWBboayqzfNS?=
 =?iso-8859-1?Q?VLOYdS3AiO7P9/5pYVWLkuzMKnOqx7aXT5ZZAjRmP3tgLSy2qnhBMYNSS1?=
 =?iso-8859-1?Q?hYICVD6zvGxRIA4JY3mrX9gJaf7fjYOFuePmeEtvjT6ya03WUzdc7BKZ1Q?=
 =?iso-8859-1?Q?lQz+evk+tGRfP2q8ynHwKAnf+d9D9KyLVq4dCcvZ9WIrmkmHlstuKJIlig?=
 =?iso-8859-1?Q?vPyW3S5J/oO5bw4Jw2uI0+Bu4Nw4A+bWAf7AN2KNP6/PNzSFD8vESY5ezl?=
 =?iso-8859-1?Q?/R90hGqkI6CxJjbQBOSzKFQDH389Je638cEXrv+y9y/VnC5n6/qRP9Rvzw?=
 =?iso-8859-1?Q?5UnepjL0gv+AxRjtYg5KZCxzdg/MzCeNsfNJKqU1gs3dy4c+Y2czusM28U?=
 =?iso-8859-1?Q?tA93blRLmlKRFWKexfFP63LbE2gu/HMACIVdUH0HF9216JXM9fCDz0xMq3?=
 =?iso-8859-1?Q?eZh81XnjP0bl4D+DTvbc0AK0/znL1eIzfGAXRnLhFt05RlHQVMwF9hJ600?=
 =?iso-8859-1?Q?Et+GfyvBTepo3aX/U94+ynFWPgxQhHVcoZtmiqqpp/oneU7ka3RDhgjE0m?=
 =?iso-8859-1?Q?X67zgwoNjkBoceRmxNw/XCOXbzu1nPBTkRhB4aRLNAl6lmbZTMJUKAb1iM?=
 =?iso-8859-1?Q?MzuWFowIxlx0UluD51d54hdjA4LfhSMe3WzzNzXIxbVydY1eG2W4IaEC0/?=
 =?iso-8859-1?Q?YQUbLDiFKtWx8uSy4zMMqt0m03O0I4194ePUQPtpW/QIUutsxWEABPy4FK?=
 =?iso-8859-1?Q?84t3VoWb6iCkn7E0WYL2xQQe0wWkH9YzRaHde3d8bvoonM8CYNd/+hSfUC?=
 =?iso-8859-1?Q?LnyOJArlIx9gCMqpQXPhg3SUygCw//mJ+SXU2Hm6EL1cm6FY8jRBZnDwki?=
 =?iso-8859-1?Q?GeL9OZlLdvAD84ImH2LInVIU9nQq/j9MUNB2pLmLZ2nDv7cBL3CCU7CClA?=
 =?iso-8859-1?Q?MqV0LJDP2hatQ5JdFJ7xjo34eFeSiIDH3FEzMZeaFVnD0jCOhBDivHeII4?=
 =?iso-8859-1?Q?XSMRrCEUDrqwovReHG/QPMgDMLlSQ6SNZBvN56V8glRVIcfCoHX7U1nX/W?=
 =?iso-8859-1?Q?TUvZmvqs3Vwls=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 00563219-1b89-4667-322e-08dafa033007
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:54:42.3657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mWu3jlfTFRXcBlwUd9LsmcyPdLx42roKPfkBupxTlNwLzJLP/Vl2sz92a4JusawzVOUP54TGmgQAC3gC/1eX8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0793
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCJy3RYRrJoh7eF3z7Zh1V0P7Q5hm14K/i4s/n4U/Cc=;
 b=sX8s5yz+tTQjxfi195ue9Zh5ZFMlq5Ubxk1tGY7xSjBSQRq36wH2KuNK3muCudaaZgkI2JrHRBWQ1fWqs2vsd3fbv+I4Lb9iLeUuwhJnMwyB9EN/lSIfPECGjj/0MlGE6FgSEOIOgYl2TXroaB79t6NtlIkx5hXAegE6pT4DcyE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=sX8s5yz+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 10/45] package/gobject-introspection: switch to
 https download
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
 package/gobject-introspection/gobject-introspection.hash | 2 +-
 package/gobject-introspection/gobject-introspection.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 8f9d323d9a..fa3fdfe306 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,4 +1,4 @@
-#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.70/gobject-introspection-1.72.0.sha256sum
+#From https://download.gnome.org/sources/gobject-introspection/1.72/gobject-introspection-1.72.0.sha256sum
 sha256  02fe8e590861d88f83060dd39cda5ccaa60b2da1d21d0f95499301b186beaabc  gobject-introspection-1.72.0.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 12e5b81b1b..37e1b2c64a 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -6,7 +6,7 @@
 
 GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.72
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
-GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
+GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
 GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
 GOBJECT_INTROSPECTION_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-2-Clause
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
