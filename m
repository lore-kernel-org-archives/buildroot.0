Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27ACC3600B
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 14:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A3A611BE;
	Wed, 26 Mar 2025 14:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51y8JQF1_YQs; Wed, 26 Mar 2025 14:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9027161170
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9027161170;
	Wed, 26 Mar 2025 14:09:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A95EC0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 14:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10FE283F01
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 14:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ou7A_KGlPqzu for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 14:09:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::609;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=nayabbasha.sayed@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32F3983A77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32F3983A77
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::609])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32F3983A77
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 14:09:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6/51fG0bHFo9vwAjhn4BgcMAw0iBXP9c7ygl2TYNK1VD2xC3yBPtg9kvIJkampT5909pEVbTK/2Kc9pYMv/iEpp7thPZsDiWgXfrSbE80EKcQVmPwr7WggQjXCKskUwg/WVsVYOO9pXMVz9XKs9/n/BvWs11VWdR7lVs+dq1i/+/Cdp5amVi/uS2uBO1FAUDjyo7oX4gyT+RAICU3e/Ki5vI4m6yFRJYdu6ETQ41jHX1yXBAPHRysb0bs9ft7t5f/dC9q91I5ZtTIuSMW6CeDh2sc6ZE67UIKtH5mewqI9WLOapxS5LjJql34PCFhUkzjvmo2qJCS8UPHQR6NAHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dETz3I0QAOWNQklXSX1M3k5zy1O+jsCzq9MWpMtCtk=;
 b=owU+3iBXfEaZR7QCCaJlbJFAixfNbrL9zyWIVVAccNNrIbu2RFRKO+7hclnv5Rg8BRaczBDkFShqtID8pNku6ktUxlDcJacIzE9fLqP8JOtkKgYLdLMslNtT/z1WE/IBYun1ObpMptE+YpNK6XZsznJBCDiuYTd9+cgephkintIMQMv+1XO+EZU6i6CAQAQou5JdKtlGxAKDYgyLXVTvFtNNcC7aXBxAZ3jpgP6TzFyQ+mIGHoQ+lnFfa54qH+5o01mY6Z5YW52cj39i25CVPmRey5TqD+t/dJa4v0gCvpMXOoscoRNJcMbDpS19qx7ZmSvNqZ0QOdwmCCCkLNxq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 14:09:48 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 14:09:48 +0000
