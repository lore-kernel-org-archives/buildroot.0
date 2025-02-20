Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298B4C021B3
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 13:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD1960903;
	Thu, 20 Feb 2025 13:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EE3Mv4NGQwo; Thu, 20 Feb 2025 13:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC85160A40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC85160A40;
	Thu, 20 Feb 2025 13:25:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34F18194
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1795A40096
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikS1nd5Oh6Un for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 13:25:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=1392cf689=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CE6B400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CE6B400BB
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CE6B400BB
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:42 +0000 (UTC)
X-CSE-ConnectionGUID: H+5U1wCDQqqSG78WbEq5pQ==
X-CSE-MsgGUID: BBZLXcigRB+BHesheXGa4w==
X-IronPort-AV: E=Sophos;i="6.13,301,1732550400"; d="scan'208";a="40000802"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO
 BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.9])
 by ob1.hgst.iphmx.com with ESMTP; 20 Feb 2025 21:25:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiqhbIrxC4J6Jjm9qtMKlv+e8GL1G5G7c1SsLOgzLD0m3hsb3mSS039a/QcE8ETpZPgnYA0Ia19IMWDIsUkq16YtoinEP4qfue/heYdc8NgBAvtLG8aZ2FVOEaFjf83JpM5QzBpZthRbYYX5rnvyUzRHMLFqUi8prk8VCQGbi3dxbpcvdFH3YdkWIiKhMudVgnRIfxYYjxGpkjJIWgdUs9nLwQV9I4LnDN2U4+DptlpthcqrMAhn6yW1M0CVG6i93iB2zePJ8oBehJeFScFHaSPs6lcWwLffO6fs1nBS9QbrGws2SmWDlQLbp4YvglmUySufHD91RNTAanRsszRKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht8EtGgToZ6G/C901XR/wXi/4NTSUQpy0P9Mn8vImd8=;
 b=Y/ZLLUbxB6J9pONUWnD897sMEojk4Ay3svTVe7Dy+oQCdieWGiA14CUg9QbUBmwFEhDqZ4y9n7q9VOme4MI4mxJwjFULavHnjsBxoCYaePWCM0+bn3vX5haau+4n8/YP/o0hBGRUkYclwTPFmO1fO5G6rqMQZXwCYWVwLp7MINmKI3ERXMtSWnqFfMZBMFdmWO26KALj071rj2CmBqCbwqJ7czn088qtbC8/BcNQVoHAFE2ASbv5cA+dYXNDCWszLpuyTVsCBwoh4cudU4fxvql5cqNb/WEBrAKEJaywsHMiEAzb6joWDgVGbLmbg451y+tPW48WvPptMR3cEykjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN2PR04MB6288.namprd04.prod.outlook.com (2603:10b6:208:1a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 13:25:32 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%7]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 13:25:31 +0000
To: Romain Naour <romain.naour@smile.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Niklas Cassel
 <cassel@kernel.org>
Thread-Topic: [Buildroot] [PATCH v5 2/6] configs/rock5b: build and install
 rock5b device tree overlays
Thread-Index: AQHbdyL8Daf8WWIGCEiyBjWWSwk7BbNQR4wA
Date: Thu, 20 Feb 2025 13:25:31 +0000
Message-ID: <Z7ctSqqGhJnuYyox@ryzen>
References: <20250204163622.192932-1-romain.naour@smile.fr>
 <20250204163622.192932-2-romain.naour@smile.fr>
