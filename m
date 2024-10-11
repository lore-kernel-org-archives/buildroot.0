Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F71ACFD316
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 10:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A25981F3A;
	Fri, 11 Oct 2024 10:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4FMvbTA7wo0; Fri, 11 Oct 2024 10:09:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1763581F41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1763581F41;
	Fri, 11 Oct 2024 10:09:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB1861BF318
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 10:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6DA86110B
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 10:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWgZyr0X6ues for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 10:09:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2613::719;
 helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=piotr.bzdrega@mikronika.com.pl; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80A3B60824
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80A3B60824
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::719])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80A3B60824
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 10:09:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyXjrzuc87aNM0iALeBW3QI1S03vdl0utLtufwDh3EZbdOnMT4iJHo6toCL182mXWuQWRztZgyqCxPNpEooFgiqfI5TFxUYWzVDOQryrd2ZqgVgz4FD3CPOP/54cotwx512g9OHn9u8Mhl2G3e9fCUp280hS/DlghLouHw5WGQWVvSd6VZ1sovE9lusUgbJtFJK7kgkuzszExz6e3D7rcKkbbrxOtYwFWK5aPcCK7ny47Rbo8DlzbyXMhqByln51LoXB1s9WrUbsJBzL3pqfG2uYTjbp/Xwn6oW+aUMQFY77YfOIQL5oV3wBxhswy+YsNLo1VllOQGHVlX9KISiSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArSFMayiA/CY/Lw/ILi4cdLuAImlKk8iJLJ7436zpqI=;
 b=yuhoiz/emM2Uy8VlIjCUDOxEGDuUY09phnOCg9w13UuydzmKMrTGgu5HuS0IrklXAsuyVPccboPxdsTLhj1bIVS36dP/XxWzM1CbUc/kzojiyx7Atm5b/Eu0ZFdraWyZY1TOiEtcZqY+TbX2aerC3ScC0U2nO9HG2E8JzEpFfzOF0TN9xlla+WXjKg/06Vw5VYTRcaCfH9aX3asyn07Vhg5tAcekOv2QEbI/yfna+RoRHXFiGbC1iugclKQtuCgIuHyuQ1UAqL9wuIZsVULOhIJYtGZmcxIJEAUT3Z7IN30gYvBUW06jNdv5/0uMOx4dB2prOb253y4nIwoC+cfRlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mikronika.com.pl; dmarc=pass action=none
 header.from=mikronika.com.pl; dkim=pass header.d=mikronika.com.pl; arc=none
