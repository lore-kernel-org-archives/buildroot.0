Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38468C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 05:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A124B403F7;
	Mon, 19 Aug 2024 05:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hInVsTGGjkD; Mon, 19 Aug 2024 05:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C26440422
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C26440422;
	Mon, 19 Aug 2024 05:31:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C57221BF3E8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 05:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C005C607C2
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 05:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqnrkIDJ9_6U for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 05:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::610;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9CFE607B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9CFE607B7
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::610])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9CFE607B7
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 05:31:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyRoTHV7fanVTVQ+6GZo4VqFavXzNXT3VEBlyT71JW/K12+cWPytgBgAj0ySL4lDIlfFjKjhaGfP8xeES0kEdHCuVDKD6T+IoimcO3v5RP/yDnoZ5VEFESbQJJPcpZyetbxAwi49YHUO1qkj/PJXHOmovzbNvsgAhQcnE65gNRcnI1KMPczeH0jllYSvqn5UcdPMZaBXncky92lFcqQ6Q+Y+Jc2w0ElVedBfngbue1TjCLX03R7qZ8hXbopt5mhj9miYIVRcM1aPCTlx1QfDPS8LD0e1vYkz56YA1BnA3kQCr++OROufl4O0JrtlYXWW0vISOk2WJuKy/HrJDfafbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA3RtJj70bA9OwRkVheViNY01V/KnD1sZkjNJeJBjjo=;
 b=BbGrPSDvpcATOO2VQ+XZ7y8UcCqIqZv6MjgSlmZbb1n3AK96PnvcMVIe0+GSrOYqpkdaPAchY1eapRzjmSxaVgoLbhGW2z8/y/VSuYjPPOQPWHOske4IqUKCWd/aW7HxTPRKyg7OG1xVyGFo3RC1dI6lVP6ebe5gwMB9k8y0kgdF2IP6xTVIKGy/VxGrFz+UZGJOrE0waq7DuQezISJXbKXw6xouvmoty3MdakUQQhFeIi8Od5RgRIv5jgrSyoMR9k5fDOATkVkW3Mr4eQxNjQ9pFDq4kAeTzbXKSvY2DX4t1qAJHmX3W7s9D/x72cWkk+ZTePJVq45MTul910q07Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB6742.namprd12.prod.outlook.com (2603:10b6:806:26e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 05:31:10 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 05:31:09 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] configs/zynqmp_kria_*_defconfig: add missing U-Boot
 build dependency
