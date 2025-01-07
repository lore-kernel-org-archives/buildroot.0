Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5520E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 11:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A67B2605B7;
	Tue,  7 Jan 2025 11:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Vzo77fAlkpE; Tue,  7 Jan 2025 11:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1BB0606F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1BB0606F5;
	Tue,  7 Jan 2025 11:21:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A8C0DB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ACF54021D
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfxUp9MkYOcR for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 11:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::613;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDFDE401EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDFDE401EB
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::613])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDFDE401EB
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 11:21:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKhpIvRyYW+ERiejTPQ7RWrqqymx2wxpKsgpmUQ8Ar1b4vCWNVX7b/NeFTp4lPFAc6NxW4ZMS3xwDaSxSTRJ3oeV2U7Dg1f3SaofCKxLvKkjqNNcUEL3QutLn3Et6qnig6ckBNQoWKG02kWLMp/g+mZyS35BK7i3FfJgaZXCbbCWIUb1k74WVTkvXZUKULRlYEiOuS7YvSpDRLp4MjUccpuRuTuFd+tMtVG7Qh1BOPv2XCJfRB55caj7dwQhK/XtJZN4cdWu1gvluPsJ6PNRLJ3WPblByawSUIfPjwxNM9CNDll9OCchZZ/JaX9ukbMzdcAkRdUopivcQMVV/9X8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTN+0CqKUdWdvPgJDXJDmlcJH3cG6amDecmsqmrzNNU=;
 b=MIPbHbK/aSVYdcnCF1uqwaKBZBNVCbp792EtcNfXSy5hUJRdnRTxf1inktWwHox2B0AZXFUTt+m7FA0MpiyTXktKn9OwkVuGpeChrZ5gNFxLt/NO71knnxEyQgAx8RhuEf3AtP1spfAfa6exwn7w+Eb6YyifRKOqu8QZiPWyKvPildu9siuOrzdRTwINA26/iVsalcWNqYw5AAswJcYH1bIsCTyY3xdddpl0JqOtAY5wJS/J1hxF7b4DhmbFzF1NsriqHINRyExCLsyqMnh2qK40astMeTXtjZCK8qZct+5vR6FVzT2YkhD470eRy2KVMtGlGfTDe1MM7/82e/IzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS7PR12MB6093.namprd12.prod.outlook.com (2603:10b6:8:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 11:21:06 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 11:21:06 +0000
From: "Frager, Neal" <neal.frager@amd.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/2] package/newlib-bare-metal: bump to newlib 4.5.0
Thread-Index: AQHbXQCefVnKVtXNyEaTwLvmanhcebMDqSwAgAACVTCAAAjaAIACsxPggASzNICAABdQgA==
Date: Tue, 7 Jan 2025 11:21:05 +0000
Message-ID: <CH2PR12MB50040D6FAC0E6066A40CD06BF0112@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20250102102500.1420512-1-neal.frager@amd.com>
 <20250102171550.0fd6908f@booty>
 <CH2PR12MB50046D8C2D6E66801E9E3905F0142@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20250102175552.4ab20524@booty>
 <CH2PR12MB50045AF050C6584A7889892BF0162@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20250107105545.7a86b189@booty>
