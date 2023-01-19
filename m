Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42888C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6ABE822B7;
	Thu, 19 Jan 2023 10:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6ABE822B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrXL9q34KB-A; Thu, 19 Jan 2023 10:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 091BD820D0;
	Thu, 19 Jan 2023 10:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 091BD820D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9CD51BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1B1B41829
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1B1B41829
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3-3eDSyJyc3 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:17:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AEA0408DD
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AEA0408DD
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:17:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YURSg6n7xp+dnhxerPnEy6ZU9hKq5E+KrOSoG3D3A/IwgOhQAa95GAM6+h1C0n88sPtv65BnwXjIQCZWvdEXyOja+xqSE3HEnTqygGq5s5hNEgKFyiRKViGM9/YYh4dFR0jL+hb3QMgPysg2vYRMisQJVTDe3iaJa5OMaksFK3ZdzyEjOxEKES/iBp7LK9SDpYT/xKJbmQFfH3+8IKDVseVbU9OPGuQEvrWnbw0gPTa4+gQ4h2rkEfgddsxw+t00Li+jSGNJiP6W6oIsgjDEqwOKV09+iZqLe1ZmpkylPxERDROW1o/GG82UJrW9s7vFX7rlMi18p4ZuDGBGuekM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP6NPCmeJrxTC+cLtUL2DTkw0WPQ6wksweEOGY9ZBHE=;
 b=ibvZaGqhGEmPxbN3UZSQMtfFRyTaWObo5eVADDzWzyCG01zXpLbTo8GKUEbyJcI90NDvod5lQCG2uFQF3nkhkLjl1dPQ/5wr9Eg6zEOqSdofcbH70AjSZtZCygWeulvUFTdqbZ1mBgMCh2qxZfbFJ4/YU4cduKkJwLE5rZLZVS/H5vc4+OKWSaDcwOhfW3hnwWN1RxL20Rmfv/BA7ZJcqsJ2w+MsuUm1COoMDKKV1Veg0b3UG976LWvSwHymfCAqTEZoOx5PeXMaGGxGq8efBPFS8TstO6OevccPQWFbaalGwD6E6UuEjdCjfeT8U2gyCoGlSoWtQvsfCm5CMgqCvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PRAP190MB1716.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:27a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:17:54 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:17:54 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 44/45] package/rygel: switch to https download