To: <buildroot@buildroot.org>
Thread-Topic: [help] v4l2loopback package build fails for raspberrypi5
Thread-Index: AQHbnli7+e1lckMsAE+qkh9GBp4K+A==
Date: Wed, 26 Mar 2025 14:09:48 +0000
Message-ID: <37ad9e8d-bc5a-4e79-85e0-0128adfac465@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH7PR11MB5957:EE_
x-ms-office365-filtering-correlation-id: 6f68302f-bc2c-422e-2067-08dd6c6fde3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RmZCTXZ5MmV0aFdvT3hxZ2hlZ2ZQNUFhZ1VYRG9CNjA0Q2pLWDFhODBMUk5Y?=
 =?utf-8?B?Y0liY2oxVC9pcWo3QlY5ejBabFNDWmJmVXViQ2tRRUtzTEtXU0Y4Z3M0VGtu?=
 =?utf-8?B?TTF1WmN0MWYxNktGRngxSEh4eHF2bHg0L1RWa3ZnTHNsVTFUQlk1ZU10SGE1?=
 =?utf-8?B?Y0lkckxVUU1BRlVmYnpkU3FQc25ock5RREFmNTNUK082VHJCT1VjaVFBOFVX?=
 =?utf-8?B?VDdMRjVobzFId0pCQWNOY2ZRczlhbkM3bzZPNFR3R0hEbXNibzBhSW1pMjlB?=
 =?utf-8?B?cVQ2ZWRyQWEzc3M0eFVGclJIb0dFQzMzV1Z5alVhQUtiMWFLMFY0eFhZNDNy?=
 =?utf-8?B?V0syT3NHTDg3dkt1TWRDSEt6VGw5OXcvT056TGRkbGlVdmx5TWlnRFFZV0Rk?=
 =?utf-8?B?TENOSkRLMzd3cllRK0piOUljMktQUkpDMWhSQVR5ckpROEVWWTVpY281WHho?=
 =?utf-8?B?MkNUaEJ2bHYrcGRpeVlIREFqQTlTSVRkaUxVRDdidE8vWENjLzAvUkI4OGpF?=
 =?utf-8?B?YVpJbXMrWGNNWlNwWE9DaGZjV0Y4ejdxejYvUG9QVGxlbEJKZHZPTDBHQzVH?=
 =?utf-8?B?bTJPVUJjQlRTN2g2V3dzK09rRnNpNTdwS0RqUUNXajRlc094OXBRSkM5Qkp1?=
 =?utf-8?B?ZnFMMXhMTExPclVXTXVjcmdwZTcxWWRBN3N4Zng4eGl5UzJDMElVOHB5dEVF?=
 =?utf-8?B?cTFvTEtubGxINHV5UnNBRDdRZGVROHE0eHBvTGRMSFl6T1pnby96WnowQ1JS?=
 =?utf-8?B?cWRYckY1VDNETkgrYXdoUGM4RFdBRDZLcC9KRzZhU2FqODIza3ZvN1J3dlNp?=
 =?utf-8?B?NVlac0EzRmkrbi9mc0ROd01OWWlsYTJTVGxzOG1XZDdwZnZHL3Y0QW01Zzg2?=
 =?utf-8?B?bE9wZE54OE5VMWVaaEUzSjJXQkRRZ2lQRUZBYXVHaXN4QVB3N3JKbERHVnNJ?=
 =?utf-8?B?VnloTU03K0VGbTN3bDRtL3pHdVhDeFZvWktONitMOVhCWUR6UWFSbzBIbmhk?=
 =?utf-8?B?dmI2ZXZ4MjU0YndTd1IvOG13MEtJb2UvZGRLNFBvVHdTbVJnUkJYelBNQjd5?=
 =?utf-8?B?ekIzWjRTdU81MGQ0MldCUXZqL2hqL1ZaSXEvTkNEdURYbUs3U0YwOU5DbmxX?=
 =?utf-8?B?VmJzdGFlb3Q2WVhaenRZV1dtSDIyYjg0TnZPTFlseER5bm5jVWhNaSt1WXFy?=
 =?utf-8?B?Ujk2elFkdXdnM0R6UXNHVWVEWExhcUJ6TjM5NmdtdEhNWk9qSUlpcGlESnNi?=
 =?utf-8?B?N2ZjZXJOT3lrMXJpTXZMVWJWc3AwejBaNHRsbVZldWNsRTZ0YW41aHFnaHBp?=
 =?utf-8?B?dHBYQkJVTFdCTjdvNStuSE5wSlVOcWxQbmh5RVVRTXVxbU42M2FRbWx0S1pS?=
 =?utf-8?B?dlhWSzJ0dVlZNnQrUEhRd25OQ2loT0xRSmdHMmhSRk5QZmI3MlU2TW9rVmhW?=
 =?utf-8?B?U0N6aTdrcUF3YlhMc01EY0ZEK1drbUczdUhMOFF6TnA2UGdES2VNbkhCWDZ6?=
 =?utf-8?B?Q2xrRVNrWXVhWDUrUjdJU0RlVEMvRkRJc3BSbEd1Ukl0ZGQrTldUdVlSVDNj?=
 =?utf-8?B?QUo1dkR1VTBLcldMeFBaWHFPNDEwVUJueUVIbjlRQUkwTTNVaEVJYTlYUDk1?=
 =?utf-8?B?c1lkV3ovZnNmZmFQZ1V1UlFtWlVpRThIMXNIQjUvekE2WHNBK2tFQWhZbjAr?=
 =?utf-8?B?VitVeDVJQlFJTkk1TmNMeWdnRzVCaENHMlI5YzJENjJ5cXVxRnNMQTJQM1VN?=
 =?utf-8?B?NDJpYk5zQk9FN2JDQzNWdjhzeCtBYlNHUWdxdkN2UjFOVDVHRzV0VkU4U2NN?=
 =?utf-8?B?YVJpcktoak92cUoyeXdVQTNmbDZZVUliLzQzKzB2TWhHVWlkZXdvZENGNktX?=
 =?utf-8?B?NS9LeldYYzMyemlaYmgrc082SGFmNkJYVWgwRVdHMC9DRVNCcGkybU93eDU5?=
 =?utf-8?Q?Ege6qXalSyHi8O+G5oU3pTqzpm1pa1RE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWJGZUQzbFlLRE9QOHJwZFJmaGlYYTBoQm1QRHdpY0dybTF6a0c1YncvOEtz?=
 =?utf-8?B?dy80UXhwR3A5bkNZRng5Y09CL3Z5dE14bzJrUEhhSWQ2dE5ueDRaV0syY1Ny?=
 =?utf-8?B?S3VQYTZ6bFI0SzhrTTFRVjdaZUd1YVBhQWgyNmlRZER0bnZSWjVWTWlGOHJN?=
 =?utf-8?B?ekNub2tyRU1CMkkvWGo0MEZ1THVLbExNR1R1Z3B0dlhRWi9oSEtLTnBaZnVV?=
 =?utf-8?B?TlJ4NjhqK0NrWGFOdnY1azRKMUdTbDh3TzZPdE0zcW8wZGZvMmppZ2Y5OE1r?=
 =?utf-8?B?R016WU5tbHkzeGFsWVBWblgvR1lxWUtBVlRNTzY3VldQR3dhWnFPbWgvL0tC?=
 =?utf-8?B?VFMwbFp6QkdVZmpmQ0pYb0JEM1hqNTJOMmY4Zm1RVit5ZE5YQUcxR1JoYU1U?=
 =?utf-8?B?MnlLTHRjMWNwNE9XdXA5RzZkNVYzc3NPaXRUYUF5akhpaVJyZEFjczk0MVlO?=
 =?utf-8?B?bTVMdWJHdXAwSmMzNnZyREU4anFDeVA0SHUvUXJIcit1OHcxV1VjSXdYMGx5?=
 =?utf-8?B?Q2tGYUtrdTBzNExzTWtid2krYW5JL0Jlc0ZNMVgxQzdIYnBZRW9yZ2k2aVVP?=
 =?utf-8?B?cG1MWUkwT2dtdS9WZitOUUpteGovUDJCMHJ5Y1NOT0JaS0kzbUJzMytBN1cr?=
 =?utf-8?B?c1FoN0c1cmNYV2R5QUlTVEFoWFVjUnBvSmNYbzltTlM5NzNsSW5SRDA5UVE3?=
 =?utf-8?B?Y3VrMUNvOHBONFc1Z2VWWGoyWnJyM2VwRFZOR0Fhb04xcjFyMXRFOFhLcXRr?=
 =?utf-8?B?bkZwc25obVpBQUlhQXh4TkRrSzVLbHI1d0hPWlFONDFuVjJYUE53RkVSUnl3?=
 =?utf-8?B?Y1dadUpEM1h5eHNYSjYrWlNqOFhCOHRub2tQVytrT3FTRlNSWVE2UStselRG?=
 =?utf-8?B?TnFiMW1SV2lEVWFKTHVZSldHRFRLbGFERVUyS1JrS0ZETFUwTEh5eVkxQXVu?=
 =?utf-8?B?MHJvSDIwdldLcFJGQlZwMml5dUJEZFpUYTd1OWEwQWNLRXRraGhwQWFsSTJM?=
 =?utf-8?B?a2hjd05TOVV6aDhucXFCY1JaMDQxWXkvd0FjR1hZeU1UdXp2YWFGYnR1U1A2?=
 =?utf-8?B?WVF1RnZscHN4YlROR0lsVGp0R3NZRjQza3U0cDFSTER4a2ZEaTJSZUJ5VTFl?=
 =?utf-8?B?UE9xckJ5clB1RVUwVis3RHptQjBlNlp1eWdvK0VaamFqU1ZYNFpic2psWEJl?=
 =?utf-8?B?Mi9BN0NXNFZQSThNYTRjdW5iRXFCbkhnRFVFdVJpaVVwa1V5SndFbEVtcnhI?=
 =?utf-8?B?Kzl1aFFrQTZ4SlpMRkxmQVdJd1Q3RkF3ZGNBSXJ2RmNCeXl0ZEtkZ1RYMVp2?=
 =?utf-8?B?ZGZxZW9DUXIrTDJOcHNmS0d5cjdzNkN1RmxER2ZzVkJFNHpsbkFuNXJobTFl?=
 =?utf-8?B?SG0xUEJNaDdNd29HNmpPKzhTRXBPL0lNc2RaczNJWWdyRE1ITUhMdENJcXVv?=
 =?utf-8?B?RnF2eGVDdk5pbkZaaVJKQ1NsY0pwdGZUMm9FeE9pZEcxS0dkdVE0L3ltYVVm?=
 =?utf-8?B?MUE3cHdhTEh6dDlVZ1VuSnhMUFg0emp2VjVka3JPcFZXTlNLeFBxRXo1aU1R?=
 =?utf-8?B?UUFXK1ozdGZyeVNhOExkZDQxdW9VdmZhUEpyTWVTejZRamFYdTRWZUJvN3dQ?=
 =?utf-8?B?WEtVVWYzTGhhbkpOa29za3FGcFdUeVRMaW15bGMxL1BRcTdXYldLV25CRUV1?=
 =?utf-8?B?b0JnaDlVVjlUT3ZSZ0lmRFlaMjMxTGR4MTVKUVdwZ0Vkc0p1bTdwa3oxNmh6?=
 =?utf-8?B?S0VjMUtONmRZbnhHN1EyUEpXRVppRDdmYmJCYUJzdmhRZEhVL0hWK1AzNHp4?=
 =?utf-8?B?Q1h0dTJZS0UrK2t2TWMreVhESE9wYU5Uc3dRZXhJOXZ5QmRPY1BySjBtTVM5?=
 =?utf-8?B?OHpVL2FNUCswcEhocU8yV3E5MWtTcWtUU0ZwQkk3cWFNSWRYSVZLd3NYTzA0?=
 =?utf-8?B?MDF1Q2RGZnF2allFd1FlckptRlpaSXZ4U2hJbCt1MHRPZ3VkWGs4cTFLRWxa?=
 =?utf-8?B?amNZVmQ4NUQ0Z0UxZzEzbHVxRnJtZmhocU53QlpvWWlaKzBnaEEwSnFGQ2dU?=
 =?utf-8?B?V0E2NFZOeEJEWEVqbzhhR1FyWDh5NkpCZDJHK2N0Q05WQXNET0N4TC9Mckpq?=
 =?utf-8?B?U3VJWkZpeVhzN3FmV2hFOXFGU1U0Nkt0NEdJMTRrNUMzUlhWb2pyR2g3azRO?=
 =?utf-8?B?aHc9PQ==?=
