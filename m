Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90074C27C55
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 11:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C331D84B24;
	Fri,  7 Jun 2024 11:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulyISitxtnlm; Fri,  7 Jun 2024 11:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 672CD84AF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672CD84AF2;
	Fri,  7 Jun 2024 11:42:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B75061BF48B
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 11:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1927608EE
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 11:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c50B69hRxKYe for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 11:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::60a;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3DA51608ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DA51608ED
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::60a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DA51608ED
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 11:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uk7EfPhFlhtqm2HNCNHynwXDIxCw7ioqB2nNMkW6Pixu4iJMDjDtVuUlPXA+IkCQAR6J2uulDjGoPPqYBcphSk15btDyhDVSnuuZO5mBI7kGOdX+HMHsAOZThqAQ4TUrT7wQ8KynUiEABd6qYWJvsXpykFHArrANQhbKkKMDvJIGiPaEN+fMrrmCaH6uBbIZJa3EkfqUBK0a8hv/1BnV8lKD1yDcs8pF6TIJ5lZPlLhqfZ4KXWwVL70GiMYqaYLqksvlBvCNiQXM7eLM229RkA0iQfU1Wlcr9DuiAzOqcRWESSIfx+MqgCK0aHEVnmDBA9DdfhgPa0eJSVnrlwmuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOSGsZDxppxXuG3OP3ozNYuau4kuLMUEk6Y+Wbde72w=;
 b=KWPM3q8xuxApXSwlJrMpU2/w5jrIuO7DzdCKI22J3FwNfv9xzn5zzaRf2OTRWnNoQoXXbMCKSfPegoWHC71DDjbFHvpIhu2YAQtjDTFMxhEdq7VeCiE9YrR0bvJht+PKnqRLIRbTBoTYvz3016DrhgKK1EY5uWmfI4lzgjnxYTZXhrxcmxQVNKAuwX2/iSIKNIJGE+p8HCDGb+Ucw1IAcfa8i12K45HkdEoDCtZE/NCw5qUCAo8Gi6T/QdpQnax1J9s4SzvEAuW5G0s4wKD3t5ZDz8LmxOU8qd73cLP/6bawMKdJOAN+M9oENkFYp3G3CEgc58P0bnYV9aWbM/0LVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB9224.namprd12.prod.outlook.com (2603:10b6:510:2e7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 11:41:54 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 11:41:54 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v12 1/3] boot/zynqmp-firmware: new boot
 firmware
Thread-Index: AQHauL+w9GZ3wdE+SE+CYlYttlT1wbG8KJkAgAABZoA=
Date: Fri, 7 Jun 2024 11:41:54 +0000
Message-ID: <CH2PR12MB50048016F541CF04370E8D2AF0FB2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240607094705.1962913-1-neal.frager@amd.com>
 <ZmLtkiOdA4tRJrLb@landeda>
