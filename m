Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070DEC00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4235610E3;
	Thu, 19 Jan 2023 09:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4235610E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpZ81uWV7kvJ; Thu, 19 Jan 2023 09:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC67D60A68;
	Thu, 19 Jan 2023 09:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC67D60A68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFD5C1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97EC260A7A
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97EC260A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSx_bC8un9wf for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:50:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D9360A68
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2075.outbound.protection.outlook.com [40.107.249.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69D9360A68
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:50:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHkVH8Ys7kkEbLllyr4IHCs2M4Qnt6A0boA3tBgtDS0HkADHrzXnquFilNOKX03DB8/SSu/blZt8K92HSXe72p5iF/LxKwz3DRK703lEpJlLw3Ey0ugZuVOePg1b/0yzzR/4d+reARlo6fQFVsvoGsLvj1rA1WsXxcWSCfD0c2965EHuhRLUqpGGFgNd9GebGiCmmoFT3EixjhWP1ucjJbQp+KBdgdNmdVww+QNl1kJlhfK8JjuJbhUSUvKAEtCQoPVyrIdu3pe/RHSuJy6KGndS0Q61mHoqz/XEm4QGtiO4YlBOCjsUpFg3xt0+c/VkdBkWlO+IuBcCQ6zYsKHxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJTHGzWFyCrI+4hm2xSjdRNBilJHRQVmtmOwzL0cay8=;
 b=jQ9i/4+T2fD4cIV54T0IBVDRMqnjxIqqVOL56Zu5HcMF/pPuJyozxmvQXdL/4y/rzTgdOA4EtPpmTiOLFW/3j4j5AsVI6ugVtdPbjEAjQ2Xyffpjn3MaKslgQjn3IV6m0lgmIVjwbbGAFqgjSoNKIsZnmppZUJ/G1zG7crf5yL41XGdeqASkDkScxz8noVu5fImGEUcdt6sETfLgICbb+x3iO7JCAnKSUMGjU+FJnJ07g7E6vnGgdaF/S9E48fumJskiTfvOVuv39lKTfKGhC9io3SiqtWXVerhhIeC+FNOdDsrS+8ogVpVlBl7k/VwiAfMTqr8oDcUvU0AiesrKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VE1P190MB0861.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 09:50:00 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:50:00 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 03/45] package/bitstream-vera: switch to https download
