Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ABFCFA463
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D555C812C5;
	Wed, 23 Oct 2024 20:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xq0rCyEqIL6N; Wed, 23 Oct 2024 20:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFEAB812C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFEAB812C7;
	Wed, 23 Oct 2024 20:07:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D50443F2E
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A92C1403CB
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p24GO8_FglJi for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=019871083=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1767D4017B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1767D4017B
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1767D4017B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:07:47 +0000 (UTC)
X-CSE-ConnectionGUID: B6sVc8rtQXuF337H+GiDsA==
X-CSE-MsgGUID: dV8GldbPSOmCE5PVoXCyNA==
X-IronPort-AV: E=Sophos;i="6.11,227,1725292800"; d="scan'208";a="29711059"
Received: from mail-southcentralusazlp17012014.outbound.protection.outlook.com
 (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.14.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Oct 2024 04:07:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2rMrhXn5ICs+UcmY9i2bRlfD1P/mhZZfzwVlkbSVNwbiJgQoukaUkMtSsqfMsfWYv/3SaknEPWqrTVaXGKTtJ6vJ9Fe6T09DERnQALK/Sc3itLZUSksPD106Zu1upQigeVci/BB2BM+BsojhjaDRCS2NljoDF1ssRZWzBTX8qEifWVgaiTlKjkxu6StXY+jzQhl/dW/skBXauFnwiyar/XfWHT0PcwVySWmzNe0bw228Cl4YPgcZqIZlOWaNjXUQ3q4p7QQQo7BAbxL0rUoD6GKndsR0YL+wz3rwZvGnSXD0hDGya62fLGi4QsELW+PRKf9FyD3jo+sChu+h9omXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdagoVIjasvZUTcIcVMlrahxyPSyxWWzfdTSfT+4CQ0=;
 b=owQrnoUHu5X4q2ZWZyZMPIlXpVQmmr7fLU67OejXTfE0tMLMHMGNCA3l6JFxy2s1lVrpErD9XaDR8ATF0COQZqAxd7tyEMOxNqr0Yymz5aSINyYUV8eItZhWu0E7Z4x7Rlj7Oowlv6bYIbBsKltD702gWqT+BYZvogGPr3qarN6hRAn4eTCxPRI9QZaU1XKZjli5hvQDVXLTgoUCDmORUa+8byNzUhZUPzXOWorxtw+8JVdTSyYhr4vLb7+t01QAQRsSMyQx3xnkUuCQ7mpnWN/lFvO9QmnnzKOpLqtg3tLvDW7HnkJ0TEYBJpe+mmkLc2t20Aou5vfD9bK1EST48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by PH0PR04MB7397.namprd04.prod.outlook.com (2603:10b6:510:1d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 20:07:44 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 20:07:44 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Niklas Cassel via buildroot <buildroot@buildroot.org>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Thread-Topic: [Buildroot] [PATCH v3 3/4] configs/rock5b: use the arm64 rootfs
 partition-type-uuid
Thread-Index: AQHbH87dqeCkGSwLtEKpvuffHiWtirKTSDyAgAAREQCAATWzAIAAP9KA
Date: Wed, 23 Oct 2024 20:07:44 +0000
Message-ID: <ZxlXj4Ov7K5Zf8Uj@ryzen>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-4-niklas.cassel@wdc.com>
 <20241022224945.4dc67b89@windsurf> <ZxgeOudkPEBVJBkz@ryzen>
 <20241023181918.13ba7a70@windsurf>
In-Reply-To: <20241023181918.13ba7a70@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|PH0PR04MB7397:EE_
x-ms-office365-filtering-correlation-id: 7e03dd11-ed47-48aa-63e7-08dcf39e5b7e
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6b9trioMEvAYGmWZnZ3GkfAgPkUXZVT7JYYRxF3+gT3kdn4klPIw8jTSV+AB?=
 =?us-ascii?Q?ob9r94ntY8281vRfxq96/IC4S09p8JJwzz49qg9GR6IoWmn84Amruu1FkTpH?=
 =?us-ascii?Q?fkp9naP+dPtOpUWrKd7gUQ3wZ7L2HkaGDOUlPoS/ZFkFtBsTtAL/Kxz4IZTz?=
 =?us-ascii?Q?jeCPg/vqFgwt8c8yRvbW2Cs1JwHZlv46xhoBrqmS643NqD7qbUa28km0mqxG?=
 =?us-ascii?Q?7pst2/+HGHjTcwSQ33K29AldfOJuPU0OJrlisQG+oF6ZYx1s3+53mUv5CW8Y?=
 =?us-ascii?Q?uE5J3R5HrwN9CFa/V1bwjNtyqYkEw00qcdRQuy7xuaWk4bhGIFabVQFn0Zy3?=
 =?us-ascii?Q?w6/nnHjaD/TaoOUhpeJNjEa7OEWGc/DMHClEOwGWu+bOfbgR2oYgJKGFvXbQ?=
 =?us-ascii?Q?MciEucCi1hAj/1AHjwmkiOcYbOMpUrERWt4mE/3hgrKyhFYHVf1McPDHhMdc?=
 =?us-ascii?Q?CEg+J/gACq6sWBGwqmdKXIjLtsCveTPv4yh4Anr1PlBq0Fsh2taxMnkDhMF2?=
 =?us-ascii?Q?mLkrtCloICd8rZSHpMoHERpvvi5NHCki1X2yoDtbusG29M5B8qfvO50x2BVw?=
 =?us-ascii?Q?2BvGFqt3nDW5P0cazucxcvVfjlmxYtkbj1rj/bYvUFy+Ra0qnpK/pPkb6Evc?=
 =?us-ascii?Q?g0HUjQJtsK2ZzqIvEu8byBdP0GorWhNHIhwYV8k7KccTA4kfCGmefaBLhd6v?=
 =?us-ascii?Q?D7CScrFLuXKrLXOOWQvfA/Fp+jFPBTRZzX/mihtjLAginZHb6hls1cg1dbxV?=
 =?us-ascii?Q?vWbUNErWAqfiNGRpMuZVdw2v+4WUBvwA6gSq8pbRypf1NjTLCv+zOTxMZiO8?=
 =?us-ascii?Q?kgTVE7hKXbRA+V+YjXV2wtlpJnEkq/mNSPREWb1gcYkL58jo7dEIiopyg4S2?=
 =?us-ascii?Q?2TBwm3yBKo2nq3JlpTuSenxqgUpHOMtaKAtuaiHUjLbACzWD6jsiFBi35Rjp?=
 =?us-ascii?Q?JRCOSadTMcfL+Q2bWZkvvKJFKd6c0SspHY/E921VNhSLh9EAR5ymBwBPuf0F?=
 =?us-ascii?Q?P6x55tz+ZYwjpjISgh4Z5PYa/WO2lAbbPJybgTZns+ctv8CJNGq2uEg1VcvP?=
 =?us-ascii?Q?SJuHfJSos4j8lqcwQxJ3JJACRbYl9ogwClm952wOCcwpxBEyYMO7Q8HGYPBJ?=
 =?us-ascii?Q?m1EeVccWhd+jBmq1bkfr43JXmO5guyUVn5iVinooDHoddZ1eAeAqtUmO3aVz?=
 =?us-ascii?Q?1xpU6zRKalKt/QJ1Sx9xFkcRXI8xTDdd9N0RtKCOe2AO/FXCVuEQFhR5pThh?=
 =?us-ascii?Q?N3NarfS8w8dVAtN50uB3dDZxn34QeppJgSd0CJyr+yZ40qPw971kr1pmLic3?=
 =?us-ascii?Q?rHtRfo9i2jdwFhSo7MkrfBHKExEE5AUVKGGtWHjRAnuxxw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FjYux0zfPZM3bZAYa26lTHSFwggfaZUiyh0DQM0LfMcAZTy3covJLp0SVetK?=
 =?us-ascii?Q?t/bWC40L6m14n0CPVVravOIx835Pm7+f6OiduPDdRii7LFkS9qhHMAkqEHIe?=
 =?us-ascii?Q?lxBUT78Tz25FeawgZj8lnu0ufyAtsnPoiVzBczPYXFMLTbRpgSkAHaGouGWj?=
 =?us-ascii?Q?iHueBXmxZEmLLmd4LXO2LLyiTg+hx5QYuKgKPJ6PplyGn01tfUDZXdjpskrP?=
 =?us-ascii?Q?aBav6Is3MlCCvW0vvM7ZQXTGUKgadVN4FCDpexjwthhWtwTwva+RzZH3Am5C?=
 =?us-ascii?Q?TJS60eoGeJO3ms0JooMrcOePuObPkYgecGVQnwy/++0Rj0KLo2Yc1fNboWSk?=
 =?us-ascii?Q?LPeA5P7uZgb6bosAWuINy3YqirmGbFD/fbKlH0XCfD6qaGjidJH31HUvLOFS?=
 =?us-ascii?Q?pBPxndA3MVfulIa6910jPK910VVulqnnMLsjwchaGUz4Wvr02b9NzwJpmc5U?=
 =?us-ascii?Q?3VOTCwjA2TMWNWjSlbAj5Il70+vUv+9SZYLBfgkuokU+1ggmrpu/vm7DNZ/y?=
 =?us-ascii?Q?K5k3ynz6WZpvNa8Qtd4Z5n1PANesp+/hlxQH5Ik7+AJk+jX2cFa1VzSQ9GyK?=
 =?us-ascii?Q?Ok5czTQPTRxY2eQx6ug4MjuFW5pLJg+4qCtsMG+N/ReanqRCY3LIiN+yWHRk?=
 =?us-ascii?Q?6DtqOGDjaY1p0YHzj7t40Jh4JhWnztqyUHSK5rXXxtY+8D2tT6Q7ON+UZGIy?=
 =?us-ascii?Q?Efx+T8OnLDNy+7Y53bwEwiZl4WFayIVUJEZR6CBxftZfzx1yGQnxyb2c4std?=
 =?us-ascii?Q?joKb8SCRZutvRekHdsOt9W0L8ruBEao+bCHCd0PASzJHm66x5HzA+RkgGBn0?=
 =?us-ascii?Q?fw2Ut4zydvFDfgCQJA7+fWd+RTq7PK+IMa2zCGy2JHmuutpAZQ2mZwZl12+X?=
 =?us-ascii?Q?fqY1VIzECJ1x8bB2xzgWA8e+3gktPzjAilketabvgT8MQk/5j6alBmi8Yw7P?=
 =?us-ascii?Q?ZJJt/EDStkczc2Usfx6zeFkAw6nZGiJwFWfwWd4ziMmSgPu8+vJ2qEzrQ6l3?=
 =?us-ascii?Q?U3uVgU+NOjhNo5bbIw3DX+yJYP8oKE6McSXSA6WwFOUowjeKmt9DMIDKq3FY?=
 =?us-ascii?Q?hnTwXyMxlrfBwg7cR3FvRT+cFLUDc1FUoIVnJ0PHmJjFj8CDkGlujPgO9zqb?=
 =?us-ascii?Q?jUjmpbi/DFstL6kLu1Tlj/TDYEmNQAy3bRgQa3Toa6A/pV571eN2POHa6unt?=
 =?us-ascii?Q?v5303g/KcUDp3lFLohlegjaPc+9NJ0DLKI+BnbS1PihxrMIJ0i6vDaXp0IBt?=
 =?us-ascii?Q?cGF8WhfBEoJkqBR+johadQ+pc1P6lE6q61txmf/iM2XrN9IkDQpqhU2FNAO2?=
 =?us-ascii?Q?JN4g8xQVCbDdCR8ttqSqLCDEn0lr7F4c+JWus5j2bR55YSFcfzY5/UOv1BnF?=
 =?us-ascii?Q?4juOUszefTLG8eha9ejbU3fZN7EX9Xh+PUUW6KUN4Uaor3MmpTtpA5tDDSKG?=
 =?us-ascii?Q?CUsLp5tcFYDrI/13OCYk5Lqn7KV5b3sZMw0fZ1W6GzLTNDwT7sFEt3yGp0lE?=
 =?us-ascii?Q?00q3LmwIK86g0FAcrUTTu3NKwWqyV7H7iFvIBG+gKrl7/zSpAGVWx02WINu6?=
 =?us-ascii?Q?3V9F0IVeX7MD46VXl26eUvCrC+lIUj7ksewooSyxgwaoH1SutVPiIcMEdLo3?=
 =?us-ascii?Q?OQ=3D=3D?=
Content-ID: <07A29B0C8649E348BF1931848DA57964@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3QeyOx/kf5tau9fQM/jcHWWK2/qOkekSDPUnZEt4NiNBJy5nI5t5RNt2b34Jt7G+3iP5GcmKgC2zwAnLPPE/445vSY3hcdixh2sw4T942ddHFWn6mbayW1KXHPM4iN5fgHhmJLgJn5RXeFeBWupdgExE2bFwSKq8XG4SPbNXcyYqu+UEyCoD8seaIMgf39f2I85smfmG60QyDl5YlBrIi2qeofpBia3paB48IPxWiN0Xo6IFfSJNT5hfvGJsHJmWEBv8nB31Pt8hNn1OUPb4N+NOd4S5yRJ+aL6cnl7RY0zbqdRzeDNJMI2FLQ1xZgMLhWmdT5B4GGJ4S43zK8vni2Rp+4SmXmg9Wp+STV8uCphsjf67qFU1j3aPqxL3mWJBWxc1OL67+/aZyEjoa5YRKh18nXDdLw24aGxtSIxNKsQW9raQ6Bijg6JhTuQFo0AZ6E4cW/togBK+ex22DpztMjVXC0wnl1su0JZ4K2pCz5rH03tHKWg6sfi/r2Nl5VTfWQePEQBqlG5h6POx3DPz0O8SP8ZJKTfB9WeLbuI32cMTxnZBe8D+EiPVBOuFyCS6P2tKuSlk2BxaR1n91Rxp6Ijp12IgQOVKMVDsB/caz+TYtCo17WkR4ZCPNVHp9v80
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e03dd11-ed47-48aa-63e7-08dcf39e5b7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 20:07:44.4680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6IWvfh7VOSb6E/Ug+mPIkHNE4gi0xPVdFiy7pr48Nby9eH/My/xfc+qAb4eryEKBJhK9yDTo0Gx0JDykfvn9Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7397
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729714068; x=1761250068;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=HdagoVIjasvZUTcIcVMlrahxyPSyxWWzfdTSfT+4CQ0=;
 b=A+TF4ojlpuqC8Cxnx7Dha7z6sHkkAnXGzmymJoGKYboNGFPf3ge4kbPn
 7d9uAd71sTAAcNyXm2azZNitiDJktF6Rss1VLZqggzz8vFrsD02r+uvz5
 /SULQCe8cTkjYqbW1T0uHFrgCIxUKnI/4ucqKiahQOF+IXiSe+UMZRdpO
 xtSyfP8Axyo0jJFReCgiuRJ3JguLnnFf4ccHyYnJQ/1iAYm29JeAs53Tx
 YTFQVCv2eBXfxNI9R6VEGr1ZLR25Q24vzYVHrBu2rnlbMfKC/sWSpb76D
 Ye3IRUj5vdNr4PxKahuqlNID0eUNP1YTZbuCtCuWwO6maf6edN5aa/0VX
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdagoVIjasvZUTcIcVMlrahxyPSyxWWzfdTSfT+4CQ0=;
 b=DNiVtoyt1ZX9qZ2rEUvKemq+77yb1xVMl5S6cyHkylef0vrChzC3UHupBCnKH/LKJH7gw+LMYb2+s5O8ce6tDu3TLRL9sXt10jcKdnk+fLoGkLDcnBT2wzi6kcPK4drd3WTqmWE1CzrS9fHmTe+pktxRwbud7Jn69koMMvNzcpU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=A+TF4ojl; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=DNiVtoyt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v3 3/4] configs/rock5b: use the arm64 rootfs
 partition-type-uuid
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Wed, Oct 23, 2024 at 06:19:18PM +0200, Thomas Petazzoni wrote:
> Hello Niklas,
> 
> On Tue, 22 Oct 2024 21:50:51 +0000
> Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> 
> > I don't feel comfortable to change it for platforms that I don't have
> > access too.
> 
> Absolutely, but we can evolve what we can consider to be "the best
> practice", documented in the manual.
> 
> > The reason why I saw this was because u-boot has support for searching
> > for a suitable rootfs (if CONFIG_PARTITION_TYPE_GUID).
> > 
> > and then specifying the type using type=
> > in e.g. PARTS_DEFAULT.
> 
> PARTS_DEFAULT is used to assign the "partitions" environment variable,
> but I don't see anything that uses that except the fastboot
> implementation. So I believe this PARTS_DEFAULT is only used in
> conjunction with fastboot, which is irrelevant to our discussion.

I see.

There obviously is code in uboot to automatically detect and use the
uboot-environment based on the u-boot-env partition type GUID being detected.

I didn't know if any u-boot code actually used PARTS_DEFAULT, or the
root-arm64 partition type GUID, so it seemed better not to change the
partition type GUID for any board I do not have access to.

I could imagine some board supported by buildroot perhaps having a custom
uboot script/config/patch that somehow depends on the rootfs GPT partition
type GUID being what they currently have configured in their genimage.cfg.

I tried to do a 'git grep ",type="' in buildroot, but I couldn't find
anything interesting.

I did find some ',type=' matches (related to PARTS_DEFAULT) in u-boot:
https://github.com/u-boot/u-boot/blob/v2024.10/include/configs/starfive-visionfive2.h#L25
https://github.com/u-boot/u-boot/blob/v2024.10/include/configs/sifive-unleashed.h#L38

But perhaps PARTS_DEFAULT is only used by the fastboot support in u-boot,
like you said.


> I must say I'm a bit confused by your reasoning, which I have a hard
> time following. Could you walk me more step by step? Either I'm missing
> something (very possible), or you're missing something (also possible,
> considering how crazy the U-Boot environment and boot flow is...).

I think that it is most likely me who was missing something :)

It is most likely safe to change the GPT partition type GUID for boards
that use u-boot. (I have no idea about edk2 boards though...)

I've already spent way too much time on getting the u-boot environment
to work in a nice way. (I am happy for all the feedback that you gave,
because of that we finally have a nice solution that hopefully will be
emulated/copied by other boards.)

But I have to respectfully decline to clean up the inconsistency with
regards to root-arm64 vs b921b045-1df0-41c3-af44-4c6f280d3fae vs L.

I have too many things on my todo list already (including some important
non-trivial tasks that I wish I had finished already (if they only weren't
so non-trivial :P)).


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
