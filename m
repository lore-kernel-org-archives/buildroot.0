Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB11C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8A43404F4;
	Thu, 19 Jan 2023 10:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8A43404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pueCkdwiVKV2; Thu, 19 Jan 2023 10:11:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8A3940438;
	Thu, 19 Jan 2023 10:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8A3940438
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D37E11BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37DF182095
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37DF182095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eycWqcCovF6Y for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:11:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDBFD820D0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2077.outbound.protection.outlook.com [40.107.6.77])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDBFD820D0
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:11:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKJqLiW+1mmRnzciMf9vu5qR0KHOU3ZrFiM+zROuHL0HcO92WUXdB8jZ5Or8zhMt9ry4QVkgt6uCw31VdbPiN6/rRFm2R37LN2NW46WB1bnG4AT+7l2qFiaaugwtTugg/Cv54AIa/AJtzLQxMi56gfwzZbBZGlLwxMnwcF0XLDM4ZsA3PMEgnacSdP67G9yG145s652cgG19aXp7UQFRYbCuThIexf5GsPdwBcczMJoKK14lp12vzJeIBFipqx+Us3zcaIb3UhHMuiEWqFHHeVo5UOyWIaIljZcv33cQuJYrPcaCOaLWMIYx5gR/zpbAisdo52DtsQ/guMkVQmCVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcZo96tMGqB6tUWywJDPcySMgH6tIWjfBQQwV7oPSPk=;
 b=m3MN/GwzFbxdL1l2r2hf+Ve2DNlf34X8qG8deZfpthlmOV0r98d6TyIvW0ky2ZSIIutABPQYJ1L7hLmSYNAlE31guBqMEKGCVXtp0FN5slxgnbKwnXME/Kinwrs1T+tn1RFfIQF4q8akjPYBAfFgQuVZ+uT1GVY0uFSmA4J3W+Gjw4XvBsSTDWqTNpsZdrH0IZ9/VmvA99TgbAwXd1Enul7lPPyJe7hUhHy+5BunPzf/lTSZfGr4tuAoe8JJ/ZXubcRxLxAxTOVMA6A6p4R7JsOeGBcYx6CmUTDr8mAUC491qpTIR7vv7XDeOu9jpe3yGbQR0g4fXwab65Bki7Ln2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0616.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:112::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 10:11:32 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:11:32 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 30/45] package/libgudev: switch to https download
