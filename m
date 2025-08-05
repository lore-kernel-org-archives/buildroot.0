Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E93AC87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 10:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9480A40C72;
	Tue,  5 Aug 2025 10:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A--d3RJzQmeo; Tue,  5 Aug 2025 10:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DE3740C0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DE3740C0F;
	Tue,  5 Aug 2025 10:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A08A7118
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 10:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DBF461779
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 10:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2tEV9W8ovcV for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 10:31:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::624;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BADCC61511
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BADCC61511
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::624])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BADCC61511
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 10:31:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVUfEuXxFBlC53gAd/nxiJdVixIPvEgO4YCHcJgfsft41PAhRE/VJULZlB5dov9t+Xafv6efE62vltKFbOA4Cfhd+99rcrcseUkJtfpTNZycp4bJSKIL/XhWPFtvb9dUKjaYNwGGU2ixgONKrOna25gSkZQyZUhk2JFbKtMGo4xySubgqJaAlv2J+D8MBXqN5LEzHXkxiUJmN3Gps9fpGuYpxotxcsw/QlJUqzdVJ3CFwsVGaep/wEOsNozvk0pk33UWogDCJUsyEed3v9bZHjfyYM+zMmm/93XvKiolfFwnlvLs79G4eQ/7t/sdhOeqYukQJ2DlkkRmOdKNqRNaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muvRArbJByeMlYX7DP4oJuyTxHNcfGbroadJxTQjScU=;
 b=UexA+OtdSaQmafv4+DCWScarmKX1Driig+rKrZxXfaQ65QeeiI/36KxmWYq/aq5fmbF4r8XzI9z02EtNmmEMM+l0+WG5WrvqmAdShcIOyRbTrJZe4AHKk1TnFKFY85TMPUX5XJZWKpE5zvTmnu6UJsfyawA/E3GCjBBbcvuoslp0moXoIvpCHqixEjRaCukBwYjgGFglSVxoYdPsEor1UjyzyeKbinuOZYyy92e2rNBocjIxq5orEKjuWv58HeyPAf+wUvBSflG0XpJX4gwVSKhwodr5SuRHyDkIGPEiSpHECBFcXsPeL8hDqxQmvYeSp4DdAl8k0imlmODr6YJIMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by LV3PR12MB9213.namprd12.prod.outlook.com (2603:10b6:408:1a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 10:31:41 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 10:31:40 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
Thread-Index: AQHb/3tY44weAeBzXUS5kQIFu+ZUxbRS8GKAgADFLBCAAAwggIAAJYAQ
Date: Tue, 5 Aug 2025 10:31:40 +0000
Message-ID: <SA1PR12MB5615E2ACED00D66546CC13E7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250728045145.132333-1-neal.frager@amd.com>
 <20250804214047.5cfcf471@windsurf>
 <SA1PR12MB5615611A10ADA56A9816AAB7F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250805100953.380f13df@windsurf>
In-Reply-To: <20250805100953.380f13df@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-05T10:24:06.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|LV3PR12MB9213:EE_
x-ms-office365-filtering-correlation-id: 73daa58f-77a7-48d0-649f-08ddd40b441d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?eKeX0liiiwD5XemUvALZEnuHiU5enP33pvEQ2oDV5EEgBlWtFzXZhyvwV7xg?=
 =?us-ascii?Q?DYmw8N3ze5q22Bg6z/rAdWzSPbbyjJr3g8cuVGRJqXcFW5lybBOwnvjF/Gt9?=
 =?us-ascii?Q?CC3eUCnemjWNcSntl0+t4cj21oxVkOQqLdSHnMhdo8GLEoG+j9wNxi/0rgI3?=
 =?us-ascii?Q?VZuulA/3yCrs1NGz39o+/e85KrLsDZfuPbb4tEVMpXySBvW4pq5zyz7y3AQ0?=
 =?us-ascii?Q?JWZSXKS41fNcH4RcwLH59eM+GstnBKgSYJ6/M386VVFFTdB2w4rmH4oiyElk?=
 =?us-ascii?Q?FtNqyt1h4HCOtT1j9WVL3d4In1TaPg41J22yeonDJSetjKWokItZna97/TuQ?=
 =?us-ascii?Q?7fa7XviT4udEqeBxNXar18LYdeElMDCZsP/jB8tleDjg69bP4gzLmoldRkNo?=
 =?us-ascii?Q?wlqkO4hzeeWqAVnIWp68xm5tw5beticqsma/azf3ukB4ugTcQyK+7tNR5kPg?=
 =?us-ascii?Q?PmR/Qgymql9ckwgOpe10b/NmD/wFOntflHOXcvTg6VGcpM0SC4NXq5lIDOyv?=
 =?us-ascii?Q?xMTit2FsJO1SF34BuAvEyjXPXIFfZwCD1yC5lSl35nXQjBCPEk2sTHp3tgrh?=
 =?us-ascii?Q?w9V4PPDcqtdD5j4IHgC+j6o5mVcSJ3v3Ri0AmBlnvjdnM2dbONQSgR2b7qRv?=
 =?us-ascii?Q?e53s1yXDyHayTETwCWecl1g/EV1El0nClWwwATiApO2sbcihWaOUMKgscXto?=
 =?us-ascii?Q?h6vl38ZtUGTpSwF14jqygUHPaY5qyumZKAjdJzKw5Z3Yi0cBz+NXNW/pLQrQ?=
 =?us-ascii?Q?/HVo6b7iEHFvabQ446A+DlKUrNfDux8EIEEWpXHF32RPzebrpFW5GZCeKgHH?=
 =?us-ascii?Q?N9LAT+yQOiyi42CBr8pdf9TtLK4uD6i+UHjLI6Fcs+PSnOP83oYlihg+Oy+e?=
 =?us-ascii?Q?oPbPyVo1FzVe6fGZZJ74FGIrSsVLHPn7v1VwvzwkoZPyAzRpRFZeAaRvzGcl?=
 =?us-ascii?Q?VhhlFTXqWvgG8DpCnsaO21o97mqlFN1lWQit1S0JGhmKKavTzVHfabP2LdSS?=
 =?us-ascii?Q?m72e44C0NrEwYbQdtnB6vkBW3VB2SoJA3yqcToaC3zAYV/RRsMjoNy/EWsvC?=
 =?us-ascii?Q?svMIsHjxt4yaQyrlHrd/v3XoqZ8SjxgjJ7VDb8hh2G4b+ujKF9H2xq1Gktnm?=
 =?us-ascii?Q?P/HroiGHvmP7qITVpSLAO25Qy4OlxJz//J1/TEDwts2dHsi6SvnB3Z43UqiY?=
 =?us-ascii?Q?jsrKc6xl08lQg6/2wlMljL3IGhNQdQjqFv+BvsRoEPFlvMcoNas1osUoQ1ZA?=
 =?us-ascii?Q?7QZ+3g2WUon3I1sxyONsyGGQ8eOdvTbzLqG3v1Bne2IfuM4ddjfkZHsEIXtG?=
 =?us-ascii?Q?qap5T0tX1xw0LiIb4qDLgFj3s0cHQVybpI8e/cvCi1uNMXNErWuKv+ASTflo?=
 =?us-ascii?Q?UIG9rjKm7x9GFbhiwLwDKhr81Fy/tN+By7mEmZiiuNXLQYTAZ1VXIh2rqVCR?=
 =?us-ascii?Q?jxt15muQbrW64XXm5u9yEJGv6tp8UL+fhERLa2PqQdvCxBZIWIegUiL4fBjv?=
 =?us-ascii?Q?yhu1yZ8JL6Lw0mVLwPpMlaggm2kbvYPzPYP6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9eW0Vz4QuwjcvngDVtNu8FzdL0qNz+mpvg+zp4W6Dpug5vPzc0zL6faEl+/8?=
 =?us-ascii?Q?SptgDX71aT+/Pr3wKtpPvcePZoQO3Nh74Igy0m/5Y3NbUewYT5VXsxcr81/Z?=
 =?us-ascii?Q?GXPJYhfMTX35D918uRX1eSZeBFeuZc7zgeYGEgVQjADDDKji0ANuBxcPWa47?=
 =?us-ascii?Q?WlkQZWjxLt/9A/+dbz1eXwOB2/1ThKzBbhnOhT4Kjp+/gS/FbvxMpeRekBnC?=
 =?us-ascii?Q?AwUGX1I5K0yvYg/doMpfYMcxfd9+pOaVzpFbTf8qDNFwkZZzurfk+neouvIq?=
 =?us-ascii?Q?LFL6VzEDfYfwmIvpQRz+7Th+Uprl6B0+5Hr/qilfN/awQIyk7faDmCGfcGf6?=
 =?us-ascii?Q?d2TF43YwxypEYyHxXbumQtD4fAthd5Kj38UsCOaQsJFrB6JLVPnBCDnEjImT?=
 =?us-ascii?Q?4LzDnj9eaRoveS+A6GRvXLjOYi/1O7D2rkk2PS8SctHNug+UujF5wGmrsG4j?=
 =?us-ascii?Q?BsNPot8LoXRqBMSxHmL7HHPlNXU6MnuTwLmaaNZQRPbig/fgI5bGwEdHnpc+?=
 =?us-ascii?Q?CgNDPeLIs8Ec7OgC3RCqZ8fWyJiHvg/Zro9Chywjo56aPYmmtvfAhjIHoYHc?=
 =?us-ascii?Q?yAnUZC2r6I+Er4La4Ja42/hmoTYyPUKNWj2Rd/BllM60aQu0zJ20BmnE/rH0?=
 =?us-ascii?Q?3I6i5b1NkZ1PXg3e/Zt+IAIqSR/ksY+iKNsdQVmGmSCAyl0x9RgHSTH2SuqS?=
 =?us-ascii?Q?K6Sf5BxIGntyC3KNxJNbXY7KkOXuRyt+gCyoiGhb8H7lg0YqxAmGYmKfyYde?=
 =?us-ascii?Q?/faDICn3c9QyYZt4XsGLukpvjsS4hZH6bBMFD27nC9pFHmzddYFSV1+ilZ6m?=
 =?us-ascii?Q?PAciIqMIVfEXzjQ1ATUrVjjPcOk6A98EKGFl/NjDjWTqgwAiW51mKEDcDC+a?=
 =?us-ascii?Q?BvkgcMvnzRXixJU8NHQEPClu4FXvhxShQfLiiD2vKy1x7327dUatkjvv/tFY?=
 =?us-ascii?Q?GUoXlsGMon82ao8ZVo4B04wiCAK54Zdcm4n3G9mofQHhZf4jUyntKM5OTDZ6?=
 =?us-ascii?Q?hr6famxr0wgvvwIyBv9odzhk3WazafJ/TSv8g95Xpc/Jp4STFCqguOgSOLeJ?=
 =?us-ascii?Q?+LFLQ4BtLVm38T4kkmJBtHqn4HsHZmTn69jG2iqFeT4hQZrXwdXLyuufxUwt?=
 =?us-ascii?Q?rTf9IDK+x15Khc0Pymg+mr0gfDTp9gNxgNUdtMOk2fTyXSvo1h6IUfVXBgHy?=
 =?us-ascii?Q?eZs+/tb6zaTGwO3zYDry9ZN/ROzvXWMYncR1a+xGlvoaOF1tUI/skx1xCj7Y?=
 =?us-ascii?Q?9lrnvWhpSV2AbQuNHgeRj3rF6Q2m71irCz+iVJBA9XmQjoG5WBMfzyvCKef9?=
 =?us-ascii?Q?n7cSSKq2gpWekQvlD+h9sLOrA04siGIoa3jxS7AWyXs42i5u7x9Y1b7yG7ju?=
 =?us-ascii?Q?zv8/P1uYki8PKnm9WYd0qvKFr0FMZppJQWprwDUMjjw6qGvcRYD/QRMoq/Fr?=
 =?us-ascii?Q?OweCe0FuKOek9x/8bs2J24YZi/1TDeIh66YPJid0Yg8NH7bNK7Wa4AC0JdFf?=
 =?us-ascii?Q?+j0J7n9NOwhhCMqg/601rl2Ndn9oacUsvNouwiJypphvWltBWmzYw5/XT3mk?=
 =?us-ascii?Q?JvSUWn1wXfJz9/DkuOw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73daa58f-77a7-48d0-649f-08ddd40b441d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 10:31:40.8466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1TeolFYeUODLtBw4FtOW3G8eCbdtYXvmHiBg/BQQsSyjtaDK7USgH55B9cnH9jzJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9213
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muvRArbJByeMlYX7DP4oJuyTxHNcfGbroadJxTQjScU=;
 b=2kT7TAQP5r5yP+nRtVumKhZcoKOafS2UYWVPYdYzn/Kz1bwxIPtG6QkEEF/sN2rL1MfSMe/Ff6f97YG5wADN5VDWB1loCi9giclC+rlyCxj9hVay2cosmaxPwdeyc8Kz+NkzvzNG5ij8PU8ULvYbmST1M26KabITO5eDQu8/r/Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2kT7TAQP
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

> I have followed your steps and I see the same issue with gcc-15. It seems like
> a different issue. If you remove the atomic test and set patch from gcc-15.1.0
> and do the same build, you will see the exact same qemu boot failure.

> Oh yes, I definitely didn't mean to imply that the issue was related to
> the atomic fix. As you say, the defconfig can be built with GCC 15.x
> without the atomic fix.

Understood and fully agreed.

> So it seems like we have another issue with microblaze that appears with
> gcc-15...

> Absolutely :-)

> Not sure where to start to figure out what's going on. Perhaps run init
> under strace? Or maybe build a working system with gcc 14.x, with one
> executable in in built with gcc 15.x, and see if it works?

I would guess that running init under strace would be the more useful option.

I have already tested that gcc 15.1 works just fine with microblaze, as I am
using gcc 15.1 with the gcc-bare-metal package to build the zynqmp pmufw, as
well as the versal plm and psmfw applications. My expectation is that gcc 15
is mostly working for microblaze, and that just picking a random user space
application to build will probably work as expected.

There seems to be something specific in the init script that is failing.
Should we consider creating another gcc bug report against gcc 15.x?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
