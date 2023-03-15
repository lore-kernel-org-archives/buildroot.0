Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608C2C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 19:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A97DB6114E;
	Wed, 15 Mar 2023 19:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A97DB6114E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ienB55LZIACG; Wed, 15 Mar 2023 19:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D508E60BE0;
	Wed, 15 Mar 2023 19:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D508E60BE0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 032FE1BF283
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFD898141A
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 19:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD898141A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8YkLjLZtIKX for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 19:59:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C013C813F6
Received: from DM4PR02CU001-vft-obe.outbound.protection.outlook.com
 (mail-centralusazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C013C813F6
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 19:59:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwIbKxDaIqIUV92kHFBzFKHOFVWR8zZ0oung3Wk3gOWVkWnr1OyBUS6Opry8KxtKQNUJbvR7ys3CiIQXBvOoFI24BeT9DEPMDKW3UrVGxP2of8sy5hulK9EYLV7q0jQANsCCerdP2WR1QlZh1UbjnHgTRCpoETCEjbKSXI5kQhltkuuKhc2wtdnNbQbx5hV5I85j4XEf+2OQfMZCv8gXCHgQme+sSmsM//b6KdbqbpGiyiyhXFTIEuZ+IHte1wOI4KDAfN6badBU+AqSwcS1+eUAT6TQPembrJTXNvbOPTmizl+TuU17tSGNTDxvJwgb350CyNS8sDxVZoyw2jyYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCRPajH3vS5D7a1W+WyPk7ziMxELN1x3JPCZ89rzwUg=;
 b=Tu9MXsYGBYoN+Ji5nQwaCO9K5WRNZUO0QuE5OVbOtSOZc1WDqYOQQ64fyvGL9N93snETUFepu5v/YQ3N1qcB9FMvcikcrk7SJQv48fbczVOuz98g8wtQAJ2wJVO9Dtzq89joJ2vIuMheLDrCZhE4RdXWquIta1GI7cTmReF6lH59igGc2mtdGBdP60ZIvgPRRO6gg/Ow7l+VeZ2RXRLdJ0ZMaYKW6CpLZ/Zab806L+sym4PE6NybWTCsRRQ5NHXZJM1/fD/K+d9UR+vme9e2Tk86ed9wHjTVj+5rl9kIGk6WM/snP99/wog/3WJeBx7Ob4NRwMrZ9N0FEq+C5wh/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH0PR05MB7622.namprd05.prod.outlook.com (2603:10b6:510:49::8)
 by MN2PR05MB6559.namprd05.prod.outlook.com (2603:10b6:208:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 19:59:10 +0000
Received: from PH0PR05MB7622.namprd05.prod.outlook.com
 ([fe80::e15:a6ce:260b:b01]) by PH0PR05MB7622.namprd05.prod.outlook.com
 ([fe80::e15:a6ce:260b:b01%5]) with mapi id 15.20.6178.019; Wed, 15 Mar 2023
 19:59:10 +0000
From: C D <dellicker@live.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: Forcing linker to look at right library path?
Thread-Index: AQHZVw5Utjh19g/7jk6GqYyjqpAzvK78Puzt
Date: Wed, 15 Mar 2023 19:59:10 +0000
Message-ID: <PH0PR05MB76228FDB895F3F8CA6A44C6DD4BF9@PH0PR05MB7622.namprd05.prod.outlook.com>
References: <SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99@SJ0PR05MB7625.namprd05.prod.outlook.com>
 <20230314085823.5a37e5e9@windsurf>
 <SJ0PR05MB7625BB7889E5DD3876C01E89D4BE9@SJ0PR05MB7625.namprd05.prod.outlook.com>
 <87jzzi4h51.fsf@dell.be.48ers.dk>
In-Reply-To: <87jzzi4h51.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [zqzDFLLktkdh7xybX/cr4TeW1v2p0hqP]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR05MB7622:EE_|MN2PR05MB6559:EE_
x-ms-office365-filtering-correlation-id: 7d742ffd-b2b5-4c82-fd67-08db258fbe10
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bqKtslEdiWxqidOFpJX9qMXeEJSI2ZOwiITlNcrIJOw3cplML3MT4+NA0o2GiqUW6Plamrvo0e+6QKSpkc1GmLkOAMsXqa2lrIXoh2lVNyLd6Q3EJCyMHw6FKbnIbArNXZY8L0ry7wtNCHt2K3y9LtoVety3oE9/lLXy+UI/mdrR5aCLIIsB0EVEgAqDobnIdg/Hp+9wqciKQy9+Ktn0O03h1cJTEQiVDTgIYxxBdWBggnTNzcRW3sWvEBbrky9VtmYdSnmHDmUuvMZRgXIVfpHbtGrvVVWNLc5J+WQFxJ9AtE/KTe6UQzCiWAy0E7q5FU+FqETmcIByNSukL803ZB2D0glsjsM2jZPuCr8sZziSBZXwpyEqd+sBAdVdQetpAxuj9BmfDwe3PlaNgOPTzE+SX9EwAHH8ZdtKes7a8o/C9RutO4sBQE1I4l/EDr4Kas7gwShxTeFQpFyBq4i1s6my70Fc7yZpt52M7OERNi6bcxMDwqjPe4RB+9LJQEmMKTIJcvsgEXiYmifcDjoHsd8d2MavvTUyFQpC6HcgTGBVcfTC03wQsEwft4lhedDfmKzgcUN/KLZR1G6dwoU5re/GPpjmSIDPU8ugiCoRVIUWAUaDRCOTH2XvfwVFaM37xjYze7LnTc/N/SzQQ9D+0Q==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?k6VNj2dXnz9Nx/HkC4IRqHSytZN0PQgqsx2QB8BWAaOl7dHS1us0hcOkpO?=
 =?iso-8859-1?Q?PkJNqHLgRMqj4nJ0cbvNb4wdQUVDu6PpCjSvkZjEes6fXa+TLFM9fcC9lx?=
 =?iso-8859-1?Q?sfIUVT1M36rkUhbRdmaQ1I9nt6gbLo5HJ87ZHZmLzNnQStesoigohDCPSd?=
 =?iso-8859-1?Q?b4EX9gPAC6r1gWGwT19t1wSNYiVKheBvUIEIyJvfPcJvR+2WqpB0cs8UjH?=
 =?iso-8859-1?Q?Eosn4YPZpuUhM33XbwCfWAKUr+A8cq4dZctx3zMute3Dfd/BlibdAKCpR1?=
 =?iso-8859-1?Q?SeASl864RAEh+Cj/5HSlae5a91NrTxXBhNyursHgbIqu+ZmcVaVFoMn/uY?=
 =?iso-8859-1?Q?KM61xkdyK/3vpn0WXK1JFhTG4ISdNGr0yZH2bMoMHwPsQtoFPZPh8OoMeh?=
 =?iso-8859-1?Q?2aUozeeBkynE4pkGOL/7YEb3kq+IfQZz55/28Wqz/2/JtsrWC74VC8vt+n?=
 =?iso-8859-1?Q?RRaLEApAOt298doTk5dxxA/qRqyy3h02Yp85mSLRIn7W3om86zlkkN4Ny2?=
 =?iso-8859-1?Q?/FvsIBEileRIXN5makzaFFM4QfP+kOKAbTuWvWdgKMGTxRmcMVDdjOUt9w?=
 =?iso-8859-1?Q?l6gsiJP3Rof3pEamqbsYE1+61+UCiC8SpnEGkZBAwIyup5XguF9iqcaPvF?=
 =?iso-8859-1?Q?7qisUC3YuN5EWRTVRNZPrjvJso5qhqoLJnteQm9xEBrhAUT2NLKFOQfty1?=
 =?iso-8859-1?Q?BOrZVeTSiTWQ/EMO+bnrYij4aGa3YGxCRetS82zArYSRyR7ppE8s1T66Nc?=
 =?iso-8859-1?Q?XVkUvb1k03/wOpZjicrWVOAj/HJKpNgbfU8rBowsXO+/8PmZLkB3yK0TdF?=
 =?iso-8859-1?Q?9vpIYO4RWJpuoHzq2MbnUF08VNVzkad0vy4i1e7awm3aM4JJGSdraoNxz8?=
 =?iso-8859-1?Q?L+tET/W7cOmqJFTyN9SsIlqT8xnkH64cHLagEHqpChaC0NEyQ682iSEDmf?=
 =?iso-8859-1?Q?6NYqq+qYncl+C9YNOzWs9YwCM8MieVHGdAU2MFwWN0sMCXTA4RiotIQUOV?=
 =?iso-8859-1?Q?M780RjWp5YU6EC5Cm4AujZglENHzVtm9JI2TjCb9jULN4LeRTDeHWJJQ/S?=
 =?iso-8859-1?Q?V7W0Mokt9sOzs9z9n3z+EHQDKKaNG/WbZAtsszXxPU9LfgBxXWkvFqjoTh?=
 =?iso-8859-1?Q?p/hj5ZqxqYPx+otNxbYbFOZb5ISR0T2eSpyOvEzYRhTAVHjqEckOU+64iD?=
 =?iso-8859-1?Q?F791W6BNuGsDNfov4TU3o64KfQ8AvCvVoULfttLvXJIz6xefE7YyBVi3lB?=
 =?iso-8859-1?Q?R4b/22NhyNTo9QP9YHDmS34eFSeJOevb9YpsyYe0vedBwAeh7J2srnC/YN?=
 =?iso-8859-1?Q?D7h2?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR05MB7622.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d742ffd-b2b5-4c82-fd67-08db258fbe10
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 19:59:10.1924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6559
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCRPajH3vS5D7a1W+WyPk7ziMxELN1x3JPCZ89rzwUg=;
 b=QLiIIQDJ66oYOpnymu0wPb7pTc0kb4O57TrQc6FsL2L28ovEwZXiSH9QsYCPMnGNK+p467joyY86KPV2fMCKURjStnXko1myEn3Q+dewndVgpG4vtSjBhTXWfWEtQ04PLJRf1hmruO5WfLmXA3qvRo7IkvuxZm4YWUPskz41vjf3/KaQRf7N1Rt5x9YPgFTYx4hVfhDFN8c5D2sloq8ZpnhA9L1ECpPDXN1Qu1qV4VcypailXdi2h5byZIjwMRFaqvsZLW/PG3FJ0COBOMU/PK5gGEwS0yyNT75TVOYuYFfxge0OGpUrgCHxHIO+SwIuL6p21HtkwWyiQ9gYOKswzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=QLiIIQDJ
Subject: Re: [Buildroot] Forcing linker to look at right library path?
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> From: Peter Korsgaard <peter@korsgaard.com>
> Sent: Wednesday, March 15, 2023 12:18 AM
> To: C D
> Cc: Thomas Petazzoni; buildroot@buildroot.org
> Subject: Re: Forcing linker to look at right library path?
> 
> >>>>> "C" == C D <dellicker@live.com> writes:
> 
> Hi,
> 
>  > I'm trying to build sedcli
>  

<snip>

> 
> It sounds like you have configured this as an autotools package, but
> looking at https://github.com/sedcli/sedcli/blob/master/src/configure I
> see that it is a custom hand written script, so that is why it doesn't
> understand all of these options. Use generic-package instead.
>

Thanks, that's a helpful starting point.  I'm a bit down that road now, but
having some troubles getting the .mk file set up correctly.  I'm very much
still in my early phases of learning how all this is put together. :)


> Notice that we already have a package for sedutil, which sounds as if it
> does more-or-less the same as this sedcli.

Thanks, I did look at sedutil also, but sedcli has a few important features
that sedutil does not; most importantly, it supports KMIP integration which
is essential when using it at scale as part of an automated boot process.

> 
> --
> Bye, Peter Korsgaard

Thanks,
Chris
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
