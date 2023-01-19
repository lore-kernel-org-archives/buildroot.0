Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF66BC00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AE6C40341;
	Thu, 19 Jan 2023 09:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AE6C40341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMYQGOVsuDqz; Thu, 19 Jan 2023 09:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F37F402BC;
	Thu, 19 Jan 2023 09:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F37F402BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9B61BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 256A9822D1
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 256A9822D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUx4ApY7H7sO for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F604822D6
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2073.outbound.protection.outlook.com [40.107.13.73])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F604822D6
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYJrVbW3nFjo7oxXPaYK9w5+kIK5pphCrzuCV7ygni71KDeXkyvalZ5rCAvD0xzz51kZKx7vyiVFcw+BH+qrCy+ESm6YU6/LzsPPF1JbU8CV6AijKlpi08H7Q+25N8endKTjdTIgY1Nx7kTj1EiC9KjIkbL2V1cH4R0u0g4+Q6XvmYONLiOlzOJziLuEWi8tqy4NU3JQEFXzRcqshio0HaUoLbGqzRCFXuQbpXMxGyT1yxMPZWDL5BHg9t0Yx8XsdyOKrWvQZhMUL2gYwuEiEUHjHRiQX7rPgxJlIjkYDe6ASjny/lVTIFfO5cqNzpoyqtsz4YXMN8iQC7igm2nTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwqtcarwNL2x15cV1LhsyQKw0kveEFURkD8VquZi7yY=;
 b=QhaqxB/z9RhCqFiZLx1FjGeX3poDJVGgINkaYoPmX2rnHYj1A6BF2Bnziec7b4VmMvxPSQr93k3Wyu5qa0bpZap8Mo2v2MZrkn1rtQHo33ZSuQrUg5BICb9txFo43Z9ynmWwam4FmakVsJdj07MwWy8kwi0+WluwWdBw+7vS/18Na6XFsFlUMQ/BIioLFClQkVs24qTYTqxeAG9Gyx4TKG2g2wKxNpQokdZ27qAMWW3SvK1lpyAjPkQPxmGipK5nJMvh30VqBOAEGsybuzkXq0JSJUEP+N6103vTKGIaCg6pLtS9BtzATJZpyafz9wCo0EoInXzpwJIkFDSM8Vhl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB0937.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:8b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 09:53:14 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:53:13 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 08/45] package/glib-networking: switch to https download
