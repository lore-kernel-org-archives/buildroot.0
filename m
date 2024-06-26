Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A081EC27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 06:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 235934040D;
	Wed, 26 Jun 2024 06:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGbvVgkhX0lR; Wed, 26 Jun 2024 06:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC3D4409E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC3D4409E0;
	Wed, 26 Jun 2024 06:56:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D347B1BF309
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 06:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0BC980F3B
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 06:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMU2prjohWV1 for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 06:56:38 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 26 Jun 2024 06:56:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3EAD980F37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EAD980F37
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=90054ded3=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EAD980F37
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 06:56:38 +0000 (UTC)
X-CSE-ConnectionGUID: Vd5Ud5s8QC6OzImepzrEhA==
X-CSE-MsgGUID: kU+nBz8oTcyQ3tAcB+Nkxg==
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="29146187"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jun 2024 23:49:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 25 Jun 2024 23:49:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 25 Jun 2024 23:49:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAeJHXeyIxQV+U9tnWsLNtb0B0m/U2dfo1jSdwYwFNLMEMXl2EwHLDqSyUKboK9G5BP59d0Snzq4MsSgWQ+KL8iyBSccy1p78j1c2ev2JxkKYQaJmQOg7FWWsZOMyUx6wWp37NP+naM23aF7o1M+uKJFwDs0lGfTiK2eValJKDKBY5VMINB3OJ/L2cg1MdFIEZcutQ5yhHGo132VkQZVh3SdHMsIhoWqmHXOT1bqB9+2bvwf7JdwsL3wU5cXk3sg/WmU5sHz6Oaxh9ookx3Zmk9uf6YjWEG5RzrwRQxMZnF0WST82tW5HJRhtfMImsXFBIPi0BDC/u5+O/NB81s61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/TGtmGYqjQ4jG8nY980+pIbyv9L2W10uSMg5f0iv+A=;
 b=cuXWh7DIkIyWCVnXrkhpE8hnmT+aMPI6ScbF/RWPkEf9HIPhw2F1B1un4QRdbTn9UWs+WarMfJsPaGcWuEmRxJjTTWf/nwigRTf3ASs7BnHaRu7+4Pk3XJnvePD/5rUB0fkRIsQcLW3JSAXXYiMbMrKjs4RG/xJ9GWTKDL15RXNoEwqMY15fz96beykA2bdCv8M6Tp0c13pDmp382tiCFf+74ra9xsYHMeYyGCiDBxjtVZD/cMSwf5RDuWJnmSagi6QS02M61QSfFjPbmfPlsxgaH6tjBebCNvav4Sva590sbz8Fsf5Zd4iipOxK3Oy7Fz7i5nQlvIPYFTjqDdtFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Wed, 26 Jun 2024 06:49:00 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 06:49:00 +0000
To: <buildroot@buildroot.org>
Thread-Topic: [Help] Compiling egt app with Buildroot SDK fails due to
 hardcoded path
