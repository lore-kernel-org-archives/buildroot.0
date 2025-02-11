Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E089EC0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 16:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA0F781421;
	Tue, 11 Feb 2025 16:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqRsx-XGUT6J; Tue, 11 Feb 2025 16:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8488781EAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8488781EAB;
	Tue, 11 Feb 2025 16:43:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DA806C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D6004059A
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Szn3TCqLmoTO for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 16:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::601;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2F714059B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2F714059B
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2F714059B
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 16:42:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAsvaeWIpPzGuhOezq5ioU00Ny1LVJgHNDnXZL7O0NNc1QxKUxrqIYgqBTAIGMqJfoichQTrpGd4kHJrpKOUCyypb5Uh2N5/vH3TZ2v7AJKvjYW4O1DO3gekNpbmcOc40m3Ea/QuiqT5jw6C8bJMVqzDtqpHrt9aHQCxlLtAJMnszgMBfxjZpbjyMYmq+SMIn4rJaXsX3oePnGXC1SJ1M3SIijf7v62tDiO6SAcQeTzRMes0NfXEzpmi2Zrk92YudKB9dfq5SghftjjtG9IsluAZ/F0o1oH86HT7ojD80qv20idDAlo0WakFzUhGdqVVYvdyIwd8m3q9KDfUUY31YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHR01y5ionClyhExPy5/4V8KlPO7Ihb4jXUR04bxAc4=;
 b=bKUTHOCOGvybaIH34dKjhr2AqISiz6qq1dzf6vOSddCCe2k/mPWgnPgaADfKGy/JQxsT1/v6mobW7wFt7F820r42y1bgr73FInu0qMkHWqu2tOQF4Fg4KAsNwOs+DAaesDYqJN6Ih4T2bnQVBArxGfm7wIM2qt+dbe+MNRL8NTEutHsU4+hmy7/NBMZ0ts3QJgNJkia8adbOIZV5P4PYntXJpSaQiwpbTpD4RDmHZfNvXdGkUfzNLe5wT6JFwp9yQ4AaCFM5CJX4Q7K/si/jm6Y3rrjsnaC2wAzB1guls2nXKvPIRDUsY8R35cqzTzhnbFvTn1R8ObkeFWQi+avC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Tue, 11 Feb 2025 16:42:54 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 16:42:54 +0000
To: <buildroot@buildroot.org>, <romain.naour@smile.fr>
CC: <Nicolas.Ferre@microchip.com>, <Ludovic.Desroches@microchip.com>,
 <Conor.Dooley@microchip.com>, <thomas.petazzoni@bootlin.com>,
 <Valentina.FernandezAlanis@microchip.com>
Thread-Topic: [Buildroot] [PATCH v2 1/3] board/beagleboard/beaglev_fire: fix
 update gateware feature
Thread-Index: AQHba+M2Zpg/G+hEOEOt677pKR/czLNCa9aAgAAFUYA=
Date: Tue, 11 Feb 2025 16:42:54 +0000
Message-ID: <0ee87d99c89c4ce272fc949ada14dbf96a8d8aad.camel@microchip.com>
References: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
 <20250121090513.3375533-2-jamie.gibbons@microchip.com>
 <ae9ec0e5-a561-4a26-a657-32d93b282b8f@smile.fr>
