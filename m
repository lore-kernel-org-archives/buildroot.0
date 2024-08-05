Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD4CC3DA64
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 02:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C6B605BE;
	Mon,  5 Aug 2024 02:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31TdBI2Ozhx6; Mon,  5 Aug 2024 02:01:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC54606FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC54606FD;
	Mon,  5 Aug 2024 02:01:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3720A1BF322
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 02:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31675402D1
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 02:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5XXXSKjrrSs for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 02:01:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=9409ec7cf=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1981402C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1981402C3
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1981402C3
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 02:01:21 +0000 (UTC)
X-CSE-ConnectionGUID: E1ZKq/MsSIuEkIkF/IkzJw==
X-CSE-MsgGUID: zn+AjSkgTgex0Z4DT7ZBkQ==
X-IronPort-AV: E=Sophos;i="6.09,263,1716220800"; d="scan'208";a="22823119"
Received: from mail-centralusazlp17011029.outbound.protection.outlook.com
 (HELO DM5PR21CU001.outbound.protection.outlook.com) ([40.93.13.29])
 by ob1.hgst.iphmx.com with ESMTP; 05 Aug 2024 10:01:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HC1y7pj1JjpSOlY8rrtKvNckRbSqe3bIBIhlk7Y8xofy5fGEIEiw7XfgUliSZrnNujaICzNEXfNZNSZBfPH6NT2fkEzAlKSvHOg5jsqCnbYW4buyVTdU/EfUC3fXKkh8w3Uk4/rNDhryApY2464TPTRLEjUPWDtpMfg7zwG/i2VJ/y+9X9p2uvqMECHnbKLcEEm89D14zE5iPy/w8N6nrKq7weyLr6OYchxlbYTC5w7CsfNPK+mWFVP49upUXkaIScNugI7tMJ+G3t9VMgydQTvAnFxGCotVjjTfs3bJFpZOkaVvRp7XGfQ8C/CBCidZAEwzYt+xg4WrmS3GjspmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57BxK731MJRbs9+v3nhQBTDg5F1qy9zm89nbweiY/58=;
 b=w7Qx1rReb6eZIroqFolqowbTpGyA2VuFFMLtZNBg/bRsQtbmn2CnHpj15QH7T+kXmKYYCrR0r6m13nK+gZkf9HBOTf6ExhLcGmXpiRizAU2dGJW7NDKVQnvS7mleX4GI4zPZ5dSnUeD1W6T57riHgF8BEbJY+IZKIqQJRRbTNjj52tlnJWydSEiGHRcnfeXKxGTN3wUuDPqTOYnB20MqFtrme28JHw1sMMhbu5UkSYGeARiCOPuZrtXjn4DRh20eC/1ebQdr47AuaiTkx38qoNgX0uxv2k9+QsuM3/ofjMfkGyI5n4qMsSR2ONf5y1rYjnlJm08qH8FerG6xCuPPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by SJ0PR04MB7214.namprd04.prod.outlook.com (2603:10b6:a03:2a0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 02:01:18 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 02:01:18 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v3 1/1] package/libspdm: bump version to 3.4.0
Thread-Index: AQHa2adAkEeMgx6TaUOY9VOjkM+zTLIXs3aAgABP8oA=
Date: Mon, 5 Aug 2024 02:01:18 +0000
Message-ID: <3147976d33b8d16f21f5159a47829f88856fae84.camel@wdc.com>
References: <20240719064402.3105153-2-wilfred.mallawa@wdc.com>
 <20240804231509.4a0f8075@windsurf>
