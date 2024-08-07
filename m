Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74C9C52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 776DA606A2;
	Wed,  7 Aug 2024 14:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Phd4-rWougu; Wed,  7 Aug 2024 14:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 764526070A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 764526070A;
	Wed,  7 Aug 2024 14:39:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA7BC1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A820240201
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybbItdpt7zNC for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::601;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97D14400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D14400B8
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97D14400B8
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAY5KXl1mZF1noQGTcnZvqlaed6BGFukgPptUQFmpx9ilXkXlnDbdocGRJ6w/Q9RM/mW/adOw6l/YuYAjQjP1XCjeJPuE4YtZz6fuddGGlSI6ZmIuFkaBvKLmWOhYz+6rOMEySFmE83vtZyWs8AUFJVBLZcWS//nib4hOuNtfBymQUlggevoVbZY3dTepcpREopO5UaDSaGprVw1gf37uWDGsc/rmRZ2KJ8j8t7tjsXmaGsSdIIfBroxOie6Wf7fx4A4TTpDHbBVLpsLAGnNNiVGqZ4J/WGmvbkdowFI+w7LjazUcfOT2HlSgk+t9eSnxS2a4EF+iMTahlQYqAApCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzmBo5LrHkGN5f9QBoPZ/qDKsAv/OfruIRSVSEN+PPE=;
 b=H2YVEuJkwniTGc7o0BCHDSiKpY4R2MCDAY13KddOAKOZvxeXw9Vc+QjJseU4Yyp/T9ItZNr51vH4CkdLE/KzgDUf0Upd30lyItRrsN73akgi8z4OPNuZ17dStgDF43jzCuEEcDraQILEZ2xOEq/t4uKlNJBiSj0Ch4kZaDYVXLji+1sQhFLQwYEQGNUC/Qmjy2Z8bdx1TLK2STG1WBnNAA6EoFFeX1hY0L88GjE/ojZTLJXiYtGzMoyNBxz9aVLbZOBEFKvsWbgGtNh2OHbMf1DBBdWBTN86X5egnuxeJMfXGOSwtpBZcNIw8t5lc/RpdIBXGZz6qQ7NRR8iH9LQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Wed, 7 Aug
 2024 14:39:52 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 14:39:52 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add linux
 6.6.40 hash
Thread-Index: AQHa6Li55XsRTBDAbUymX+ME1mR6K7IbuDoAgAAhcgCAAAEVgIAAAFJA
Date: Wed, 7 Aug 2024 14:39:52 +0000
Message-ID: <CH2PR12MB50042ED67EA2441FE635D585F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
 <20240807142506.45de55d8@windsurf>
 <CH2PR12MB5004D0D6722981F95A9C6D17F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20240807162841.52d0481d@windsurf>
