Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7543AC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0959B4099B;
	Tue,  2 Aug 2022 20:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0959B4099B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-ekEHb5IIRP; Tue,  2 Aug 2022 20:30:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B005A40994;
	Tue,  2 Aug 2022 20:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B005A40994
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC53B1BF3B8
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B678B8176B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B678B8176B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0OBR10NdsgUJ for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:30:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D995581769
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2126.outbound.protection.outlook.com [40.107.237.126])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D995581769
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:30:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USiTxNBD5xf70fb45nvipXvUbVEYb0mPNokhGXuXoR+Xo6TP9i3rgzhnghG6j8bHKBtIq6dvZ5nuj6hprfOUl6gaRqYWe0uz9aGBzG8ZW+VX1GUDRPUOHlF5K1p/fWyNaOG5VzUh51aXxI2nygqfSzrPUgVHsOlQrL+z7lbnZ59dmoa98N6N5q70tEBuvSzEE984FMoE1ecABA+RRbzyUsd5QFomFO1Q6y2FzL9Yxb112a1yxrU32G4LldPDta/b6LhhfcBH2sY3wfItCU05Ch4mVrnDmW9ITeHlT6QP1tKiaHhLvBXfl29sIV76qrOyqmOtzLdYJGh21HYJNvBRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FscOCzJzI4UtOJSzl2q9n7hQ85AvjvMTlg/8+FTPamY=;
 b=ZZknQDgjyXmliuwxXrLxAVUkbkxHvbZ0KTrla+6vi2UeF+SNJlQJXAHHGaCXsxgacvUM9cG2xkOskJU5XLjbRbkcaUuu3oZrNrFAxMfri7bZctCYgJ2hDK1VMnYuaKckO4RmaZ4/iLTRAIwd8lNUBNTTz6XR1th1Etk0v6Lj0XPAg4d1/pzKOLx/Cr4STX9xFuzXCpHgO3SCJZ5qhnAGOnONSlFvyhTrKANIJbLzBPc9UR51+KC6/OHvCgaf1aLWXbT0UQrS+FpUxnE7wa1bPYUY4KBfq0ISFXsTcu/OtwX2qqxG2SvNUgJOtsH/forbdShe2zrrii4HZf97iB8vDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BN7PR17MB2369.namprd17.prod.outlook.com (2603:10b6:406:c7::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Tue, 2 Aug
 2022 20:30:08 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 20:30:07 +0000
Message-ID: <fabcfaf5-eaa9-930f-4422-1b7f0980e615@phobosdpl.com>
Date: Tue, 2 Aug 2022 15:30:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220728232357.270130-1-sen@phobosdpl.com>
 <20220728232357.270130-2-sen@phobosdpl.com>
 <20220801190417.061c2858@windsurf>
 <8e538839-349e-09db-cf02-8b8b4ee0abae@mind.be>
From: Sen Hastings <sen@phobosdpl.com>
In-Reply-To: <8e538839-349e-09db-cf02-8b8b4ee0abae@mind.be>
X-ClientProxiedBy: SN6PR16CA0060.namprd16.prod.outlook.com
 (2603:10b6:805:ca::37) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06723bda-9dec-4363-fd51-08da74c5ca3b
X-MS-TrafficTypeDiagnostic: BN7PR17MB2369:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Xduku1WTYmx2OjpslY9BlbqMtO9lWHbHBOk34yOZ32LAcSWMa2yfdnqEJUWv5wCYDB6RfHd0bSPhMjTp1AxvQgUTZ6zuYVs8kS9TYxwpHxbNDElUKCW+NwDeRCa6wKsOFPKdRHPcr7ncGHQL38d5dCP4ji2gEVFmnBg5Arzow9XrFpRE5BQ5QW0uCD+W/+I4WqO/wRqH1VHHVmAdAQjIeaCXV6VfYPqoKMRs72LFg2OR0a8jOmQfEfpGuJvj3gydvhaCLMWOycvdL6VLPpr4YDusbcnc3xsbZ3D/u4srvIGTiqT/gfgnka32bwkQtht3WWwxwJxQjAjxEiVf1yZiTR+bZVepJ1bG7qRHBEctHITuxI3vQ/ULgfwfSp+0APsVy/3Da4lfA+FGkr6H/gDNWuD8FcWnVIIqof7LOga1Pl0xTIZKQ6ccAj3ecIuXPQAY/fp1wBrE5BDCUWHRWtPc8ZPOQyk1srOFpuUvG7Dg6OxiXA5b07f8H72z9bQ0GhRp4r6pR23y8ypHuFH/0BQpTRe/pBeEUpi92R8ZREQ9In6lZfEzHE7hVXkqbn0aulx351+C3OpZ119DVB2S6VO3OIRo52UphPvd3WH+w7QnEU/yOv5qBqjPCCVsm4GqCODTqmuQ5x2lMt/MzFhXsIoBMgn8o8bMgRHvIwat/qJu4I/XKtJwqeNJmz8T4gMT6b40lSWpif9QOstt4HoJkeADVMU+SVSxRMs83X+cqyahIWrhOkdOCr+FovzAb5jv03xQnRJhYfPzM4/jBgEwJ6ENL9rjM6AwLJ5cWZA4mamNSJc6RGw+2clAK/kSTNZ0SRA5+/PB4YGpIW5eqwefH3tPQ7am4c2t3l2kEqFJVONFa2SdNOfRd0KPAjSLeDPmZdT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(396003)(39830400003)(376002)(346002)(8936002)(110136005)(2616005)(316002)(4326008)(66556008)(8676002)(66476007)(31696002)(5660300002)(86362001)(66574015)(52116002)(53546011)(66946007)(6506007)(83380400001)(186003)(38350700002)(38100700002)(41300700001)(26005)(6486002)(966005)(478600001)(31686004)(36756003)(2906002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3BBUTFreWprRk9vK25CVDduU2p1V2l1NFlJTTRoOVUxUlZzREdBa2xtRkox?=
 =?utf-8?B?NGllUDdDK2ZNUG14ZUo5ZStvT2xrWVRzcFhKR2toQ3JGUS9ZdUJlQ2Z6M3Jh?=
 =?utf-8?B?RG4rWUg1Z2lKSEJsTjBOajNWVUZ1dGkvai9sR2I2WkhYMlhkYXNPY0o1Q1FU?=
 =?utf-8?B?K0RYa0JDTjBNVEx5WVdQSFZrNDI0b3pPdHEwOHBmMy92ZCtIcStBYlZ6U1Y4?=
 =?utf-8?B?OGRCQXU4ZmdvSm5tdkRYTVlPcmhTdThSbHBJYlZNNWx4NFp2K0YwRHgwNCta?=
 =?utf-8?B?Z1IxQ3RhT3QvcXhqNngvRnEvVHZaZjhIZFRUejlZN2ZSRXZZZHlMaGVUNjRV?=
 =?utf-8?B?bm00Y0toRTVQM2RGOGFHZ3hjbTlmSXJ2VTNBYVUwWTdPQkdYZHlEdktGUlVD?=
 =?utf-8?B?S2luMVY1bExCMERBNkJEelN3WGRya3dlRGZwS0lHUDIrRHpWemUvUVlsUWJR?=
 =?utf-8?B?OXVBaGdiZFpzMWQ0Mk1UN2Q4SkxTdGZjNUNtMUExQmJPeHM0VGVSTDdhUnZG?=
 =?utf-8?B?WURJR1MwTktCeFFCbUk4WENWTlhvVzB4aGZTYmk4NmNvenhXUkZHMGhETTZF?=
 =?utf-8?B?dTFSUElBYVRQaGxCclpzcit6aUhDazM3eVp2KzB2enVFU2NyOVlkWDRmQTlW?=
 =?utf-8?B?NEZFMG5wVVVEa0RIOEcwR29aRUtHSDZVd2tKVEtqS3ZuRWJaMnZ2SVdodDQ0?=
 =?utf-8?B?S3NHbUpNNlE5NVJ4Y2wwV25iblovN1VqbUZTSjltTU5UUGl4UGNYSW1NcFhM?=
 =?utf-8?B?MkI1Y0JxOXR1M0dZYy9mYVBmaDlxWEd0bVlES3ZzNXJ2QlUxNHpIZXNvSVJ0?=
 =?utf-8?B?REgzNWdxYjYzSWxLYVdwZzRaUkVHR2lFWWxHODBkOVprL0xYT25jYmc3NjdO?=
 =?utf-8?B?dlIrYUZWZllmZmhYanAzbHRNL3VLdk1qL29EYjZuaCtjTlVuL1VwM0YxeFpz?=
 =?utf-8?B?NUlFa21ZMlEzTjBvT2MrZDRQR2dYemRYUmgzOWtkZUZTVzVxV2FrOHpVbG1Z?=
 =?utf-8?B?YjE4Q0ZMUDdzSi8wYy9QMzBjQlRTRWhiTHlUTVNoUkV3YjJXT0xKYjhtRHNq?=
 =?utf-8?B?ODZwMTBOVHExdDd4bDBpVUhBRGY0YUJWWjZWM3lYYU5CcnV1a3FQNW1JU0dL?=
 =?utf-8?B?MU83cXBTalVzMU5TMFBESTd6NS9RVDlvRmd2M0FKNjloK2NMK3c4QUtRbHIx?=
 =?utf-8?B?czZJRjZxNWJuQ2xHTU1nYUNNNU9QbEFKU3ZlR3M3NllsZEpBcGI3K0Y4aFIz?=
 =?utf-8?B?Vm9kR3c1Y1RvTEgrRWRkRzFvZXdBbFM4bmJWanhzSjVyOE9vRW1YUFFEV1VR?=
 =?utf-8?B?bkRBMjVJczNVaGlvZ3NOL1dDeXNITnRHUXpNcFFtUzFlMWhCN2FPMjNpNnZ6?=
 =?utf-8?B?ZHkyT2dIeFhtU2lpQUw4VHZZN21rTXFnR0xMUHdGRlpkOVFkd0Z2dVZ0dlBh?=
 =?utf-8?B?RFI1ZVlWNzY0YUVORVJjN2QzdU04S0ZVTlBld0Zxb1VFaUdPNDQrVjdZMHVN?=
 =?utf-8?B?aEJmRHVHamJXYWZVOUFJMWwvT1J2VHZMUW1hcTlZcjNueU16UHhGTWZqUUFD?=
 =?utf-8?B?ek5qWEEyMyt0U1ZobGVPV0tzRUtWZTFHdGllcU0rZ2RQNDk5NjF5WDZKdjYx?=
 =?utf-8?B?UnJleEFxZ2dNbEhJUW8wZTVwS29pbjRSK1JLUTVqZGR3bStvazJHREhWbzB5?=
 =?utf-8?B?MmwxUjY1U29VUTlydU15VDV5Sy8zb3RiMGFhRlpuU2NqMWJqd1RrSktvZCt2?=
 =?utf-8?B?ekJWZHpoL2doc1JIUlJoQUdSK2xJdzBIZEhZNytRNWhocU1iS1BDMUVPTFZm?=
 =?utf-8?B?V0VKU08xSk1HSDZ2MXRUSndSL242U2dYMWVWQXc3TGpONzFyNDZYRVdVOXNs?=
 =?utf-8?B?L2pYaVhUTzdvcUxJTzNheStiTUQ0clFPbmlnajFtdUZSYkMyY3hHbnZ2dXh0?=
 =?utf-8?B?cDNUeU1PTi84SkpSc3c5NGl4UDcrbUhLa243MThEd3U4K0tjK3RXalh5aHhG?=
 =?utf-8?B?T2RFcmhVczFBUzNSeU4yeHROUDZ3VlVUQUhRUU9Ua0U5K2tqNzVnSjNpZ3FD?=
 =?utf-8?B?R1BXWVlvK2xRYUYvSmp4cThEbUxTVW44Wm44UGU4MWhTUGNpRFBiNGJGa3Nk?=
 =?utf-8?Q?NEuhRMTjoHON+228+DELiHt14?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06723bda-9dec-4363-fd51-08da74c5ca3b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 20:30:07.7748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+0fI7Ih846d55k/K9u6pj4HW13P1gIMyZxylvGs1OfoxIvRbrkI+yTe7g1WSYUPUfb/D999ya4JTNB38ujbTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR17MB2369
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FscOCzJzI4UtOJSzl2q9n7hQ85AvjvMTlg/8+FTPamY=;
 b=QDPNArXlElHTzXHv1qEQLMgau1GPbsNYeVQFK3JOe+ccFb3/spY8Mo6nnZf/wx3p7nomr2ARPbBPI34GyKaMI3PXFvBwMHvEyrFeVIhcitithtf2vJG65btJ49qxveGAO0i74iDFjyN4hq3GKDQdKB5zXshCqBcXdZkcnwd9rE8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=QDPNArXl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/pkg-stats: adjust
 column widths
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOC8xLzIyIDEzOjExLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiDCoEhpIFNlbiwK
PiAKPiBPbiAwMS8wOC8yMDIyIDE5OjA0LCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qg
d3JvdGU6Cj4+IE9uIFRodSwgMjggSnVsIDIwMjIgMTg6MjM6NTYgLTA1MDAKPj4gU2VuIEhhc3Rp
bmdzIDxzZW5AcGhvYm9zZHBsLmNvbT4gd3JvdGU6Cj4+Cj4+PiBUaGlzIGFkanVzdHMgdGhlIGNv
bHVtbiB3aWR0aHMsIG1vc3RseSBmb3IgYXN0aGV0aWNzL2xlZ2liaWxpdHkuCj4+Pgo+Pj4gSXQg
aXMgcHJpbWFyaWx5IGZvciBjaHJvbWUgYmFzZWQgYnJvd3NlcnMsIHdoaWNoIGxpa2UgdG8KPj4+
IGxpbmVicmVhayBvbiBleHBsaWNpdCBoeXBoZW5zLCBtZWFuaW5nIGV2ZXJ5IENWRSB0YWtlcyBt
dWx0aXBsZSBsaW5lcy4KPj4+Cj4+PiBzZWU6IGh0dHBzOi8vZ2l0aHViLmNvbS93M2MvY3Nzd2ct
ZHJhZnRzL2lzc3Vlcy8zNDM0Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU2VuIEhhc3RpbmdzIDxz
ZW5AcGhvYm9zZHBsLmNvbT4KPj4KPj4gVGhpcyBkb2Vzbid0IGJlaGF2ZSBleHRyZW1lbHkgd2Vs
bCBoZXJlIGFzIGl0IHByZXZlbnRzIHdyYXBwaW5nIG9mIHRoZQo+PiBwYWNrYWdlIC5tayBmaWxl
IHBhdGggaW4gdGhlIGZpcnN0IGNvbHVtbiwgbWFraW5nIHRoaXMgZmlyc3QgY29sdW1uCj4+IGxh
cmdlciB0aGFuIGl0IHdhcy4gSSBndWVzcyB3cmFwcGluZyBvbiAiLyIgd291bGQgYmUgaWRlYWxs
eSBmb3IgdGhpcwo+PiBmaXJzdCBjb2x1bW4uCj4+Cj4+IEhlcmUgdGhlIHRhYmxlIGNvbnRpbnVl
cyB0byBleGNlZWQgdGhlIHdpZHRoIG9mIG15IGxhcmdlIGJyb3dzZXIgd2luZG93Cj4+ICh3aXRo
IG9yIHdpdGhvdXQgdGhpcyBwYXRjaCksIHdoaWNoIGlzIG5vdCB2ZXJ5IG5pY2UgOi0vCj4gCj4g
wqBTaW5jZSBwa2ctc3RhdHMgdGFrZXMgYSBwcmV0dHkgbG9uZyB0aW1lIHRvIHJ1biwgaXQgd291
bGQgYmUgbmljZSBpZgo+IHlvdSBjb3VsZCBwdWJsaXNoIHRoZSBvdXRwdXQgb2YgcGtnLXN0YXRz
ICh3aXRoIG5vIC5jb25maWcpIHNvbWV3aGVyZSBzbwo+IHdlIGNhbiBsb29rIGF0IGl0IGRpcmVj
dGx5IGFuZCBub3RpY2UgdGhlc2UgdGhpbmdzIGVhc2llci4+ClllYWgsIHRoZXNlIHdlaXJkIGVk
Z2UgY2FzZXMgb25seSBjcm9wIHVwIHdoZW4geW91IGJ1aWxkIGFsbCB0aGUKcGFja2FnZXMuLi4g
d2hpY2ggcmVxdWlyZXMgYnVpbGRpbmcgYWxsIHRoZSBwYWNrYWdlcy4KTXkgdXN1YWwgZGV2IGN5
Y2xlIGlzIHRvIHB1bGwgbWFzdGVyLmh0bWwsIGVkaXQgdGhlIGpzIGluIHNpdHUgYW5kIHRoZW4K
bW92ZSBpdCBiYWNrIGludG8gdGhlIHBrZy1zdGF0cyBzY3JpcHQuIEkgdXN1YWxseSBvbmx5IHJ1
biBwa2ctc3RhdHMKYWdhaW5zdCBhIGZhaXJseSBzaW1wbGUgZGVmY29uZmlnIGxpa2UgcGNfeDg2
XzY0X2VmaSBvciBteSBvd24gcGVyc29uYWwKcHJvamVjdC4gSSBndWVzcyBJIHNob3VsZCBkbyBh
IGZ1bGwgYnVpbGQgb2YgbWFzdGVyIHdlZWtseSwgYW5kIHBlcmhhcHMKYSBuaWdodGx5IHJ1biBv
ZiBwa2ctc3RhdHMsIHRoZW4gaG9zdCB0aGUgaHRtbCBzb21ld2hlcmUuIEFuZCBwZXJoYXBzIEkK
c2hvdWxkIGxvb2sgaW50byBwYXJzaW5nIHRoZSBqc29uIG91dHB1dCBpbnRvIGh0bWwuLi4KClNp
bmNlcmVseSwKU2VuIEguCgo+IMKgUmVnYXJkcywKPiDCoEFybm91dAo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
