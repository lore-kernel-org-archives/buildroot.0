Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEAEC00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8730404EF;
	Thu, 19 Jan 2023 09:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8730404EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYRZc-1POhyA; Thu, 19 Jan 2023 09:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF3E240222;
	Thu, 19 Jan 2023 09:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF3E240222
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D7BE1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25BF3822C2
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25BF3822C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WaJrUmIZOKSn for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:49:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18AA9822A9
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2067.outbound.protection.outlook.com [40.107.249.67])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18AA9822A9
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:49:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOuZlYAQfvwaji+R+Y0EC3wzkOnBsIQJeztAvqquAdIh6Nye11TEHq0/O1t8/BR2bLOaQMZPOKTyAnYDhmeWcdZPysoWtmNYh+38Jq48n9ZKn1vBkFUp+5tJ6A0SvzI/F00uq0XmBR/CWCCPScnIIUN2gQ7/6En3j6TZx0rotoz77U6BJ/rKtwA4eO+EOBLvPKQlbvnywnYYyQNJ2Q8D3e39EB8tLeNEfvt9FSa/0CP0cbBg+v2fWt9+5M5lFU322kjo1BxpHnsQwmFdyZtDZRVuUuR1AX1CkOmR4rmI1YvLQbHxHyj4Gc8SXuWg8G8TuFUjT+pdz1Fyw+qNk+swAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aY1+IoZTiHDMZLXYFSQvixuLcm5HQjUwnBz8NLzjZeM=;
 b=H2BoL6jDt77/EBFM7pCx4OX5fwc57DvoHYFnEnwdFokcEuAM1lqoDzEJW8rwRGeoLHZ2+bouKicyXVVXFNpU3TziMAByjKTBcTi94I0zfhmQs6I0pljLmyZhfgDxvD1Nvvm2Fl/igHG8RGtzNd8vQwIkDfIkPB+FFsXL/FUOL8/iPVCiRc9kSRYMZJezLmvWuUYnRIzLq0/kvQwfFxPX3q7Q4SdrFjzPlxXfcP8hNntAZuxUyvURWnim1QfjWEM0RU/tM2TppAS4VLHTlhZoJfa2Dq/fnA81/XxU236pdgD7fdOrNsAT6UsD+M7z+7zTK9hm61KAH1jZVKiRFOJIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VE1P190MB0861.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 09:49:32 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:49:32 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 02/45] package/atkmm: switch to https download
