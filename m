Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D3ACD5BAB
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 696D840B12;
	Thu, 13 Nov 2025 09:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWWQkg7oVsrw; Thu, 13 Nov 2025 09:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A28F40D16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A28F40D16;
	Thu, 13 Nov 2025 09:52:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C22A158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D606408A0
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsjTbpe0MC4u for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:52:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c007::2;
 helo=mw6pr02cu001.outbound.protection.outlook.com;
 envelope-from=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50FC040B12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50FC040B12
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c007::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50FC040B12
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nwf9km1vzWs81MJncXVb+tUMMQCQkr5YZQjGjwMllhABpN8lWTg8O27tY+bS+aP49L58hOUisveuSyMX3O3nzEyxUfMLC87yoGZ2emg56Q8n7SQMxODGxdbi14jQIEsxJYXremokchhgcuf7gGV9wByqetke6tRDgd5uRFBOqJj7/qZTCs35cxR83PE5DuPt3JJ9wdPOlUfFpEnRIKeHj+lYZ/L5U5sk2pKnB2iSboncpzNJnTv2PjHThr/G/rjzXb2J9MZCtpfKG1jXj8NrraeK3mqDKJaoU7JN16jyzTkb/rAA5LGFYOKJEB0NbCDlZQ5q957SBChTuImIsB7VOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RJswckfVQN2BWhbxI6/dIhobrdsSeBArsqM7BAQIzQ=;
 b=pmibWWcbpvVZFuZsFDJWvESvsLfl9XLRJTZ46nQfhu07J3MQjo4Y82IltaVervJ0UCvZ91r2UWZagCas2q47sHhEKjIpTqw/fLbgqUnOP0attY3dmIFi6A4qs5D3JePY3cLN8qXy4Rju3BYkQBEoKW2Q5gn83ElJcoCRZjEFPyAwqkn+xld7umCHpOV3UrOjxBjo2ogpBUrBoe4RzAJD9Uul8beTS/WXWcAjgpWQ6XYKwpGT1VSdEpsuktsg/bHKM9agWAewRyq5VrGATbjMmEFsIDEpUeXtZ2ZGkavCdCluB/4yo54njU6ZBHloG/+wIwFjE/LnSNb5JCYxZQXlmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 09:52:13 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 09:52:13 +0000
To: <buildroot@buildroot.org>
CC: <Nicolas.Ferre@microchip.com>, <Ludovic.Desroches@microchip.com>,
 <Conor.Dooley@microchip.com>, <thomas.petazzoni@bootlin.com>,
 <Valentina.FernandezAlanis@microchip.com>
Thread-Topic: [PATCH 1/3] configs/microchip_mpfs_icicle: bump Linux and
 U-Boot, add hashes
Thread-Index: AQHcDRTDeHj1J1K9i0+LAyT2rG5et7Tw7TgA
Date: Thu, 13 Nov 2025 09:52:13 +0000
Message-ID: <59cf936eec2b13fc92cbc4a62efb3b2c4790ccc7.camel@microchip.com>
References: <20250814121637.3775660-1-jamie.gibbons@microchip.com>
 <20250814121637.3775660-2-jamie.gibbons@microchip.com>
