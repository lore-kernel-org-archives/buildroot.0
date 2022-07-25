Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB6AC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 12:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1154284C75;
	Mon, 25 Jul 2022 12:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1154284C75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3TuDsDhcXVg; Mon, 25 Jul 2022 12:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16D9084C46;
	Mon, 25 Jul 2022 12:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16D9084C46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7011BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37282419A5
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37282419A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kgRJJCy_Z2di for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 12:31:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E761141997
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0132.outbound.protection.office365.us [23.103.208.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E761141997
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:31:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Kqf/iX95BdJk8OODOgxPLIFqJb/hoeKGyXBkqB9LtsjzIgs3Jt/5YA0NHwFK5lrLGOXkvYhuaNc0QYw6vQCpY409Q7zOHeNywx/7H2zgbm6EqUi+VikqFIjv9t9nAtngOyrj3xGo6aTFKAt7C8PgIkhHXduoGRZOIYNb992E5TKZ0aqLrHbh7210D2edNCC5WujPt43V393CjUZ+gworyzcINl0q+8YQgij9S571dAi6Ia7zwhm1zl/LOfN9YOAYLw4NmAahj28VHlfsPrQpuT1RnEqWlNTamGE2jzOb4mTsh01vkdzEuYV5DvhyErRWpTcM9hhPuJ4Jp5ZQfo4ZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzAauOlmE8aqQ9YiYgLVPmZaYD6nKwFuomLrBYvJbY0=;
 b=h8fNGPiPY3Ey+Mdh0M+p83Mn81bvqkOHEyTMrFfMJkj+0cH10jYFiEbUn9Zmhfvg1xuX1VcLb68GqU8/HYTFxyuQXMJytSGCrGYZbii8lmALZH+Z1g8kcIfUOQaeango4Cejp//aECGHUXqNeB8seOcw31AmIl7m8cuRwVM/oKXak0tc3nIiBO3ZQioMMPFMFFqohm6z0XoWKfh2id2Fcm2wEidxDJq9geKVRzdQbng9HOtrbFuxmbWZRytAek5RrdFZMfVKe1NW+Zz0dKJMbe0QjgWZGa3cX0hCbXk5TVgfciv8RExNgBArnkvvqLPGY+FbiklCDAR+HzJCp63uUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1668.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 12:31:50 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a01c:a0e2:2eaa:977]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a01c:a0e2:2eaa:977%5]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 12:31:50 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - Re: [Buildroot] [PATCH 2/2] package/nvidia-driver:
 bump version to 390.151
Thread-Index: AQHYhNgkcJC+XIAlI02BkXRuoNB+R62MiOEAgAKvCoA=
Date: Mon, 25 Jul 2022 12:31:49 +0000
Message-ID: <PH1P110MB16031BEB9E963C09FFE461E19F959@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20220620170940.513445-1-vfazio@xes-inc.com>
 <20220620190115.541032-1-vfazio@xes-inc.com>
 <20220620190115.541032-2-vfazio@xes-inc.com>
 <5659f28f-11ce-b6f1-3b60-b694150aed2f@mind.be>
In-Reply-To: <5659f28f-11ce-b6f1-3b60-b694150aed2f@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37e6b640-b6b0-4564-f507-08da6e39a5c5
x-ms-traffictypediagnostic: PH1P110MB1668:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OEPt9Jw074MkgGLYBxrWPdlgmO/3n3lhq6uWcsWqrVGtl0Vlthe/Q6JJqOJgf+WERj41berXBN7YDAXWvY+uhV+v4Debp6YMH73BFHCE4MVBrXLf5AsSWt5ohHeqLm8VfKd8WcG2g4rcL81M3orkR2lStrqXcq10bIzr8PUtLlgkSgNo8t8N/sE8gIFVCq5uzDaVrL/fK+thoRWTMilJHGt94/qmc6muWY2zMCFRp1Y39xsLrbI7piHwku0N41UlBGeqG5UTzXsvg9asUi2TG8NdVU8JelxM4RFmwetTwWCmRUBwMBBjPQ9vKdOEdBhklFj9zDk3OtooeybBlTa8IfjPB2D1Ud2uUC1jvfqqaga1u5UT0Sta/vSYO9KcX6kD/fv6QLKA0TFamrhFMersGtgo7Yc9use1aIQ7jTktWDJTCMvPGy8hiTt1L/JaQfs3BYljSEvpAqeBGnqC8DF7GT4cBzie0me0cVI6Vt4DFRgYhbAbv++J2vqnZNRT/El4fnOvCaw0HcToaTn3CR/m3Fk/VmgzMfAZOzc34oC5Y6JfuFJpKsw1HOxln5+CrjZONqCOG7afvOq6PJvCCr48XZRuNlbcF99KTHDHQUT6AdyEKfbAGp/8xcJcQKs7M1cl9ySTI7kABvOGa901Y5ysqXe18dmToO7/Y2iza/LhRGyPT33l+wwiknXWRE5K0lSXOw/WKWp+M5qm5yTg/El78mm4xpbaToswm0eVZCDKDxTGAn77DLaETxGaZV+Ni8NdrXKl+HVgPrcY8/bO3OCk6NMQpm/guS0HXxBtSDp3+dk2N1W6bvF3bnE/WGU5LGbPks/NGnVZ2xE0OzaRWbYqMR7L9F3MI1aSplyRxW7RgJu9ew6kGdentoNl7RAOIo+1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39830400003)(366004)(136003)(396003)(66946007)(76116006)(186003)(4326008)(71200400001)(66556008)(66476007)(66446008)(8676002)(64756008)(26005)(41300700001)(9686003)(86362001)(7696005)(6506007)(53546011)(2906002)(8936002)(52536014)(508600001)(966005)(33656002)(38070700005)(19625735003)(5660300002)(55016003)(122000001)(38100700002)(41320700001)(54906003)(110136005)(83380400001)(41080700001)(15866825006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGFYWjhGMkg5QzBwZXk4L0hZek5hUXRTVWpZMHUrclZlaGVhRzIySnRJeXl6?=
 =?utf-8?B?YUx5YUk2NVBzUjlaQ2NMUlNpWFpsSmNYb3RBb3hSUStIZVlmdDBtQUg4YVAy?=
 =?utf-8?B?UVpERUhNRHlBWHMydW5tK3V3aHRNblVNbTBzQ3dTWW9rRHVFYnpQRmhoNkZW?=
 =?utf-8?B?N3d1eC9QWUwva2JRck9JQTN3TDNTdWQ2cmNpWFJNNjlVOFFaVytSRGc3MG4w?=
 =?utf-8?B?a29CendicFkvZmhicnlYVGNoWU1mZW1pVEpKYXV1cWZ3NnNteVQwTGN1TUlo?=
 =?utf-8?B?UEx0RzdQUU5jb1MvbVZncDEzNlhsalViamdXVUdWUmQzcFk0SUhXcGhJTHlK?=
 =?utf-8?B?Y3luNHFwS0Y4bVFZdVRVQ1lOMHNJdDhzSGdTTXdZSENSbHROaEFSMnh2QkUy?=
 =?utf-8?B?cUtSdFgyQ1RtZm9jYm1zMnhSWE5XZldQajlpQTJvT0NsMHRZM1N5OFFBazk0?=
 =?utf-8?B?blpPemRwa0ZZZmlwZDFJaGVPcW10QlV5S0JOWTJFOFBYRm1GV1p1azFSOEtv?=
 =?utf-8?B?NndwcWZ6bm5JNDN6MCs2UDVPcnk2RGIxTk10bnFvOVl5S3FhZ1I0Qm9xaFB5?=
 =?utf-8?B?TzgybkMySUFkU0dkZW1LYmI0TEYreEdOR3ZtdTFZbnFUcnpkSndiYUo2V0hY?=
 =?utf-8?B?YzliOG40Ull2U3haZnFZYUZoSWxVVG1USTg3QmxaZzF1MURUUTJyM2xlQ0hT?=
 =?utf-8?B?M3VMS2xQNEc1UXdBVkFYWkw3K3pwaUNWTTBvbWV6NDdRanhkS3lYSmNkcTJ5?=
 =?utf-8?B?RDFOd0d1VUp1Nkt1R25xOE5PWG9vTnMwTTMveklyeENOc2dtTTNkVGpUWTRK?=
 =?utf-8?B?aEJpa1Exb2xybzcwU2pPOXpsS0g0cTBIdXRPOHBzd3ArTXdlM25qOFQ4Wlk4?=
 =?utf-8?B?cVFmeW12cjl3dTNYU1pRQ2Fya1lORHdMZ3h4WTJtdmozcTdaZnljWGZaOHJR?=
 =?utf-8?B?MGc3L0djdGdJUjNTNmZycUk2VzVvK1A3VTFFUVBiZXZkT2lhbE55SXlvVGRK?=
 =?utf-8?B?QzBrb2wzZ21mYVV4U29VV0JCb0Q5S3VCWlV2VTIySVlDSy9TdDJ4YjZwanpL?=
 =?utf-8?B?dkptMkErTlRUeEYxS3UvK1JOSGpoRWhBMWZBaXNjL0szOVZnRE5iSll5UzFy?=
 =?utf-8?B?bldBUXNnaU54VEMzM25sRGh1bEVEcnIxLy8zUjN1TlF5dG1yU3ZabndBcmFm?=
 =?utf-8?B?Vzk3RHgvL0lPYjFIcGZGQitXMzZNbzc0TUNiTU1uSHFNSjZpdzBBVCt0alFm?=
 =?utf-8?B?UEtqN0hMM1pPZUREYTlqdFFTVWV2ZWtDajUyRUoxcCtxWVFIakVaMEV2Zjhx?=
 =?utf-8?B?NlE4K3ZNc2hhR1cvZzlBSFpYMFhvOTZMQ0pnTUhIdm9XV0FaQ1RJTjRXdVND?=
 =?utf-8?B?Nkwzb2xkb2ZkT2k2RXVpLzM4NXIxSTI1OHB1Yko5bWJXc0VkNGo5czRPSU1r?=
 =?utf-8?B?Z1ovSWhlWUhvbFdXOGVxeUl4eGtHN1lDM1ovaGw3K29zd0xDc1UzTzNtNlhR?=
 =?utf-8?B?c2hDeG9PdnZXYTVCMzRWaFlxVEMraXdGUlJWOGNwNmNIcUtOMFlVNEtvTTBn?=
 =?utf-8?B?b1M1WkNLZFhxQVVLOXI5L090aks5N3ZBeEY4V2hkTitlU0xwUTk3QllCTXVD?=
 =?utf-8?B?cThDRTk1MzMxQjNOUm1mcFJSN0RpMFdIR3R6bHFReTcwQlJZTFl5eWwvWlkr?=
 =?utf-8?B?TDBZVEhSU3I1aGlsMmRXU09wbWRtM0J3SGtadTg3ZGh5eWl5V0V6NHhWVXlq?=
 =?utf-8?B?UW1iZlZsK0N0enB0bEk5blYvZEJjald3NnpCdythYi8yTk5IblZpdnNmSnZl?=
 =?utf-8?B?dUUvZFRORFQ2ZGFvSCtFMTRuNU50YVNYM1NSRy9NRGR6S0d3K094TW1GUFBw?=
 =?utf-8?B?MFlUL3V1Z2NsaUhjTXdQTStjY2pCWDFqMTA2Wi9ieVpsaGNqUktoQjhZcGU1?=
 =?utf-8?B?RnlrR21INjJ0VTlHdDlxTmwyRmx6YXQreWNhZDkyU055eEh0MkdwSWRKVlF3?=
 =?utf-8?Q?NHHgZDhSL6CEc/+e37gF4dM9k0gqKg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e6b640-b6b0-4564-f507-08da6e39a5c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 12:31:49.9126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1668
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzAauOlmE8aqQ9YiYgLVPmZaYD6nKwFuomLrBYvJbY0=;
 b=u31/5jjsBNEuT3bigCiOtlzVHQNFMoDNdEqvQdvH68I8kR6iWek9FIloeRtOyf1gtnO+Kse1l/HVMrIvatlKJFNCdRs2mpzwFNswg/jjvr1CsxbL0HDQMB02Kqu9Q7CCTHyBNvyaypnywOtfFvMqSOgq01ABtncPuqv8h3MDpnjwg+kITuzMb3VdabgQXPPcKFikFFmrALXo4OITYYbgFaInRLIHT/wY/B4KLMZSQxrb0EVS3UiYZXOTLlfb3T60Zp7tGot2MHNeGEXZ9KpfTmu3lsdRzojLyBm7Z5f1LE2q8mV33e7G/mqH2Ydi9MOzWgkV35lLVtJh5ohABw68ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=u31/5jjs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH 2/2] package/nvidia-driver:
 bump version to 390.151
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout,

> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Saturday, July 23, 2022 2:21 PM
> To: Vincent Fazio <vfazio@xes-inc.com>; buildroot@buildroot.org
> Cc: Yann E . MORIN <yann.morin.1998@free.fr>
> Subject: [External] - Re: [Buildroot] [PATCH 2/2] package/nvidia-driver: bump
> version to 390.151
> 
>   Hi Vincent,
> 
> On 20/06/2022 21:01, Vincent Fazio wrote:
> > Adds support for Linux kernel 5.17.
> >
> > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> > ---
> >   package/nvidia-driver/nvidia-driver.hash | 4 ++--
> >   package/nvidia-driver/nvidia-driver.mk   | 2 +-
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-
> driver/nvidia-driver.hash
> > index 7f2248d0f9..6564b8e821 100644
> > --- a/package/nvidia-driver/nvidia-driver.hash
> > +++ b/package/nvidia-driver/nvidia-driver.hash
> > @@ -1,4 +1,4 @@
> >   # Locally computed
> > -sha256
> 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275
> NVIDIA-Linux-x86-390.132.run
> > -sha256
> b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d
> NVIDIA-Linux-x86_64-390.132-no-compat32.run
> > +sha256
> 5226e4842044cffd9096deadaf68934c133da74e05b80ccd21236584b3afb1fc
> NVIDIA-Linux-x86-390.151.run
> 
>   I wanted to apply this, but the hash doesn't match... Could you investigate?
> 