In-Reply-To: <20240804231509.4a0f8075@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|SJ0PR04MB7214:EE_
x-ms-office365-filtering-correlation-id: fc0b46e0-b5ba-4bdf-8834-08dcb4f27ee3
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TGlzbXBWdktvT0hPWWtLOG1EdzByVkptbVptb242dEdnTS8zaDVsTHdRbFp6?=
 =?utf-8?B?NlpRR04rckErRWJsb1dobEJXMXE4dFlUMXlEb3hLdUM1WTRpOUd0Vmk3TUVL?=
 =?utf-8?B?MjFQVC9UV0pQcGxDMHpnMzJPVzU5SDJVZG9OblIwVnpxNXlyQ0YyZWl2YXp6?=
 =?utf-8?B?bG1zNnlrVEZvcWdEZmpOdVV5RWpxOXdmOGFlQUV0b3pRNXM0TmlVYlo3S29L?=
 =?utf-8?B?Zld2VmpvM0tuSkxHNmR6ck9QZXprYmpLMVhta3doZDdiQktodlVKdmExbVJS?=
 =?utf-8?B?bVpGZVZUdWU5Y1h2K3BlSVdYTHhhTGdib1E3Y3NndCttZkpKM1owOGZ1QTQ2?=
 =?utf-8?B?WHZXd01aUzhqdkN0eWtmYyt0LzJ1ZCs4N2RKWVNPUXl5dmJJUUc3U3U5M1Nl?=
 =?utf-8?B?ZzZTeDFTMmxvS2VHekhXUkRiMUNTdzJuYVFpTUptR1NsNFF0cUk5dGRYNFRW?=
 =?utf-8?B?dVRja3BreDJhb3lUS2JRNU4vOWZJQ0o5QmRDL01sU2NkVzVzVWxtWXZTUGp3?=
 =?utf-8?B?ZXJvUEwrN2Y2ZWxPOVR3SUR2RWhBRFkrQlcwcDNvV0tTZURYdUxRK2hWUXJn?=
 =?utf-8?B?ZWN2dGx1QVVRVGN6NWVPdFRmaVZiSEI1U0lVZUZBSU1Na2FkMGpHTUlmaC8r?=
 =?utf-8?B?bFBVM2lhQUhvdDFrdUZhRFZWak96SW1nYXB3bENOYmk4dzdIbHRmN0xFSzBN?=
 =?utf-8?B?TjZWZWU5MzVRL0JLazNKRDAzaVFyNVNaOVhMamhHOGdpd1k3NVBrU0RwSlN2?=
 =?utf-8?B?bkQwUnlSbHRjeks0WlJhVGY3TFRwUUk2YU1mMG8vcFVQb2x4M2pnNUZNV0FY?=
 =?utf-8?B?dFB6VUpLZG9BVXpMRFVXUlZjcldvRi9SczQxYnZxcUdURHZ2ZjdWUldlQW42?=
 =?utf-8?B?TThkK09tUmVsbFdTaFo1R0NQR0JtVUJUQkRWMVNBSHhUQ3hoaXdmdTRRcHds?=
 =?utf-8?B?UjViT0R2eEtKd3BmRU1URHRqYzdpNEFzaGlHMWppK1hWeFV5clpKeml1Y0R1?=
 =?utf-8?B?aVdxeE9vL0FMcncxclM4bW9VZ2hjdE5yZHUwTU15a3htZ25xN0RSSmVUUTQr?=
 =?utf-8?B?RE4xNmxLK3ZpRHc0M2x0RHFNcDJCbndRRUJTcUU5OTJlYUpBdFVIY25PT0VF?=
 =?utf-8?B?MmhpOXM4ZldqYVdaOW1XOVdlR1ZaMTIrMFViYnBhWnBBZDB1K0VyQ2kvZGtJ?=
 =?utf-8?B?Uit1cHQ1b1VzQXdvYWs4YnJZcG42bTF2QzNTbklqd0FFU2F1MzhRUFJDbWNW?=
 =?utf-8?B?ZFYvcFBxTHQrRnNidnpHbVF1UytibnRhWFRFK2xXMHZRVUhYTDVOMzlHRXJH?=
 =?utf-8?B?czRvR0xZYTdpUVVFMUVMSkJvWHg0Nm5VcFRDSnlNRlFqci9JcEJNcUFWU2ln?=
 =?utf-8?B?T0w4dDQyOW5zd29GelhTd3NLZmZEa2lJTXBvSXMvMjFzLzZ4ZkV2RXpNbC9G?=
 =?utf-8?B?WWhqdGJjelpzZTRYQzBoTnhJcW1aWlZwODZMMnArTUFUZlVxSXhtdGNxeE5x?=
 =?utf-8?B?QmFZaDY2M1FLR2l6K1loREFPd2h5T2R3TmIzVDhmaXAwaVFqY3U1bG9naXhn?=
 =?utf-8?B?Tld6VHk1dnFzcDFQM3FOTzJHbXJrVHlJRkVDSUp4UEJ4eHNlV2E4cUZGYUNU?=
 =?utf-8?B?U1hydUhDa0F0MCt6eCszQ0k2YXNkbVhqZ1puQWREcklvZWlmOVIyR01EejVB?=
 =?utf-8?B?dWp4MXQyU2pFMkxJZUVFVGFuWWZDb29FVnN0NldNb1JlZDVqUHU4K2pBQ2Rv?=
 =?utf-8?B?QWNNL1NmdlphM3RLMHhvMjZ2WU9XbFpUWlZsNytYNlVObmxTNkJjd2c3Nmcv?=
 =?utf-8?B?d0loN0o4QThvMHFlQ1VJemhDRUVHU2pJNWhiZUV5R2o1Q0JaUW9oWDlSTjBC?=
 =?utf-8?B?bHAzeDYxRGNYcUhBTmY5MlNySS9FejhQOWpoMTh5b0J2Tnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUdpNEZiNFFGWFV5WlNoTElWSmEvT0JlN3VMUkZtZjZqYkhHcWlLRnRVVVpn?=
 =?utf-8?B?SXlwbmxTb2o5SUlBMlJ5cVhLT2Y2Q0UrK2Z4MW9vQ3RKNnhDQWxCTDZ6aE9G?=
 =?utf-8?B?RzdzTENtb0pvbUVIM1VhSlpSeWppTjhTWEdGTDUvL3RhbzMrano1cjNMTGNj?=
 =?utf-8?B?K2d1aSt3VDBTcHlSWVNkbWVqajVZalVHQng1aFAxTUVybDNtOXppT0ZhZFFr?=
 =?utf-8?B?MUgwQW1IREpjQm9mSVBaa0NUSWJsZ0EySHBnRnpXWE5nZDgrNHdDWUtWQ2RT?=
 =?utf-8?B?WkE0dC9aVzVMMkxlbHlwZW81YTlIbE9tQ1FheVAzc3BWdlV3eE5ZT2liVDdS?=
 =?utf-8?B?KzVKMWdQMDcvOHF1dXZqNFFkSWt3aERrYy9aeSs4dXNPMkVac2pVS3RmRTlJ?=
 =?utf-8?B?T0RIQUoyM3UvdGNWTlQ1TVdWY29YR1VFWHNvWDB3VkR6UHpEekNZYkdhRE1h?=
 =?utf-8?B?TUthOXhLWkVZdXlJVm5NUVFCYUlTY3VPMU9FcjY5emdOcW1jVFZ1ejNQSDI3?=
 =?utf-8?B?OEJ6VTY0aGJKbVBjbzNOWkVJcGpzWHZxSVBHRzhXZ1lWZXhwNWxrVld5WmlI?=
 =?utf-8?B?V0lUQndWa1NFMWVCY2MybTBYaFNIZmFiTnBtVXUxYWNXWUN4UHlScWRMY3lx?=
 =?utf-8?B?bFpDUGRMZkllcUZuaURNOWhBZGJyV1ZDM1BHRlVNeXJ2ODRJTXdET0JHOE9G?=
 =?utf-8?B?WUhNSW83RUxBbFlxdUt0SVBTLzE0TjNlc0hFc1ZmUUpMdS96K2R5Z3hWdEU0?=
 =?utf-8?B?a1drOWJReFNUSm1SaGl1TEliOEpOaW9EdXdGSXM0YXhOajRHQXExYXk4YTJN?=
 =?utf-8?B?RGJzMlAwa0JiZVBEZG9xVFNvc01pZm9PRlp3aG5ZeFhOZUo4L2lwQ3FrRDZF?=
 =?utf-8?B?OGhJNUZoK2QvRjFsTVRPYll6TUlQYWxIVFdTVkh2bEIwVmM5QTB5Z2cvQVBN?=
 =?utf-8?B?MGtQZUVGSGJ2OTA0QjZzVXppODZpMjlPMWgvejNnMXdFRmhUendzNVlReEpo?=
 =?utf-8?B?eWQ4QVBodzVIbmgyNEdKVU1MY1FUK0xTSXNIb2grallkQ0xPTTR4NGxSMDJK?=
 =?utf-8?B?QnFmb3ZVa2NZdE0rYzI5bndPZk85WkpBOFBrbnIvdEVkNEx0VkRPc21XUkIw?=
 =?utf-8?B?a2pJYkNhYlQrdktYalpQVSsyOTRpK3JDbmxSZ2FCd3lqWXBKOHNHNUlhSmZE?=
 =?utf-8?B?bkIrNUtiNVlCR29JWUdaR2VpUE1CRFVGNG1uQWY5WllWTmhudEVqUjZhRVZS?=
 =?utf-8?B?MDAvN1ZjeGkrSktqRmsrWHRuNDRQd2xwR0NPbHR5SVRRQnV3TFRyS29zQWgr?=
 =?utf-8?B?cTNkdFhWWW1Hd05qRVpqUm9DR2VscjZTTE9ZQUF0S04vQTkzTUhGVmxDNnFp?=
 =?utf-8?B?UjhaR0x3VEc2TU9VaWNMMWxzYTdsZTRxelJ6c2llTzBVcnNhbG5PTk5QTURu?=
 =?utf-8?B?OU1UZjdIL3phbVJNd0VMeXNNaDA5TGhHbWNLZStobU9ZdDUrR0JsK2h1aHMv?=
 =?utf-8?B?MmN1TjBFcXlLdUc5L3lSR1JVWFNZU3lja285UnJHb1V1NWpROTM2UzVYVUxS?=
 =?utf-8?B?QXladG14RjNNSlZLRHZkTVdLVmJmeGNJSDFjUWUrTFlENlJ6Nms1SVZmMEVk?=
 =?utf-8?B?U0hrUXZnQjFPU2FNdzlPNmYxZkwvMzlrU01qMStNdjhTSTlJWW42MkhBSE5R?=
 =?utf-8?B?QzFReGx4MGFKSklUcXZudWNFdHp5NlB1L0FTRnhZc2NGcFBjS3RWK2hkVnVr?=
 =?utf-8?B?MjMrRUV4WEE0czlMUlhYaHgvbVNCb2h3YUt3emNhbXZxM2l0RUQvdHkwYUZU?=
 =?utf-8?B?VTR2M2EzaDBNUXZuVjY1aUhjWnRWQktxa2d6a3RZK1pLWEQvT2RJb25oYjdV?=
 =?utf-8?B?c21VZXB1YkxmdmVCOFJ4aDVOL0JmbEthZXVuUUduUllzTzdSajNaSkw4Q0Rm?=
 =?utf-8?B?YllONE80VEU2NVBXa0NEQ1lBcTU5bXU1LzFlM0M2aS92aGJzZGt0VGZVYnhU?=
 =?utf-8?B?OVBTbTQvdnpQVDFDYXVjZzMwODZLUWlRT3dZMmJPMDY5Ly9TSFB5VnppNFpO?=
 =?utf-8?B?NHZBanZSYmczRDk0MnB6alBxV3pscFptRUNXNlBEZHpWT09uWDR4VWN2a3JS?=
 =?utf-8?B?N1JzSk1tWkx4ODBBUG1IeCs4RUhKajJweFppTnUwWERPclNSS0VwS2ltZ2tX?=
 =?utf-8?B?eXc9PQ==?=
