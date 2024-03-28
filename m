Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DE8C54E67
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 04:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D86E40357;
	Thu, 28 Mar 2024 04:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUcQBQ8kYu12; Thu, 28 Mar 2024 04:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB82040348
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB82040348;
	Thu, 28 Mar 2024 04:53:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A727D1BF28C
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 04:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93AFF82105
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 04:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBgo6WVMg-Gd for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 04:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=81033af88=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 400CE82100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 400CE82100
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 400CE82100
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 04:53:30 +0000 (UTC)
X-CSE-ConnectionGUID: 22lO4vQ3Tre3rco/83sC+w==
X-CSE-MsgGUID: igGIw0QnQGKmER0cG2FpnQ==
X-IronPort-AV: E=Sophos;i="6.07,160,1708358400"; d="scan'208";a="12174515"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hgst.iphmx.com with ESMTP; 28 Mar 2024 12:53:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG+AZA5znKh166tn0XemjOcRBLx98l/UX7CIQcCAa7NZMcYLN2RnXsjZdIzZQqGfT/IHoP+btpCHuBVxtiVSkEv+T07bKFsA7D+p9Pko8JikI1ZfJstSgpiitUEfIvV35bz1R1Pp4KZ1HuxW3jzzAJadBD6nzwOBbyAupt75oGu6LX1Z2f2i9ukS5IMs/u+Kxo0mkEfrsMoXzpEEKs1U7XCdJf1P7JUnD0kle6TtqE1NvCBrOyiSdDsHzYOHglWtTCBQlPDE3ei63E3/nf0QRFwQqQM5ohdGMbvHnmq5bgP4Qv41v+8gQ9pQJo9Q+R56NmKsRzwGxvoG8xlV3rPqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4KAd0WJoeNQfCqC/sLMpejKajLMp0snHJum65Jq8ac=;
 b=fY8UClrynoUXG69izXQcXC87CNWgZfuhYw6IkMRvSreIWNgIkSUxbiiblE2S7z/lOfI7n1PU0I860O8NxUA3beE1P/CADt2Y62XR/hSJx9JywxYD1YdeEPIM80uckeRg103QoVHS5TmKmicp/nXdYXGQCB7seyVpU8F/e3S81vt+wj3UAjS1o4Xiwsek3T4KrPAeM1rjDryx96zE1xlv97DBLp/oUk8LezIZm//lVGDBnvR4CDehEFiofPpXc+RWBCrjMbCVv+fKDqUnngDrrrm5b2Ub26Lry1zIzfirDSFnJb0pvT98U5yY1dVqgCswVDfEpXf3LNvGAZnurkcJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by PH0PR04MB8278.namprd04.prod.outlook.com (2603:10b6:510:104::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 04:53:26 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::683c:8dc7:bbf7:1560]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::683c:8dc7:bbf7:1560%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 04:53:26 +0000
To: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] package/spdm-utils: new package
Thread-Index: AQHadlghDrHHF7buD0yx3we6Y1LJ/rFJBLwAgAOmT4A=
Date: Thu, 28 Mar 2024 04:53:25 +0000
Message-ID: <fab4991b435533af2d3659d7e1c8e54c8550a645.camel@wdc.com>
References: <20240314213913.535911-2-wilfred.mallawa@wdc.com>
 <ZgHoBHMS08GuhZMh@landeda>