In-Reply-To: <20250107105545.7a86b189@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS7PR12MB6093:EE_
x-ms-office365-filtering-correlation-id: 0879aa3d-b90b-4f87-eeb1-08dd2f0d6096
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?P2aKvNNXQw7PkhWo1KURTo7Mu0TH7/NC4fw0QeCHohb0sbssP/ejRCLGOSVv?=
 =?us-ascii?Q?w5uJ3y2A9LdyzjdY5lDgSB8Q9P3r8xUMWZfx17aT5tKX4UKVFiYf6dYAQNnc?=
 =?us-ascii?Q?taKaMFQ0+4RfNo+lCpa2XUmv0gtnHMalq+TXB5ei0rDRVxAjq+biRZttl4I9?=
 =?us-ascii?Q?lLip1wNn/j/B/rQUep96axMFdOnHYXckwnkDCOvwW6d0XVtXQ4YNLIi6fznO?=
 =?us-ascii?Q?wKD+Jz2siZ0O7EUuMl8XlFcSzdU3qps2UZk8WEySA79BdRCCprcdPw/eaVC5?=
 =?us-ascii?Q?MNg9lSSghST3ULKBuXJXwLioX3sZ9Ogm7j2p0W54+Li1GnrvOIfoyju1uPHS?=
 =?us-ascii?Q?wV1WhLOWzNsQeacaVbdtsYmSH7YNs6N4wE1zoUKcNefzJsAUqGNSBdiqOXfo?=
 =?us-ascii?Q?4gQDF2uQVxEBbHvjWzErgE+IEADXNslUDJiG2+KuHMByh9Qy3Trhw9Gc54SP?=
 =?us-ascii?Q?bk92ipxKxa2vF9fu1qXKFuTGdwmVoMcj1QWVCvuDJK7TwUTiWeJex2Alt15e?=
 =?us-ascii?Q?+JeX3U+tfv0AAlZrVWAMwyNP4LaD3lIXRGvg4VZgDqErhykCWvVcvTZ+r/oz?=
 =?us-ascii?Q?KxXYyKHuG8Ivo+/mVp9ZG5Tp3LlBpgeZCOBxiC4U0Ir/biNYbch3cQEE2CJv?=
 =?us-ascii?Q?ybISw8GGUyWrHA3d1vP9mUrRMcfva+EFr/MiaSlHl17YPMGLOLbllYvvY+aK?=
 =?us-ascii?Q?/4sXiCtjUEHP+ZO/5pLQitCEG3kGncARI+a68OrcBRhESw1WfNzoslHOTMFv?=
 =?us-ascii?Q?FOtmoOBa//gvwDuSqHa2tXz8xSI/OJFDPUnvdtpAQEDjnytHgLkJhQ1EcN9U?=
 =?us-ascii?Q?ZBWbr8YouWnczBaf96m2DCHydh/I1JOXBeR1pdssiVBrWN+z555mxa1d2WRf?=
 =?us-ascii?Q?OdpT0ND5eDYpp7ej9a6PMUbDlnGFWu9cPDFMQF1aDjv7SKZhtrn+tXBiY7m6?=
 =?us-ascii?Q?H4EdLABneeIiEj33XcyJEWwoId3b5P6PpRZUN/qN8hW1uL7vZgH81gnkhV2O?=
 =?us-ascii?Q?3qfH7mPtYGQ2KxtO8KB74CM2EO/aRhq2IbyCSB5TkIH2Jqtn4o/XBAIPGBb2?=
 =?us-ascii?Q?3ga79Clz/6JCiJ1KerX/0Q2jm7gIcI/A8g3mmk5q4KS7HZjHWO1OTmr75neX?=
 =?us-ascii?Q?azuS19gpT0l/DElzNnZSXqkAy1iZeJ4DLwehcndAqvIf3KxqD3iyS/9lbhTT?=
 =?us-ascii?Q?AfcToqx+uyOSRTo2F9UogYwQ8vhQypUNx5lGNJbCUA+EJ4Q0T3AbnUgzKnXB?=
 =?us-ascii?Q?ruCTbsHPAq7WODG0TIp8uqCMOzwBeuklKjM1thhdBHChlnh17t8uarvoaXyK?=
 =?us-ascii?Q?WEn7e2MoERjTYei1k4v8TfdMP2eFcwevrg8c2ULAwq255AVuruX5PC8SSmQH?=
 =?us-ascii?Q?+glUHCkWmo0O6qmtfOup2N7p2jqb+LqbC7PFn1OqBmn7Z6sXK7hi5mb3m3+z?=
 =?us-ascii?Q?UG6g2jNqvEs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T4AllNreXrT7uZ61FkIam6XwpV3bO9G4brup4bHRpnY0+vnBISlZO/HNqdr0?=
 =?us-ascii?Q?7/LviBQ8FUsxA63ObdZEUr3HbBNY2WLeNjtm9E6SEcXAcgC3gzA9QxvYO03K?=
 =?us-ascii?Q?KcSJhANyIsWB0g9x8SUhOmzs463DXy9oYUfrcw/+gCVPbOYAiBrYPQf62Mbs?=
 =?us-ascii?Q?tyyOWfQUD9BaFsbaJFklWoTnuts7EiM281lBIpJZJuDoBwaBs/NHcmcva3yx?=
 =?us-ascii?Q?GBWVPmEIBMmrgllrpXNfSkM8BIcW7GULRx/RQV4Mz6kzwh9jUL4tpa2bzYbe?=
 =?us-ascii?Q?Wyx5fKvQyVWllOimwiZRX6nrws19f2dHnHQz+J/nFjEjX2fuScjTNwjDOCQn?=
 =?us-ascii?Q?YHRCCIzRfSmjALX0giX9N9wZeiJBPkaasBFOinkCKbs/z1PLcRuwt5aDsP6O?=
 =?us-ascii?Q?ok0TO9k2TmP7T4kll/inFBrb5fRSfPx4GqqDI8/ff1kfF/669KKmqyBZaqSC?=
 =?us-ascii?Q?O14sHXeo5WP5sJiw1s/5VK4Gm88mrDkywi11EgSR4VB3PN1glb9RcK7tX7Ed?=
 =?us-ascii?Q?p04jKK26oTtmlc7R/fRlePP3Fd8AB1PeGA1WyCC2ACugS2+RczoEiorHG/Vd?=
 =?us-ascii?Q?wMhWPnhP8ya3zhHaJvG/AjstQl3RxAnkbj+Jz66JreAsvEK082tEybb3BpUU?=
 =?us-ascii?Q?yi+NjnttIwdjPhnyXHODRYvoN/ucCGwjaWaDfCQmbZNwClTCDRsAnOU9m0Gw?=
 =?us-ascii?Q?WW6YhexzwyWNjKzdeFRPu2SsK5fIWK8FUFjzJ0mdpRztVc7bdhAwKFKtjRlJ?=
 =?us-ascii?Q?vxQXlIIOIM5Ot0/IbUaunFYSQgOa8kHPhhb4HqE0/hJStki+PJC5OqJ7spe9?=
 =?us-ascii?Q?VzpNn/GpUPVcAZRxCmDV8ovxPZEbeN3fM+fi6KXx2iP/2jy96rhNNo/4Mc0U?=
 =?us-ascii?Q?D6RCJgOTgd+/HYwkL/rjNCTyEcQk7+CBX3PYcVlE4Xo/OI0P8O0N2PpUoomr?=
 =?us-ascii?Q?JPLKiIqZQ8zDEPcUnJMYSMrA06eqIL7wslECgZRLkZV1IvxjmLhNwHOpmopv?=
 =?us-ascii?Q?eikzDyrkBJIzJdG5YoOnl9vzHptlv5mgqR1zXb0Ya4GfFdw/d9bHPf7IdwDy?=
 =?us-ascii?Q?c/Q1Fa/AyLd2ANMVi+kDiEM3nrC9SPeoNclO4P5afZFsIgJR/h+RXpRT0qe+?=
 =?us-ascii?Q?fHNfYJAQ6+YjD6iCzs7V5Zg9DXz8iJBKMNGb1pltJgyDf9Fd9kAApNY+jSK3?=
 =?us-ascii?Q?KGVjj9JxFFLFFK4KwZ89aY8TuLRoLvukCg8mVtBt4S9xT62w/yGJVJyz124K?=
 =?us-ascii?Q?+oZstFF0LfVwWmpczjx1wYRFB9cLy5Bjg418NJbCyQotWV4EmHpOxNhANBQf?=
 =?us-ascii?Q?SXlW37b/4ep0UyR9BeGq+1wqKI8fasNevCWEtGs+FgnRoS58a4opMl0rYp+T?=
 =?us-ascii?Q?cVH7LuUvi5smVhRRl9MNXeJyyNF84+BK0FCZN2qIjGP/VCu3IfC/47YZT4Af?=
 =?us-ascii?Q?HppJftENGgOFYhjbjBc9KUK1KTwVb416b3+EJPIGsCioM+r4tWdtPKGfSLcy?=
 =?us-ascii?Q?CfDBtEUxUF4PKKusP+AwzJpsCVEf/pOLQtnYKp+T81/P6dLTYsJF+RQAIM5z?=
 =?us-ascii?Q?Jb3gS0T+uL3GtEiSuTE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0879aa3d-b90b-4f87-eeb1-08dd2f0d6096
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 11:21:05.8018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k1ymklseFPEM7k60utoEFrHj5KUvGp4BWCMcGGCx77cBcTLeDjvSsbC8NWbsuLmN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6093
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTN+0CqKUdWdvPgJDXJDmlcJH3cG6amDecmsqmrzNNU=;
 b=NE/P6cOwkymi7mkbIGGEF/YoLkhEZxEnvG5AL+4kUeaoCR3u43Txn3vY8LXmaEi5puGdM/+Twisb5XNcU1oGJD3QsotIh0Op/Lt20Ro894bhVKT1peU0QwdJy46qZrmJKk1yOEwZWdH6xYbmkhdLFmML98UDehv5fhkKPLyslf8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NE/P6cOw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/newlib-bare-metal: bump to
 newlib 4.5.0
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,