Thread-Index: AQHax5TsfXqoKysmwEOy5Z3hE0dmQg==
Date: Wed, 26 Jun 2024 06:48:59 +0000
Message-ID: <27b193e2-8ca6-4500-a690-bc30503159d9@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DM4PR11MB8177:EE_
x-ms-office365-filtering-correlation-id: 94c464bc-24d2-40e8-e9de-08dc95ac0f09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230038|366014|376012|1800799022|38070700016;
x-microsoft-antispam-message-info: =?utf-8?B?QjJCWFY1bmJXN08wOXBmUlhWR0x6aDlsSWxYUUI1a3ZVYVZJcWxvTk1TR3pN?=
 =?utf-8?B?cUJLVE1FOG5oWGNWOTJ1VkJkQkdFNmJtamQ4ZS9aVENmNjdXT2RLNDBlUU5a?=
 =?utf-8?B?czdIQUxSdmV6WkNxM1o3ZUtYd3VUQVFmOFBBYzlFWkhUTFpFU3NQQzVOckZC?=
 =?utf-8?B?aUo5RFE5L1d0WDY2QVZQTmEvSjJrZnpOWTVFdVpaaU5Ea3VqWnhmUHZ4VTU3?=
 =?utf-8?B?cXVGUVBIc0JvS0JzOFAzRm9NMVJEK0JMTEVrc2pjUEU4Y0ZkazcxNEdOWmNp?=
 =?utf-8?B?bFJpYmRtVGM3aHNrWVlTWWZlOWRhQWxIQTRXcDJYQ1RkK09EcmlQMjV6eWlN?=
 =?utf-8?B?d3RtNzNxazBLa3RCVW5NMnFvR3hsYTRncmI2K2NxYVg5QUNrczhxdGwxY1F6?=
 =?utf-8?B?UkQ0TXpTRHM5cVFQbmtpWmtOMjNOUFpRRzdlVnM2cnhqUW5rM3BmcmtpUDZx?=
 =?utf-8?B?MmtuYzY2R2RpVVJyNHI4N0VQN3lvYzE4a3Y4TUl5QUtaRTRBc0VGRzhPYkE3?=
 =?utf-8?B?enMxRytJVmp6aGQ5ck5JaFdMVlMvMEltYkI4R01wZEhrRWVLWUdsYXA1R1JO?=
 =?utf-8?B?eVY2bkc3M3crbkExaEdxVDljeVBNU1l0K0NtbWtRb2dZRzBtMlRyS1ZUdUdq?=
 =?utf-8?B?bko3QVVyMTE4SkhCckhTMDFPNkJvc04ya1VOTTVRMnhQeHRseFhsNzRLYk9E?=
 =?utf-8?B?T0NQeFdRNUM3eGVUd0p4L3loYkFkamJWL1dsa1FIUTQyYVpPYVRDN2xjcEt3?=
 =?utf-8?B?S1RxbTNhZmY0eDh5VHVrWHY4dk40Z2QvM0dxY001YS8vQzFFSmZmaTVGU25T?=
 =?utf-8?B?MXBnd1k4U2ppTUlzdGRWc2craVNJN0kyUkRKNzlNQmNoakNGRWtyVkhYNnFh?=
 =?utf-8?B?Zll6blRGYnNLK3ZQNXIvQ3lZK0s4VFFjS0pWREt6S0xSR0dKbGQzcDRpK0l1?=
 =?utf-8?B?eG0rVUE1NkJVUUlacGQrUndKM2NNclgrYjdiOEw2SzlPMEk4QUhjVWdCei9j?=
 =?utf-8?B?SXZpdG9oY0pXUG1WSHpQdy95S1ovMVZpWU5BbW54MDhsWmZrQ3lRVTFEdFdj?=
 =?utf-8?B?WDd2WW1rRWttbEdvRndOa0plVk9Nc1hkRXZQNEF1Qnd4bkdWbjhFajI0WkVq?=
 =?utf-8?B?L1hjK2s3Vi94UkdwVXVZUVVZOWQ1WXlQdHhHbmh3S2RSWWhJV2pRcEdSNGhr?=
 =?utf-8?B?VlJjYlZFUURkWlhjeGpjNzU0QU02Tjk0Lzh0RzB0UDUzMW44ajdiWGg2UUtz?=
 =?utf-8?B?QXhXUXlMNCtsWHR1YlFyam9pRS9nWUlUclpCQ1RmZ2xMZDBlSmJDMWNNVUZu?=
 =?utf-8?B?SGtxSW11R0FhV0FmZW50UGNSbFZZRW5IaWMrRmUyWDlNSUF4UGxKa0xZTGdz?=
 =?utf-8?B?dUU0S1ZJMU42ZFZ0L1F0aUNsaUtkcDlqbmJHV0RKOG5NTnBxMVNxRWVldUVY?=
 =?utf-8?B?TktobVkrV0ROUDBYSXJDUDFwWnBaa2JWYzNsZVJJOXQ0M2QzZ3hSMGtVc3o2?=
 =?utf-8?B?Vm1DTCtKa0JxSGl6dll6SStXSmdOdlBhb2hCazN1NllWT1UvWnMxV2RIWUhp?=
 =?utf-8?B?WnMyakVnYXlENC92T3czZzhFT3EveGhMaHRrV2VqbmlBU1NTcHM1ak5VNVlq?=
 =?utf-8?B?cTE4czlHSSt4M21KWGJxZ1JqL3Rld0ZrUEZhWjNJcVlCL3FXSi9UUDZqaSto?=
 =?utf-8?B?ZTlVVmFTM28yTk92T2VEWkVCQXI5a2drcmxyTENMOFh5NkNDVlgrWjRBakJP?=
 =?utf-8?Q?EZsFcGt2Jvkf3A4pU5sE7bnDRfBKzH0sYi0clXT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmlhMVNBNlkwMWlQWEdXdVc4b0x1V1AvREdsVUpVN04yTUpXdCt1OHhhVnVX?=
 =?utf-8?B?MlFiVmUyUnRtMHNySW83QTFtNzZ5YjRmM0R2aUgzOHVWclpLbnBvN0RJejBZ?=
 =?utf-8?B?cmRVUUFBTzNpN0NCN3lJRUhLaE5sUjJORnFUaTJzRElCazA5bzhWK1grUGFX?=
 =?utf-8?B?Qk0yM1RTVUJqdmVBWkwrcFYyRU5hLzczK1RBMVlxc2tDRVhZYStwbDUxS3gy?=
 =?utf-8?B?VWFvYlBERkZMNncrVWhzSkR2WmlKVTVGdXA2NHJobWFxRkFtNHpwYnZHMkVT?=
 =?utf-8?B?am40aDZWTS8rYWhCajcyU3RkTmVWbE5ybkg5czU3YzFCVU52MHMwVk5BSEN0?=
 =?utf-8?B?a3NjRC93MkdnWDJGc2ZMWnBsZEdyNGlOdjZkajhQUjJDdS9aTW5LUVFZcm0y?=
 =?utf-8?B?ZzhnR2ExN2JXMU5QL1l4VXZ4dWVtblJ1TjBWaEtTTHpndXdzWHFTUTRxaTU2?=
 =?utf-8?B?YUp1WmhPWjYyTFY0OXBxamdQREV0QnZuYnJXWGtJSUV5THhSS2pTczJyVThC?=
 =?utf-8?B?Q1pHRXl2M2lxV1IwWVdXRWNPMTNnQjZUU3RyQmNCeFA4RnNCYThDU2VGODlh?=
 =?utf-8?B?aTh6KzFSd0tEZnpva3lPQ0wvNTYrVnhwM3padytYRHZqZ3RKSENESTAyUyth?=
 =?utf-8?B?bGRHSnlnR1FBbEtnNTNtWnA1V2hLZldzdUZUdkhjWVZKZmRrRmROY2RDYTB6?=
 =?utf-8?B?VkduT0tOMGRneitNNHVicTJPY2FBQkRRWkxUajlETXNrbG94RmdBTENHQXo5?=
 =?utf-8?B?bjcrRkZMYnBzUHRNckMrd0NKQXc3N29HUzJPbzBzWUxsQzJoYmNNN3JoMktB?=
 =?utf-8?B?a0JVaDRxRjFGbXBGQ01MdzZlWkxGZWtJUXRhNGdPNk11Vk5xOU5qVzVwQ0xZ?=
 =?utf-8?B?UUpablNYSW82aGlRRXRJNGpreWs0UjVhYkkxZW5yZDZLY3dKdWh3UFJWdDJE?=
 =?utf-8?B?SlV4Y0w0NEJ5VVd6bk0wWStVZ2pCUk0vYm0rbk03dmZBOVFGbkppNU1PTDFI?=
 =?utf-8?B?NmgyeXJYbk1ETDM3NGVzb2FOTDRLT29uSEFiUDlXR3hEczk2QlVMRDB5Zzl2?=
 =?utf-8?B?K2tCOUhxNXlsVVBoSDdQREl2b1dWK0lNbTBrREJuWTcraFFnSlR2SUFYaENp?=
 =?utf-8?B?UGdhdEZWMDI4dVRMdXZ2MWo3dE1YZkw4SFh4WWdSVkw1WTM5bmZZU1M3NHpX?=
 =?utf-8?B?WmoyejVpWlZReTRWdE5IV0xCMlE0SHNKMWo5SXZ4MnZ1a2g5VmhQeGE5UjhW?=
 =?utf-8?B?U1dGQWF4RHowc1dEelZaL0MrRUdOYWdIS3llcS9ydmlvd0xGckpPTTVESXFw?=
 =?utf-8?B?U2JzKzRRQ3BPS1R0dTcrVHZDVm5WREQ4N1U5WFAxRTlQL3NzcERRNVhzQ3Na?=
 =?utf-8?B?K3VGZDZXb0RXclF6WWM0RGIwTG5tSzdsNk9Ia0p5SU5DNmxRZ2lWL0M3NFFL?=
 =?utf-8?B?VlhuSTllL1drSUhsVFJoc0tUNGJyTitBaVB4TnA3MFRocVp3OEtKMm5yb0J6?=
 =?utf-8?B?c0ZGTWZlZkszNlJDbnIvR1ZmNmhHTlhaWDM3K244VERmcUdzK2lkbTQ5QU40?=
 =?utf-8?B?eXhXVnB5aUErRVdIQk1hRkc4TENyenZKZXRwZFVpdEdQcEt0ZGIyaDhLUjcz?=
 =?utf-8?B?N2o1Qk1tMUQ4dER2dlpJdU9OaGF0cjNBS2h4d052OUhLTG5Kb0U3NHFITDdw?=
 =?utf-8?B?K0hmUkZndTEzOHVwUWc4VWh5STZxbVNkZmwxUFhCQWM0ZHp4WnhoM1RSTUI0?=
 =?utf-8?B?Q3VkODRCUHp4VDZkTysxZXBLcHVxcmJBeHpzdk9sTENDMFhWclZuZFVzV0RU?=
 =?utf-8?B?QW5ucGdudnZEcjRmUXd5RHdVTmIxRFBmamJUdVpIZzdkRUw1YjF5SHVXSllH?=
 =?utf-8?B?RnR1MWZGSW1XSjMxMm5wQXJIOUFhNStZZXVKbllTZXJhV3lDQndubGFKVmQ3?=
 =?utf-8?B?WGJVSU1LYnBRcU0xNzF3enRzU3Ntd0l0UnV1WnZZcDhPeWN1b2o0K1NCU0h6?=
 =?utf-8?B?TWxseGNGQUZTNnJkZmRHWkJKSWN6aEtUd2p4YXhyaGlLdlJRb28xZkZCVHhL?=
 =?utf-8?B?SDRjRHJlbnNMQmJvWU5PeFhMYUVrNzF3VU1YUG1HUDZSc2s0MnBEbWkvSmJx?=
 =?utf-8?B?eC8vWnJmYkZHN0o1Z05SRGpmcVJtVEtubHJ0OTVWZWVES0h6UXp4MFFBRzZi?=
 =?utf-8?B?V2c9PQ==?=