In-Reply-To: <ZmLtkiOdA4tRJrLb@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB9224:EE_
x-ms-office365-filtering-correlation-id: 23df46a8-dcf4-4fb7-7aac-08dc86e6d479
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|366007|376005|38070700009|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?WTVvOWhkZENiQm53UEFhbWdYb21aa0Z1NTVtM2VFTGk2WTNTdkFzNFZHRktS?=
 =?utf-8?B?SHczRDFIYkpFdHo4VlN1YlAydzJwZWJ3SzhQajBiYm1QTGcrNlpGSG5FTHlm?=
 =?utf-8?B?OUppYzhpZ3VQcGZSbnlieStEU2xWQ0tMbUlEaW9xZyt3SWN2anNRRktITm5V?=
 =?utf-8?B?d0NldjNzb1M3N0FFZ3R6dEhHV1JsREdrYituM1gvaUJQUVQ4eDJzVW9LVTMr?=
 =?utf-8?B?clZtQ0d2QXNCS0tkVWxLaWN1NUxhTnd4YTlzdlV0UUlaNHJrdGRDbjdoTGV3?=
 =?utf-8?B?WjRHVkhPZlZSUEZ4OEE2TmdTZlcxMjVTRUh6THl1NGlyMndDUjU0QVp6Vm00?=
 =?utf-8?B?MWNmK2w5SnRUeVovWExsNytoc3puWi9ld3Znc2c0cnVKVWZoU1lVQjZFMFBt?=
 =?utf-8?B?eGNqYjhNWFZFeVRUd0dxc2xsMU5Kb2NYNXJHMlNUeUZzblN3bkd2NWMxcGVU?=
 =?utf-8?B?RkxhaGR4MHV2YjJvWkJOcDdHL3JHRjJBOURvbzYyc2dDQzA5a3JidG5zS3I5?=
 =?utf-8?B?YXJmeVQrb1VuRHB3MUxKMm1HWXJlSUIyNjREcFNMUDFYK3FZT2xZQWpzT0FQ?=
 =?utf-8?B?bnNUakdwNEFrUEM0NjVEUU1wOXo4UmwzU3VQRDVScTRqNlJvUVVlNCtPQXVC?=
 =?utf-8?B?TWVQV29QRXo2aUR1ajNxVXFLWm5WSnF4Yms3Q1VOWUVJWFVoMXdtbGU0N0NC?=
 =?utf-8?B?dUlMbkxhTXgvVDllNUhMc3NsVmljK09zVnFUUWl5K2tBem1TcVNidlFuK2li?=
 =?utf-8?B?SFB5a0I4ZEdJNWR0K0FmNjRTaktXZW1lajlQNWNHVmY5WDF6eVVSaG8yNTBn?=
 =?utf-8?B?a1M1bkppVXY1UkFmVStEZWlFRUlsZlNlYVl6UWczb1J2VFVoaVFKNkh5eWhs?=
 =?utf-8?B?TVpnVmRqTXRBWjNQbXZRazQwRkJmdU9zeElodmNyRjJqcnUyVk1PNW1DUlNN?=
 =?utf-8?B?RWZPK2h3NzVNK0VCVHRweWtkSGdYV2lyYnh5aGNGdFpNVnd0bTZMc1VPczkx?=
 =?utf-8?B?K0crSnJsQTFkUEhrTGFXS0lwS0h4c2I0QXBJTmhkWmVhUUxyYVpsWU1Zbk92?=
 =?utf-8?B?QUk5K21yR1ZFM0FIaytsQlRVL3oxckhOLzZza3pBOWpxSWR0MzNPaG8wUjlO?=
 =?utf-8?B?RFlVNTI0bjZkMEdpQkRWT0NCL1BqMlBwNG1Ta0l2eTVCYXFObXZaMllDdHdh?=
 =?utf-8?B?ME9IVmUxSWtPYUJJNW14dWpHdGxBNlZtZ2dWeGcrTzNkOUpGdkhiZ2VrcGxV?=
 =?utf-8?B?NUYzSldxTEEwZ21tYUlQUEtrUWplZjEzVXkySWJudUYvY2t2TElRWHBVRzdw?=
 =?utf-8?B?Q3A0anA5cHBzRkJocVVoWmhicVNkbFo2aEE3bTFMUkRBZ3gwQlM4N0c1TjBp?=
 =?utf-8?B?dUwvY3M2bHBRNVhCVkNBL2s5OUN4dUovKytlWWg3cDZSSEZGOWpMUFc1TFNC?=
 =?utf-8?B?ZnlLRit1cG5hUTNScGQvR2l5NmFMbllyV1c0dXl1OG1nSllhRU1tRFdudzRH?=
 =?utf-8?B?d0U3Y2NFZlRjKzFLVURleEtIL1o5MDQ4d0t2RUt4Q0dUOHEweWZRSlgzQ3NG?=
 =?utf-8?B?czF6N0hyZ0U4cEJJOXdkVDdNdUtFYXFvQ0lRcXJqaFRweDJxbUE4OUpCS1VK?=
 =?utf-8?B?Y0hZUlhhS01KV1dWWmRyMzJoOUZlZk9xQWVURnZxczFyZzVkOUFWZ0pOZDBW?=
 =?utf-8?B?bGJha0k3U1FjWHl3VEN0MEZoNmJ5VnV4M25jb0gwNERDaUswMFFRQU0zQUIv?=
 =?utf-8?B?bC8zOElGSFJiYVVRbmxyRVhOVTVCTXBJbHY3VkVnOHhqOXBUa0lwZXBFL0hN?=
 =?utf-8?B?TXVjbzJoMkY0aG95dWNIQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFcrVEVBdXNBMkVydDdpd1IxMlBLV1dJYzZKbGV5NVpnZG9jVVFpeUl5ZG9G?=
 =?utf-8?B?MjhFazJnRnU0SzFEc0M2UHpudlBVVW9SVWJYTiswWnRnUVpTaFFwYXg2dkI2?=
 =?utf-8?B?RkdKeFd6Yit4QmROOXJiWTB2bkdtMDNKZHdJQnNpVEtCSGViQ3dBWVZWL0Vn?=
 =?utf-8?B?K1dydkoxUXNuY1pvZERWRjdJUHlTY1RlM3pnWEpsdFNVK2ExVEljYUNUUVFo?=
 =?utf-8?B?OUhiVmc1Q2RwYVg1OGxyZWMzNjlFTjZBenB6ZlZaeG9hSC9BOFE4V3pQSk9Y?=
 =?utf-8?B?R1ZHaktGMjFBazJ3SjRuV3BWYVRWbHRXcXhXY3lpVnJRYm9rSHJKeGk0SlJM?=
 =?utf-8?B?cWk4Vk92N1dKNzFLM2RHdUJ1V09HYUNZYXI3Sy93OUdIY3VFaVJtTUMrUGlp?=
 =?utf-8?B?MVBlMDRVNUtybmN5bGVOYlFmWXU4aDUzU1plMWUrNktIZTRuTnF4WDVSaDRZ?=
 =?utf-8?B?T2Fna1lSUjhTVHpDbDB6c1RkRmhKZ3pSYWxwWlh3NEIwOTJFL1hOcE5ySEZo?=
 =?utf-8?B?ZFhYeEs3aFAvSHJQUGRtSitLRTIva3BEc0I2c0VEdFA5NEcyY0swb3hOTFo5?=
 =?utf-8?B?aS9uRkNJNERsUjIySnZpcVV3bU1qYk1HbEZVRnRDVGl1RlFKNlZGbUthZFN1?=
 =?utf-8?B?RWtWbU1OREVGbmRWekdjcDJzQm5oU2gwM045VjdwK0J4TVNpdXRQNEd3MXB1?=
 =?utf-8?B?TmcrTVpLVGtsNlJmM2hHRGI1T1QrcHZiSUdwRnh4STgvdFc3NktEN3RNVUx2?=
 =?utf-8?B?TDRhaHRCaXVzY3NPVnRKNDdBR2FiTnRsQ04vV2lDc1h0bGZ5VW91NEdIMmsw?=
 =?utf-8?B?UDJtYTBLd3RrVjRqK0RWMVk5cWJWdHBoWWNncnkxdlFvcHVvTUFianF6SS9H?=
 =?utf-8?B?elNHTkxyS2lCdlRYeWFMYVQ3N0NXanFkVS90S0xvQ3ZCSDFsVVNTUTd4Mm1K?=
 =?utf-8?B?WEdETGdqcWVpRXY5TjhVSGxSVldQZjAyMjNJZ2p0eVdGOTZjQzVPRUdwVU5i?=
 =?utf-8?B?VGQ5OTl2Rkt3ZHhyUkNGNlBsMkZma0JPQkhVRDMvN3daM1hOWmJVUURhWnVx?=
 =?utf-8?B?NWNWdDVPcDEyRXNaVFUwL0NnZzRURkVsT3lkZStjd3pPU3RrRHY4OHF1TGdy?=
 =?utf-8?B?VGxYS1FTNjRaT3JBRzRHVDhkVnJHV0hpZ3V6SmVTQTZUWUFsWG9UOWpndmlq?=
 =?utf-8?B?cUZZZWJ2UHFMb3A3dHRPd2NTdDFrQzBaT2dBZnZiTEhWTFpMYm1xMFY3KzBI?=
 =?utf-8?B?MVhyTGkxMGgveWU3VEdjSkd6dDUrcE0vWE9aZVFvNExnVThoMDQ0RmdBQ2VU?=
 =?utf-8?B?ZlVCbnhiZlhPWDhtM2VzVk1aVElDcDgvak1sZjVrYllqeitQZXhWT3FmL1c5?=
 =?utf-8?B?ZXR5aXgxZ2hBU3ZqbE14eGlVdHc5TlZRa0lsV0IzTjJ2MFRNUWJoaW44RDQv?=
 =?utf-8?B?RHpvN2puZmQrNlRBZ0NDMll2Q0QwVXhyeTNyM3YwVElkZHZKSzhQL0JVYkNO?=
 =?utf-8?B?R0ZaSmlXbXZENjh2THltVEIrMFNvbG1kc3VlMEk0SUF6cjNxd05DRDlzOURy?=
 =?utf-8?B?UlVFcWQvOGkvT0hKWDRsSkV6MHduT0p0aTVON0h2NnpPbURRVnlOZjQySlVz?=
 =?utf-8?B?djdwQ1czbzNSUWtxMi9wdm8vRkU3bHRlQjdZc1RZWnNUa1NuUFprUC91R0Z0?=
 =?utf-8?B?MnJNREcyMkt1YUYyOE80Tkp1WGNIQjlCS2FnTmlUb0xoclJvNDlpS2xKb2VO?=
 =?utf-8?B?TjZFZlVrUG9BUFlHS2x4WndSZk02NmZHWlZTQzg2aThabnJBVG5NOXVjNXFv?=
 =?utf-8?B?b29VRlU3UnFYV0M1NEZFNktBME9NdXpCVmVQSjFqeDBORm45ZlVFMDBBbHZr?=
 =?utf-8?B?bmFIdU8yTXk3Lyt3Vk5pVWlUSzJXdkJ2OW1xRUpLZ1dqNWEzRThkL0cxVld0?=
 =?utf-8?B?RTZsdFdieGhSbmpvODYybndXRm1McU4wZExYSVE2RmEzRjg3cVA1Wmo3Y0la?=
 =?utf-8?B?eVdxbDZMUnpVeW1JRVJHb29ZUzg2Z3htOExjb0ZOdEpsQlM5cnd0MlFSOTY3?=
 =?utf-8?B?VU44V1Q0TzI1akUrNHFhUUM0U05rcWFhZzNVUE5xWXVkNHFUSzFSVVcxVG5X?=
 =?utf-8?Q?aNRg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23df46a8-dcf4-4fb7-7aac-08dc86e6d479
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 11:41:54.4928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zfFPSFkv5xVfMdxm3gPDEhZFHDCqrhVVIl/fGU6OjwuCUPURHNdhicpJcEmDRMBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9224
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOSGsZDxppxXuG3OP3ozNYuau4kuLMUEk6Y+Wbde72w=;
 b=Ms9oDDumV1xjCooUwnXvePCKeyWUR2slNfRSEsWnPZirwN+Pxk0FioH0T0l2tlIjy+cwHZ0JMPoEqY4oZWXXVpgfylNPnB2zTZoom8q9RcHiSV3BYkflPwcBirHxPn1DG7ulWfLGh1I5GdODv9Kh5Gr3VeSG436z4xRu1y/7D5E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Ms9oDDum
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v12 1/3] boot/zynqmp-firmware: new boot
 firmware
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, all,

> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> [--SNIP--]
> diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
> new file mode 100644
> index 0000000000..478d58d552
> --- /dev/null
> +++ b/boot/zynqmp-firmware/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_TARGET_ZYNQMP_FIRMWARE
> +	bool "zynqmp-firmware"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
> +	help
> +	  This package builds the PMU Firmware application required
> +	  to run U-Boot and Linux in the Zynq MPSoC devices.
> +
> +if BR2_TARGET_ZYNQMP_FIRMWARE
> +
> +comment "zynqmp-firmware needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"

> The comment is in the if-endif block, so it will only show when
> BR2_TARGET_ZYNQMP_FIRMWARE, but the conditions to show the comment are
> the opposite of those to show BR2_TARGET_ZYNQMP_FIRMWARE in the first
> place, so the comment will not be visible when BR2_TARGET_ZYNQMP_FIRMWARE
> is not already available.

> So the comment will never be visible.

> So, either place it before the main symnbol, or after the if-endif block
> (but not in-between the two).

> No need to respin just for that, it can be fixed when applying.

Ok, thank you.

> +config BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS
> +	string "custom cflags"
> +	help
> +	  Adds additional CFLAGS for building zynqmp firmware.

> What kind of specific CFLAGS would one have to pass?

> I see in patch 3 that you are passing -DK26_SOM, so presumably that's
> about the CPU or board variant. Shouldn't we have a choice for that:

> In the Config.in:

>    choice
>        bool "Board/CPU variant"

>    config BR2_TARGET_ZYNQMP_FIRMWARE_DEFAULT
>        bool "default"

>    config BR2_TARGET_ZYNQMP_FIRMWARE_K26_SOM
>        bool "K26 SOM"

>    endchoice

>    config BR2_TARGET_ZYNQMP_FIRMWARE_VARIANT
>        string
>        default "K26_SOM"   if BR2_TARGET_ZYNQMP_FIRMWARE_K26_SOM

> In the .mk:

>    ZYNQMP_FIRMWARE_VARIANT = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VARIANT))
>    ifneq ($(ZYNQMP_FIRMWARE_VARIANT),)
>    ZYNQMP_FIRMWARE_CFLAGS += -D$(ZYNQMP_FIRMWARE_VARIANT)
>    endif

I don't really like changing this to a CPU variant because it is not an
accurate portrayal of what we are doing here.  All of the zynqmp devices can
run with a default build of the pmufw, regardless of device variant.  This is
why the zcu102, zcu104 and zcu106 all use the default build, even though they
do not have the same variant of the zynqmp on each board.  For example, the
zcu102 has a zu9 and the zcu106 has a zu7.

However, there are a ton of configuration defines that users can configure to
customize their build options which are defined in the xpfw_config.h header
file.  This is what we are exposing by allowing users to enter their own
CFLAGS to configure these options.

