Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D751C0219E
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 11:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D24BA60A9E;
	Mon, 10 Feb 2025 11:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAvlnvlL_2rk; Mon, 10 Feb 2025 11:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D76EE60AC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D76EE60AC7;
	Mon, 10 Feb 2025 11:52:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10511C2
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 11:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4D9560AD5
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 11:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwPLOAXS1mkY for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 11:52:57 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 10 Feb 2025 11:52:57 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1744E60A9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1744E60A9E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=1292f9273=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1744E60A9E
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 11:52:56 +0000 (UTC)
X-CSE-ConnectionGUID: DINWGfc9RJilBrGlFyvDJQ==
X-CSE-MsgGUID: 6vTresXcRHacvLcBiMhYuw==
X-IronPort-AV: E=Sophos;i="6.13,274,1732550400"; d="scan'208";a="38032153"
Received: from mail-centralusazlp17010005.outbound.protection.outlook.com
 (HELO DM1PR04CU001.outbound.protection.outlook.com) ([40.93.13.5])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2025 19:45:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iu9ji5uip2vc7WptEfRgN8ML5FkPSmRYIzZ8oGadOMs7UBWdwlu3CPsw/LlOCOQp7C3gQZS0JKaRiPqjgxkGn2sDHqqLwdWn3VdBI4YYINpvDAhb6L/pX+rembH180w7Hpg7U08IldTDTPi32clhuRwoBaoWUr/Wr0Y/Acc/dAp8t2y/kxgbqFadq6U/MJgcbr7wiO9xderlVsSMXbktN2f6pMqYzvCcvJonoAS1/dl/eTp5BpfRr1HVmjscG2Xw1JTbkWndYVEmfaLXygcZsyj/FQKt0wpdmGuXdy7z1nNZDdITH+kqe3AkT4dgt4h/xIvVvnSTcnY23XvJWeEyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhx4xEv765XF6GnJiGGrn7lgHpYiEZOqEPk6crCKp40=;
 b=gwO2VjEm1xjhqfCX/3duLLGnxvFssGKvClwMKHJDkvkw2vakmvKESgKlkdZIXmeH1iV01dvs0tQ0AqzmaWdS7T1DjnHH0bh8K1gmeN597xeMpJh49OwTaym2R3Rxoj12n3aRhjgNaY1OCgvh3lkVs7Y0hCKzMU0J/dp7rqoszlqmA/cRPbUwfHQAeTB15a5tboykAe7n7SXXZjZZINjC0BIQS5ha2PZCfkCeYgxb7EKvg6ZnXgLEEKej1MVjwi0x3un/1VlRh+g1Nh4j/DuvaAsJacMtqC/bwPLltX8j1bjDVr+xchwS8AQAHKGq35Q0zQakvlmP4P5CnZAtx7cReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MW6PR04MB9062.namprd04.prod.outlook.com (2603:10b6:303:23e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:45:46 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:45:46 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Kilian Zinnecker <kilian.zinnecker@mail.de>, Damien Le Moal
 <dlemoal@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Julien
 Olivain <ju.o@free.fr>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [PATCH v2] configs/rock5b: bump uboot to 2025.01
Thread-Index: AQHbe7FSETXgdR9HOk2gw0qWNW429w==
Date: Mon, 10 Feb 2025 11:45:46 +0000
Message-ID: <20250210114538.3256759-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.48.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MW6PR04MB9062:EE_
x-ms-office365-filtering-correlation-id: bb052ee0-309e-47da-23a9-08dd49c87556
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?shLxDEEJvBgnFWvwN6wvnxaesGVmAErqmNNOIXiKoecyWUfwb5ZPjQu2GJ?=
 =?iso-8859-1?Q?+h3twdo00guQWI5F5Pw+sUR/99Wofika9bSOg7b0iiHajY/SSlWCksXIws?=
 =?iso-8859-1?Q?QgGoIqDOb6XI8CFpTLMqpm3sVohOMAplFcd/lrXLKdkwyU/l8zz30F5sY6?=
 =?iso-8859-1?Q?1ND0uyyGQt76lBc4kSSE4q2rQZSlSZSYMwOSJz946l+mF9luO9mEXT0VUj?=
 =?iso-8859-1?Q?ItNFekthG93edFFTaf5P0TVxRLilBP4gXMKkQ3fHuvW8OcbEcpIjA4wdwM?=
 =?iso-8859-1?Q?Ggo7kQJysTMgBPJ/ccsSc69Tx8ePXJMg3ZBNmDJABdZvNQlm4j5BopxnyA?=
 =?iso-8859-1?Q?E2Blpv//OcLN1vMwKmytNnJtFar2NnCxkXyTAkDr7EaoL+OQxM7KW9CZ2J?=
 =?iso-8859-1?Q?tGOGEqlEwLg3aqVo1PCsVb2Z9j76gDJ2cfLOGMkgm2hcMH+q5W1ntcT5Wm?=
 =?iso-8859-1?Q?KT+Yak/7CEwzGCEaQtFCrDRFnf9mGXBd+XrMdyZLDJHUXtn69RVXLSNC8C?=
 =?iso-8859-1?Q?dqdZ/wssIFHRN9WXcmOwG2+SnW/htwLL5ZekoLpDKcW40vt4Qj5V28/E8c?=
 =?iso-8859-1?Q?KmqqoL+a5Jz8kkgjUNiNfBHx/UK+qb7YvaulhpT3vs8wyMuzXMCxkONpzn?=
 =?iso-8859-1?Q?nTmJxPAtu/3t5oCV7w5nIdVyuV6yrSUU26un6Ukr//DSdARYpszZmfIYET?=
 =?iso-8859-1?Q?QhLZywQ3gmi6eXbAo5LHydawhBsG6Z8OHoIB5cni/0jzLNjJrOZ9/r0fKC?=
 =?iso-8859-1?Q?imrmJMZyzR2Fx3AM9x1vCoB/9WM/qVvxoDRoFTchXkbT63scWSoW0CWiin?=
 =?iso-8859-1?Q?O5zw9GprMi8Spg2rsoCB1kgjciEm5qYg8uNAxdxPajFQXdZGigiis+bm0a?=
 =?iso-8859-1?Q?8zhIBBZKpKrFUHG7i72GdoVRsuEWxdDedIU8qA9bVBvkJq2fBtGVgAD4Td?=
 =?iso-8859-1?Q?ki+IgQh60XqROGKG+YaLeUGdlU/HUrXIwukMAuTGV7dGYnk0rqmjs9V66i?=
 =?iso-8859-1?Q?Db9conrdQxEO/7kYo0w20su68RVgl/+hmlsjS7y59BwLBHWe70B/TlPuHM?=
 =?iso-8859-1?Q?gWt0e+2nIL3Tk2lxrtb10r3YGXigE1ZFCZVI5misAM6Bg3lZ82XLVX6tUb?=
 =?iso-8859-1?Q?eT7HNAdCpRqNsFVtcsBRNG5NUG3te2nm5VF9PPUxWdBZwjx/wcyKGJYfPl?=
 =?iso-8859-1?Q?tZOVYAQQONTsgOfwpudQtrdLGGLItsq3pg8Cunegh1dAYqhQ2DN9jeCvWj?=
 =?iso-8859-1?Q?vfXSOwzIfndFHS9Vqga7ircWNtFkADPAAl6nzxgK+1fB/EEsa+KnJhHF8U?=
 =?iso-8859-1?Q?b7AMMlE0+I0NZLnxJDT2qYCzXdkm58d6yfjaWdFjgcB5VBxqwBClVKI7G4?=
 =?iso-8859-1?Q?34lcSHQyKfwX8Ou3Y8GPDV+2ngxTaerpfUJQHhrmPFF68fYU2YKiehQQNK?=
 =?iso-8859-1?Q?LVoLpx2d4jI+nLz/2BZvrqEAW0YjygJEEi7xQdyKZgj9Lj3SK9jP1x4gEb?=
 =?iso-8859-1?Q?vbCE6foGWxExuadDoQdz6pTviuDKEXy/Ig4d4YU31B9g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LplFjHtC/Gcqw0jsVMpRGxCypPn71Dj+l7RTnnv4T+1DOeH3nUD0goyoDw?=
 =?iso-8859-1?Q?Ac1haE2Z9rboZA6hAtx4vXRGpdmspWxTuNZUhAbYfhhzgn/yMagNvKasdn?=
 =?iso-8859-1?Q?zqLJFUNYvwJJnSLpuP4D8wxIkxawc/yDUCmc4oO2F4Lwxe0zT3dou6NKAB?=
 =?iso-8859-1?Q?EDJzn7jWIa67S/Hv8qM25GZJwIBHJ/qyzMXI+dwX9pr7I2yX8gpQEJg2xE?=
 =?iso-8859-1?Q?cqW2vtK63ecY/Bi5uUhDhIKkvjcY/lQtW0VSGJBsBH3QykGh17Q+QQO3w2?=
 =?iso-8859-1?Q?TqGOfPIt7V7poCDmJ+bOcpw4hYGQr0puJ2LIlvAet6kLKCda1WakDAMS0u?=
 =?iso-8859-1?Q?A1rj3I18qA3K8TWwS5jsbfji1u5P9SGAMvTge3CFWPbMwzgnQcDwBK7ka/?=
 =?iso-8859-1?Q?4b1OPeVBBdL6gJKerRAZoKCghjxPv1MwbeGJ6Ufw8zZLxG6q0L8hma4zoH?=
 =?iso-8859-1?Q?VDqjO8XtfbiFwGLCmLw5ROTOMjNrcmGd7Im5Ykj45xnpjxRXcCPJZmbyns?=
 =?iso-8859-1?Q?xQR9m9rfPZNdQMOovC2tMoDlpnDmE7B36M82wFow+5VR1Lcnbae5sgZX9s?=
 =?iso-8859-1?Q?uNNioIqJANtMCjbUaeNfRQQIQO4hEANtUhAJlz3zDRghS/wehJmBoZ6qdp?=
 =?iso-8859-1?Q?CncdH4aUiSmUhaCfP3MKbjHmP9CJ+aPTh+X08JmUZGpdnzqD7sZGloyThB?=
 =?iso-8859-1?Q?8rG28RV0J9lZJg/YYOVxFq48M/15LhcYf3Z5O6Mrw6t16ECIboh+fBKZes?=
 =?iso-8859-1?Q?t0g8zidgQk0yQ6gjskh4Zt02BEJK26Ci1bM+L3HZXUsR980+g5zTAmung+?=
 =?iso-8859-1?Q?CWm6ujT7RK15p7B3/JNBs/3rN8gJlfeXKqJtiyONx+W2vaSvyOJ6RSV9qX?=
 =?iso-8859-1?Q?dHA9jNGESlbDME87+M98cwIfYynFy7BrieOo4O6fmw8vv0UCBhOWStBKbY?=
 =?iso-8859-1?Q?a8FJmkTOZzO07vQrERnZV+mW0tpuQwbN6nPU9TU/9q2n8QqqAmaypKQQb3?=
 =?iso-8859-1?Q?swuOerWL4IVmqiBdwaajDv3Qau0dU2oa2uwOrvdueoX9RRh3puFO2s4PuU?=
 =?iso-8859-1?Q?GiMayczXkkAha8Vr1PvFQCBG5mAUVUbHAtx4j54GNjxfCaORBsLrlFQh3y?=
 =?iso-8859-1?Q?eK8n6WAEHo+yJqyehVXN5IerRS5nO6O1ZU1yTRZzLELuOizKELn1aAEKFB?=
 =?iso-8859-1?Q?dlrUj6FvHkmt97sqUt8EYGhPLCCMN5Pav5M6dgr5HjOhTZ7gGYw3189qKN?=
 =?iso-8859-1?Q?KjpQzqeNH2MaWVai1oqaGMBpKH0zkCUasHeWirXR8fBDMmvbjVg+C+rcVL?=
 =?iso-8859-1?Q?SAIzpZ6dK6QtYNR/3FfNotupHc0wMu1eTl33ZCoKk1acWMgM4gJHB09VCU?=
 =?iso-8859-1?Q?gBlYbd9qMURCyHajNbI+NsPOWM6SewpfaER5N3QoSpwzYNyRYTMfRarusN?=
 =?iso-8859-1?Q?DNpMadjS181bVJtkfXkBjH+rB7yNRGXJmbWy/N39WvBP+bblnJmEPevsk/?=
 =?iso-8859-1?Q?8gSV5YNMiwiugZa18gZ1TaxJrMxSoY3uudeSxlMHRCSXf/PVeBgQX737Vm?=
 =?iso-8859-1?Q?HAXGgoYg8NNM84hXUlscciErIMItthLKXcMjMXVIQowe8tSuPme61NoCx3?=
 =?iso-8859-1?Q?TH3W0MPLu/bWHlrKih8S4IOaUgzfAnzuoF7m5AdExePGE9JQzZD+6sEQ?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kfZUyIOSkjMlnptUkbM9MKQ0UitCYqTDmkUuH8n+9LGWZeROn35+z2s5VuQbwmow/r480vgOzUTLb3cmiQclKjibvWJdLm+9ScTJu/51Y8kT0iNSh7dRM7hvdpeLZ2T3b+Lmjdvq+Vs7TXLFm0A0yjykrkNmPZKV0Ca8cVlCPI53AoO8+IPWjCI3OsRnU5migznXqw0Cx52iLdcMwnxUxntuTF8tj1vb7FD8kihC6WWPqFa6flojEj2523MNpDFgOGFdbuT6aT8B4r/fiSevdTM2m3h8gav9R29IRoy+VPmUrVgYf/CaA8gosC1w24OjZP3j17g2f8yJt9ED/7ZHn7UnmBVUUEQmcjSm3Shj89CKHsxuG0tsyZzjoF8QDT4w8h8wPY5JEMZOj95+EESghHTAXIXp+ikMcYP32H6zGYWqrSQFVLKWh9jclQI45SdwXYTOvfm18Z9fk3NRaB/XseLSVpJEjEErK3W7D6z9SDzBSBiNgPYnW1lLQaSp9ENuuwx4qZjPdeBEps7JdkLPpF1fVs0Sf7QKvjOjtxN6hveRyH5hYBA9tokKqfI0Ulg6y+NIowNYaHN4qdqtU0gBxPL51JHWLm+LLVyDS7jouus7hs/+F6oRLQq+UgMGAIi1
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb052ee0-309e-47da-23a9-08dd49c87556
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 11:45:46.7211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m6PhYWnXdrDz/mFVSg15lA65AAFiKj7av3wipTp60UpfJqmS/UtY24nyqOEWnrNbbo7nbcwoYl/GNTbPa9/6mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR04MB9062
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739188377; x=1770724377;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=0lim1mAKj09R+1uAGKOOlb+n671gaxr3XhWv3TmOedw=;
 b=FQTi9/kxtNYYsywJIG9VR/RQJI73wli4CHBy7M5thUEDLmP+h4ye8ugy
 IKxHjWtOakZNOtmwDBPWklYPcmmnDbjDYxwHPBxSihT56pV4DZhACaR2i
 x7YLMKhCJ6FnqR9/9FwRnZ4RjhvJV2akmFJDg4yWl4gv8KqLwM9x4UY2X
 t+pYByUHgnp+jY7O8hQOm5qTtkgl0QUhAb6Sbo+a96mdE73VMIv4ANCkh
 3BFFxaDGZWsV0zhLO4aBLNW3b/gtvhFE/kd7+siEstWRCExQiHvoFN+kB
 c6s2yX/Z14bzGRIl+CR9b9vziMhZt9efNpewkDieuzBRQLqkCqE5YP+so
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhx4xEv765XF6GnJiGGrn7lgHpYiEZOqEPk6crCKp40=;
 b=udc6dzysxRZ/H+PKETx87tSsiMRP0hOHpd5xdWVKElOFXYWcjHJUqVVGiX/CPSTkefgdji6xpqxDzU/bmBU1oCKF91LzfYy+KtvzxV1u+RVMq41vngsA4CMIyU/S1N2LyhTJ/F7VMtcnrOHfX//uDfwLD2yLDNOjAYMxrpiGL6M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=FQTi9/kx; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=udc6dzys
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: [Buildroot] [PATCH v2] configs/rock5b: bump uboot to 2025.01
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

From: Niklas Cassel <cassel@kernel.org>

Bump uboot to 2025.01

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Changes since v1:
-Update the hash.

 board/radxa/rock5b/patches/uboot/uboot.hash | 4 ++--
 configs/rock5b_defconfig                    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
index 904fa56c02..9acf6071ac 100644
--- a/board/radxa/rock5b/patches/uboot/uboot.hash
+++ b/board/radxa/rock5b/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+# Locally computed:
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index c1bd9deb1a..ebd665e322 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -42,7 +42,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.48.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