Content-ID: <31C248129978E648AA5E886BCFDFC0FB@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Nez4Nq+z//vPMQcg+U+si8VdHRVuIyAmsQCN3H9ZmQ2/R7iEfEd38A0kWk/y7rZ5PHRBn9tTJWsS+Fp9yCpAjJNBihhSdsY5nkgSRFT/j4xyjnDff6ASxqMlXiJ0r7B8AIdHrKoNNDhAmZ5xE6RqNnjsI49FjfdzeUrgBTfI06KCeHwG/nAjWcIv8ZatSgGbA6Y/y1DdCYNC7/z24HARGFsJdc/0c0i0jBI05ilTavtg+tXWp2QgscTIw5/C+TkXFPLxLnScuJa+J6nqKlfZLzbkTsQEJ6nvI6WpxmsAoFVS1pWRA8T4BTWyYshr6/u3ukFUqXZKpsGGZLTthSO/Fi1hf8/o0SVYWEXsLF25opscuW3Gro2aeUVM4UpSxE44A+S0pYAlXHvRlKpaHrnuGC/RNdqwh6/8o5KxLuMQMwphhoJmD+V1+bv668URPjrEADmuHSkmhDl0n9tv61mHOZzSRVtkxAJq9OkcX5TCPan1P3mstPFZA+0kWhwEhcdt522CriTeO6es1y2wx7Xv2w/fg6isIUyjtWZ10XMLqG9ttOeJU1e9yHcu7XSAQSm1c+PRhXvU+aeFzrrT2oS9KuNF4ncYu1yNcdgpSL7tQZA/agt9kDA0z/46tWz/Dx64
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0b46e0-b5ba-4bdf-8834-08dcb4f27ee3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 02:01:18.3107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PO1b2IX25DCSrD4QazhxXOg9O4PLUY65gvNJmFyuee6r1YYw+wAKSZ/tBWW0PeVw+2ps38RHJGVmoMwYaFQH0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7214
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1722823282; x=1754359282;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=57BxK731MJRbs9+v3nhQBTDg5F1qy9zm89nbweiY/58=;
 b=bf0xnUdl0wqDb+apyXwLpCew1rQp3Aum6wutNvHSIuZqLYuqNQt1mxWp
 TNUeyTsVUlylcstXn+o5IkzcGwWTd3kMsxKxIFTAIzxsYX9DDXvZ/anbv
 EDFWcBfyPHquo8ciBkjWbQuXakBo28Ae+9Kbsc6OiboHoTcyQ/4nFdtua
 36NSuUvGpR9XSkzHshOMcIfgaFnrW4asPg3OBCMuNYOqu5DalS1DSbQXL
 0aspcJQZxCaMjZnvKwVU5ifiaYwTfghO6TTgV6GAIx1vkrr0XUiyF3Ana
 vQi4cQ1q4DDCi5rG5ZJ3J/bIJzVt+G4HXrMCweBSMCvqpEQWOLoI7zw9B
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57BxK731MJRbs9+v3nhQBTDg5F1qy9zm89nbweiY/58=;
 b=WCGESz6gADLhQA4XMhM9g60HaAPZKjtL4iTQG9J0IFIeKuKM1JlxUmwzxpXPi5QnA8+bozV1dOvmNrZZKX9JyifAldRA987Eqa4A1NaGezkDtoQa/Byf2syIDVgcWSj7dZiqMGIUIq7tQXrwaCz3ihXI7UDuUwvfdBys3OdWb/Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=bf0xnUdl; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=WCGESz6g
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] package/libspdm: bump version to
 3.4.0
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: "alistair@alistair23.me" <alistair@alistair23.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyMDI0LTA4LTA0IGF0IDIzOjE1ICswMjAwLCBUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QNCndyb3RlOg0KPiBIZWxsbyBXaWxmcmVkLA0KPiANCj4gT24gRnJpLCAxOSBKdWwg
MjAyNCAxNjo0NDowMyArMTAwMA0KPiBXaWxmcmVkIE1hbGxhd2EgdmlhIGJ1aWxkcm9vdCA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOg0KPiANCj4gPiBGcm9tOiBXaWxmcmVkIE1hbGxh
d2EgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+DQo+ID4gDQo+ID4gYGxp
YnNwZG0gMy4zLjBgIGFuZCBsYXRlciBzdXBwb3J0IHRoZSBTUERNIGV2ZW50IGNhcGFiaWxpdHks
DQo+ID4gaG93ZXZlcg0KPiA+IHRoaXMgcGF0Y2ggZGlzYWJsZXMgc3VwcG9ydCBmb3IgRVZFTlRf
Q0FQIGFzIGl0IGlzIG9wdGlvbmFsLA0KPiA+IGFuZCByZXF1aXJlcyBhZGRpdGlvbmFsIGZ1bmN0
aW9uYWxpdHkgaW1wbGVtZW50ZWQgYXQgbGluayB0aW1lLg0KPiA+IA0KPiA+IGBsaWJzcGRtIDMu
NC4wYCBhbHNvIGludHJvZHVjZXMgU1BETTEuMyBtZWFzdXJlbWVudCBleHRlbnRpb24gbG9nDQo+
ID4gKE1FTCkuDQo+ID4gTGVhdmUgdGhpcyBvZmYgYnkgZGVmYXVsdCBmb3IgdGhlIHNhbWUgcmVh
c29uIGFzIGFib3ZlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFdpbGZyZWQgTWFsbGF3YSA8
d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHRoaXMgbmV3IGl0ZXJh
dGlvbiEgU29tZSBjb21tZW50cy9xdWVzdGlvbnMgYmVsb3cuDQo+IA0KPiA+IC1MSUJTUERNX1ZF
UlNJT04gPSAzLjIuMA0KPiA+ICtMSUJTUERNX1ZFUlNJT04gPSAzLjQuMA0KPiA+IMKgTElCU1BE
TV9TSVRFID0gJChjYWxsIGdpdGh1YixETVRGLGxpYnNwZG0sJChMSUJTUERNX1ZFUlNJT04pKQ0K
PiA+IMKgTElCU1BETV9MSUNFTlNFID0gQlNELTMtQ2xhdXNlDQo+ID4gwqBMSUJTUERNX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFLm1kDQo+ID4gQEAgLTI3LDcgKzI3LDkgQEAgTElCU1BETV9DT05G
X09QVFMgPSBcDQo+ID4gwqAJLURDT01QSUxFRF9MSUJTU0xfUEFUSD0vdXNyL2xpYi8gXA0KPiA+
IMKgCS1ERElTQUJMRV9URVNUUz0xIFwNCj4gPiDCoAktRERJU0FCTEVfRUREU0E9MSBcDQo+ID4g
LQktRExJTktfRkxBR1M9JChTVEFHSU5HX0RJUikNCj4gPiArCS1ETElOS19GTEFHUz0kKFNUQUdJ
TkdfRElSKSBcDQo+ID4gKwktRENNQUtFX0NfRkxBR1M9Ii1ETElCU1BETV9FTkFCTEVfQ0FQQUJJ
TElUWV9FVkVOVF9DQVA9MCBcDQo+ID4gKwkJLURMSUJTUERNX0VOQUJMRV9DQVBBQklMSVRZX01F
TF9DQVA9MCIgLi4NCj4gDQo+IFdoYXQgaXMgdGhpcyAiLi4iIGF0IHRoZSBlbmQgb2YgdGhlIGxp
bmUgPw0KR29vZCBjYXRjaCwgSSB0aGluayBpdCdzIGp1c3QgdXNlZCB0byBwb2ludCB0byB0aGUg
YHRvcC1kaXJgIGZyb20gYQ0KYHN1Yi1idWlsZC1kaXJgIGJ1dCBpbiB0aGlzIGNvbnRleHQsIGl0
IHNob3VsZCBub3QgYmUgcmVxdWlyZWQuIEkndmUNCnJlbW92ZWQgaXQgYW5kIGhhdmUgc2VudCBh
IFY0IHdpdGggeW91ciBvdGhlciBjb21tZW50cyBhZGRyZXNzZWQuDQoNCldpbGZyZWQNCj4gDQo+
IEFsc28sIHRoZSB3YXkgeW91J3JlIHBhc3NpbmcgQ0ZMQUdTIGNvbXBsZXRlbHkgZHJvcHMgb3Vy
DQo+ICQoVEFSR0VUX0NGTEFHUykuIFNvIGluc3RlYWQgeW91IHNob3VsZCBkbyB0aGlzOg0KPiAN
Cj4gTElCU1BETV9DRkxBR1MgPSBcDQo+IAkkKFRBUkdFVF9DRkxBR1MpIFwNCj4gCS1ETElCU1BE
TV9FTkFCTEVfQ0FQQUJJTElUWV9FVkVOVF9DQVA9MCBcDQo+IAktRExJQlNQRE1fRU5BQkxFX0NB
UEFCSUxJVFlfTUVMX0NBUD0wDQo+IA0KPiBhbmQgaW4gdGhlIExJQlNQRE1fQ09ORl9PUFRTOg0K
PiANCj4gCS1EQ01BS0VfQ19GTEFHUz0iJChMSUJTUERNX0NGTEFHUykiDQo+IA0KPiBUaGFua3Mh
DQo+IA0KPiBUaG9tYXMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