Thread-Index: AQHZK+0DC3v6S1z7LEe/isNAwMb8fw==
Date: Thu, 19 Jan 2023 10:11:32 +0000
Message-ID: <VI1P190MB049318C879B3F05D7AC6C70D9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM7P190MB0616:EE_
x-ms-office365-filtering-correlation-id: 150a1209-e212-443a-3326-08dafa058a26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rWhhstRjWAbYNGD4H6VDBWlI6b3yuBgzgrsTxy64jpkpc3hPEo6qoAqgb+cjpvwV8czPbDDqwFPNLRziYLjMu4Z8yRCXxz50ffG2IKSUR7XQDzvfaL6StXkppzszujcmvUryJInMy0chFSnZZ8CPa43DJ+60PC/+6htBGmdheGUTrbTyzgev5ZvHQltUf9cH8BOLpsY5mdtzcArOM+mU3TZObeyPlmXoVdoK/O1qVgS1jQtdypiGplwyK+58s8Y1KY3stmoqs6B8jyeouks8LzrGyIWcR9FS6H+4Fs47xAI5+tZDyMtMH0QYl8ub/gpBqdaTvmYYHbVrngAijpbTU6ZKDLXLklMe65WAPGDMXmuEbG9QYfZw2JubvAoirUGggy6RBEc7WzOMUSrtB1smj90OIePyqxYlu28dNw4kcLV3TQgDoxGLxG5yB6RWYlVWBrIx2+VTR0AO/Z2LjaUTEMfdWSSs1oBMFCWFqQ3zTA8R9WWvtbYIYsByaWt7pNtxISl7deeldYJ7ysoN9MPgVNap55RyCZMEiTuZq21d0kIInR3DcHGcPqVgr/6Isi1s1PJCOEl0y3M785g4DHdGZvh5Eoco6LlWx6d0nl5jzr5MbqOJFQJlG5tmvVtogKgoebYD1eKbgNTKbAlhSHg94wNRY4BdDE0yaDo7erbIVYBNiDTDwxhh5anPCah3NCEfengyAn5AxCIAKrzhiLM7i8t1zWHCYgx6RtoGLEOlTzg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39840400004)(451199015)(66946007)(64756008)(6916009)(33656002)(76116006)(66476007)(26005)(4326008)(9686003)(41300700001)(8676002)(66446008)(186003)(86362001)(66556008)(5660300002)(38100700002)(8936002)(52536014)(55016003)(316002)(83380400001)(6506007)(478600001)(7696005)(2906002)(966005)(71200400001)(38070700005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tEV2Eq2nyPTRwMfPStNFuTWxNcoL98VtQTJISm1zVc14xM6wpm/tVypoZy?=
 =?iso-8859-1?Q?vXjbDrl7g3ec1tPjCLPQcXXkGAU0YWDM2tk3/U4MbdsQduK6Lc0Hy3ITpm?=
 =?iso-8859-1?Q?SM3M2jHHkmUhLk6ta3Jc67JkN1BL09HptyHP+UlbJ/LpEtanpJkdvBtHUi?=
 =?iso-8859-1?Q?JzLbmBYv/4nPOm6W6GxjtRevx8h4gjl0GsCHVO07aJqs+sp1zigrSiEyY2?=
 =?iso-8859-1?Q?maEoPKLmkXxsBBM10zIk1sgtGswqmfdH8pt5iDPIeP7IqBNLyWVavzNbwU?=
 =?iso-8859-1?Q?cmUg6pVLGvj53Kp85veS0j/fG2rF47M2zVVViy/U+FJMo4bn4gXKuzCw4f?=
 =?iso-8859-1?Q?Qs404kROnvnKmjiNGNy32458BnVj6lxHrgw9BmQgpoh+r79QblLTe7dCpt?=
 =?iso-8859-1?Q?ByO0hz/xFVTbbrOtrYR6sWLFsHYpRGcZ27OmlAeP3aY+wsJSsnZMVYQR5Y?=
 =?iso-8859-1?Q?aVbXx29GuLcbNxV/nNeTjASCD+jxkmU2+3/MA20zo6Yl9smvpCTwRXCapu?=
 =?iso-8859-1?Q?1uPkNLgPu881nBMfPIWqKNnnlBxrfFeLIowLxO7xCch7vfZ0jHPZS4mpIh?=
 =?iso-8859-1?Q?vhUxQJHAODyPAt/G9OiSHw5YcvLzGrHgMcsNb+ehP6q+QD22/R3d74OQUx?=
 =?iso-8859-1?Q?xD1tY6ji28is1FXMbwVekIiHtgoFh6WI6VUePkys57KT6z6uupHToBNd36?=
 =?iso-8859-1?Q?mjNsDhhGkir7MreyyV94I85I7mP9FBo3Ir46XO4Nc0lTbBV6SMQUpS27vj?=
 =?iso-8859-1?Q?g1C9d+hCqsleCg3k8DaTpqIgFPquGgTXFn9P4LExnB7W4AchFxMhyvblj0?=
 =?iso-8859-1?Q?YIduqFwaevI3SRdDmj25qx0b2153LRwHH6oa/s7BSwAzj8f+9ogr9grBOb?=
 =?iso-8859-1?Q?wYzZqYSI3ezQXq94e+pcLxPmOoFqw6pGA4ghysC1cKopt+P2ZEOuhIG2Um?=
 =?iso-8859-1?Q?faYjZ2A+rYoqOv+1g1x+CLWZw8VGhZzKJ3jBeIh1j+T8x+McDqhImRTgFb?=
 =?iso-8859-1?Q?Iuw8OBIqENHiJkAC7PP+a+dz6lj/xABu4bCioRknONbKJtiZhkqu3jxwYb?=
 =?iso-8859-1?Q?2u8Fk5LeLrOyeqbJ/VppkOR9a9vAZ/u+u2eKIbcaO4ME2DXt+eGOXxwxQn?=
 =?iso-8859-1?Q?iaDgw6XZsDENcQwdMqG14IQGLj+RFCMskJ3LN+19rn2E7O3uPH86EYNnhF?=
 =?iso-8859-1?Q?3KgWoWw4+AzgTLgHdhT+1Lpwfv6v5AZVUbR0XF+UkE5CLNcEUFK+I5Tenz?=
 =?iso-8859-1?Q?z0eDvin82waJwDKvz38EfdZyZHTcM3YTz6ibgTR0qC8b5vRJHpVXX9KA4T?=
 =?iso-8859-1?Q?1jcLqEkKKtpcTXUQgYZPIzdhvR3btCoheLPK+PCMp7RFTLNiIcv6e+iw2d?=
 =?iso-8859-1?Q?hkgQwwcKsZqHKuyssDRBHEsLSg8B1r1gZ8NDP3idVwV0JYH30GmhyM4T6J?=
 =?iso-8859-1?Q?3T9JtOE2yDDoPY07lTtZu/JFS2jsWWpi7p9ebyKhdX5OMWwhqvvvE23sU9?=
 =?iso-8859-1?Q?eND2X0KjBiWwp5ahcvQ+0fHp/6QLH4ZQ2Thm9rBOwP8IYcd52pvgHccJXB?=
 =?iso-8859-1?Q?KdPhai3XKGi02QYIAW/pFMObz4SchFe3oUojUOcAZykwfDsvqftu5NxJjS?=
 =?iso-8859-1?Q?A+Pgu6YcKI3nM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 150a1209-e212-443a-3326-08dafa058a26
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:11:32.5261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D8SY1GCSh/cHiSZl+dggRFbRzQiTyy/7ggNS+4qA+H2QH/9x5NymFEfYFuFqShKfP2rbRQYCq+MtfpaPEtlfBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcZo96tMGqB6tUWywJDPcySMgH6tIWjfBQQwV7oPSPk=;
 b=iQ4R/+ig9/1bw9zQKq3iskP6NoeQb5zO6C6gytZ74uLW6Jk06AxPlzWjTTAZKAPY272wf0fhiPq4gZ7elHJNVMOxdtOTPAPqfu6DgaRN8yQbWrLsPj/fKC33UMOMnY7SanMUpGeFv81PAaU51e0YkO+rcbcj8DbOyAGQlLLs7Bw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=iQ4R/+ig
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 30/45] package/libgudev: switch to https download
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
Cc: Nathaniel Roach <nroach44@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libgudev/libgudev.hash | 2 +-
 package/libgudev/libgudev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgudev/libgudev.hash b/package/libgudev/libgudev.hash
index 3933e55de4..90f27a02fc 100644
--- a/package/libgudev/libgudev.hash
+++ b/package/libgudev/libgudev.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libgudev/237/libgudev-237.sha256sum
+# From https://download.gnome.org/sources/libgudev/237/libgudev-237.sha256sum
 sha256  0d06b21170d20c93e4f0534dbb9b0a8b4f1119ffb00b4031aaeb5b9148b686aa  libgudev-237.tar.xz
 
 # Hash for license file:
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
index 27244c3072..ef0bd997fa 100644
--- a/package/libgudev/libgudev.mk
+++ b/package/libgudev/libgudev.mk
@@ -6,7 +6,7 @@
 
 LIBGUDEV_VERSION = 237
 LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
-LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
+LIBGUDEV_SITE = https://download.gnome.org/sources/libgudev/$(LIBGUDEV_VERSION)
 LIBGUDEV_INSTALL_STAGING = YES
 LIBGUDEV_DEPENDENCIES = host-pkgconf udev libglib2
 LIBGUDEV_LICENSE = LGPL-2.1+
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
