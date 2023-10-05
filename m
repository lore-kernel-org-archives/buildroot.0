Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4FDE784A9
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 05:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 652B982779;
	Thu,  5 Oct 2023 05:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652B982779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BjOTsovE1J_I; Thu,  5 Oct 2023 05:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8833B8270B;
	Thu,  5 Oct 2023 05:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8833B8270B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 610ED1BF276
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 05:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FF7A41E9E
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 05:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FF7A41E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoUF2lVbUzRd for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 05:59:27 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::610])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A92D417A5
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 05:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A92D417A5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV/p2pqzZbbX9ROgHqJgNHNc5AdmOP3MnP+0szcXr5CGItAmiy22ro9YWbEdPD9hRuTdFH/evrcsMxxmGPq0H+uXKz4rKimdOmQ7EWkbLmD7UosKRlESNO7n0Mfa7PTs0f4dOvS1HHoOjfAVjM26ad79kblp0CYrpzVgVNIcL9BxKBBcFP0RNepPeH1PgDxDVs7jEiEtqzLzUE8dHtvO9zERruaI4/L8Ra2/zoz3PE7DEYl2jGg41nCyKmBNGAg2gfJBxwH6/rZxbqdOoDo/IQaHP9MDKBH4Qgmy152Oi96UWQcD9Sdn+6DqlVHUXONuo2tAB3KMMKsXbxENEUUBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VElmt3gNxi4VChbThJeHXS+67zD+MOQfVwvx4Pun8g8=;
 b=BkojZmSYbwjsaZIMI6ka/U03B/G0A3rvOyUAkiD97cAwyJ54yAX7rYODV+2dnOz28JQB668nbilPjkVGGu8mLYfgJ24KgvLWVpNHY7z3TnOR6OEuz6vOU1+Su70L9cRr0bv3w9Xj3oqGz0JpRO7Xzb/JT/qYqfTjM5DpLnm13tCfUinTcKkdkrbr926Jw/0cV9ldHJBjwJI9xmRrPOGObxmhTeg9c2jDDHPhXeeuORL5PS2GFfW0jORS67aYfU7NTpI2m3vLt4A+GjA0/eVbcSHMiWzM6JP+rgaDQdTVzOVrfqbUrSYgeNmQ6CKBWsOlT5zVmRamwa2xavZliaHn/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ1PR12MB6361.namprd12.prod.outlook.com (2603:10b6:a03:455::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 05:59:20 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20%2]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 05:59:20 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Peter Korsgaard
 <peter@korsgaard.com>
Thread-Topic: [PATCH v3 1/6] package/binutils-bare-metal: new package
Thread-Index: AQHZ3xdOetzd6qes5kKjvQ75CSQimbAm6SMAgAAITYCAAAnbgIAAD+SQgAAFR4CAATUVQIACtPIAgAAMMOuACe7bwYAASh0AgAKU/4CAAojWAIAAg6Qw
Date: Thu, 5 Oct 2023 05:59:20 +0000
Message-ID: <CH2PR12MB5004E6C185CDC9D70B479B68F0CAA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230922145236.027dc287@booty>
 <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230922155735.43ddc356@booty>
 <CH2PR12MB5004C65AFCE251505428888AF0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <MN0PR12MB60045761B225083426E7B1A1A0FFA@MN0PR12MB6004.namprd12.prod.outlook.com>
 <CH2PR12MB5004761ED87FCAC8E37E9667F0FEA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230925045944.6a88abd4@booty>
 <7AD8C3E2-4A82-434F-8C3D-6B9B5E53E798@amd.com>	<877co67fgz.fsf@48ers.dk>
 <CH2PR12MB50046780037DB7AF933A119FF0C6A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231003091539.5e26d558@booty> <20231004235756.255601f7@windsurf>
