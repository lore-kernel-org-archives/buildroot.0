Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C693DE7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 09:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F25460709;
	Fri, 13 Dec 2024 09:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgZ6D2BH14XJ; Fri, 13 Dec 2024 09:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94AE661090
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94AE661090;
	Fri, 13 Dec 2024 09:48:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23AA3ECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0427840B38
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9J03blcUXJo for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 09:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=07052b375=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B641A40B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B641A40B35
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B641A40B35
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:48:07 +0000 (UTC)
X-CSE-ConnectionGUID: d6X9gxr5S4u+csoVqqooaQ==
X-CSE-MsgGUID: qAI7nVP1QgSUNokPxMu3zQ==
X-IronPort-AV: E=Sophos;i="6.12,230,1728921600"; d="scan'208";a="33603907"
Received: from mail-northcentralusazlp17013059.outbound.protection.outlook.com
 (HELO CH4PR04CU002.outbound.protection.outlook.com) ([40.93.20.59])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2024 17:48:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhgQfSrm3aLqmyi6VULdp5dpNQJ0L6Cm6pQ+avgnTNqK/zedZoYsZJoDL3E96BaqD8BP9haiBqMZWddtyd9A0kFoqNerJYO4WEMlob+mQj8LMeVCguZ5t1myOe+7FCc+cXx6cEtBghWT98xx5Dtqe8vlM+kAQl+Yi4f24lZcmcPHKd3XxDsXsg4VGmYhxU4LKZhETBBfbMnxZH97RsZw+s/hY6/eJD5d2P5jdHjiLshd7QHRBO9KlOtiuV2lX4w9WMV+0lG2ItaXjPGdvBYM0s97W+9pVb1p/RDTHJMahTSsNFJsnFKEQoyP2cjoj0dZjyVWy5SXjo8X5XGYSkz3kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6Chc9gDBmbfK44wct62U4TzrwTM8zIzLz3W8yL+xLI=;
 b=etYaUU32wbv60d9q++w8ucufBM4/u3Ye7nuxPXlruOMktKmrDZIWsQaT8uKJYgRZkkC0idsT+c19uf0SMF1Pnzfht9f834IwJbhijrXfuYg6ExK/OVbCQWOI0fd+zDB5+dScpz1Y1DVzOnH0hbnNe91oNNl+aYUlRO37f8KfRbT1jwMIotP/TiiXjxtm88r/6lp8X74ZP3PrqDGRzMLaSbkNxs3JJIkgdrzTxxlU4SVDAnF7C9lsgkktm3yVx6dBTdkn8kDxe3pAe6qhspo8++aJLkknh8+zwAIZdRuYP5eny7S4+M+Qdjg0xCHAzAB88tqYD7uH9QUqbW918Nn+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by LV8PR04MB9145.namprd04.prod.outlook.com (2603:10b6:408:263::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 09:48:04 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 09:48:04 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Michael Walle <mwalle@kernel.org>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>, Damien Le Moal <dlemoal@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [PATCH v3 1/2] linux: add support for device tree overlays
Thread-Index: AQHbTTyALzjNRBAeCUGLNZ/sfrVbHbLj4uuAgAAHV4CAAAN5gA==
Date: Fri, 13 Dec 2024 09:48:04 +0000
Message-ID: <Z1wC0zRgrhS0jl52@ryzen>
References: <20241213083430.4121422-1-niklas.cassel@wdc.com>
 <D6AG261DAIGT.19EZJ5IUQQ16R@kernel.org> <Z1v5werOKAXaX2iW@ryzen>
 <D6AGYGCVAEYN.F84LYRW2DRTV@kernel.org>
In-Reply-To: <D6AGYGCVAEYN.F84LYRW2DRTV@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|LV8PR04MB9145:EE_
x-ms-office365-filtering-correlation-id: 9b4675fa-e13d-4b10-3c70-08dd1b5b3d5c
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?U8X3HzMwR9S5PtXtX6c8RSr4Uqr0QVQ26h7PbuJzlvyuTaa6fB+nCIgqFeAX?=
 =?us-ascii?Q?JCweCV5hVgxLJw4PNAagYeeVKUCsGLyMeDge4uLo4Xgx08Tgy4ykgWOcq3Nh?=
 =?us-ascii?Q?gx0vYbHnvQFYuRIanbAU4G6t+1KruT3uxIG7XR0fltHfMjRGpSqA1u4oJbl0?=
 =?us-ascii?Q?1djQTzP0mpOHkAotH1iM59qE9N7zWtkJq5Ra+jFrXOQAQANwbPc14EdVowVz?=
 =?us-ascii?Q?ZDkgUPQRGD344VKEO1cxvHeqkG/hdRipilSs9akgVJ2HjD8Z/fbMGH7g5ISG?=
 =?us-ascii?Q?mx4Laqg1SDw9bHIWAZWlGMTqp7uA0GZGKDi/aIPfqUr/7H5OuO8I3sx6U9VU?=
 =?us-ascii?Q?xNHMtAbZm8RUiUez/XZlevSjSTDuQ/BmvLPxsfFFIVuUcYxcaFNcjZf8Rmwy?=
 =?us-ascii?Q?zZ7mIrokLRO8eHx3+fXvyc90flhiKw3MzvjhUwuYuXGAMs+CiU1kAzETAsso?=
 =?us-ascii?Q?xsN+Mf0DFdFqNRhAq8SMZQkW5HE873nA6B9ZCBQDDjJGK62HHs16kRStv7PP?=
 =?us-ascii?Q?gNUfOkmrhG5MlOD+mMbIiEO6birI1qpsOcc8TMOs12RyXr0uJcp75+469lLE?=
 =?us-ascii?Q?S7b68BkKp0JW4Zol6xfrOYgO4G+izEepb7YbeCZsQY+Y27hNPGw/RoCg7lkJ?=
 =?us-ascii?Q?58ARiX3tyXr8z4mVyoP62gKBVfRsD0jwokROoFJ93LmCEGJ8jApQHsAz0Wrq?=
 =?us-ascii?Q?Yq32q/2TI6bfV4qmTvvuu50Wx71EWVJzyzW8Q5PmECVO0LCk20XxjPt4/r9j?=
 =?us-ascii?Q?ZPZBnjdeRxVzm3VgP1o2tbYgfoMF2/A67Ti8RBt7axS+6+umabBLEMwrytAe?=
 =?us-ascii?Q?FUAz2TlYBuV/wMZ0bzoiOgH5GtoCx7CBoFc/o4IgUeWZJO0x2NM1mlEb1uKJ?=
 =?us-ascii?Q?/Hg0q9qPm1ChWrz2zCSs08MeJEGbaBIPGITk2sk7b/SoDPnKem71o/vvqbuS?=
 =?us-ascii?Q?IgQ/h1veJYu2vduRBAlmkKCaeORDuy3m0UGZwh+tUGBwHTepPeXaVMbL8NSm?=
 =?us-ascii?Q?rd1+jdeROdutNYhwxvAwBJkM1qRc+uI+4BOPUMIyc9PSwmVEouAtd4rkr6ja?=
 =?us-ascii?Q?2xEVHDQ6BHhTUjIOo6AI3OtaqOWbPDRmB9wzDRXaRUxLUmYSVXdv2n3raFRR?=
 =?us-ascii?Q?f1zA8cMxvniimLVNSSeQzVjxaC5NbNzeNE4++UGxYB+aBUHgicy6iqwfLehh?=
 =?us-ascii?Q?fmhRoiKi/5rBRFENQrlTOi40HYEI3ALlqqsT53d+WNaDrpfqjtcy9UqeogBG?=
 =?us-ascii?Q?ozRcEqXNY3F8Ft+NL3WSAqirLBnAJYhgvo9y8R7Rb4aG2vQJL4mV+U+/cmFg?=
 =?us-ascii?Q?4uV1ioKchnaerYVZJDkEJFxTS2mFAj9Yx/i6m6HN2jsJrTEnJTLhwv0D8+f6?=
 =?us-ascii?Q?66gpYcA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zOTE5LwKY0c2It+8n4LPFcBancY5ek54pS8Hp6ZyM7riH9IMH8sEOvWcmaPV?=
 =?us-ascii?Q?48HKwwdTwL+/2SURL0+V0dl/Bv+HzSW6LMnMo/vWKwjvg7nnl+UAzpmLY5nF?=
 =?us-ascii?Q?/Rc9yWNpEqyGykiBe3AuXiT20Qa5oYiuG+G6Psgi109zIRHd9jD4Gn4lNjLb?=
 =?us-ascii?Q?yZ+DFsSvS+XxAd0bVG9VU+2OZvjADVfRcEOIWAa0QMYD874ZCFaSmRS3uBgX?=
 =?us-ascii?Q?F0avFr2WGsfW8Y5xKhWH00JWE9GNiRbpYyLTM9RDVioxRRbpP0zH1JitZBPT?=
 =?us-ascii?Q?fSNZBF+hoTqOaIiOhUu5Jj5nkX9TzVmZnIzNPqJyKYbuZulo7meO+UHnRXQt?=
 =?us-ascii?Q?xU4lvrorpNxFzC3dapXnKOF4gPjTAA68y2GiYJy3jHdNqn/ktbrJ6ew6IpUj?=
 =?us-ascii?Q?US6/NXjYVDd4u5wtjcqjUXFARmTZQm4tuQmZ79Lx+5LpT2yZIxmR4FUBgcB8?=
 =?us-ascii?Q?BwklsE/FCKwmMWP4AiYDfjMrWSZBWpcnIeYLngmYyMHM4u7JoFoLGuQHQjsg?=
 =?us-ascii?Q?r8WdR7KGaiqlIUHjSbyzxtGhDRjOidV9V3zi+fO3cPIiUihk1gu9C8Hs6zs1?=
 =?us-ascii?Q?smejErNhQ//Ld0Ap4WGVUsw+RD0+sgAZeyelADgfcFDUJYy5SpSaY3bjDoyb?=
 =?us-ascii?Q?hAfdveYp3OBxx5UT+ZHvX/uLJ4gj49xABjLh2F2LubE7JbBXgT4PqpKkdGVc?=
 =?us-ascii?Q?V9B2sVzNqdDFLJyF8pS3ePHGJpo9EyfLpT84UhgAafTozluDicUPy1PqXzuA?=
 =?us-ascii?Q?M1jlfr6yj6OKd3QgQsV8ePNjl/LmggXtThPFk3sjdFloOW0PGOPfc92uVxse?=
 =?us-ascii?Q?27Zeqyp0km9D2nS9INcQQ1yVL0QxJ4OhOfiAX4PdbEPLoc873cwrOMMSB9dO?=
 =?us-ascii?Q?kTnOVwZeOcLoVqjZRD28ffd1w84k5nuRMID/Anwtq66qC3b0DntfrGta5QZv?=
 =?us-ascii?Q?n2FW49R31VNPCSDUqPY9gy8LX/WMtvHBuGCWABlh27tQ5v4QYIB6QmJEeQe2?=
 =?us-ascii?Q?YKMPMer5rT8IOQGZwhk6sknnu8oGtPy4RBhtcHnljEq1dSZkKqDwV+7UiO0H?=
 =?us-ascii?Q?wHq8qF8zY1/69VSnSUOJx8yJ13XzdMDvRO6MllO69qtx3gECUupRn7+E0EC5?=
 =?us-ascii?Q?iOsTKRYkEWhcl4gDVxEKM0oPIKOtxwZ+3qP04+rKN52jhEmS8feJ0PYmisvh?=
 =?us-ascii?Q?SRbMsNGFiBv6uuZ3utMcJnvw5Tf6RCnJgkZ2UKN60327F7GTlaXQCEDb3skh?=
 =?us-ascii?Q?ga3IkPkV5OcKdP4B2fmki5y1yiKk+X6uzGy8CEpqBT5466zMPP7yO6BELMOs?=
 =?us-ascii?Q?hTTs3BHN9zBiF2z8qPVmBfSg/csl+Lcb3uPSGx0P9Mzouu5qJ7/vJ05sGChd?=
 =?us-ascii?Q?zDkFPwctzeFj8xpl9WE+qJDN4gexXSBe+bKKw46RzVSDWZty2jpQBfTIp3NO?=
 =?us-ascii?Q?sIiR5zvxEH6XhO2/iXoEpxFXrzNjmRClyiQ2Gc+kJHbNFW5WZpCCx9j7IenZ?=
 =?us-ascii?Q?oCtjfBiWMxntn3YvUpV7hLFt8Hep8CN7tGuZ9Qn1IQ9Liwniqu/0sW9bEmbU?=
 =?us-ascii?Q?U7qGdG5Qqub1iQuZQ99aZULEMQxtRC59mt8oTVL2JwoIX3WYj1Qn+H2Mmxtb?=
 =?us-ascii?Q?Rg=3D=3D?=
Content-ID: <4D104288972792498BA5D7AE2FAE1F9F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xj5XxBkl0eYrT6p94Q6m1cN1mBLg4tgBdbSsbcXyK+euHDO0Dc+zKFwIZYnLW6mZRdqGqUAEQfKGZhDfNJ/J/TsBxD9b/8sjoEHxHkqm+gOSwpy5+6ANsFgAGmDAeNW0GC9mrGTJjUgQJgJci+bRXmHJFmyamYCKYCkKs7IgaJ3gSOX+J8RnXZqkB2vDsl5Ke8Hh8np+4tm5YGmxMvmuO4oqy2T7Dd8etzPlP6F4n8JWP9U3ZGEVQWqNAsBzqlUFeOSvBFWeICGXu1ZWoi3msxuTEUXXipxikBoIZ9odjWm6XSjfBe14fAB8OxYUeHDArViYOkTCf1gD/Hw09eg/fFg20f52VSt3557C65lx2p+Uzjdyk6qEae8LyKEraeUfufKf5iakNyvVpW5WcEREgNlcK7IZ/KxS3mSokPRGfiKeVQ1Kd4VGgdNrNZ4YnWh8vQlCbei6/kAM+cEFGcV4ve4nrrMQRDJmC+PL4rfcaQp3FFOD5q/5CYb9iJl+0vQQmj+JVj0g4o9BXWKbGesQdaduIoCkIit0uKQrrShgonvFAX9BLS5k4LBD5VheDhax1sqGvu4fcCMLnr0BKmkMd1GKzeVOlGa8yGhbZxpxFsA5QWXsuNBizaSVubHERbU3
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4675fa-e13d-4b10-3c70-08dd1b5b3d5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 09:48:04.1704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4o4vLhHCFkI/esW2AsKou/uClIjlz3DYqu5afR7Bltpjr/rmtVYuQdzUDnX501QLqtpvR+q6G8L0tvKt9wm11Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR04MB9145
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1734083287; x=1765619287;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=xwfWi8TZ/jrWt18HHlnFy/p3YeTvvdoBihQCER80ZnU=;
 b=XDMHJAN+7zOtQA1EvviQdOGNfPTTUT92RkVL6ol1sbOT+ytZJ1jnqrkY
 KpMWLPOq/HsjixelmNSZKzdge9PcW7o4uYBCk+RycY/xf0mKZ75DIvZWm
 /wOjI5s+mxMVzJtAUp2zhWduorDyvU3n4+P7AKzCScEpJRil9NQyV4gs+
 oY2e639++8TSdPokFeikaqjkiyOs7cQmQUne8UF9DQy/0pS6FbePB3RId
 H+zMIHqx21G/vXjO190zc51CgxZg9zIDXM+YcaVj2Vz4fOgkcUZgUA9EB
 AcedM4FO8E5A28/Za5HFjm8hIo2h5qQ2M6focy0qNDj1UfHgtJhCdnAmq
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6Chc9gDBmbfK44wct62U4TzrwTM8zIzLz3W8yL+xLI=;
 b=evdLJmEobui/UEsP4xGqCLsJpnd4XFclSbly/yo9oLoOjJV3kUEcgqyul8RtpeYMKtBCzc19hDBOux0hIOKg5x5v7DWFA7iTvIruq1rR8ukhqXsohwS3ahyRfS0emS5RtugXeedWQVyDZWNd+Ax/jaYk0k0dQ9rUd7RS4XHHv80=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=XDMHJAN+; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=evdLJmEo
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v3 1/2] linux: add support for device tree
 overlays
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Fri, Dec 13, 2024 at 10:35:37AM +0100, Michael Walle wrote:
> Hi Niklas,
> 
> > > > -Dropped support for out-of-tree device tree overlays, as Linux 6.12 no
> > > >  longer supports building an out-of-tree device tree by simply copying
> > > >  it to the kernel source directory (without also modifying the Makefile).
> > > 
> > > Why is that? As it seems, it is not possible to compile it by simply
> > > copying to arch/<arch>/dts (which is buildroot doing currently)
> > > anymore. But copying it to arch/<arch>/dts/<vendor>/ is working.
> > > Correct?
> >
> > I'm assuming that neither works anymore, see:
> > https://lore.kernel.org/buildroot/CAFOYHZDQmMRuK76TpOSAOFPdqAb4gpw=LNKfmpu=sqAD1EMhFg@mail.gmail.com/T/#u
> > https://lore.kernel.org/all/CAK7LNAR4h6NZ+D0BK+q4VQBeHWpjzRBQFQ9ovBrftM=6dHRcUg@mail.gmail.com/
> > https://lore.kernel.org/buildroot/Z1nq_gneO4ORw3EG@curiosity/T/#t
> 
> Thanks for the pointers.
> 
> But I've just tested both compiling .dts and .dtso from within a
> vendor directory and it seems to be working on next-20241213 (?).

If you say that copying to arch/<arch>/dts/<vendor>/ is still working, then
most likely it is only copying to arch/<arch>/dts that is no longer working.

I still think that this patch can be merged as is.

Once the BR2_LINUX_KERNEL_CUSTOM_DTS_PATH mess has been sorted, someone could
add support for out-of-tree device tree overlays, if anyone wants/needs that.

Adding support for in-tree device tree overlays now, does not make life harder
for anyone if they want to add support for out-of-tree device tree overlays in
the future.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
