Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBD6CFD364
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 07:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60BBF61183;
	Tue, 25 Nov 2025 07:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7MDpwrWJcbr; Tue, 25 Nov 2025 07:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB48160E24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB48160E24;
	Tue, 25 Nov 2025 07:33:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 331DA359
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 07:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 246E3400F2
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 07:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stmj7EjTNHSa for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 07:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::5;
 helo=dm1pr04cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0676C4018F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0676C4018F
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0676C4018F
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 07:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyLqwq+/av0lZ9v0k29qAPxBGTq/zaBbnVyOzsAAz8AZ8KzdembkViVHpVtn5yJNg/BTVEuLw5O+e8VkRSB2jGann4zPLlTLIWuJg4fd8loVkrWzkazpK+woohokF6sFAmVIBwYas6AUhcS59dB98OIp+qpJFtccOmzgOzIM5UNhwVu/+MoheBmWVVkIFGG8nwgCJITJPnXtRiQZizp+EAg8vrbsPnUBWsSofURLKplES7NKqA9w2Iigcinq3BrrxcUvZaw3wyhuqGocupw/pHhQA2ako+2Hftrn8buTPh7eO1CONEz3EROXO4ubbHW7R35CSOXPMfpDp/QYrrjW7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsY/pXdMjSTdeoHbprfZQX16XErSsmZVdyi/wmUSe20=;
 b=YuOYg96Zeb1NmfGNrsMf6pIa4XDeWp+qpDr/+fghIce8CESI69bGHfh7ywCci5qmKW6mX+cIIF5QxV1fWXvEmy8zcGLV1yHZH4tMSL8DThb4IFJyj3Z7hNMUQ0mMMqp9IvxB81aErv8jkCpfPR0hTUT1SISlI6U432kWfEYfuS2YbVehYVuS5/VGYKO6byAaY8i7p9ZMJF09+U0gNtm8hc3ALNzHe9KULfNJn4SuqN81F9Sv0c1/Exs49fYumCqqU9e0Aflw33CDQKx2SO0hm9F3DQoQLauLBgzmuidAwB7S4E5C0g9s6D1Sj0c8qQsaVNsLfppZkfY6A7PjMpdRmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SA5PPFCB4F033D6.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 07:33:12 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.9343.011; Tue, 25 Nov 2025
 07:33:12 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/1] package/bootgen: bump to xilinx_v2025.2
Thread-Index: AQHcWxHsfLUHfcFQ7USU+JTiiI8wzrUCaGstgACcUrA=
Date: Tue, 25 Nov 2025 07:33:12 +0000
Message-ID: <SA1PR12MB56156F87B1E140220AD2D278F0D1A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20251121180848.2106965-1-neal.frager@amd.com>
 <87a50bhyj5.fsf@dell.be.48ers.dk>