Content-ID: <B83CE1F67DB4B2488490B51B22C3E9CE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f68302f-bc2c-422e-2067-08dd6c6fde3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 14:09:48.2097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n4Ea/ZE9fIcqm18SAZYgitmYg0uCNr0lvB3QPamzWfUo9qqDDpUfTbXbtJhh5SBSLwTzEtsFjlac/iF2JdDHJGE6Fbrl0vXF7vsL/bjNTRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dETz3I0QAOWNQklXSX1M3k5zy1O+jsCzq9MWpMtCtk=;
 b=GNrQw35sJYS5hoVuTXu4l+UpoXb0RqOa1Wl+Zo+iouggXD0p3zzwoQFM05DyXEm/jdtEJb0omcezuVD8OaE0cEosIncgwnonDx3IfI787KbwbobhWDPWA0Tb+UIrJH64eciXNFg5rvDX/33+ULna0gklcpo100toIsQgV545yVMg/9EBpMBEXa1OkPeVx9WAISQi5NksEP2zyJbJStndBNjvS9iV2RgqbkcGOea/ppBQnVYzUn2+cyin1zwZjJ9gEZefi3jYOI+XPAYMx6dl3xH69uGuVDN5G02jKS+LRnJyAx3PkYcITio1yt8DgsQ8koe9AFJ7ZcMHbQk2LdIhzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=GNrQw35s
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: [Buildroot] [help] v4l2loopback package build fails for raspberrypi5
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayabbasha.Sayed@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi there,