In-Reply-To: <20250204163622.192932-2-romain.naour@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN2PR04MB6288:EE_
x-ms-office365-filtering-correlation-id: 1e56f863-7a3b-41ca-978d-08dd51b20c9f
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Wkj1sSJxK26wkBPb+Kz8EIZMqJPypw54R+NPL9O9ENweGA7dZBycWD5K/nUU?=
 =?us-ascii?Q?qzH7XMmQ8UCDD0W59on+2os/m/il3bqLeYwUlZkzxWP8lvmHzLH0ROggVJ1E?=
 =?us-ascii?Q?gD+hV5gN7gbzkeBfseVdozKotFuh50LSrb2i/UfR1XlbVx/pVcwvNaq0pBY/?=
 =?us-ascii?Q?G5AWzHXXLf4Yn5PQzyRyTAQ+Cj10IZsddasGbuOAyME2gqI58UegKJnBDRgG?=
 =?us-ascii?Q?ZkgAvhVo0+/ntaDRsu1rWhAwjgyd0BWk9Ny6ibYgiFQ8xi8HUmtDEC0tWAzC?=
 =?us-ascii?Q?MSo/val9vzzXEPp8q1hj7BR1PjhutrTKQaejiTxTsDKzl6YW0BLZKgU61Qhq?=
 =?us-ascii?Q?X/m8CJp0+b+QgMtBjF0k4O3MSzsVhw4VXbKPG/7mvqQUeDleduqz0EW190a/?=
 =?us-ascii?Q?aKtkthjpdfuMa69eDlyCyyZeRV4tsnrHVL8Up7OtyC3+jMl5Zv+qEun8Play?=
 =?us-ascii?Q?YMYynLye2Pez4vGvYEXJ9vWa56LPyQ9naAK7hL1Uy/mG7RwCK89ZEIfe66Rj?=
 =?us-ascii?Q?77ULGnC/K9oRHnDc9PggGEwB4BnQXAkRk/WB6iyesO/iaIt3B/SrnVNlVkhv?=
 =?us-ascii?Q?Pl59ZPe5yOW0ggME3geWNyutHQqTIlGSpFAQ+aClcSLXk/veInDEaW3GNxiz?=
 =?us-ascii?Q?7hYLVZjWbLk5V4/P9rSqrMKBqb3a5euPO3qKUqkbRyPUz8ShRUTqHBMkFlLY?=
 =?us-ascii?Q?mCSJtFpO0aFjxCnBRbe0kH4g0rVW6q6AwAeUGIEKXXeHHY1MASpw8lnNKgvT?=
 =?us-ascii?Q?EthGx3tf+D2YTXKLVYKYrWZB9HrAbeS03jhCDIqUY/w1DOo+DMMb0I0EawtN?=
 =?us-ascii?Q?0MjwT485nYKY+pQ633b96+UAkyIP9JqBMPxpiftF8dC8eG+roLZ5dDItz0q5?=
 =?us-ascii?Q?fZc5+TJl3i3JzL6lXoTkJ5W8g5MzuL726kx0TduhCY5Pvn+Yl177iNDUsClh?=
 =?us-ascii?Q?u5G4TWu3WquAee1OivGj41asykZdwalLO6wlxPZ175GIU8M2+RFOsZGRuc49?=
 =?us-ascii?Q?zXBN79X/KZ0f4JggwMiu1Hq2YfcslUAiEypYfKvLuZNYEYQPf/jLjKfAhgAF?=
 =?us-ascii?Q?9avv79TX3slyNY+L71/2YRwGmZHpevGTk4GVYpbmjFB+NH2SSGGJdJdBJZpC?=
 =?us-ascii?Q?x0uBkJg6mWWBnKb5NmpJFxhtok40jLQkgJCH5aXqRF+nfgCGx3zRjhqdkFcN?=
 =?us-ascii?Q?nYxnKwhjMERKqiyFCZqjwEI2JA+YGfZBrFzrvCgQHvViFuiCf836Ejrsmgoj?=
 =?us-ascii?Q?2E65umGrSIhZ5re08EKpQk741jjf+2slLYqXdflAji1MMhnybnLCoRe8jwGk?=
 =?us-ascii?Q?qE9nT47BouT3uH/Uph8qP2zxCf6RczkZOH6Qc5g2Nbe9KTTXRMtOPMIrABxA?=
 =?us-ascii?Q?GZ2PrNUCnzDnUNBVknVOeJk9L5OA+oAW9IyNt4Ch6v0ve5mycvIXbTr259Cb?=
 =?us-ascii?Q?gV1C0g0ShVc9gFtrAQsycQ2LP5/qg0k+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YpdhHMRu/gIg0SCWaxm9S6YDIREamR6kEBXAdgXrMrckkVUHmOn0KcbQTJP0?=
 =?us-ascii?Q?xPTzyGl4Lpx8JtiZULbYMOhr9qvcppZ6DYSBvs6hpt+AzOXbly+Ayt3KuHmH?=
 =?us-ascii?Q?QWqRbNs/nhyU0aiwam/yx2vbhQGeVCwwbZyiWaXrK+K52XA3n0tTzdkpfZzQ?=
 =?us-ascii?Q?D9sR6R9J7m0otK3ZfZjpG226hn5Ef3kZ0OqMDg2GYGU4HoQgQETkeMgqp0L0?=
 =?us-ascii?Q?DAIJbXpeEZJ1sh6GQxG7hcmbDtHT7CKN6FeXFN/nxsm2dMsuNImtAW1/Ah/T?=
 =?us-ascii?Q?ygvbsj3BilShH/8r2X6cmUaaX0wjFWJU8S5kja7ZbQ6lGeeHH+trwkAPkSsQ?=
 =?us-ascii?Q?GOcnZCL7ZjVm7jM/DMN8nY2PsfEZEmwoauUNoi8HJ/F04STI74lofmAjfH71?=
 =?us-ascii?Q?0wDIT5ng+n97Jt0wDylKQ+zvxoEjNZExXnOhwxIKkZRapsjVYbUoDX3BlLq1?=
 =?us-ascii?Q?SoHQyR1m8jOMrwZvFhHm37jySjpsHaE3yh9WgEmhqys9Dud2ovCyKfF0t0F/?=
 =?us-ascii?Q?BB7UemSqzYmvhgaxyhZXZedBcKQ1+9cRmwsItX37N1uHczNP08DBdF9P69fV?=
 =?us-ascii?Q?al0eP5GHGMh+0AuEmsDFFiIrO0DlXk6NrkCqe18VS/J+2QLv2G+NnXYLRM4U?=
 =?us-ascii?Q?cb90eLGV53GoRV8BfGAdfTm+mzntwaijW7m43UIZ9KKOnzymFKlXkTIUpQDW?=
 =?us-ascii?Q?BV6y2UF787Wh1xI8gzEBwnr6V3QOp7o9pJS0oe7+D3/fKwnhli/TLmOhEpRh?=
 =?us-ascii?Q?WaxjPW311MzSQNDjcTMZPp6a9nOoI9zbV9uS/4wCOoosRXvVNXtP5QUKxjqA?=
 =?us-ascii?Q?KvTWei1nI9oNY79MlXS0VP6ur/EcRzNQdrYQnYLPBUfCdKjIlS7tN0QjmbkT?=
 =?us-ascii?Q?jTjEjz7HC2A1jxC55cBqws56IE31X3oNyKFYq5ewQHEFKsmYe+MB5N+xQ+ny?=
 =?us-ascii?Q?Qwez+PLcrc5xCpBgr6bNqdjSFj02Hy5OLVy7PG2SeyF53nO5FTWeoBNDKvux?=
 =?us-ascii?Q?RrahvQb+dH17+lOCfS0bLOLgfiq6Xl+yA4xRgWZhYcQEKZY6NDgLQN0Y34SL?=
 =?us-ascii?Q?bNYnvfRYEXQtZKeS6iDEKW7UpWu8MTvvTSYcPyu3/ZdRtLdo26rrVsI5RqK5?=
 =?us-ascii?Q?4mpQgBFrd1qbkEJapZzV7fmneUa1vL9ode6N5dgVMwzrF0p4YbSi/sPA/Kd7?=
 =?us-ascii?Q?0FV/PjfzxSW3tzNAPZpcjNE1smUlMO9yz7+W3cUEVTEdIeIRrUHfPOYK9dvs?=
 =?us-ascii?Q?qQcQFR24cXgNHR+1zM7dqJFN8uFNc1BIJ/gw2E8Xxqqvy5RlkH7vO0fI7mLG?=
 =?us-ascii?Q?LaSIk7iaQFVOGYvsuwiHSCqnY2QvFZ6oS6At/OiIQEuTmZY9UxWMGbebdX4R?=
 =?us-ascii?Q?KJtHjXBvWfRGjXLI7tQCyrfUbnHqbH6Wm20MpJN0IbVSquJd4O62CyQhcCig?=
 =?us-ascii?Q?+LopCKdgRtPPigv92WFFNcybobJa/g8WzIZCy53h9VzeDzULeh0CxP6ktNHv?=
 =?us-ascii?Q?xF/jh0c6kxzrSiXb6bcitrUnGU5wyP3E3vc1eyOpkS6kJhmdLti+PYVe82NP?=
 =?us-ascii?Q?ehmGRAMzeWJbHk79eg7eaER8ubzA1HiwT/ZWw/hPx3bFEOWAyGjfBbhkeEtv?=
 =?us-ascii?Q?YQ=3D=3D?=