In-Reply-To: <20250814121637.3775660-2-jamie.gibbons@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|SA1PR11MB6663:EE_
x-ms-office365-filtering-correlation-id: 279674da-f039-40ff-00c9-08de229a5260
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dzBzeTBURjByQUNudjV5cjJGU0FSNFlUZTZPQnVNRCtYUTF2aCtYVE9mclhT?=
 =?utf-8?B?a2xnQ1VrcFRKa1I1TXZhcHNXazBscC9pQ2VZQThyYVVlYlk2WW9IalViQkpt?=
 =?utf-8?B?UUpPdGlBaTB3ek1vL0REVk0zVmhzakRieDdJcXFBOXEwSHhCTlV4R1FEeEJx?=
 =?utf-8?B?TWRBZWhCZGVwQVE3eTZzeitQQ1E1TFN4RUREdkdJL2JvZkZiMEk1RE1oY1hs?=
 =?utf-8?B?Qmlhall3b001SXNWdzdFM0tFTzdjbFdlLy9BcWRXSEpIcUtOL1JYZ0ErdkxO?=
 =?utf-8?B?NVRqUDl6aHMzekt0Nk16MW9oVzI0OUFjbXRMM2NpSzBDdWt0WldOeC9RRDFX?=
 =?utf-8?B?RjBCL3FROWxQaHc1NFY3S1JlWFh5b1lqdHRHWUlrUGJLS20zOGhxK3A2N0dt?=
 =?utf-8?B?NUxXWEEzT3kyd1pwREZUTTJrVHRJVTVHbHVwWnl6djBuRVJ4MVlNZ1FzK3Mw?=
 =?utf-8?B?cXpNYmhhcnhqTWcxK0NJYTNHaHI1WlFEdjV4d0NhTCs4SlpxZlJmck9sRGxB?=
 =?utf-8?B?b29IUjhZeEQ5MUEyM3hMR2wvbzlsSkx4RDh1SC9LY2Zyb3Y1MnRoNVlFWUhE?=
 =?utf-8?B?M3JQcWkxU05zRSs2K2NhSy94SWdEK3N3ekZpQnlGdGw5YzN6S2EyczRsYU9V?=
 =?utf-8?B?Tnl3S0ZkMWNoRWxRc00xNUtRcUpJY3U1MDBBekxHUkR3alczeEJyd2toajB5?=
 =?utf-8?B?WkRuZjh4eVFMWmNMYzNkanQyRGxFZFJ1Q3NTU2hLWXpRYXVReFl5Z09ZeGZn?=
 =?utf-8?B?M01GeXpNZ0ZWaW5rakc5VGQ1WmtoNTFGVXZ6dFpnZW9xNzRJMVV0NndJMVN2?=
 =?utf-8?B?SU03ZzlFTGIxckJ5cWsySlRRTmcvYzBUazJJYnZST0FMdGI5TUttQ2hNTERs?=
 =?utf-8?B?bXhoVHUwYkxobEgwbE9KdWxwNENtMllMQllydndaeStwZ1gvUHNFN3liL0RI?=
 =?utf-8?B?Vm5iZWFEK1UwVHRNWmtkK2NaMFFQNU5jZFF0NlVKQjl6Y3ZwaXNJR3ZQRzNp?=
 =?utf-8?B?MEU2QjNNbVpWU2lsdW5ON3hpR0pvTzFrc1pYVkFRdUNFaDZvRFdIMFk3TVZq?=
 =?utf-8?B?S2RDYmZsZlVqRE9QUW9RZHlIR3duVFk3Wi9JUmtla0l4K1ZCem84NHpscUNN?=
 =?utf-8?B?dVBHV2V6TG5GMnZBN1ZiWmdkRm8vMWtZVUJmWi9FSE1XS1lFMm9oY2dSRklq?=
 =?utf-8?B?Z01IS1BNN0E1cklRL1NBQ3haaElVTTRWSVFFTEZMdTl2My93bjhXYmkzTkpZ?=
 =?utf-8?B?eWRwZWJKZlFlNmprUFhGcDdrQUZ4VkdZVDczN0VnUVV6YVZpb3dINnZkamw0?=
 =?utf-8?B?eThxcGJGb1hKVXkwSmMzdEtBeVZGc2JZdm9nZWNUV1dSMS80QlVYcUNLRUFM?=
 =?utf-8?B?OHRQM2JCNXJOZjZrc29tMUFjVUFrZ0ZNTXZESU8zYm9UYXlJUnBqd3EzV09a?=
 =?utf-8?B?SEtEeFA0U1lCL3BxN1J1cDE1dTB3L2lDbEVDc3hDTDNQVEVKem40MkxSR2l2?=
 =?utf-8?B?WnFYS3JKS2N6WERFcEdpRGVCU0tsemhzNnBIcmlZeVZ6VW43ZFVONVVtZzFM?=
 =?utf-8?B?djBOKzJDSDhUK0JxZ2l3aE5NUGRtN04zems4TG9UeHlKVEFrL2pXYjdrZGZI?=
 =?utf-8?B?L1dhU3BaYkkwQmhNdzRWTWg1Q0l4S2ZvS0txL3d5RHNlRy9DdW1mNi9BOGFS?=
 =?utf-8?B?SFFuUkdKdjcreXNDQWt2Q1VOVzdrWlBGTEFLYWc1YjMvYXk5UXo5ZUx3WFVs?=
 =?utf-8?B?ZFdaSG44TkE0Q3YyNjZvU05TK0Z4cVo3UXdRem5OTkJiMTBFdUpvQ1VpNk85?=
 =?utf-8?B?VmtYU2FGT3JxVktIWnhpcFJUUFhxZUVmN1RiZnM5b2NmWXRPY0F2TGdoZ2xm?=
 =?utf-8?B?M3Y3OHpmbjB6R2JMekZtWlU4OTYzUDE5NTQ4TWZ4YytIdmhHVkpub3Vuejlq?=
 =?utf-8?B?a1ZkRVBsUGhFaGJBL09NWkpXbU1XMXg4SGpDL3RDc2N6UWQxaStjSGJlT05p?=
 =?utf-8?B?UEwyeGEraURJU3NhaVZ4aWFuT3U1dmlLb0UwQTJDYmFDSG1pVG5qV05za21a?=
 =?utf-8?Q?gOmy2e?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFgrTE5OeVpDMVRrOEJPUzJRZnhKcFhPUVM1K0l1QUdqZXBZdXovUjJRZjlo?=
 =?utf-8?B?SXFpcUhNaSt3OERZczhvTmZrUWQ0N0g5NG9JeDcwN2VadHJqdGxJWlF6N21q?=
 =?utf-8?B?cUlTVGpnZUxNcENWU3FrVjRKa0QzOEdhUGp4dU9yWnh2WmdWRjRKWlFRUGht?=
 =?utf-8?B?YXdZeis4K0tGWTNvZUs2eWZ5R2ZobFIzbEpRaXQzdXFLRVl4Q0NpcVpqTEo0?=
 =?utf-8?B?L2FubC84WEhGRVl4RWdiUkthWDlJZnltRVMzeWlkb3VXMHBoRU9SK0UwSHFD?=
 =?utf-8?B?ZWtOendXcTIySnNFTGtLRHJvSGZ5TWk0cTZvMmlURHJKK25LeTJCM1VOYlRk?=
 =?utf-8?B?ZFEyOVUrRWQ0V0lZYVZWYzgycG9LeVkzQ3pJRWVGdVpXT0dmZEY0OFN6cWNv?=
 =?utf-8?B?REJKbW5QZXJjZ3BlV2lWWTh6TlVTaVNVR3RLa1hVanp5OU1nNDdnNnRrUHF5?=
 =?utf-8?B?V3dISlNqdHJ1UXlqUFF5aU11dnpOOThzY0lpejBHN0UxMFlzVC9WbEZNY0hF?=
 =?utf-8?B?OGlvVHFQd0ZLNGMrNlRnNzUrTC9ublBpRXFBeHRrR2hQb3JVK1V3anZaSDFF?=
 =?utf-8?B?emFPQlp1L013RjR1aWlNYUdrQ0pYUDJEdUJRbGVoMWs4cmRMZTZ4bDR2NXg0?=
 =?utf-8?B?dlRTZUxraXlEcG4vaTV6TGtOOFA5cEpmYTVnekg5dThIOXZIRWNSaTgyNmMx?=
 =?utf-8?B?enJLTEVlNkpXY3VLVFlrU0IrRXlIQXBOalJoY0ZjMmEwbmpSRllyeEMrZmtN?=
 =?utf-8?B?S3JYVm0vQUh1YWVUVjF4YzFIMGxCbXFCa2wxdlZ1MFZWWEJtNktqRDF3TUR5?=
 =?utf-8?B?MUtpSkpCTy9TbmxhcGhEVnV4VnA0VGdSWXhkSWVwYUFGUkJIaUNudytGcjZL?=
 =?utf-8?B?WForcGtCdEQ3Q2x0VUIzTEZkRldQMFl5dnhVUnJRTlppZnU4S3NyaFJ1K1gv?=
 =?utf-8?B?d1NRSTU3K1NXMzhMNWhXeVcwMllMNGFZeEhVakswdGxnTDhUYWsvUEgvTG1v?=
 =?utf-8?B?VE83cmVYRWZINHo1dkVjVGVrUnRvNnk2KzFSa1hZTG1Ic2VlMjNzcjUrSGVG?=
 =?utf-8?B?ZmdvN01YeXU0NFNHdDNIeTZ2YmlvT3o3eUQycjJHZHNqU1g2S2d2SFBjcnZu?=
 =?utf-8?B?bTJTYnBnNXdRV2RjQTgvcEkwNE1mMlBwejAwUFdhd0pPQXRnenlYUWNjSjRG?=
 =?utf-8?B?WHFMUzVxelljaDhTaXAzTGhXbGZHdzJWeXdOSkEvR2t3OUYrSHhqclhqeWd4?=
 =?utf-8?B?THR0NkRpdlNtdHA3K1d3YlkrWXFodytRSXp1N3dyVW1sNnJvSXp5REFHcEFr?=
 =?utf-8?B?ZjBCUEEzd1MwYVNYYUpjZmRCQ1kwTzhNQi84c2xNVmZ1WTJRbGgzdFV1dzhj?=
 =?utf-8?B?REVEWGF4ZjFLYWFQUnU4UjRsbmtOUTNpZS81RUhwMUxnWEF3UnNmcGtxRUJ2?=
 =?utf-8?B?aWkyYVFXUzU1Y05WdEZDZ3VoOUFoRERzTnpTTzM2bmR6a1RkUi8xZmpyU1Zs?=
 =?utf-8?B?azZJS3l3dkhUV1orc3lkWVRWaGx5MmRkem5OQXJFelZ3cG4rUHkzczY2Q1g0?=
 =?utf-8?B?QmNIRk1Kdll0TGs2S0RncFVGSmdUV2JwTTRXbFhDdGtMQkxOV1RNbFZBQUp0?=
 =?utf-8?B?R3lubXd4MkIwWEFRWUtLdC9BcDJWYUhZWktOaGxLaGh0bTRFdEFpOXVacmpK?=
 =?utf-8?B?aEgvYlp1RFQrNEV3MXpyeUVJa0JmeE9kQ1dZWVFGcGV3eWNLZ1ZXMkdiUHAy?=
 =?utf-8?B?QmE1UkpSQXJlMUlWdmFJWGh3VHQvU05RRW1wQXhOMWlEQ3ZQc1dKcDljNkVn?=
 =?utf-8?B?U0VzaUR3aEZ3N1M4YVpHUmxmUGtraHRLTE5DbkVhendvSGV2RW95NytBaUZx?=
 =?utf-8?B?Tm01QUl3dWhUelgvRVlvUkI2d3ozZy80MElLRURSdU41UEx6dWVTTVlnT3ZW?=
 =?utf-8?B?Uk9Rd2FCTnBibCtCU3ZzVUt2b25PekJoV2d2ekZ6Z0xFWkZQUGljOUdVNkJa?=
 =?utf-8?B?dHErcHY1V0NZYXlPWmtSaDdodC9JUUxrbGJLSXAvTXhJZm9DL3RoRDM0WUhM?=
 =?utf-8?B?aVBIUFB5a0o1MnAxcDR3eWs5Q0N0eFRpVER3UlJNc0pPUFgrSFVRWG56azJU?=
 =?utf-8?B?SEtyRHNCam1kTzNyakhsZmNnSHB1eUc2YVExTlpTUTJZeEN6V2Z6bkZRZ0Y5?=
 =?utf-8?B?K1E9PQ==?=
