Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55194E748EE
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D5581A30;
	Sun,  1 Oct 2023 16:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1D5581A30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o5rvkY6qRGXO; Sun,  1 Oct 2023 16:11:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F3F78133B;
	Sun,  1 Oct 2023 16:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F3F78133B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6C51BF42E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24708400EF
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24708400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asFQDwDK0zpR for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:11:29 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::622])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3B95400CB
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3B95400CB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4a5KhCrwKl1EDwRP5YDsNOQHqmxGEua5PHhL3lkyP7EzIxKDjUN6hlWwCGgDYrRYBo/EM5NDoE9AJ9qIrQ2nt56Qbg+g2uShduTnLfP776eY686cLzVYqvRJGxzNFass6ZIb6L54UbkY1tvAQMOqUZzuBNUh7TWrUw5nY4dv2V8G5yoMed+CX0x2VhUI08ziOQ+V0QPr4jiI6tWbO1byWnFqPlBAl6leZHox/yawcD/cwYGNMEA2YQG9e5SPtgo8fB4fMrgDJ9lX2ub4bxYROaJcBNgYpCnLd456GoSoBDfgPKHHEkNUPdlec/qVN58q/8QDeL35pgfPpyXdPrlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePlu8ZE85sBZgtGeYGAw5nFAhZFQ4gLH/d2+ik5C64s=;
 b=XoHHtin8IRcGsMOVmDTtmtoPH6wzwQ90ffQ8gHhtSAvWRGAO7RZ0faYrJ3XtS1DKc5zYOSdPVD54aW6pftBho2YD/qBAqARdr3Qq5IFGrViAN79WMGUHZ13sgfFcC9VGvrRQbILyRWMQaKgnEnzkP0a0Vbm5n97l4Xe5vJQIiO24atYUZJ5KnvaTDEbqdnjUEaX42jsZ+9Bf9/z3uR2T61jcpv3UR/VV6rLvhaNdOpawioM5sDaBg2ZPpvMJS+Um3l1b2Fs7m6PHf/91QaQMZbBG/2GFmU0vu2LiUZAElHxTfSWmhBzPWllkp7skPaBI93V4pc0CU0kMd5tIflu1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BN9PR12MB5097.namprd12.prod.outlook.com (2603:10b6:408:136::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Sun, 1 Oct
 2023 16:11:24 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20%2]) with mapi id 15.20.6838.030; Sun, 1 Oct 2023
 16:11:23 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v3 1/6] package/binutils-bare-metal: new package
Thread-Index: AQHZ3xdOetzd6qes5kKjvQ75CSQimbAm6SMAgAAITYCAAAnbgIAAD+SQgAAFR4CAATUVQIACtPIAgAAMMOuACe7bwYAASh0A
Date: Sun, 1 Oct 2023 16:11:23 +0000
Message-ID: <CH2PR12MB50046780037DB7AF933A119FF0C6A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230922145236.027dc287@booty>
 <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230922155735.43ddc356@booty>
 <CH2PR12MB5004C65AFCE251505428888AF0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <MN0PR12MB60045761B225083426E7B1A1A0FFA@MN0PR12MB6004.namprd12.prod.outlook.com>
 <CH2PR12MB5004761ED87FCAC8E37E9667F0FEA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230925045944.6a88abd4@booty>
 <7AD8C3E2-4A82-434F-8C3D-6B9B5E53E798@amd.com> <877co67fgz.fsf@48ers.dk>
