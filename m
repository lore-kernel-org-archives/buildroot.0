Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E2CC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 03:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88694406ED;
	Thu, 15 Aug 2024 03:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dLxwyFPGTXn; Thu, 15 Aug 2024 03:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C0D540708
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0D540708;
	Thu, 15 Aug 2024 03:13:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7C21BF4E2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 03:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03FDD81E2D
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 03:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r15OPs2Ls1L9 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 03:13:36 +0000 (UTC)
X-Greylist: delayed 1033 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 15 Aug 2024 03:13:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E34A380F8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E34A380F8E
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2406:e500:4420:2::700;
 helo=chn02-sh0-obe.outbound.protection.partner.outlook.cn;
 envelope-from=huangziyi@canaan-creative.com; receiver=<UNKNOWN> 
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on20700.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4420:2::700])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E34A380F8E
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 03:13:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ikw97RJbisQ/i6HeMNiwTFI/I/7L7u8ZDF/QO/r9i86EKBc1CHJa0XJYRQKz7Smj1v9SxHwTwgK+hRKbX+1SaxOdcE0M3dyu1/Chktos0uhaPJn3L6kkAW9KK6pbmF/EqMH3XXf+H+eHdg8AOALMrS/sNiF80jzhmWQFS5Op/dwv4Alwt1b7jf9UuFRD2lyVOeqY+2XHYXG1FFwdvgCk0IVJ3QPaWubH1Es516Uk92zsNhad2EdjGB6s1u7cGz3TDF4GapwzL6qV012IgUm8FJT7uqMKiIuRyFmIVpdXYTxtuYkfW9JqtTYDbW80RG1Cn0iyTXDfOJngXpjFayDIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mibRP823sRX70eLd1nrit6QY5iKC6hIUBosVoO3+Dl8=;
 b=Wt8oQ80qZnVlfdsXYmHNyV9sC57x7KTzcVg9e7gOPA5KTE55BFzbdjqkpHnnai5DLME1f8gHE092W/KeADodbXvxUKn9Nw3oJBI+Ka0/vkQc+ZO7vF9IR4BHjT03iVFO/DSW5DSnbBhvm/zXgWBYju2mPIjtxHQy0mlAcF/FoPGYZor5zo5W6X81ICql3RAr2Rn90jaQ9yPf1cXfasX0v3V7V7v7X5LQ66fRweMZVQRMEWvzqOvYVjk7B8LtkwwHo2bJMZsjuA67YOELbdGRVhj1LNByzJTHnOxsOwgx9CnOmoasldlkqgVlbJDdxVmolV4wRsaYa9sxYHA5GWlCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=canaan-creative.com; dmarc=pass action=none
 header.from=canaan-creative.com; dkim=pass header.d=canaan-creative.com;
 arc=none
Received: from BJSPR01MB0817.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1d::21) by BJSPR01MB0564.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:10::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 02:40:21 +0000
Received: from BJSPR01MB0817.CHNPR01.prod.partner.outlook.cn
 ([fe80::dd0a:77b8:f4db:d4af]) by
 BJSPR01MB0817.CHNPR01.prod.partner.outlook.cn ([fe80::dd0a:77b8:f4db:d4af%5])
 with mapi id 15.20.7741.044; Thu, 15 Aug 2024 02:40:21 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/python-numpy: add riscv
