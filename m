Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F25C87FD2
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 04:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20337843FB;
	Thu,  7 Aug 2025 04:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gjkdzo9Bfs1a; Thu,  7 Aug 2025 04:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04E318049D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04E318049D;
	Thu,  7 Aug 2025 04:49:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17DACD79
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 04:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 095896F581
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 04:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i75E2uQmpA0g for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 04:49:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::608;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C80296F551
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C80296F551
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::608])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C80296F551
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 04:49:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRQV7CedGpJb7Vu1myNR9AqjySdtcFn/yejZuvH0voH3hDBVUQ7Pp490wYFeuqNjfuDuPstKqcYHJaD2PPFueC8GHdyq4W3cHgKadEyz308gZ/TbOWdQxCW4Af7WZHcu9dd55M9VdjYMvMXCaJhiE/8Lr8u/kTb2KubUsXQC3rWGdyLC4cYvi8r1VIYP8ndkeFT5i5cFwRAYSJM2ivKEzDInuFAJwcVqwvQNvRpdZN6zFvy3kdRN4iIh0DGn9yCYD2Y3sJpfv+yhiELRw+Y4zYwe7nNm2dXiB/krNHsYIwhOKzmo1na8WFSH3PNwJq5NsBvoT8bNGajeDIS+aHdkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBpte9/D3RQSiDZfbSjTAO+fx9RXTtnD8q72UVgnpSg=;
 b=IHDT9x/uLYyxAXgynEIRM2vtZzdngGk2WLK0y+dyKS09rAzc2YhbSpRR/gGpdqk2W8xumHIz6197v6hKF4p3GUq9P7QYT3tauJp13EZu7tNoKhHt4d7zpOLfWEsDvyelKNWXhbHdz9TcHN8V/DuB5B+Hd1IRuz8J8GSPO+IflLdzq2SfaEyP38oyR/9xLyfpFp0vkZXDgSSi7tYRrc/Uvq+oyorXWQ814ETLhSNhGKWgxa1HRwW7j9gdA7ikdc3nsvQRbEVREt/s9qi819PfqcVfjI3btHnohswv04FQIEFQINWyhCoQPD+Be8Ofv5nyI1oHKJ5+F2qoihoeAVeUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 04:49:14 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 04:49:14 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
Thread-Index: AQHb/3tY44weAeBzXUS5kQIFu+ZUxbRS8GKAgADFLBCAAAwggIAAJYAQgAAJrwCAAi6DgIAAjrMA
Date: Thu, 7 Aug 2025 04:49:14 +0000
Message-ID: <SA1PR12MB5615FFDB150AB8DDC324A977F02CA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250728045145.132333-1-neal.frager@amd.com>
 <20250804214047.5cfcf471@windsurf>
 <SA1PR12MB5615611A10ADA56A9816AAB7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805100953.380f13df@windsurf>
 <SA1PR12MB5615E2ACED00D66546CC13E7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805125846.31c941c1@windsurf> <20250806221745.03c267a0@windsurf>