Received: from PR3PR09MB5234.eurprd09.prod.outlook.com (2603:10a6:102:14d::15)
 by PA2PR09MB7661.eurprd09.prod.outlook.com (2603:10a6:102:412::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 10:09:28 +0000
Received: from PR3PR09MB5234.eurprd09.prod.outlook.com
 ([fe80::dc88:ea94:d24b:17]) by PR3PR09MB5234.eurprd09.prod.outlook.com
 ([fe80::dc88:ea94:d24b:17%3]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 10:09:28 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Is Podman package available for buildroot?
Thread-Index: AQHbG8WDlf2vuB8HpUyr0ZONoKoYtg==
Date: Fri, 11 Oct 2024 10:09:28 +0000
Message-ID: <PR3PR09MB52345043F5D8A14B14AC4013CB792@PR3PR09MB5234.eurprd09.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR09MB5234:EE_|PA2PR09MB7661:EE_
x-ms-office365-filtering-correlation-id: 4b09d974-f6c1-471f-b6e7-08dce9dccb02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S1BTaUFlWGtFa2lPdmdPVCtYaGhXUVdlbm1VRVQySHQ2SDhlYURBenduZGZ3?=
 =?utf-8?B?cHU3Qm01c05QcUtPbGtiYjR2Rk1MSHZhL3pwY1dINzBxU2VGNnZ1RGR1enZ0?=
 =?utf-8?B?aUZmY0ZsRmllMXhVTmMrbVNkaUJsT3RyeldYWUtObDZFeU5tem9OaXB3c0pX?=
 =?utf-8?B?Qldkdk51eFQvY1lpQXY0Rk5uTENmeUk2RUc2eTBxSVJMbmoyaGQwZ1F5OG4z?=
 =?utf-8?B?TXBJNGg1dDJWaUk4TWNWME83OHQ1OFkxRFlvRTdrOW9neEpLRzUxOSt0dHZi?=
 =?utf-8?B?WTFQRW9zeElFc1NFcGVpVzY0ZFJmdWVSN2N4cHVoYzZ2Z01tL2UwejI3cWVL?=
 =?utf-8?B?WkNzS09oSEhQQ0F3dy9FVVZuVGgzQkV2bXhHSmNrOWpDUGRzV0pLSHJSd1VV?=
 =?utf-8?B?WTk2eEtGU3JNcytlSEpMbml6UTJ0cUFQMThxWk8zcEx1SW1UMjd3Y2JVS28w?=
 =?utf-8?B?ZzdvWjNRTUJ6NGVGM0RvQ0RXQkszZ0d6RGQvRjlNT3ZRNGVwa3B2WncvTkpC?=
 =?utf-8?B?NzF3U3p4T3hMaU1tcktkUDBEM2p2VGpkSktHYnhaWk1VanBsTy83dVZSK3M1?=
 =?utf-8?B?bG5GREVUQTNpODlualdNMmFFbkd2VnpDYTYvUWhzeFVJSk0rRXptUG9sSzhs?=
 =?utf-8?B?MFB1dXVxQTV4dDJ4T0l4L3MvdkRYZFR5cmVNSXNuNTUzRkwrbld5UkpiODQ1?=
 =?utf-8?B?bm56TlZ1Z3J5NFY4UFNoczRvSEp2QmZINWwxcGdzdk1ieUxrQlgwKzRoQzBF?=
 =?utf-8?B?VG1nZ3gvTElZaWFvOUNmYlNwSm13TlN4Qk91bFo0N1lYQW5jRHppb1VDMG1T?=
 =?utf-8?B?OTJkQmhSdUFLRmlVR0JiS0hTaElRSktqR2EzaWZuNC90UWFZcVkyd2dlSGE0?=
 =?utf-8?B?bkZlUXl3ckRBSi9uZGRkVUV1UFYrZFdCNjAyK2JDMCszSHc2UWFjb0VuQWNp?=
 =?utf-8?B?cStiMm9jTVYzZnM4TEdnakFvRHpNR0oxWVFkaFFITUx4R0lKS2lSTm4vU21z?=
 =?utf-8?B?OUJIWGpvZUZRRjdtVHJkSE5MVklybjJEYkViWmROREF2bDJLcGV5NjVvWkJh?=
 =?utf-8?B?clAzUk9OTUNQcjg4Ris5bU81SVVXNEtUbVRMdGdWQklYN0lYdElybXppdUdK?=
 =?utf-8?B?bmEwU3ZGZXVUd0IzQS9UbXRPZkNVUGsxWkxDeGdJekVrVmt4NXJHOWFlMWNn?=
 =?utf-8?B?T3dZaHlqVFZXQnB0SWhiK01YTmlVQlk2R3lTTHNuRXpYSGk0TitRRFJvdjVU?=
 =?utf-8?B?MThwVlNWVFFpa3g4S3FlNFBUZUhKTTJINTZtU0RhaWZTQjQ1OFlYTzZFdGxT?=
 =?utf-8?B?ZDdxTDE1ektuc21VTnpXM3BpNVRrbGRTQ2Z3RGdqYjBqTHJ5K2ZHQ1ZqYldp?=
 =?utf-8?B?TXJybjZCVEo5NDJlYlJCYXNaR0xYWjFsa1ZPUG1jVEtHejdxQUI3N3hoQm1s?=
 =?utf-8?B?Y0VIUjZhU1ZxR01UVmsyY09ORi92a3hSU3kzM3dSN0tCNWIrMWx0MXkwRGFm?=
 =?utf-8?B?SDNZRjVZclJvdWplcFlVc1djcy92RC80MGszUXNHYVU0M0oraTVndDE5dkNm?=
 =?utf-8?B?MGxza1FlSjMrRU5KWjdOQ1dKNGQyOGxzcVNMZy8xWVVKN3BpOEg5L2hqSlla?=
 =?utf-8?B?UXNYbHVrNks2RmtoRnNMT1BVV1ZjVmZaNW5PVStONjYyRXI2RTVPTHVQZEsw?=
 =?utf-8?B?dkZKRlJ3RTEzYkY4cmVPUWRtOVl1cHArRmNXbFBkZmVicThFZ0JUSEVYNjEz?=
 =?utf-8?B?U0hPVnM0OEZiaU9pdU5lUTZITGlHTFdVcW5vZURPdHFNVmthdHY3ekFVcFEz?=
 =?utf-8?B?MGZpQU9aL3hlRXhVampXUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PR3PR09MB5234.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHdLQWhiVEl6VnlVRlhXNXM4YlYyckQrb0VvR0MwMWdzbXFxaUcwU3Y2aEVp?=
 =?utf-8?B?WWlDbzFQKzRvVFlxK3B0aEtabHMzQkxxSUthSmNPUFcrUjVXQVV0ajl0bFc5?=
 =?utf-8?B?MG5WalpRd3BQWG10OXpNbGZZTGlrRERGTUtpaDFmOVhZcDhNVnNlSzQzcHZN?=
 =?utf-8?B?UjkyREVYbDNJb3JBbWxhU3pwV0s0QlJ1UDZFeC9uaGVrU3lnWU5LdnkwQ0JQ?=
 =?utf-8?B?cHFxcWxRY1puZ3BXUHM3UEgvWHJMbUZUUUNtTFJ2ZEVMUjhPK2dqK25KNzNp?=
 =?utf-8?B?V0ZnOCtxTm4xeWJ4Y1ViRGFGRGVqdEZiSWdGaTBvOXBLVEFmdndKVVZrUzFO?=
 =?utf-8?B?a0dWUWRLdjVyb1Jqa3BVcjMyUUZ3ajdkeVJzanhXZWoramdpVEpVZEd1Wm9P?=
 =?utf-8?B?cE0yajRQK3l2aENvOU5tRE5jMzJ5S01Fc2ppUzVTYVNYdjBaY1p0T2F4eFlZ?=
 =?utf-8?B?NlJDa2sweUpHd1FWbDF2SjdRdHN1UjBKQnU5Z1JTZDNWTWdobkdiVjREVSth?=
 =?utf-8?B?YmY0NVJDcWpTcTAwTjIrZGo1YmZGZWxlV2JDMEllQWFiZWM3YUVuZGxyTk1Z?=
 =?utf-8?B?RlVqTHVob2Y1cnNHVkNWWHUzSmsyRE1meDg1QkgxTGRZN0phd3hGMjFtWEsr?=
 =?utf-8?B?VDYzeXBOd25adGduMWNybHpyV1UraGt1NUxHSTh6aFBhdzNFSkM2UTVxcmoy?=
 =?utf-8?B?WVlVcEhScnRsYjZMVkxZRWY5Q2d6aEoxSmlLYkxQNmlPMkZTUUZXbGtDc0tN?=
 =?utf-8?B?RmQrTTIyUlAzeFFXOGpRcWJzWXU3UldWdUc5aFJyQVNYaDF1SEIrTlRseStl?=
 =?utf-8?B?SUVpRVczYjdEc0RVc1pXSDc5VXdud1NzM2daNGZucUpNbjhiR0UrRG9iL25o?=
 =?utf-8?B?OGNjQVV1SkhheTFLT0dDNEF0dFlhVjBjT3hpRGZmU0Fxay9UTHVjSHVnNjFG?=
 =?utf-8?B?SEFDeStrVFNHRWhNNXl6T2RlbkRpUGgvSVI3WUJhYW1DemkvUjRTeHdxQzVx?=
 =?utf-8?B?U3hLQ1pmTk9SaXlNdTFHdGlJYlpLTHI5VENzK0kyOUNod2x4K1ArVGhjWXVu?=
 =?utf-8?B?M2JpMGN0dFNrTThidDUwcThZcDZGc3UveTM4dlJ1UnZiemkzTVRVWS9VTkVt?=
 =?utf-8?B?SitIS0tXclpqK2s4WnlNd2duQ1VJMVJ3b3huWkU5YU93R0RoTDhjTjJ3RXI2?=
 =?utf-8?B?QVlWYWhOQVZVMmVRa0w4aGVaaEkwcFl5TEZiRUxEb1VEam1BZnRwV09LbTdE?=
 =?utf-8?B?L1NsdnYrWDEyNEc0NHlDbklIcCtGaDR2c2pxMUN3RkJMdFZ4eWRYQ0lvWHFq?=
 =?utf-8?B?aHlWeHVPUzRwNFZPVlRYYTh2aUFISW1MZG9mcmxtQUFuTjNBblR5dnYxejkx?=
 =?utf-8?B?RmV4T1RnaFJ5ZGlzQWU1cHRlSDZKenhta3EwUXkyazdRWUM5MkxXeHhsY0VP?=
 =?utf-8?B?dG9HeVplTEdQVFRUMEdjSVZDNFBCK1h0c2E5Qm1pTFQydXRucEk5S0ZrUkNo?=
 =?utf-8?B?REd3S0o0K0QxY29EbG1vUFZrRHhlQkJ2MHV5UEVOWnNjNiszTFFFYUZ3WXBO?=
 =?utf-8?B?dW1GU0d2ODc3UlRvOWxWOFR6VlgzUm81SDNyd3RwT3oxaXI1THZBcXFJMnVF?=
 =?utf-8?B?amhOdFVFcnRtdEMrenV4Z011aEJiSE1HVUJvOUpPclNwOWUwSmgvNks2ZzdL?=
 =?utf-8?B?cXNMNE5aTHJlMXVKY1U1aVFWeWFXYTlCSUsxNEhIVUdwQ3JaZFlldUhQOCtL?=
 =?utf-8?B?dGRjd3pGd2w1c0tiRHF1Ri90ZUJRcko2TWFvMzZLWTBEUjNZcGlpY3J0bmVC?=
 =?utf-8?B?QjBtcGxTUHFybnd0ZElaaDJXTUg4MDlmWk8wMm5jaDhjdkN0dURPcFJYZUNX?=
 =?utf-8?B?SStCS1F5WFNqQXMyeUhPSDl4RlpJSUNVU3dEZEUwKzFuQXR3ZUp3ZkVEVXVz?=
 =?utf-8?B?Zk15YWw4Z2pBMEJudlU3cHYrUnFQTUdkVXRTa3gxYm95dmNicEx1TUQwOFNn?=
 =?utf-8?B?cGNQUkZHS2U1Wk9OMFdLYk91bUgwRnovRjZVL3REUGs2UGRFUTdpaHpuaTVh?=
 =?utf-8?B?bVdmSDQxdkZUeXFJZlZMMGxjN0JlUDdneXdmZnhXMHd3dGNPa1J5K2g2M1lN?=
 =?utf-8?Q?Bz1R+pm6kJOQ+wA2q+FXAllMd?=
MIME-Version: 1.0
X-OriginatorOrg: mikronika.com.pl
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR09MB5234.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b09d974-f6c1-471f-b6e7-08dce9dccb02
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 10:09:28.7400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f9fdcdf-9765-4fa7-833f-1ea87227a25d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RoOlN0ZYNYVWk9R3vnZFyJqUNXs1bf+VyvS5LmKQkgR9GFDmkOxV0jgZv33NKcp5XIM2Nrswg8X6QMZp2D8Z/dfEsVOyX/ZLYFt73FEtjM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR09MB7661
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mikronika.com.pl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArSFMayiA/CY/Lw/ILi4cdLuAImlKk8iJLJ7436zpqI=;
 b=nkPJsIYHNjDO0JrTDvON/2KTBZ2GxySlhWLoFJjLomNFJkt8RTIWvhIPXbfggHxbtmdaqDWpDCGdZJp9Cz2DdjXhwbA9a8nHx2hiW9s2MS4R1kv6vQryOBCejjC00289aM6gt80bkF95j6y5MswTaFUhy06Z+mbViHhwMFZhU9h5wG4nUDrLJkbz/zq0FkKI6eYJrKBqmX/gHovEbrjH8g8G6rscm2+RqYge+SBoVs00MIImKDQcJ9SnRRZOA4VTrXXP4oXcRhY7PDgkdBQPek4vntrPn5bAdF7I7j0E5meGfCeKEigwCLKeHym/2CiztPamk+pkOQaW1D/sdrZcSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mikronika.com.pl
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mikronika.com.pl header.i=@mikronika.com.pl
 header.a=rsa-sha256 header.s=selector2 header.b=nkPJsIYH
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mikronika.com.pl;
Subject: [Buildroot] Is Podman package available for buildroot?
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
From: =?utf-8?q?Piotr_Bzdr=C4=99ga_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?B?UGlvdHIgQnpkcsSZZ2E=?= <piotr.bzdrega@mikronika.com.pl>
Content-Type: multipart/mixed; boundary="===============4885429723544724524=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4885429723544724524==
Content-Language: pl-PL
Content-Type: multipart/alternative;
	boundary="_000_PR3PR09MB52345043F5D8A14B14AC4013CB792PR3PR09MB5234eurp_"

--_000_PR3PR09MB52345043F5D8A14B14AC4013CB792PR3PR09MB5234eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGFzIGFueW9uZSBiZWVuIGFibGUgdG8gZ2V0IHRoZSBwb2RtYW4gdXAgcnVubmluZyBvbiBidWls
ZHJvb3QgZGlzdHJvID8NClRoZXJlIGlzIG5vIHBvZG1hbiBwYWNrYWdlIG9uIG1haW4gcmVwb3Np
dG9yeSwgKGFzIGZhciBpIGNhbiBzZWUpIG9ubHkgc29tZSBndXkgd2VyZSB0cnlpbmcgdG8gbWVy
Z2UgaXQgKGh0dHBzOi8vZ2l0bGFiLmNvbS9Ecldob21QaGQvYnVpbGRyb290Ly0vY29tcGFyZS9t
YXN0ZXIuLi5wYWNrYWdlLWFkZC1wb2RtYW4/ZnJvbV9wcm9qZWN0X2lkPTI2NDgxNzQpIC4gTm90
IHN1cmUgaWYgaXQgbWFrZSBzZW5zZSB0byB1c2UgaXQg8J+klA0K

--_000_PR3PR09MB52345043F5D8A14B14AC4013CB792PR3PR09MB5234eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpIYXMgYW55b25lIGJlZW4gYWJsZSB0byBnZXQg
dGhlIHBvZG1hbiB1cCBydW5uaW5nIG9uIGJ1aWxkcm9vdCBkaXN0cm8gPzxicj4NClRoZXJlIGlz
IG5vIHBvZG1hbiBwYWNrYWdlIG9uIG1haW4gcmVwb3NpdG9yeSwgKGFzIGZhciBpIGNhbiBzZWUp
IG9ubHkgc29tZSBndXkgd2VyZSB0cnlpbmcgdG8gbWVyZ2UgaXQgKGh0dHBzOi8vZ2l0bGFiLmNv
bS9Ecldob21QaGQvYnVpbGRyb290Ly0vY29tcGFyZS9tYXN0ZXIuLi5wYWNrYWdlLWFkZC1wb2Rt
YW4/ZnJvbV9wcm9qZWN0X2lkPTI2NDgxNzQpIC4gTm90IHN1cmUgaWYgaXQgbWFrZSBzZW5zZSB0
byB1c2UgaXQg8J+klDwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_PR3PR09MB52345043F5D8A14B14AC4013CB792PR3PR09MB5234eurp_--

--===============4885429723544724524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4885429723544724524==--