In-Reply-To: <ZgHoBHMS08GuhZMh@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|PH0PR04MB8278:EE_
x-ms-office365-filtering-correlation-id: 95e70dac-f2c4-4025-b584-08dc4ee300eb
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9j3qGHj7XKC0Ne5iHniNG43+QZDVGQDng0YMden1reb9O644WEuZ3Qv9FIAUMkV1LZm/EUx3cWMb6o0FdvG0bnfy3RVGbBrZJ1cPntbX5RFIywc3SS8fL3aLl3kTnKDjR31/6wLWQAO4e6fY2CgJWUFmwDB5Sb/nyHaGYsCOLgCukG6QdKaP53t63KJ4ry+ghQQoP5mfpyb7+EYYt2lSIaiiM58j07Oz7+PMl7qufKunfLDfCvd7IsaUOwQnq4RtKdcaZilaNRMil/6cq9mrI3MfAX3MFtm3Fqi7wA6Q85w/4odqrLXmKUs+eCQUUd8M68Cl6OK9dYYBvnlxv4xFIyiemhkKCqMbtjlu/tlGQ4/mwF9qRldHkZx1pEz5xh5CmSfJGlL+odhGgc6qiA+IRbYusyQhwsZWetRCXpp8RK3IByQB6H2ZFD2p147poJWCuLr+ATxxsbt6vwBtqMvyCXYMVqGjoFjiWMzMOpAWaXZzXRrbOPPwHsu03YJpx9VS57U4pWCiVLfGRCjB2EN3WFRXpalfZKc21t89USoP88lm4CuMOix5QUCrGYOsIQULYXaqs4Wh/bOgQ6PsUXXzTEzfMGUK3CCuYELyPFVsBog5k5nI6gvVMoyM++ZnrzsH6LFK3KY5SLV1NWpDono4OqjjraXtJdSnATLVEC0mGEuy04ql/JP8L5FXh/4H3T4ACtjbzj6tt0sXPUXGKajMng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N21IWkUzWnFPOEp0RjBqNmZLSHgxQjZwbXhNb0JKVy9ZVzRjUVlYNHVMaXkx?=
 =?utf-8?B?R1BkSmx4VnpoaE03RVN3S3BRdm1DN0l3emhMMFVsNGVPWU0wQUVMSGl5SitH?=
 =?utf-8?B?TDVLekxsbUJ6cWIxYWI4MDBOazlGVnpHVCsxWUhnR1ZRRlRwQk9KTnRRdVgy?=
 =?utf-8?B?MFM4N2NIdG9GYlVjam4vbmpnVXN6UWQ0bGh3V0p5RVNZQ1pwS0kwQmU1V3Vz?=
 =?utf-8?B?b1FaeEJOSWdyMTd6d0ZJMFM2dUFtK2VqNGZaK2J2elRtYld6YlVnTGh3eW1u?=
 =?utf-8?B?YkZUeFQ0VmZSdFQzQmo1MFA5OGJkUno5MU1COEkvYnhIbkFxN09MS0oydzVv?=
 =?utf-8?B?V0lVdmtReGd6NVlJV0N4Z3pnSDlXejRwTksxY2kvQmRmOVlSSGNGR2xNTXcx?=
 =?utf-8?B?S0ZUQUg4ZW9yN1NHTXZSUG9NQkgyRy9GQTNBKys5NnZOdno5MG85M0MzWUE1?=
 =?utf-8?B?S1FrVVY3OHNMNWRLZ1NNbTZrNFNHOXJiTGZHWE5VM3phUWY0S256OWh6dzRJ?=
 =?utf-8?B?RUQyU25keDNkbmJqbjhXQ1VrdkRHWVBHRUtzMmxTWUd3M2gzUlRnazZuM3FG?=
 =?utf-8?B?ZlkvK2hGSnk3bFRXby9WbVNKeEtNeDFSdXgxcTY3dkR1ZlNWYXlqK2NRczcr?=
 =?utf-8?B?R1RlVXpZaG14TUhaWEI0RHgwSDV1cjROMTNsRjdPQTBERC9TWkk2Ykxwbmpx?=
 =?utf-8?B?cno2SVg3aXdEL1c4YXAxZWkra0VsSnprbXp5YlZpVHdid3pXTkh1YWY3TVJU?=
 =?utf-8?B?cWY2Umw2NUtZY1NIaEZna3hwWnloRlF3c1ZWUGVGR3VHKzQ1L3FxWU85RDF6?=
 =?utf-8?B?RVpNWnpFS0RQQU5NMEQvM1krMnYzTW1Ja3M5cUpBZWh4U2M5djJ1U1FrdzF5?=
 =?utf-8?B?L3VNSk5xdlVIYnY3bmJoWUs4VHIxTk5KQ3JrQ1lXMXh5dUU0cFd3d3RUMHlN?=
 =?utf-8?B?QjRGRTBESHZ4ZkpBdll0TExSdVVaRlp1VWk5bEt4ek5xVGlhcVFUYWJVc1Iy?=
 =?utf-8?B?Nkp4TzVVOWozSjBLUUI4eWgvcVRMQk0rdHhLNkl1cGxWcms0Zk1iRS9kQ05o?=
 =?utf-8?B?S003cTVDdzdTRms3NUcveTEzSVB2RTRQMUc1OXlhRmx5alBrcmdpREk3VlJT?=
 =?utf-8?B?d0FmdU5SVHRrK0RsZXZOemxZTFVmeU9UR1N2NWFIRE03MHpqV2t0U0NhbkV4?=
 =?utf-8?B?MHR0VTBESkExMDU2REFSdzdJdUc3ZngwMmJ0OVhvZVZja05NQ3orM2hUU3hX?=
 =?utf-8?B?ajQ0VnRGek1GTmpTdytZOUVGejR4UzBHc3NLYSt2WURqM3oyUjdmQURycEl4?=
 =?utf-8?B?bzBaOFE1azIrZlpsbC9WL0R2QnNqYUZ1Q2RyUnliQ2l6YjlrdGZaeC9MYmU5?=
 =?utf-8?B?enpGa3pqM3B5NHA1MFcwL3ordzNzN0F5alVxSjdDOHRJZU84RlEweHduVEJY?=
 =?utf-8?B?RkNaek9YRDY0THhLdm1YTHBlYkY5UjZibk43SFZqd1hicnQ0ZVZlcHplM1Jv?=
 =?utf-8?B?LytESFUwYUVqVm55QWFHT0k2UVg3ekF5c1FBWGhwZ2RjeG1DRTVhcFdxeFNp?=
 =?utf-8?B?UUpuQW1CVENQTHdHMlNZVEpsWUxsV0JrbU9FUlZBRHBHWWM5T2thYnB1MGFE?=
 =?utf-8?B?N3JqdHNBNFBNd0U3ODdiOUszVFkzQzU2aGFTNTh2ckRZVERLUHJkMzFxanlu?=
 =?utf-8?B?SWQvbzh5T1FVWVBmdTRuS2FFbTYwZFU4MklxV2hKNTFZK3N4YnhTelNsWHpE?=
 =?utf-8?B?QWV5Ti9HakRkOXRMTmw3TU8xaHZFZjlrTHVSaFZ4Ujllbi90SFhZNnpmWmY1?=
 =?utf-8?B?Q244VWIwZ1EwUlFiNEQzU2V5Y3o1cE5adjJ3VUhXanBweHVnOERqWmdUb3hS?=
 =?utf-8?B?d0VEeGYyRi81eGRBUWFuM3p3a05NY0JrUWdXNHRqeU5TNjhWbzA3SEhnYTJt?=
 =?utf-8?B?WDVIU0lpeUNNWDNGRVQrYVZTdVpGSlp5TTlySUFzQUwveVZlUzhxMUw1dXNH?=
 =?utf-8?B?c2hPMXNNK2laNGZEdTBEQVgwWXY5MXovWGx1MWJLeS9kSXZTNW41dmJTYVZk?=
 =?utf-8?B?SVdLSkpBZk45d0gzU3d3M2x1dnVlR1A5UGkrQkl1bXNEbjZueWZFeEFzY1JY?=
 =?utf-8?B?RW9MUGdzZnZPYWpOdG00MkdtaS9GdHBmOUhqRDJINDV6ZCs5b3Vxamo5dUhx?=
 =?utf-8?B?ZEE9PQ==?=
