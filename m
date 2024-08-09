Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6089C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 15:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45B9D80B27;
	Fri,  9 Aug 2024 15:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfqVFRjz6dH4; Fri,  9 Aug 2024 15:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D7AC80BD3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D7AC80BD3;
	Fri,  9 Aug 2024 15:19:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6F311BF5DF
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEC3280BD3
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lTB4t4Eyj_B for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 15:19:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::626;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06B1580B27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B1580B27
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::626])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06B1580B27
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 15:19:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfc6uG/pBhjkoiSAnrlU4DGrCWYrO/62wzyHdXdKyjpAHluwO4mw4NwJlZgKSnobLDx1IvheXJJqmTZMZdbK74OfGlufm6TiRV0oB5Bf4DOfKVHAwYHozt2EPXTICc4Chsxkj3D8bLXl7+i1709E1Eucez/QCbm2UuaSwqpAIhdhw/rFnC/c2APbRxjsHH9/vMkLaeuHsxS5JHkt+w8Bo51AZnCyAUzc7cIHv53K96fv6HP1MHdp5u+VE8t0hNciSwVrXZrmAHr+T54ElRfKgDjPscb8rpZl9qkltkfiwaZ2QeOJtfDryiIUMspcqZxmVyf7x2LVGz+HDXZK22yK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMgLK/VqtSwDk5Q9mTyFjNFSTOVifXXWJbCAlLqENuY=;
 b=IO3jreyc8JFU6QiQeRCIbmPnaCj0zRUQfLqx5N5TjJKVOqMJQzneDI3lttF7IaxBpv7VotTo/HIX+8z5Eobt6Z6U5vwapKhQsiqTxRiWFb/SPfms6YdEHlaIUt82htrp3hX2kf2U7aTNHkVVx0uMQIgPfdeyXT5L/ZbGJ1QXspso1QinBAD2rmfQyBGKiwfYY5xmUJ2Q7mapSxeUSQBIxR4IU5+gnuBwl6KBMBtr/Sf53yIfDM0luBUre+pUPC5Qv7e3m6lHYchEspcDFj3r0Ri5aYL/Qx3wTSvOcnqg/J/sX1cKfCbWjs4uuGXGIkxrqD8o4YkKGXMkai4hSApjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM3PR12MB9434.namprd12.prod.outlook.com (2603:10b6:0:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Fri, 9 Aug
 2024 15:19:30 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 15:19:30 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v2 1/1] board/xilinx: bump to linux 6.6.40
Thread-Index: AQHa6ZYqUwxIqu7NiUuHr4S385pXN7Idw5SAgACEs6CAAL7MgIAAAphQ
Date: Fri, 9 Aug 2024 15:19:30 +0000
Message-ID: <CH2PR12MB500412028C07F3C30A5DEDD5F0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240808132318.2473585-1-neal.frager@amd.com>
 <D3ASDF13YKH7.1L058LU6Z9LD5@collins.com>
 <CH2PR12MB50043F73B67812E0158B2C2CF0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <D3BGZWZ19TUJ.3MA2J962PXN6E@collins.com>