https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h

The Kria SOMs are a special case as we enabled some of these specific defines
which are needed for all Kria SOM based products.  If you look at the v11
version of this patch set, you will see a long string of config defines.

Since these defines are needed for all Kria SOMs, I upstreamed a solution
within AMD, so that users only need to define K26_SOM or K24_SOM, in case
they are working with a Kria SOM, and they will get all of the defines that
are required.  This is newly included with the 2024.1 release.

By having a CFLAGS option, users can then add additional configs regardless
of whether they are using a standard zynqmp or a Kria SOM.  It would work
the same in either case.

> +endif # BR2_TARGET_ZYNQMP_FIRMWARE
> diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
> new file mode 100644
> index 0000000000..dafb2dbe55
> --- /dev/null
> +++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# zynqmp-firmware
> +#
> +################################################################################
> +
> +ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_SITE = \
> +	$(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_LICENSE = MIT
> +ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
> +ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
> +ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
> +ZYNQMP_FIRMWARE_DEPENDENCIES = toolchain-bare-metal-buildroot
> +
> +CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))

> All variables must be scopped in the current package "namespace" [0]:

>    ZYNQMP_FIRMWARE_CUSTOM_CFLAGS = ...

> No need to respin just for that, it can be fixed when applying...

Ok, thanks.

> +ZYNQMP_FIRMWARE_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
> +
> +define ZYNQMP_FIRMWARE_BUILD_CMDS
> +	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(ZYNQMP_FIRMWARE_CFLAGS)
> +endef
> +
> +ZYNQMP_FIRMWARE = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf

> Ah, I see that the check-package hint is not very explicit. All it says
> is that the variable is not properly scopped, and what it reports is
> the prefix all variables should have:

>    ZYNQMP_FIRMWARE_PMUFW = ...

> ZYNQMP_FIRMWARE is the stem all variables should have. Sorry, it was not
> clear enough in my previous reply, and the check-package hint is a bit
> misleading... I'll send a patch to make it clearer.

> [0] https://buildroot.org/downloads/manual/manual.html#_tips_and_tricks

> Since ZYNQMP_FIRMWARE_PMUFW is used only once, is there really a need
> for an intermediate variable to begin with?

> No need to respin just for that, it can be fixed when applying...

You are right that the variable is not really needed.  I did it originally
just to keep within the 80 character line budget and look nice.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