This is a bit concerning because it's the second time this has happened. Thomas had a similar problem when I tried to bump to 390.144
http://patchwork.ozlabs.org/project/buildroot/patch/20211104141910.1840914-1-vfazio@xes-inc.com/#2813798

I rechecked the file hashes on both my Linux and a Windows machine and get the hashes I provided in the patch. 

Windows:
PS C:\Users\vfazio> $wc = [System.Net.WebClient]::new()
PS C:\Users\vfazio> Get-FileHash -InputStream ($wc.OpenRead("https://download.nvidia.com/XFree86/Linux-x86_64/390.151/NVIDIA-Linux-x86_64-390.151-no-compat32.run"))
Algorithm       Hash                                                                   Path
---------       ----                                                                   ----
SHA256          6E4FD2258465F5D5527FE80ABD46DE925A30348B4A84658498A6D75CAF42C47C

PS C:\Users\vfazio> Get-FileHash -InputStream ($wc.OpenRead("https://download.nvidia.com/XFree86/Linux-x86_64/390.151/NVIDIA-Linux-x86_64-390.151.run"))
Algorithm       Hash                                                                   Path
---------       ----                                                                   ----
SHA256          5226E4842044CFFD9096DEADAF68934C133DA74E05B80CCD21236584B3AFB1FC

