Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A67BCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2B5B60773;
	Tue,  3 Sep 2024 19:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0kfx68i99be; Tue,  3 Sep 2024 19:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C3B607CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C3B607CF;
	Tue,  3 Sep 2024 19:56:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B16ED1BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E94240198
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3WCyP-Z6RJu for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:56:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=969f4f420=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19E2440109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19E2440109
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19E2440109
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:56:13 +0000 (UTC)
X-CSE-ConnectionGUID: qIVdhqWPRPmZyRI9GjTmBw==
X-CSE-MsgGUID: vNIxFAlVS2yVSEwkYwFHcQ==
X-IronPort-AV: E=Sophos;i="6.10,199,1719849600"; d="scan'208";a="25220065"
Received: from mail-centralusazlp17010002.outbound.protection.outlook.com
 (HELO DM1PR04CU001.outbound.protection.outlook.com) ([40.93.13.2])
 by ob1.hgst.iphmx.com with ESMTP; 04 Sep 2024 03:56:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TO0eq6nD3xh0iPKsSX14y4zK4yC07qPvoZR2rriHeYj5bFHb7lFAl0EsSDhlpoXSAf3RL6pdxZprfOzNRzSQ6E8DQ8Pqx0PGNL3fpNiwlZ45jeqeN62Ip9qjtaHWqkC7pcbfvh6MiWr30G1RJoHwYu87iwVmTLOFMFLD18IqCTZ37L1XpoY0OcuoL6j8qekpy9bu2EEUK03yVlAb7Zy3nbUBLjvtjobPgvvvlqEowSHKKlDSMhwtAnH5VLpKOsAbNp9bkB4I5VC74No4ZbV6TxO/FCnJXHS+QzfURC0a0ChzPpvejJOapm43vzyWXkmSZ6YpjAxWGeIwhvWg7ejygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8MW8JrI07+odjouJToiCttgwcNfva8uyCUyguzItgM=;
 b=bXayTTnfkiNFwReOyZCWU6vYTXy89GUrHoYQbEfedvL84I2c1868kGL8QUxPyv+fzaU1Utt/c/MJzpnLyJ7UuMoMM7RTb0FP3Wc/BW0vDddffzmlNGPj+JFpgiqwjE+pii7wK+F43FPCGo6Ziq4dc+FXVNz4D4CbS96gHJeyu7YaU67q7J+dNZNLSx+p+tT6qU5NUM79jd/lxligcHsU9m5UXG5SD8V3ySB9G+49rdBsBq0RccnbobrkVNRNzs5/fFxx7b/YoSwyHAel+f3NUgL77Dq4xoAV1vNozvUV/cmZFwEdW+BK/wL7HUgBAyL1jlnjrJ+Xvtll53wjLlDBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BY1PR04MB9634.namprd04.prod.outlook.com (2603:10b6:a03:5af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 19:56:10 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 19:56:10 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
Thread-Index: AQHa/SUvwik4mZfGrECETvuPU521UrJGc/mAgAAIYQA=
Date: Tue, 3 Sep 2024 19:56:10 +0000
Message-ID: <Ztdp2oxw8KKyKfJv@ryzen.lan>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
 <20240902104433.2561797-4-niklas.cassel@wdc.com>
 <20240903212611.613c6d42@windsurf>
In-Reply-To: <20240903212611.613c6d42@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BY1PR04MB9634:EE_
x-ms-office365-filtering-correlation-id: 8f689275-5395-4199-d3a0-08dccc52754c
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?tmH0DhTxWrDG/pDZZ1keWVL5Y06zvakPB7h8JtF0A/1VGew+cK1W3jqSRhrU?=
 =?us-ascii?Q?4QpX17/bVtI5ZVO8oYW3YNVG81GdHJXhzkIokvH124r7Cwe//O4aoj0cf13R?=
 =?us-ascii?Q?5y5Ilmesv0iFiXkxv/m+ECP3GDwjS+Z6KcAxq3zfJrS7+DeZnbM24itmJD80?=
 =?us-ascii?Q?tGQVWLWM/lWIau6cF1RLzWlJKFPk+8KjpX7WJm37V1pq3d0l8KgYYYfVtrhY?=
 =?us-ascii?Q?ZoAVhbxlNpMLg6mCuNM5eafYYi0PWBTuIRAiIoFpIqRlc7eeSRJxim9Ze9vF?=
 =?us-ascii?Q?0EvGCoVosg0FM8qEKWsIZnoSwRu5yI/Q3X7Hv6jlz0e4ti7+yJL6YGBcbXaz?=
 =?us-ascii?Q?XWdpYjXgst2JTbpZFI7oUk7qrKI5SJDpkTXTKGlb6LJjWcYmmmPARUcJmrMs?=
 =?us-ascii?Q?4wbyzIt4Zw7/LdVmd7cokcXSaWDePTfuS9PeCJit3oV8ECBVT+8QzNQXEAOw?=
 =?us-ascii?Q?td9BvUOeUJ9FmrvUiDSJpZdaOb2OnhOTgV4Llf0e3F893FAU8XMOF6EmoetV?=
 =?us-ascii?Q?3ulW6nmKt3EcBP2cyqKnxwxSrC+QIv9hhxdOsbolkGfdmAD9GBa6AwTqQeHe?=
 =?us-ascii?Q?/j6oRJx2r2BdWvXwj8CNr2RlJpr/vDaT1AtA8zl3wFj4zOaw5/pgqRul1JHm?=
 =?us-ascii?Q?P3GShNiIvdJ6nnGhQB8n9A3HorZq7O2YmbZje5rJOfpdPY8cKET+xJle3v5X?=
 =?us-ascii?Q?zo6HCXVVVSJ5tU2D+M7eLO/tLpXts5unsgeVqQScEBr7Avykri/Y7lv5/FUM?=
 =?us-ascii?Q?qbbCqwq0CPqojU+qhmAH5sqZrFNeT076NfFQ7hBLrWqnIX/dNphTFdSlII5n?=
 =?us-ascii?Q?Q96m33+dIJnSbEtgiWSlWyKEy3Ou9Mp8j7G307wXrT2IdcOikEr3rE6NdoQl?=
 =?us-ascii?Q?aAfKjhf/KirY/gXXnGcNf703e1DQ03Z74NAHbpe4MrL8yDaVB1SYF2UNzqhw?=
 =?us-ascii?Q?IsWZzTg/Ze6tW3Ra6qYIilFiPMmOJ4ZOOP5TqhUfigaVKSqSZrhhuDacW3zo?=
 =?us-ascii?Q?foS7XvO1R0/v8gli3weU+n+F7kXDTDKid8amGZWk7itygW9nDRd3xiA4WrIU?=
 =?us-ascii?Q?2pj2NdNytrhypkKhL/e3bPRYfd9c+mTSybCJpDcXiv/uCElxWxc9eE/PSNid?=
 =?us-ascii?Q?upp1QeY6jTlQmh7SAiO1zEhuHukD7+enmc0b6JdcZUsqfIhcMrrYfL9pRZ0R?=
 =?us-ascii?Q?exn1XADhTwPtgDegRDrNaB/TnfWKchQ64/Vld1it9v4Cs+nJ01pdUfv4mGnm?=
 =?us-ascii?Q?0DqVfpxkhjA1C/i7lI6mqd9m1udyFfvHX6E0K7yzJG6P13iygZHUTTKyx51r?=
 =?us-ascii?Q?+uWeOMLabYYj7mkl17sYTKr8h4x8YxogBrYHwXEQd9ZeGB0Bir4b/JIITGEU?=
 =?us-ascii?Q?lKRHNe0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o4jTCv/D4B7Z/rFE6UXxAj5M3g9WL3Y8tgIpDijbulNGyKi60m4NHKv3ECFq?=
 =?us-ascii?Q?Cp7rupeEa6yHwnjBIz3zOfCyIf0/ZaCV1SsNRlz03SXrog5hX/Q8uR++JFXj?=
 =?us-ascii?Q?NikPkFSdiIO0c6y2tBoSwV8upzW7kqzzlF6WeqnbDB6UChkr1qFPKNkRTIdU?=
 =?us-ascii?Q?uIrqGwRnA7qJnexRr2BpwbhDeoP6eiRzWv7U4QleCvzN8XRrJbH02TfjNG96?=
 =?us-ascii?Q?BQsUZAb5vXprNBSGQZ4Od7Xe/mjeCB1pIxYYivx+SZUcPJO9SFvrk2CyB7aI?=
 =?us-ascii?Q?s6rYkaJpY7KCiPfndkh5D0bC6AjNcg2I9lUJNtq12Z/MLueS4Wc6MZySCSuo?=
 =?us-ascii?Q?42B6vLelJQP1m7Kz8WULOkEc6zYPpyr6+fBW5jXpO7kL3PrByIlGiTTdy4Ud?=
 =?us-ascii?Q?sPp5fVDXLenPiwsNoxtc90jAole8F+tX2x6IJZn2mmfXGqIseEaQ+Pm6gA5m?=
 =?us-ascii?Q?DxPDEhx0mEJuUyshY0fNH2UHPYiBZg0z5GT6RfOgYE2YSGq6UtoF9/FcyFtE?=
 =?us-ascii?Q?GKPQpSE7PPFP/ayG3PaxHttxgqXK4bVbRx5YsH/ciswJ7LZUoW1Ibp2ATUYJ?=
 =?us-ascii?Q?SjADffDAk6UpcidzmXMKu6Rp1DqRzNmiwGYzyGp7JHs0D2ZXVuPNMMXuBjf0?=
 =?us-ascii?Q?5Nh9TH2Qxlvl6+ah09JX833j08IbXHQVMSA1HFR7R1AMwggNTXlBRFrvTj3d?=
 =?us-ascii?Q?eSQuwLM5TGM8GQCcDzcFco/E3uleD4soBtd72+QqJvVFTLwt5riDdwDHF4Fd?=
 =?us-ascii?Q?/ZKvs0El7OvCnyBv/hhJI7dzbLcXTFACEyxTkESFY8fvE0j2bEO5IvcZmz24?=
 =?us-ascii?Q?g98taOlx0q8GBwaEAg3NRY2r43o7ieoy59DP1DNb+7O2rHyXBF0zPwloxaVf?=
 =?us-ascii?Q?DOlAOXmjKR465DkAL2Cep97+Im9ieCAjE5FP/BaExbjJewT7kfktc/9moTvd?=
 =?us-ascii?Q?ur1LxRataFpwLmgNMbpbHXKdHkdlQ0K9BUdqBgc4a0xVTw3KDh+0MAyjDdmx?=
 =?us-ascii?Q?1drXeTCjVBavEmgZhlsAdPUcbqbNjbGjdnvrBWalitTmA9XbYocvIRbPxKzB?=
 =?us-ascii?Q?qfVtF6H3y88FLmWOfxsVXSBy8irjRnHWaZtmBBuE0M2RbMGrF2X04AnWdbOw?=
 =?us-ascii?Q?LaDWzBt0vhanNGg4p8h4L21AM7gGFChfSFZhFk/vdd0sbKbh5+1CoUsq3XwI?=
 =?us-ascii?Q?WcGXFdgjMc4EyGzeWb+zh1cxb1Rb2Bb+/zGEsvNksshPLmMJMqonoTiGK82H?=
 =?us-ascii?Q?o+4pqK/LXBHimI2Of7Bd1oUgBoumenR0YvsMAv4YZM2yTj+J9vDr7EUAJstM?=
 =?us-ascii?Q?SVmZ51Gv6sR3olyGQhZ3wJp517AWvGTxtsovvS1aZQtj4luMXlQkvLsd0Ntf?=
 =?us-ascii?Q?P1zQX7BoHK4ukxe1fb4QSn0Z8i9UNSlSBwea+zmsV+hMsBTLUo7olNt8sF3E?=
 =?us-ascii?Q?vs0PN7+QOsuGjk4essJ+tahlZ0xaqPGQ9+3VPevE5Femm5xdvHmolWsBUFqO?=
 =?us-ascii?Q?mw5OREwixIqxiS567ES16aDGC/XjAiJRb2J54pBDea0onWUMIUrDxlowB5QB?=
 =?us-ascii?Q?86PJgi/evvi3fORE9cDv9wz9riH+v1aro3EU3fph94T8+qANRGln3bDDcoH6?=
 =?us-ascii?Q?Gw=3D=3D?=
Content-ID: <B72FB0EBCDE5984CABB9A2D00F32FA44@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: s0bp7VNJJmNMRqEggsxVoQWlIeW6HZls+FdTnTQRNlL2FMpwtBNW3kmvEqMri2q/iTAxDeyT1vShkkKNfmpZT0b6MaLJEasJTWcaD28ZJArlxqglEH5WjSsKkEsGd9o07UmgX++KhTm/dQx/kg/BqheFuSqUnte5QPNCgUrLJSudr7mhdzrZwhGXVBZ6gyQab/tMHkDoU4cSqEK1djuqRp5MwfxUeEVgMPxsEtUrPmrj74w11MRFHobk1vKDQvX9k9lQKd5K4dhlXMGnpUSFfahALrYN32tM/A7Ipxh+u0wq+KqHk0EbDhmztJjbWNDIakdr+zdQIjd5zwFiOy51+DgNPLlm9imMjvzNZQ0zy5HQ7+3M6uMglWi9QjgHFY3ENNm4ZsWU/Ht5pqONshh4w2Ik1Q8KXfmNshy2j6BN3CdKA/pNbEynNcVzxiHb3SctLCH8te9g+zBu5pCpU6AqNIaaav0dQD2XhQeMPW3gfKul0k04eRX2DxY+fpfCgp4RVQZlHMcgSoFKAqfmn+bt7qLkewDpSI3nsNNGl+yW3SIwlgisd7LE+G43n/XnJsBUfBi3c3mfm8ihOvmrtBEZkke1JLHewThCPPtlrh4CF1jnIXeOJsDeeLXnpbad/3Wh
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f689275-5395-4199-d3a0-08dccc52754c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 19:56:10.6663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Fpm6duzou+KS/UVhZYxwLoad5SvGNF30nqqBDvT3Wh5GTBVbMiMOdVRd7WRD2/YNjK6FXiAQO/+2VdYVogM0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR04MB9634
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725393374; x=1756929374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=U6xjsR+A/F4/w9F7lX5Z2/6J8dqa8Kh2bB1Qx8iPEjg=;
 b=CeGFcsiOE85jo8A/jVjiXUehaXjigBkqSflNeeK6F/fdg2Z2Y6IZXTIY
 w4cuH3tx6/rxwkHETyekqpw6ssWeA8jOD+qD2lErS0MA+Az3M88jAlIgE
 1wE2k/yiiUPjin99UfjhoueIHhdJIyss34TQX8p0t6qubW3NOuNbSqcKX
 tcDkOHxaQykHlsxPxMc0ORTQ0BPVnxeRVgXtjgi45hrBupVraeEPScElV
 IjlVU9RmLzN+Z1E3YG9Mkv3pwtouEcNfG1GcP74FIo2L3Cc3po6AZwWcr
 tg5CtSVTm6cG+8j699iiAzYvDRNpSETdiKUJRJXuz2NzSRX+6rn3dH91N
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8MW8JrI07+odjouJToiCttgwcNfva8uyCUyguzItgM=;
 b=hydcop03XzeQNcMYQhJnCVUgLgQSs3p+hwxbt0io5xcQ4KNI5anP7uvFNsxtQhh9mC6cBwy6WzeD2+r2vVkd+BExmGTlPN5JEfDmUdPdrLYRcaTmcYxxsulPo5xQU175AOrffoXL/valD4eHUFSDLF6FLkJA7OXlT4+yUTw54l4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=CeGFcsiO; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=hydcop03
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 03, 2024 at 09:26:11PM +0200, Thomas Petazzoni wrote:
> On Mon,  2 Sep 2024 12:44:31 +0200
> Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
> 
> > From: Niklas Cassel <cassel@kernel.org>
> > 
> > The arm64 defconfig enables both the R8169 Ethernet driver and the
> > PHY_ROCKCHIP_NANENG_COMBO_PHY PHY driver as modules.
> > 
> > Enable udev so that these modules will get automatically loaded by udev
> > after the rootfs is mounted from the SD card.
> > 
> > This way, we do not need to build these modules as built-in, and we also
> > get the benefit that any device plugged in to the PCIe slot will get
> > automatically loaded.
> > 
> > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> 
> I'm not sure what we want to do here, especially when this ends up
> needing net.ifnames=0 that you add in PATCH 4/5.
> 
> We do have already a small number of defconfigs that enable eudev. So
> far we only use net.ifnames=0 in 4 configurations.
> 
> Basically, I'm trying to make sure we remain consistent and have a
> policy that applies to all defconfigs rather than ad-hoc solutions that
> are different for each and every defconfig. That's why I'm a bit
> reluctant with applying your patches as-is because they only solve the
> specific case of this defconfig, in a specific way, without creating a
> clear rule that all defconfigs meeting a specific situation should
> follow.

(Replying with the email that I have subscribed to the list this time.)


An alternative to specify net.ifnames=0 on the kernel command line
(to disable udev predictable NIC names), is to create an empty file:
/etc/udev/rules.d/80-net-name-slot.rules

See:
https://wiki.gentoo.org/wiki/Udev#Optional:_Disable_or_override_predictable_network_interface_naming

I guess we could modify package/eudev/eudev.mk and package/eudev/Config.in
to create a new BR2_PACKAGE_EUDEV_PREDICTABLE_NIC_NAMES Kconfig which we
default to "not set".

If BR2_PACKAGE_EUDEV_PREDICTABLE_NIC_NAMES is "not set", we install/touch
/etc/udev/rules.d/80-net-name-slot.rules in the target rootfs.

That would avoid the need for net.ifnames=0. We could also remove it for
the existing boards that have it set.

Any board that actually wants predictable NIC names can set the new
BR2_PACKAGE_EUDEV_PREDICTABLE_NIC_NAMES Kconfig.

Thoughts?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