Thread-Index: AQHa7/qbgoNH6RyZIUqwIemTKx8257IuEanQ
Date: Mon, 19 Aug 2024 05:31:09 +0000
Message-ID: <CH2PR12MB500428332D76B04E0EF35E57F08C2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240816-zynqmp-kria-defconfig-add-missing-uboot-build-dep-v1-1-30867a0e6f72@collins.com>
In-Reply-To: <20240816-zynqmp-kria-defconfig-add-missing-uboot-build-dep-v1-1-30867a0e6f72@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB6742:EE_
x-ms-office365-filtering-correlation-id: 88656c21-ee9b-4aec-1d22-08dcc010219d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L204V1VMRnRWL1R5SldGQ0hSajVKSTBPaGR1OS8rL2Z2T2YwSW01TUx6U1Bw?=
 =?utf-8?B?dzhKYzBocWx6OG9GaDIxckNtOEY0UytUcEVKYVBTWHZoaEU5eExacW1zMFJK?=
 =?utf-8?B?aXgvSnlVMUdPaVFzWFpHa2pXN2VLWDkrdDBZMWNsQlZOYklVb05ialdoaTNW?=
 =?utf-8?B?ZGZ3bUVIZDNzalhlN1NVd1RmOWFYZzh4UGZVcG8xZDV0eGZldHBwRlZsVzlR?=
 =?utf-8?B?MjdhTGh0YzlyWGo0Tmt5UjJsUnVzKzM0NG9IMHh1bjFtbmdaTWUxc1hSWk1U?=
 =?utf-8?B?amdIb3RiM0RseDdqbnpwRUlZUjlyRkpsN0Z5VHNTTDZpTHpDblRUejJua1Rw?=
 =?utf-8?B?LzNrTTlaZFJWK0xBc0NhWHJXckpLWStqVFE3MWM2WnF2OWh5SEJGbmhuaXRU?=
 =?utf-8?B?YlN3TG40WWIrdnpycmNha1pML1IzVUNUaEFDR1o1bDFWS0NuMFR2YVB6c2s5?=
 =?utf-8?B?RmpiNlVSVzhBR2hicmFvbS90aXQ2NWF0b3RRbC9GT1NMK0ZadHcraVUyNjVi?=
 =?utf-8?B?Y2NPb2tOZWk5OWdLVm1Panh5Mm9oRGtaMXA5YVBLZlU1cTBDUjlHK1k2TXlk?=
 =?utf-8?B?bU52SS9RTGk3YjNiQnNmSm12OXZKOU4xVFhvZGFHbDRiMG1pSXk3QTN4NHFW?=
 =?utf-8?B?Z05vODhiSTJpcmFPMFZnVGFZT01UVG1tclFyWDNXWUNvYzJIbXAwSnNRajZ6?=
 =?utf-8?B?ZWl6OG1mUkRVN1BZdnpMejQ0QlVwWmYyNitBRjFZdTE0WGtMTVhFZXVQUEJt?=
 =?utf-8?B?UVFEd2NQdGR0RWtQbFo0VG1RWlNwSFlZNktCMWtHSW8vclFFYU1wcEZlY3cy?=
 =?utf-8?B?aEdLU2FvWXdWSXFQekxyaGF3eWo3ak9jVDd5RUJ5Um1JVllhL0V4YUt0azF2?=
 =?utf-8?B?UjZYTHBCTlpCei8rb21na2x3SlJJVGRaWXZVejJlTUJpZW5SY3d2cE1pajMx?=
 =?utf-8?B?MGJ4aDljemxFWUFURWF1TzErTWNPbklacGZ5NTVkYXQveW56TkpkVmkxWkoz?=
 =?utf-8?B?TWFock1PdXJocGxRcnpLZ0xKNlI5MzY1R09FSjk2Mjh6dG80eklnZmx4MUll?=
 =?utf-8?B?Ums2RmdiK2dqQ2Z2RVNmZHV4NHo5NVdmVnlZUGw0N2F1c0hDQmZoY1hnVHlO?=
 =?utf-8?B?V1NrL2RDTGhYYmthMnFnMU9iNFJpd1Fwb3ZoUUxlNlFrRlNNYWVGMDZwSi9F?=
 =?utf-8?B?dXZGL1p3WmxacnJXRzZyYlJyQmQwVW1TQjYzeTVudFg5Q04xNWlUNnlubEE1?=
 =?utf-8?B?VG52clF5dzFLMUVlZnRNck9nQUZtTXBjdTRMMExIbGVNL2F1dzgrN2IzbFhR?=
 =?utf-8?B?Vm1FWjcvV3AzRVlWRzAyREhSa0lXOEl4Q1k1aXpJR0lEOFJlQU95Y09jbU9F?=
 =?utf-8?B?a01pTlFIbmt0K1N5WTFIVkVUUzNDdjNaVllkMGNLTnloL0RYS21pR3p0eWVI?=
 =?utf-8?B?eEphTXBRY0dBeE02VlNMdXpueU5iRExqdEo1a2U2UmlRQ3VBMDVlUkFlTHgx?=
 =?utf-8?B?bEZHdnZTWmJhVHZmUDlldHZHR3BrVDVDY2duTCs4cEpkd0luejV6dFoyL3o4?=
 =?utf-8?B?ZmJWd3pMUGMycXk4em5wcExlSElkNWY4b2ZMMUNKdk9vYVVMVzRkdnhrQS8z?=
 =?utf-8?B?WnJoWWlsR00zMWpDdllkd1BDV3ZjaWJ5OTZZMXpmOThHRFIyYjg3L1ZNUVJ1?=
 =?utf-8?B?VzVRRFBxYThOUVBGMG54eVFwM1FXNDlwakUxdkt6Wno4UnhyRWM0bGNKY29k?=
 =?utf-8?B?SXduRmU3dXhTWGNzUENtMmk0ZTZwTjhLbnJxY2llczYyVDRXa1JURWxSdHlh?=
 =?utf-8?B?Sk1SRVErTnBlaklwenp1RlYxSTdKdzZaRjdmdWN1YVVOUW5MNzR1SDIzUGJ5?=
 =?utf-8?B?SCtESzFxVGVGOFpQdmtOSlphRXBFS0NrWkxOS3lMVTRXNWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0dlNG04UTN0UGxNSnBaUDJHZjRqa2w4VlVaaGF4MDlUczg4dlppWC9TN1pm?=
 =?utf-8?B?bU9DZ3JkQlhWMzJHWVVoNU9ETnExeVo1Smh2cVNhWFdWVExXU1F6WmF1L3B5?=
 =?utf-8?B?ZUp6eG13WGhKY1VMOVQwMXJJRThEV2dkR2wvNTA5NDg2dXJOYml2TFJ3TE0x?=
 =?utf-8?B?TmZ3OFJEU1dBVHo3bWovT0pZZXFlV0RLRFhEd2tpemp4RzdVS0gvNktFajMy?=
 =?utf-8?B?cUZRNnMzdHNneGwxTFd2MW81cXR1dmQzK21wRE04eHdwbS94ZTZCYmhweUhk?=
 =?utf-8?B?MXpGZXhjMmo2aUI3WUdzWlYvdzVqL0lGaGdKSVhhSzhyOUFPRkpDQncvSDR5?=
 =?utf-8?B?ekFTU200R2dRUURGczRKTVJ4d2FVUFhDSWh5bzI0WUdVa3d5OVZ6UkRtMmJ5?=
 =?utf-8?B?K1kzZThUY3Ayam1iaERXVTZYWkdmSko1b0xrNWlYTGxoajR4QU16a0NkY3dW?=
 =?utf-8?B?d2lIdG10WUE3OHp0NjF6UVBKcXZpRHJkRXNCTnFMTGdzcnVhTjN0Y3N0blpU?=
 =?utf-8?B?WWQ5bnJIUk5NTTF5UVBmbHgyaDArQnNQTlQ0VzJ3eVRVT2M0eU1GeVl5ZWYr?=
 =?utf-8?B?THhuYkJTbUdlNi9DYWJjelRTVmxkb3RrL00ycGlXdHFjaUxOSllkM2RjSEdP?=
 =?utf-8?B?OWQvNFhyenFPcVBJblhhUThJbmtDb0xnS2RIeERhSEFseXpyRUJmc2hmQWdB?=
 =?utf-8?B?NjBDc3dMeWwxUHBmT2hHV21DcUlaeUFLYkRjMFNNSnhxNDhZMzV6S0VxSWtu?=
 =?utf-8?B?Q2R1V1Bqb1ZjeXBWcEhZekgvaTdCbHZlRCt6N3ZCUFFoTTJsaFhIdGIySy81?=
 =?utf-8?B?NEFXWTFGUkxIWHFvUTBFT0F2WFN0dStFVUdUSU5EeWpjRytnMGxLc0I4NTZj?=
 =?utf-8?B?b1k3QkNCMC9XTmt1Y05QdWdkZkRGd3NLaWpCWGVKYXlsbWVySE1JTW83R1d5?=
 =?utf-8?B?dmNNcVZ6bUtTTjFmZjhIL0xLZjRGYjF4b21qWmN5Z3pxREdETmpGVndkdnJI?=
 =?utf-8?B?RGNkbGVQMkJmbytqNmE1Y1BPQ1o3L2tJd2t0NHA1MzNvQnc1L0ZxVU1KMTZq?=
 =?utf-8?B?MEI2cWR3L1JzV3o0MzA5VFBCNXVudGU5NVJDeGlHM01iMTQ4eHRHcndMSmdO?=
 =?utf-8?B?NXZFRDV1dUpPSXl1UVR2VjZrT2JRYm03M1hVL2NTY29EbllqQzZkSXZtOUpx?=
 =?utf-8?B?d25FNkdqYW84bFlOV2R4ZENBN2JVaHhCS1MvQXFyWWs5c21WQ1lQUWtENUFT?=
 =?utf-8?B?WnpPa2lQa3FqUWJVMFg5RHJmMUVkbTk2dHhha1lLU0o5ZUFOU29RZjhBclJt?=
 =?utf-8?B?MkpZc2hySnIrUzM5OUZUYzgzQlp2ZElMVlB3VUU5MHJCeHRPUWUwcXdoeE9v?=
 =?utf-8?B?U3dIbEpGb2tmOEs2K3lkZU1QQkxxVzl2aVBIdDc4a1dsTEVNdnc1RGdqUEFG?=
 =?utf-8?B?QzFWcy9rMFpSdCtWdDNIcHRZVnkyRFpYMWd1dVJLdERad1BRcEw2T1NEYUU5?=
 =?utf-8?B?RnNSa0hVemdwbkxMUW1FSjNQZWNqdm5wUzFuMUF0TnM4MFk4dkJuSCtsQ3h1?=
 =?utf-8?B?em1LZ1o1c1V1SEdJMjludEVvUmNCUGRGWkVzMnNES2ZMa05aWHc5UWxzNHVW?=
 =?utf-8?B?YjM3bCtpMVJyYlVjMklPMGpPMGEvTVhzRkxRK29IOVQ1dGlURmZwYi93VG91?=
 =?utf-8?B?M0ZmUlYxUGRGK0E3SVVnMjNxeGNPOU9YQ2xHZ0R5OWNEU3FZQ0dySHNQdVF5?=
 =?utf-8?B?QmZtN1NaWVpab2hMZ3NjY1Q1QStHY0Uxd00zcS9QYmhLdC9PN2JJNkdNVjZy?=
 =?utf-8?B?STRWeUxlMk91SURhTWRNUzgzQ0J1MVFuN2ExYXR3L1RhRkhBQWRaMGZOWWd0?=
 =?utf-8?B?aVppbmZFMFM1ODgwUWN0Q2VDWGJLZFlaa1BXYkhHZjh0QndmM2RmZ3o3WnRF?=
 =?utf-8?B?T3c0KzlRMW9SZ3NScU44TmRtcTRmRHZ0UWNaamZiZm1iS2NiSVY0WkZFb2JK?=
 =?utf-8?B?TUdoREI4Q2J1K3NzeXBFYUdyTlF1OHBSNm55QXR3ZmhVZ0VNeEk1QWsrdFRM?=
 =?utf-8?B?N2l4cHZ2NGFRL0oxOThaWVQrMnRjanJlNUdDNmNCcFV1bmNObHNhVURaeGh4?=
 =?utf-8?Q?D8yQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88656c21-ee9b-4aec-1d22-08dcc010219d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 05:31:09.5627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wOgO664CWdzZ5BdF0d4TqA7xB2UmhXG/tpwGPog/V6RfWcw8KifdjjYQ/Sk1ZtKX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6742
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PA3RtJj70bA9OwRkVheViNY01V/KnD1sZkjNJeJBjjo=;
 b=O0M9lHKplibXClmdjRQpOZrZB2VXzBgHGOCNO59aeyIb1+jEzslZQNZm3Nj5+j5XikbX71gtRv53XR1o+7uDQBFnQi59rWhVZ5aX6+FrqHuQtBDzp2QqcHwgwvGg7RmeI2CkwQfNljBWCBZVeqf+NL5lRzhZ3IT804eewQaF1pU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=O0M9lHKp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] configs/zynqmp_kria_*_defconfig: add
 missing U-Boot build dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> When building these boards with BR2_PER_PACKAGE_DIRECTORIES enabled,
> the following error occurs from U-Boot.

>  tools/mkeficapsule.c:18:10: fatal error: uuid/uuid.h: No such file or directory
>     18 | #include <uuid/uuid.h>
>        |          ^~~~~~~~~~~~~

> The U-Boot defconfig these boards use 'xilinx_zynqmp_kria' enables
> CONFIG_EFI_CAPSULE_ON_DISK, which requires util-linux.

> This doesn't fail when BR2_PER_PACKAGE_DIRECTORIES is disabled. This
> is because host-e2fsprogs requires host-util-linux, and
> host-util-linux always builds before host-uboot when single-threaded.

> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Reviewed-by: Neal Frager <neal.frager@amd.com>

> ---
> configs/zynqmp_kria_kd240_defconfig | 1 +
> configs/zynqmp_kria_kr260_defconfig | 1 +
> configs/zynqmp_kria_kv260_defconfig | 1 +
> 3 files changed, 3 insertions(+)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