Content-ID: <7DBDEC96F4C1B943858E2C87C0BF2C14@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c464bc-24d2-40e8-e9de-08dc95ac0f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 06:48:59.8862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uaLlaYcZneTK5xzANCHZ/Mko1bOz0OrEm6143LH9PdpDXTQtzno8L6kGsAIZ5BjTCOds77313VBidM7O9+t+ziHwetJGLjZw0FZEseG0+0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8177
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1719384998; x=1750920998;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=M/TGtmGYqjQ4jG8nY980+pIbyv9L2W10uSMg5f0iv+A=;
 b=1tqtMgxPk2CyvJ1v+UgtYuxB+DYOgZFZK/IKhF2JT1oUjcyBAuDlOj3X
 GN51yFjspTzrWJHnQIIld4cM8b5E3GgIyr8scxAHY0JnKX6r8tGuu7emK
 OY8tve0MVJBFO8rUa8c25G0avQjZRCQYZa+D1ynaDDQrX+KBk7PgrGIB2
 dhkJE/rIaZsj8JzBvf/WAnn59gxbfxFVd/YS5HWqbbrI7xtXySkNF2/Y0
 N62fsi7GHFTpMpSuVPkwn80TAKneB0IrQAiklIZiG7caMLhwLgW5WVJ8p
 fy2QLzuHLwNvfW3qnM89xFEeGEDpXtYLwnIQrvqavsakfhJnjX5WefviP
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/TGtmGYqjQ4jG8nY980+pIbyv9L2W10uSMg5f0iv+A=;
 b=J2igRoCjS7XOX1LMtt5kSMP0D1ERlk/Oe81k1a26ixum1P1CnSGozMOYJkYDXRADM8Vol2EOmHZFPJGNDF9vumRckYEpY9paZGQiwfBMXYVDKzKdMWYbuayR/hHYJ8OMde6yLEMpLOY+J6I6+RtEyhHeYndwkEglnd/3wUCa1mTxtnxMoD5wbusaxuraG2I4RfhyUSP5StdiriBQ/s7nDid93gBYXyQ1GMlIf9sglWnrhKY5u32/qCjO2TTYugnotwOF8x6Kh6ZBHWrRlPNaKnG2NzYoVh9BdQ0imUFb9t/GAmOwNt+vEbqcRMucDP5UvV+yCgGrk7kmF1QcgOUCpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=microchip.com
 header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=1tqtMgxP; 
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=J2igRoCj
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: [Buildroot] [Help] Compiling egt app with Buildroot SDK fails due
 to hardcoded path
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayabbasha.Sayed@microchip.com
Cc: Hari.PrasathGE@microchip.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLA0KDQpXZSBoYXZlIGNyZWF0ZWQgQnVpbGRyb290IFNESyBmb3Igb3VyIHRhcmdldCBi
b2FyZC4gV2UgdHJpZWQgdG8gY29tcGlsZSANCmFuIGV4dGVybmFsIGFwcGxpY2F0aW9uIGNhbGxl
ZCBgZWd0YCB3aXRoIHRoaXMgU0RLIGFuZCB0aGUgYnVpbGQgZmFpbHMgDQp3aXRoIHRoZSBmb2xs
b3dpbmcgZXJyb3I6DQoNCiAgICBDWFjCoMKgwqDCoMKgIGRldGFpbC9jaGFydHMvbGliZWd0X2xh
LXBscGxvdGltcGwubG8NCiAgICBDWFjCoMKgwqDCoMKgIGxpYmVndF9sYS12aXJ0dWFsa2V5Ym9h
cmQubG8NCiAgICBDWFhMRMKgwqDCoCBsaWJlZ3QubGENCiAgICBsaWJ0b29sOiB3YXJuaW5nOg0K
ICAgICcvd29yazIvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpX3Nkay1idWlsZHJvb3QvYmlu
Ly4uL2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaS9zeXNyb290L3Vzci9saWIvbGliY2Fpcm8t
Z29iamVjdC5sYScNCiAgICBzZWVtcyB0byBiZSBtb3ZlZA0KICAgIC91c3IvYmluL2dyZXA6DQog
ICAgL2hvbWUvamVua2lucy9hZ2VudC93b3Jrc3BhY2UvTVBVQ0kvU3lzdGVtL21wdS1jaS1MNFMt
QlIvbGludXg0c2FtL2J1aWxkL2J1aWxkcm9vdC9idWlsZHJvb3QtbWNocC9vdXRwdXQvYnVpbGQv
Y2Fpcm8tMS4xNy40L3NyYy9saWJjYWlyby5sYToNCiAgICBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5DQogICAgL3Vzci9iaW4vc2VkOiBjYW4ndCByZWFkDQogICAgL2hvbWUvamVua2lucy9hZ2Vu
dC93b3Jrc3BhY2UvTVBVQ0kvU3lzdGVtL21wdS1jaS1MNFMtQlIvbGludXg0c2FtL2J1aWxkL2J1
aWxkcm9vdC9idWlsZHJvb3QtbWNocC9vdXRwdXQvYnVpbGQvY2Fpcm8tMS4xNy40L3NyYy9saWJj
YWlyby5sYToNCiAgICBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQogICAgbGlidG9vbDrCoMKg
IGVycm9yOg0KICAgICcvaG9tZS9qZW5raW5zL2FnZW50L3dvcmtzcGFjZS9NUFVDSS9TeXN0ZW0v
bXB1LWNpLUw0Uy1CUi9saW51eDRzYW0vYnVpbGQvYnVpbGRyb290L2J1aWxkcm9vdC1tY2hwL291
dHB1dC9idWlsZC9jYWlyby0xLjE3LjQvc3JjL2xpYmNhaXJvLmxhJw0KICAgIGlzIG5vdCBhIHZh
bGlkIGxpYnRvb2wgYXJjaGl2ZQ0KICAgIG1ha2VbM106ICoqKiBbTWFrZWZpbGU6MjIyNjogbGli
ZWd0LmxhXSBFcnJvciAxDQogICAgbWFrZVszXTogTGVhdmluZyBkaXJlY3RvcnkgJy93b3JrMi9l
Z3Qvc3JjJw0KICAgIG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTk5MTogYWxsXSBFcnJvciAyDQog
ICAgbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy93b3JrMi9lZ3Qvc3JjJw0KICAgIG1ha2Vb
MV06ICoqKiBbTWFrZWZpbGU6MTQ1ODogYWxsLXJlY3Vyc2l2ZV0gRXJyb3IgMQ0KICAgIG1ha2Vb
MV06IExlYXZpbmcgZGlyZWN0b3J5ICcvd29yazIvZWd0Jw0KICAgIG1ha2U6ICoqKiBbTWFrZWZp
bGU6MTM1OTogYWxsXSBFcnJvciAyDQoNCkFzIEkgY2FuIHNlZSBmcm9tIHRoZSBhYm92ZSBsaW5l
cywgaXQncyB0cnlpbmcgdG8gZmluZCBsaWJjYWlyby5sYSBmcm9tIA0KdGhlIHBhdGggDQpgL2hv
bWUvamVua2lucy9hZ2VudC93b3Jrc3BhY2UvTVBVQ0kvU3lzdGVtL21wdS1jaS1MNFMtQlIvbGlu
dXg0c2FtL2J1aWxkL2J1aWxkcm9vdC9idWlsZHJvb3QtbWNocC9vdXRwdXQvYnVpbGQvY2Fpcm8t
MS4xNy40L3NyYy9saWJjYWlyby5sYWAgDQp3aGljaCBpcyBhY3R1YWxseSBmcm9tIHRoZSBkaWZm
ZXJlbnQgbWFjaGluZSBvbiB3aGljaCB0aGlzIFNESyBpcyBnZW5lcmF0ZWQuDQoNCklucHV0cyBv
biBob3cgdG8gcmVzb2x2ZSB0aGlzIGVycm9yIHdvdWxkIGJlIGFwcHJlY2lhdGVkLiBIZXJlIGFy
ZSB0aGUgDQphZGRpdGlvbmFsIGRldGFpbHM6DQoNCkJ1aWxkcm9vdCBTREs6IA0KaHR0cHM6Ly93
d3cubGludXg0c2FtLm9yZy9iaW4vdmlldy9MaW51eDRTQU0vU29mdHdhcmVUb29scyNCdWlsZHJv
b3RfU0RLIA0KKEkgYW0gdHJ5aW5nIG90IGNyb3NzLWNvbXBpbGUgd2l0aCANCmh0dHBzOi8vZmls
ZXMubGludXg0c2FtLm9yZy9wdWIvZGVtby9ici1zZGsvbGludXg0c2FtLWJ1aWxkcm9vdC1zYW05
eDYwZWstZ3JhcGhpY3Mtc2RrLTIwMjQuMDQudGFyLmd6KQ0KDQpCdWlsZHJvb3QgcmVwbzogaHR0
cHM6Ly9naXRodWIuY29tL2xpbnV4NG1pY3JvY2hpcC9idWlsZHJvb3QtbWNocC8NCg0KRXh0ZXJu
YWwgYnVpbGRyb290IHRyZWU6IA0KaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4NG1pY3JvY2hpcC9i
dWlsZHJvb3QtZXh0ZXJuYWwtbWljcm9jaGlwDQoNClRoZSBjb25maWcgZmlsZSBmcm9tIHdoaWNo
IFNESyBpcyBnZW5lcmF0ZWQ6IA0Kc2FtOXg2MF9jdXJpb3NpdHlfZ3JhcGhpY3NfZGVmY29uZmln
IChJc3N1ZSBpcyB0aGVyZSB3aXRoIGFueSBvZiB0aGUgDQoqZ3JhcGhpY3NfZGVmY29uZmlnIHBy
ZXNlbnRlZCBhdCANCmh0dHBzOi8vZ2l0aHViLmNvbS9saW51eDRtaWNyb2NoaXAvYnVpbGRyb290
LWV4dGVybmFsLW1pY3JvY2hpcC90cmVlL21hc3Rlci9jb25maWdzKQ0KDQpBcHAgdHJ5aW5nIHRv
IGNyb3NzLWNvbXBpbGU6IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eDRzYW0vZWd0DQoNClRoZSBz
dGVwcyBJIGZvbGxvd2VkIHRvIGNyb3NzLWNvbXBpbGUgZWd0IG9uY2UgSSBkb3dubG9hZGVkIHRo
ZSBTREsgZnJvbSANCmFib3ZlIHNvdXJjZToNCg0KICAgIHRhciB4dmYNCiAgICBsaW51eDRzYW0t
YnVpbGRyb290LXNhbTl4NjBfY3VyaW9zaXR5LWdyYXBoaWNzLXNkay0yMDI0LjA0LnRhci5neg0K
DQogICAgY2QgYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpX3Nkay1idWlsZHJvb3QvDQoNCiAg
ICAuL3JlbG9jYXRlLXNkay5zaA0KDQogICAgc291cmNlIGVudmlyb25tZW50LXNldHVwDQoNCiAg
ICBjZCAuLg0KDQogICAgZ2l0IGNsb25lIC0tcmVjdXJzaXZlIGh0dHBzOi8vZ2l0aHViLmNvbS9s
aW51eDRzYW0vZWd0LmdpdA0KDQogICAgY2QgZWd0DQoNCiAgICAuL2F1dG9nZW4uc2gNCg0KICAg
IC4vY29uZmlndXJlIC0taG9zdD0iYXJtIg0KDQogICAgbWFrZQ0KDQpBbnkgaW5wdXRzIG9uIGhv
dyB0byByZXNvbHZlIHRoZSBhYm92ZSBtZW50aW9uZWQgZXJyb3IgYXJlIGFwcHJlY2lhdGVkLg0K
DQotLSANClRoYW5rcywNCk5heWFiDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
