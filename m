Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49F6D3E2DE
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 07:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 392844025F;
	Tue, 29 Oct 2024 07:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dchyzlJUlYqW; Tue, 29 Oct 2024 07:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E980E4065B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E980E4065B;
	Tue, 29 Oct 2024 07:57:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 067705E4E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 07:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E98656084E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 07:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozXk4TeysB35 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 07:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::612;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECCB160841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECCB160841
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::612])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECCB160841
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 07:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mytVzd3+uHhfzVfYwUfIFUyuZ1N9qLnRHw09gQr67s2YQX7rXhmPGG+/pHCQsnHM+Vzqz7t9TNIRYpLLYWX4QQ3p3PGGC/c4oPbKjpma0/R+6nLSAcB5VFcULm/tkkVc35/3FGa6r2rckA1FM4LC8M30J3GC5aka54Gmzxfl/260ZKPgFvRC8VcmQ/LWDPzQSz06PNf7zBaJHMc7Kw4l583hQqSsmENJ/8Oks9eyBxiFt2JmwBXkgKeKmK1CevH9RPDtwnYL3vLIbNeLRZ2+muP/OVRIzpNWx3pmmexv7jOVifuZ1IfpWAkgoCT2OFo1v+NzgmYNXXePccMHr9VUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zv6Y09p77WzH7U3Kcj5Pej79NTn0EtUG5AHM/uK7WWM=;
 b=pfMjrlRq+wSAHSubL83mHqjY0twuO07s4totPsq5L8TJ4514zgmymG9E0iSCAKL3InF9gRB/jbzDECePa2B/aPH+NYtmcndJbK15dJtwZ+CEjsHyMVpf8+fnJr4VeRn/ckwtuzm2PiONwpuonV3O2XoCdXR9ifKNyxFpN5JXyjVKIH4TRqa/v/pvwMUO2LTBzGwOivzhBooH4a8wobQea6hkislqDyq1b6XlSjc/ybHGJEPwsCjIoPSastzRmLpXLMLVB+TWT9M860SaOSW9r+SWt2krvNhWRaMEaFs8ijFdu+p1gzE6n8AAejOxVHj3IOG3NthmAZIQkxFA5dXkrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB4996.namprd12.prod.outlook.com (2603:10b6:208:1c6::8)
 by SJ0PR12MB8114.namprd12.prod.outlook.com (2603:10b6:a03:4e8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Tue, 29 Oct
 2024 07:57:42 +0000
Received: from BL0PR12MB4996.namprd12.prod.outlook.com
 ([fe80::487d:ee53:ae79:a182]) by BL0PR12MB4996.namprd12.prod.outlook.com
 ([fe80::487d:ee53:ae79:a182%6]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 07:57:41 +0000
To: "universeiii@gmx.de" <universeiii@gmx.de>, 'Peter Korsgaard'
 <peter@korsgaard.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/bootgen: clean up variable
 names
Thread-Index: AQHbKdC5RjVKTZ1nSki9qGu57LYSNbKdVBoAgAAF3DA=
Date: Tue, 29 Oct 2024 07:57:41 +0000
Message-ID: <BL0PR12MB4996EDF6CD54C03AA313EB20F04B2@BL0PR12MB4996.namprd12.prod.outlook.com>
References: <20241029070344.2661276-1-neal.frager@amd.com>
 <4d5f14f8-6c70-426b-82fd-d023150e0332@gmx.de>
In-Reply-To: <4d5f14f8-6c70-426b-82fd-d023150e0332@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR12MB4996:EE_|SJ0PR12MB8114:EE_
x-ms-office365-filtering-correlation-id: c7eaead8-a354-4433-d0c9-08dcf7ef5d83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T2NEaFlRSUdnb2ZveTM1by90b3l4M21va05STTZJQ0dLUDZmNU04SGVVVlho?=
 =?utf-8?B?R1Jac1RFZnJPM1YrcTFqZC9aZFFHVTVZRm1BNzJYd0NXaVVMM2cvYW5ETElv?=
 =?utf-8?B?Qkh3VXY2WUtORVBHOXNaRmVpdFpFVHFmaGZFOWo1L2l5ck14UWkwTG1BWmZh?=
 =?utf-8?B?WFJoMUNDbUQyMVpjanY4RW9weGNxM0RHSWFHaWU0Ry9qU1F2eHRFdFhaV29H?=
 =?utf-8?B?ZUR6NmNRSDlROWYwZFd2YVNYNFFDL3hoaGhwa0dPNmZQckIvSEVrVng0UkVl?=
 =?utf-8?B?c2QyYzVjSVZwNGhKZklOWjM4Smp0SS9yNVlnUVNscDhZSnRzSVBhZGJGS21x?=
 =?utf-8?B?OUJ0TDBMTFRSUGdCbmRFR0t5Vms1ajhrdjA0dWJPa1VlbkVhOTl4VzZDN1ZZ?=
 =?utf-8?B?MkFvUzFIcFN3RnNneU04Wk02T0hYa1FiY05aZzhkenZmT2Q3VVhUV3Jjc1lF?=
 =?utf-8?B?N0QyZElNSTljUTRxbzRCa1pJREgzTmpYWmV3dG1VbzdaRFo1WFdpTzBZWHBF?=
 =?utf-8?B?U1FoQWttaVVoL1RpalkxdzB6Rm5IMGZ1TkR4eG5FVllXaGVLN2MwTGxjUytL?=
 =?utf-8?B?Q0l0bkE5OVZSN0ZXUExPUXNlUDluYmozQXF3c0U5QVZ2UllSZGVYWlRGK0p6?=
 =?utf-8?B?MFEwWVgyQWp3VGRYd3BsRTNFWkNBOUc5aWQxT2NyMlFhRU1tNEZ1UmRqNXgy?=
 =?utf-8?B?ejVoRGdRNllhWDFBWE94ZUlDaU9NRTliSWszdXp5SlJ1YWtland3Skp6THA1?=
 =?utf-8?B?RHkwUEpZQlBnTUhXS0ZHcnpma2xPeEpvRUVtSGJhMVBXWFpiTWFPckNTTHc0?=
 =?utf-8?B?anBvVnF5Ykg0UFlNMGw1eTlWbkhPQlhGY0pJcHB4MVV6VmVMZUQ0c1F6VEtl?=
 =?utf-8?B?MjhsaVp6TGxwSXFZWk05M0U1VzhiZ1RndkJVdHhhUldsWHNwM2dnWml1OXp4?=
 =?utf-8?B?TURIK0t6NVUwekZJMG02cm12QUFlRFdsbk1UUHMzYlNxWStVSHlITjlDYXVZ?=
 =?utf-8?B?VXRpbE94MXFRcWhnSlFXRlZnVUFLVHZucVhiMXVQM1Q1TCtoZndndFl2aDlV?=
 =?utf-8?B?Wi91UmlYYWpyUnErU0xkQndZTi9yeWZ0eUhjUUJiSzNpZWpieUw3aUFRWDFS?=
 =?utf-8?B?NjhCVVZJUm9oY0NqZUdqWFhYOU1SMlRyblB1UFE1MWRrWjIveTdqeEdXbTFJ?=
 =?utf-8?B?QkNJeTBDTE5YZ1lOWUttTHpZdDk5elZudUNTcmVUei90VERKN2FOODBLN1pH?=
 =?utf-8?B?Q0FVbFBkRWN2ZThsZFFmYW9GajJITThoaGR2UEJ1SWdnSlJ4cGFHeUlCNU0w?=
 =?utf-8?B?R0x2d3lSaXhLemlsaWo5ZjhmdjNsenBRSVp6ZytVRG8zWk5lTFc3NVU4bHN1?=
 =?utf-8?B?dGU5LzMwNGtiaTZwbEJ6QkpHa2lsenlCbTV2M2JKaHUySWs4WWpaN1VITnpi?=
 =?utf-8?B?Ky9GSVNEWFJ3ME9Hbk8rbEVqbjMxeDg1aGtUU1VjY2hPUHowajZvdEhUWkdZ?=
 =?utf-8?B?anZtSElSRCtpeTBWNzh1c2psaWFBcXNQOHVybUhHOU9FYUF0eExwUWNiWm9K?=
 =?utf-8?B?eGhYRDNwZjd6R1Ard3ovUFFBQ2h3UlMyYU5EbEpRb1JrdW5WYnNaOGp4VXZC?=
 =?utf-8?B?aC85WE0rd3RWMXhOZ084WFdmSHJKRjE3ejczTEc5eTRyOC9mY2VUUU9XZVpI?=
 =?utf-8?B?T0xsTkUxaG9HSzFNcnoxZ3NpQTR2NjU4MnJGQnhnMFVqeTJlTGJTV25tNnpx?=
 =?utf-8?B?Z0I1M2xpNmtiaXJobkhOWmg1ZVpsL2RjdXdXdmtrM2VBTWxYakpjUktleFVr?=
 =?utf-8?Q?wjT7V2I2oukZbf6a7RtUqQSbMneLO7opPWk5k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4996.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2tXVHdjcHR2endKci85Zm5RdCtlRmdQelF6SDZTbEs5Yjd2NStvNkxneUlP?=
 =?utf-8?B?bjhKVXR4TFdBMitMbHdOV1RobmxvbGkwZklwWGR2NUV6K3BET3pnem1rTjQ5?=
 =?utf-8?B?ZWlZY2FTd3VNWTRCcUFja0YyUkdKc3c1N05lWWZLeDl4NDFUUXFIQlRtanYy?=
 =?utf-8?B?RUlwcDBOTUdZRmhyMGRHZEkrRGpHVStEUlFsaUlTTmt4WmxVVzJvOGIzSTh4?=
 =?utf-8?B?QmxZbmh2UzFhaUNxeE9MQmhiWEJ4VEZ6Y1JRRkl0SENRMDhXWlFaREpXamFt?=
 =?utf-8?B?S3BzeEhkeEEvQ3U5UVE0c0daeXJsQ0R0bXNNVkpjaFpwdXlhSkVBRk16QWZa?=
 =?utf-8?B?RTJmU2hnZitiOEJ3R3BIOXdBN1F5UUs4N1E2NTh5NDZ2M09yV1l4a2c5UGNY?=
 =?utf-8?B?NlNxSTZCbXBoSFRtdE9zRlBMOG9QeW9rR0Q1N0pDV2RpK3djZnBpNWx5YTg2?=
 =?utf-8?B?Y21yeXQ0MFhYTHh1QitSVlBwa3hyR3h4VzBOKzlEdkoreXFEejllV25Ob0JE?=
 =?utf-8?B?WnptYzlrVkJxKytaZ3NTMFRZbW42M0loZklmdzN2N3kvbDhjbmR4a05IV3JR?=
 =?utf-8?B?Zkp2dHlheiswNEpRd1gvU2xSdUxEZVp4VXByTUlKdkVRWm9yODlaSU05UHAz?=
 =?utf-8?B?ajRacmppcW9oS25ucGVFaVVtYWdJc3RKandMWEJzSXhOVnRDMm15QzVLdGFm?=
 =?utf-8?B?VzNZakttQ1pSRkt0cUlsRFRKcENWWWd6WFdlem1mRmhuY3J6VC9rc0N2dVBS?=
 =?utf-8?B?cEY1ZGU5NVpPY3VFK2lQbm9CWU5TaEpObzRib09GS0cza1Mxa2RnSDRPc0F3?=
 =?utf-8?B?ZVdBK1JkZzh5MWJQdXo1ZTAxOUZweHJPUzdYWk0wZzBBTTNUczI4bHV2aDJE?=
 =?utf-8?B?NGlzRXA3QVFQdWNTVmlIbmlHdnU2VDA4bFA0dkh5ZE9JU1V0Qlc0NlIxRlhr?=
 =?utf-8?B?ZjRORlN4VjhnVkF6d1Nlb3ppanovVUhPL0l2eWUvRktOYVd3NTZaUHhHSUh1?=
 =?utf-8?B?R3N4RTJNVVl4MmxrTEtza0JyY0xGb1RZVDNETDA0ZnVDVjQ2YnAwdWJ5djg5?=
 =?utf-8?B?cnp1QVY2RlNBY1ovSEFxd1pGSnpVM3ZvQnVyMWJzNGtaUFhuei84Sk41VjlY?=
 =?utf-8?B?eVRjeXRNUStyR1hVR2FTY1phdGFVekhoaGRjeWxkS0oydlpKTzNJNGtlVWxh?=
 =?utf-8?B?aFJsbDNzUnFNUWtJeXd2KzlSWXVOdDZlY2FkcDVhZEpFWU4ycjFiVkt1TCt4?=
 =?utf-8?B?SGZnVkJvNkUrcGVkK2xNbitCK3RJZ3VDVmljNmtyOGlvMG9adnV5U2dvcUZ1?=
 =?utf-8?B?V2tJbVltbmJjYnY3QjRkYVpsQjhSMkdKbFo5OVlMdE4xWFNmNUhhRzkwKzBH?=
 =?utf-8?B?a3BERDVxNXJGanpCbjFNUmg5b3QzMk9wR1RJRFJURWwxNnR0ZG9EUjV0TkxV?=
 =?utf-8?B?WEN2MmZNVmZML0ZnbkVlN29XR3FnZmFZOWZqTWVMeTRJV1lleGwxUkJYUEk0?=
 =?utf-8?B?eVJZQmM1QjhhMFpXaGNGNTF5WGJEYm5SWm1oOWp5NTJDbDJCNU9qa2p6bmFn?=
 =?utf-8?B?aTdNcFZGZHlWVkhBTXMvbUFZUDhPaWwvdXdkbkxNV3RoMi9aOTZQbjZ2Um1K?=
 =?utf-8?B?NkZCQWF1YkJ1akhQc3o0cVgzb0cyZlFGazdpN1N4c0VwNkI0am5UeFllRU5p?=
 =?utf-8?B?UXFIYXZ2YVNmMEFSbDFDci9GOHF0VmZSTDBKT3BXTVk3NGxPYTFwdUNiL0Qx?=
 =?utf-8?B?M1VnZVZoR2RNYzFaMGN0dzV6aURDT3NEWnJmajFXaHVNZzdmSnFkZFU1N0hH?=
 =?utf-8?B?Q3FUUUl4VWFaUkprQUVXNXg1NDg1ODJIMnQyUzJBV0VvSzRqdFozS2s0VUhQ?=
 =?utf-8?B?NzB2anhaZmN0TnQvMzVDNUwwc05JblJCd0lGdUF6NHQ1TmZ5YnBsQVgvNVpL?=
 =?utf-8?B?QlJsY3pyUDU4UTF5QXduYldWeGFhQ1AzZDhjbjRtT0Q2Rmg3Z08raHdrZlAw?=
 =?utf-8?B?MlBTYzFGbC95UjduaEw4WDJaN2ZHRXF4SEVBenJhdWZBVEZxNUtZYTh1TjRX?=
 =?utf-8?B?cVhHR1R0cktjM29tL1VEQ2ZpUzA3NVAwcHE0NTlZdjd1NmJHbldnaFp5Ukdw?=
 =?utf-8?Q?A7G8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4996.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7eaead8-a354-4433-d0c9-08dcf7ef5d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 07:57:41.7688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qNwwFD22qEQQg2l7jpYdvPCBZeN/D8LySNgL667ozi8W85SOWtdv/uNTcbgItrYJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zv6Y09p77WzH7U3Kcj5Pej79NTn0EtUG5AHM/uK7WWM=;
 b=FiZlHdjdxYdKSCLHmCVseYZvn63c/2gpgo6byNfQD6RaQ24/36fIJTgS2+WeuAA3nGMtiAc6MIFEivhShBgW84V+2k9r6H5+KM0ZpGOOjlNcl2/Oq81C8Q6ikXtPrUZcj+JcHQrctYIhmALjaryyOkDDTmaQA+x6VRpfNz6e/6M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FiZlHdjd
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: clean up variable
 names
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas,

> Hi Neal,
> I'm happy that you introduced bootgen into the buildroot project,
> because up to now I had to call bootgen in a post-image script and use
> it from our Vivado/Vitis installation.
> Unfortunately I can't use this feature, because we have several projects
> (Xilinx/AMD based boards) which need different version. In the past I
> had problems if I don't use the same version number in the complete
> chain. Vivado, FSBL, PMU FW, ATF, uboot, Linux, bootgen, dtg, ...
> Therefore in our different projects we have to use different bootgen
> versions since a project will not be moved to a newer Vivavdo version if
> the project is in a final state.
> So my question is, if you could make HOST_BOOTGEN_VERSION configurable
> in the Config.in file? This would only be a small change and would make
> the usage of bootgen more flexible.

> What do you think?

Thank you for your email.

Yes, I am trying to make it so software developers can use buildroot for AMD /
Xilinx products without needing to install Vivado or Vitis.  We are not all
the way there yet as the conversion from XSA to DTS still requires XSCT which
is a closed source utility.

But regarding bootgen, it is already fully decoupled.  Even if you are
building your images with an older version of Vivado or Vitis, you can still
use bootgen 2024.1 to wrap these images into a boot.bin for your product.

So while you are correct that configuring the bootgen package for an older
version would be easy to do, there should no longer be any need to use an
older version of bootgen because the latest bootgen version will be
compatible with images built with older versions of AMD tools.

If you still feel you absolutely need an older version of bootgen, I would
suggest just modifying the bootgen.mk and bootgen.hash files for the version
you wish to use instead of making bootgen configurable within buildroot.

Please let me know if you have any questions.

> Regards,
> Andreas

Best regards,
Neal Frager
AMD

> bootgen is a host package, so the variable names should have the HOST_BOOTGEN
> prefix and not just BOOTGEN.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   package/bootgen/bootgen.mk | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
> index 912e2e31b3..840e89f827 100644
> --- a/package/bootgen/bootgen.mk
> +++ b/package/bootgen/bootgen.mk
> @@ -4,11 +4,11 @@
>   #
>   ################################################################################
>
> -BOOTGEN_VERSION = xilinx_v2024.1
> -BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
> +HOST_BOOTGEN_VERSION = xilinx_v2024.1
> +HOST_BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(HOST_BOOTGEN_VERSION))
>   HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
> -BOOTGEN_LICENSE = Apache-2.0
> -BOOTGEN_LICENSE_FILES = LICENSE
> +HOST_BOOTGEN_LICENSE = Apache-2.0
> +HOST_BOOTGEN_LICENSE_FILES = LICENSE
>
>   define HOST_BOOTGEN_BUILD_CMDS
>   	$(MAKE) $(HOST_CONFIGURE_OPTS) \


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