In-Reply-To: <D3BGZWZ19TUJ.3MA2J962PXN6E@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM3PR12MB9434:EE_
x-ms-office365-filtering-correlation-id: 7d6cdc58-4e13-43c0-6ae7-08dcb886aa9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?Q0FSV0dITzd2S2ZJa2FQTE1HcnB6c2phWmpsVFlNNTdXeE1ldVFDSmNMS0Nz?=
 =?utf-8?B?VkZDM2Z3N1psQThXYmdkdHdHTFpHU2pYYWlnVm01azNpQXQ3Mm9BTHNkWmZM?=
 =?utf-8?B?dWduRUlxeWcxRGhNcWdBdC9QcG9kR2hKajE2dUc5SnJOQ0xBa3pyWW82VFBv?=
 =?utf-8?B?WnhwKy8ySDhkUVFEQTJVOWlobklqT1NHdHpGa2NER1VDN1k5OXZnUFRFdmk0?=
 =?utf-8?B?NlJQMkRhcjJGYzFIeHladHBBcGptZHdPRURmUzNwQjdzb2RnUTlycEUydlZL?=
 =?utf-8?B?cnl0UStzOGVVTmJqZlNrVnlFcUlLT3dCZnhMbkJFTDBYOGJaTENzWDQwUy8y?=
 =?utf-8?B?SURRdGhtS3pzMkZoMm5SSlZNbU9ZU0lwZ3FCM2V2d1FQME0xbUFFUmM5Njdv?=
 =?utf-8?B?dEVmUzhWYUFlT2k2YjBpcG92NjhBaUxNQ21HNlNPZHJ4NWgxOEN0N3ZaMzh3?=
 =?utf-8?B?K0QyejVzMDAxbjVKcGM0L1hUcy9xT1J3TysvVTQ2bzNXM05rR1RCd0kwcHJ5?=
 =?utf-8?B?U21jTkVmbCtlM2Y3V3BPaTBKRVZiRm1ZU1JTem5rWFJhTkI3NDJUN3ExRlFh?=
 =?utf-8?B?QTZzMkl2Qk56ZUFSRFVFRVlkUWkzUS9GYm1DMEpXYWVZelZmcU8xMWtZMjkx?=
 =?utf-8?B?UUVtVnR6NjcvVERVWC95dTJXOTdqd2puaUN1RkxQYjZISTBMekZzZXFKVWFU?=
 =?utf-8?B?YXhtNkNzTWZRTU1EaWUvb0VpSW5nTFdHNE15V1dxUjg2UkZNbzdldHJRaC90?=
 =?utf-8?B?blU0UGJqQWpqRjdwNDA3eWpRZnhOaUZLVlIyK2h3ajQxNXRBdFRZaENEMlRY?=
 =?utf-8?B?M3NTa3F6cVVTajVVTFpDOWovSnZESk83QnlQbnY1dm5QK2pzNjYrRHR6NDNI?=
 =?utf-8?B?LzA4YnNWZGFZUWZ2SDNoNjNEVm4xUndFTWRSSHRtMU03dDhrOTBoWWlkQzRW?=
 =?utf-8?B?TmVod29yeXhlUThHTjJ3Sm5FOWUzRWF6SThKMTAvY0pVeTJIRFlIeUpVeTV4?=
 =?utf-8?B?NVE2QWlFREpONUE0MHpIZXd4bXNIZ1NWa0VUUy9Jby9GdmphMlJ3YlhPeVpF?=
 =?utf-8?B?VGIrZUM1ZTJha1p4NUFEMzZhR2ZCRWdqWW4vejFyaVI4MzVqWHgrR21nazYx?=
 =?utf-8?B?NitJcGFpdDdnMVAxNzIySU5UUWtBYVRzY3pNUVNBZzRMaDE1bGlRazQ0eCsx?=
 =?utf-8?B?Q29PRW5xU1ZXejBYdElUREJlYmJUTTFEL1lxY09SUzFEbldWMmpJL0xsS1p3?=
 =?utf-8?B?YVF6Z1ZDZUJRbmsyditob1J0VGdTS295UnJTMm5SSTJ4c0xkYklCaW9DRmFt?=
 =?utf-8?B?UWtoYmdtNkc3dWJXV3FWT1BBWlQyYngxUDhFbEZXQUJZcXdLaEFlQlFUSGY5?=
 =?utf-8?B?M1lrVDR1TWV1cVFsTGpwWEdTUi9SWnFEMzBqbDQ2K1RUcXZoMEVqTzlnNm1h?=
 =?utf-8?B?QkZ4WXJaT2NEeTgxa280L2RqRElnOEFhUXFiT2NieENoV1grdVVEL00zbWhm?=
 =?utf-8?B?QUV6ekJtTDdXcU9SMGg3QVE0a1IrZVl1eW43SFNjUHVhMFJEamNwOUMzOEdI?=
 =?utf-8?B?SHZaU21oWHhYaXlRM1I0enNhUWJqMHdMMGp6RHBxNWF1UFh0VlFoVUJ1UEdx?=
 =?utf-8?B?NWpUSkczODl2Z2NHZHBMQWxSQ3ZOY2UyT1RnbC9rMW1WZU5zaHNwL0RWeUU1?=
 =?utf-8?B?L3g4c3lFMzlmeUQ0U1czc1R3dXdHd3pFZE5xWlJLdS9ZQlV0K3BPSUNHSlpm?=
 =?utf-8?B?WDU4cm0wOEJPNGc3Z1F3M0JiNytxZWtvNll5VGx6SjFrK3JQM3UwWDRyRTRB?=
 =?utf-8?B?eWQwZ09EcEZqa0ZDOVI0aXE1aDJHQjRDbGMvTG1XVHUwMHJiSjFwL3hwMTJW?=
 =?utf-8?B?cno2OFR2Mks3OEZsR3BQYit0L3RSWWxFY1ZGZ21zNWk2d1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SitxVkZ2Ny8wRWh1M0tEOHljOVFXUlFTblFpMlpGM2c4OXVTQk80RXhmT2hS?=
 =?utf-8?B?S1dtZHJObFF0L3VoYWJaSzBOaXphVW54NTVxQkJoY3lsZHBCUHgxTG9scy9t?=
 =?utf-8?B?cDFoR1VHNExZRGJHczB5NmJEanlCa01ySkVnUU9XZVIrWlgvUVNHZStwWHNY?=
 =?utf-8?B?aFArYXgxMXFsbnZOdXNaMnZvSzYraCtBR24rM0FEYzV2S09UQmFxalFEZVZ5?=
 =?utf-8?B?eFlocmI3VGxzQlhnaDF0Z1cxQnMzUnFIMlNzR2U4TlJnR2c2TTZSdzVuS1Nm?=
 =?utf-8?B?SWtZQmJ0cW5MSzl0a2ZRWW5UeXU5N05aanVuL2syQlUzUFlucU5tR1ZOcS84?=
 =?utf-8?B?SFV2N25ZWjRkd29FeDZjMng3NjdnSVlvbXcyVEdoQ3BlSGJnTDJkWnlTOUpP?=
 =?utf-8?B?UTZWZHJDclRpcWRmSklwRlRjaUg3SDVlMWpTa3ZVcXRaaXB2K1JkeDZubFRK?=
 =?utf-8?B?RzRqTTl5RTF1Sm82ZFRoNTJKYm9Jc0JuK0dNczNDeFpEQ1pUNXZYWDVPSVA1?=
 =?utf-8?B?Q1dwaGxNMG5oM3YwMDkwV1hDYzVCVTZRYys1ODdLSDNoREF4TkN3VG10MjdQ?=
 =?utf-8?B?Rlh2SEFsc3BkYlFKdHlDaWVZZjIydGVvazhNQ3U5bloyVnBQWUFwam10eHZz?=
 =?utf-8?B?VDNwTjdGZ0lZZktvV3J4VDcrd09VbFdaWmVYVDMzeUpBNlRtSjlrM0dxbDJM?=
 =?utf-8?B?OWJsSUExRUlIZGo1bUJob25idHJZbzhDNnBIR3R2WC84YzVHV0JRbXVLYzY4?=
 =?utf-8?B?bkhaSFpsY2swaGJvSEg1UzROMFpNQmJzWk1qUkhVQTJVUUhKWGo2UTBvTHNZ?=
 =?utf-8?B?bzRWay9KNVk0MUg4dFdCdW5ibkUvazFzamx4UUtLK3JiQ0xTUXpBOVdDdERn?=
 =?utf-8?B?dEJNOFJPVkpLR0FWb0ozMmpMUXZXcmQweVY5UDZBbGNMOVZrTmpmT01uZGI1?=
 =?utf-8?B?Ujd2bVNST1pRYXFVaVFKUEhlck1Ia1lHYkZ5ODRQdmg3RXJoOCt6VWk3eVVY?=
 =?utf-8?B?YnZveHZwaE1URTlXRXFYQTBJQTZlTlFSQWN3ZHdOamxKYXJEbVNKaExnRngv?=
 =?utf-8?B?VWQxRk9NMnB3eEhVK3Q5dmVZMnFjT2NuV1ZaajhHb2x4QVlLYzdkU3hPclNX?=
 =?utf-8?B?OUpDTU9HOFNRaE44cHFBVVJyQ1YxcjhSd0RkTDNNQ2RMeTB6RTJzSkRmTDhG?=
 =?utf-8?B?Vm9kTVk3cDdJNUIwS3B1c0J4d0gyWC9GQWVDY1pPWHNPWGZUdWRUZmR3anBu?=
 =?utf-8?B?YzNQeE9hbjFMTlgzZW04T2ZkaDFsbkVESklxT1JQclA4dldvY3ArUyt4SDB6?=
 =?utf-8?B?cERqUXIzdnVkN0FYYStJWHBDU0pTclRpZTFlcVFKZGlrMnFZNzNueXNwM2t5?=
 =?utf-8?B?KzNZRVlFRThlNWtVYWpsaHFDRXppNG94YjlNNGtINUFDRngvQTFqcmVyc1di?=
 =?utf-8?B?MXd2Rkc5a1NhaXJtRmI5c3p1TC9rUmtObXZDbFZ2SDNBR2VlVEl6bHZ6Q3p0?=
 =?utf-8?B?bHRHdmxxOVlSNHQyQnZBcjBkZHgrVDVsRVlTS2d3SXExM0xabGpDc1Q0eVo5?=
 =?utf-8?B?VzZYZ1JESDJKYWNNSk9UWUd5dGFWUVhyVXlUUllUVU12UDdtb2xZNjZGTndy?=
 =?utf-8?B?MzdhZm1RY0gzZjVoOEFOWWtDZTNMZ2VrazByNW0xc1U0a1NvUVoxc3MrZStQ?=
 =?utf-8?B?TGR5Ky9QcDJNUGw2SGhpNm9RSU9KQ2ZlUFUwbWkvKzdFeDZHR0FzT3oyeUp2?=
 =?utf-8?B?Z0QyYldjSk8rbmErTWRnNVBLTFF1bDZxaWVoRG12a3FhTU9BaFhiZDN0cU5l?=
 =?utf-8?B?UExPL3JnTEpTUUptNWMzd3pZZzB3a244RUZWQ1gza01qaW03QjdobS94amxW?=
 =?utf-8?B?OFZCRUFISG8yZjRpQmU0UzBpQjdCRlJTa25LTVJLOTJqWmdRTXNEdzFPL3J5?=
 =?utf-8?B?bGg1K1V0YzdqdFhlSmJ3cWtQU3RWdEdmWWcxd2lFM0NwUTUyU2ZFclZOZVk4?=
 =?utf-8?B?OG02ZWk3WURCbEVrcUJkM2RpcmZaUlV0OERvV0pOTTVJWWF1WnE3a0QzNThv?=
 =?utf-8?B?SFVuNS9JU1NhSHh5SWVLcDloTzBWRjF6L0dPcXluVGlFQTgzVWhBNWtQeEtG?=
 =?utf-8?Q?M4+8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6cdc58-4e13-43c0-6ae7-08dcb886aa9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 15:19:30.7147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6JrKUjlCgEM4ZbNEaRuQA/8hLMEvRsA/7h0Zyd5608SbtMreFdBfD3BdO2Iazc+d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9434
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMgLK/VqtSwDk5Q9mTyFjNFSTOVifXXWJbCAlLqENuY=;
 b=uea1hfBRB2nsYTmxBH9/jl8wE1fnTNafObNz3rsZefTU2pn7NO9gWd9FeSsCw9KUvtWg8s1y4OX+sbyDmICz1cHTMa/YmFCaf2CLi4UiGuIWr/5YQ9oAUFqOiT2iFeuJEWg+vW8P6DyYDPRdCGyCtOAem2xnOhv7K/Z6DAYYIUw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uea1hfBR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] board/xilinx: bump to linux 6.6.40
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> Hi Brandon,
>
> > This patch bumps all Xilinx board defconfigs to Linux 6.6.40.
> >
> > Xilinx Evaluation Boards:
> > configs/versal_vck190_defconfig
> > configs/versal_vpk180_defconfig
> > configs/zynq_microzed_defconfig
> > configs/zynq_zc702_defconfig
> > configs/zynq_zc706_defconfig
> > configs/zynq_zed_defconfig
> > configs/zynqmp_kria_kd240_defconfig
> > configs/zynqmp_kria_kr260_defconfig
> > configs/zynqmp_kria_kv260_defconfig
> > configs/zynqmp_zcu102_defconfig
> > configs/zynqmp_zcu104_defconfig
> > configs/zynqmp_zcu106_defconfig
>
> > I attempted to boot this patch on a zcu106, but I get no output over the
> > uart port from anything, U-Boot SPL, ATF, etc. So this board may be
> > broken on master.
>
> > Can you verify if it works on your end?
>
> I can help you with this problem.  It is because there are two different
> versions of the zcu106 having different DDR memories.  This is because the
> DDR that came on the revA version of the board became obsolete.
>
> I left the revA device tree in buildroot as I know this is the version of the
> zcu106 that Peter Korsgaard has.  Based on your comment, I believe you have
> the newer version of the zcu106.
>
> To fix this, only the u-boot psu_init_gpl.c needs to be changed, so the
> correct spl psu_init routine will run.
>
> Please implement the following in your zcu106 defconfig:
>
> - BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA
> + BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0
>
> This will build in the correct psu_init_gpl.c from the two choices below:
> https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-rev1.0
> https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-revA
>
> You can read about this issue for the zcu102 and zcu106 here:
> https://support.xilinx.com/s/article/71961?language=en_US