Thread-Index: AQHZK+ok6n4+glmK0U+2VMlkv3AEZA==
Date: Thu, 19 Jan 2023 09:50:00 +0000
Message-ID: <VI1P190MB04934F08A4032174BFE5972B9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VE1P190MB0861:EE_
x-ms-office365-filtering-correlation-id: c8e7dcea-a4b4-414a-6130-08dafa0287ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2jswSIFj8+prgsr5e/G5H3kz/TfqApVmQbQVTI0sYsLvo5iVFoy1aAWm4P/gR00+4DeMKS60kbQlWuHisX2GmTC8YKAvb47k4H2JV2R/2plja0R4PBBrMtFwDh/ptUNQGSbxkepDiciqh5kpf+dLLtlRHiz75x7WFrssLLECjuzf/Tql3HwTDcf2K8D6sXHUsvt9T62CiS6qOpiN0OlsFsfUPFb/NvGCA8ZSkqDKJBhfjLLVrpEhRsfmuXShMj/93uBoEunbunxCKqDTQ0vhFxEMmv4B16JFuK/Y2HLZH4JpwYoA8/1SIWxx+p3jeQ5ykXLqRBGlaQ6c7Sj7Y6T2gs2+QmYYwig8SnzTXa4Nc0VK4cFMCqJbeSYXi4N+xRr5oeRGlrjH9/Alui31zvqpqFaAebR+Nz89h2zGIIRI7u3MFpmQ7xacJT7F/yQH2tbOpQ+XaSsAkF8isJ/GhkF2eDwujY+NzsVBKoR90AkVeAIMTvgUWGCkyvr+4W/LSiNYEIIrLD8aCI6BO4qqcIVW615H6q3QioBnu0BzesKE8dxElOV73Jb4Ad8eUm0oIpAIrQ+Z+ldopzD56+sI0BybN4JAbNA+DEcm5bSk+csP06w7YhuT6C1+jifGsAyCp2Ya2+LVtA6mSCxkHwgL7SRaTguKzAes/8X5URL+2fm8BhCjY9ijs8J0DwMNFjbxPnnT1ZdXnkpWhD9exe3Um/2+eeooQuqzxBR48OaSIY51wAA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39840400004)(346002)(376002)(136003)(451199015)(316002)(122000001)(6506007)(38100700002)(33656002)(2906002)(55016003)(64756008)(66446008)(66556008)(66476007)(38070700005)(66946007)(76116006)(26005)(9686003)(52536014)(478600001)(6916009)(8676002)(8936002)(966005)(71200400001)(186003)(7696005)(5660300002)(83380400001)(41300700001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dOjo9L6C6iyw4vEzqpUzZRzViEo91MELDMUXZ93Em+Z1sYEVvxporhCh14?=
 =?iso-8859-1?Q?W2dF9XTGONsdR7RhHcTdbgtnqt4g+tN0WC7pe5MY4LOIbOsAT4f2shtKPP?=
 =?iso-8859-1?Q?rnPesFhDxk/+Pjz+odDRzIoAf0TGfhwctlmmhJpBHQqDEc8Vvau34DWnQ6?=
 =?iso-8859-1?Q?EAwokRXZyh9ul5lnyp537DvAivTqLhULL7olgnTBoQ5bivN1BYVNff42nl?=
 =?iso-8859-1?Q?5kwvxWkgFGvl9ssDVceMa/p3cedC0x9VTX1zOXd0vQ+OG5LpvxfpcZwzpi?=
 =?iso-8859-1?Q?33AwMyigOPB+5IRWuIiu5F4+Wmzhyi7Bp9Ii64bXmwbaaDCAFS0HsgF3Fx?=
 =?iso-8859-1?Q?bqHfMm09BGEka/pgrAXPX/OKJsPUQQFe5EJ4mDuQZxxyjj+cKO3kdxZrCY?=
 =?iso-8859-1?Q?qilID1FcDsaUBXUkzRu0eICDSKvmNtV3vahxP8pTiMJN6YBVXGiNLPDbuN?=
 =?iso-8859-1?Q?y2IDoMk1wtxcXGWRT2FUBpxrG95gSAjhr5RmZPcNteqAocAu5FIIUtU4Fr?=
 =?iso-8859-1?Q?j79B2uj1gXBwFaMSS1sHJW/u/nG3VLVGvOIjsasHbHj3fXj8dKWb+sN28W?=
 =?iso-8859-1?Q?1D5+tK+WgVN8QMXXXPHUM/MmjXgd0B4KGzX5oLEDWHm6uZYupAM1hfF2og?=
 =?iso-8859-1?Q?vK7HBQ3IOaxOlynQoDBOqNCvw0pJsLMG5p/mddN5kbkFutXLHwEhWoIMX8?=
 =?iso-8859-1?Q?WPEu0m7oj08+QMH/QT+jocFxfPMWdAZwO//0hkIXBAV8fJKExmfHS4Egws?=
 =?iso-8859-1?Q?1Ib6novIhhetotRJgpzppqSfi48wBZ08/Z9Vi98KFd9rNwaROooZEuxI0N?=
 =?iso-8859-1?Q?2r7Ltk1nOLD89voUkRpN2GTKVMdUWiL5+f3IhgP0e11ZQFvrs2XwyONeZI?=
 =?iso-8859-1?Q?O2AxCDG6h8AD3SilIWMhYbUWQo9tKOgvrHiY4j6uS7mv4RaSNP55Hjjurb?=
 =?iso-8859-1?Q?whzfViDYr3wg5M1r+b6OpG3hjbqtLq3XDbYjGwajmq8S2ZPLsWMvFSVPtw?=
 =?iso-8859-1?Q?vJzoRBGr5bU/hlVmUiVSOXTM/3dmH+5Fj9LBjDlkQVex+ZCRY1aDDb+y3V?=
 =?iso-8859-1?Q?7WDKzjPXOBZpGLC2zBFEfAQbnbJ6dqRS9Nmeyk2wi3tqJztZ2biZNenvM0?=
 =?iso-8859-1?Q?gHZOCVzX/zfz+4DVbyeuiMP/j9om5b88yTz6SXUBygtyNR7UPXxCsoTX3K?=
 =?iso-8859-1?Q?MhmcuqHXC+gY079pU0egMdAT8mEaKvsnQNUC0ldzqNTVFv73IBviZ8Hc1u?=
 =?iso-8859-1?Q?Z96fvethqUK6+et+YjP/32rt03gKa3czHADF24Sc+5VPalFduuCl+NPBOt?=
 =?iso-8859-1?Q?RnVmrBx1KaM/ilNvHQRlEHxx3nUGaDTCSg4gOpm6MhP8KKDgWB4gVdIdBC?=
 =?iso-8859-1?Q?Pt//UoCTaXGkBZrPtgJTbeG/G/83x2OMvmHPzpVyuLsLkswfEzku6ZIlcL?=
 =?iso-8859-1?Q?5+bnoN8paeYm5PB1qnHtGX+xZFNz1RAe1dYaBPJLE5T7DBfNumYJD/ZY6z?=
 =?iso-8859-1?Q?zSLUtX3MjBVTKV381gL1kblgPudBEpx37BdBLU2sZ4hh1pFKDFxhmIE5nh?=
 =?iso-8859-1?Q?j6qGGp0UBIoZuKXCDojdH9fLeB1gt2klYKRFgB2gMElOcN2t0W/dhTAYVT?=
 =?iso-8859-1?Q?9TZobkrPDG86k=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e7dcea-a4b4-414a-6130-08dafa0287ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:50:00.3081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIY2g4zm0+GOYorw5OBfwd4Xr2Ab01pr0V0D6svJI5PMf5iEogRGkGBZDFAK9dyGlw5CEYPdxiJIcKNgRLZpCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0861
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJTHGzWFyCrI+4hm2xSjdRNBilJHRQVmtmOwzL0cay8=;
 b=SwgD6WsJsFTCwID7rrv3Xz1LOdDplhKghTCcXI4mdGUSlzUKH+hkBrDdFa3WSDRZx+svJ6Jq0QprLfujQWAug80WOUoEUhdu3MmKwRdsWbl43u1ZBpntiWvS/aG180Tee7V1jDheUabw2eWkzEZwD8khrhM+t9n4aUOFvn7H0Ek=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=SwgD6WsJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 03/45] package/bitstream-vera: switch to https
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/bitstream-vera/bitstream-vera.hash | 2 +-
 package/bitstream-vera/bitstream-vera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bitstream-vera/bitstream-vera.hash b/package/bitstream-vera/bitstream-vera.hash
