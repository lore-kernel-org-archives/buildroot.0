Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE0EC021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 14:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 091A9612A8;
	Thu, 20 Feb 2025 14:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68iJbTXAm_wu; Thu, 20 Feb 2025 14:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBDB661288
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBDB661288;
	Thu, 20 Feb 2025 14:10:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 609F2CF
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 14:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 439A7411CD
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 14:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fisxWo-Rl2BY for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 14:10:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=1392cf689=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1897E411BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1897E411BE
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1897E411BE
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 14:10:07 +0000 (UTC)
X-CSE-ConnectionGUID: Y1TmT8SGRFu39sP7d+gi5g==
X-CSE-MsgGUID: Pw5L5ZfuQHSu3IKSWQV+sg==
X-IronPort-AV: E=Sophos;i="6.13,301,1732550400"; d="scan'208";a="40004542"
Received: from mail-southcentralusazlp17011026.outbound.protection.outlook.com
 (HELO SA9PR02CU001.outbound.protection.outlook.com) ([40.93.14.26])
 by ob1.hgst.iphmx.com with ESMTP; 20 Feb 2025 22:10:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQoqSFjyCLC4/FoOq3poZA1JCrN9S2TrAHo5XUvejcbBwhOPIRsu7fGKTyriu0hYsR1g1MPGjIfl7+GV6FDXIzxd0Kpbc73sYqpKbDWcIA+hUCmIJv4+vypdhlkZpnQ/eJ3wuGAtjXDXl5QuOSjRLCsVbJ4PWcbOaHVONrvBawnAwpl1GOIbKEUMWayf5eFGDxmpUHI2KJwLEdDqTzYx9Geozn+WHtHkAKn3QPAlIGBZkDvc4Zj+gStgbT18dRfEgca3vDDWn5mbtCEE0F+yPtU34vdmjAs8FOcQtECs3NUZzgSa/k+cRhne9nqY72V/mM1cLEXgcUGSFTJeGJKVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dacalmU5ZcEx/GERA0ZwWf56m1aZQbJKlecRv22452s=;
 b=nXKDi0No/Xurff8J9mp8D2pGk9Am3XxD1PtEAJ+/P1C2KJzUw8tNSEq0WX4efHyEc99XsIbArgpp1AAj9PNAzpEtCIDy35zBXaVrlm1EG6+Cr4bYqL711Nq0r2jHhken+OX1BiiMuyQurXgXsK8gKADmyLRvcKTd1ToZxIIpkrFM8NlZyTDpXFj91riJ407lxvBdN595fAXHPR0XWmBD9taGdCb4EZKDeAMsR6E9w5gQxcM//IlOr/BlS8dxZBdPYpM7iHXsYryJ6amq3sBTD29hIuFwFFm0q/udu3+P5NOFjxvk3odJR7nnjxOFISbCMLU/kh+7swbQDpb7zci2Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by DM8PR04MB7765.namprd04.prod.outlook.com (2603:10b6:8:36::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 14:10:03 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%7]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 14:10:02 +0000
To: Matthew Weber <matt@thewebers.ws>
CC: Brandon Maier <brandon.maier@collins.com>, Kory Maincent
 <kory.maincent@bootlin.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, Romain Naour <romain.naour@smile.fr>
Thread-Topic: [Buildroot] [PATCH] linux: Add support for vendor directory in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
Thread-Index: AQHa0t4WSaNiNl0YKk2atnjclhxBfrH32uoAgAAVBoCBWafzgIAABKQA
Date: Thu, 20 Feb 2025 14:10:02 +0000
Message-ID: <Z7c3ulpOlL6HWVVT@ryzen>
References: <20240710152941.334195-1-kory.maincent@bootlin.com>
 <d9fcfe9b-7b11-42ee-9773-b9620d720135@mind.be>
 <D2Q7RY7OPU0I.2KCWEGO4SYQX5@collins.com>
 <CAFt09wMuPRBHy7XFAM2ze965fR364RhguQQhaQbgs4AonTcExw@mail.gmail.com>
