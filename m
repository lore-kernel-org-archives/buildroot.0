Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE4CEE20AC
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 15:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5329E611DD;
	Fri,  6 Feb 2026 15:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id La5PSAIbpjCe; Fri,  6 Feb 2026 15:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1A2E611D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770390413;
	bh=MzasilE91KWSMfmyIuRFIIoKetxNB5IkfyJNKZw7RQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=l6QvfEwFJqPyRaL52ICc2QDDhOkIA6ouGpeHnQdVAxUxLl6dxLoFMIEWczgj4FGl2
	 xNtGbztsogeSYlx+xDRT7XyGY7hK+2oYtbLS03DVSNncRS3t8brI7081SH+iNd5O2+
	 N1GXbvutrNEhyEZMrzARS6gceyY0URFJKRRkqsseU1xi12BgZU0MsgxvBN75+QUQrH
	 XTCYXXHIPSSoYAyS7pZSS5Z0P/W9Y0DTQJfcxVwTxKSJUvnqtmbRWCmlclgX0G+6wL
	 wuUq8E4h/LXVOZ8nCMyud9i1/tnX2du7oTKRIl7DnptHAeG7/vL1Nn9/bh1wl4ZOdK
	 cnc/ax/ChKGNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1A2E611D3;
	Fri,  6 Feb 2026 15:06:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D7E1219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 15:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80481611D3
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 15:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZfr8kQHwDbJ for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 15:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c214::1;
 helo=gvap278cu002.outbound.protection.outlook.com;
 envelope-from=martin.bachmann@designwerk.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB3C460897
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB3C460897
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c214::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB3C460897
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 15:06:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnF9sewYBlz9bf3FNb++ug9lCNnsYzO3bq1vPdr7lprvodzm9OwawVBCaMZUpZ2hS+OYOML7ewOsJAE7XDLi6lYnCefTF18w/ULU9/0Ds2r9HXnvLAjATDAztUVhn3PxTUcvqHzJaUtxsj/TfjuLZd4JA+xCLJbMa1moc7DVaKyo4WxLdFq0J4Rkp2qfibxPRhp4IxQJNYdJIqhi3mnJXlRAt1F37lm7ajEAGRMo7CFXoa3ax81ySnTomf6lRXtsk3V4un4rJ0g59v5uYq70lL3lRUfu9vnoWPWX7RNWtiHL7UVSFs8ksbllwjNWv5cAE+ckVnAHbSEJtvhr2F5epg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eYz3eNeA1JztWrSm527TB/+dFyOAZMKW/P7Q4nxZck=;
 b=ni2mTpccwg7ibe/eJDOaKYGqLEqlmVpXuwV/R9e7XTV/4bm6QLA6DdTodtweg0eS/KYHs+V1BtqTPq/efRJMdHKDQm9J/hLjE/LidWIEDZjwDKuLRSjOv5MZXf8qevPlcxAco+iTSw10WqASBw4LP8OZkuQbYOnrDeeUOzx/vBo24sJNCzJL10VpwlOWrQMwwLFdSd85L7QEJF3G/UTGnfhmoXOqWNK8SO9REBFq9kMSb6SDZ3HlkaREBxjN/rY2taDAlooG+22csyVdD8hUs50eS6yVTRs4sVC4UvV3+Gn0niTbzZHjM08UmCLm3p+O5g17VJP4yJ4UKiSpibXyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designwerk.com; dmarc=pass action=none
 header.from=designwerk.com; dkim=pass header.d=designwerk.com; arc=none
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::7) by
 ZR0P278MB1603.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:93::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Fri, 6 Feb 2026 15:06:44 +0000
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900]) by ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900%5]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 15:06:43 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] Updating license information to comply with SPDX
Thread-Index: AdyXehSVmPOE+9oeSxycXbDb67xTFg==
Date: Fri, 6 Feb 2026 15:06:43 +0000
Message-ID: <ZR0P278MB0869DAD9AF70390766B4C0318B66A@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ActionId=dc3b0ff4-890b-4a71-8994-22d73ee1353b;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ContentBits=0;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Enabled=true;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Method=Standard;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Name=defa4170-0d19-0005-0004-bc88714345d2;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SetDate=2026-02-06T15:00:57Z;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SiteId=5f12add6-5f96-40e3-ac41-2307f36545c9;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Tag=10, 3, 0, 1;
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0869:EE_|ZR0P278MB1603:EE_
x-ms-office365-filtering-correlation-id: ad0c7a9a-620b-4500-4e45-08de659156f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?g4WNLRl9/6eyXsuvRBXldVMRVs8zcrOXz43ArtltGaP7z1/AuA+R0gBSVsNo?=
 =?us-ascii?Q?D8GbWksjGftULuzSRPWnc701RqRMUTnkRBJ8w9j8WrW20tf6ZpVac5wg8gED?=
 =?us-ascii?Q?ILyX+zIMSdzyTleq6YdvnKoI2g+U4fsJboNY6zQP0Ea4BatHXiyV/f4sDd4E?=
 =?us-ascii?Q?RmZuXF4xURTGbhS/z7xAcG6wY5iyizNvMPrLS07++3jLrs2wCtHSVOPsTPDV?=
 =?us-ascii?Q?c2wnXXzut67nIlTahp1Yc92+LHT8ZolwwVzzsncVCon7cmAfSUUPpM2PXTAU?=
 =?us-ascii?Q?wfajX+g9LxhmRFJFRDiwpJL4SvnTfqZcjlK61VdsKWJqKI8w5hWkkXZi5UHo?=
 =?us-ascii?Q?0eXlKBhwjLEEJ7YXuRu88fZE0sGpbzip8L+G+KhlGyEb/V4hbBg5Lj36Nkkt?=
 =?us-ascii?Q?u5rqA7WEUV+LpagLqe9kRT2Pmjk2G3PH69sivi+Lti5pp0pqqKNaDdOQIX4Z?=
 =?us-ascii?Q?LxB3UX05ki68U81MW/eGZASvUARToJEhdYqYsiUPLuIUmHm/U46k/lfQ614l?=
 =?us-ascii?Q?Xyr/bAoJ5swIiZaCerC4IMO8kqbAShgfmgQAwh1BOL3gnN7VwCAU2nAtV4v0?=
 =?us-ascii?Q?+tY3HdNK4Bja64LKp1HQYJme0sk7+jCpNqm3UU79DlJlW00yRE40nluhwEu6?=
 =?us-ascii?Q?AivLAhPDvKnjQmWKd8uYzHAlfEBVmWnjdCpcovdYiReQROrP6eaipwAr57KP?=
 =?us-ascii?Q?9t9gevDA0nT6Vb5X0bMXt6jgbodtzwBELKJdWIQi9sQL1SLNUOVm2A9hcrhi?=
 =?us-ascii?Q?86S6avEZ5CgjuqGnE3jFr38hfVe9EOI3uAzc4qBAJFdsCVAy1VO5IrgyZKAE?=
 =?us-ascii?Q?Wl3ftY0whpwo8Yic0gxnk1uafjMmQTDjn0DRiK1iifVDmsUPPtibemejyP2f?=
 =?us-ascii?Q?4vcZyGfUNVRUfv6YvDB+NPyJUH5/BkNeeGPYFxOu9QjEqewylM1UGNwrP6qo?=
 =?us-ascii?Q?QGn+xa1NqqdnESYd4z33L5GOdN+Yk6GS9o8tXUoyzqSgVL3AorAHCzcxLvRh?=
 =?us-ascii?Q?jQ7bqSl89AWNRThqro8nHzV7Zj8NE/hFi7X7roP2pF3vpUqFpK6oIwLibJzS?=
 =?us-ascii?Q?q6SeWWhB6Ish79wR9DziU9RAyoNP2WXXQRJXZDMuLGHGw2RHJWpXR+SttSUB?=
 =?us-ascii?Q?oEcqqeMcrtX44GKlu04/MWOsejmeo8nWXR4/cE2NjttPlWNNJ0d4RZx1As1S?=
 =?us-ascii?Q?74CQqTE5fS7fHxm+voHSzSOONaGawZW2KyYdvsLgLbImTEvi/7QqF5/J1FRU?=
 =?us-ascii?Q?XZzACDDi7hhn0P9Y9bcvsOc/sgOQSco2Drrbvuo5x5saFEPwTWwG1/o1+ySw?=
 =?us-ascii?Q?GjlaycQqQKx0vqiRjB7bKU9zr+7J6eFJLiMVpbg3I7tjQ/0WbKsCX/wrlzAL?=
 =?us-ascii?Q?TBunlslAfCOiuq6Nvl3lSt8Tk3A0ypHzN+bblUlnDSw2Tw9fVUmBomBIpCkH?=
 =?us-ascii?Q?muYzYfEiqAq9nyJD+U2TtDJEORYm8s0xajuQOWfF8IaCF/qdB+Es6tOMFELV?=
 =?us-ascii?Q?Cu4h6U5KASgZvKt6oZUcmFH0uiXQKnOP7mJrmgZ1kqdZaebrwXfSKdYVu7q7?=
 =?us-ascii?Q?kAhyLdJvunBhW+ZVN40=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xZRwrtZuIv6kDPZ9+Vs5jdNNbOKPodIABWsQK8b7Ez0lFwOVaG85y+5zEuHo?=
 =?us-ascii?Q?QZIeqH1z6BdxQRbM0YZYPK01RlhruME4DzwG5Bm0i3yAXwaY+RB4WyRM6k+C?=
 =?us-ascii?Q?E69644HH88BstVbs6wkWBLpTD8ZjPgR4a75fC0ile+t/c7O2/jGbVMaWKnmR?=
 =?us-ascii?Q?H+hsUkuqJe7njvGuxJQvL1k7zH0932h1p27NPfXUtUcx49erDn3smbL4o3J7?=
 =?us-ascii?Q?SDHG+Qs/h5ffyBlsds4dwPiyHfAFfN8uxeqqBT7Qq+Bpi/ueIUTwc7kh2zGp?=
 =?us-ascii?Q?6SvAt9k5gxV8qBWmR6Uxus6bSi7n+gAWnj8j6aIU+5c2HYUzULFbMcAr7gms?=
 =?us-ascii?Q?FcgDnOqaR4sw64XIFQdzFw/UP8e93H5N3E4aS5VZpjH6XhZxA94laAHh/DT4?=
 =?us-ascii?Q?IeWH2oUjrOczzVpu5RWzccA1mZLjL2zvk7hufNZaSXASF4XKyLpLD4caa8EH?=
 =?us-ascii?Q?WzRY2Rp2WyuL0ZMXTR2jqlQByw/LtmZvhREEcwS6BCUaondGYkuOtGar/b+Y?=
 =?us-ascii?Q?JX9oGU8Tayxi5KSSm4Zszr2ls2jMPPx/youDLDWRRcSmW9tYdnFRZnrhqPMb?=
 =?us-ascii?Q?K35eUl4+7RtzK/vBbDCJUepENNHmgJLa1nyDMWoRxMcwJlvYXsPJljfDqx6V?=
 =?us-ascii?Q?xto7Jy+JAgCdkWfcTgWKzSgalov6s251Jwft67DxKx03K3MK7L2cxEd/Th+/?=
 =?us-ascii?Q?UCj+IIuxWQq3v6bzd2VmA53diYN9JeyKca8aonGGPTWXdONTDelBIntE76hL?=
 =?us-ascii?Q?K6TSjGBHPtCbY3VZI8xhIDrAVqI9B0r/1Y3rU19Gr7s8s/UBWmmtF0Zjuokj?=
 =?us-ascii?Q?O0gqY1q8KHxpsEP9B5bvFcBubKJmgCNuqKuBfo5zHIH8PMs/x7iJjWoIolhX?=
 =?us-ascii?Q?J8yt1A1LAP/hRPOFaKYnChl2lJTYgP4G1ryoLkQwCkPxxdDE1PYdrH80ZiMD?=
 =?us-ascii?Q?5QU1d09X/aerBaxwayef4GtudxToZWBbUZ7GJ5iHPCa/VHSjbvjxMEbzxyHq?=
 =?us-ascii?Q?Yr/1ogRSQKje3R2cyTwvloZQjB2Z50/iOu68vEOrNAEQRn79Oh6uWJFiq+ji?=
 =?us-ascii?Q?wRWneJxPRx9+LmFpUNTcAC1JBkOTnosmJ634tRLHAJZhCM4SiKdTfoCic+Mh?=
 =?us-ascii?Q?h8s96eUXfwUiNMY7YalTnEwLyDf2hv8I3pPOGVN+Z4INN/27/kLUOBYJ0Wuq?=
 =?us-ascii?Q?hm2YHpDg6PmS6pdin2sRSrjpdHoVDSDoPDlLSWMHZXIwuMrQF/D+qelvwMIL?=
 =?us-ascii?Q?ERi8OnyFZscZ3aB5rwb14D1BX5Qbj2loHJmK3PKZAzGg+zwMaHbQ8fhmhqCY?=
 =?us-ascii?Q?KWv9Wu0BJf7pDRERCecmnVS3WE8wIyI5u0qAJMeA1KdyZ7bWSwGwoD4EMVLa?=
 =?us-ascii?Q?oPLyzgyk9MXc8/kncYmILBQ3QAqQpAJNVA1+iZu9dbo+E7EACm9u8kLnFsLq?=
 =?us-ascii?Q?faLz2QZlpzL8s1MqZCERu4pRt+Mlx0McKVhmZBff1PlZ3xnj+fyKqW3D3chZ?=
 =?us-ascii?Q?RMlTYJLj/OqlKhd9cv96ZHOf0tV1vr/UBOf2Am1ts7alwo6mlRGHl7xI1Otq?=
 =?us-ascii?Q?VC8CObrgAhUZa+OYifmmBRByjMzVnaU5HTanCvXyjaA+BbKuaRTGfBG6l2tq?=
 =?us-ascii?Q?hVWMeYgmG91HgfhX+V1JBBzIRYJ3vsxx76Uo6Th+FwpTpcvP98FtZVysJh/n?=
 =?us-ascii?Q?M8gKutul5Fjy10yt7qqc1BYWr0H1C9295eOipXu0sVze9hu1/YHVas6Xh5+O?=
 =?us-ascii?Q?SMUcw5kCh/L9RiEx/vz+1ObxgTMPlKQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: designwerk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0c7a9a-620b-4500-4e45-08de659156f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 15:06:43.6488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f12add6-5f96-40e3-ac41-2307f36545c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hPbnaQ2qlBLwOEMeqcWUMxj9/KUzLjI9z2tzQWPyrPBwFi41iKSYaDDgav0Tf/UWwDFE49pfmZ02XLRSjpIFq3r/37wRpFJGstn+1/AzFyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1603
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designwerk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eYz3eNeA1JztWrSm527TB/+dFyOAZMKW/P7Q4nxZck=;
 b=gNtJ6RDd+Gi6ncUYsB9gTEaT75xdbjPKFP3Owe57VkUXPdo5DyS5xcDKdjvvFXP3CVaI0lPgWC1jsjJEeCU7GYVbFzlXtZDx3efEhKi/QGXZ5MghdR4KEdl+xF+3jwhBfvcUuC4qmYlZ7mMrs9QtQMWM5WgfC65FoUEPoxRgMuc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=designwerk.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=designwerk.com header.i=@designwerk.com
 header.a=rsa-sha256 header.s=selector1 header.b=gNtJ6RDd
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=designwerk.com;
Subject: [Buildroot] [PATCH 1/1] Updating license information to comply with
 SPDX
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Martin Bachmann via buildroot <buildroot@buildroot.org>
Reply-To: Martin Bachmann <martin.bachmann@designwerk.com>
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Martin Bark <martin@barkynet.com>, Richard Braun <rbraun@sceen.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From cbf5dd2b76ee68f2432f326c63807d1155d79e73 Mon Sep 17 00:00:00 2001
From: Martin Bachmann <martin.bachmann@designwerk.com>
Date: Fri, 6 Feb 2026 15:44:10 +0100
Subject: [PATCH 1/1] Updating license information to comply with SPDX

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
---
 package/dropbear/dropbear.mk     | 3 ++-
 package/libmd/libmd.mk           | 3 ++-
 package/mesa3d/mesa3d.mk         | 2 +-
 package/python3/python3.mk       | 2 +-
 package/tzdata/tzdata.mk         | 3 ++-
 package/util-linux/util-linux.mk | 2 +-
 6 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e4e42cf994..ad0379e89a 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -7,7 +7,8 @@
 DROPBEAR_VERSION = 2025.89
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
-DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
+# Public Domain => unlicense - which is recognized by SPDX
+DROPBEAR_LICENSE = MIT, BSD-2-Clause, unlicense
 DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