In-Reply-To: <20250806221745.03c267a0@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-07T04:48:29.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|LV2PR12MB6015:EE_
x-ms-office365-filtering-correlation-id: 22835280-022f-4301-2ddd-08ddd56dc23a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lQ5reUlXL7aPVp+Og1XmIRQ1OFGS7n22gzOfsGETJlZTzKzRf7/zNhHM93wf?=
 =?us-ascii?Q?WaP2fauYIqT2scoeAehJNHH41Pkcp8lSly/rej9CMQKfGMZHHu9zMbxEue+C?=
 =?us-ascii?Q?YBBCSVkIUIT6aH1AcN6uujJzhqWOqplU5GxAgRPOLX/Aa3/rDkMzUkJR/Y0Q?=
 =?us-ascii?Q?NGa1fSM/VBF++r+tqKosmp7b+5OaQmO1753QZ6iPaZ03WJq+WNrNRfeZT4fi?=
 =?us-ascii?Q?NqpZ70XESyCNPef0BMGpvirjq5uDNpPn9CFi3BBZ9TIv3kkm360n6cjNNmCf?=
 =?us-ascii?Q?4hb/CPEKYOjy2igIJ29csigbYUujvCw65LuYXJMol0SS2htgsLA2g8VOEVeo?=
 =?us-ascii?Q?3EGeOMHgt6DSQYFlPM5T6iLEkebGV+MMUeyxjt3pci94GPkF/erUVtu1MiZ9?=
 =?us-ascii?Q?jiWdRflhO6Qkq3GpTHgcXoXy6rJupUIfLMN9SpK+9+pLE8gp57LFveoUzWYN?=
 =?us-ascii?Q?tV8TNb1DmMSx2+dKOh3cX1zSN/wtfjNdEMTdZkPxgn1mg8l3TlK14xU6BwvR?=
 =?us-ascii?Q?+yqH17ZkTZ0uS4nRAPpVH+/A4lSc3qWwH5v2gz+UuBStPmn6yfdYY2rhNLy7?=
 =?us-ascii?Q?w1UfsPwuvah8WoDujAtr0A14IzmbT7xLmg+PV4I5hDIfW8S9Wc2PhaIGES66?=
 =?us-ascii?Q?+MMFYtiDz17YT1mmGwkYJjMHA+u2/+umiowbXzKTp0IFco0dDmqKHcT5EFrM?=
 =?us-ascii?Q?VcdCLODPFW0PBNi9m6+thdng1KtCmka4J2TUFS85Uq6jHryue7EvsXxOsl1g?=
 =?us-ascii?Q?3quwbkfmwt2aYNVhea+FtDuqsHGAFF07Yito6hoAewEG525GTzgWIkK1SEtT?=
 =?us-ascii?Q?PMAJZwH2eTP6LQ6/ZXABDLx532//+DwHDWdP68CIlarJGSCim0GRoyVVdqYa?=
 =?us-ascii?Q?NPUjK4fPp6hW5qaUqfTIEYWr4+XcPdkMvSGLC4SbUPCkcBZt4f+lCaCzDY48?=
 =?us-ascii?Q?L3zvVUf211UgLcLiat8UHKHnFAkv5bhnm8P+9pQ95MUw5e897rWYrIBjMuW5?=
 =?us-ascii?Q?jOmC9mQJJAzK9Ca8ocy3ipYpJQvobqeVe9bx9zLAwfZ12kBRMyeb44djUoqK?=
 =?us-ascii?Q?wGnT5RzhdkznqMI5bYf/VsFdR4EhMKC4D1aodiD/t8dsU2sVc07nAYrQCb6l?=
 =?us-ascii?Q?f/kp3BT6Q0UBFdIjPhAjFvTVrHK7pD2vP0B/i1nfJIBDO6cLaUiXFZWUgwXN?=
 =?us-ascii?Q?8QStBtGYKqJFIOpP1Sg3iQmcsoxLU391zCVuUCkjk/Iz9alEvoMA/3xoFhJn?=
 =?us-ascii?Q?E5ns5firurxkmDdpISsYp6vuYL2BKhoT8tWLyuv1KKov+P0g4FUZlLqTgpVj?=
 =?us-ascii?Q?kKB9KCdKPuCtKIQ7nKzqY2J4JpV6kmGVJbqPo9v3Mf7jkCO/F64jlDrE+cv/?=
 =?us-ascii?Q?gXB0CrHpjVcsltJ/BB01nz5hiN0ha719GmdgR23zB584VRzg+nRLZRcyC+PU?=
 =?us-ascii?Q?tdX3nzKVYcXJNflRsKJgKW+2iHO7NwYx88lrbhOIm+zJiOZxU4bUcidej3gF?=
 =?us-ascii?Q?Ms/aaRO6nfDKHBCe2SRmZFzm2WmVWrBx97A7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?528SU1Hm5T0Js2UIqQM7xGT0J1WQpXmWgFaAK/SC6l9Lcc+DTvm1uGLVQ2Oi?=
 =?us-ascii?Q?hTxwL2tnYZ1B2/hjNNUYV0J0b6vpfRDkohca2wRZDKCsApwvjXyXINEZYcRI?=
 =?us-ascii?Q?aqlzxeMiC01vpLiufT5V3xdolETvilDYEe7sMyzWHoa9ITqWJneZxcYUa5C1?=
 =?us-ascii?Q?TCGwrTMvbCvDPSWMfl6LHC6VDfesrY7KRxa75wWdhvhAa3sl2a8rAyrp35hp?=
 =?us-ascii?Q?i3z1o7LNkeVsJDND5cdygj1i9x3uN3LLGQ5+NbkQPQKYPGUJk5CrBta6L3HY?=
 =?us-ascii?Q?4qfvjYLCsdWhPXq7K4fHl4YFJ3q3aStxWyIBdJEO2wtcWMSCKC7N5QrqsRFa?=
 =?us-ascii?Q?bJlyUJG4Hli6EBhf9d9EvMeHNsSiAxEM8n1jUcRTV2Py1vaGik8ZI95sFXA0?=
 =?us-ascii?Q?W4rjSfENGs80Kkq9tn8wZ+towHdDQZJQxDySlT9xSwMGSS3Wut+9pkOUPjyC?=
 =?us-ascii?Q?hG1SF5RhwDdBUPFJf8NlTOAtAbUpkheEsbR5DpEb9avG6oexqPcwWQkosG1O?=
 =?us-ascii?Q?5fdcUErNo/7RC7nyYsAQkB82FOr/xg86csLwAgJa4217NbNsbLMXc4G9x0tY?=
 =?us-ascii?Q?3tlav0rZ2h8ONfueKwPwJRCPc7T3OQpYZMQYmCYINLKjxUDDZJxGBwOGJbAd?=
 =?us-ascii?Q?ai/H5N6fSMmTFC1RTaoQKRQ7ip6MVfD6tJvQsH5NFX3l9KQu2ffTt3eGmZ6Z?=
 =?us-ascii?Q?aESfHhoTqdOWG/HNOGIsvDIkrrUeNz69OK8IgeCTUQZfGUqhNHssEp+LDrF0?=
 =?us-ascii?Q?m7srbvGBnf62z4yg0y1nzo22PK8t23RkbrjsysKr+7YXrGrUwCDIXoxT/SAa?=
 =?us-ascii?Q?Mxb1IP5RafEsWpmuOm4jSlpQaFd7bakixkDNpGtS83gzlJzptAx+rJ2DBrgb?=
 =?us-ascii?Q?lu5AJgFgLThbS7bNsWtxQvw6vX8cgGVRgXd82GCJ19h53yT8Ci8+OVVdyIx+?=
 =?us-ascii?Q?iAQZmndQw55krvVzBexRBfzMjD/NoQ8a9XAbXhabWGJCerhddVYxzKJxkRxD?=
 =?us-ascii?Q?/vTKaNyRwmFugWajKO2wUPUHNVQaHD8thdv8BHcwLydDEiOT7KhzvTPHeMd5?=
 =?us-ascii?Q?8V4lJeQcuo4QEMH3c3NX8On4Ns/uNSAxns9t367BOYsfkwsoO5LVnlGLOWk4?=
 =?us-ascii?Q?xYnJgcEGhkGs5JrXk+7t1yFXXlZbxiUtq/i/hyR1gbGtoBi5BHi28t7gPMTU?=
 =?us-ascii?Q?FIrg2lGn3d4JgWfFQEHR/8p1SY5zO30OnrJsa5Pm5P6QVy9JeJLeZ5TWEYF6?=
 =?us-ascii?Q?tuWNTVaUGpUnakElxdBpbfjfGnqJUNtOjwU18S/AJ/2/yMeZ8ttrCbeM57C7?=
 =?us-ascii?Q?0MmjMAV4iblKYpSnUZoS2HmfsnzaIEOSDRHImEdcgPjqXDr5o6FUqrES/GeW?=
 =?us-ascii?Q?rxojgsJ5l7FOEZXSi7c6qROHqUSz/w0kZii8Ov3Fcck2xiD+lJ4zSPOmYSPX?=
 =?us-ascii?Q?wt6f+Low6H4WeDqp1TSAn/dAvJpNL547K6+27PPIX4jZJBVb/ghPFqaeYm/N?=
 =?us-ascii?Q?ChN/PR5lnURZeSPvRJW5IFKFu3ef1HZ1uP0HJMp/e9EfaSbrOIHqK5TbO++S?=
 =?us-ascii?Q?YZEqRU5NNysdcX/Dqjc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22835280-022f-4301-2ddd-08ddd56dc23a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 04:49:14.2686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkcrgkWurNz9FscwOe51xJ5QOhyD0vGJPArg8qT41dDCYP+ltgGEkRqrbWEIGCNX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBpte9/D3RQSiDZfbSjTAO+fx9RXTtnD8q72UVgnpSg=;
 b=Vo1k7aJZtL26aNl9C115s0Fkr6o44z7gUcQhCSfKspfmzRNjG9cZC3S3UGzntTgB3Ul39qkHBAnT8FnxwUKFigUP71/Fuaugh6bJWks1j9aTEspRxi9OE3v6xAdhZmRi5XNZe7vmALcow4BMlkbWyTU0KIr/0QmZXBiLUn3ICt0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Vo1k7aJZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Thomas,

> > There seems to be something specific in the init script that is failing.
> > Should we consider creating another gcc bug report against gcc 15.x?
>
> We can certainly do so, but we don't have a lot of data to provide at
> the moment :/

> I went through the tedious process of bisecting which GCC commit
> introduced the bug, and therefore collected a little bit more useful
> data and consequently submitted a GCC bug report:

>  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432

You are amazingly efficient!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