> Thank you! Switching to the rev1.0 devicetree does let my board boot.

Great!

>
> Do you have any opinions for how this can be better handled in buildroot to
> support both versions of the zcu102 and zcu106?

> My preference would be to having two defconfigs, as they are effectively
> different boards. But given Thomas would prefer not adding new
> defconfigs, documenting it in the defconfig as you did is a good idea.

As I mentioned in my previous response, I will move this documentation to the
readme.txt file.  It makes more sense there.

>
> At the moment, the older version of the zcu106 is supported and the newer
> version of the zcu102 is supported in buildroot natively.

> Would it be prudent to default the zcu106 to the newest revision? Is
> there any idea of if the zcu106 revA or rev1.0 is more widely used?

Now that I think about it, you are absolutely right.  Not only are all new
boards using the rev1.0 DDR memories, but I have to believe the vast majority
of boards out there are on the new memory at this point.

The only reason I kept the zcu106 on revA was because I knew that Peter's
zcu106 has revA DDR memory.  That is probably not the best reason to keep the
zcu106 defconfig on revA.  Sorry Peter!

So unless anyone objects, I plan to do the following.

1. Migrate the zynqmp_zcu106_defconfig to rev1.0 DDR memory.

2. Document the revA/rev1.0 issue in the board/zynqmp/readme.txt, so that
users of the old boards have at least a chance of finding that they need to
change the u-boot device_tree config for revA DDR memory.