Thread-Index: AQHZK+pb+5QRsVw7UUqEvqHcCExTAw==
Date: Thu, 19 Jan 2023 09:53:13 +0000
Message-ID: <VI1P190MB0493A1661CA5C309C6F9914E9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB0937:EE_
x-ms-office365-filtering-correlation-id: 8dd870bb-857e-4ada-257f-08dafa02fb48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MkmwogWcjzYkNgOgGe5XfCORsnzLr6aQn8RRJiU7cgvg/bmQUYoJk2SUiPFbihkYKcM2PZWSwa2gIA0BW+HA44Jf+zF963lIg8gvB/w6UTOJIiFoBTgPyLh9i2tvrsTmmgDwGsyxkpTikbyOafxvtPDDp5d9GHfCBKC5Y6F8t3Pflii9WfXxAIe46EcH0K0HYMeQl8I6V5y7BlWyNAaqlSxZ+3V7ypw2rW/BlkZvYlFc6GP0FCW5usmmGdOuLaN0ygK+/pvvbg5q8l8rg70ZWCZ/EUA1hiomKoaLtUv8lnQd/2K3gpMkZq8q5clBPSNC8BAPnBD5XV0KUw+XSaYGjRFxwG9/Cf7KJ60/H7imUxtp2Ud5BJKsjv66T7RMUwoHH26wmghnG+vnybAMHO6nzCH5LwuAITvRo46El5W8ndP1nKWHiRUIhp86HjFyQBAe3Jh9n4dgk40BVABuAAVvyee0CxJfG9hvPOKPtIW8+cuv9hqgbka3WEdsaMkBqyR4PbF+7JsyHmQ5Jbybdm9Hl7S/YilVtCQ5S45bnDWtdM43TV5YS/Is/UvnaYwuRplh737oQ5vPvexFfiGs9ekMtJeIuNjhXJfA8ssqcWlG5frSPbe42k8p34k/p0fzq1vaYdx+/xZ0iwPT00xgC3VGFGB3yCftkx+qVnZeIuoW7BgDaBRXmm0zasjaBBSBOkXzjeldBREBFBxX9ENJ5c9Un9F/5c6cGSXGcAPHSkHxTzg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(451199015)(38070700005)(6506007)(33656002)(86362001)(55016003)(66946007)(52536014)(66556008)(5660300002)(8936002)(66476007)(2906002)(38100700002)(122000001)(76116006)(316002)(64756008)(966005)(71200400001)(7696005)(478600001)(6916009)(41300700001)(8676002)(66446008)(186003)(83380400001)(9686003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ckCY+K+AswVrGsjlNlRnwbKj3FutLo9OH0c6MQ9stYOwTSt5DCmJDz1U5a?=
 =?iso-8859-1?Q?u8Soqruc2nABf8GIf5kJDRhsFfai3HDm+ltuGY8AcBrOYmUtlpG2D3sENv?=
 =?iso-8859-1?Q?r6xgKppjeuT0o/GXdSqfkH3ko1DR3JrI8xYv6g6bPP51l17CeFIAgieozP?=
 =?iso-8859-1?Q?1uqVOYqtiyzgoyV0aJbXoqSPeJhx4PZn18anKIs582gov9OTliw6xMBGWN?=
 =?iso-8859-1?Q?y8YbhYDX9++TNY4PiMESpikDXEhVbyGEGyxT/ER/NkvrvSJ+DtnkuhflHy?=
 =?iso-8859-1?Q?/vDhDbkGhXZt3Q0KoOO/5QWgXQFgDGMkwES+a6HBjnlzxOg60cULA+ov5o?=
 =?iso-8859-1?Q?+n4ec+bKHWKw3s6Y0dKJRP0a1kCnQzfr0xfkfbEz3Hku96tkQZcNndA3Aj?=
 =?iso-8859-1?Q?8eDUNZC6H561NWF9kra3HvDwl6If8JUv4zRYv3MR9cg7meeHwDfoxYTGuj?=
 =?iso-8859-1?Q?ut0MBkmGmda6PbwAHR6N8eS5x8UHquwalzCADAzFFv111sEi/BSnN1xjqO?=
 =?iso-8859-1?Q?OCpRE0xql7DOCLLVmmJBTGklUQrapc+Bu38mCNsn2PTE+cs5z6ydkNOp5R?=
 =?iso-8859-1?Q?H2XjOKtvAe4bdhvp/jzTHclZW56hvDdiVz19XjecCIEUkfsOiYRAbDkguh?=
 =?iso-8859-1?Q?9vhxdB6e+iA1nm+CDSHZM+gWheueIfXm7EXFEBGkTZTV5FcZU6xCdyGGxo?=
 =?iso-8859-1?Q?wxbMIthAjFa20QbnIrHnVQMfVB4Y3q99SZoCYzsqyDX8FO6LPVZjDrozx7?=
 =?iso-8859-1?Q?UnX3PZhP+ie0IMWXh4T12fpQIu9w2BmT9BwQz9dJqaRzoLJeuOObBTEk+D?=
 =?iso-8859-1?Q?K6cMTz8eaZtwUSopiEV3LBHpUCL3/HmKgiwdflkEjNiJNRVoZhHD3YYxGV?=
 =?iso-8859-1?Q?pgnORkOfoJ65OVHLzjYf7hVpKN6ngpySbVV8U0ey0+G5mYlkvCRXpWPE4+?=
 =?iso-8859-1?Q?GIeZAdJRmqJ4Ow35I7xui/466nZ2oqIlPjKwIIsZm1NVeicP8h/bUr1HO/?=
 =?iso-8859-1?Q?nC1wcJrlpdyAhCf36GGBiiSfdV9CAQT7zYu/4GhD4EcadBUV/eTlsGP518?=
 =?iso-8859-1?Q?GZ8zidaJcChmyvTOeRpSOk+vkEPjo8Eue2LsRN2Rqci3MWKn/Mdh6qXRA/?=
 =?iso-8859-1?Q?1/RzlgSrH/CSD20F3U0JA+qX5vwiT7/IqDMzYtMZNwpWzh+vytewDzg7lb?=
 =?iso-8859-1?Q?A5EFgEnsS2a+qK6najZTi03Ynear4eqKJ71f7VwPmvCrSIqczqEbhQilrf?=
 =?iso-8859-1?Q?g2vTZum9Lv7PtoEcMsIRKGfiwQ5IOnQEevAsEY6fixFie8LKXoHcqLEjw9?=
 =?iso-8859-1?Q?1RHA4pQNWDH2FHejcwGw9uHSREhf3NpUWa3DmoVxcnco6yRRnuzcRoiuKy?=
 =?iso-8859-1?Q?8nPz/D2PmIgFWdxLN8yOiNi85+IrcktmZs7Wx/ZsqwFG4yWtiq1uJoj6JW?=
 =?iso-8859-1?Q?LC1Gxph49kNsBoPNMV6rkGLy7yqwr8g4wR4xRRvtTXtJJxK6STjhJdy2yd?=
 =?iso-8859-1?Q?NdPtnshZuLHwEirJQjf6XVCEcJl+46kI9SLMTcmw5T1nvepp+2EOKdpgtI?=
 =?iso-8859-1?Q?SXoJabvxZP8zVfjRb9oJnQwrSY5LUtu4NRitL5OwB36bIZeMWVO70GyAJ1?=
 =?iso-8859-1?Q?ydeV+pFNpOPTo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd870bb-857e-4ada-257f-08dafa02fb48
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:53:13.8722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: izScz65fgACt9rHs0vww/cvdoapyQsWUTpXXq4I4uLb9q7RmV3sct830QukhCZQWpjB52yM6Bjl0oHKZkgjggQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0937
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwqtcarwNL2x15cV1LhsyQKw0kveEFURkD8VquZi7yY=;
 b=oKZLDEmCC/AVzWFqh9+dl5YGYG5I2PFmS0ythcmqNrhGw/vaWWDCB9UwVTzcTNOI6OU+0PO6u9DlJchVLPILhR4WAOlT9+O5+pwbK1zydHFAaJnKKx2PdmRdIKdMhFHc3mDbyL9Gg8tKTS7QR/bxA6ueQPP7kfh+8iFCbvMiGcM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=oKZLDEmC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 08/45] package/glib-networking: switch to https
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
 package/glib-networking/glib-networking.hash | 2 +-
 package/glib-networking/glib-networking.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 347ef6777c..766efd0ced 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.70/glib-networking-2.70.1.sha256sum
+# From https://download.gnome.org/sources/glib-networking/2.70/glib-networking-2.70.1.sha256sum
 sha256  2a16bfc2d271ccd3266e3fb462bc8a4103c02e81bbb339aa92d6fb060592d7bc  glib-networking-2.70.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 4adc13d39f..b6d29110ed 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -6,7 +6,7 @@
 
 GLIB_NETWORKING_VERSION_MAJOR = 2.70
 GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
-GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
+GLIB_NETWORKING_SITE = https://download.gnome.org/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
 GLIB_NETWORKING_DEPENDENCIES = \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