Content-ID: <BB47CD4E96DDD348AE3853F92C3D1A34@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279674da-f039-40ff-00c9-08de229a5260
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 09:52:13.5020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYxv/o6KKaq6XKVKUe6ExqC+lMVMO/ano7OtDY6dLzMY3JN0C4+Vu8Fv3X8G4l5nw877vQPxnFMi8IqHgZr9y6cTGKMWRvCCYNMNubxAtI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RJswckfVQN2BWhbxI6/dIhobrdsSeBArsqM7BAQIzQ=;
 b=6/j1edcBn/ajgUiU4mtCr+g8M6/xV2H7I4ftBVEaD8kRjAtr67YpHCh016tbRvDKkW8UR74SRygMcTAbmgQZPeKzNU7HNRm6la5pY6m/Wp1XX2rYzrv7qDw0xUEM8kErhaJlNkjAGZmdZErj8xnfI+0XJUfxMJWyL2ipvbIp9VuvcZsCYeC+6eFvVMtRAm4m4aN3OKckMpab8M5bJ3qYo+bWL2iuwXwBpYE72c5hrSQBOLwrt3Rd5c2kGCy4uz3J2x6iUYDN2itK7ytnhYeLgUnMYDb1NjOjWkV+3dj7E96C0N5jP6Er+CpkFyy0IKkeZcJHbUdtmE9KWohv4Xk4Eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=6/j1edcB
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH 1/3] configs/microchip_mpfs_icicle: bump
 Linux and U-Boot, add hashes
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

