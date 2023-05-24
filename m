Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5584FC77B7C
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 17:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC88440AB0;
	Wed, 24 May 2023 17:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC88440AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pq_dvrr1GUXh; Wed, 24 May 2023 17:58:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 024FE40583;
	Wed, 24 May 2023 17:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 024FE40583
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 918D11BF301
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 17:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76D1860C0E
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 17:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76D1860C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eb37QpjTiG99 for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 17:58:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D91BA60BE4
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::708])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D91BA60BE4
 for <buildroot@buildroot.org>; Wed, 24 May 2023 17:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ef1b9h7dTNZ8gCsmb6+54YboWNmT0JHBehUdAkuZO/3sJh24VazO4GTvC+ZXLfQB2PtC2YJwcA2gdr8ZD1CdnqncRq/Tz+ll5Umk7iIb5DNqLqNwlR6Zc7w4CR6a7NutGgUsKIJsuMQ6iMVlc1iYwlThco7SMRS64srHXQfa3+slXMFYgHt8/r6/LdeRxo1sYv+wv2bxLXq51uyCeyeYM2RqeNrV9orEKS/wS80QKxVPNhY12x8wuc7uKZdCQ5VLvbzokrvGHBa55OG+t2yFB1aFOawcgq+IWPptB7JOZ4qs7Ym1juEW/l/VdaQiB+tG2fMnyRG1v5hbsLcl1VBGYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQBoWB89OuccUCz7QcU/J7vPKyDdwRqAl88w7vr5FB4=;
 b=hQ818MxJuS0e7un2yKJ2r6LtcT87OvDZnRn/HPHjzRsiPnp1cz/7yTrGC7qy/qxBdELrI5GUeqNTsGJhzPiDV2oII2ROkainJ3zo62xYKqtN5trKXAFfOuO2K6LGPlvXFdoTdJhsexPZSAA6/eA7kITc+CDGcHHrNViP8/s0FO1LivNPpEGfRzd1MhnhgZn+b1kAoM99RRm/iG7soacEwJkS+N1NJsYGm85xq40OxXnmgiLIgvrhtUrEeUXKjcy8rqWYppvA8l/ivk70krePQt5Virek9fbiihUXy212O8KOeoDu+31SPJGI8h0NbH9qooxOHiHAxO9wAgYpOF/+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by SA1PR10MB6495.namprd10.prod.outlook.com
 (2603:10b6:806:2b1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 17:58:34 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da%4]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 17:58:34 +0000
Date: Wed, 24 May 2023 10:58:30 -0700
From: Colin Foster <colin.foster@in-advantage.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZG5QRpfWU6SQGKqD@colin-ia-desktop>
References: <20230523172120.1948573-1-colin.foster@in-advantage.com>
 <20230523172120.1948573-3-colin.foster@in-advantage.com>
 <20230523211851.GL621937@scaer>