> Hi Luca,
> 
> 
> > Hi Luca,
> >   
> > > This patch bumps newlib-bare-metal to version 4.5.0.20241231.
> > > 
> > > The 0001-libgloss-microblaze-fix-read-and-_write-declarati.patch is no longer
> > > needed since it is now included with version 4.5.0.20241231.  For this reason,
> > > the patch can be removed from buildroot.
> > > 
> > > Signed-off-by: Neal Frager <neal.frager@amd.com>    
> >   
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>    
> >   
> > > I also tried to test this series, but then I realized the
> > > zynqmp-firmware patches have not been merged yet. You latest series is
> > > v12, June 2024, and does not apply to current master.    
> >   
> > > That means the bare metal toolchain has no users in upstream Buildroot.    
> >   
> > > Any reason for stopping after v12?    
> >   
> > > I think it would be good if you could rebase on current master, apply
> > > the changes requested by Yann in his v12 reviews and send a new
> > > iteration.    
> > 
> > After creating the xilinx-prebuilt package which combined zynqmp and versal
> > prebuilts into a single package, I thought it would be better to create a
> > xilinx-source package.  
> > 
> > This is why I migrated to the following patch set:
> > https://patchwork.ozlabs.org/project/buildroot/list/?series=413161  
> 
> > Ah, right, I had totally forgot about that. My best excuse is that it
> > is also from June 2024. O:-)  
> 
> > The main thing I do not like about it is the versal pdi file.  The only way to
> > build a versal pdi file is with Vivado, so even though the same microblaze
> > compiler for the zynqmp pmufw can be used for the versal plm and psmfw
> > applications, the pdi file needs to be a prebuilt binary.
> > 
> > Because of this difference, it may make sense to create separate packages for
> > zynqmp and versal.
> > 
> > Perhaps the following concept would be best?
> > 
> > For Versal: (two packages with a dependency to force using both together)
> > boot/versal-firmware: builds versal plm and psmfw applications
> > boot/versal-pdi: downloads a prebuilt versal pdi
> > 
> > For Zynqmp:
> > boot/zynqmp-firmware: builds zynqmp pmufw application
> > 
> > For either of these cases, enabling the firmware application should be an
> > exclusive or with the xilinx-prebuilt package.
> > 
> > What do you think of this concept?  
> 
> > I know pretty much nothing about Versal, however if it needs a prebuilt
> > binary then I think it makes sense to keep the various packages split
> > as you suggested, so what is prebuilt and what is compiled by Buildroot
> > is clearly differentiated.  
> 
> > In the meantime, for testing the newlib, you just need to add the following
> > lines to any zynqmp or versal defconfig:
> > 
> > BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
> > BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
> > 
> > This is all that is needed to verify that the toolchain and newlib are
> > built correctly.  
> 
> > I tried that and it worked. I also applied the v12 zynqmp-firmware
> > series, but it had various conflicts to fix, and at the end I got a
> > binary firmware that does not boot. It might be just my quick conflict
> > resolution that screwed up things however.  
> 
> > Luca  
> 
> I have a new idea for building the zynqmp pmufw as well as the versal plm and
> psmfw applications.
> 
> To be absolutely clear about what we are building with buildroot, what if we
> name the package boot/xilinx-embeddedsw after the Xilinx/embeddedsw github
> repo?  This way, it is clear that the package is building from this repo,
> and we can make individual config options for each application we wish to
> build.
> 
> Such as:
> BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
> BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
> BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
> 
> An added bonus of this is that we would have a single package which could
> easily be expanded in the future to cover other applications in the repo.
> 
> For example, now that bootgen is part of buildroot, we may even have users
> which would be interested in building the fsbl.  This could be done by
> adding more configs to the package.
> 
> BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQ_FSBL
> BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_FSBL
> 
> Or even the following applications for Kria:
> 
> BR2_TARGET_XILINX_EMBEDDEDSW_IMGSEL
> BR2_TARGET_XILINX_EMBEDDEDSW_IMG_RCVRY (BIRT)
> 
> We could also expand this package for future applications such as the
> Versal Gen 2 Application Security Unit (ASU).
> 
> BR2_TARGET_XILINX_EMBEDDEDSW_ASUFW
>  
> Essentially every application in the lib/sw_apps directory of the embeddedsw
> repo could potentially be one day added, should there be a need.
> https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps
> 
> Of course, before getting ahead of ourselves, I would start small by
> implementing only the zynqmp_pmufw in the first release.
> 
> What do you think of this idea?

> It looks to me that Xilinx/AMD is consistently using the embeddedsw git
> repository for all of the various open source firmwares. Assuming this
> policy is going to be maintained for the foreseeable future, I think
> your idea is good.

> Luca

I confirm that this is the case.  All of the platform specific boot firmware
applications will be consistently added to the Xilinx/embeddedsw repo.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
