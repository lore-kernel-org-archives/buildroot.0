Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0BBCCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 11:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6522E612AF;
	Mon, 27 Oct 2025 11:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzirpUt7Fwqx; Mon, 27 Oct 2025 11:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2440612A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2440612A1;
	Mon, 27 Oct 2025 11:46:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A7D4976
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 11:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11219612A1
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 11:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZzEFtc8BeLi for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 11:45:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c101::7;
 helo=bl0pr03cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E4DE6129D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E4DE6129D
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c101::7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E4DE6129D
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 11:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtkJ7dYJnWr45qhTZuXeUuJ2rVRd5LJZ53UDG580YvuHcfJbaQ775maFr7c2ftnzy+nmzNA8YXgl/oTGElVfOioMaRjuBJlJtYnjJHlFU/t2QvEmvoGAuS5OBLK01U39JJpduO0VIZ/qiVGZ7aJjdLaiLHMG34dVTQZ5BnEHKN2rxU1fWiAXN9JSSoAvckIi479LYrs5fzY4GE8OCgWj2bfGh/YcZPH8HZSZ2FlstOy/qRYOJwbOR2KYBScSSYbtOTP2hnoraNMWnEGc+tF35bVWfObw+yJDN45GlUCLIV3CqSDTzDDtKBo6kIMghnR0DaRH5bdhqkUjuQqGFYGOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvPWitdRJvJWYLIw2ocnoUuB5bUwR7fh1ZJv7JQ8Q68=;
 b=f2H0WzSj8hJo/pmSB5i6WsOWCnm7J/gmZ/O+VtDxlSwL6n8Ci0SCJ+VZizh44CfRRo6BHkYfGZtfo8w+gAoedtUfJIRll28j5sqgNaOY/6cro3tkyfqL8kPZgbvGnYe0Rp3M1NiHNtBRV77vxrLIwyXVPZ4bfCWegPY5m8UnyHb+ijCILz1v8st/MJZLe3GIB3Qa5NXNnfXy7TaqZGIB/aSgUWtmpWdfNAwZuzHM2CAPSdXnEbUJKxSjn09+nkNktWhkT9f3ybU+yMXkJcn+onAWIrhfeMwwfmUqz9tCbV/1jxgthknmB9MNqg8rSmoZA8LE35MaLRnZIJLhzBRD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 11:45:53 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 11:45:53 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] boot/xilinx-prebuilt: add local versal xsa support
Thread-Index: AQHcRbXY0JHQpMLUxkeD5w8DfqbO2LTVu8uAgAAmbtA=
Date: Mon, 27 Oct 2025 11:45:52 +0000
Message-ID: <SA1PR12MB5615F83A12AD092C2590B6E7F0FCA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20251025134655.1068839-1-neal.frager@amd.com>
 <DDSZVS4QNIJ7.3TPH8C5KHSOF2@bootlin.com>