Thread-Index: AQHZK+6IHeOesSMx50W0DK3CR/KOPw==
Date: Thu, 19 Jan 2023 10:17:53 +0000
Message-ID: <VI1P190MB0493658E0502E982D3DADFC69FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PRAP190MB1716:EE_
x-ms-office365-filtering-correlation-id: cfb99629-b877-4ebd-8513-08dafa066d75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FyH5ABVCUm09LmLM1x4qiAHLwIG9OqR7biJAlWjpMfkWz4CpyIle25jRL3pJIt9Dqoop/mVN/GtLi36fvfcrletH2AmnmLx64bPc9iMNs7APTTUaV9jFDvt9byeaeqwRTsUu3Atq7dio2S7mmhcq/Kbe/GVx5hr2pvRdafSpyPka/qSropUt+AJoW8BW+Ey3gzARm4VOedMaemZdsz+w+BWIiPpdQiAtTYKGfrrzpIhrp9ZL3xFCWuzyqMCrm/Mmp1pNTHvBXA7JVFrlsLasELDNzlAwPfe84jeb5QvmPZtn9pLrhHD52M0tBzLhs8wuDCnRXLHEptEh0FwZqGDDrlz07EJbClV9BD1HdFSjQWNHaHyI1oGN2TgsLloCGmyymyEUG9FFpDb+qtTPOCBueHwy6gWe1BvdBPE8Bss767cPmmw/phWptVm/R4BdCSAvUYvIlDFnD5CUGD9CeXL0dmg0BCzQKdTKGc7YHTbeyyYpQ8tbG6gtLeQoN05gsSiVLASvmLPuAHHopBkzs8IJyyrsjlygj6gU9kloJGe4xESuiGOPXCeKzCp8xZXjZeRX3An8/2ikXKKeSUwbkSi3XdJ3eF9+SrXJOY6UtYo14+hAaV+5EIdPiWG+0sVgDmEmx9p8vvZUlOGWVp7eMvK8kaav+U5KaBbSmtEqP6uCb3zXc2ByVu/fQdzOpcYzUOpq0LoH6UtQPVRezAWASypeSAffxzAa3MSxNmX7OW2mNlo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39840400004)(396003)(366004)(451199015)(478600001)(8676002)(6916009)(9686003)(26005)(4326008)(52536014)(86362001)(41300700001)(83380400001)(966005)(71200400001)(8936002)(186003)(7696005)(5660300002)(38100700002)(33656002)(6506007)(316002)(122000001)(76116006)(64756008)(66446008)(66946007)(38070700005)(66556008)(66476007)(2906002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eeSH1SAaIBy3mAYmhZa3HiEQWfTJLWiJX1gdlnuhJKQ964d3GTs1Yez9AO?=
 =?iso-8859-1?Q?3Wnq1GviudboPodppvP4r27/hwF8rDBUxqzFQArbBy/Q8Q2acK3O+PI9fz?=
 =?iso-8859-1?Q?KwQGFg5qVMKBFeyqkPdR2SzaSw4vB1BapOL4g/+DRfbnWpMr0tbwg63l2m?=
 =?iso-8859-1?Q?/P+ziJ6rXYZ7tofcmXCFwYo84YcBKRC8hf7IJ1dcHTP/Me0a7zt93WTWZ2?=
 =?iso-8859-1?Q?XmztOGxTobyvyELCoUfZqIgFVoEN5hA8wsYuPFxFiyGpKFicgAyVkHpivW?=
 =?iso-8859-1?Q?uwfngdZ66KWqOBgwCAUr5l7a2nx4nPZDCTzhTJ8fYUIgKtgdBMXBtEuhvy?=
 =?iso-8859-1?Q?sjOUaGSOQioVYiZ66TShAGslVselwJx12Rvrl7TgCuHG39j3M0KV9V5lln?=
 =?iso-8859-1?Q?1oHDSIBhBP6L5mtLPiXvXTZagGRqys2mEEyV881aQFERXsHrKpWgGvbXLq?=
 =?iso-8859-1?Q?gYxrat8T5HHutR19/jhf9E6E3VtSpfv4MDQpD/2fx3yBQBGvQyNEll2vyd?=
 =?iso-8859-1?Q?TgZsIVPFIyqih+wYr/dpuo2b+YIKSjhY37KN/xlbIB4WeJV5XXh62HdBDt?=
 =?iso-8859-1?Q?3GBp8I5iHEKKKzri56hZvuGmpQvBHfJnoashzDcixjjJcIV09qHQQeWgIX?=
 =?iso-8859-1?Q?GlL7H06Y+g+z58IGKpvgmI7/KmvtRQNpDRjFLhlj5Dq8SRp/mqmvYciC/e?=
 =?iso-8859-1?Q?THhVMYQxUiot8++oiVi73NsQ8QE+FvwzKHpKas+sKIXEd3mjf21vGYDptj?=
 =?iso-8859-1?Q?QQCO42jqhUISePlLy9KxHeKEPR0Ajx6PdF41p2UZabiBsZPUdpknQsOJog?=
 =?iso-8859-1?Q?lImz50dq78p4Ihix3t5rCcwbiKJsks6EmM/Np/zn6xRRfGS1y7D/+AlwgO?=
 =?iso-8859-1?Q?9fmK57PP6gnDZlYJ7TJBFJSZxY476HupBhL3Brmc2BtkQ03kg2M74MFPfh?=
 =?iso-8859-1?Q?oj0JGIw7DlTIr7UTkJWaV7jEN5kLECIS/Ls31YHXzRzg4GbZoNSipdd1YH?=
 =?iso-8859-1?Q?uhghnh9HM0vwollLmnM69Jp6Dw1HRBcsGJdbwJSBwB1j7C4OfDhLDGiVd8?=
 =?iso-8859-1?Q?hebv80L5IYWXIi+aE2igB/6xe1ePR+1wMuNlJ1Lx4hxbkjXge9dnPmrhMF?=
 =?iso-8859-1?Q?TckvMadCIfAfApZ2NnmhTo/InRnX8Lj8aXb4ljT8bGZTwA0FnElB0eWxx1?=
 =?iso-8859-1?Q?Ff35wp3/nm5sOvM+d2HnonqU02Fvr/xEBRXBZdCsKbKUI6tQetVJpSq3Fz?=
 =?iso-8859-1?Q?bh76UcrFLcoAUbY3dV5IPfl5JYh1t57Q9WVPENZs/oGAztn1MZsf93Enqt?=
 =?iso-8859-1?Q?bPOLarbtUKEV7EfAi0OE5hL8Uv4Yn6IRK736eyMwz+kzEuGoyZZWshvX55?=
 =?iso-8859-1?Q?J60YjXJDnDVkwaFCAhTyKdlg9rXaYseEXWKJbM7fJK6gxf9eDs9Jdf5vi6?=
 =?iso-8859-1?Q?qDmD78Nx56RFQzO2E4WRMsRZPcH6m48sWz/zIbEvl9Kh/LXfZ29QLEa/VE?=
 =?iso-8859-1?Q?quCJYxcl6N3J2WILSKEH86LK8c8RBOBx5XrDUDFxezWQ69pIsESJt5sBg9?=
 =?iso-8859-1?Q?4ItyAwNVcyDU2ixy8arrfIY79FwOL1wZMvyQXLNCFQtm3CUTgLVXk93BFp?=
 =?iso-8859-1?Q?W1c3eCeiNsgz8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb99629-b877-4ebd-8513-08dafa066d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:17:53.9356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/g/Q59bAplNRvukQ4NbbJn44dWQIaismi/GGLWcjIJlxmgaCWAQbAnwomoMFnvs3PoxYo3goSaz+C6DJ38J7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP190MB1716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP6NPCmeJrxTC+cLtUL2DTkw0WPQ6wksweEOGY9ZBHE=;
 b=kL0Xx03ZFtH+2E73lMkWd76UEBl4NPKu5eK7wDO7ppfjgkZEO5KwcdyLAyNAyQiG95r1WobS8wtQEaKCN0EYOSD2UKlTtlBgaL1PbfKRyKcZ5XgNMYZ2evnNMqWPVX1kqwJp1s28l+YX7NlnYEcdzmeWo97Aa5aFT7ruXL7IKE4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=kL0Xx03Z
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 44/45] package/rygel: switch to https download
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
 package/rygel/rygel.hash | 2 +-
 package/rygel/rygel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rygel/rygel.hash b/package/rygel/rygel.hash
index 04b11ff54a..8bda1c2af7 100644
--- a/package/rygel/rygel.hash
+++ b/package/rygel/rygel.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/rygel/0.40/rygel-0.40.2.sha256sum:
+# Hash from: https://download.gnome.org/sources/rygel/0.40/rygel-0.40.2.sha256sum:
 sha256  c9e8c736296d22c4defe959727a29d31437bbd2b7aa0c6470d6be24011050697  rygel-0.40.2.tar.xz
 
 # Locally calculated
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index e05297456d..81d35be833 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -7,7 +7,7 @@
 RYGEL_VERSION_MAJOR = 0.40
 RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).2
 RYGEL_SOURCE = rygel-$(RYGEL_VERSION).tar.xz
-RYGEL_SITE = http://ftp.gnome.org/pub/gnome/sources/rygel/$(RYGEL_VERSION_MAJOR)
+RYGEL_SITE = https://download.gnome.org/sources/rygel/$(RYGEL_VERSION_MAJOR)
 RYGEL_LICENSE = LGPL-2.1+, CC-BY-SA-3.0 (logo)
 RYGEL_LICENSE_FILES = COPYING COPYING.logo
 RYGEL_DEPENDENCIES = \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