Content-ID: <0FFC0A6667F3FF4EB86CFC72786C77A6@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: e/888zm3uNKiOvLp7LZcwOBwLrdYSYXewVGfX+fwondV3qxFXAb8miKTYhLAkffcSVHA9APQj3OLhr4vNxdRsOC7HVkseCjwzMoYsV431A+bvKkg4HkTaTmSt3UHq+hobgDtnMdXl2RVTo+be+B835S4eNGDpPit51FL5jH634kTv3gMFJAmDv99+mSby+OSZeSo1etn7/HXJ9bUBfU+86lCSrTbdVyPONWP6wdi7ZuU7OilvodhgBddNDV/kTlQVzsTd//O40hvXICRbOOnSadtyLPlDEjWvGnSEh29WmTIpLml1q2Wjq8Eg1GJVEtQfXpU8rHic9YcAxm2/z7PkZrk45gY1+kuK4Xtdb0spJUSgH/UBylqVwG/2+g0RtNEAUrLjMaQ2p14EItvYaObmkqDtHHTv+9Hdzt1Um9pHKdFYiZNgd4EVBDhJkjmOl7upeSfLyL5oHKwErOpFYMtJFIGWgQNSxF6xiqLJRLDV3AT9Hpt/NP8rsEXGGUReDWRRHnEYgr6MaXwqlurVaBV48XC1qccCHr4MPxN50v+lJxgD0d6r+EBrS8209Fco4n3zno8P90kCk1ssDFPuFadIBfb00iR/KrnKih7DDoqTO6icxJOAbcwQrXfIgRHeERR
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e56f863-7a3b-41ca-978d-08dd51b20c9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 13:25:31.4017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prsOwZaYEPRMaB8HLDktYM8xE8z0f2WTkCUErb6EyMXDBH6H3oh7XBkVGHGQM53CRTgbQo1yRWL8fNb3hDGY/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6288
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1740057942; x=1771593942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=Ht8EtGgToZ6G/C901XR/wXi/4NTSUQpy0P9Mn8vImd8=;
 b=rmcAA3MSXfdFi7auEODKUnvaxfQDAyWNlzYsXl8NvJF2y4rUZGMYHhPP
 91XZRF48DcNnKXWrkt1bXy3DfT5K9xYi2eEsvkPVIs91vYxO2TvJYzRe/
 aeY+551OKej3ZTwE8a6D/teo4YYYtNLcqnG60ECmjQ4kvwPeA+1S2GLdp
 o2t3pkn1Pgxp6vIf6xxjvIjjfXQ+hYKxB7Kw1Bs9b0xVJboE1TN2FXKJF
 1uIxM2VK4EZ7YST7iY+wucj1vdqhkJJ+gqL0saVhq1j6aNW9PoIo2t3pw
 SZmsCQJN/ofcB56w+Z3d/c3zPmNTqFZYeM6qSoqRjV8HhDQLZw8VRNSyF
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ht8EtGgToZ6G/C901XR/wXi/4NTSUQpy0P9Mn8vImd8=;
 b=AlPQud8209cBGIuQvXAW4lKUieoTjOlpa+tZRO53du5QNFA0WTxa3vf9JHCA+yQBTU74GN+Zsn0Pci2fQRMomFkOJBpcPW50xLKC2SNoQrEJiipS5kxfercV6vIvwlh+gcxrt5bvER5UFc31yucgLc+p7LRY9XhtLV6u3aOUtVU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=rmcAA3MS; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=AlPQud82
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v5 2/6] configs/rock5b: build and install
 rock5b device tree overlays
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

On Tue, Feb 04, 2025 at 05:36:17PM +0100, Romain Naour via buildroot wrote:
> From: Niklas Cassel <cassel@kernel.org>
> 
> Build and install all in-tree rock5b device tree overlays.
> 
> The device tree overlays will be available in /boot, such that it is
> possible for u-boot to apply one (or many) of them before booting Linux.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---

FWIW:
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