In-Reply-To: <20231004235756.255601f7@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ1PR12MB6361:EE_
x-ms-office365-filtering-correlation-id: d3e35504-4c8f-4df8-bfd7-08dbc56837a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wbFYgTAahEMkTy+UBjVq6uuk9mq6xjV617AlPpYDTumZomtIFvfzrX2f8MG1E45fbBq6mmxSs+JM2DqQ8glQrCCmlSoZRqB035JYVkRvxhJ97hbwLNbryI5cYzNMv4DsFpz9Gd4CCTM9Y0kFsozzU9Heamhs6eD5T86zHjfckMSYUvKY95wPezodL5Tj0rmZDP44PAjExCDhotWTnlmr4xGjry5ZK8RkQ2634Ec6DWTKLTBlFI7IJvRw0ceW6IHEJA6pwDuuLcG9umZZCIazh2dU0Z2/NeHH0Vy63K9Qy9fNCZ47PS8RR210rNiIDcqHHLXifrowAPUSBJLJsN4UH7Rzp5AmD2SnQdSf8Hxqk16ZxReVM4y01enHeZXYOh+uuPqTu17PuuPFMJlFnEJLtdU7ZK2ZpptyqQyUSlbznJ2KIrzviexOq6OLVNjGxODm83pOlZuzGLPUba2tlH8OF3PHe6swwFscr4XIpLZQ8MgvMbGRAGfT39i6jD3juF6CcOYaOlG64PR5yx4zMztcjWGK7du7AtxKbAm0O3BqXeTdz8W3lLBtzeghGunXrdd5yCH3b792Gy9mMVAHKVCBA3Pb54ijD33015wcHHGahFHp1oZ0WLm69JFhsbEPwBRk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66899024)(2906002)(83380400001)(86362001)(38100700002)(33656002)(122000001)(38070700005)(55016003)(7696005)(6506007)(66946007)(66446008)(64756008)(54906003)(66476007)(66556008)(9686003)(316002)(110136005)(41300700001)(76116006)(478600001)(8676002)(4326008)(52536014)(5660300002)(8936002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hf2ITPezmCoqDomjt6BTHcmVXvjID0cil3r47z5+hscrzK7e/lfCjCeY59p3?=
 =?us-ascii?Q?2fM44CoW11FbTFAGQ0LyYZpgotp1RJT76eHYt6j4skvL548gK8ylLMFOt4aK?=
 =?us-ascii?Q?jJtn9c9gW+4CFElnauFfCLX2J6PQI0LTfipgoP/KLrlE2W4jubwpQm1S/0Hn?=
 =?us-ascii?Q?mFXwpX8A44AmPljcTDd6wVUfN/QSn3JZSrO48DxDozR1Ob7bgBwfOJ76KstE?=
 =?us-ascii?Q?ii+j+rq5wkueeTlWd4GZzFGwHMIZ2s+nrNbtJYqydhLny/9906TYw7FYXccA?=
 =?us-ascii?Q?6e138PNAgcB2Q2U2elOClXP7jeg9X2f0nSq/gky4rOj2SpFOVMoN4mp5Gn7Q?=
 =?us-ascii?Q?2ld4+KBHYia8LTQJbANrmuO/bfQua9LN4caHDF3Wc1OmXAzwV13/IbVxaOKI?=
 =?us-ascii?Q?ElYNv3ovUF+ZQd6HenE4NEFTxrOn2gK36KzQ3wM5YFJcb8WiAh/EE3iDH/ub?=
 =?us-ascii?Q?pdUtQKALEFbYL2fon6NKKIHFeH+EaB9m7r6kqO9+fSUw9EjJ8cvF8pfgd7re?=
 =?us-ascii?Q?f5cqh+SGGU+OKuyuwZPh83zMA9l8fnQB0nuEEm6JXyF1zwTtCeJEdL0Q0XF+?=
 =?us-ascii?Q?iWLCPcyA98JBcQ3vcAANKSNSMBJkQ9rTfnu1gsG+jgO9BCO5vyJR1FxC58U/?=
 =?us-ascii?Q?K2rqHPBSQS/i2ydgUaJTXewHEWCfFyLAF+7OwGaVEdTrx3Fo3VC6QuZA/jrY?=
 =?us-ascii?Q?isZHBlVt2m1qLfFZ8Ik2sN8Pleu//6Mxc5N8tQxoyh6sxwe+YWXjKOdGbY+V?=
 =?us-ascii?Q?VbVBX9loDdrQwMPrEczFG7+MvQtogDmWxy05Pu5StauVOzDuIx6G361gvN9i?=
 =?us-ascii?Q?kaHh98TiU7iU0JIE3yxDJDmn2l6UnakMx/vewxbRLI0SXqA16ughwBiBy5fh?=
 =?us-ascii?Q?DhSb/4yCMiYtoO47opR0LdRFJTAdHjlUODdkhiZXk49RByfSDyuWQhyGM+vm?=
 =?us-ascii?Q?hAEEYCj7+asss5Dk09DW1ynbkikKM6u5aVEZZRNBo+ix+HaEIg3vRkpvuR/J?=
 =?us-ascii?Q?V+ywRdxuZk1rSrUEoVi/9biqS7mY5LFjxCLjuuF2VpOtBY/rcqye7wgi+E0V?=
 =?us-ascii?Q?rVJdUS5FfoU7BeQpmTm1/16T+D2YV106WIiWLsUeu8qVoQW3i/vrT3OWj+D3?=
 =?us-ascii?Q?GDcP7obO3EKyPrdstb31DTc3PGqoCFuqn7EXYd5C6T2nDNzQL4qj9Klk+GpQ?=
 =?us-ascii?Q?DyRCr7kE8ejLryibT+C3qJ+p22NOFaen7XMaL+NN/bst4pqlWafQ6UtDaNbR?=
 =?us-ascii?Q?0qb5M3vMyyw0TKtFzdr+c8etkFikOE48no23jCPCa93hs4JteFw7fNzy0RXm?=
 =?us-ascii?Q?u6+M6HKEj5+/Doobs+VgZxDDcKB44Sz5b0iB3jYjJAUB2g4gh3Y6GmQIP4AJ?=
 =?us-ascii?Q?kketPY3T6Pdt+FYLOryccEqAn9PJrVXt6GnCSvarJVdYxL2xjjXOhH0ERL9M?=
 =?us-ascii?Q?NinfEQrcmivYVQXSTwRbmrnL/TRJX+tYOdD9grGFsnBRcPjgyeESj/5jZMdr?=
 =?us-ascii?Q?vyZ4XFJO2slQ1mkKwjeEMN0RCrXk6Gtf9fM/QVhiRE6TYdtsBtq5mD/w4alp?=
 =?us-ascii?Q?rOZ25LNTnBRtCwttzBHEG7Knh5t00bAfieYpDI5N2odoY1z+0pwOt9NwrJrj?=
 =?us-ascii?Q?XvoOMrBb9Dg0tKPZkn1LBQ8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e35504-4c8f-4df8-bfd7-08dbc56837a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 05:59:20.3346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Yjy52296nI+S+WmOepB7ghxViWhAYSAlPJt5DowG+PQ3K1bjQuMSLjS/rddmowP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VElmt3gNxi4VChbThJeHXS+67zD+MOQfVwvx4Pun8g8=;
 b=sEVWlAWuHQSLPvBgzvH6EdVwrT3QbR56HQ8aqnEhJQVr4yH1YPc81GhSN2wdOuLBNWNc+pkh1KVZAHGMCqNSf8zQcBLAhYd4NQCRX8S9D8S2MtcGcfB4jfGnCqkoLCupyi3X4jURhpDFN2A5KYPdjbPW9ev6zF+V6DfPONBiCuc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sEVWlAWu
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Peter,

> > > This series instead goes to the other extreme, E.G. we build the 
> > > entire microblaze toolchain from scratch and then use it to build 
> > > the firmware and use it in the u-boot package - This is nice 
> > > because it is all in Buildroot and we have it all under control, 
> > > but also brings quite some build time overhead for building the
> > > toolchain before building the    
> > (small) toolchain. You can naturally "solve" it by using two 
> > defconfigs, E.G. one that builds the pmufw and another that uses the 
> > prebuilt one, but it isn't very handy either.
> 
> I think the approach taken here by Neal and Ibai is valuable, 
> especially as it would allow Buildroot defconfigs to be self-standing.
> Additionally it is already proving useful as it prompted "the 
> community" (mostly Neal -- thanks about that) to upstream patches 
> needed to support Microblaze in binutils and gcc, that are currently 
> downstream.

> I agree.

If we agree that being able to build everything (including the microblaze bare-metal)
toolchain is valuable, then should we go ahead and commit v4 of my patch set?

We can always figure out how to add a pre-built microblaze toolchain later.

And if users wish to have a faster build time, they can always use the option
of a pre-built pmufw in their defconfig.  This will skip the build of the
microblaze bare-metal toolchain.

> I fyou are thinking about toolchains.bootlin.com, I am not the 
> maintainer of those toolchains but I think the idea is to only have 
> Linux toolchains there, not bare metal ones, thus newlib is not 
> supported. Also I'm pretty sure downstream feature patches are 
> absolutely not welcome there.

>Regarding providing a bare-metal toolchain on toolchains.bootlin.com, we have a chicken-and-egg problem: the toolchains on toolchains.bootlin.com are built using... Buildroot. So if we want toolchains.bootlin.com to offer pre-built bare-metal toolchains, we need Buildroot to be able to generate such bare-metal toolchains in the first place :-)

Understood.  We will have to think of a place to host a pre-built toolchain.

By the way, Ibai and I have successfully identified the minimum patch set
required for correctly building the zynqmp pmufw, versal plm and versal psmfw
including the barrel shift instructions.

We are in the process of upstreaming all the necessary patches to gnu binutils.

Once upstreamed, we can move the toolchain-bare-metal packages to the
upstream version without needing the meta-xilinx patch set.

I will update the toolchain-bare-metal packages when this is ready.

Basically, we are skipping the majority of the patches which are just for
enabling 64-bit microblaze support which we do not require for zynqmp
or versal.

The upstream binutils and gcc are actually in very good shape for
32-bit microblaze support.  That is why the zynqmp-pmufw-builder works
already today.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