I am using latest source on master branch.

I am trying to build the v4l2loopback package after enabling the config 
BR2_PACKAGE_V4L2LOOPBACK_UTILS in menuconfig

    make O=raspberrypi5 raspberrypi5_defconfig

    make O=raspberrypi5 v4l2loopback

When installing to target, I see the following error:

    >>> v4l2loopback 0.13.2 Installing to target
    /usr/bin/install -D -m 0755
    /home/nayab/buildroot/raspberrypi5/build/v4l2loopback-0.13.2/utils/v4l2loopback-ctl
    /home/nayab/buildroot/raspberrypi5/target/usr/bin/v4l2loopback-ctl
    /usr/bin/install: cannot stat
    '/home/nayab/buildroot/raspberrypi5/build/v4l2loopback-0.13.2/utils/v4l2loopback-ctl':
    No such file or directory
    make[1]: *** [package/pkg-generic.mk:364:
    /home/nayab/buildroot/raspberrypi5/build/v4l2loopback-0.13.2/.stamp_target_installed]
    Error 1
    make: *** [Makefile:83: _all] Error 2

In 2025.02-LTS also, I see this behavior. Buildroot is unable to 
generate the file `v4l2loopback-ctl` in the 
build/v4l2loopback-0.13.2/utils/ directory.

But when I go the package build directory and execute `make`, I could 
see the file is generating.

Could somebody help fixing this issue?

Thanks,
Nayab

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