>
> In any case, this issue is not related to this patch you have reviewed.

> Agreed, I plan to test the vpk180 here then send a reviewed/tested.

Great, thanks.

> Thank you!
> Brandon Maier

Best regards,
Neal Frager
AMD

>
> >
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> > V1->V2:
> > - Squashed bump of all Xilinx board defconfigs to single patch
> > - Removed linux patch which is no longer necessary
> > ---
> >  board/xilinx/patches/linux/linux.hash | 1 +
> >  configs/versal_vck190_defconfig       | 2 +-
> >  configs/versal_vpk180_defconfig       | 2 +-
> >  configs/zynq_microzed_defconfig       | 2 +-
> >  configs/zynq_zc702_defconfig          | 2 +-
> >  configs/zynq_zc706_defconfig          | 2 +-
> >  configs/zynq_zed_defconfig            | 2 +-
> >  configs/zynqmp_kria_kd240_defconfig   | 2 +-
> >  configs/zynqmp_kria_kr260_defconfig   | 2 +-
> >  configs/zynqmp_kria_kv260_defconfig   | 2 +-
> >  configs/zynqmp_zcu102_defconfig       | 2 +-
> >  configs/zynqmp_zcu104_defconfig       | 2 +-
> >  configs/zynqmp_zcu106_defconfig       | 2 +-
> >  13 files changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
> > index d85f773478..11f4dca651 100644
> > --- a/board/xilinx/patches/linux/linux.hash
> > +++ b/board/xilinx/patches/linux/linux.hash
> > @@ -1,2 +1,3 @@
> >  # Locally calculated
> >  sha256  ea85988e66b9a2e19ccd76d0f5f5e657988a873fed292160917712f45605a805  xlnx_rebase_v6.6_LTS_2024.1.tar.gz
> > +sha256  6415cfcfd74e943d6ae44f6c1edcae09bf6cd89410b03c4290bf1464a8368f84  xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
> > diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> > index 21dfe2577a..58479c9f2d 100644
> > --- a/configs/versal_vck190_defconfig
> > +++ b/configs/versal_vck190_defconfig
> > @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
> > diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
> > index 253a6d2cff..4d3afc0e98 100644
> > --- a/configs/versal_vpk180_defconfig
> > +++ b/configs/versal_vpk180_defconfig
> > @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
> > diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
> > index f955a0c4ad..71a5d880b3 100644
> > --- a/configs/zynq_microzed_defconfig
> > +++ b/configs/zynq_microzed_defconfig
> > @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
> >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
> >  BR2_LINUX_KERNEL_UIMAGE=y
> >  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> > diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
> > index 75ebc2a3ba..f3fc32145b 100644
> > --- a/configs/zynq_zc702_defconfig
> > +++ b/configs/zynq_zc702_defconfig
> > @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
> >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
> >  BR2_LINUX_KERNEL_UIMAGE=y
> >  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> > diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> > index ce539eefaf..f1c9bd6622 100644
> > --- a/configs/zynq_zc706_defconfig
> > +++ b/configs/zynq_zc706_defconfig
> > @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
> >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
> >  BR2_LINUX_KERNEL_UIMAGE=y
> >  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> > diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
> > index 925faeac8e..cada3bbd47 100644
> > --- a/configs/zynq_zed_defconfig
> > +++ b/configs/zynq_zed_defconfig
> > @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
> >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
> >  BR2_LINUX_KERNEL_UIMAGE=y
> >  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> > diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
> > index dff49b9837..262e80a145 100644
> > --- a/configs/zynqmp_kria_kd240_defconfig
> > +++ b/configs/zynqmp_kria_kd240_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
> > diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
> > index 24fdea9c30..65bba693a0 100644
> > --- a/configs/zynqmp_kria_kr260_defconfig
> > +++ b/configs/zynqmp_kria_kr260_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
> > diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
> > index a16da66e38..22df2a4112 100644
> > --- a/configs/zynqmp_kria_kv260_defconfig
> > +++ b/configs/zynqmp_kria_kv260_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
> > diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
> > index 3f1726a13f..c2feb393de 100644
> > --- a/configs/zynqmp_zcu102_defconfig
> > +++ b/configs/zynqmp_zcu102_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> > diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
> > index b6d943333f..c26210b49c 100644
> > --- a/configs/zynqmp_zcu104_defconfig
> > +++ b/configs/zynqmp_zcu104_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
> > diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> > index c10ec70ed8..737a8454bb 100644
> > --- a/configs/zynqmp_zcu106_defconfig
> > +++ b/configs/zynqmp_zcu106_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