In-Reply-To: <DDSZVS4QNIJ7.3TPH8C5KHSOF2@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-10-27T11:42:50.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DM6PR12MB4481:EE_
x-ms-office365-filtering-correlation-id: 81ef2963-e7a0-481f-9a07-08de154e6217
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?d0VsMFlISnBOcDBHTElqSlkvQXJLT3AyUGU4MUQzZW9NMVB5enlsMDhGSGdo?=
 =?utf-8?B?R1ZITC9icmtTdzBOVUVKNTd4Uk1pWGxlMVp0ZEJFYVBReEwza0dkQnkzMnJE?=
 =?utf-8?B?M0NpbEp1azFqZk8vWWtBTE5DZXZUTjQyU295dGRMdjJOZEhSSGJZckw4Y3ZZ?=
 =?utf-8?B?bHV4V3Fla3RwdjB6RE9oZWlJMVlvOHhEcm92T2w4R25zZTRMTHFaS2xTbkYr?=
 =?utf-8?B?WjBZekZqYmNwcUhCSGJMMWRLK3dEdHh2NGY2d0pmb3RYV05IN2dOajdsUHVt?=
 =?utf-8?B?Zkc2bUpabFFjWXRuam9BeGVqQkQ2VXV5emZSd1cxNjNBUndDOTNjSEdDbHlu?=
 =?utf-8?B?SWJ2ejRhUTZpeUEwTkk5UjRwd1pJaCt0Vm1VUE93RFZ2ZmtSQ0hxRGdiR0lW?=
 =?utf-8?B?QjMwZUthTitteXBUbVZSU1FXL3NUVU1lb1VjYVhXN01NcmlpazlRWFFBRnQ4?=
 =?utf-8?B?Mk93UzdDUTZhaHUxaGlkdnc3WlNQOUdWT0Y3R0M0SWRDbmQrL2ZldHkxYkxu?=
 =?utf-8?B?TVZXQjRMbkUzbmFFK2puNSsrUlpxelZZMTFtakZZT0hKWnNQblNjc0RXZ0la?=
 =?utf-8?B?MWFpSkhhNVBFQ2x2SjdzZEYvYmNsWG1FNkYvSjFyZlVaYm1mb3RUTkV5NDRN?=
 =?utf-8?B?Z2d3czdCZ2ZtazcvOWxJb0k4Mzc4Tkg2SU9PcDlvS3BYcnFwQWJ2Vlk5N1cr?=
 =?utf-8?B?ZzFLdUxRVlpNQ2k3cTAvWlNPZmE2R1N2SkVTMWIrUi94SXMxdDZ6a3AyZkp2?=
 =?utf-8?B?cEhJZXgwZzFiL3M4R1JBRmU2REtiTXVXNFRtMVFWYS9HYUlJU25HcHg4L3Uv?=
 =?utf-8?B?RmZ2L25XVVdIaXBpMkdHMEZrRWphdFRDYkR2TEJpTVoyRDRMdVhoeVBNMXdw?=
 =?utf-8?B?dVFGVmFPc2w0UHZMRklPTjRwUk1QeDFMTnFaQVNJdk1BdWIyNHJLdktYb2o3?=
 =?utf-8?B?VHQ3U2tPYjd3UGdnMjRSUjFGZ3hScGwrMGhYZHpHMkVCM092QjNrZ1hwOEZJ?=
 =?utf-8?B?ejF1MHo3Y3cxK2czTHlTa3Y4MkhNSFI4NUVaWStDcWJYZ09zNmU2eGlsQVVr?=
 =?utf-8?B?TkdFZWhpeVlWRGJ3ZWFyYXBkVjB2bWM3SFhQVFpXaG5OTjFRWkZQcDlzTEhS?=
 =?utf-8?B?b3FqcGROKzM1bjhWZktrZlZXaGtXOEEvdXJKOHBTZ3EzbytJOXNNd0l2UTZi?=
 =?utf-8?B?enJ0MkpnOWhxaDVjTmYzcjk4VUhhcEtFdXI4eGJlUXRoS04zVU9UbEFSQS9I?=
 =?utf-8?B?c0ovaTJxZys4RVZ0ZDRvcGtVM3hBZkZaMk8wTGdPcUg1RjE2a2ZXc043T1JZ?=
 =?utf-8?B?OTRHdnlyUStMcjJrUVFhdW43V2lEb01XQ0JNMXdLZFM1N3pjUmpHTkx1TlZa?=
 =?utf-8?B?dGdPdGJDUW9BeExFOEt5Sk1EOEhTS2JweTc4LzhwZ0FZdmdyWWdmeUdTVGV5?=
 =?utf-8?B?UXVXTnNkTkw3TVpoUHM1M2dNa0oxYStnRXVCSkxYUFdmSFZIQWFEL2xhM3o5?=
 =?utf-8?B?Qisybmo3SjdwZGdJakhQYWI4UzFlSXNpNkw1ZjRNa2FVR3J5dm1Kb2hpWGt2?=
 =?utf-8?B?Z0ovNWxzUG0wY3QySWFVZ2RNM3Q2Y3czWGRvV3R5cHJ0VVhvT0JnbG4vV09S?=
 =?utf-8?B?WGU3MU1XMUlwQ2RHMWs0NWMrZFpDTVp3aWc4eHNqM3lXUU01QlFzWmsveGJo?=
 =?utf-8?B?RDBobTVPS2FGQzZiQkdyNEk3bFEvVEswQTkzdmZTK2hxQmpzMVdJMGRjVmJm?=
 =?utf-8?B?RTNWSzJOYlpyeWx4UlZlY3FlSFBzNVhvdUZGTXpCeTNlcWlyMDBUV1l5R0ha?=
 =?utf-8?B?MnQ5QnAyQ3FUdTM3VXp6Ukt0QzJScGpuek5WQTU1VUtVN2VOaVowTGhxaTRH?=
 =?utf-8?B?SXNQNVBKdjZkUTZxdi83YlJCZ3hOZkVNYURJcXJTUm8zWk5NQnhDZDZLNU91?=
 =?utf-8?B?a0ZRUkNrRlUzaXF0ZDhMdDdIbE9DTUhrSGRlb01pMzhucURsZXFkenU0MTlH?=
 =?utf-8?B?eHlGT085cG9xRFJGVWN0Ni9KWEsycGFiaUlhMUN4Zm5rNkZrei9tcW1mUDJD?=
 =?utf-8?B?WGtlbkVvb2pCNE1uRUhtcUhTQlNnM2NhYTA4MDJmM1ZkUGl3cVpVMnM2SlU0?=
 =?utf-8?Q?9wQk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2Y1b3lQWnVubXoyVWpvMEVjU0s0QWg5LzFSOEozNlpjcjhCTnFza3NKV0VH?=
 =?utf-8?B?OFZNZkNidlQ5bHhGd1JPOGQ1dFFVMlBJTmZsNzJmVS9oUnpra2ZJY29EaUEr?=
 =?utf-8?B?cDJqM0RVamE1NFVQWVk4MnBhUHQrajlRVWVaQ3hBN1MvNUlBdFVPZlBUVkdm?=
 =?utf-8?B?RURYcXdCb1RjbHJiWmV1aGs3Q1ByTHdMRGNWNDRtWlNtVUY4NmFVWllaVzFV?=
 =?utf-8?B?YTBYcWlTU1V1M0xnODRjRENoZTNFYlQwRHAwT0xvdG9tVEZadzRLMXBLeG8y?=
 =?utf-8?B?aXAyTkJXVlZwSm9DUFZIenUrVkFSOSttVlFSTjlmWHJkTWN1YUJMbUZZUkha?=
 =?utf-8?B?SnM4LytTVUlFZDBSZGQreDdoVmRvUnhoS2tXWGk0enpoVTdJUGRxUHNWQ2Jk?=
 =?utf-8?B?RnRiVG5pK0REdkRBYThkWTVBMS9lRXR6WlVjT0dxNWNnRzNHOUFYZXpvL2t0?=
 =?utf-8?B?cWh0Zm4zM285MC83TStIYlRCQXZFOUVGSWFTZVJyNHU3TjY1Qm9QaTd3dlpU?=
 =?utf-8?B?SmJiaVBaV0tvWUNLOHJaVUpqWFVmZm5iNzZ2ejdISTRBdkxQYTJ0WDR1MHg3?=
 =?utf-8?B?OHlwVWsvRVY1eUJwdnNUUjR4NXBsNlc0RTlYTyt2N0dRUEo5Tnp5UzBxbHh4?=
 =?utf-8?B?ZEpvL1ZFaUd0OXExNkZrOFJmb2xsSlEvTFF4ODE0VEhma05pd1ZvUnhrVnly?=
 =?utf-8?B?UUJXSW1zNEh1alBaR0gwZTI2NUNXenJzY1V5NklGZTNQNmMxZ0ViMHlTZm16?=
 =?utf-8?B?ZHBVWDJjT3oyTlNNVllsMnZwYjdaV1YwVVZuZFI1eGMzK2tYQmhJa25uQ1NZ?=
 =?utf-8?B?VE95ZUhPZ01XZVBvdGFEY3YyVDdBMEFWUTYxK0o0YXQzcFR0Y3k1YkQya3Ex?=
 =?utf-8?B?WjAxYmtPdHNMeXdIWjlsRmRwdVc5azBIYWc0ejRJeEcyKzVBc0VCbU5rUDdL?=
 =?utf-8?B?UnNhcUNzSGhyb21RZlpNVnQ5TkxpUmFRcVYrdW1KNTAvajhnR0VxQ0pFWXZZ?=
 =?utf-8?B?Tk5nR1RQK3dzR3daNjRnZmFZOFBnR0w1YVBrS1FLQ0ZQT3RNenlHQlZkak5m?=
 =?utf-8?B?Z1N2emhPQndicWdjQ1hrSlRqUFRXMmJDaWYrZEpZSERGMklVQlFHZ01oUStW?=
 =?utf-8?B?eWI0NVZGUkk3blQzc1NWYVgzVmhpdWxYU29WdDk0Z1ZLUS8vKzRqK2lyUXRO?=
 =?utf-8?B?VTNvUys0ZERvcE9hUHhMenpXSFUxWEVzT29xdjVtUnQ3U0Q1amhYenBraCtq?=
 =?utf-8?B?WkRPWHBGMTZTQkVZMkg1aXNlTDFJTk1ockEydHFCdWdBRnpyREdscEIvdkZu?=
 =?utf-8?B?UDJuMEtjRFdUd3JVVkF0M1pUUS92eXpyU0xGc3hzNlJwVjJXTHcreG9TSWRz?=
 =?utf-8?B?ckt1UU8wR2l5RWM0TmJ1aEp4SmVQYTRxaDF2ZjhiN3RhNzUzeWlydUU1S1VO?=
 =?utf-8?B?N09vbU5xRkNFUHdTa1lrNERNZjI0NnRxSGwrYUc0MkhPVnhycnhubGVXYTF0?=
 =?utf-8?B?YWJjK3pmKzhUekc3RTNVTVJzZVhONFdmYlppS3RSMGNLUmV3WVNIK0NselNE?=
 =?utf-8?B?ckNBS3RDNWhRYUpyRGE5L1hUc21ZUGEyWjlucFJLWEJPeHhoQ1dFMXgwMHQ3?=
 =?utf-8?B?YXkvNWQ1cXRneWlGN2dyaVg4azJ2K2JHZEJMSUxuTXpZdDVyVVZYYUsrMTdN?=
 =?utf-8?B?MGQzbjMxRkxRdVN1aTN0MHg3YU5UclhSS1F0bnA4ZWpzRk9OUHhmbE5DWWZQ?=
 =?utf-8?B?a2R4R3FBQnhMNnhUSURScHRJMnpuWUIvM2Z6bkhSdi80ZUtsSjZDZmh2M2hl?=
 =?utf-8?B?QnBxeFRFSVZMWWx2WTBRNEs2bEdkaW12dzZHUjg2Qit4RFU2NDFZSng2MTZw?=
 =?utf-8?B?UmV3bXcwYWFIUXptY1F4UytjVWxMVlI3YmVhYWt0a21jdWRWRlBoR0dtdVNG?=
 =?utf-8?B?cGFUYkd6WndhcDlwM3NqYUluNzlydjhDbkVwWUVQSGhQUG0xamZTL0g2clNm?=
 =?utf-8?B?K3N0R0MxWEI0ZGhjQkFSWXZia2ZtWTJ4dTMvYlU1MG9YKzV2YXVxZEtwQzgx?=
 =?utf-8?B?ZkpTZE1aQWdYVTRPeW9RRFNoZTFtbVlvS05vakhuTVJZTzRoTERrTGUzWlZi?=
 =?utf-8?Q?I9/w=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ef2963-e7a0-481f-9a07-08de154e6217
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 11:45:53.0159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5URGh600B73o8XZN0AV9l1plELZ/J+bwC68ou1T94i6b7TCAOovL/jOW0lZ/WPP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4481
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvPWitdRJvJWYLIw2ocnoUuB5bUwR7fh1ZJv7JQ8Q68=;
 b=Zlqn2tziTG1aTL1c9oQb1xQhFRP8OCrdnXaUQtmYFVerBtMJGlKe7P4oUvAVaxRgu6VxX8WRxS6kiQfNwgSJjq08dJ4qBMdchibI7NnwP8cBQnNqmzRYqS9JR5GLkd65jrAwNnq+5sApmYELhjjzwrexn0CFqr/sK8ksjCv+uIE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Zlqn2tzi
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: add local
 versal xsa support
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
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Luca,