Linux:
vfazio@vfazio2 ~ $ sha256sum NVIDIA-Linux-x86_64-390.151.run
5226e4842044cffd9096deadaf68934c133da74e05b80ccd21236584b3afb1fc  NVIDIA-Linux-x86_64-390.151.run

vfazio@vfazio2 ~ $ sha256sum ~/Downloads/NVIDIA-Linux-x86_64-390.151-no-compat32.run
6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c  /home/vfazio/Downloads/NVIDIA-Linux-x86_64-390.151-no-compat32.run

Can you double check the hashes when directly fetching the files?
https://download.nvidia.com/XFree86/Linux-x86_64/390.151/


>   Regards,
>   Arnout
> 
> > +sha256
> 6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c
> NVIDIA-Linux-x86_64-390.151-no-compat32.run
> >   sha256
> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526
> LICENSE
> > diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-
> driver/nvidia-driver.mk
> > index ec070e3ca6..f1217b00aa 100644
> > --- a/package/nvidia-driver/nvidia-driver.mk
> > +++ b/package/nvidia-driver/nvidia-driver.mk
> > @@ -4,7 +4,7 @@
> >   #
> >
> ##########################################################
> ######################
> >
> > -NVIDIA_DRIVER_VERSION = 390.132
> > +NVIDIA_DRIVER_VERSION = 390.151
> >   NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
> >   NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-
> x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
> >   NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-
> $(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