Thread-Index: AQHZK+ocnU6zGXeLgEqQWwdIkVFUcQ==
Date: Thu, 19 Jan 2023 09:49:31 +0000
Message-ID: <VI1P190MB04934E057E3587C640CF190C9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VE1P190MB0861:EE_
x-ms-office365-filtering-correlation-id: 4fd397cc-da23-413c-0449-08dafa027704
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MXx4j2wwGm4WxT7xeQQ+T5YXWmwAgH88qaFUhymLFXHbChD8Z8AH0dKAtYnPVrUvufLykeabC+HIRpKvK4uxGlx+A0azf88CXXlqpX5eAqcWf34jqh/oYNjpqbt3YvA6R1tPhlYfbUc2nYRIYGXdg5iexZGBi8JFA/li7rQb0zaz6QbhgHVx6Bu7Wa9YdHouaFygwhLag2+g3qk7ejwU7+nvQeCzLxNScWKPt9wGhYAEVYSsaz6IGlyxS2YDQ9GX1MhwdTenW5qbtfrRl0xtHYOgoRMC0petudQtchb6oHDMNFKE+q//Tu/a90oQyOCGmDj13aFveWDw7M6JHDRoVTzBcQmS8t3cjm8ety4cKayBjimo1M5pTx99DRQpm1MMqrcWlm/ghEiKc9qfJQHo53e6s2nMSAJl0xBPuXSQepi8bFIVi9P30HcBXa9HdNprrCUAzQufGwFne71emZb88ixYIZL1Ng0twws4hc31E8cb+QM+kzpZRPCICUYCKm0DZgocrnxgV4ieDWun0gotUQctZQ/JltB11L8EkZ4ck7iDjYPrF19Cc0Zijg3rLJ9+CWZlH8GTN0pUrzqalSdA5Ai1U6XWLZNFNGfUVpg9bKVp+mFODDWFpJmFKk51VWrHWghBSAJyFCIid5TipViyBTV3VI6kOUfJEnpuHWAKXB/ehq85ThZ2HdoYjUNcOAatDeo7KIek0ZsgAJUJs9KPWv+o1tdSfCpWpA3GmKOCcsI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39840400004)(346002)(376002)(136003)(451199015)(316002)(122000001)(6506007)(38100700002)(33656002)(2906002)(55016003)(64756008)(66446008)(66556008)(66476007)(38070700005)(66946007)(76116006)(26005)(4326008)(9686003)(52536014)(478600001)(6916009)(8676002)(8936002)(966005)(71200400001)(186003)(7696005)(5660300002)(83380400001)(41300700001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dIHof2wWK+U30BjXgDfh9EKBEodTu3C5RMkMNEehtfAEBpFK1UBDvG3Hcp?=
 =?iso-8859-1?Q?iq1p77UlqkpAHH5gw/No3ULvKRc70uXMlfJIf3iHI3XfPzZjWdjA5/iWPa?=
 =?iso-8859-1?Q?o2cN4xYcgCAXo1wlnjysxQRAuYLSClHnV52POU+jwVD7Xp1452pWerahkW?=
 =?iso-8859-1?Q?Xne4cIrJ1/9SKg9mNFoQKUXVJcMie4Kc1Iy4XEZ9NdUhHLcDdSzfemXTD/?=
 =?iso-8859-1?Q?fOmCiXWva3bujXaWrbLvCIX51o6B1Mgt/dti5sDIXn+au8p4X8bkM5aE7G?=
 =?iso-8859-1?Q?0dyEqRfIfOcSJK8yZu4DVbAJ5sAfRXiCVpyFUhW9fZ35VLRvHO23H+0fCT?=
 =?iso-8859-1?Q?6n4KbHFRmMgWzFC2dPQfH3KP1a/caZDVI5Xm1shL/pUVOFyLzUH9AWMJPT?=
 =?iso-8859-1?Q?TIiwwUpCWz9DdYD3xscYFnCaxwv3tC52+G2VICHk3m5EFCGQbYcszd+YU4?=
 =?iso-8859-1?Q?+zZiJISqakAErKrcOS5xhVilVTnjIXcXjPYQXo2sOGA+7dULw5HfVX+Od7?=
 =?iso-8859-1?Q?9u/WZ4FkDUE3WFCBdi4WaBD/1aNZJLQCCcUITYqpeqhjj4z4mm0zTj5txK?=
 =?iso-8859-1?Q?736igrYolqVGzqa6O46w2XDSXGjgu0rrOoAP8FSWXTDdoaK7wPOq17lf2c?=
 =?iso-8859-1?Q?Gb45UAQDd/yRtiyIZU3IpqXY1bCQjUbofqG2RSDIV2EN2JaPN1AB+6MkXr?=
 =?iso-8859-1?Q?A6g5zuwlHyrTWDqkAuGc3NQTsBY5TFdcjBIQG04Napmk1juevDIRnd68sZ?=
 =?iso-8859-1?Q?Ao2JwfVBLGfsw9QCOJhn5eAkdVTqeSNrhRQtLwW3Fdtwy1v8ypGn8Xj6B6?=
 =?iso-8859-1?Q?hr+/PR2FupPfihgd5u1UxqADaMabEbWG8CEE3FDv5kg8q2AXWaOWeGsMJW?=
 =?iso-8859-1?Q?yRMPlBFlGHv8yLyAXRRCG+7/822fb4dLmVXX7vbGJ8f8OhRcDUU/U2260p?=
 =?iso-8859-1?Q?b3vTJIrmHVdlL5VdePsRJr+ZyjJxcK2BHSlfQGvOgeCCgj570+jhzc2Vdt?=
 =?iso-8859-1?Q?8eLBnk+JCkxVp1TdaKvnOn7tccYfxNlkgaCBl1eTDNZ32jnI4JQbarWVJa?=
 =?iso-8859-1?Q?M+H21mycYkpNaCpEp59VKGLGUXmiEOswS8U0n1lOF5FYQmsVOqrevHtjgi?=
 =?iso-8859-1?Q?SUfGytHBLjmgXVhsHgro6VS7PsvTRW/1OMnNoFM/zjFEbWPJdGYOGf97MQ?=
 =?iso-8859-1?Q?WWb54DAY7eG5qG4SEnZTS446LKXcB62SdKUPYbhk8KqwXIZauF+bFtPw+r?=
 =?iso-8859-1?Q?i4fjMy7Hgt1fr/e+b1wLWEhBWR5T+Ct/t+ZlU4LmDAsvVn8XMhMdA0wUfr?=
 =?iso-8859-1?Q?u1VuhTi+DK4qaAR3yXQdX5VToOlgSjdNNM6r8PKpacX2O7TLR3TaqGrn15?=
 =?iso-8859-1?Q?aUJ6rTOgaQqJarM1RdovsagFiqjS13/ehw/+Thzw3zLvQvBqQzLjACkFKu?=
 =?iso-8859-1?Q?9rKQnCqmf1LKzTLvUr/bbcU5/OOPPNeoKRkapVd3CWoLOa/myRrQ08uQrx?=
 =?iso-8859-1?Q?rF/Gzx6XBqNFzmkHt0/Dvgko+wI0fatO/wjsJvpYsutl6WlogO0YNW9i6Z?=
 =?iso-8859-1?Q?C/1r8wPelliHuk1W8pThPzB3x3pJ1mOz8ld8Bon+BJKesb97nY02sSbP8Z?=
 =?iso-8859-1?Q?SkF8Z3w72q5JY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd397cc-da23-413c-0449-08dafa027704
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:49:31.9352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jRFh6t9x2z/vAcAPbpZT9wu/IZ3fQvkSqISZMnwvekiYqoq6vUtYd0aRfyiaEor10CyOF4snir/nnqyzM+brLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0861
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aY1+IoZTiHDMZLXYFSQvixuLcm5HQjUwnBz8NLzjZeM=;
 b=AsUWetTF4a+pDXNoB/2ZO/ov3a3GGDbK5Q0M4BWrLLdsOIdV3opTois/RNcaxP/bojzZMRZPILQd9s1Ydl/zTjsz+kvnVWUEH5BOUle3KP8j1khISNHpUb0PxJyeHPQwRiZXgT3LVCIxBkfJ+KrbVUohGhFGmSjpjfKfLGPBzdE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=AsUWetTF
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 02/45] package/atkmm: switch to https download
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
Cc: "james.knight@collins.com" <james.knight@collins.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
=A0package/atkmm/atkmm.hash | 2 +-
=A0package/atkmm/atkmm.mk =A0 | 2 +-
=A02 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atkmm/atkmm.hash b/package/atkmm/atkmm.hash
index f965ad29cb..9e2bb2830c 100644
--- a/package/atkmm/atkmm.hash
+++ b/package/atkmm/atkmm.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atkmm/2.36/atkmm-2.36.1.sha2=
56sum
+# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.1.sha256sum
=A0sha256 =A0e11324bfed1b6e330a02db25cecc145dca03fb0dff47f0710c85e317687da4=
58 =A0atkmm-2.36.1.tar.xz
=A0# locally computed
=A0sha256 =A0a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e8=
61 =A0COPYING
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 3bcb941c9f..7ceb87b047 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -7,7 +7,7 @@
=A0ATKMM_VERSION_MAJOR =3D 2.36
=A0ATKMM_VERSION =3D $(ATKMM_VERSION_MAJOR).1
=A0ATKMM_SOURCE =3D atkmm-$(ATKMM_VERSION).tar.xz
-ATKMM_SITE =3D http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSIO=
N_MAJOR)
+ATKMM_SITE =3D https://download.gnome.org/sources/atkmm/$(ATKMM_VERSION_MA=
JOR)
=A0ATKMM_LICENSE =3D LGPL-2.1+ (library), GPL-2.0+ (tools)
=A0ATKMM_LICENSE_FILES =3D COPYING COPYING.tools
=A0ATKMM_INSTALL_STAGING =3D YES
-- =

2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