In-Reply-To: <20240807162841.52d0481d@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SA1PR12MB6896:EE_
x-ms-office365-filtering-correlation-id: acf39f90-0aa4-492f-f2d3-08dcb6eecc64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lwNZgJpaO1iady0EBMwK/dvqgnt1jLda3g+gAwCBu6ovArJ42BNhTqJ3ts6i?=
 =?us-ascii?Q?kdiGptUyHpSWJo4jlHqNeQmkuuP5pgfKSLg9jSMCFW/+5iwNH9vow62rBIcM?=
 =?us-ascii?Q?RbWOAklc5mz8pZNvGiCS65VE2w7k8qy42wp/kSVVHjl7gB0gUmlV03f+JOPo?=
 =?us-ascii?Q?3wuJn8fvcjjqYmNw34peeHo3eZJdqZfd6JQ0z061KyJKEBkxPGQQLjmg0OP4?=
 =?us-ascii?Q?LSPXUUTwykOOhQ6+LNeyHv0ireH6UuBkMoEho+L4LmKmX6zt7JVH40cAq6bK?=
 =?us-ascii?Q?3LHVnwGf0EnPwY96+2Gb69cZqZnctwJGtjNAtGezvI/faR77c8UXBDxd7dp0?=
 =?us-ascii?Q?tRmtupY9m1ageLKymU9DRMI4VlAjNzvuAyMiRz0UnE83Maxiwvo2qnqhqAIZ?=
 =?us-ascii?Q?GoIwgrSONWh0u25ge32av/TYpv/nEr2MEbCF7MpvRMoj3qq+APQ0lgt9C1x/?=
 =?us-ascii?Q?pAd2QUNiWYfFiizBYclafJjHyLr113j4xNDiXv1iksjwvuHnk3tbDSeQGl6A?=
 =?us-ascii?Q?3IRs++kM/D8r2F2GAZwQ2nMCnlbgNG334pxjZB0vXuy1DuB3P0YoDU4RAdCf?=
 =?us-ascii?Q?YwYxr7KabidruUqDfrYCvVW0jyVo97Ebq7TNyuen96MBR7kFOo//Q7XWRkw+?=
 =?us-ascii?Q?yX8JEFkgh2+jgI2MeRiNBHrLb3Pl6SiQYk5JRKQwA3gbXM6hnLGRpTZJuwts?=
 =?us-ascii?Q?wIbkLQPkc6qe0lkqto/MdYDiahXF1q9A4b157HRKGjCC9yw3xNIJXiKrTK3m?=
 =?us-ascii?Q?0tAQ0fn/Rw3P4cN261a6WRz+0dIlcqOCKMmpWKblM3+4HhBruKO0isdcG0Hc?=
 =?us-ascii?Q?cPK587iSdIQnlM96J8b5sNBicrheD1I8tOGbMjt9SO7nKgVQ4dnwlBDo8tcn?=
 =?us-ascii?Q?ADb/fGpXH/LO6ctMeY7b+Q+6sLXFL+xCJ0l9vVv+2NuUsQtj5w/32shRPVuY?=
 =?us-ascii?Q?M5kgrJYf+t1sF7wrJsasE7zsaihnNq5BnFR0svLkhmrRlgq72oVlVAfmRXJu?=
 =?us-ascii?Q?PTDOFKQWJ9TraQ1M7ZtFFLCI6Bha/NulROelckDwBmh9vVQkylchDNIuH8kT?=
 =?us-ascii?Q?f5hZxRSPl71BIt+wRZ7Ls7ss+GLF5jErvP0DfKhXfLVzMvE6Y7KYG2Xl6pVi?=
 =?us-ascii?Q?f+KAlMsZ9Dw3O/Bxl833qVGSxW6VIFgeia3KL8AKxPSs59kyUJxdu1v2g6Dp?=
 =?us-ascii?Q?x55VeVs9dZLnzrkPrvlD++12sDD90w8qL2kkbbst1PL3ZeuTaXf8MUeThyjD?=
 =?us-ascii?Q?o7Dw+EndfEdIUEAlObIsAePxxSGnbOio01u7G2rGY4OP1k+ZWaaOzPRcB7Pi?=
 =?us-ascii?Q?hJJWMMVeYlWWysmelYsbmvufFeFwVZlYX7j4G7KTOkvcgIl2RnmP8txY5Xiz?=
 =?us-ascii?Q?gEniB3aqEVyoAimspk5vI9rNnRGmI2jWjWOd4RI1lQBskXfNcDLt2rbPm+ws?=
 =?us-ascii?Q?4mJASDnpPEA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h982KtwYPJ9K3k3fJKOadRMmla9bQzOgG6hAF9A/wrfcS4SU0u89X8xBQihg?=
 =?us-ascii?Q?R8DpKaJ/P2WPDnezTiQICsIq2pIvyfesSMoJUpoHWRRUJoD+fNVawZvv6wYF?=
 =?us-ascii?Q?QkBB91Kj5LpL5vPIKRKG8+EruyKQsY4G+CJH0w9rVcEF1QUb+LIRLHlPT9w2?=
 =?us-ascii?Q?G7cjR0WGAIwWUxNwGJsllfX5a9FFrUAw9psElBQCpMrYuEOrWu3DQe91C9yF?=
 =?us-ascii?Q?F0whsqiQWW/p2L/I+eUSdUoQaBkYSVJpTDiOuDamPywD8zwp7OaioilVtPG4?=
 =?us-ascii?Q?bHF2J/GcKfE046aS7UP7/V8B4OqXGwYukd4LM53REdDvkpjQPFaFiIWnPGr/?=
 =?us-ascii?Q?bdirfvZUa7t4aJk67L5R4T6nt+6P6fciTSUTdXXpb+xoNCs8T/2FJvY1MQf1?=
 =?us-ascii?Q?2tTyDieY0+xUqPOm8vD296+MexrOGpBiDK3stjJhS0UjmWrQAwOHObhWcrmF?=
 =?us-ascii?Q?1C9T5vycXwjIt3yqj2f+gvLFQweSRaxYH6mMNPbkrV0wrgamPZ0tCEqlUiIJ?=
 =?us-ascii?Q?sMIE+L6B1kx+2mwa74HerlaNDAK+nrS+DRyhgHoO18uQ/238nXYLmz62/ieA?=
 =?us-ascii?Q?X+oTx3/7HbW829kvuO3YQurinKS8IqaKre3I5CXvt4lREodiLQ3rDf2am7fO?=
 =?us-ascii?Q?1+M5HmzPbuyo9554vh74CRDvG1Ti7kVnAm/hQ/9EmssH1ocngNLUUtqznA4l?=
 =?us-ascii?Q?UX0eD7IqxzVP8Q6HWb0eDhPGwxnkPNgGDwQUoU6/nuE61gpRoCZf8ghk2Aho?=
 =?us-ascii?Q?z/QFzHkq37jqDgmI8/lEcMO+H/BcdojXo5esgWMy4tAbqKiLKhdn26a26j4m?=
 =?us-ascii?Q?Ap2M0/4sRqq7091+dRQD8Dw9GAVez0xGbmi/YTlmEqwk1IQ8DIgEbKm3a1gq?=
 =?us-ascii?Q?SMeAdEMIg4eHDiW29C36JwBsV5ZL5zhTIMbbYAcSD5DsRlkRRlozOSEN59y/?=
 =?us-ascii?Q?ymKIygOQxJD09u4jUpHpnDCr3xflAE8R741icskZJcr9dRYTIhiSgnCkmWTV?=
 =?us-ascii?Q?az6oVvUcYVz2NdeiGVmJYUbY7h7CrKWlwIOf/aCrq8kjJo7246sdKxHSiWFb?=
 =?us-ascii?Q?fddXFmFOq1/ejz0Vavkgz9IXescvWlxU/sP31rsKqdpC85svUFGHY2g7WQs5?=
 =?us-ascii?Q?IiMhQ++y5p8iG2Uw6P6dP2+Qu5Tr8bjn6TgsJfQFuIfn24ozSA6zxRlCH0ZC?=
 =?us-ascii?Q?h2JUtFfSSGOmoR4MCoG5JE1b3z2UZ00OYRwpIaHAvzfMCfwpGcBwOEbxpxRl?=
 =?us-ascii?Q?4wLyt7oXCJhVRMpVNLdBBpYfXDdMkPJAoANoack2RuzMga0Tq89l+cOSYoGP?=
 =?us-ascii?Q?Zjnr6asVOih8NPLxFAQZAX/0+7E3HDlqSHs4GNBwH1tqAh6iO8p97YLXP5oS?=
 =?us-ascii?Q?Mg6thj/eL2oSPM8mpJlu25LEhZyhf7jNKI/Un/clj6f1vgGNsanDUVWkuUmj?=
 =?us-ascii?Q?BIRd1CBCPI6NwQxC/00Q5L72tbu9mvjC6/NDt4GQMCmKcsYmrcdvF+hcgAMO?=
 =?us-ascii?Q?ASxEuNFBIPK77ARzKKafich5vzeQlBGtBLHxefM6ojSiFlK3geU/ksMr43n9?=
 =?us-ascii?Q?KcwAJ3G75wcdJukNjTs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf39f90-0aa4-492f-f2d3-08dcb6eecc64
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 14:39:52.6853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2QP/xHor8z4v5CGIlm7rU+88NFA6Zan3Hfa+kgaBthocQ7LdYD3mLamPJpXF97hG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzmBo5LrHkGN5f9QBoPZ/qDKsAv/OfruIRSVSEN+PPE=;
 b=mV8SgfbV9S5sES8ma4NqSksGRqTakOH0RYNFSxZV685BiST8FTHV3PRXiTEwUCzMaC7HqYCjIGeksMUUTSdr4yYhKZYAo/v7dK5o50OHk4oCDKqrm/Rtou8EsX3Xu8yNp5py6H3F++WI6YzyiVZ361yFYY8CO/5cjBzitJJuTGw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mV8SgfbV
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add
 linux 6.6.40 hash
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> From my view, it is best to keep the shared hash files since there are now 12
> xilinx defconfigs using this and soon to be 13.
> 
> Since it only requires a single line change in the defconfig files, I will
> squash this into a single patch that updates all 12 defconfigs to Linux 6.6.40.

> But are you able to test that those 12 (soon 13) defconfigs all build
> and boot fine when doing such updates to all defconfigs at the same time?

I have 10 of the 12 boards (11 of 13 when the versal_vek280 is added).

I do not actually have a zynq_microzed or a zynq_zed board, but these are
mature enough that I believe testing on the zynq_zc702 and zynq_zc706 should
be sufficient for covering these boards.

So far, I have tested the 6.6.40 release on the zynq_zc702 and zynq_zc706
boards, which is why I only submitted the zynq defconfigs so far.  Now that I
will squash all of them into one patch, I will go through zynqmp and versal
testing as well.

I will create the squashed patch, and then go through the build and run
process on all the boards.  Once complete, I will submit the patch.  It will
probably take me a couple days.

Please note that outside of my testing, our software team has already tested
this 6.6.40 release on all of the boards, so I am really just doing a sanity
check.

Please let me know if you have any further questions.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