Content-Disposition: inline
In-Reply-To: <20230523211851.GL621937@scaer>
X-ClientProxiedBy: MW2PR2101CA0035.namprd21.prod.outlook.com
 (2603:10b6:302:1::48) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|SA1PR10MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be3e0f0-c5ef-4034-3c45-08db5c807dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nSQzOTF+QhQbEBNttuUGcPM5+WNuBUTGitly8wVQcVTPwOAzBDKDlF2LYZqsQF5ZkbHQr95R0A+B9wFkL4GnWtNrrvT9HQgLDfkv9czbkq2kho6OqlhVotXgqzbgdRbO/ZNSxDDsGeuDD1GA9aTi8SseGP2GjnUYwuyfgGs54SJqp3052jgOmqcSzJPSO2egXqvBdsYXoUFu5+0KYRB2yzUkjllY4z0yZa73stHTIsRy5GDoVnjuptivpXGjRNRWVwrmVcbaLUxZh0QhDfk2W1bNcyK2EkQiTiVENxCWSmia1vY+z2lXHmiWwwNo2U/SV+iWasoyAAq3bhcRuM4oDL2y+3WR89vz3btDxmFTzjfZhIy1AUJXumELdS648dNIoWcnB5/MX+E6T3wczAsI9jqcezvDgjPBE7WyjrFDMiANFXaTfGBIJqaBZ2ixT1JlBL0AFXMobV8LUa/0ENoMho6dJRQ9TIBEPcPHe0fM1gibKrs3GZoMgcb22DW3Bw874DEUtdwJc4tafk6gf1UlR4zjRzn1itEq61JErDEDsapV/6SnR1N5exWvtoFFZpK1Q/C6vpI3PCh9V/YAqQS7a4dJjqYgreLYg2NG2Dxw2Ak=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(366004)(346002)(376002)(39830400003)(396003)(451199021)(83380400001)(6916009)(4326008)(38100700002)(66476007)(66556008)(66946007)(2906002)(41300700001)(44832011)(86362001)(8936002)(8676002)(316002)(5660300002)(33716001)(966005)(26005)(6666004)(6486002)(6512007)(186003)(9686003)(6506007)(478600001)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O4qBnl8D/rm8pycjjHyZ3pL6waDby/Fqyv9/Ukw5nEgw0PskLxCRkTMYpDpU?=
 =?us-ascii?Q?2UFEeG/HAnKfvHW+eddqC6kOljC53b29dmUIMM9Nk4dPDhGXpfoSkpszCGvr?=
 =?us-ascii?Q?/Q3Wv2DxvT9YPeaV9Gk+ssoYedCM8jkFs1p4zZiFhsHB2vIjtZscqZ/er6aC?=
 =?us-ascii?Q?j/b4/NH3TOPW2tC9vzupNLd9m51/cKrtwTI3ZeEWkd+TzxIuULYOA+uObs8+?=
 =?us-ascii?Q?s4zVvUrjwdpzvdesaGaV1vJQcaMoC1FuCpLfrj5GA2fi8KLV4unRDgdpDy27?=
 =?us-ascii?Q?OX8s10DvFGnPaLg4qwwhxrSvltqNIAwYHDWU8Yyki8dzGSPmpuXFEBqDEfM1?=
 =?us-ascii?Q?ZHw57Cjftg6kYImYb8j4e0rg4udWfSIBkQBy+5Z0J/K4ye2dPDFNs5g5r/TD?=
 =?us-ascii?Q?IJV9AEIiP4NLO1Pbc3univZeXPODcd4bhiWv5n+R55F7Txb/8Jj2KtchsEEg?=
 =?us-ascii?Q?t1YQGBkKLZOxyCSH12CB0OS+4Ri+TwxNCdJTEmRrUY8Iy0pJv+2yRMW6PoV6?=
 =?us-ascii?Q?rDOmKF+hYT1KhPrHedVQLpf9Qpau3MXlOcvW56OwOWEs9SOP5MSBsFjOTBWT?=
 =?us-ascii?Q?R/wCYsF7AYU4CcZsgt+iE0U0+lrznAlN+OtO+KNjN0uw06nNPXf42h+HmMUB?=
 =?us-ascii?Q?SWQtsD1j8tGm1m4f+UGBJWwFq3P2KdHP05BuNqY98uFzGV0OrD5MZNOlr5Y+?=
 =?us-ascii?Q?RgrDmRieNq5n4E7IUnPw59OEct8YVtVUB4PveQM6w6e9fVzYY3ZJ2Vk9kTv2?=
 =?us-ascii?Q?RipiGS06rpznMmWwi/fXOneKRxRqAzOxFqsWF2EUkDle72DVzH72G/LfXj5Q?=
 =?us-ascii?Q?0f27ZVqK+WVPZARYgB6Q9S8ga0BTdz6R7BIjSY01Xza0k+invmomYxSvXs8u?=
 =?us-ascii?Q?4jApWwTbinH47c7Ts0DlllgQGdZ4mGd+Inko9DugdD2wEgLpDgT5NbLFyzEQ?=
 =?us-ascii?Q?qz8NzS7/QPREq172raUh+113wwU6z+tBgBfA/qHNmbNLOLHdyYXRQchMnF9c?=
 =?us-ascii?Q?1xZZ23DE8OoztpidxVicSxC48RnZdvdObgEVo4ss9f7uC3o9fE19ijQ40k71?=
 =?us-ascii?Q?jM9h9GMWSRZmqYghOlK8iSVlMBtnX1DhRJkUM28+X8jVJKUXXcJ3lPMne2gU?=
 =?us-ascii?Q?5P2hifQXg+zgPQMwxgCh6iT/1RgdjThIZDJqb2X1JYNxabalWTuVi3F0bp5L?=
 =?us-ascii?Q?vAoxuJxBIT5FxMtGqk0HNrArJWt2ZD1Os1J4mnKDfqD5bBXnjo+4OuSwtsCG?=
 =?us-ascii?Q?i+Hgexj6Mad9QgJcTridngzjQ+azuD4CGS30JSw2+Yz5tqmXvV+nhmJ40+fz?=
 =?us-ascii?Q?5XSARGkdX5gd4MqI2OiWNbL5ZKyUhvLR02cq5cUpxaIzTrv5FiPiPW6stQVM?=
 =?us-ascii?Q?yLCjpShes0cTgLiuQCr+/esPu/16hJR6vySYoP3uA1bJjJF2Rnu9vGGHAaTy?=
 =?us-ascii?Q?CQP7fg+2/UQlZnQEY3D0Lm9d62jWkcLoJXkTpIGa1IGAwR7giZNVQLE+MO9V?=
 =?us-ascii?Q?QoXm2Yn9ArTRB3DjAgMMhcC+U2Ry948s0xiu+Mm5vti+52zrvxaA5Wd5+G/e?=
 =?us-ascii?Q?Sz+tB/+9xy6m1KS+lhfHwUNDRXnnEnJpPXQ90AKNtOiqPSudAOz1Ivi8aDP4?=
 =?us-ascii?Q?yA=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be3e0f0-c5ef-4034-3c45-08db5c807dd3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 17:58:34.1365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PP/BtzYHGK8ltPqwnP491f9hbB9Als/Ef6zCnGcy8EwIjPNv8rD7a4CbxWfpcjVb2DHXIerYoKTK+5C/x0y4qSoI6v1Q97AZ7UT5Izy3rQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6495
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQBoWB89OuccUCz7QcU/J7vPKyDdwRqAl88w7vr5FB4=;
 b=X/Bo0qhElh09N/9x7l/BiQjpXsCP6zzLdGSU5KJmpEy+YPXCyosMh0LV01ShobxTEqLxh/hQFy22rRxUp4TBGooefozm5VqpRhSL2EJ6hzEOTFTdDN2BFYO9etyLO47iWzdfyRehOcjhztVxc5MVkSclYZ/vMphFdim4eMHv4zc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=X/Bo0qhE
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [v1 2/2] bootpc: add dhcp-like configuration ability
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Tue, May 23, 2023 at 11:18:51PM +0200, Yann E. MORIN wrote:
> Colin, All,
> 
> On 2023-05-23 10:21 -0700, Colin Foster spake thusly:
> > bootpc only works on interfaces that are up. If BOOTP is desired to get
> > an IP address to a running kernel, bootpc won't work.
> > 
> > This scenario was brought up as a bug in Debian forums [1] in 2007. The
> > response was to run the attached script to bring up the network without
> > an IP address. Sure enough, it still works!
> > 
> > Implement this bootpc script to allow IP configuration by way of
> > "iface eth0 inet bootp" in /etc/network/interfaces.
> 
> Can't one just use a pre-up command ?
> 
>     iface eth0 inet bootp
>         pre-up ip l set dev eth0 up
>         pre-up ip r add default dev eth0
>         post-up ip r del default dev eth0
> 
> Not sure that would work, but maybe worth a try?