In-Reply-To: <CAFt09wMuPRBHy7XFAM2ze965fR364RhguQQhaQbgs4AonTcExw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|DM8PR04MB7765:EE_
x-ms-office365-filtering-correlation-id: ead15522-9ce7-4c22-81d3-08dd51b844ee
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SEpMMzBHbS8yNWNDY2dhWGxxV09uNDUzZG85VXIwVFg5cmZ0N0xSQXovaEN3?=
 =?utf-8?B?dEE4aDRaZUJKelVPeFh1QXRFSHNJdUptVHRsNjZmNUpZc2VZSUh3c01qM0VS?=
 =?utf-8?B?WTU1QmQwZGVIUElkYVF0bVFERkRveU1mSG5saHhlT1MrNkh2SG80Q2J1alF3?=
 =?utf-8?B?MVhsMDhIVktlL2d2T1RnMDhKVXdMZllhb3FJVHVYNkZvVkk3T2lLN1UwWVd1?=
 =?utf-8?B?dzJVeU5ZdEJNRmRQU1g5cGh5S1NTcWtKSGJ6MHVWaDdPYmdIbHJ6R3JoY2t5?=
 =?utf-8?B?NHNyTHhzN3o4UUs2ZWsxUThHNVl2b0kwbkUvWnA3WXVJTU1HL3NWVmVVYzEv?=
 =?utf-8?B?enFrbUJGeFJJOGp6VHE4VEl4Y2luc01SWTFQUWFUMnA5NEljN2htRG1JTWtG?=
 =?utf-8?B?ODlQckx5TzZxMUMrd3gwZ2hrMnJXYTNrOXc0c0ZUd0dYaFlhejEyWUcvZWli?=
 =?utf-8?B?TlJta3JYRmovK2dITkJyL1A0ckgxOGNkT0tCMTVHcUUrWUNrSzNlcUhwY3kr?=
 =?utf-8?B?OVVwMWxPcFI1Wk9MbmNnNmJXNnpWTkYwemJOY0tobW9SSG9hcVhOUWVuOG9M?=
 =?utf-8?B?cGhvVC9UZHhDOWJoYmNhaVV4MHhnVUVRWk00MXdHc2paU2lFa2hZQi9OV1Y4?=
 =?utf-8?B?T3JjVHlUNUdreFFjTHR5WmVJUktZVkduZjN5MTJMR0ozSThQY0JTU2Q3dGxX?=
 =?utf-8?B?ZEhDck5IV3FWd2s0V0RyRUZDamh4OUdtOVU1a3ZZL1hNRGxSNktSUC9sWkMr?=
 =?utf-8?B?a3d6NWd1VFpaMDVyRUhsckZTZ295NTlWd2o2YlNIcXI5WS8wU2taWDFTOG1M?=
 =?utf-8?B?K3R3L1hTVkZGMVR0SHNNZU85eUFseWVWdEc3OGNDN2hMOXZwSFZCSkV4ekhE?=
 =?utf-8?B?ZXgzWDU4VjF5TXR5T3BQQ256b001RG5kK0JORXRZem1ld0NFQWV6T0c4WEV6?=
 =?utf-8?B?cGN1WHJvT0pwellwaE5xOGtQZXF1UERuWEJtTmQ0QzFiSStVRG5VWlJ5eUVH?=
 =?utf-8?B?N0hnRXF1MUxUWUo4QVR1WUpMRmpzN3o1SWZ0MXRLTGplVVdvQTc0U201MElM?=
 =?utf-8?B?eVQrSEU1dFhoL0dsd1YyTDZEa2c3QmUxdkhlZmxnMEVMcTRCZWhXbnVBSFBm?=
 =?utf-8?B?d3hXUE5NY2FtNDRaNWVVOXVIam95L1hSWkNPK2I2VVpHY1dMOWRpbElTQ2p6?=
 =?utf-8?B?VXJXSklOeTlPQmVTZ3h2VGdyTmduN3ZvcFBHTElpMnBDNU1qYWcrd29NZWlz?=
 =?utf-8?B?QkxVLzBHMnZVMHBnSVVKaWozbVlSVnpoK0hVUHAzWlB1UUZnSEc4RXZVaHBy?=
 =?utf-8?B?RVFRQU5tUjhQdGdwUlAxeTV6UEk5c3BSZE5rb1VUMDRlNUdNWEQ2RHpuRXYz?=
 =?utf-8?B?dzdteGY5Y3F5ZFJtbmdiOXRXL0hEd3ZtMXFTdkl4dWpjblVaOFJnMmN4dFM1?=
 =?utf-8?B?NnhHNG5oUUJLRmIxZEdOYTNXZ0ZjYnVoRGJ2MzM0TEpHKzd6MUhjckgyWjkx?=
 =?utf-8?B?TDRTWWhCcE5uc20xMk0rTjdLUGM3OFQ0WGNOLzkwcXBMa3pOZ3NWNTBoWGpT?=
 =?utf-8?B?ZjdLYzJVVXRRSXZ3Y0pHbk95VkpZZ29PVjVORTZ3RkZvZVhRZUc5U0RsRm94?=
 =?utf-8?B?aityQWJ4K3MyL0VuejFxRDdDVWdZb09jSFNZR0FQWnBaT01vNmwyNGpXUkF1?=
 =?utf-8?B?TkFCaHNvVmhORUN6WHQ1dzBqbFdpaVJBK20wMytqemxwTXpvUGtwTlp5VFdq?=
 =?utf-8?B?bC9kNXFzMHJCaXFobzdvcmFnZ0xFR0V2KzNhOGxVa3p6NGZDMDB3MzlUUmdQ?=
 =?utf-8?B?VEUzUFg0UGVzam9rT01uUTNrZlJaTFRoVCtWa0ZDaHk4bS9GZE83d1ZKSmdj?=
 =?utf-8?B?bzFjT0lVcmtmM00veE5iamN5S3FxbFplazNEM1FzVTJnWWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXB2Q0xSeitLbnA5K3huZkh2MFRFV2FyMWlmWStUZkVldklaR3pYR1NjOElD?=
 =?utf-8?B?S2VWSElhYU9XNEN1emJpUVRsb0t0QmZldGxINFVtc3FQUEtIVGhzVEVtUDVk?=
 =?utf-8?B?aCswbENTRnV0TGtqc0w1WlZONFV4anNkYXNhZ3J1RFpDMmJqS1VnM1BLSXJn?=
 =?utf-8?B?VktucVZOd00wWmZIUkFGVHN5ZzdsaEp3czJpME92VUZVbzFyRmJRS2I4aEVo?=
 =?utf-8?B?eUdOM2dHNlJqVm9qU09MTkJLT1poUkZ3Sm12MUpqamZ0OWgrMWtMNWNOSTRt?=
 =?utf-8?B?M0JMRkZUQmdySjEydktvSm1WalhvOHA4RWxJVHlPbGgzcDBIN3JLT1pvekR5?=
 =?utf-8?B?dDFMOU5qN0poOXk4cGhVS2ZjdDQ0dVdwbmptL2FJRGN1bWtoeGZhU201b1A0?=
 =?utf-8?B?K1NMblVoc21wSWRoam1vSDQvcStsSFFwOXdpU3ZYMDNpZkZrUzRCVkJPdkpp?=
 =?utf-8?B?YUFtMTVGR2hZUFduL0JnamkxcHJPK0VpQk5EQUhCZC9DUjNDU0lqNktZV1lF?=
 =?utf-8?B?SkQ4M2t2WXRhZlZJaWVzZUNwNGkxTHhVWXMvaHk4ckRjMmgwYWpxcTVyWmE0?=
 =?utf-8?B?RVVyZ2RKRnJBYnF6WUFLQU5qRnowZmhQQ1k4a1BKV2FzQWRYTy9pcmpRSC9O?=
 =?utf-8?B?bUt5RlZhbzZFMDR0d0lMWHo4ZFJCYU5GUk5tVnVZT0NnMitQbVFiUlpPaVVi?=
 =?utf-8?B?VE5vckU5Ulg5QW5ydGNqb2kyMG9IbmZ1Mk1mSXk4OGdjcTlXaXJpUVZLNU4y?=
 =?utf-8?B?UlBodHNnTzVoVEZQSUF6alJRUFM0aExzajFoZzA0Y1J0VzBTcHFMVjhPc0FZ?=
 =?utf-8?B?U1loK2l2VWZyVDNyMllVYlpmMm9wVTRaT0tMazYzZ1NvVTlSRHo0U3Z4aldC?=
 =?utf-8?B?SmpIeDBDTGllS2Y2bEZPMzdqS1pSMTM0dVhWaWk5S2VaZFJVenFjNmtHZDd6?=
 =?utf-8?B?VFEwZ3duN3p3SUpSb1Vabmgvd1lZaFFkSXdVeEMxeEZkcXM5R3U1N0lvSDRa?=
 =?utf-8?B?MHZWOUtIU1AwNFJyekVDN0J5UUFwTXIyMStpTmRtVndKZXhVb2F1WE1FN2U0?=
 =?utf-8?B?NGYwYzBSZ1NuQ05kMDQ1S09QWHNUNWtzN2dwQ016S1lyc0JaMllPU3pvRXIw?=
 =?utf-8?B?Njkxbmx2N2VxQzZ6RmRjN2Zxc01uZUVxRXMzV1pvbjY2TW4wRmFyRFJIc3Bq?=
 =?utf-8?B?OGx0R3RlL2Iya1NrYnVHRkxrbXdHNmJoMmFKRE45eTIwcUpEQjMzSjI2VEt6?=
 =?utf-8?B?ZFh4cVUyWDBIZ2hJaHJMYVJ6VEs5ZTRRY1Q0aVBJeUQzbkpVT2E0eDc3TGxR?=
 =?utf-8?B?T0puQzhCdXNlUkQyZGdYcy9FQVlZdVJ6TDg5eHJKRkEzTkswdjlQR2dUeEh4?=
 =?utf-8?B?TGpmLzFSWVlPVkFOdHpISytXVVJRbEZkMWxHcGRVRUZTeE9XNTBCKzRnN0NH?=
 =?utf-8?B?aXNSUCszdmVieTdsVTRZdDlDQ3VsUzVSM3NETEpZaWQ0TVBBdTRZbWpQNTRu?=
 =?utf-8?B?bVJ1d3A3a0NERWU0STNJdmZodFFHbHlqeS9VTC9tRnMvRWg1NHd2M3hKNHlj?=
 =?utf-8?B?UUlqc2RIem5hekhubVhYYlFWNytJbWRNalpCVDRGb3ZHL2pBVDdleW9iRmNq?=
 =?utf-8?B?QlEvcExEVU9ydjlpVVlHWDVQdHJXNTVpQStDcmZadUp5UFliMTJOaUlYSE5X?=
 =?utf-8?B?L1JXcXNoNkZyYURoZ2trQ0V2WUZKZkxPaUI1VzEydmQ5MHFDbTFJUEtob2Jw?=
 =?utf-8?B?UWRkcDl3NVRTck5hbEx5YzlaeUNUZkxsVmFFVjVwN2dEeW45eHdFLytqRE44?=
 =?utf-8?B?cHZEZnlISGhLT05CVWVIV2I5Y0VlK01mVXdpdGRsM2cxR0FkVXdvTkN6WUJN?=
 =?utf-8?B?YW1OUkpQT1Zpd3hjai8vVi9BZUNDN1B5dXQ1cVhDZVFJQStNQ1JXZ2RlelQ2?=
 =?utf-8?B?T0NYMlhYZkVTUyt1U0NqMnpJR1l3VmhuL1VpcmNkandIeXVnbGtDYStDR1Jr?=
 =?utf-8?B?UHEvdktxWExKdy9Gd2I2cm1oUEdRalp1eG91NlRycFk3OTRnTlI1OWVaczlY?=
 =?utf-8?B?WFppZnQ0cWFyN1hJQmkyWUkzZW83Q1ZRWTB2WEJVc3VkNTdYbFdJcHdYUDBX?=
 =?utf-8?B?eHpKbXVLeFUrRDlEVStQb1M0c0lLYk12OGRsMHNIZFMwTnh6TmtGWW1Wa2s0?=
 =?utf-8?B?ckE9PQ==?=
