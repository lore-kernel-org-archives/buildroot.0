Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E02C38142
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 764E060C16;
	Thu, 19 Jan 2023 10:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 764E060C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jwo4Enj6BVwO; Thu, 19 Jan 2023 10:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9A7D60A68;
	Thu, 19 Jan 2023 10:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A7D60A68
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 251AB1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3C7441975
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3C7441975
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qPoiDAHEc8V for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:01:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A34E540357
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2076.outbound.protection.outlook.com [40.107.6.76])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A34E540357
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:01:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzSnSIlbtSIUau/1AlyX/0T7OPc+gYqxVNxUMfJbWLQyR9fIzAEVGF4doObm0cYo+NG0Vwcbo8MPwLodhJ6QlbW2VwB7hJj9cs/DEAqztpSxS9aEaab8whkoIN37w1iu2/vibXqmcC30awmVxqFjtdV+JPIlu0FduyTEKdnA36lJCD2ESLhF3n2YElMjwnTHDr9RgDyno0osgmSrvsFnn8qBK61Wddv9jJiBvDxGqYXoXHgk0CBP+Ttk4/sm4mOzxZCPKsnfeGkdPsniEbvz849ZcmgRHOn+nJ2aGzrM8RjEPSkfBOAvCWvPTnv2M7j9VKfkrV/FGmwE1KsN7f6qvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4UMacdYVjZnSgyCfwGtTqy9bZ2Q9TLDnnmSLCK82iI=;
 b=dtmPDBFMAmY2YJqdv4CW9rnNO2TxfCXVTQTHRbKMdQrym9nhGQm0wbFmxpIob9LSDRh/OKt7nxR/iw6weUYUt8OD70k77nDXr1higDOA6pcBgETlKpO15F+XOimzqRKlhYUvUnZmUEek7UP1jPWeBe5ZgPCGO/hDTT3n7gjcCdP9w5oSGGDy7HxRQ71Oc0vMLVh14pdOlgFsMaELsbxHA6x69bkD/46Kb5+376q7+hRpFCMIb1lAm1VQ+I2PMtPl397BllX0Dk+y5RbTkR3rNsnA+g/Mc5zJLrnVTXD7ARnxyrx2+h3cSGLyP92zprIvvT1q9WtN3IfmAnmMAj7bow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VE1P190MB0877.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 19 Jan
 2023 10:01:19 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:01:19 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 17/45] package/gupnp-dlna: switch to https download