In-Reply-To: <ae9ec0e5-a561-4a26-a657-32d93b282b8f@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|CY8PR11MB7825:EE_
x-ms-office365-filtering-correlation-id: 31a5e2b0-bf12-4fb6-d9bb-08dd4abb21d7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WXFIUUVHYVhORUN4anp4N2F5ZUZZMmV0Vm5mTlhHbC9YemdTVUZ4eDZ6MzVY?=
 =?utf-8?B?SHVLKzFaU1BuRGZSeHhDMTdGNU5BTEJDdG5pMUFDSmJwVWFUQ0UwQnhKeWpt?=
 =?utf-8?B?RDkyMWJPSFdoYzVIeEtUZ3NRQjE5MFlBaGhqZWFiR3hTZHdNaWFobWpKMEhu?=
 =?utf-8?B?ZWtkekM0Vzk3eURMOHFUNFpUN3p1YUdHb1hYRG52bGk0emU1RnY5V3M0a1Qy?=
 =?utf-8?B?S0FEcitmeE9RK0VLQmJrQzh4SmpoVGtaVmFmVXJSbTdiZDgzRUhEbTMrS01o?=
 =?utf-8?B?bWphZGFlRjk3ZVVxSUk3RVAyVmsyVHA3N3MrQTBiUlRPMGtwcC9HOGg1Rm9w?=
 =?utf-8?B?NFV3SG1sblBJQ3MwbmFDeHpVQ2E0dlpPYmh6V3NzcnEvTlJqeWFFcXpEZXRu?=
 =?utf-8?B?V0x5bXpmMWplek1mK0RYcmp6ZlE5N0pZTTFld0FwaUVDUUMwZjdsalp0UE9T?=
 =?utf-8?B?UUcvWExBNTlVYm9pekljRkVkL2phMGRDL21yYWdXQ1N2ajF5aFUvU1VlSTQx?=
 =?utf-8?B?R1pKMjdQMUl4VEllaEhodlA3OXloTHhRSE1QMkpIYngxWFYvY2h4QVVEOWVF?=
 =?utf-8?B?bDE4RjV1MGY2RkFpZHRVYXhYalNyLzMzUFhpRHZjSjhyMGJaRnkwWVEzUEVo?=
 =?utf-8?B?bFZWTjRxdk1Wa2JmRllwRGo2NG0rbWVnY3NhZFdvV3FSTUZHK0tHVmlyN2tr?=
 =?utf-8?B?TG1yTlArT1RHczNlR2tsVHhDRTRvUjFHR2xVdW1jaWF4dWgxWE9aVGlOWEJV?=
 =?utf-8?B?OU93cXkvbXRCQzdqYzZWVnRobUJnODBSTU93QUZFekp0Wm1WWEhwRytzcHUz?=
 =?utf-8?B?NG91b3pMTjZqaWlmSXhvSkgyZ2Z5dFVaeEZXRWFPdUlzZGRNazBFZTFhMEtQ?=
 =?utf-8?B?M0R4THArSFdOV3pFbDVoclgvQ0pmQmlSYnJEcTRHaUVKd2NuQThLMnY5TWxT?=
 =?utf-8?B?TXVPSlkwUG85L3lsb0VYc05aM3NkNUVFVjVzdyt1aHpyS2hjdjFTWkpnV2lK?=
 =?utf-8?B?dDFzVVE3QmcvOVY5UzN3UTNkVGg3MjBUYzFzTnJFQnVSSjlzcVIxZnhFdGhP?=
 =?utf-8?B?aERlWVhNT1FXaGVlQ3ZPLyt4N2F4OGpGZnFsZFpOY1B3ZUhRVXlmbUphSys4?=
 =?utf-8?B?ZmtrSTVzdUI4RDlOZ0daNDFEanQxc09KUnBrL09lSW9uMlZDVzV3MThzUlQ2?=
 =?utf-8?B?bFYrQ01ZUnJjMDA1eEVzNnJ6eGxqRk93Qko0TTlGWWFIWnFXT2NHTld6Y05B?=
 =?utf-8?B?eEF6OHIrUGU2VE9FYkFMZmdPcVdTUENFamw5Yk53MGo0a3I4bllWK2dDNUdr?=
 =?utf-8?B?R29GaXgycWo2bklzQWhpcGZoODFXSjREVThNcWVLSWI2TnFSTGRPZWZtOEZJ?=
 =?utf-8?B?Q0dsck9sQmFzVXAxNTJvdnEvMzF4MVB3OGN5aC93ZFo4R3RtSTZ6TmQzY2NV?=
 =?utf-8?B?NElDSk9CclFsTkdBTjBwTDZqK2UvWENRVVUyTlc5dkNzQ0lzc2o2U2FVODhn?=
 =?utf-8?B?bDRiMFhUeVZWdjh2ci9UdFI4TVVRYWNMSGVOeTZNQWE3R1g0dFJMREU0azdJ?=
 =?utf-8?B?M2Z1WFZybWhQUVlFQVFtTU9rTk4vdVJqMXAyb2NVbHU1czk3amE5M0ZSVlAz?=
 =?utf-8?B?ZXBPdFNMbUJsZEFnQlJKK0ttMFNEVHRYcTNXMjQzVnRsL0ptNG9XTlc0a1hZ?=
 =?utf-8?B?TTgwUW10VGVuUjdXTmFIeTJ5ZnA3NVBvK1R1akVFelRSbnZ2eTZuTEgrUEFn?=
 =?utf-8?B?ZEg5bmtBU1dYNmcxYmkzUUxVb0JyZ1hjMTNiZWJpWnY1bXc3SUJOZEhHLzIw?=
 =?utf-8?B?RFYyOVVXeVdFWWJSb0grRStOY09VT01jOGw2MFJsc0c5dmxoK1kyMkJmcDdB?=
 =?utf-8?B?NGtpam5RQVhqM3BJOGdYdnFYalJPcHZPUTEyWTg5V3phL0pRYWQ0bkdhc1Vs?=
 =?utf-8?Q?XVKOfaaICAzYEYzOTMDL0yIhc6/2dTmd?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkdNbzZZaXZMenFRWWNjTUNXWlRxTDZPd0UwWXBUamFRb0o4LzZuTHBzZWtk?=
 =?utf-8?B?eGo0eUFpSnNyemp4Z1g0amR4aDdIOHVzTGw0WVhxRVBkRHFFQ0FFeU1zemZu?=
 =?utf-8?B?Ukc0ZmZVbVZQcUh4KzhERHRubWExdnZQVGJtZVd1cW1mckVOOERJb0hCeTNy?=
 =?utf-8?B?aWR2ZkhRVWQzamUxNWNDSGNid1dBRm5aNzV0MEkwRjRGTlNMdGlEaWlGLy9z?=
 =?utf-8?B?Y3kyTytCMllDYlhhUnFyM1FHdlpDeWtBSE5LL21nVU1MZDNHUnQ3UjdVazkr?=
 =?utf-8?B?aHNEZTJBbVNQcHZqQUg3UFNZVkZzRkRmMVFrSW9sVnFRQ0o0MHdXK0grVWt0?=
 =?utf-8?B?a3cvRUYvQUJ0aXl0VE9NTGV1aXJtckpBcjdHeWJsZFFTVjZHUm1IUm54c0RI?=
 =?utf-8?B?T2UzOHFDUVUybHRiNFVSWEpJWklVTWZuZkFicTVxWGNmWFBVeHplcllMMW5o?=
 =?utf-8?B?YUU3c0Q3NnlXR3VPMDVHc3Z2TTNncmlmWk5DZ083alZ5ZlB0YXI0RzBHVUs5?=
 =?utf-8?B?V25KMldCMFNtUzFXTWZtTVYybzUydmZiY1lQMzlNa3pJYjhpWmJJMTZ2SDVT?=
 =?utf-8?B?aHBQb3g2dXlLZEY5VGRGSTZzUFJLU212WU1nRUJXVE5IMlhCZ09SVjJUSWlp?=
 =?utf-8?B?Nzd5blZ0aXdLbTgxMThoSkdJbG14NnhQSnY3dVhJMTVENWJDVzMxWFZ6dUJz?=
 =?utf-8?B?NS9VOW9vWjQyZzM0TnpXQlFYcUY1WDRrMWNOT1dISnJ2MEhIUzQrc2JweC9q?=
 =?utf-8?B?NElBbnF5VkEydnh6L0VHeFBVZk9zUWxZd1VHUjRJd2NVR0RDWUt2MWhNRW1p?=
 =?utf-8?B?UnVGejZTYVR5aUw1Y2I0TW1lMVBOQTJlZEhjaGNLZDc1TEZmZS9YZ1IycmZs?=
 =?utf-8?B?YkhvR1BTSXFuYU01VEg3Ly82US9HVUNsbm5sTjRFWlNWN1ZrN1R6R0hsNVNT?=
 =?utf-8?B?cXhEeDBrV2VjT1ZyRHNBc3dWcUFFWjQyaHFVUldMT1A1NHZYRnNoYktXK2V2?=
 =?utf-8?B?ZTFJQWZTU2FFRnd0UDh1bUEyN0k5djdhbEJzNUtUcmF1SVBnRGxRTER4ZUw0?=
 =?utf-8?B?R2d3eWpja1VyWEFjWVBqbk5iRm9FellHWU9mWHlIKzAwMjRBc1hKV0M2ZEFp?=
 =?utf-8?B?T0gwKzROaE1Ddm9qODlKRWF5ZGhXOTZZS1ZJTDVBeVU4RXJtM1ZZcU1wVzZs?=
 =?utf-8?B?UEUvM1dJak5POGRnWEpaUTdPZDlrRUVwSkZIbkVLdUx3T3BHTlVua0RqSVpP?=
 =?utf-8?B?SGZSZWdENnhHSnRyNDNLN2hkd1o5N1pzcVRoeS9JaHd4V2dDRUhHQWJTcm9T?=
 =?utf-8?B?ak1ubS8xOHNxaWliMFlxbjd1VG9WeC8wQ3VRY0VJRTRucUJXdVVPb2tFNW5i?=
 =?utf-8?B?RExOQ3ZJbnNkL3orSEhZUjRmTWYySW5WUnRlNzRDdUJkeWhvQUpPUk4vR2VV?=
 =?utf-8?B?c2NXTEN2S3o0TktmVlJwakZQRStXV2g1MHBSZW1rSy83SC9sWGJ5UzBzVHN6?=
 =?utf-8?B?K1BBaHpGdmV3US9zUVVlTWkvSW1XWFMvdmc2NHVwR1c2Mlo2WllhelB1SmVn?=
 =?utf-8?B?NEF1OUprUWRJNHpOVDlPTHhHbEhCU09ubzZIaEFCTGRNN1oxZTNxZVVONzBV?=
 =?utf-8?B?ZWFjaWZqNTNwWkE2L2c2c0ZJTHNrcHB6SjBDdm1pQ1IvTzQwdUw1MVZTMFdh?=
 =?utf-8?B?ZU52ZWwvYlM4T0FOeUJHRGhpbmtzTDVUc1hmUUpKNENReC9VUGg0Snc2YlVO?=
 =?utf-8?B?UUZYdnJSY240QUdaWm5xMU41ekl4YWE3RnJoTiszYlFQWkJBZVNUWFB2cmgy?=
 =?utf-8?B?c29pQi9qUGtOdUJRSDZmbmZ1TGJjN3Z3TjZiYitmdGVEd1pQZXR0em1OMnMx?=
 =?utf-8?B?aEVGMjNKT1hmRTZxb3NFYXZ5VU9TeDE3cFpsMXl6bUpSMFAyRnJpSEtCZElH?=
 =?utf-8?B?d0pIM3ZvNlhQdDhjaHBsU0tKOVV6QjQrZ1R1RE1uQVJ0Rm5vV2pyaERRWGN6?=
 =?utf-8?B?anhZaWc0Z08vVkdzekg5SnpyK0QzOW94ZmFnRjBSa1IrbFp6WGtDb2Nvbk9X?=
 =?utf-8?B?OE1pNXZIMWdZc3daVkFwdXlUY0xYM1hFc0pIakZuazR6VEFmSmRXTUlkaE5X?=
 =?utf-8?B?MCtuUDQ1VHVQOEtOaHgxNDZ1eFRoZ0ZYcTVyUlEvQXUvaE8zQVRoK3cwNm04?=
 =?utf-8?B?OGc9PQ==?=