Content-ID: <7B00897F5B51A2449847B9D7329CDF24@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wfPiDJ/bcD/ZXa9ZQG9vtsjS7T6AAeiK8U1Inyy6W8hcudWmIDLHjYl1eIyQO/daLORhXoK5VM27kds3572qMKViCBCmaVBaK4LzQRJBFgOSJEmyiCyxzW+oqpIhD3eEwQ+jTrfcw8XkLeXCmIdjp9U7Fpprqpop0DWSuoMHjTRCky1nUNz318oOFVDczOH0gDts9f2TM6fzwPVceJAX5WQ7hFcWlBczE3VgnlGVe/YZqJFy+rdXv3oGiRN4EVRjaRacGRgD6a6J7ckYAJVN1QkZUwGj30a2l4hWfLT+obzcvwQIek8zhJZseWMb6lNVGudTj4PiehtGaivLGdXh9rY6O0mDvH55y1OEo+unas1soBoKRcVBe32VS/rE6EmL/RUXs7j5j66UXc5Q9FHbyb7Vf5x27ia1hrlR3K8s0VHYQN5bOngmjREMnmVhDyFfUOra+k9IdM/t2oTKwm6lYCs8LiYYKaO3YeQ/EEgBGlD+VTSV+GFsk9GTUy0KGgWjnxZQQAs9vXuB8ky9NIxbBxy/elSifZA8O7U+t4l44Z+fOm9t73zm+FVfWI1wOH16yJQpVSUGxZqN+JqXjCQcl+nZZfz8qF9xV0EklELeCJZg4bThrjfCb5umO1oi1LBR
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e70dac-f2c4-4025-b584-08dc4ee300eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 04:53:25.9425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: asufLl4CWFyW751om3erYnzFCnTZugVI2OQK5CPsnrZqBecRseHLTRjf63Pjggy1VfImkA2krSxGv6MT3iHAlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB8278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1711601611; x=1743137611;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=+4KAd0WJoeNQfCqC/sLMpejKajLMp0snHJum65Jq8ac=;
 b=EyTBcMdQ3RDInS8BvRZOGMvbAGTbXEmFJv1C80ovZ6QVcIFAbjOJn7cv
 W7nhDBUOZWyTF3Zv8cZvT0+HPyluLhK9/y37IeAQm5pt2iTcRExBrZqx3
 f4Jmz7Ns1a3jE/7PEKpBx8ZB1Uu81mv3AS21W4vgtI7KPX3FovU/y43r6
 CoGvEpH7wVRselgcgyXmKGPWrgqQEKikvbwCIofj4jQuHX+k3rYigb4nb
 8gFlEjdCGapy4Gg6Si6rHsgTO11FG1LgPxKpE+wFahuYH1u52VpcVbLIA
 kGWvhrQz6rCBv7UuQ1OAhEastGWSfku8hUSx1DGe7tQbiJ/Di71MRQO2a
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4KAd0WJoeNQfCqC/sLMpejKajLMp0snHJum65Jq8ac=;
 b=rbqDQqDHwOzjdgGGqQ6Cc7fQ6flgHJy4c6PggDNb6bIYKE/7QXkLukln0y7SXnT2Pf5IkIOK0K1zdWq5zRcLmbahl2eoMbVFRIfVWKf0y3q3g+Be/eq9ztMRLSxwWuGYQWCxdmEowpqce5zQTD1nHlgy9nBqGN53DU36Z9Xo2M4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=EyTBcMdQ; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=rbqDQqDH
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/spdm-utils: new package
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGV5IFlhbm4sIA0KDQpUaGFua3MgZm9yIGFsbCB0aGUgZmVlZGJhY2shIEkgaGF2ZSBsZWZ0IHNv
bWUgY29tbWVudHMgaW5saW5lIGFzIEknbQ0Kd29ya2luZyB0byBjcmVhdGUgYSBWMiBmb3IgdGhp
cy4NCg0KT24gTW9uLCAyMDI0LTAzLTI1IGF0IDIyOjA5ICswMTAwLCBZYW5uIEUuIE1PUklOIHdy
b3RlOg0KPiBXaWxmcmVkLCBBbGlzdGFpciwgQWxsLA0KPiANCj4gT24gMjAyNC0wMy0xNSAwNzoz
OSArMTAwMCwgV2lsZnJlZCBNYWxsYXdhIHZpYSBidWlsZHJvb3Qgc3Bha2UNCj4gdGh1c2x5Og0K
PiA+IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2Rj
LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3
YUB3ZGMuY29tPg0KPiA+IC0tLQ0KPiBbLS1TTklQLS1dDQo+ID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2Uvc3BkbS11dGlscy9Db25maWcuaW4gYi9wYWNrYWdlL3NwZG0tDQo+ID4gdXRpbHMvQ29uZmln
LmluDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwLi45N2Ri
YzUxYzZkDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL3BhY2thZ2Uvc3BkbS11dGlscy9D
b25maWcuaW4NCj4gPiBAQCAtMCwwICsxLDIwIEBADQo+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9T
UERNX1VUSUxTDQo+ID4gKwlib29sICJzcGRtLXV0aWxzIg0KPiA+ICsJZGVwZW5kcyBvbiBCUjJf
UEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTDQo+ID4gKwlkZXBlbmRzIG9u
IEJSMl9VU0VfV0NIQVIgIyBldWRldg0KPiA+ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJT
DQo+ID4gKwlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZXVkZXYNCj4gDQo+IE1NVSBhbmQgIXN0
YXRpYy1saWJzIGFyZSBhbHNvIG5lZWRlZCBmb3IgcHl0aG9uMywgc28gaXQgc2hvdWxkDQo+IGlk
ZW50aWZpZWQgYXMgd2VsbDoNCj4gDQo+IMKgwqDCoCBkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJ
QlPCoCAjIHB5dGhvbjMNCj4gwqDCoMKgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVXCoCAjIGV1ZGV2
LCBweXRob24zDQo+IA0KPiAoYnV0IHNlZSBiZWxvdyBmb3IgZXVkZXYpLg0KPiANCj4gPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDDQo+ID4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BF
TlNTTA0KPiA+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1BDSVVUSUxTDQo+ID4gKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfRVVERVYNCj4gDQo+IGV1ZGV2IGlzIHRoZSBwcm92aWRlciBvZiBhIHZpcnR1YWwg
cGFja2FnZSwgc28geW91IGNhbid0IHNlbGVjdCBpdC4NCj4gDQo+IEluc3RlYWQsIHlvdSBoYXZl
IHR3byBjYXNlczoNCj4gDQo+IMKgIC0gdGhlIHBhY2thZ2UgbmVlZHMgYSB1ZGV2IGRhZW1vbiAo
b3IgbGlicmFyeSksIGluIHdoaWNoIGNhc2UgaXQNCj4gwqDCoMKgIHNob3VsZCAiZGVwZW5kcyBv
biBCUjJfUEFDS0FHRV9IQVNfVURFViIgKGFuZCBvbiAndWRldicgaW4gdGhlDQo+IC5tayksDQo+
IA0KPiDCoCAtIG9yIHRoZSBwYWNrYWdlIHJlYWxseSBuZWVkcyBldWRldiwgaW4gd2hpY2ggY2Fz
ZSBpdCBjYW4gb25seQ0KPiBkZXBlbmQNCj4gwqDCoMKgIG9uIGl0Lg0KPiANCj4gPiArCXNlbGVj
dCBCUjJfUEFDS0FHRV9QWVRIT04zDQo+IA0KPiBweXRob24zIG5lZWRzIHRocmVhZHMsIHNvIGl0
IG11c3QgYmUgcHJvcGFnYXRlZCBhcyB3ZWxsLg0KPiANCj4gPiArCXNlbGVjdCBCUjJfUEFDS0FH
RV9MSUJTUERNDQo+IA0KPiBsaWJzcGRtIGhhcyBhcmNoaXRlY3R1cmUgZGVwZW5kZW5jaWVzLCBz
byBpdCBzaG91bGQgYmUgcHJvcGFnYXRlZC4NCj4gDQo+IFstLVNOSVAtLV0NCj4gPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMubWsgYi9wYWNrYWdlL3NwZG0tDQo+
ID4gdXRpbHMvc3BkbS11dGlscy5taw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5k
ZXggMDAwMDAwMDAwMC4uNTEyOTYzNWIwNg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9w
YWNrYWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5taw0KPiA+IEBAIC0wLDAgKzEsNDMgQEANCj4g
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjDQo+ID4gIyMjIyMjIyMjIyMjIyMNCj4gPiArIw0KPiA+ICsjIHNwZG0tdXRp
bHMNCj4gPiArIw0KPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gPiAjIyMjIyMjIyMjIyMjIw0KPiA+ICsNCj4g
PiArU1BETV9VVElMU19WRVJTSU9OID0gMC4zLjANCj4gPiArU1BETV9VVElMU19TSVRFID0gJChj
YWxsIGdpdGh1Yix3ZXN0ZXJuZGlnaXRhbGNvcnBvcmF0aW9uLHNwZG0tDQo+ID4gdXRpbHMsdiQo
U1BETV9VVElMU19WRVJTSU9OKSkNCj4gPiArU1BETV9VVElMU19MSUNFTlNFID0gQXBhY2hlLTIu
MCBvciBNSVQNCj4gPiArU1BETV9VVElMU19QT1NUX1BBVENIX0hPT0tTICs9IFNQRE1fVVRJTFNf
RkVUQ0hfQ1JBVEVTDQo+ID4gK1NQRE1fVVRJTFNfUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyAr
PSBTUERNX1VUSUxTX0lOU1RBTExfQ0VSVFMNCj4gDQo+IEtlZXAgdGhlIF9IT09LUyBhc3NpZ25t
ZW50cyBjbG9zZSB0byB3aGVyZSB0aGUgaG9va3MgYXJlIGFjdHVhbGx5DQo+IGRlZmluZWQuDQo+
IA0KPiBBbHNvLCBpdCBsb29rcyBtb3JlIHNlbnNpYmxlIChhbmQgdXN1YWwpIHRoYXQgdGhlIHZh
cmlhYmxlcyBhcmUNCj4gb3JkZXJlZA0KPiBpbiBhIGxvZ2ljYWwoaXNoKSB3YXk6DQo+IA0KPiDC
oCAtIG1ldGFkYXRhOiBWRVJTSU9OIGFuZCBTSVRFLCBMSUNFTlNFIGFuZCBMSUNFTlNFX0ZJTEVT
LCBDUEUgSUQgKGlmDQo+IMKgwqDCoCBhbnkpLi4uDQo+IA0KPiDCoCAtIHRoZW4gdGhlIGJ1aWxk
IGluZm86IERFUE5ERU5DSUVTLCBDTURTIGFuZCByZWxhdGVkIEhPT0tTDQo+IA0KPiA+ICtTUERN
X1VUSUxTX0RFUEVOREVOQ0lFUyArPSBwY2l1dGlscyBsaWJzcGRtIG9wZW5zc2wNCj4gPiArDQo+
ID4gKyMgV2Ugd2FudCB0byBydW4gdGhlIGNhcmdvLXBvc3QtcHJvY2VzcyBzY3JpcHQgd2hpY2gg
aXMNCj4gPiArIyBtYW51YWxseSBydW4gaW4gZGwtd3JhcHBlciBhZnRlciBkb3dubG9hZGluZyB0
aGUgdGFyYmFsbC4NCj4gPiArIyBUaGlzIHdpbGwgcmUtdmVuZG9yIGluIHRoZSBjcmF0ZXMsIHdo
aWNoIG5lZWRzIHRvIGJlIGRvbmUNCj4gPiArIyBhZnRlciB3ZSBwYXRjaCBpbiBvdXIgZXh0cmEg
ZGVwZW5kZW5jaWVzLg0KPiANCj4gV2h5IGRvIHdlIG5lZWQgdG8gcGF0Y2ggdGhlIGRlcGVuZW5j
aWVzPyBUaGlzIHNob3VsZCBiZSBleHBsYWluZWQgaW4NCj4gdGhlDQo+IGNvbW1pdCBsb2cuDQo+
IA0KPiBBbHNvLCB0aGlzIG1lYW5zIHRoYXQgaXQgaXMgbm8gbG9uZ2VyIHBvc3NpYmxlIHRvIGRv
IG9mZi1saW5lIGJ1aWxkcywNCj4gd2hpY2ggaXMgc29tZXRoaW5nIHdlIHRyeSB0byBhdm9pZC4N
Cj4gDQo+IEJ1dCBpbiBmYWN0LCB0aGlzIGNoYW5nZSBhZGRzIG5vIHBhdGNoIHRvIHRoZSBwYWNr
YWdlIGF0IGFsbCwgc28gd2UNCj4gYXJlDQo+IG5vdCBtb2RpZnlpbmcgdGhlIGRlcGVuZGVuY2ll
cywgc28gd2Ugc2hvdWxkIG5vdCBoYXZlIHRvIHJlLXJ1biB0aGUNCj4gdmVuZG9yaW5nLi4uDQo+
IA0KPiBDYW4geW91IGNsYXJpZnkgdGhhdCBwb2ludD8NCj4gDQpXZSBmb3VuZCB0aGF0IGlmIGEg
cGF0Y2ggaXMgYXBwbGllZCB0aGF0IGNvbnRhaW5zIGFkZGl0aW9uYWwgY3JhdGVzLA0KdGhlc2Ug
YXJlIG5vdCB2ZW5kb3JlZCwgbGVhZGluZyB0byBidWlsZCBlcnJvcnMuIFRoaXMgaXMgbm90IGFu
IGlzc3VlDQpmb3IgdGhpcyBjYXNlLCBiZWNhdXNlIGFzIHlvdSBtZW50aW9uZWQsIHRoZXJlIGFy
ZSBubyBwYXRjaGVzLiANCg0KSSB0aGluayBpdCBtYWtlcyB0aGUgbW9zdCBzZW5zZSB0byBvbWl0
IGl0LCBzaW5jZSBpdCBzZXJ2ZXMgbm8gcHVycG9zZQ0KKGF0LWxlYXN0IGZvciBub3cpLg0KPiA+
ICtkZWZpbmUgU1BETV9VVElMU19GRVRDSF9DUkFURVMNCj4gPiArCWNkICQoU1BETV9VVElMU19T
UkNESVIpICYmIFwNCj4gPiArCWNhcmdvIHZlbmRvciBcDQo+ID4gKwnCoMKgwqAgLS1tYW5pZmVz
dC1wYXRoIENhcmdvLnRvbWwgXA0KPiA+ICsJCS0tbG9ja2VkIFZFTkRPUg0KPiA+ICtlbmRlZg0K
PiANCj4gTm90ZSB0aGF0LCBpZiB5b3UgcmVhbGx5LCByZWFsbHkgbmVlZCB0byByZS12ZW5kb3Ig
dGhlIHBhY2thZ2UsIHlvdSdkDQo+IG5lZWQgbW9yZSB0aGFuIGp1c3QgY2FsbGluZyBjYXJnby4N
Cj4gDQo+IEZpcnN0LCBjYXJnbyBtYXkgbm90IGJlIGluc3RhbGxlZCBzeXN0ZW0td2lkZSwgc28g
eW91J2QgaGF2ZSB0byBiZQ0KPiB1c2luZw0KPiB0aGUgb25lIGJ1aWx0IGJ5IEJ1aWxkcm9vdCwg
d2hpY2ggbWVhbnMgcGFzc2luZyBQQVRIPSR7QlJfUEFUSCksIGFuZA0KPiB0bw0KPiBiZSBzdXJl
IHRoYXQgaXQgbG9va3MgZm9yIGNyYXRlcyBpbiB0aGUgcHJvcGVyIGxvY2F0aW9uLCBpLmUuIHBh
c3NpbmcNCj4gQ0FSR09fSE9NRT0kKEJSX0NBUkdPX0hPTUUpDQo+IA0KPiBCdXQgYWdhaW4sIGl0
IGxvb2tzIGxpa2UgdGhpcyByZWFsbHkgaXMgbm90IG5lY2Vzc2FyeSwgc2luY2UgdGhlDQo+IHBh
Y2thZ2UNCj4gaXMgbm90IHBhdGNoZWQuDQo+IA0KPiA+ICtkZWZpbmUgU1BETV9VVElMU19JTlNU
QUxMX0NFUlRTDQo+ID4gKwkkKElOU1RBTEwpIC1kIC1tIDA3NTUgJChUQVJHRVRfRElSKS9yb290
L2NlcnRzDQo+ID4gKwljcCAtciAkKEBEKS9jZXJ0cy9nZW5lcmF0ZV9jZXJ0cy5zaA0KPiA+ICQo
VEFSR0VUX0RJUikvcm9vdC9jZXJ0cy8NCj4gPiArCWNwIC1yICQoQEQpL2NlcnRzL29wZW5zc2wu
Y25mICQoVEFSR0VUX0RJUikvcm9vdC9jZXJ0cy8NCj4gPiArCWNwIC1yICQoQEQpL2NlcnRzL3Nl
dHVwX2NlcnRzLnNoICQoVEFSR0VUX0RJUikvcm9vdC9jZXJ0cy8NCj4gPiArCSQoSU5TVEFMTCkg
LWQgLW0gMDc1NSAkKFRBUkdFVF9ESVIpL3Jvb3QvY2VydHMvc2xvdDANCj4gPiArCWNwICQoQEQp
L2NlcnRzL3Nsb3QwL2ltbXV0YWJsZS5kZXINCj4gPiAkKFRBUkdFVF9ESVIpL3Jvb3QvY2VydHMv
c2xvdDANCj4gPiArCWNwICQoQEQpL2NlcnRzL3Nsb3QwL2RldmljZS5jZXJ0LmRlcg0KPiA+ICQo
VEFSR0VUX0RJUikvcm9vdC9jZXJ0cy9zbG90MA0KPiA+ICsJY3AgJChARCkvY2VydHMvc2xvdDAv
ZGV2aWNlLmRlcg0KPiA+ICQoVEFSR0VUX0RJUikvcm9vdC9jZXJ0cy9zbG90MA0KPiA+ICsJY3Ag
JChARCkvY2VydHMvc2xvdDAvZGV2aWNlLmtleQ0KPiA+ICQoVEFSR0VUX0RJUikvcm9vdC9jZXJ0
cy9zbG90MA0KPiA+ICsJY3AgJChARCkvY2VydHMvc2xvdDAvcGFyYW0ucGVtDQo+ID4gJChUQVJH
RVRfRElSKS9yb290L2NlcnRzL3Nsb3QwDQo+ID4gKwljcCAkKEBEKS9jZXJ0cy9zbG90MC9idW5k
bGVfcmVzcG9uZGVyLmNlcnRjaGFpbi5kZXINCj4gPiAkKFRBUkdFVF9ESVIpL3Jvb3QvY2VydHMv
c2xvdDANCj4gPiArCSQoSU5TVEFMTCkgLWQgLW0gMDc1NSAkKFRBUkdFVF9ESVIpL3Jvb3QvbWFu
aWZlc3QNCj4gPiArCWNwICQoQEQpL21hbmlmZXN0L21hbmlmZXN0Lm91dC5jYm9yDQo+ID4gJChU
QVJHRVRfRElSKS9yb290L21hbmlmZXN0DQo+IA0KPiBXaHkgYXJlIHRob3NlIGluc3RhbGxlZCBp
biB0aGUgaG9tZSBmb3IgdGhlIHJvb3QgdXNlciwgcmF0aGVyIHRoYW4NCj4gaW5zdGFsbGVkIHN5
c3RlbS13aWRlPw0KPiANCkdvb2QgcG9pbnQsIHdlIGNhbiBjaGFuZ2UgdGhlIGNlcnRpZmljYXRl
IGluc3RhbGwgZGlyZWN0b3J5IHNvbWV0aGluZw0KbGlrZSBgdXNyL2xvY2FsYD8NCj4gQWxzbywg
d2h5IHdvdWxkIHdlIG5lZWQgdGhlIGdlbmVyYXRlX2NlcnRzLnNoIGFuZCBzZXR1cF9jZXJ0cy5z
aA0KPiBzY3JpcHRzLCBpZiBjZXJ0aWZpY2F0ZXMgYXJlIGluc3RhbGxlZCBhdCBidWlsZCB0aW1l
Pw0KPiANCkFuIFNQRE0gUmVzcG9uZGVyIChkZXBlbmRpbmcgb24gY2VydGlmaWNhdGUgbW9kZWwp
IG1heSBuZWVkIHRvIGJlIGFibGUNCnRvIHJlZ2VuZXJhdGUgaXQncyBtdXRhYmxlIGNlcnRpZmlj
YXRlIGNoYWluLCBvbiBib290IG9yIGlmIG5ldw0KY2VydGlmaWNhdGVzIGFyZSBzZXQgZXRjLi4u
IGBzZXR1cF9jZXJ0cy5zaGAgc2hhbGwgYmUgdXNlZCBmb3IgdGhpcy4NCmBnZW5lcmF0ZV9jZXJ0
cy5zaGAgY2FuIGFsc28gYmUgdXNlZnVsIHRvIGdlbmVyYXRlIG5ldyBjZXJ0cywgd2hpY2gNCm1h
eWJlIHVzZWZ1bCB3aGVuIHRlc3RpbmcvZGV2ZWxvcG1lbnQuDQoNClJlZ2FyZHMsDQpXaWxmcmVk
DQo+IFJlZ2FyZHMsDQo+IFlhbm4gRS4gTU9SSU4uDQo+IA0KPiA+ICtlbmRlZg0KPiA+ICsNCj4g
PiArJChldmFsICQoY2FyZ28tcGFja2FnZSkpDQo+ID4gLS0gDQo+ID4gMi40NC4wDQo+ID4gDQo+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0DQo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCj4gPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QNCj4g
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