Thread-Index: AQHZK+ufls5jZ5bfm0+ZBe9F5l7cQQ==
Date: Thu, 19 Jan 2023 10:01:19 +0000
Message-ID: <VI1P190MB049317C02FE839C1EAE11B1B9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VE1P190MB0877:EE_
x-ms-office365-filtering-correlation-id: 464a910d-9c74-4ba3-7408-08dafa041cd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q+2tIfFtdV+laTGRTUJzOjnCYojx65ItsSSkSIszurbg9LU8x53DtL2oWkFbE4p5S1Zu8H4ENye9nDeENugiLMWunMdwHk79x5thMzu2fu0FByLYwkAz1ZKPm3TGwLA7PSNMy7qpXFxD6QMDb8bJIU+UrtNT6+d+2Nyu2M44uYr7aPcICRFlEss0pRWXkg6qbO0hC5JJgjHkqQ0Uxt4O+NZQG3nR/3nQCxZ35pny+iMG/iTa0W2nde7S4U9WjsXJWYxoc5nol7ASZeKSsQLaQUZzxRIVhOor6sdD4OXOLDdvhElut9zH7JvWzWRsUFqKlqnL3nYenbLrDNsf4fLmryJbXuTVWex9NhQTUSpQt+0B9C/y8AjDcS4w+xZLUFRgAfyTFyrAEwhI5WtQN6EFXkWpcAT0XjqvUMUxo9o1x/lHbohNI8lLUbJd6Selsa/LtmwYWGHbMNYgZzh2roEvV97+zhzP+N+s5uMsBjJDZKxxxyitf/aI4/nnADXpg303kl5oNJ/EEgl3x4XOEBhSIPoy0zkq39CDye3EdDbRx7bO9zD5dpWLIc/gmfaTmL1us1aV6PBSnRtaD2Gd1oxbI3gC1yr6tckQxMZbmfGauXF+PI5F8AROT7KU+X7hQneQgwEF7gfqrhP9jQD4gSDFFu3Hy5HzAdJOx9f110kPd4pLE5Hb7QphSWMRDATOpLwhl3+oFo0ImhuHuj9ex4rvs9cxRDasZhpTHg16FTpbmx0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(396003)(136003)(346002)(366004)(376002)(451199015)(55016003)(33656002)(66556008)(8676002)(6916009)(41300700001)(4326008)(66476007)(66946007)(66446008)(5660300002)(64756008)(76116006)(26005)(83380400001)(8936002)(186003)(9686003)(478600001)(52536014)(6506007)(966005)(316002)(71200400001)(7696005)(38070700005)(86362001)(2906002)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?e/bsX4MauEG68SbzwLm6WLwNOAa3JjdhofnOuACiybBSraeCj0FAF6RBW1?=
 =?iso-8859-1?Q?yFQkRgjfDoU/T0VomSi+4/DGGEtIIufTZjlkf+EQXzkyYREIdYjeAk9iPC?=
 =?iso-8859-1?Q?+W9EsER2UcDrBxS5SRc4HUiyNMWaVsU3ZKS0TspjIVIH8vxmkqMeeoGA59?=
 =?iso-8859-1?Q?RdIrc6DCucDuJgjywc82/xRHmdmR3fjZqSkXrNX/OC6li1LsBXo79BIr5G?=
 =?iso-8859-1?Q?1SN+ncz87KDffTpzk8VtFaoaYF/1K22lNOp+W95xMecpct8S57+MjNfRSF?=
 =?iso-8859-1?Q?V74m0BjuhFLIO1YInxrQ16nBuBRVWnoi1LSbrIW6uO2KYgr5vsBtYojxoz?=
 =?iso-8859-1?Q?eAMq1pgg/+wP4vObHpQSw+2Hl/znhSZzGD8uJMFpnf1l14AWyXd87j14Hm?=
 =?iso-8859-1?Q?1BtBhe8H86UYJVY6hiuUq2idION382NCbZ2qEUP6iIs3F3F2Oj1VjGgBrN?=
 =?iso-8859-1?Q?rLE4fsHQzB2prS1uMSFoUe61UXV7dDQf/UbR98pZUPHC8cFY4vUpULJxMR?=
 =?iso-8859-1?Q?Dakj4ijwTQWk12pBkTRgCE2vlFKIhyVXyynJJuyKDm+66Utk2rOzJ/ozZC?=
 =?iso-8859-1?Q?e6JoVYIbrXsGkIRwfnLUtm83vbx3l0i/JGGCiVkkaheA6c8tklpb2qxu8s?=
 =?iso-8859-1?Q?MAW8rdIJwxUjSNPnG30v4F4AwYVZRVu4NfjD4KcTBUOBRDZ5YOW/Z6GSTy?=
 =?iso-8859-1?Q?g8tZePEROcfJ0/EByHms62D7qRjJoYw+Vu16x2JU/iNA8jExDnNz8Yw05p?=
 =?iso-8859-1?Q?YR51++K0CO93iLXbn6MQCBSQ1IDxuVAVfznwQEE/1iOMLN6+LT9ymz5fk8?=
 =?iso-8859-1?Q?+iFO62NhRjZfUpsedJCEeGfs7cCl3x3N+/09V9PXOVIt9YBmsySSWlqFDW?=
 =?iso-8859-1?Q?cIPtp23ZneV2iZIFty6I1BgON6VBk+NuL9E7LXx/uDfy6pCDS5eaGDzyMM?=
 =?iso-8859-1?Q?9aoWV1/PhQ1RnXLI4DeqPPK9vYrzeRYI59fq6AkydDDxQz+XTHt5dVl4ab?=
 =?iso-8859-1?Q?UkAnUHuIZiFzvK7N42E+JdQPZgGLChtR6c4142XgABjDOuYkcQgqLK1TYa?=
 =?iso-8859-1?Q?GH9ZVWYLpYFXctE9fPfYpdL34UYw4xjMyF/s1h6IPB5W2WJeS7kKbzfr+7?=
 =?iso-8859-1?Q?JPA+FQn9w6iKr4njvQzPoZJFgxgkloivHUuR77dPFjxXAF/QaqWK7SfIoQ?=
 =?iso-8859-1?Q?XArEwu63zb/Ql6SyakP4OUMyo+OATyNqjS1x1Qb5TMH11xrrvQmaTjsRUs?=
 =?iso-8859-1?Q?gcmQSZx0PBXQ1d83Sm4bGbvxRWEkZXwIz1eBdWzOJH7e+fdZhKggInN5+0?=
 =?iso-8859-1?Q?NtEySmY+bRgu1t64969TJiHc+FmyUy2M9je1qFNeAL0poQyR7eVRYqiojs?=
 =?iso-8859-1?Q?GSqhDJtJmmoJXQlkqUtfKJrCQNFE0dXI5TFPFVVfuaRSu/PzyL8nGkxaqC?=
 =?iso-8859-1?Q?hhQElzgih0ldBOOF3e3FscgGIqBw7b/47v9BELvHQkdrBiviLwEUCFH0tv?=
 =?iso-8859-1?Q?uuOnxNySSIGbvS6vCqA14I/AAmAaXY2wJw7HbcB0YosxKblOO4MM2cr2cG?=
 =?iso-8859-1?Q?w8IJ7Rl32Z3QnBnQDpRHw32Uhr/nysVCFvQrvIt1+lxyG1pVm1d05ex1QM?=
 =?iso-8859-1?Q?Dr7NjhvTZY7VE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 464a910d-9c74-4ba3-7408-08dafa041cd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:01:19.6335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4+ks9nu+GxaTkUdoEWOLIPQjpmPnbHDQTzV1Ykip5JWAxPFq9qSyPWswTItPTCAij6JvvmXx02bEpDJgZXNFcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4UMacdYVjZnSgyCfwGtTqy9bZ2Q9TLDnnmSLCK82iI=;
 b=lOpugXK8kN4PK/DQoGg+7m4bpNFhvXhZjVRYuM8KxbS2u7rQu+rJifE2Ei9oxzTvbmqnbtP9MHC/Wos/I7h0YRfpQrcwAcClx+9MxzHXY9MwgRTu6Pm5W6O1NlvS4L64p+uw/uQo3xSbkkRsxrGuqWoJ1ZE9OqpnSux+MHJ3J38=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=lOpugXK8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 17/45] package/gupnp-dlna: switch to https
 download
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/gupnp-dlna/gupnp-dlna.hash | 2 +-
 package/gupnp-dlna/gupnp-dlna.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.hash b/package/gupnp-dlna/gupnp-dlna.hash