diff --git a/package/libmd/libmd.mk b/package/libmd/libmd.mk
index 8bbebc1bf1..6942fd9d4b 100644
--- a/package/libmd/libmd.mk
+++ b/package/libmd/libmd.mk
@@ -7,7 +7,8 @@
 LIBMD_VERSION = 1.1.0
 LIBMD_SOURCE = libmd-$(LIBMD_VERSION).tar.xz
 LIBMD_SITE = https://archive.hadrons.org/software/libmd
-LIBMD_LICENSE = BSD-2-Clause, BSD-3-Clause, Beerware, ISC, Public Domain
+# Public Domain => unlicense - which is recognized by SPDX
+LIBMD_LICENSE = BSD-2-Clause, BSD-3-Clause, Beerware, ISC, unlicense
 LIBMD_LICENSE_FILES = COPYING
 LIBMD_INSTALL_STAGING = YES
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b5300df2ba..db6217eae6 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -8,7 +8,7 @@
 MESA3D_VERSION = 25.3.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
-MESA3D_LICENSE = MIT, SGI, Khronos
+MESA3D_LICENSE = MIT, SGI-B-2.0
 MESA3D_LICENSE_FILES = \
 	docs/license.rst \
 	licenses/MIT \
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a240349d3e..3ead191663 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -8,7 +8,7 @@ PYTHON3_VERSION_MAJOR = 3.14
 PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
-PYTHON3_LICENSE = Python-2.0, others
+PYTHON3_LICENSE = PSF-2.0
 PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index a7b6dd8f65..7220672992 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -11,7 +11,8 @@ TZDATA_SELINUX_MODULES = tzdata
 TZDATA_STRIP_COMPONENTS = 0
 TZDATA_DEPENDENCIES = host-tzdata
 HOST_TZDATA_DEPENDENCIES = host-zic
-TZDATA_LICENSE = Public domain
+# Public Domain => unlicense - which is recognized by SPDX
+TZDATA_LICENSE = unlicense
 TZDATA_LICENSE_FILES = LICENSE
 
 # Take care when re-ordering this list since this might break zone
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index af6044af32..7617041a46 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -21,7 +21,7 @@ UTIL_LINUX_LICENSE = \
 	LGPL-2.1+ (libblkid, libfdisk, libmount), \
 	BSD-3-Clause (libuuid), \
 	BSD-2-Clause (xxhash), \
-	ISC (rfkill) \
+	ISC (rfkill), \
 	MIT (hardlink, flock)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-2-Clause \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