SGkgYWxsLA0KDQpPbiBUaHUsIDIwMjUtMDgtMTQgYXQgMTM6MTYgKzAxMDAsIEphbWllIEdpYmJv
bnMgd3JvdGU6DQo+IEZvbGxvd2luZyBNaWNyb2NoaXAncyBMaW51eCAyMDI1LjA3IHJlbGVhc2Us
IHVwZGF0ZSB0aGUgYXNzZXRzIHRvIHRoZQ0KPiBsYXRlc3QgdmVyc2lvbnMsIHRoaXMgaW5jbHVk
ZXMgYSBMaW51eCB2ZXJzaW9uIGJ1bXAgYW5kIGFkZGRpdGlvbmFsDQo+IFUtQm9vdCBkcml2ZXJz
IGFuZCBmdW5jdGlvbmFsaXR5LiBVcGRhdGUgdGhlIExpbnV4IGhlYWRlcnMgdG8gc3VwcG9ydA0K
PiB0aGUgdXBkYXRlZCB2Ni4xMiBrZXJuZWwuIFVwZGF0ZSB0aGUgY29ycmVzcG9uZGluZyBwYWNr
YWdlIGhhc2hlcy4NCj4gDQpJdCBoYXMgYmVlbiAzIG1vbnRocyBzaW5jZSBJIGhhdmUgc2VudCB0
aGlzIHNlcmllcyBhbmQgSSBoYXZlIG5vdA0KcmVjZWl2ZWQgYW55IGZlZWRiYWNrLCBub3IgaGFz
IHRoZSBzZXJpZXMgYmVlbiBhcHBsaWVkLiBJIGFtIHdvbmRlcmluZw0KaXMgdGhlcmUgYW55dGhp
bmcgZGVsYXlpbmcgdGhpcyBhbmQvb3IgYW55dGhpbmcgSSBjYW4gZG8gdG8gbW92ZSB0aGUNCnNl
cmllcyBjbG9zZXIgdG8gYmVpbmcgYXBwbGllZD8NCg0KVGhhbmtzLA0KSmFtaWUuDQoNCj4gU2ln
bmVkLW9mZi1ieTogSmFtaWUgR2liYm9ucyA8amFtaWUuZ2liYm9uc0BtaWNyb2NoaXAuY29tPg0K
PiAtLS0NCj4gwqBib2FyZC9taWNyb2NoaXAvbXBmc19pY2ljbGUvcGF0Y2hlcy9saW51eC9saW51
eC5oYXNoIHwgMiArLQ0KPiDCoGJvYXJkL21pY3JvY2hpcC9tcGZzX2ljaWNsZS9wYXRjaGVzL3Vi
b290L3Vib290Lmhhc2ggfCAyICstDQo+IMKgY29uZmlncy9taWNyb2NoaXBfbXBmc19pY2ljbGVf
ZGVmY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrKy0tLQ0KPiDCoDMgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2JvYXJkL21pY3JvY2hpcC9tcGZzX2ljaWNsZS9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhh
c2gNCj4gYi9ib2FyZC9taWNyb2NoaXAvbXBmc19pY2ljbGUvcGF0Y2hlcy9saW51eC9saW51eC5o
YXNoDQo+IGluZGV4IDQxNmE4YjE1NTAuLmQwZTJkNTY5M2MgMTAwNjQ0DQo+IC0tLSBhL2JvYXJk
L21pY3JvY2hpcC9tcGZzX2ljaWNsZS9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gNCj4gKysrIGIv
Ym9hcmQvbWljcm9jaGlwL21wZnNfaWNpY2xlL3BhdGNoZXMvbGludXgvbGludXguaGFzaA0KPiBA
QCAtMSwyICsxLDIgQEANCj4gwqAjIExvY2FsbHkgY2FsY3VsYXRlZA0KPiAtc2hhMjU2wqANCj4g
ZGNiN2I0MWZkMzYzNzI5Njc1YzM0NTQ1ZmNiNTE0ZDVhOTRkYmIzNzE0ZWUxMGY1MjdhMjZjYTc3
MTZjMjU3OcKgDQo+IGxpbnV4LWxpbnV4NG1pY3JvY2hpcCtmcGdhLTIwMjQuMDYudGFyLmd6DQo+
ICtzaGEyNTbCoA0KPiA3Nzg5Y2MyODQ0Y2I5NjMzYWE4YzE0NmUxOTRjOWFkMzQ4MmJmMDZhY2U3
MDdkNjZkMGNhNjAzOWVkMTY4MzNkwqANCj4gbGludXgtbGludXg0bWljcm9jaGlwK2ZwZ2EtMjAy
NS4wNy50YXIuZ3oNCj4gZGlmZiAtLWdpdCBhL2JvYXJkL21pY3JvY2hpcC9tcGZzX2ljaWNsZS9w
YXRjaGVzL3Vib290L3Vib290Lmhhc2gNCj4gYi9ib2FyZC9taWNyb2NoaXAvbXBmc19pY2ljbGUv
cGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoDQo+IGluZGV4IDI2MjhkNGI0ZmQuLjBhZGJlMTU3MTAg
MTAwNjQ0DQo+IC0tLSBhL2JvYXJkL21pY3JvY2hpcC9tcGZzX2ljaWNsZS9wYXRjaGVzL3Vib290
L3Vib290Lmhhc2gNCj4gKysrIGIvYm9hcmQvbWljcm9jaGlwL21wZnNfaWNpY2xlL3BhdGNoZXMv
dWJvb3QvdWJvb3QuaGFzaA0KPiBAQCAtMSwyICsxLDIgQEANCj4gwqAjIExvY2FsbHkgY2FsY3Vs
YXRlZA0KPiAtc2hhMjU2wqANCj4gZDQ2MWM0NWE5YzVhY2QwMTk3NzZjZGNmOGFiMmI1NzEzMTUy
ODJhODgwZGQ2NTgwNDMxZjdkZDViZmFjMzg4OcKgDQo+IHVib290LWxpbnV4NG1pY3JvY2hpcCtm
cGdhLTIwMjQuMDYudGFyLmd6DQo+ICtzaGEyNTbCoA0KPiA4ZGFiOWFiYzI4NjFkOTVlNjA5Y2Q2
MmE0NGI0Njg3ZDAzZGMxM2VhZTY0ODdmZDFhZTFkZWQ2Mzk4ZGRiMGNkwqANCj4gdWJvb3QtbGlu
dXg0bWljcm9jaGlwK2ZwZ2EtMjAyNS4wNy50YXIuZ3oNCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mv
bWljcm9jaGlwX21wZnNfaWNpY2xlX2RlZmNvbmZpZw0KPiBiL2NvbmZpZ3MvbWljcm9jaGlwX21w
ZnNfaWNpY2xlX2RlZmNvbmZpZw0KPiBpbmRleCA0MzM3YWMzNGI0Li40ZDQ2NTAxNmM3IDEwMDY0
NA0KPiAtLS0gYS9jb25maWdzL21pY3JvY2hpcF9tcGZzX2ljaWNsZV9kZWZjb25maWcNCj4gKysr
IGIvY29uZmlncy9taWNyb2NoaXBfbXBmc19pY2ljbGVfZGVmY29uZmlnDQo+IEBAIC0xLDEzICsx
LDEzIEBADQo+IMKgQlIyX3Jpc2N2PXkNCj4gwqBCUjJfUklTQ1ZfSVNBX1JWQz15DQo+IC1CUjJf
UEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNj15DQo+ICtCUjJfUEFDS0FHRV9I
T1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMTI9eQ0KPiDCoEJSMl9HTE9CQUxfUEFUQ0hfRElS
PSJib2FyZC9taWNyb2NoaXAvbXBmc19pY2ljbGUvcGF0Y2hlcyINCj4gwqBCUjJfRE9XTkxPQURf
Rk9SQ0VfQ0hFQ0tfSEFTSEVTPXkNCj4gwqBCUjJfVEFSR0VUX0dFTkVSSUNfSE9TVE5BTUU9Im1w
ZnNfaWNpY2xlIg0KPiDCoEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL21pY3Jv
Y2hpcC9tcGZzX2ljaWNsZS9wb3N0LQ0KPiBpbWFnZS5zaCINCj4gwqBCUjJfTElOVVhfS0VSTkVM
PXkNCj4gwqBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMPXkNCj4gLUJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbA0KPiBnaXRodWIsbGludXg0bWlj
cm9jaGlwLGxpbnV4LGxpbnV4NG1pY3JvY2hpcCtmcGdhLTIwMjQuMDYpL2xpbnV4LQ0KPiBsaW51
eDRtaWNyb2NoaXArZnBnYS0yMDI0LjA2LnRhci5neiINCj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbA0KPiBnaXRodWIsbGludXg0bWljcm9jaGlwLGxp
bnV4LGxpbnV4NG1pY3JvY2hpcCtmcGdhLTIwMjUuMDcpL2xpbnV4LQ0KPiBsaW51eDRtaWNyb2No
aXArZnBnYS0yMDI1LjA3LnRhci5neiINCj4gwqBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0i
bXBmcyINCj4gwqBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iYm9hcmQv
bWljcm9jaGlwL21wZnNfaWNpY2xlLw0KPiBsaW51eC5mcmFnbWVudCINCj4gwqBCUjJfTElOVVhf
S0VSTkVMX0RUU19TVVBQT1JUPXkNCj4gQEAgLTE3LDcgKzE3LDcgQEAgQlIyX1RBUkdFVF9ST09U
RlNfRVhUMl80PXkNCj4gwqBCUjJfVEFSR0VUX1VCT09UPXkNCj4gwqBCUjJfVEFSR0VUX1VCT09U
X0JVSUxEX1NZU1RFTV9LQ09ORklHPXkNCj4gwqBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9UQVJC
QUxMPXkNCj4gLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2Fs
bA0KPiBnaXRodWIsbGludXg0bWljcm9jaGlwLHUtYm9vdC1tY2hwLGxpbnV4NG1pY3JvY2hpcCtm
cGdhLQ0KPiAyMDI0LjA2KS91Ym9vdC1saW51eDRtaWNyb2NoaXArZnBnYS0yMDI0LjA2LnRhci5n
eiINCj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbA0K
PiBnaXRodWIsbGludXg0bWljcm9jaGlwLHUtYm9vdC1tY2hwLGxpbnV4NG1pY3JvY2hpcCtmcGdh
LQ0KPiAyMDI1LjA3KS91Ym9vdC1saW51eDRtaWNyb2NoaXArZnBnYS0yMDI1LjA3LnRhci5neiIN
Cj4gwqBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0ibWljcm9jaGlwX21wZnNfaWNp
Y2xlIg0KPiDCoEJSMl9UQVJHRVRfVUJPT1RfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9t
aWNyb2NoaXAvbXBmc19pY2ljbGUvDQo+IHVib290LWZyYWdtZW50LXJvb3Rmcy5jb25maWciDQo+
IMKgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQ0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