> Most of the time, users will be running Vivado on their local host machine,
> and will generate a XSA (Xilinx Shell Archive) locally.
>
> Instead of requiring users to create a https:// location for their XSA file,
> this patch improves ease of use by allowing users to work directly with the
> XSA file on their local machine.
>
> BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION can thus be defined as either
> a local location or a https:// location for the XSA file.
>
> In either case, a hash for the XSA file needs to be added to the
> boot/xilinx-prebuilt/xilinx-prebuilt.hash when using this option.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/xilinx-prebuilt/xilinx-prebuilt.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> index 95b656cdde..a7ec9abff5 100644
> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -10,6 +10,9 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
>  XILINX_PREBUILT_FILE = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION))
>  XILINX_PREBUILT_SITE = $(patsubst %/,%,$(dir $(XILINX_PREBUILT_FILE)))
>  XILINX_PREBUILT_SOURCE = $(notdir $(XILINX_PREBUILT_FILE))
> +ifeq ($(findstring ://,$(XILINX_PREBUILT_FILE)),)
> +XILINX_PREBUILT_SITE_METHOD = file
> +endif

> According to the BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION help text,
> using a local file is already supported by using the file:// URL prefix.

Yes, you are right!

> Can you elaborate on which use case you are adding now? I think you are
> just making it a bit easier and cleaner to do the same thing as before by
> using a path instead of a URL, but I may be wrong.

Yes, you are correct.

> Also, updating the Config.in help text should part of this patch.

I will update the help text in v2.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
