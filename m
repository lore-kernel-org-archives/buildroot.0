Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BF8E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 14:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8212610AB;
	Fri, 13 Dec 2024 14:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1nP-ziYCYpM; Fri, 13 Dec 2024 14:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ACBF61450
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ACBF61450;
	Fri, 13 Dec 2024 14:41:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBB72ECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0A6D8146B
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t99YsmCLlfge for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 14:41:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::60f;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B77281F8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B77281F8F
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::60f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B77281F8F
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:41:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbU7buuCsMSZxW4RRnQw8dj2xvX7/XmNpH8X5A9lLAiYag7k8BBwcxwdFCvlvK8MJuzS68uxl67TEWbG3OQkJiqSJX7QvabclvGz5rCC9mHosKWucRMx3DWiPXjZtvZLW6Aukzv0J+7xt+uygZdyLySwjDYs2Ktdsez4btpEV+4dHzGcYm/3GhGPWx0WOgPas32PciWbK0HwWydghOseB2IF5nUi9aI6+XRGD/pvrYmaMUBctEkAMIZqBbZbdKBUDGIkbBUOPzNdnN23otk8uxQSLMqwT78Dfd3JCzDAnoACKFgFn0YQ0UTzeWfaLM3AscxKWaPjEGXaqNRfGWt5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFbwcbbU9HWPjWE+D2XZiYXTvQQ2bHLYx2GlvTSlZHo=;
 b=BDjgzONUxIY/yE6+sXw7O2ATVhbFsFHNFjrNuOuwI66aRl5HdKVf6r/29/T7eLMI/Qlr/LwV2CRR1JXu+RSy2dT/colfSRIJC+eUfWAbigdzNQFW9vc2ZJVHGROYq2RuQV5XpmmJ3k4efU+wTrvQOeAk1oFOLnOP1uOPf38w9jdmFqBqFIulbkGK8QZz1NRrSmK03sL3KZYxIoR93fO6miLUhTCpXWGUp3E0Dn6ekqCLuu5ThmOOmOkzjTzwRcvQM4qQgvc2IUOqIiFIZrYMQ8DHpGM3eqRkut3CFxF4i/xzkAWi3BTNK9iWnj2Ot0bZuQvcPCCui1xu7zMPS7Ch2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB5636.namprd12.prod.outlook.com (2603:10b6:a03:42b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 14:41:11 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 14:41:11 +0000
To: "Simek, Michal" <michal.simek@amd.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig: bump to
 xilinx-v2024.1
Thread-Index: AQHawTEMoyu+eO8XaUWWah1EeSt8SbLlTKkAgAAEJQCAAADvkIAAAuGAgAABksA=
Date: Fri, 13 Dec 2024 14:41:11 +0000
Message-ID: <CH2PR12MB5004666431E0926400C0FADDF0382@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240618033849.2389758-1-neal.frager@amd.com>
 <20241213150136.0c434b72@booty>
 <1b302d1b-723e-4347-99a4-c2491b072850@amd.com>
 <CH2PR12MB5004F72DCFC7CAE9556FBB4EF0382@CH2PR12MB5004.namprd12.prod.outlook.com>
 <29429f45-119a-48cf-be1a-d8f92c27f32f@amd.com>
In-Reply-To: <29429f45-119a-48cf-be1a-d8f92c27f32f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB5636:EE_
x-ms-office365-filtering-correlation-id: fcadb89a-93e0-47ef-c858-08dd1b843045
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?Nmw4Um5oWlFsUGRrRGtxUVZ4MDJhKzV4M0grY1VidHRxM1lhOE9OMm5IY0lI?=
 =?utf-8?B?TFFHc2VmRkpzWDdaVUxQeWREdUs3QVVvckxxbHp2R3NyTHR3MzdRcjVuWEw5?=
 =?utf-8?B?S1IwZzhGYXZ4OGJXOVBJSm1VNVM0U0hHTmw4NWR5UGpEaWM1Z3hBczIvNkNX?=
 =?utf-8?B?Y3I4aE9aeVVsWEtsSG82VWFhMU1IVDhRWno3QnhuM0FhVUdab2I5bjlKR3oz?=
 =?utf-8?B?WS8ydEVHSUVURDRMM2U1TEdLRHg4Q01OUWdUUjdQdi9sZ2tqOXVQM0dwQlVN?=
 =?utf-8?B?UEZEWDhYVTI5YWFZU1dwdEtxZzc2Qm9wWktNMlJ6VTNobHlVVUViK3p5NStO?=
 =?utf-8?B?M3FSNUxCSVJIK25nVmJiQjdMbUhTVEpWdDFoeFJjcjNIVW1VUTJlc3BTa0ds?=
 =?utf-8?B?ZzV4dW01NzBSQmlLZ1U3K1lhL0dHdG9hWm9OZGcwZWpyNlhwb0czKytpdXlH?=
 =?utf-8?B?Z09iK2JONFR1S29rMDM0NlpQeXI5Q2Vwc3liRHYrT3d5MzBCc3ljRE5aV05W?=
 =?utf-8?B?T09haVZqc1V2eEtuRmRqYzJBQkRWaTY4ckZ1TXVWMFBqWE0rU1Z1WmZLNVpJ?=
 =?utf-8?B?YS9nWVNSSGtqSm9Sc1lCbll2TFd6UWVSWTRLMnJvRnZ3eXUrMFhFWjBLU1M4?=
 =?utf-8?B?bUd0QjhWRHJkdVNWQWxxNzdxVHgvV0JyNDN0VVdhamFucTlwOWVjOWEyajJN?=
 =?utf-8?B?OTRvUFErMWZhRGsrR2YzaVhGSCs0TXlCTHhRQ2s1T0l6WlhDckU0amRxUEl3?=
 =?utf-8?B?UitQQ0JKU1F0NDBtZ0IvY1A5cU9MZlZUZmRoQjM5OWhWSmlqWjI3TVhLa2hi?=
 =?utf-8?B?c1JHNkFNMC95OXVUd2ZRUW5iMW56YWQwd2kwNEpKRHI4NkVURWp3UEEvYlhF?=
 =?utf-8?B?N0FiYm5UZUdpNEplK0I1ai9Jd0o5eEs5WlpleFVhZG1QNHN1bzZNUEtjUGFa?=
 =?utf-8?B?RlJsbG1EZlhMYkt2L1p3VW1ydnlYNXZ3UlBycVR4dkVwWHN2TEp3YUJvSTNK?=
 =?utf-8?B?V1N1ZE9PQktuL2dKcWh2dGRUREJRbnl3RVBIREFUMjJuNll3UDlnM0laRjhh?=
 =?utf-8?B?WkNDa2s0cVVxKzNFekVDN1U0bTVTYWk0blgxcyswZUVQNXcxY1hEOC8vakkz?=
 =?utf-8?B?QS9OVTJCSWxuMWFzemQ4VURnamsxSDVUUmx4U0ZuSysxQzhCT2ljMkpXTDRr?=
 =?utf-8?B?K1NWSmIwaGF5UWZTTjdTN3hwN2prcG1STUpRYzNYL1BrQ3NLbFYvUHZsRFVp?=
 =?utf-8?B?Tk9BMlNsM2hPU29INU9JOVZkRWRmRWU2UURXck9iU1Y3OUJHeWZBRmJpWWVv?=
 =?utf-8?B?Y215WlJvWm9pVlE2Vmg1ODNEeC9xQithNWpiaWpQL09ISWVQTWJwM1IrYlJ6?=
 =?utf-8?B?WkdDVHo3cjEvYlduUG45MVIrTUpXMUtZdkYrcHQwSXVGb0FFQWQ2MHV4TlhS?=
 =?utf-8?B?SFJLQ2RyWjYwRTRZWDdZaVFha1QwTEk4OE1ReXVKY1dnZ0hJWkRqVVA5MFlE?=
 =?utf-8?B?bXFIV0J3Qm9mQ1VUdi8wWStwWkJyL281UTNZUjlwUGZqbWtrU1BSVlBPOWpZ?=
 =?utf-8?B?dDBCUHZLWFcxU3RtYkp1Y3FpZ0xKSk8zcVZDUUt4V2hOOFhacng5eEoxbS9r?=
 =?utf-8?B?R240L3RwTXN5K3dDRHh5djcwQWEwV1pBaGIyeXVXNTAxd1VvY0s1WkNBUzF5?=
 =?utf-8?B?VTl4b0djRDNDa1hud2FudXVmc3dWSlVVQnVCOURKbEc0TDV2NDZKbHAvL1Fw?=
 =?utf-8?B?MFVqdVFsak5qZ3F6bVp4NXJITHJLOTJ4cHBDck94WHF3dFVUNk0xa2ozTmdt?=
 =?utf-8?B?dXBzMHhSWTdHejNYMm1pSUJlelZGeVdHaFV6TXlicjRGdnUyRTBuaVJEQ0Zv?=
 =?utf-8?B?elJIdVdKSkNqYWxuTzFKQzkwdkgzVythN3dzanNFbldRTVJweWJKTmIwbk0r?=
 =?utf-8?Q?42SidpKHHShAh9Q18fDA43QGlIlqEs2i?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2F6UGY1cGFCU0FWbGx5bFVZTTY2UXpCdHVvYmZMTUt1SU8zQlZIVWpEUFEw?=
 =?utf-8?B?emhScnoycGVqcUxQQ1ZrYllteit6dzN0Ym1uam9uT0RwMXJSZnZxUXdFZU1Y?=
 =?utf-8?B?NEU4Q1JxajdDcUt2czYvOVN2emwyMjBieEdkZ1gybytkRlhkYXZNZHR1WTBl?=
 =?utf-8?B?RllpOXpCVWRMSG9GWjlITlBBRndXandYbWxnNllWamZIbStYaG1oNExQS24w?=
 =?utf-8?B?ZlV4RTRhMkQ0blVZVHlNRUdLWHBNZWtCYXF0Y0U2WHBNTlFVME55akRvOGVL?=
 =?utf-8?B?aExXcXAwU0FRdEllZ0hMeFY4VVlhVnYvMW4xV0RaOFRjVEE1TE9tSG1uMDZC?=
 =?utf-8?B?dFRybnE1R096L0lxNVg1MS92L09CQm0wbnNjakZsTE5kQklVTDZXME90WlNl?=
 =?utf-8?B?eEYzU1FFWHh5STdBVEJWcFhNbm5lS2wxMjVSUUl0dlRCYnZLVnNGdXRSSUkr?=
 =?utf-8?B?dTJQS3ZCUDExZWx0QTQ5cnpaR0s0SVlwVjNCSlhpWEd3YzRxNnlMcjd3OUht?=
 =?utf-8?B?UTQzZlI3Njd5amNhL29QZ3dDV2Q4RzhRaWFnelYyeldFV1VlTjhsQkVhSlU4?=
 =?utf-8?B?SFhxRTZSOXoyVWtnWGtXN2hFcXBsTWZLQTgzS0MyUjBCRjNJaXVHWTdYRGFr?=
 =?utf-8?B?YWlWMlZKbmJ4MHBwcStxdEVNQXIzL3Jlb0JvcVBab21oTGw4ZEVIdDBpaFF4?=
 =?utf-8?B?TFZwWDgwaXNIOFcxY2p0TGtYbkQvMHU4QTNaTE5jMk1STHJLMkVPU3U4SUZw?=
 =?utf-8?B?QzdzbXRmUjJQbDZJaWUybitGeUQ0c2k4Q2grMk1EcXViSjU2U1F1ZjdhYjda?=
 =?utf-8?B?UmZPMGRzdy9lRjZlVEJpNXJWWCs2Q3VtSElLVlEra3pXaitZWHV4d1VRZGVG?=
 =?utf-8?B?M3NUejIvWG1DZlNDTDhuQ09ySGpZeEtpYjFLQTdiUklUZ0h6K0FpbE5DNHh6?=
 =?utf-8?B?UFU0aGJYVDJVRTJ3OUlORUQ5Y0dSQnAwNmdGTkhoekFZbE9hRFNHS0cxK3po?=
 =?utf-8?B?ajkwSWZyNkVObHZ1WS9xRUR5eEVRNW55MEwyZXJKdUkxbjhwOHpZQ3AzNEth?=
 =?utf-8?B?bWRScE0rWS9oMm5EQ2JxZnExNW1NVEE0WFE1N09KTUJ6UHliVlU2aDlZRm9G?=
 =?utf-8?B?UVlXSk1mdm1KUFdaMzNXbTNRTjhaamZsUkpFc1p2Yy8zL2h5YWpjaEZFVGF6?=
 =?utf-8?B?Zm1yTkk4SWZ2WW5OaGNWV0lMZU5oZy81cEFQbytqekFEbmF1ZWUyU3hoRXFW?=
 =?utf-8?B?enFpRE5vOTdIT0VuU2x3TlJxK2NKUG5Ib0NjeXJTZXR6Nit5N1BQdVB2RFMx?=
 =?utf-8?B?Qk1mRm1sM3RZYjAwS1N2aDZJajMyVTYyT0QrMnozdHF2S3k3OGp2cmRtT3Zm?=
 =?utf-8?B?NUl3UlFleng5TW1NYy8rUEZ4QW1rMVZ5Y09lanRzQ2dreE16M2kyUTRaeHhz?=
 =?utf-8?B?N3ZTb0ZueTBxb2JtOC8xbkJkTmphZkZCbzdabGQwaWtjdVYrcTlhTGV1TlJh?=
 =?utf-8?B?WGNaNjhaSXQ0QmNZaTlORDF3ZkhHVEdOTS83clRmdXdaYmQyald2eFRBWUIz?=
 =?utf-8?B?R1hNcmJkQTZmQldHdmt2bFUyWEU2OVc3QlZxTnJEY1Vvd05NYzg4dkdZWnBI?=
 =?utf-8?B?WXp0UG5rMjgyMzFCM0JBZEY4M2VRdjA4MjVld3VEOG51eGVJMnJqUEZBSEpH?=
 =?utf-8?B?bWpSOGd5eEVLM2Vva1hrUW5IMmdVY0hQaFJJU0k2ZlVhNE1YT3Nkd0NjbTFo?=
 =?utf-8?B?dkFlTGtDanRrazc1MWxiam9MSjNsYjNJS0dpcEVsNFJpSWoxc0RJZEhCRmh0?=
 =?utf-8?B?b21vdHlEalBISkp3S2NYbDZjc1JrNmJzc0NlRWtRSVFyV1dHbE9YdUtQZS81?=
 =?utf-8?B?WEtSQ1p1bVcrVnk2aHpOK3BZOEhXbGlmcHRMVm0xbnI3YVpCOUgwcXluUzcz?=
 =?utf-8?B?N1BUVlE0akJCa2FvTzhOSkZBNHpNamZOM29FWU1FaHcxV3Eram9lRGxsZW9C?=
 =?utf-8?B?REZlSTFDdmFGTHpSSXJkM2RRL3JEV2FjRTByVXZLR3VqQ0F4bmM3RE1NcTJW?=
 =?utf-8?B?TTQ0SGFiNUJSNlo3Y2NDU2NkWm5rdGVpcnNveXJLdklnOTk3ZCtscU1YWVBC?=
 =?utf-8?Q?MLnM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcadb89a-93e0-47ef-c858-08dd1b843045
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 14:41:11.5820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xRfNvnHI8x4N6u6BeMXSh7wTjbOMYXUITQwWEHCE0kiZ/drh7rZ8ETR9k0umCfb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5636
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFbwcbbU9HWPjWE+D2XZiYXTvQQ2bHLYx2GlvTSlZHo=;
 b=jlnks2/YzA2oc7UlBzkr5y16VChhs2Cmtvauq4cDNLgCJ0Jr6ndoVMvsgEzTdkdQp4LPnQ3W1M6jRzfILGeoAFR1pMQUYk6M+gV4tPrQYPXHLr1zdicJJVSPPsKlNrum8AMJukpZYC/I+SsKeJJwxvLpFGP86olUw5ecA+bTilk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jlnks2/Y
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.1
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michal,

> Hi Michal,
> 
>> Hello Neal,
>>
>> On Tue, 18 Jun 2024 04:38:48 +0100
>> Neal Frager <neal.frager@amd.com> wrote:
>>
>>> This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.1 which includes
>>> the following updates:
>>>
>>> - Linux v6.6.10
>>> - U-Boot v2024.01
>>> - ATF v2.10
>>> - PMUFW xilinx-v2024.1
>>>
>>> Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
>>> needed.
>>>
>>> With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
>>> the offset between the base address of the boot.bin and u-boot.itb instead of
>>> a raw base address of u-boot.itb. This allows for A/B firmware updates since
>>> the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.
>>>
>>> Thus, Kria SOMs come with the following QSPI address table.
>>>
>>> Partition A:
>>> 0x200000 - boot.bin
>>> 0x280000 - u-boot.itb
>>
>> Now I realized there seems to be an issue when using the flashed
>> recovery tool to upgrade boot.bin and u-boot.itb. The SBIRT recovery
>> tool does not allow writing at address 0x280000, thus using the current
>> flashing procedure leads to a non-booting system:
>>
>>     U-Boot SPL 2024.01 (Dec 13 2024 - 13:41:04 +0100)
>>     Loading new PMUFW cfg obj (1836 bytes)
>>     PMUFW:  v1.1
>>     Silicon version:        3
>>     EL Level:       EL3
>>     Secure Boot:    not authenticated, not encrypted
>>     Multiboot:      64
>>     Trying to boot from SPI
>>     SPI offset:     0x280000
>>     <system stops here>
>>
>> Do you think my understanding is correct?
>>
>> If it is, I already have a draft solution, which is basically creating
>> an image just for the SBIRT tool, based on:
>>
>>     cp boot.bin sbirt.bin
>>     dd if=u-boot.itb seek=128 bs=4k of=sbirt.bin
>>
>> Do you think there are better solutions? Otherwise I can finalize my
>> draft and send a patch to Buildroot in order to generate a working SBIRT
>> image from Kria defconfigs.
> 
>> not strictly following buildroot activity but I expect Neal has started to use
>> binman which is enabled in u-boot/next branch which generates qspi.bin directly.
>> It places based on kria defconfig u-boot.itb at 0x80000 offset.
> 
>> And that's exactly what you are trying to do with cp and dd command up.
> 
> I was aware of our migration to binman, as this will enable us to remove all
> the kria post-build u-boot.itb fixup scripts from buildroot, but I was not
> aware of the qspi.bin!  This is excellent news.
> 
> With the qspi.bin, I retract my previous email.  When we migrate the kria
> defconfigs to binman, the best solution is to use the qspi.bin in the
> genimage.cfg as this file will work with both u-boot and SBIRT flashing.  We
> will make sure to update the readme.txt accordingly, as well.
> 
> @Luca, that said, I think we do not need your patch.  Once we have the next
> u-boot release tag (it is coming sooner than 2025.1), we will have binman
> support which will clean up the SBIRT issue naturally with the qspi.bin.
> 
>> Regarding recovery tool. I have recently seen one target where Image Recovery
>> application (when you press reset and fwu button) is not able to program this
>> boot.bin to flash and reports incorrect CRC and programming is not happening.
>> It looked like it was any old board with some limitations. When image is
>> programmed from u-boot itself it was working properly.
>> Can you please provide some information about your board?
> 
> I don't think this is Luca's issue as we do not yet have a u-boot release tag
> for buildroot that is enabling binman.  So Luca's issue is that he has a
> boot.bin and a u-boot.itb, and needs to create a 'qspi.bin' or 'sbirt.bin'
> post-build.  And there is no way to write the u-boot.itb to address 0x280000
> with SBIRT.

> ok. Just keep in your mind that older SOMs could have an issue with flashing 
> SPL/u-boot.itb in one qspi.bin image via image recovery tool (that standalone 
> program running after FWUPD button is pressed).

I will keep this in mind, but do you have any more details about it?  I am
struggling to imagine why the SBIRT tool would fail with the qspi.bin binary
on older SOMs.  Are you sure it wasn't just user error?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