In-Reply-To: <877co67fgz.fsf@48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BN9PR12MB5097:EE_
x-ms-office365-filtering-correlation-id: 9037f8dc-62bc-4b6b-a271-08dbc2990ebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k2UqeGWs1xmm6Ua3ReUCykHoEDmQc7hxiIFaW3KqAB63Wn5rE2uQu3s1IohvyjvZcFfnwYDXFWi2VjwrcfW14tvRBYc6Yj09KJ3jFwdEzOvPFTdYQIgkSj4h6wR6HtqsS7n3ebokI0RWfgKkg3I0Z/qhK1prnNlZmBl9QXSEAPLJXadnijdJ0Y6GynNZAxf6hbLS0cRFkp0duSpvY2uelM82zCV5LBoc2Yp8saYIv+AF16zd149I7wnRT4emSdCj601lrS2VXxGvy/yyYg+Qzwp57gnXz+3XV6B+22fEZXwNtVb/9RGqNPnbfdexwWu8FL9Zl7mmZv8JZtd9TISZj+Wo7P9Nk9iyCwVkouJ4BeW9rJRBGxfQSJktrESIHA2mAzQEpQ9aZl9Wh6NRHKmgNS3kOACDPd9XlgwxKv5mSwb+CBaY4OGkWOZGh35da86SFg76V3ybEEaUisROWs4888qS6lt4VjsoPyTXiCsxGOuh7UNz+iQP93qqsCEAEuJyCKTPZ6QK1czjz5h1Ukd9PTnxkRq8PbBix7UfKjsEECpDGZnNoqV9QtxLw5rVa4KSZ2pUVv4V55OJfPXEFSDy7rpcD29gpDXOQxfr0nLGzcd8s0C7VSKjJA37fz2gUugi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(346002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(52536014)(5660300002)(66899024)(2906002)(71200400001)(33656002)(38100700002)(38070700005)(7696005)(6506007)(86362001)(478600001)(122000001)(55016003)(9686003)(83380400001)(76116006)(6916009)(316002)(66946007)(66556008)(66476007)(64756008)(54906003)(66446008)(4326008)(8676002)(8936002)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w0fHMjN3Pjt5r8RwQinqwl0fnnrc6SoUGErIik8gnw/j2dt3rse6kxLN8QeW?=
 =?us-ascii?Q?NDnbLnhDjHa/FFabIUvUHwq8IOekaZ15X52qDJm68x/UpM+kJqEz3mhUW2rv?=
 =?us-ascii?Q?2X5FRRhNUZnffsK/qQLJYZUlWr3QSY1EwKKzYDGYsTamwdLpqiv2z96Jx/vM?=
 =?us-ascii?Q?3eXzN47M6cQSmxUI0yc3LHHImT7YGGgNissNHqQfSHE9PwEkkaLafh0SVLKb?=
 =?us-ascii?Q?i7G5aeoXGKDM4+jMyMm8pshS6G+veFDwplWgzeDaO2RivdpeT+S4rJ1IA93q?=
 =?us-ascii?Q?KTVk2DbOixFNXQcmkpG0m7zWAPy55xu5wo4aCs2WwAXc33wP/3WthibMPYQn?=
 =?us-ascii?Q?vfyK4Q7lrRi7EnZUWKwJYzlcH0VoxuhgqX14wGKdIMxlctSYs+SJjkORGGty?=
 =?us-ascii?Q?OoTKUuxVzMqG79OQtFZM0HojUj4gRb88dyRfLjc3d7mQNAfncMkjYHL4HgLh?=
 =?us-ascii?Q?IY1AbSS2vCuB7Ih5968BGRBhfmwH1PFyRdy80lkfNDa0vV+flOr5SE8bTMAc?=
 =?us-ascii?Q?wVU/Vle7StIgE1HmUc0VImPwzprF+Y8Co98Lakw96oNSY5m9Yiqb61t5VLYv?=
 =?us-ascii?Q?tKLFSoXNWdAFDNBmfxKsdKgGE85pyMAwTp/Q5grw1guqnnmaHrg0YoQxEPAn?=
 =?us-ascii?Q?9rVBsyvUT+Hw0J4gPqJaGZgX/0/jwUQnOG8C+lyvOcLjnJ8i/hyXRjWNguWq?=
 =?us-ascii?Q?PXPhwx8TEZfff/ZmT738rTZZj+5DbXo/Yo/LDUmJBuM3Xsny1wDQi5tXXEIh?=
 =?us-ascii?Q?I1lHKumuhHGZFAnXyly03pfSEeROdqjxxN2/a22/YfB2CG9bE/srUruwMsmK?=
 =?us-ascii?Q?YUV1YHM1ScqHHlDiXH3dJJL0DemKETOaH4OZfzbG51pByazQWbfWAebMoG6G?=
 =?us-ascii?Q?WvWCn75FfKg7UwZrW7LG0frUD3ZZu7EvkDLWDeZA9HKABfbvI/jRH5VoDR/S?=
 =?us-ascii?Q?BVFkBPPsTq1ggjIFUtK7QpimyqDC5J60vSP2oOFQwbclWIsyCbjZofKp0aTi?=
 =?us-ascii?Q?YEjA8YBJMxcGKYCu7PqghFCNnL5Mi0H34zRIWgGB/wHeXTgybBRDOn4UkMN2?=
 =?us-ascii?Q?ufckF5gMJSi7qHMeuK3BIjGXKsuDvM9gOlLy2R+7syJmjorRJDCkX1F6241S?=
 =?us-ascii?Q?HNdnnazYwLXSC1/3E3H41PCgqbu1KCVloUf6JYYWjRPFwLLHrXPEmr0w/D7z?=
 =?us-ascii?Q?4BqHEw9Hby9gabq19c9uWbor0wp4JO19J+fP/h71cvGw6VAsXLr20FaUIuFT?=
 =?us-ascii?Q?5v7mCa6OC1rhneb5rD/uFEl+PoJ4jxUbLcYMtuRG8avqCl2BYJo1qre6INUw?=
 =?us-ascii?Q?bmEYvHwvWMetwpcjbimMLfYFoTaa7jAHeCTB0u+eaEu+EBJ15Goj0fX7ujRo?=
 =?us-ascii?Q?7iOAoPG6gYBi4N2tJhBdhfxHZWMo3CXxs8x0+Li71APFWKY3dGdDuO2SQUlf?=
 =?us-ascii?Q?Fyb8jNFhihwdUFtRZOo3R41Ylq2uOa8X2botYd85ZJgeDT5uGrSwMbt8EzGR?=
 =?us-ascii?Q?22ToAirLntMdU22Jj2pcv9xGwnytIiK1JOPFfcxwH9Lk6I3R8aKg6BVYr1Z/?=
 =?us-ascii?Q?sYMX0wFatfhStqYtbbrMU7Y74mE6xYAwqK/0Wja44gyv0XiA2QsE0XQAqnAn?=
 =?us-ascii?Q?cOJFlox9nPnR2CU35nApFrE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9037f8dc-62bc-4b6b-a271-08dbc2990ebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 16:11:23.5812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXQk1SPfllmNR2Ioqicm/EDd5BEhK20Rvc1FsnZ0km3vdL7m0Ogq4f1S0fh+uZP0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5097
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePlu8ZE85sBZgtGeYGAw5nFAhZFQ4gLH/d2+ik5C64s=;
 b=UKLTevS/0Sy3D3koss6iw1fLQOTaoNTNgF2nmNZExMItRjEUvVKczWEna6BodVsPETlReOltaQT4jaq+15JdNDZrsgRYdRQLo8Zx1inp/wgB/uWlgnetf9GOKNqPoveOrmP/78+Ymg3pbdMIMgt76R6tkqBa+ZXEpYEfzX1Iihc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UKLTevS/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new
 package
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

 >>> Is this ok for both of you?
 >>
 >> I'm OK with the whole approach, except for the sentence "I do not  >> believe there is currently any organized effort to upstream any of  >> these patches"... which is probably already clear to the recipients  >> of this message, and thus is not going to be solved in this thread,  >> however I just want to be sure my position is clear. I'd also like to  >> stress that I appreciate a lot the work you are doing to properly  >> support the pmufw in Buildroot. Thanks!
 >>
 >> Luca

 > Your position is very clear.  And I can assure you that both Ibai and I agree with it.

 > It would be much better if all of these binutils and gcc patches for  > microblaze go upstream, and both Ibai and I have pushed for it  > internally at AMD / Xilinx.

 > The only thing I can say is that change is always possible.
 > Yesterday, we could not build a zynqmp pmufw, versal plm or versal  > psmfw in buildroot.  Today, we have submitted a solution to change  > that.

 > Tomorrow (figurative meaning the future), we hope to get all these  > binutils and gcc patches upstream, so the upstream toolchain matches  > the AMD Xilinx distributed toolchain.

 > One step at a time.

> Sure! Sorry, I am somewhat late to the review game here. I wonder how this fits with Luca's zynqmp-pmufw-builder?

From my view, we can continue maintaining Luca's zynqmp-pmufw-builder in parallel.  Buildroot will still offer the option to accept a pre-built pmufw binary without needing to build a microblaze toolchain, so if users prefer to build the pmufw outside of buildroot (to have a faster buildroot build perhaps), this capability will still be available.

> E.G. today the setup is that the pmufw is built outside Buildroot and we just point the u-boot package to where it can fetch the prebuilt firmware binary - This is nice in the sense that it is fast and simple, but makes is somewhat annoying to make modifications to the firmware.

> This series instead goes to the other extreme, E.G. we build the entire microblaze toolchain from scratch and then use it to build the firmware and use it in the u-boot package - This is nice because it is all in Buildroot and we have it all under control, but also brings quite some build time overhead for building the toolchain before building the
(small) toolchain. You can naturally "solve" it by using two defconfigs, E.G. one that builds the pmufw and another that uses the prebuilt one, but it isn't very handy either.

> Would an in between option not be more interesting, E.G. use (or
download) a prebuilt microblaze toolchain and use that to build the firmware? That would still give the flexibility to easily tweak the firmware, but not the overhead of building the toolchain every time?

> I guess the problems with that are what to do about the meta-xilinx patches and where/who wants to host a prebuilt one?

This is a good point.  As for the meta-xilinx patches, Ibai and I have started going through them and have even started upstreaming a few.  The majority of the meta-xilinx patches are actually for enabling 64-bit microblaze support, which is not available in the upstream gnu binutils or gcc.  Since we do not need 64-bit microblaze for the zynqmp pmufw or the versal plm and psmfw applications, we can easily skip these patches.

Our current objective is to get all microblaze 32-bit bug fix and feature support patches (such as the barrel shift instructions used by the pmufw) upstreamed.  Since this appears to be a small subset of the overall meta-xilinx patches, we hope to be able to enable the use of the upstream gnu binutils and gcc, so that the meta-xilinx patches will no longer be needed for our use case of building the zynqmp pmufw, versal plm and versal psmfw applications.

However, in order to achieve what you are asking for, we would still need someone to host a pre-built microblaze compiler somewhere, if we would want to go this route.  At the moment, it is not in the AMD Xilinx plan to host the toolchains somewhere outside of a Petalinux or Vitis download.

If the upstream toolchain included all the necessary meta-xilinx patches, could bootlin potentially host a pre-built toolchain somewhere?

Even if we add the option to use a pre-built microblaze toolchain, I would still like to include the option we have developed in buildroot to build and control everything within buildroot itself.  It is true that the build time is longer, but many users like the option of building the toolchains they use and would be willing to pay the build time price to have this option.  From my view, adding a pre-built toolchain option should not be "instead of" offering the option to build a toolchain, but should instead be an option in "addition to" building a toolchain.  Basically, following the same concept as using the buildroot internal toolchain or supplying an external one for the main Linux toolchain.

What are your thoughts?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