index bb31b17a4a..54deb2661c 100644
--- a/package/bitstream-vera/bitstream-vera.hash
+++ b/package/bitstream-vera/bitstream-vera.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.tar.bz2.sha256sum
+# From https://download.gnome.org/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.tar.bz2.sha256sum
 sha256  db5b27df7bbb318036ebdb75acd3e98f1bd6eb6608fb70a67d478cd243d178dc  ttf-bitstream-vera-1.10.tar.bz2
 # locally computed
 sha256  3361d054759a2fc686a2c058be82deaf9c2e6fe549be9004d7935a6c1736315d  COPYRIGHT.TXT
diff --git a/package/bitstream-vera/bitstream-vera.mk b/package/bitstream-vera/bitstream-vera.mk
index f487d637c2..2c9dc1a5cb 100644
--- a/package/bitstream-vera/bitstream-vera.mk
+++ b/package/bitstream-vera/bitstream-vera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BITSTREAM_VERA_VERSION = 1.10
-BITSTREAM_VERA_SITE = http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/$(BITSTREAM_VERA_VERSION)
+BITSTREAM_VERA_SITE = https://download.gnome.org/sources/ttf-bitstream-vera/$(BITSTREAM_VERA_VERSION)
 BITSTREAM_VERA_SOURCE = ttf-bitstream-vera-$(BITSTREAM_VERA_VERSION).tar.bz2
 BITSTREAM_VERA_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/ttf-bitstream-vera
 BITSTREAM_VERA_LICENSE = BitstreamVera
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