Content-ID: <F3C6CBEDD20FB541AF2ECD4F43448922@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: CgctEHiKAY/VXDDUa2KEJ3XfU0SPhwSKnhtFGk6cqHroK9iNsFbegjagCexGwoW5YUKES7eYJYx3KMMpdAym+mlZpfIt7wbP3Yam8b+sFo7vgYO1BeJm7aoYjvkRVizZamfJkyk/59cymdn2Bziq3BxxP9RTgfUdMHNYx5h2ZFqEczbyRMJ/6+/J12eeld2MrpNixdrvI7sjl6QdNSm+dTVcjFvXaicpCvVpmaP2/Uz4cFuUNjqUNktz3copPNBxkp7D4TuHWbNGVSWSUyDSSQet1mHWpUwQdX4tcrAABJkljegQyfuJGmRDZURH96h85RMkQIfnAC3wmWyUUJDPykUSRzkkanyLNDyDP60I9c362q5ZbUiImTyTCjYL4Wqm6vrx/nlszGYchQ7dypv4dJbJbzaveWYuoWDuuJ1nRS3ywG13IBd4BtV1NtiWAGhTI2giSURb2UTqbhFfX/XabLG39OKOf/RgUyuF9IfisuqxrbdNBRnLsvib/NbJCmtyuovrif1LKp5iBISbTK1d6B6APUzqZPc60s7ccNGYcg6CjOgSYLuqxxPCYgUGB6PWKkuIQ65/bmYenMz6G5ARMIPa+ks8Wfg5h+Clov1YPtS0OKifzhYTM3vYUnq7mUCE
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead15522-9ce7-4c22-81d3-08dd51b844ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 14:10:02.8641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X1pfT3vHnJ3l46DACCEswGjFXSumEA8T/fhuKls/9GO4yiTWGB/jdk0s2VxtewX14kXNQudTVeu+ST6rcIb9yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7765
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1740060607; x=1771596607;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=dacalmU5ZcEx/GERA0ZwWf56m1aZQbJKlecRv22452s=;
 b=IEegrOj+X1DcVGbTDoxS2tlao97GMf1vfHduahyE4QkYE4hTyaCo8psc
 wQTpZqNI7FlwKhY0sCipfg10XQWN67Wu5Zoj5pGGKlXl6gZQcx1YpAD0h
 KsZTZFWDN1BEXphYpUX/WEweL1GSQFIsET61xPADkskvZkHxjXf5/dkiG
 vvA2cWaSdUMVjAV56obBnGj+lnLxaRnlaIh9werzpyM4SGbsdLDpY6LM5
 seMDb/B9r27Sd+V1Zoow14A8s4YZ/V2oN/XJnUGWOquCByCC50dhCRLEq
 CrdLwjd2Qzu4ya5ae5NtyOY/BrTGHPAiV2QWfy/WaADvBG9J2kEUsUnDc
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dacalmU5ZcEx/GERA0ZwWf56m1aZQbJKlecRv22452s=;
 b=Fb/TrkKjdP2BDxWwj0jzzlQqet47DPxIWJDVXDOym5VSdoR5toq/82uAsSbpIJSyNTAdwlI8Bffa4FYTDsHaWcOTSL+S40RTd94+MVvRHel0JJtH2QcZ4MmMA03nWo4mQinKl6gxaV2rGC1QTZjfnJvd5UxFWZ5HPfxrpxb0/0s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=IEegrOj+; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=Fb/TrkKj
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH] linux: Add support for vendor directory in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWF0dGhldywNCg0KT24gVGh1LCBGZWIgMjAsIDIwMjUgYXQgMDc6NTM6MjVBTSAtMDYw
MCwgTWF0dGhldyBXZWJlciB3cm90ZToNCj4gSGkgS29yeSwNCj4gDQo+IA0KPiBPbiBNb24sIEp1
bCAxNSwgMjAyNCBhdCAxMDoyM+KAr0FNIEJyYW5kb24gTWFpZXIgdmlhIGJ1aWxkcm9vdA0KPiA8
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gSGkgQXJub3V0LCBLb3J5
LA0KPiA+DQo+ID4gT24gTW9uIEp1bCAxNSwgMjAyNCBhdCAyOjA3IFBNIFVUQywgQXJub3V0IFZh
bmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToNCj4gPiA+DQo+ID4gPg0KPiA+ID4gT24g
MTAvMDcvMjAyNCAxNzoyOSwgS29yeSBNYWluY2VudCB2aWEgYnVpbGRyb290IHdyb3RlOg0KPiA+
ID4gPiBMaW51eCBvcmdhbml6ZXMgZGV2aWNldHJlZSBmaWxlcyB1bmRlciB2ZW5kb3Igc3ViZGly
ZWN0b3JpZXMgZm9yIGFybSBhbmQNCj4gPiA+ID4gYXJtNjQgYXJjaGl0ZWN0dXJlcywgc3VjaCBh
cyBhcmNoLzxhcmNoPi9ib290L2R0cy88dmVuZG9yPi8uIFRoZQ0KPiA+ID4gPiBCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9EVFNfUEFUSCB3YXMgb25seSBjb3B5aW5nIGRldmljZXRyZWUgZmlsZXMg
dG8NCj4gPiA+ID4gYXJjaC88YXJjaD4vYm9vdC9kdHMvLCB3aGljaCBpcyBpbmNvbXBhdGlibGUg
d2l0aCB0aGUgdmVuZG9yDQo+ID4gPiA+IHN1YmRpcmVjdG9yeSBzdHJ1Y3R1cmUuDQo+ID4gPg0K
PiBbc25pcF0NCj4gDQo+IFdoaWNoIGtlcm5lbCB2ZXJzaW9uIHdlcmUgeW91IHVzaW5nPyAgSSBu
b3RpY2VkIGluIDYuMTIgd2hlbiBJIHVzZSB0aGUNCj4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01f
RFRTX1BBVEgsIEkgZ2V0IGEgIm5vIG1ha2UgdGFyZ2V0IGZvciIgZXJyb3INCj4gdHJ5aW5nIHRv
IGJ1aWxkIHRoYXQgZHRiIG9uY2UgcGxhY2VkIGluIHRoZSByb290IG9mDQo+IGFyY2gvPGFyY2g+
L2Jvb3QvZHRzLy4gIFRoZSBmaWxlIGlzIHRoZXJlIGFuZCBpZiBJIG1vdmUgaXQgaW50byB0aGUN
Cj4gdmVuZG9yIGZvbGRlciBhbmQgdXBkYXRlIEJ1aWxkcm9vdCB0byBidWlsZCBpdCBhcyBhIGlu
LXRyZWUgZHRzLCBpdA0KPiB3b3JrcyBPSy4NCj4gDQo+IFdhbnRlZCB0byBjaGVjayBpZiB0aGlz
IGlzIGEga25vd24gaXNzdWUgYmVmb3JlIHNoYXJpbmcgYSBiYXNpYw0KPiBleGFtcGxlIHRvIHJl
cHJvZHVjZS4NCg0KUGxlYXNlIGhhdmUgYSBsb29rIGF0Og0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYnVpbGRyb290LzIwMjUwMjA0MTYzNjIyLjE5MjkzMi0xLXJvbWFpbi5uYW91ckBzbWlsZS5m
ci9ULyNtZTQ0ZGNjOTg1M2UzNTU4OWEwYTY0YWIyMGZjNzVmMDM4NjQxYTQ5YQ0KDQoNCktpbmQg
cmVnYXJkcywNCk5pa2xhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