In-Reply-To: <87a50bhyj5.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-25T07:30:57.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SA5PPFCB4F033D6:EE_
x-ms-office365-filtering-correlation-id: 8ba670cb-2092-49f3-7880-08de2bf4e37c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?RkU4K0NwcDdXVjNsWVhhUUJvTEZhcVZQQXp0VzFUUHhSMTNIZ1dkaGNlRHg3?=
 =?utf-8?B?bXZzRDJPTGpYbTBMMExKUHhNemdNMDdDL0VzaFAvQnpwSkV4UDZqVmpWci9W?=
 =?utf-8?B?ZkdnendwaUpBcG9xZkRpMTN4ZVEwTEFydWxSYVo0TUhnaUwyeUFOUFRLMW9L?=
 =?utf-8?B?MFFDM2wrUWhTVVhmRTNJTjR5aDdwVjlqQlErc1dVSDFvY09KNGVKUDZnb1Vj?=
 =?utf-8?B?ZUlsdVJlVmpNTW42bHRzK1J1NkkrTlEvQnRjSXVJNmdLR1RvblJwazFTVWpC?=
 =?utf-8?B?NUIrc0tqNVRFcU1IMzRYcXRHTnJTbjZpYWFYaTlnNFpmLzFCajZVMjlabW0w?=
 =?utf-8?B?d1l2aXgzYmJKdit0V1FZUTE2bHhtelhvQUdGTmxUVnZBdXZkRnBoQnl0UjBL?=
 =?utf-8?B?MWFpeFNJeFA5NkFxbm0zMkRrek83OCtiK3lVd1Rvb3I3aVNhUnVGamxNcjVp?=
 =?utf-8?B?WklabmtJUTVJK1dzell2eWZCVjlVZUtadysxTWxVcWowVzVuWDZydUk1NzUv?=
 =?utf-8?B?Vm5SS3pVcTJTTWhSSk9id0NwUjJ1N2tlOE1kelErc0FqN3F0VFNYKytWWGN0?=
 =?utf-8?B?RThxRHM5TnpzQUk1NUQ0TXZCTGV1eVFlQWVUT2NzVEx4Qlpqc3QzZmwyWnVH?=
 =?utf-8?B?LzZMUmpScGx2cTJGNWVSY2d0STJOUE5CditscHN2ajJCWXBqQW5LcUU0VVAw?=
 =?utf-8?B?OTVhMzRkdG52aDlRSkRMazJ4b1lWYWtoWGtCdFh1VnpXM3Z5b292MGdnd3Ni?=
 =?utf-8?B?NzVZZ3BwbzZvTGN6TEczNkFDT0ltSjFjeDcwOVg0T2FLbjU3a0wweHdMV1M5?=
 =?utf-8?B?ZTE1UnpJL3hYeDllZnhBQ3YyVFNqejVrYzFHb24rRHlzT3phWk0rT1E0dlJk?=
 =?utf-8?B?M0dVS2lMczZVditJY3MzMk1RL0RmT3RCTU0xWmYwcWp4OUgxV2ZiS3BRNkpw?=
 =?utf-8?B?SEpDKzRwOERHdzJhUTlWSW1vMjNOejdRblJ3djhFeEQ1cm9FYVFYRTRTOWlr?=
 =?utf-8?B?Tk5DVytGb3NNZmFFN3BZWE5zUVhSK1dZMVBHWTVyT2ZXZzNsQzRVbndyU29q?=
 =?utf-8?B?WXJhTndWWFpOa0hlc3h4N0ZDbVRtSW9QSjFrUG9mVVRLbllzWXF5bHBuc083?=
 =?utf-8?B?NXp3Zy9XeHRUQ055QmNndFlkTWt6NFUwRlpOb0RjREdoOU5NNWVCd2U1b3Qz?=
 =?utf-8?B?bEtmaWorMDJGZFZQSVlGZEREYlhMUW9nS0dvN0JGM2xuRG13Qm9JdkpNbmtO?=
 =?utf-8?B?WVVQNGR4Z2JmWlpXM2IzZEZvOUI5RUpRYnYwQlAxTEJsSTgvWWc1VS9IRFk1?=
 =?utf-8?B?OXgvcGZCN2pqbWNtais3TC92b2hOQVlWd3RPUklIK1NzcGNLaUFEL0dvdFlB?=
 =?utf-8?B?cHdUa3lBTUtFUU80blJNcVdmMUFxTGRNN3k1dSs0WUI0U2s2MS9oT3I4SUd3?=
 =?utf-8?B?QTN6eDRLbDFlL3pRRlMreklVbnhoN3dBV0FmeEZWaWJ4RXhKN2VwdmlLaHRL?=
 =?utf-8?B?UEo1VTQxRW5UM09ZdDM1TEowYnA2R0prbFA5STkzU2JQR1Voc21sNVRJeGYy?=
 =?utf-8?B?cTVaWTA2R0VTTGFUZVY1aHVEaU1hWkRha1JySmpvWnVNVktFNVkrTTg0UUp4?=
 =?utf-8?B?Ukl2ZS9YMC9VUGlJL3FFdDVUV1BJL2JpRkVwNWhjbURGdloxU2NTdWFLZkhr?=
 =?utf-8?B?T0ZTQk5jejdNeXFKVVovQnY5Qkk3ZU5OcUNIRm9odklpL1FZekRrQzNzYi96?=
 =?utf-8?B?WlFaQlp4MTBxeW1ZYm1XZnE1Q05yS0VYYU1WUVJFbko1K0xiUUxtNzlGTy9X?=
 =?utf-8?B?R2FTTjJXeWdHZndRUkVJOXNnODFSY2oraXFEZjgrUER5MVhvT2V4aDFZeWxU?=
 =?utf-8?B?VGhNalRnd2lneGNqdEhNTDhKTkFrWWxvUGdqNlpmdWZQc3NiSkFBTDRaV1p1?=
 =?utf-8?B?bzh5TG9pVTY4QVF6eEZIRGNoMms4VEZ3M2F2aERsanN2cG5wQWRqMkF0UWFw?=
 =?utf-8?Q?1nVfJ6P69wKyiyGkZTOH+yAUmmCnvc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjcyTXNWZi9LZkZCYWl4V3AzSFgzMUhLNVNiZXAwd0FGYnU0a0dvdktLdFox?=
 =?utf-8?B?UUNaSGl3RFR1Y3RvMXAxakxnODlQZmRUSzdjNVkybDBpM3hMcDgrS1FXMUhx?=
 =?utf-8?B?akp5VG9OMHdkanN3TS9aUXlnZHBFeURjM3I5N2FFNlRqZGxHVHpIb1l6cjVn?=
 =?utf-8?B?Ry8zbGN6bDBDQWZYYnpHUEVwTm1SK1Z3a3J5VWFvOTZ5UnYrRU9HMmtOMDZK?=
 =?utf-8?B?VmVpSnJ2NHM3M292UDJPZUFhdGVGNkp2WEZUVHR0TXRTMDUyZWdIZWVHVVNQ?=
 =?utf-8?B?emUrbTg5UGNmY1JEbU1rVTBxRUtheGdLeWhaaWNtYTdtOFFZMk1rOUxlZVEy?=
 =?utf-8?B?ZXYyS0FEdzFJU3k0TzBUU3lzTUx3QU92NklVTU44aWt4UnBRYmVIS0pHWCtI?=
 =?utf-8?B?T1BFOWEzcWNCQzBMNWgrakJGNjhIelpOUitNRVY5T2ZSZlIwemZuMCs2aG90?=
 =?utf-8?B?OVlKNzlqMXZQNGQ4K2dXS2hGaS9USnVhZEo0RnVxZ3BTbnFINkhHQ2hXbU84?=
 =?utf-8?B?Vi9GSVFVMGNyK3hiZEdsWklkckcydnh1QWp4RFZFNjdobmp3cFVmTlc0SWhU?=
 =?utf-8?B?TE9taFYzWC8wY1VkT1hzLzV0ZTlta2paSzE2eTJVU3lwck8wMURQdWhucGxD?=
 =?utf-8?B?Y3QwN3VRNmpUR3pGdERIczJ5bVgvYXA2OTVTcE93QnpMVEhxYmtzaExLdmhp?=
 =?utf-8?B?a1lyaHBTN05FdHlaeXd5ZmY0RXQyYk1URG1KWGRQWE5LVzNuYUQ0bDNJWDlw?=
 =?utf-8?B?cDYxZjk5MTlwK1BhVW4vSW5uQW4vNFhDaTFZOWt6V1VvS0hKWkhyek9QbzFo?=
 =?utf-8?B?ZVIyZ3Jha1hzK0tUWkQ2Q212UlFjZS82NkN6UXJEdzMyVXA0cURzYW4rajFw?=
 =?utf-8?B?d25UMnZmc0w3M1B2VDlhN0l5b2FCN2VMWDVCa2ZSSDBncnUvSXI1c2ordUlm?=
 =?utf-8?B?QlhtdFQrWFk1OWZhQktpV3huUU15QlRxaTg1MHIzL3J0RGtjaTJzbGVUQlRs?=
 =?utf-8?B?NnExZzBHR01EU0ljZGMzblZickZWU3haeHdVbWpPWXpwSzhwQkNDWXhwYVVx?=
 =?utf-8?B?ei9DeUloV1hyaWVPYXJFaDRZUjJVeWluUU1LMTlQLytxdXNoQUVST29Ia2Q1?=
 =?utf-8?B?bG5nMXVTckRzSm5rTTc0V3M5azEyNzdpZENRdUtYckZjMmdpWFI2dFhjM21F?=
 =?utf-8?B?a21KeUhJeVhkd0FIRUZlRkpOTFlEQStFMzRXZ2tuZnNWTktHMEhFV3hyczMr?=
 =?utf-8?B?SVpuQjNzUXo4YlFjRlFtOHlZM3ErbE1uRUtxdllPSnA3UHMxL0FVNFoyQjJt?=
 =?utf-8?B?dTVuNGZaVmQ5TkVKR1NPdWRzaU9LVFpNdlVMOU9UUFNvUWhWdGFVeFVkWmxz?=
 =?utf-8?B?Nmhua09KR3lrSnRjSk9kREh4U2VQVXo0R0xCa29iMURXZjVUT3VHNEFhKzJq?=
 =?utf-8?B?ZXpsTk9HZWMzNVhuUHF3QkRIYVVZdWNnRjgwZ3ZDWTgyU3NxVktjemcwckhX?=
 =?utf-8?B?aEt5Nmx0WnI1QThkTllGZG9SYjZmenR0S1ZzbWpJMWU0dlJtbk1WWGxyeS9M?=
 =?utf-8?B?alk1S2pQUzljTFdaVGpMT0VwQ1RiOVRlajNlTW16ejMrcXdmQ2tnK1VPTk5B?=
 =?utf-8?B?akhiaU4yQzV2UzZjVnBwNFNDWFdGOWZrY29YUkRYZElQZTA3dzIybnc4U2Rr?=
 =?utf-8?B?SnQyNDBqN0pFTC9wSWJ1YnNDV0lKL1hEWnZ5TjlzaVVPd0s5NUNzS25iZkFj?=
 =?utf-8?B?OGZPdUFyNnBSQm9nZERRNWR0Snc5b2V3QkgvMGFhbmxodFBNa3hqZGRFLzJi?=
 =?utf-8?B?VXBrSVpHeVhUT3JLOTlrWStHZlhHVktrNnhNTjViTCszRWFkMEhRcHJTUUNh?=
 =?utf-8?B?V3hnYi9nL1h3N0w2Ujcyd3JPVHRyTkZnZG5RUjQvUDRuZnpVL1ZKd25wTjVF?=
 =?utf-8?B?K3doVWFWZzNyWkdKRmR1R1FVZDU4NGdYSkI2eG9xMkdtcFJFOEwweW5hSUpY?=
 =?utf-8?B?TzZMSzBGK1pNL3kwUTBmdDF2WFFONi81TFJldDJvakg4am96SjhlZlJSaE02?=
 =?utf-8?B?MUdXTzNxMFhiY2lnTjg0WENmK3U2cktwU1lkTEtMRlIwaEtaT3l3aHVFdXZj?=
 =?utf-8?Q?6ahk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba670cb-2092-49f3-7880-08de2bf4e37c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 07:33:12.0718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2hXHaq3R3fx7lJBkZnqe/W7KqrV9uyFpd9jtZp7UeNRNrQARmUozqS9tD74S0dZt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCB4F033D6
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsY/pXdMjSTdeoHbprfZQX16XErSsmZVdyi/wmUSe20=;
 b=YX/+kqlo/7H0hUkW8TeL2XcjrTODD+/BJBeNeCcgYqwkAdXcZaT6APsfPYig+ujcVvPPXKU5/4b4bCC9cqlHdLRoJkLScMnvC6yd0irC4rwdfD8fLFqDJF+l816SBLG5nA1mxurKN4kHtVOVNQXbkGGuRat6tVGgVzn7d7gG60A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YX/+kqlo
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2025.2
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "yann.morin@orange.com" <yann.morin@orange.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, 
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgUGV0ZXIsDQoNCiA+IEJ1bXAgYm9vdGdlbiB0byB4aWxpbnhfdjIwMjUuMiB2ZXJzaW9u
Lg0KID4gVGhlIDAwMDEtYmlzb25mbGV4LUZpeC1idWlsZC1vbi1tYWNoaW5lcy13aXRoLW1vZGVy
bi1mbGV4LnBhdGNoIGlzIG5vIGxvbmdlcg0KID4gbmVlZGVkIGJlY2F1c2UgaXQgaGFzIGJlZW4g
Y29tbWl0dGVkIHVwc3RyZWFtIGFuZCBpbmNsdWRlZCB3aXRoIHRoZQ0KID4geGlsaW54X3YyMDI1
LjIgdmVyc2lvbi4NCg0KID4gaHR0cHM6Ly9naXRodWIuY29tL1hpbGlueC9ib290Z2VuL2NvbW1p
dC8wNDcxZjA4NGIwNTc2OTE0M2VhOWU3M2Y5YzQ0YjA3NWZlNDBjODAxDQoNCiA+IFNpZ25lZC1v
ZmYtYnk6IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPg0KDQo+IEhtbSwgZG9lcyBu
b3QgYnVpbGQgaGVyZSAobWlzc2luZyBpbmNsdWRlKToNCg0KPCBzbmlwID4NCg0KPiBoc3NfcGFy
YW0uYzogSW4gZnVuY3Rpb24g4oCYaHNzX2dldF9wYXJhbWV0ZXJfc2V04oCZOg0KPiBoc3NfcGFy
YW0uYzoxNTc6MTM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhw
cmludGbigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+ICAxNTcgfCAgICAg
ICAgICAgICBwcmludGYoIlByaXZhdGUga2V5IGV4cGlyZWRcbiIpOw0KPiAgICAgIHwgICAgICAg
ICAgICAgXn5+fn5+DQo+IGhzc19wYXJhbS5jOjc6MTogbm90ZTogaW5jbHVkZSDigJg8c3RkaW8u
aD7igJkgb3IgcHJvdmlkZSBhIGRlY2xhcmF0aW9uIG9mIOKAmHByaW50ZuKAmQ0KPiAgICA2IHwg
I2luY2x1ZGUgImxtX2NvbW1vbi5oIg0KPiAgKysrIHwrI2luY2x1ZGUgPHN0ZGlvLmg+DQo+ICAg
IDcgfA0KPiBoc3NfcGFyYW0uYzoxNTc6MTM6IHdhcm5pbmc6IGluY29tcGF0aWJsZSBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBidWlsdC1pbiBmdW5jdGlvbiDigJhwcmludGbigJkgWy1XYnVpbHRp
bi1kZWNsYXJhdGlvbi1taXNtYXRjaF0NCj4gIDE1NyB8ICAgICAgICAgICAgIHByaW50ZigiUHJp
dmF0ZSBrZXkgZXhwaXJlZFxuIik7DQo+ICAgICAgfCAgICAgICAgICAgICBefn5+fn4NCj4gaHNz
X3BhcmFtLmM6MTU3OjEzOiBub3RlOiBpbmNsdWRlIOKAmDxzdGRpby5oPuKAmSBvciBwcm92aWRl
IGEgZGVjbGFyYXRpb24gb2Yg4oCYcHJpbnRm4oCZDQo+IG1ha2VbM106ICoqKiBbTWFrZWZpbGU6
Mzg6IGhzc19wYXJhbS5vXSBFcnJvciAxDQo+IG1ha2VbM106ICoqKiBXYWl0aW5nIGZvciB1bmZp
bmlzaGVkIGpvYnMuLi4uDQo+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6ODQ6IGJ1aWxkL2Jpbi9i
b290Z2VuXSBFcnJvciAyDQoNCkludGVyZXN0aW5nIHRoYXQgdGhpcyBldmVyIGJ1aWxkcyBjb3Jy
ZWN0bHkuLi4NCg0KV2hhdCBoYXBwZW5zIHdoZW4geW91IGFkZCB0aGUgaW5jbHVkZSBhcyBkaXJl
Y3RlZD8gIERvZXMgYWRkaW5nIHRoZSBpbmNsdWRlIG9mDQpzdGRpby5oIGZpeCB0aGUgYnVpbGQg
aXNzdWU/DQoNCkFzc3VtaW5nIGl0IGRvZXMsIEkgd2lsbCBjcmVhdGUgYSBwYXRjaCBmb3IgdGhp
cyBhbmQgc3VibWl0IGl0IGludGVybmFsbHkgdG8NCmdldCBpbmNsdWRlZCB3aXRoIHRoZSAyMDI2
LjEgcmVsZWFzZS4gIEFuZCBpbiB0aGUgbWVhbnRpbWUsIGFkZCBhIGRvd25zdHJlYW0NCnBhdGNo
IGZvciB0aGlzIGZvciBidWlsZHJvb3QuDQoNClRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoaXMgaXNz
dWUhDQoNCjwgc25pcCA+DQoNCkJlc3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