Content-ID: <06296CC5B0DC6E4FAC3ECCDFC8321B7C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a5e2b0-bf12-4fb6-d9bb-08dd4abb21d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 16:42:54.3268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xek5g6bVUMQbgyTkrys4P8N3FQ+yFJ+nr+9dI645daAyhFdCZ6xx4kPTdLwxeBFcGGoLPu5ku3WdX1kvcXkohtIikKxkEqQ5t9SvaNkKKUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHR01y5ionClyhExPy5/4V8KlPO7Ihb4jXUR04bxAc4=;
 b=DG6fe4Lw1aKz2IyGTznvLlgNujXmcXyHfLuVH/+oPkpZTklxLQYWRRSMyFDuOpH0m0+9kdKebPgG5k2bPo32+Ek39jZj5ovBrk4zdSPV2peCkzqsQ/Q6uxwLJsfG5Lvr1vaVgiuwANeNkZtU7LfHuyl+zZSnB497oNzHsKCgoWnuiBHqe0TgM8qYc6VF8kzRQ9LhPlyxANpgC934RhWEBAQ/5bGHsL52DvgB9ZEXiSTHlWiPpuisEwz3Wpa1pQkq4G23/m8MmlAB+X30QDNONDo9t9Lwmnu8dXNUTwnVMZV+AdUxAoQZPzN1syTsD+KOb+DSZbU8QJoyxhEoIWNdig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=DG6fe4Lw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH v2 1/3] board/beagleboard/beaglev_fire: fix
 update gateware feature
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
From: "Jamie.Gibbons--- via buildroot" <buildroot@buildroot.org>
Reply-To: Jamie.Gibbons@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLA0KDQpPbiBUdWUsIDIwMjUtMDItMTEgYXQgMTc6MjcgKzAxMDAsIFJvbWFpbiBO
YW91ciB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UNCj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0K
PiBIZWxsbyBKYW1pZSwgQWxsLA0KPiANCj4gU29ycnkgZm9yIHRoZSBkZWxheSB0byByZXZpZXcg
eW91ciBzZXJpZXMuDQoNClRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrISBBbGwgYWNrbm93bGVk
Z2VkIGFuZCB3aWxsIGdldCBiYWNrIHNob3J0bHkNCndpdGggYSB2My4NCg0KVGhhbmtzLA0KSmFt
aWUuDQo+IA0KPiBMZSAyMS8wMS8yMDI1IMOgIDEwOjA1LCBKYW1pZSBHaWJib25zIHZpYSBidWls
ZHJvb3QgYSDDqWNyaXQgOg0KPiA+IEZvbGxvd2luZyB0aGUgYWRkaXRpb24gb2YgdGhlIGZpcm13
YXJlIHVwbG9hZCBBUEkgaW4gbGludXggdjYuNiwNCj4gPiB1c2luZw0KPiA+IGRlYnVnZnMgZm9y
IGZpcm13YXJlIHVwZGF0aW5nIGhhcyBiZWVuIHJlbW92ZWQuIFVwZGF0ZSB0aGUNCj4gPiB1cGRh
dGUtZ2F0ZXdhcmUgc2NyaXB0IHRvIHVzZSB0aGUgZmlybXdhcmUgdXBsb2FkIEFQSSB3aXRoIHN5
c2ZzDQo+ID4gYW5kDQo+ID4gZW5hYmxlIGFwcGx5aW5nIHRoZSBvdmVybGF5cyBkdXJpbmcgYm9v
dC4NCj4gPiBUaGUgZndfdXBsb2FkIGludGVyZmFjZSBjYW4gZGV0ZWN0IHdoZW4gdGhlcmUgaXMg
YW4gb3ZlcmxheSBmaWxlDQo+ID4gYW5kDQo+ID4gd2lsbCB3cml0ZSBpdCBjb3JyZWN0bHkuIFVz
ZSB0aGlzIGZ1bmN0aW9uYWxpdHkgdG8gd3JpdGUgdGhlDQo+ID4gb3ZlcmxheQ0KPiA+IGZpbGUg
YW5kIHJlbW92ZSBkZCBjb21tYW5kIHJlbGF0ZWQgY29kZS4NCj4gDQo+IERvZXMgaXQgbWVhbnMg
dGhhdCB0aGUgdXBkYXRlLWdhdGV3YXJlLnNoIHNjcmlwdCBkb2Vzbid0IHdvcmsgc2luY2UNCj4g
dGhlIHVwZGF0ZQ0KPiB0byA2LjYga2VybmVsPw0KPiANCj4gSWYgc28sIHBsZWFzZSBhZGQgYSBG
aXhlcyB0YWc6DQo+IA0KPiDCoCBGaXhlczogOGNlOTdmZDU1MGQ2ICgiY29uZmlncy9iZWFnbGV2
X2ZpcmU6IGJ1bXAgTGludXggYW5kIFUtQm9vdCIpDQo+IA0KPiA+IA0KPiA+IFJldmlld2VkLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEphbWllIEdpYmJvbnMgPGphbWllLmdpYmJvbnNAbWljcm9jaGlwLmNvbT4NCj4gPiAt
LS0NCj4gPiDCoGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9ib290LmNtZMKgwqDCoMKg
wqDCoCB8wqAgMSArDQo+ID4gwqAuLi4vdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdh
cmUuc2jCoMKgwqAgfCA1MSArKysrKysrKysrKysrKy0NCj4gPiAtLS0tDQo+ID4gwqAyIGZpbGVz
IGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiA+IMKgbW9kZSBj
aGFuZ2UgMTAwNjQ0ID0+IDEwMDc1NQ0KPiA+IGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmly
ZS9yb290ZnMtDQo+ID4gb3ZlcmxheS91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRld2Fy
ZS5zaA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2Zp
cmUvYm9vdC5jbWQNCj4gPiBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9ib290LmNt
ZA0KPiA+IGluZGV4IDA1ZjQ4NThiYWMuLjE0MDI0NThkOGIgMTAwNjQ0DQo+ID4gLS0tIGEvYm9h
cmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL2Jvb3QuY21kDQo+ID4gKysrIGIvYm9hcmQvYmVh
Z2xlYm9hcmQvYmVhZ2xldl9maXJlL2Jvb3QuY21kDQo+ID4gQEAgLTEyLDQgKzEyLDUgQEAgYm9v
dG0gbG9hZG9zICR7c2NyaXB0YWRkcn07DQo+ID4gwqBib290bSByYW1kaXNrOw0KPiA+IMKgYm9v
dG0gcHJlcDsNCj4gPiDCoGZkdCBzZXQgL3NvYy9ldGhlcm5ldEAyMDExMDAwMCBtYWMtYWRkcmVz
cw0KPiA+ICR7YmVhZ2xldmZpcmVfbWFjX2FkZHIwfTsNCj4gPiArcnVuIGRlc2lnbl9vdmVybGF5
czsNCj4gDQo+IGRlc2lnbl9vdmVybGF5cyBzZWVtcyByZWxhdGVkIHRvIGRldmljZXRyZWUgb3Zl
cmxheSBzdXBwb3J0IGJ1dA0KPiBCUjJfTElOVVhfS0VSTkVMX0RUQl9PVkVSTEFZX1NVUFBPUlQg
aXMgb25seSBlbmFibGVkIGluIHRoZSBmb2xsb3dpbmcNCj4gcGF0Y2ggKDIvMykuDQo+IA0KPiA+
IMKgYm9vdG0gZ287DQo+ID4gZGlmZiAtLWdpdCBhL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZf
ZmlyZS9yb290ZnMtDQo+ID4gb3ZlcmxheS91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRl
d2FyZS5zaA0KPiA+IGIvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL3Jvb3Rmcy0NCj4g
PiBvdmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNoDQo+ID4gb2xk
IG1vZGUgMTAwNjQ0DQo+ID4gbmV3IG1vZGUgMTAwNzU1DQo+ID4gaW5kZXggZjQ1NTAzN2I2MC4u
MjQ5YzViZDI2MA0KPiA+IC0tLSBhL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9yb290
ZnMtDQo+ID4gb3ZlcmxheS91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRld2FyZS5zaA0K
PiA+ICsrKyBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9yb290ZnMtDQo+ID4gb3Zl
cmxheS91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRld2FyZS5zaA0KPiA+IEBAIC0xMywy
MCArMTMsNDcgQEAgZmkNCj4gPiDCoGNwICIkMSIvbXBmc19kdGJvLnNwaSAvbGliL2Zpcm13YXJl
L21wZnNfZHRiby5zcGkNCj4gPiDCoGNwICIkMSIvbXBmc19iaXRzdHJlYW0uc3BpIC9saWIvZmly
bXdhcmUvbXBmc19iaXRzdHJlYW0uc3BpDQo+ID4gDQo+ID4gLW1vdW50IC10IGRlYnVnZnMgbm9u
ZSAvc3lzL2tlcm5lbC9kZWJ1Zw0KPiA+IC0NCj4gPiDCoCMgVHJhc2ggZXhpc3RpbmcgZGV2aWNl
IHRyZWUgb3ZlcmxheSBpbiBjYXNlIHRoZSByZXN0IG9mIHRoZQ0KPiA+IHByb2Nlc3MgZmFpbHM6
DQo+ID4gLWZsYXNoX2VyYXNlIC9kZXYvbXRkMCAwIDEwMjQNCj4gPiArZmxhc2hfZXJhc2UgL2Rl
di9tdGQwIDAgMTYNCj4gPiANCj4gPiAtIyAjIFdyaXRlIGRldmljZSB0cmVlIG92ZXJsYXkNCj4g
PiAtZGQgaWY9L2xpYi9maXJtd2FyZS9tcGZzX2R0Ym8uc3BpIG9mPS9kZXYvbXRkMCBzZWVrPTEw
MjQNCj4gPiArIyBJbml0aWF0ZSBGUEdBIHVwZGF0ZSBmb3IgZHRibw0KPiA+ICtlY2hvIDEgPiAv
c3lzL2NsYXNzL2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUvbG9hZGluZw0KPiA+IA0KPiA+IC0j
IEZha2UgdGhlIHByZXNlbmNlIG9mIGEgZ29sZGVuIGltYWdlIGZvciBub3cuDQo+ID4gLWRkIGlm
PS9kZXYvemVybyBvZj0vZGV2L210ZDAgY291bnQ9NCBicz0xDQo+ID4gKyMgV3JpdGUgZGV2aWNl
IHRyZWUgb3ZlcmxheQ0KPiA+ICtjYXQgL2xpYi9maXJtd2FyZS9tcGZzX2R0Ym8uc3BpID4gL3N5
cy9jbGFzcy9maXJtd2FyZS9tcGZzLWF1dG8tDQo+ID4gdXBkYXRlL2RhdGENCj4gPiArDQo+ID4g
KyMgU2lnbmFsIGNvbXBsZXRpb24gZm9yIGR0Ym8gbG9hZA0KPiA+ICtlY2hvIDAgPiAvc3lzL2Ns
YXNzL2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUvbG9hZGluZw0KPiA+IA0KPiA+IC0jIEluaXRp
YXRlIEZQR0EgdXBkYXRlLg0KPiA+IC1lY2hvIDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9mcGdhL21p
Y3JvY2hpcF9leGVjX3VwZGF0ZQ0KPiANCj4gVGhpcyBsaW5lIHNob3VsZCBub3Qgd29yayBvbiA2
LjYga2VybmVsIHNpbmNlIGRlYnVnZnMgZm9yIGZpcm13YXJlDQo+IHVwZGF0aW5nDQo+IHJlbW92
YWwuIEFkZGluZyBhIGxpbmsgdG8gdGhlIGtlcm5lbCBjb21taXQgZG9pbmcgdGhpcyBjaGFuZ2Ug
d291bGQNCj4gYmUgZ3JlYXQuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFJvbWFpbg0KPiANCj4g
DQo+ID4gK3doaWxlIFsgIiQoY2F0IC9zeXMvY2xhc3MvZmlybXdhcmUvbXBmcy1hdXRvLXVwZGF0
ZS9zdGF0dXMpIiAhPQ0KPiA+ICJpZGxlIiBdOyBkbw0KPiA+ICvCoMKgwqAgIyBEbyBub3RoaW5n
LCBqdXN0IGtlZXAgY2hlY2tpbmcNCj4gPiArwqDCoMKgIHNsZWVwIDENCj4gPiArZG9uZQ0KPiA+
IA0KPiA+IC0jIFJlYm9vdCBMaW51eCBmb3IgdGhlIGdhdGV3YXJlIHVwZGF0ZSB0byB0YWtlIGVm
ZmVjdC4NCj4gPiAtIyBGUEdBIHJlcHJvZ3JhbW1pbmcgdGFrZXMgcGxhY2VzIGJldHdlZW4gTGlu
dXggc2h1dC1kb3duIGFuZCBIU1MNCj4gPiByZXN0YXJ0aW5nIHRoZSBib2FyZC4NCj4gPiAtcmVi
b290DQo+ID4gKyMgRmFrZSB0aGUgcHJlc2VuY2Ugb2YgYSBnb2xkZW4gaW1hZ2UgZm9yIG5vdy4N
Cj4gPiArZGQgaWY9L2Rldi96ZXJvIG9mPS9kZXYvbXRkMCBjb3VudD0xIGJzPTQNCj4gPiArDQo+
ID4gKyMgSW5pdGlhdGUgRlBHQSB1cGRhdGUgZm9yIGJpdHN0cmVhbQ0KPiA+ICtlY2hvIDEgPiAv
c3lzL2NsYXNzL2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUvbG9hZGluZw0KPiA+ICsNCj4gPiAr
IyBXcml0ZSB0aGUgZmlybXdhcmUgaW1hZ2UgdG8gdGhlIGRhdGEgc3lzZnMgZmlsZQ0KPiA+ICtj
YXQgL2xpYi9maXJtd2FyZS9tcGZzX2JpdHN0cmVhbS5zcGkgPiAvc3lzL2NsYXNzL2Zpcm13YXJl
L21wZnMtDQo+ID4gYXV0by11cGRhdGUvZGF0YQ0KPiA+ICsNCj4gPiArIyBTaWduYWwgY29tcGxl
dGlvbiBmb3IgYml0c3RyZWFtIGxvYWQNCj4gPiArZWNobyAwID4gL3N5cy9jbGFzcy9maXJtd2Fy
ZS9tcGZzLWF1dG8tdXBkYXRlL2xvYWRpbmcNCj4gPiArDQo+ID4gK3doaWxlIFsgIiQoY2F0IC9z
eXMvY2xhc3MvZmlybXdhcmUvbXBmcy1hdXRvLXVwZGF0ZS9zdGF0dXMpIiAhPQ0KPiA+ICJpZGxl
IiBdOyBkbw0KPiA+ICvCoMKgwqAgIyBEbyBub3RoaW5nLCBqdXN0IGtlZXAgY2hlY2tpbmcNCj4g
PiArwqDCoMKgIHNsZWVwIDENCj4gPiArZG9uZQ0KPiA+ICsNCj4gPiArIyBXaGVuIHRoZSBzdGF0
dXMgaXMgJ2lkbGUnIGFuZCBubyBlcnJvciBoYXMgb2NjdXJlZCwgcmVib290IHRoZQ0KPiA+IHN5
c3RlbSBmb3INCj4gPiArIyB0aGUgZ2F0ZXdhcmUgdXBkYXRlIHRvIHRha2UgZWZmZWN0LiBGUEdB
IHJlcHJvZ3JhbW1pbmcgdGFrZXMNCj4gPiBwbGFjZXMgYmV0d2Vlbg0KPiA+ICsjIExpbnV4IHNo
dXQtZG93biBhbmQgSFNTIHJlc3RhcnRpbmcgdGhlIGJvYXJkLg0KPiA+ICtpZiBbICIkKGNhdCAv
c3lzL2NsYXNzL2Zpcm13YXJlL21wZnMtYXV0by11cGRhdGUvZXJyb3IpIiA9ICIiIF07DQo+ID4g
dGhlbg0KPiA+ICvCoMKgwqAgZWNobyAiRlBHQSB1cGRhdGUgcmVhZHkuIFJlYm9vdGluZy4iDQo+
ID4gK8KgwqDCoCByZWJvb3QNCj4gPiArZWxzZQ0KPiA+ICvCoMKgwqAgZWNobyAiRlBHQSB1cGRh
dGUgZmFpbGVkIHdpdGggc3RhdHVzOiAkKGNhdA0KPiA+IC9zeXMvY2xhc3MvZmlybXdhcmUvbXBm
cy1hdXRvLXVwZGF0ZS9lcnJvcikiDQo+ID4gK8KgwqDCoCBleGl0IDENCj4gPiArZmkNCj4gDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