I'll give it a shot. I tried a bunch of pre-up / post-up commands before
I found the script, but can't say I tried exactly this. I fully agree
though, if the script + rename implementation isn't needed, it should be
avoided.

> 
> Ditto as for patch 1/2: run check-package.

Apologies again. I'll clean up v2 and appreciate the feedback! And I'm
ack-ing everything you said below.

> 
> [--SNIP--]
> > diff --git a/package/bootpc/bootpc.mk b/package/bootpc/bootpc.mk
> > index d3c5ce5198..ebd7490ea1 100644
> > --- a/package/bootpc/bootpc.mk
> > +++ b/package/bootpc/bootpc.mk
> > @@ -8,12 +8,28 @@ BOOTPC_VERSION = 80c0811dc69f9f3923661be4f9f9c09a44313f62
> >  BOOTPC_SITE_METHOD = git
> >  BOOTPC_SITE = https://salsa.debian.org/debian/bootpc.git
> >  
> > +ifeq ($(BR2_PACKAGE_BOOTPC_FULL_CONFIG),y)
> > +BOOTPC_TARGET_BIN_NAME = bootpc-bin
> > +else
> > +BOOTPC_TARGET_BIN_NAME = bootpc
> > +endif
> > +
> >  define BOOTPC_BUILD_CMDS
> > -	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
> > +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) PROG=$(BOOTPC_TARGET_BIN_NAME) -C $(@D) all
> 
> Please keep lines below the ~80 char limit, e.g.:
> 
>         $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
>             -C $(@D) \
>             PROG=$(BOOTPC_TARGET_BIN_NAME) \
>             all
> 
> (I like to see '-C $(@D)' to be the first thing right after the call to
> make).
> 
> > +endef
> > +
> > +ifeq ($(BR2_PACKAGE_BOOTPC_FULL_CONFIG),y)
> > +define BOOTPC_INSTALL_CONFIG_SCRIPT
> > +	$(INSTALL) -m 0755 $(BR2_EXTERNAL_BR2INADVANTAGE_PATH)/package/bootpc/bootpc_dhcp_script $(TARGET_DIR)/sbin/bootpc
> > +endef
> > +else
> > +define BOOTPC_INSTALL_CONFIG_SCRIPT ""
> >  endef
> 
> No need to define an empty macro.
> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