index dd9f2e4e4f..c7cab2601c 100644
--- a/package/gupnp-dlna/gupnp-dlna.hash
+++ b/package/gupnp-dlna/gupnp-dlna.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/0.12/gupnp-dlna-0.12.0.sha256sum:
+# Hash from: https://download.gnome.org/sources/gupnp-dlna/0.12/gupnp-dlna-0.12.0.sha256sum:
 sha256  3d53b96f85bc5628d33e367ec9bf2adb38ef2b34d7ad0434a6ba0cf4ad9048e6  gupnp-dlna-0.12.0.tar.xz
 
 # Locally computed:
diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 64146f894b..0064700fd2 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -8,7 +8,7 @@ GUPNP_DLNA_VERSION_MAJOR = 0.12
 GUPNP_DLNA_VERSION = $(GUPNP_DLNA_VERSION_MAJOR).0
 GUPNP_DLNA_SOURCE = gupnp-dlna-$(GUPNP_DLNA_VERSION).tar.xz
 GUPNP_DLNA_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/$(GUPNP_DLNA_VERSION_MAJOR)
+	https://download.gnome.org/sources/gupnp-dlna/$(GUPNP_DLNA_VERSION_MAJOR)
 # COPYING contains LGPL-2.1 but all source files contain LPGL-2.0+
 GUPNP_DLNA_LICENSE = LGPL-2.0+
 GUPNP_DLNA_LICENSE_FILES = COPYING
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