Thread-Index: AdruvGNAFfTqdsK8TEOhPnzPb3HYMg==
Date: Thu, 15 Aug 2024 02:40:21 +0000
Message-ID: <BJSPR01MB081732FE487F661D1350469FF7802@BJSPR01MB0817.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJSPR01MB0817:EE_|BJSPR01MB0564:EE_
x-ms-office365-filtering-correlation-id: 24f00ce9-d512-42a9-84a7-08dcbcd39bca
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|38070700018; 
x-microsoft-antispam-message-info: sAAz850ULe06qQlYCKke0g0g6L5G9BZB+SUHk8s6RknztNe/4/exL6DGx0jXFv/zmoba4DFIT313nmS5QTbJ5J+YVSpWqgh3bq8lAxt2ywYLGli63gZzZJxV4gMv4ginYpfUOaylf4Br7vt7SCItT3lsnqwkwzfVAfQS6E8XeZMDgLIrI+KwvWtn+eW4zo3VVCEfYZfbQodEmnhCJlNHjql6eTc46inECC9x8Cr7FJQ7MnemehYZW1Rr7SVrXnLxmylEbRKIwH5SClShZtE6HxwYRCerWy2Mr6i0FZB6Rg0d8A3KJxtmJX1IgO/iHclrWeey16TtJBvE2yJ/WzHthehVGezJtItaBK4KtkVSKkllmptvCCtSygCUTO2nLEHxtIza53Ar20f/DRFfZIYgkvq8qurytux0i3K+Q3LC1WbfP8QFbguv30sHNK4ImOT4ZuJpJvc+ebohFWYXkGrAJ+z85NM5bWz//BZvYyRdxcU+xezP9XYb4diDfKUTBLQ562y016UODwjlMWO31oUoPM/ZMhl4Hs5YxyQNRHuygF/2wWLn8viFR71VvNkO0o3v5cDuF66cr7/pOHaX4F47N4zQU5ikwRgmRA2QtbedzXlsWtZH2dk+IdKvrSoD2PIm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:BJSPR01MB0817.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE; SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?T1FGUXdUT091cDVVcE9UK3lubENSM05kVXpneFFQVVpZN1JMZFFhb0ZyQXRy?=
 =?gb2312?B?T3J1bGIzaEtDN1hVTmIvb3FydXd6czNsN1BKeFQzbzFEaUcyVW5uczBtUlhG?=
 =?gb2312?B?ZThxa3ZLWjY2dHdkVGQxaDZQeVJIOXRRR3BqSHZCVUphRkJWeXNPbDI0MEw4?=
 =?gb2312?B?eXdkbHVnV0NXT1NLZUtnVW11NlFRRk5HNExZKzBYNnZodTdQS015WHlXclJy?=
 =?gb2312?B?S3ZjY2lOcXpsSW9acXlYMnpzMzFUWHF4R1lwbEFqZ1BIbEpqUEtsNkFqNUR3?=
 =?gb2312?B?SlFNSzhISDZtNWlFVnR5dkhIdEI4ekgrMFRvT2RRZjVDcVgydlZLQysybGVR?=
 =?gb2312?B?TDZMbktXeUs4bkhHdzhBcGVob29tRmpLaEwyM0J2OHZrUS9iRUZ4cmJPbUZG?=
 =?gb2312?B?dHhOSUFBaVp2aFZRTXZQTEVsdlVIZFhKVjZiQWd0T3dmeFBQNFVLcFNpcnJD?=
 =?gb2312?B?NisxLzN4VnpmQTh5bWxRTE91QUZqcytwWDVFbVZvQk1BVGlBODNxUFR2VjhX?=
 =?gb2312?B?ZS9aZGEzZFVCSTEwdHdQR0F2SE9zNGR3UVg2UUwxTFBwL3h6Wm9yUHhxU1VF?=
 =?gb2312?B?eWFSR0twck1TV29xeEU2c2tSOEh5NmhTL1dyT2ZWWlhxVXE1cmdFSjRaOVBt?=
 =?gb2312?B?WjNzMVJLTFgreDBqWkdWT2tUbzlYVHFHUTEvdVdKYTg1NWFETy9qNWtHcHhQ?=
 =?gb2312?B?c0x1bWo3SFpRc1kxQzBHRWRjUTVOZkdKdXZaa0VnbWxWWW5Ob2Z1K0pwMzVm?=
 =?gb2312?B?bHhDYTl3YXEyOE5oa3pnZWRoVlB5a2oxUHJUeXR4RWZRcTY5SEZqQXRYNFpS?=
 =?gb2312?B?SkRSUjBHd1haaGFMQU9HVGFSY2drem5hZkxQNkUzblBBSjAzblQybGx4U3Zw?=
 =?gb2312?B?azVNOENSSHcvOUx5ZnJaSmRoZnBoa0gvcmJiMTVabGlEeXJPUEhvZjgzVExh?=
 =?gb2312?B?U0FJbDVmamNYM1RxQkNGR0pnMmgxZklYc3NWMkFwS1lxY2NBcEh4TFMzUkFn?=
 =?gb2312?B?UGtscDduSEhPcmFENjVQeHAvTEhiWHptUUdERlNnL0ovek9HbWtsaU1Jcm9a?=
 =?gb2312?B?ZmZLaEtvUEVTMTJmMzNnVDM0cW9kU21nZGFERVcwcE9XbGM4b3luRzBoMVJR?=
 =?gb2312?B?MG9mSGExNzNYTmFEcXRRVjU1THh6cnl4T2xxWWRRaHBXWmlJMkJpMlh6SXc0?=
 =?gb2312?B?a1h3U28zS240dXdFWWdNMjlONGZCZHZ1eFlwMzJreklJK0ZLODlLREVobnhH?=
 =?gb2312?B?V2QzSGNoc3BUNUUvVDJhSlptTXppL0FGVkhlYjlycGd6T3VOOGJoZ2xhZnFQ?=
 =?gb2312?B?MEdlTXFueVlITzBNVmkvY3hUL3djd2N2OVZyL29VOHlJeVNjdCtDNmN2emFm?=
 =?gb2312?B?czBkWk1kSGdxOUh6ZXlrSlZNKzY0cWM2RE9jaXJ3eDQ0SVJVSmlZdW5SQktS?=
 =?gb2312?B?Tyt0TnpYOE5CU3V4WE5udVY0WGU5dE9EdUJrdi9zQWUwTEk0NEM0Lzd2Yy9q?=
 =?gb2312?B?a3lhUUdPRTZSOEN1L3M2S2VPUUE4eDBEclZYN0NJb3FyNHBqcVlKREtaY04w?=
 =?gb2312?B?TTRxV3lHUndMdDk3UGpwZ2JKMVlGdW0zOFIxdGpmSEdLd0tXRzY4aFVqK3A0?=
 =?gb2312?B?WnhEaE9TMVVmTkJ0NW1uUVVpSjNKb1JpbGdDcDl4eEszN0hFWk9zS0h0aDNY?=
 =?gb2312?B?V2EveTFoaU83dDdUN3ptSjNmaWdWK1FPcEZST0h3Q0FIRDltSXBaWkRURmNB?=
 =?gb2312?B?VmhuazVOSHlDWHNwbEdmRWxwS2lXU3AwTTVPWmhuV2tPaWZ6QmxnVG5Sb0Fy?=
 =?gb2312?B?TWtZT0o5dm1IRWpqQStyaURMdmRScHAxUkY3TnBacTNmTEZjUzR1ZnB1ZzRG?=
 =?gb2312?B?c0dlaGkxdTJsUFJlb0l0M3gwV1F5Z2liaWNhVmNpOTIraHRZaGl2c1k3NWEw?=
 =?gb2312?B?cVRaQ29vank1MUdrTVZSSGsveTRmanZoU1Vpa0VmREJiTHhzckVreHM4WWJk?=
 =?gb2312?B?UUxDM01DSnZwZlhyZERwMmUzenFacGI3QlFWSmlvS05IblAwb1VGc3ExTlpq?=
 =?gb2312?B?aTVxcWtzUHZGUFhSdjhaS2lDNlB6RThuMUxTR05NamNxMXM2cm5Udyt3bUxl?=
 =?gb2312?B?RUxUTURBR1BnS2VqM09HOUp1QnBaenNKaWxkOTVXNFJIMTBEY0s1ak51OHd2?=
 =?gb2312?B?Tnc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: canaan-creative.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0817.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f00ce9-d512-42a9-84a7-08dcbcd39bca
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 02:40:21.7065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fb9be9d7-8f56-4a62-b26e-3018a3e771a5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mA+tiZwOFwh+I+wrDUdjSr6HHjwWXBDwDrnnIzG/ypgle2VFOEna8u7u3XZFMWENanXdy3+bmc6+DEWuKOGUsm/C9lVWCSo6vn4WOvBJtXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0564
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=canaan-creative.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mibRP823sRX70eLd1nrit6QY5iKC6hIUBosVoO3+Dl8=;
 b=WKPOwSWqfgDCtJd3V5VSopslRqmNDGCBh838t1V0NZlg7VV8s+OO+sbYzBPUx3h7yZUJi32WKXW1P5b7iBBWdqf6lIUa1aQfcxnZrtUrABdMSYYxniUCS2wLpb7l3SbYt/UmPDY2LwKkBp97F6RTvj1I8rRdaj1BkfFdVQ+C7IJT6TdZE9oX3reL0zzVuq7w2bRGcvCL7CkhWBPFYMp4vcyovxKTUDDskBFthlXXWimX8kcCyaZH3DGcBkiV3bffBgYZg7xMeoFAS9gnwc9xTaYKpV3S3cJrqM7w+dsvuGXIRNwP0AMbtHmKohaqDYT0cw7+JhvHkCQ8gW3ajogwLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=canaan-creative.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=canaan-creative.com header.i=@canaan-creative.com
 header.a=rsa-sha256 header.s=selector1 header.b=WKPOwSWq
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=canaan-creative.com;
Subject: [Buildroot] [PATCH 1/1] package/python-numpy: add riscv
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
From: =?utf-8?b?6buE5a2Q5oe/IHZpYSBidWlsZHJvb3Q=?= <buildroot@buildroot.org>
Reply-To: =?gb2312?B?u8bX09yy?= <huangziyi@canaan-creative.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


numpy already supports RISC-V

Signed-off-by: huangziyi <huangziyi@canaan-creative.com>
---
 package/python-numpy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index c27baec3b3..e10618f058 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	default y if BR2_mipsel
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
+	default y if BR2_riscv
 	default y if BR2_sh
 	default y if BR2_x86_64
 
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
