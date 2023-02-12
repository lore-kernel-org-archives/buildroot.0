Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44650C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 08:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF6C9819E6;
	Sun, 12 Feb 2023 08:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF6C9819E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWIn82uNcoEY; Sun, 12 Feb 2023 08:51:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D138A819D2;
	Sun, 12 Feb 2023 08:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D138A819D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39F501BF4E2
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F06C819D1
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F06C819D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUka6LxzvYz9 for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 08:51:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5150D819BC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0725.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::725])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5150D819BC
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 08:51:26 +0000 (UTC)
Received: from AS9P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::22)
 by AS2PR03MB9718.eurprd03.prod.outlook.com (2603:10a6:20b:60e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Sun, 12 Feb
 2023 08:51:20 +0000
Received: from AM7EUR06FT009.eop-eur06.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::e5) by AS9P250CA0020.outlook.office365.com
 (2603:10a6:20b:532::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23 via Frontend
 Transport; Sun, 12 Feb 2023 08:51:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=ebo-enterprises.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ebo-enterprises.com;
Received-SPF: Pass (protection.outlook.com: domain of ebo-enterprises.com
 designates 20.79.222.204 as permitted sender)
 receiver=protection.outlook.com; client-ip=20.79.222.204;
 helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 AM7EUR06FT009.mail.protection.outlook.com (10.233.255.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.23 via Frontend Transport; Sun, 12 Feb 2023 08:51:20 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (104.47.11.240)
 by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Sun, 12 Feb 2023 08:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMMefgRk9dLg9ly35P5L9U3OEccOAwVi3ELrow9qzPI0/XGsi9vHgB277tiiJJM48pmgT142puuUY8p1jBcg449hTHA/tWa2nBoMin0cm1px3qW/RPD2yj1UHC4HNV7GHJTRqESOfwWgZfC4r0pB9AekhUw9VACwsiTza6W+AK+Lr+TC7JQlQxBdNmq5aKeY/uTG5AZZTR0NenmbAEOmxuXO78iSOL/XoJKMvBX/y/hHSn+Hy94HDmxvLVzUzYi1R0wfZUAC+SLb37995Mf+am7hhPODhYxhg73CthmdtRhTIINmqGAxflUDZEBbtMS8A/rUtiHSliCaDc2a4GjxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9LeqzXoOw9FyUwtJO/vNf8dAfXk+W2czvHzBFPATCA=;
 b=dVh5MI0KOFHUZYJPX5zyoakvIBv2UfNiDZRGiTC9oXidqAi8b1E9w5zIaZDXoRS1x5CnA3N5b+AS4MHfrmkbk9Wdeks8GYndK+Ym8Tg2u0EN7QIOfijMIoXgw1PVDZbwShotK451zBzpe/jSwga50obWfFFWHtPO1fLKAcZBexzvPE06QCVa3npCvJEIP7wLj8DQIm8nwpKfrHFgeGqNkSRKoDL/lstba4drAWt5jhapaDHggpCRmifWgyzavyGSDNKqTDgMkW8wPlUjULnYvkJHaLV8AKnK07Jp2d7si6IkPMoMH+jQCLgQOTTmYBJt3bG5hf3UdaXmj6z2SaSUrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebo-enterprises.com; dmarc=pass action=none
 header.from=ebo-enterprises.com; dkim=pass header.d=ebo-enterprises.com;
 arc=none
Received: from DB7PR03MB4841.eurprd03.prod.outlook.com (2603:10a6:10:7f::21)
 by AS8PR03MB7813.eurprd03.prod.outlook.com (2603:10a6:20b:34a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 08:51:18 +0000
Received: from DB7PR03MB4841.eurprd03.prod.outlook.com
 ([fe80::abdb:7f11:3bb6:9440]) by DB7PR03MB4841.eurprd03.prod.outlook.com
 ([fe80::abdb:7f11:3bb6:9440%7]) with mapi id 15.20.6086.023; Sun, 12 Feb 2023
 08:51:17 +0000
From: Dirk De Becker <Dirk.DeBecker@ebo-enterprises.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] Dependency problem for gtkmm3
Thread-Index: AQHZPTdXcLyahG8d7kCzj6de5lQ1LK7Iv8UAgAJDahs=
Date: Sun, 12 Feb 2023 08:51:17 +0000
Message-ID: <DB7PR03MB4841EF79C4A0EC6DF2E96CD9B5DC9@DB7PR03MB4841.eurprd03.prod.outlook.com>
References: <DB7PR03MB4841CE1D746B328873113D87B5DE9@DB7PR03MB4841.eurprd03.prod.outlook.com>
 <20230210231454.4f3aedbd@windsurf>
 <d851f407-ddbd-4942-bee4-6b28b5387fe7.84fc06e6-1edc-441d-a0d1-fbc3c0d71619.a6a05d4b-f834-4abc-a293-13151789bb4f@emailsignatures365.codetwo.com>
In-Reply-To: <20230210231454.4f3aedbd@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebo-enterprises.com;
x-ms-traffictypediagnostic: DB7PR03MB4841:EE_|AS8PR03MB7813:EE_|AM7EUR06FT009:EE_|AS2PR03MB9718:EE_
X-MS-Office365-Filtering-Correlation-Id: a36aa329-5858-478a-e941-08db0cd64fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: IGPjKqHKWqHh6rqAnKoyRBxXCKaoNsVkHLqFaqG6ty+vb6HOgPNH1sPWSy3YXXH7gERyOOW+mfWetDQNagse5co0gg0VFVsRJoB5k4lsSgP481kIT0+PAI65NTtD4nv2Bmoifsx2Ur4otoiBiDvwLZPuWq1vqKuIur45nj9qeD0vNQyg2REJLtwq+DO8YlJvadL9xIX+MUUprm7koot3b5r5m7sm+mPUAbDBhmDo0viAh3NGEXkdGt6yNoeiomeRykXzpFHlWCnhFZkM7zI7m2kPRljUap9Bb71TTyko5Eo5iormuPS5+nlgXVvmXb7TSGC3+lV2IigsUIMvgvoXaTnFgB59rAXwgacf8o9j3lT0qq4iT9GD/cOr4iZUMmy0+R3g4Pd8bcik9xhaIWdLduGXWKRTPsXE9otsbtXKeFnAqco0YcBAlXLISO1WHpLxoz9OFV7XRDcUCcpXWlD6EndfDXkgBzCYjnht4jfHtniaLiNAw0yvdOdjuiexlK1tfIUSxtXhCdj8+iiT9yAdS3SCP0RMl5BUPBVOFUov5B4jwH5IvxvobhrF8uu2lPH50LooQICbkalUaM3P0zsihvdpDO3AOEWk4UbVS9FlHXYsJUKFFLi9Cd83ZnPO9AOmqB/wn5swBULPdIHIaG0AKWSMGgv2Thw/DLfKedoq5BK5lyUWi9N+pqJz+CdY/K84FblUcgC6Clb1aMGTKu3AbQ1xAR80j+1REtmL1EH27W4=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR03MB4841.eurprd03.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39830400003)(136003)(366004)(396003)(451199018)(107886003)(2906002)(8936002)(45080400002)(71200400001)(52536014)(7696005)(76116006)(5660300002)(86362001)(64756008)(66476007)(66556008)(66446008)(66946007)(91956017)(8676002)(4326008)(6916009)(54906003)(316002)(41300700001)(55016003)(478600001)(33656002)(38070700005)(966005)(166002)(6506007)(122000001)(53546011)(9686003)(26005)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7813
X-CodeTwo-MessageID: 9ee5fdd7-8d21-40ea-b3a7-c9c47c81ec00.20230212085119@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM7EUR06FT009.eop-eur06.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 59d56984-a10a-47bc-52bc-08db0cd64e17
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z2TFeBeevsXK8RJyb7p8Ie9cIzHNZgPHY0TZmXcJARHo9onUlgz/EtaM88E2hQT3Aiy65/juE0RKtpgqjMLnVHd4FiBSwsPChxSrI0t0mQpNrXqM4zxI95J00tDvrwURulISWaOUcjKcSbgzA5e22f0Jw9j0CevrdkGLLdH1o842S3X9Ty9X2XF34+TT7rvUk9Kk4sDkZqm512m8GcpFjUgKgcBco5LTKWzjYj61DQfN2edgpExw2ybESKMDPcJWxsVk7ma6EXZqfyQMLLaYPJeVee9WEk5L/KhOlgIhNL2gO4uk+W5tmYWAwUa6uFLT5wCllWIHzYuWw1DFDCHlji6cf842j1ijYovl2+2vQf8w8sDdceTLW42zXkqrK93g+r86Wf2aDAY09Mp7JfooYwwWfzj2oK5sEuIftHM4JEnli84F5aNbH+jlKVrO8SG3SqWySSyVGY0cErTnkxTwgO38pVDpdbPdYQftNIpk5dcRZvT75hagnWmv6fLp1531D6OiFzbSVljeQkPZCa2Q+a4SEYM3F5Wrg9rhqpXdC3WmduYnQNpG6YMtFaWCZlNyKpJn267THfEA5lcj5jr+DwwxULQ7fWo1ER61Np4EMkAoCJ9GxsKEdownAKLOTWU7t59g39p1wUhaidBNPY+K5k8zcXKKcyT0CvpOEjPi0xQcHVlT/F049bHdKVpymxRHtJdWVRznEVvA04pQbHRIBG77whdL3/ctjkZmKnQnwYoAJW9gb5FBYcHSkAYpMAP0
X-Forefront-Antispam-Report: CIP:20.79.222.204; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:de2-emailsignatures-cloud.codetwo.com;
 PTR:de2-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(39830400003)(376002)(451199018)(1690799011)(36840700001)(46966006)(47076005)(9686003)(107886003)(186003)(26005)(8676002)(7636003)(7596003)(45080400002)(7696005)(70206006)(316002)(66899018)(70586007)(53546011)(336012)(6506007)(478600001)(54906003)(4326008)(6916009)(52536014)(41300700001)(966005)(5660300002)(8936002)(36860700001)(2906002)(356005)(86362001)(166002)(33656002)(82310400005)(55016003)(40480700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ebo-enterprises.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2023 08:51:20.3206 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a36aa329-5858-478a-e941-08db0cd64fc3
X-MS-Exchange-CrossTenant-Id: 24133f96-2b38-4360-9546-979fc3caa9d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=24133f96-2b38-4360-9546-979fc3caa9d7; Ip=[20.79.222.204];
 Helo=[de2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR06FT009.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ebo-enterprises.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s21S5wHXwinohPSe4PXjAItvhqe7oHIBt71Z1HyxMG0=;
 b=Z3JnL7tdRwT79SWQAtIaH/57T3OvL3lJ8vui9BHxTnV/BODrLbeB7GUbi94Lki0q/zKYe5HC1kyGd4U7epT0TUTAK2hQA3QTyMyB4CDZEBGLochUK+vyQcDgrrJMqpeJ7kRmDkuBk4fz+TjqnfR34IFKACL23ITsQSIkojLoiIikMi5KTB2iEjowJomjuiJPgSvgIrtQ75aWqcpXv5uPuNlgkTCEICoaiUhVGlxfSA7PrRv6mLF43kkbjUYljLV7FGtKVHuZcI1Rbw8t3mF2w9VP5xKWBw1axsc6gGQy/V5Y9G9C9uf6wkACL3HxBH8cpVFMUGrSb8kKAtNtbUYExw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=ebo-enterprises.com header.i=@ebo-enterprises.com
 header.a=rsa-sha256 header.s=selector2 header.b=Z3JnL7td
Subject: Re: [Buildroot] Dependency problem for gtkmm3
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
Cc: Steven Boucque <steven.boucque@ebo-enterprises.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6098033293260281911=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6098033293260281911==
Content-Type: multipart/alternative;
	boundary="_000_DB7PR03MB4841EF79C4A0EC6DF2E96CD9B5DC9DB7PR03MB4841eurp_"
Content-Language: en-US

--_000_DB7PR03MB4841EF79C4A0EC6DF2E96CD9B5DC9DB7PR03MB4841eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thank you for your quick reply.
Will this issue be fixed in the 2023.02 release?

Kind regards,

Dirk


Verzonden vanaf Outlook voor Android<https://aka.ms/AAb9ysg>
Met vriendelijke groeten, Cordialement, Kind Regards,
[https://www.ebo-enterprises.com/static/emailsignatures/img/ebo_logo-transp=
arant.png]<https://www.ebo-enterprises.com>
        Dirk De Becker <callto:dirk.debecker@ebo-enterprises.com>
Squad Leader e-Vision Embedded


dirk.debecker@ebo-enterprises.com<mailto:dirk.debecker@ebo-enterprises.com>
+32 498 51 19 86 . +32 57 23 02 70 .  [https://www.ebo-enterprises.com/stat=
ic/emailsignatures/img/microsoft_teams_icon.png] <callto:dirk.debecker@ebo-=
enterprises.com>
Ter Waarde 60 . 8900 Ypres . Belgium
Wetenschapspark 2 . 8400 Ostend . Belgium
[https://www.ebo-enterprises.com/static/emailsignatures/img/website_icon.pn=
g]<https://www.ebo-enterprises.com/> [https://www.ebo-enterprises.com/stati=
c/emailsignatures/img/twitter_icon.png] <https://twitter.com/eboenterprises=
>  [https://www.ebo-enterprises.com/static/emailsignatures/img/facebook_ico=
n.png] <https://www.facebook.com/eboenterprises>  [https://www.ebo-enterpri=
ses.com/static/emailsignatures/img/instagram_icon.png] <https://www.instagr=
am.com/eboenterprises/>  [https://www.ebo-enterprises.com/static/emailsigna=
tures/img/linkedin_icon.png] <https://www.linkedin.com/company/e-bo-enterpr=
ises/>
[cid:microsoftteams-image_b51463d7-6b52-402b-8e2d-555faff69bb4.png]


________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Friday, February 10, 2023 11:14:54 PM
To: Dirk De Becker <Dirk.DeBecker@ebo-enterprises.com>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Steven Boucque <stev=
en.boucque@ebo-enterprises.com>
Subject: Re: [Buildroot] Dependency problem for gtkmm3

CAUTION: This email originated from outside of the organization.
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.


Hello Dirk,

On Fri, 10 Feb 2023 11:15:12 +0000
Dirk De Becker <Dirk.DeBecker@ebo-enterprises.com> wrote:

> Hi,
>
> I am trying to make a buildroot containing libgtkmm3, but I run into prob=
lems.
> I did the following steps:
> Checkout master from git://git.buildroot.net/buildroot
> Select the following things:
>
>   *   BR2_x86_64
>   *   BR2_TOOLCHAIN_BUILDROOT_CXX
>   *   BR2_PACKAGE_MESA3D
>   *   BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
>   *   BR2_PACKAGE_MESA3D_OPENGL_EGL
>   *   BR2_PACKAGE_LIBGTK3
>   *   BR2_PACKAGE_GTKMM3
>
> I get the following error in the output of the build attempt for gtkmm3-3=
.22.0:
> configure: error: Package requirements (giomm-2.4 >=3D 2.49.1 pangomm-1.4=
 >=3D 2.38.2 gtk+-3.0 >=3D 3.22.0 cairomm-1.0 >=3D 1.12.0 gdk-pixbuf-2.0 >=
=3D 2.35.5) were not met:
>
> Package 'giomm-2.4', required by 'virtual:world', not found
> Package 'pangomm-1.4', required by 'virtual:world', not found
> Package 'cairomm-1.0', required by 'virtual:world', not found
>
> It seems that gtkmm3 is dependent on versions of some libraries that are =
not available.
>
> The following packages were built, but these do not provide the correct v=
ersions of these packages, according to pkg-config:
>
>   *   glibmm-2.68.2
>   *   pangomm-2.48.2
>   *   cairomm-1.16.1

I have not looked at the issue, but it seems to match what our
autobuilders have reported at:

  https://eur06.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fautobu=
ild.buildroot.net%2Fresults%2F172%2F17263ac51f197031106eb7fd595126a2720f039=
7%2Fbuild-end.log&data=3D05%7C01%7CDirk.DeBecker%40ebo-enterprises.com%7Cf2=
c82276f6b2448fde9c08db0bb43dbe%7C24133f962b3843609546979fc3caa9d7%7C0%7C0%7=
C638116640987871529%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DiS%2FzyBdbOpMNu=
DoIniOElXwANQ%2F6CK3X2cqH25Bwlmw%3D&reserved=3D0

Best regards,

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://eur06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7CDirk.DeBecker%40ebo-enterprises.com%7Cf2c82276f6b2=
448fde9c08db0bb43dbe%7C24133f962b3843609546979fc3caa9d7%7C0%7C0%7C638116640=
987871529%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DVIGuMURAvlIEalseolNbf05d5=
BH%2FubIKee%2F01piDErY%3D&reserved=3D0

--_000_DB7PR03MB4841EF79C4A0EC6DF2E96CD9B5DC9DB7PR03MB4841eurp_
Content-Type: multipart/related;
	boundary="_25c36480-db71-4090-a8b4-4b856cfe0606_"

--_25c36480-db71-4090-a8b4-4b856cfe0606_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto">Hi Thomas,</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thank you for your quick reply.</div>
<div dir=3D"auto">Will this issue be fixed in the 2023.02 release?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Kind regards,</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Dirk&nbsp;</div>
<div><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
Verzonden vanaf <a href=3D"https://aka.ms/AAb9ysg">Outlook voor Android</a>=
</div>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"background=
-color: rgb(255, 255, 255); border-collapse: collapse; border: none; width:=
 720px;" bgcolor=3D"#FFFFFF">=0A=
    <tbody>=0A=
        <tr>=0A=
            <td valign=3D"top" style=3D"width: 1720px;" colspan=3D"2"><span=
 style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;=0A=
  mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-an=
si-language:=0A=
  NL-BE;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">Met vriendelijk=
e=0A=
                    groeten, Cordialement, Kind Regards,</span></td>=0A=
        </tr>=0A=
=0A=
        <tr>=0A=
            <td max-width:47px;=3D"" white-space:nowrap;=3D"" style=3D"bord=
er-collapse: collapse; font: 24px / 40px Verdana, sans-serif; text-align: c=
enter; width: 60px; padding: 10px 0px 0px;" class=3D"" valign=3D"middle" co=
lspan=3D"1" rowspan=3D"2"><a href=3D"https://www.ebo-enterprises.com" title=
=3D"e-BO Enterprises Website"><img src=3D"https://www.ebo-enterprises.com/s=
tatic/emailsignatures/img/ebo_logo-transparant.png" alt=3D"" width=3D"47" h=
eight=3D"54" style=3D"width: 47px; height: 54px;"></a><br></td>=0A=
            <td valign=3D"top" rowspan=3D"1" colspan=3D"1" style=3D"width: =
660px; font-size: 24px; font-family: Verdana, sans-serif; padding: 0px 0px =
0px 10px;" class=3D""><span style=3D"color: rgb(0, 48, 135); font-size: 12p=
t;">Dirk De Becker</span><span style=3D"color: rgb(0, 48, 135); font-size: =
16pt;">&nbsp;</span><a class=3D"meetingLink" href=3D"callto:dirk.debecker@e=
bo-enterprises.com" style=3D"background-color: rgb(255, 255, 255);"></a><sp=
an style=3D"color: rgb(0, 48, 135);">&nbsp;</span></td>=0A=
        </tr>=0A=
        <tr>=0A=
=0A=
            <td valign=3D"top" rowspan=3D"1" colspan=3D"1" style=3D"width: =
660px; font-size: 15px; font-family: Verdana, sans-serif; padding: 0px 0px =
0px 10px;" class=3D""><span style=3D"color: rgb(0, 48, 135); font-size: 12p=
x;">Squad Leader e-Vision Embedded</span></td>=0A=
        </tr>=0A=
        <tr>=0A=
            <td height=3D"25" class=3D"" style=3D"width: 720px;" colspan=3D=
"2"><br></td>=0A=
        </tr>=0A=
        <tr>=0A=
            <td style=3D"border-collapse: collapse; font: 12px / 24px Verda=
na, sans-serif; color: rgb(0, 48, 135); text-align: left; width: 720px;" cl=
ass=3D"" valign=3D"top" colspan=3D"2">=0A=
                <a href=3D"mailto:dirk.debecker@ebo-enterprises.com" style=
=3D"border-collapse: collapse; font: 12px/24px 'Verdana', sans-serif; color=
: #003087; text-decoration: none;" title=3D"">dirk.debecker@ebo-enterprises=
.com</a>=0A=
            </td>=0A=
        </tr>=0A=
        <tr>=0A=
            <td style=3D"border-collapse: collapse; font: 12px / 24px Verda=
na, sans-serif; color: rgb(0, 48, 135); width: 720px;" class=3D"" colspan=
=3D"2">+32 498 51 19 86&nbsp;<span style=3D"color:#F07E26;">.</span>&nbsp;+=
32 57 23 02 70&nbsp;<span style=3D"color: rgb(240, 126, 38);">.&nbsp;</span=
>&nbsp;<a class=3D"meetingLink" href=3D"callto:dirk.debecker@ebo-enterprise=
s.com"><img src=3D"https://www.ebo-enterprises.com/static/emailsignatures/i=
mg/microsoft_teams_icon.png" class=3D"meetingLink" style=3D"aspect-ratio: 2=
0 / 20; width: 20px; height: 20px;" width=3D"20" height=3D"20"></a>&nbsp;</=
td>=0A=
        </tr>=0A=
        <tr>=0A=
            <td style=3D"border-collapse: collapse; font: 12px / 24px Verda=
na, sans-serif; color: rgb(0, 48, 135); width: 720px;" class=3D"" colspan=
=3D"2">=0A=
                Ter Waarde 60 <span style=3D"color:#F07E26;">.</span> 8900 =
Ypres <span style=3D"color:#F07E26;">.</span>=0A=
                Belgium=0A=
            </td>=0A=
        </tr>=0A=
        <tr>=0A=
            <td style=3D"border-collapse: collapse; font: 12px / 24px Verda=
na, sans-serif; color: rgb(0, 48, 135); width: 720px;" colspan=3D"2">=0A=
                Wetenschapspark 2 <span style=3D"color:#F07E26;">.</span> 8=
400 Ostend <span style=3D"color:#F07E26;">.</span> Belgium=0A=
            </td>=0A=
        </tr>=0A=
        <tr>=0A=
            <td style=3D"border-collapse: collapse; font: 12px / 24px Verda=
na, sans-serif; color: rgb(0, 48, 135); width: 720px;" class=3D"" colspan=
=3D"2"><a class=3D"socialLink" href=3D"https://www.ebo-enterprises.com/"><i=
mg src=3D"https://www.ebo-enterprises.com/static/emailsignatures/img/websit=
e_icon.png" class=3D"socialLink"></a>&nbsp;<a class=3D"socialLink" href=3D"=
https://twitter.com/eboenterprises"><img src=3D"https://www.ebo-enterprises=
.com/static/emailsignatures/img/twitter_icon.png" class=3D"socialLink"></a>=
&nbsp;<a class=3D"socialLink" href=3D"https://www.facebook.com/eboenterpris=
es"><img src=3D"https://www.ebo-enterprises.com/static/emailsignatures/img/=
facebook_icon.png" class=3D"socialLink"></a>&nbsp;<a class=3D"socialLink" h=
ref=3D"https://www.instagram.com/eboenterprises/"><img src=3D"https://www.e=
bo-enterprises.com/static/emailsignatures/img/instagram_icon.png" class=3D"=
socialLink"></a>&nbsp;<a class=3D"socialLink" href=3D"https://www.linkedin.=
com/company/e-bo-enterprises/"><img src=3D"https://www.ebo-enterprises.com/=
static/emailsignatures/img/linkedin_icon.png" class=3D"socialLink"></a></td=
>=0A=
        </tr>=0A=
        <tr>=0A=
            <td width=3D"300" valign=3D"top" class=3D"" style=3D"width: 720=
px; padding: 0px 0px 10px;" colspan=3D"2">=0A=
                <img src=3D"cid:microsoftteams-image_b51463d7-6b52-402b-8e2=
d-555faff69bb4.png" border=3D"0" id=3D"0.s3x2l91z8a" alt=3D"MicrosoftTeams-=
image.png" width=3D"242" height=3D"65" style=3D"width: 242px; height: 65px;=
">=0A=
            </td>=0A=
        </tr>=0A=
    </tbody>=0A=
</table><p><br></p><hr style=3D"display:inline-block;width:98%" tabindex=3D=
"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Thomas Petazzoni &lt;=
thomas.petazzoni@bootlin.com&gt;<br>
<b>Sent:</b> Friday, February 10, 2023 11:14:54 PM<br>
<b>To:</b> Dirk De Becker &lt;Dirk.DeBecker@ebo-enterprises.com&gt;<br>
<b>Cc:</b> buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;; Steven =
Boucque &lt;steven.boucque@ebo-enterprises.com&gt;<br>
<b>Subject:</b> Re: [Buildroot] Dependency problem for gtkmm3</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email originated from outside of the=
 organization.<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
<br>
Hello Dirk,<br>
<br>
On Fri, 10 Feb 2023 11:15:12 +0000<br>
Dirk De Becker &lt;Dirk.DeBecker@ebo-enterprises.com&gt; wrote:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am trying to make a buildroot containing libgtkmm3, but I run into p=
roblems.<br>
&gt; I did the following steps:<br>
&gt; Checkout master from git://git.buildroot.net/buildroot<br>
&gt; Select the following things:<br>
&gt;<br>
&gt;&nbsp;&nbsp; *&nbsp;&nbsp; BR2_x86_64<br>
&gt;&nbsp;&nbsp; *&nbsp;&nbsp; BR2_TOOLCHAIN_BUILDROOT_CXX<br>
&gt;&nbsp;&nbsp; *&nbsp;&nbsp; BR2_PACKAGE_MESA3D<br>
&gt;&nbsp;&nbsp; *&nbsp;&nbsp; BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915<br>
&gt;&nbsp;&nbsp; *&nbsp;&nbsp; BR2_PACKAGE_MESA3D_OPENGL_EGL<br>
&gt;&nbsp;&nbsp; *&nbsp;&nbsp; BR2_PACKAGE_LIBGTK3<br>
&gt;&nbsp;&nbsp; *&nbsp;&nbsp; BR2_PACKAGE_GTKMM3<br>
&gt;<br>
&gt; I get the following error in the output of the build attempt for gtkmm=
3-3.22.0:<br>
&gt; configure: error: Package requirements (giomm-2.4 &gt;=3D 2.49.1 pango=
mm-1.4 &gt;=3D 2.38.2 gtk+-3.0 &gt;=3D 3.22.0 cairomm-1.0 &gt;=3D 1.12.0 gd=
k-pixbuf-2.0 &gt;=3D 2.35.5) were not met:<br>
&gt;<br>
&gt; Package 'giomm-2.4', required by 'virtual:world', not found<br>
&gt; Package 'pangomm-1.4', required by 'virtual:world', not found<br>
&gt; Package 'cairomm-1.0', required by 'virtual:world', not found<br>
&gt;<br>
&gt; It seems that gtkmm3 is dependent on versions of some libraries that a=
re not available.<br>
&gt;<br>
&gt; The following packages were built, but these do not provide the correc=
t versions of these packages, according to pkg-config:<br>
&gt;<br>
&gt;&nbsp;&nbsp; *&nbsp;&nbsp; glibmm-2.68.2<br>
&gt;&nbsp;&nbsp; *&nbsp;&nbsp; pangomm-2.48.2<br>
&gt;&nbsp;&nbsp; *&nbsp;&nbsp; cairomm-1.16.1<br>
<br>
I have not looked at the issue, but it seems to match what our<br>
autobuilders have reported at:<br>
<br>
&nbsp; <a href=3D"https://eur06.safelinks.protection.outlook.com/?url=3Dhtt=
p%3A%2F%2Fautobuild.buildroot.net%2Fresults%2F172%2F17263ac51f197031106eb7f=
d595126a2720f0397%2Fbuild-end.log&amp;data=3D05%7C01%7CDirk.DeBecker%40ebo-=
enterprises.com%7Cf2c82276f6b2448fde9c08db0bb43dbe%7C24133f962b384360954697=
9fc3caa9d7%7C0%7C0%7C638116640987871529%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp=
;sdata=3DiS%2FzyBdbOpMNuDoIniOElXwANQ%2F6CK3X2cqH25Bwlmw%3D&amp;reserved=3D=
0">
https://eur06.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fautobuil=
d.buildroot.net%2Fresults%2F172%2F17263ac51f197031106eb7fd595126a2720f0397%=
2Fbuild-end.log&amp;data=3D05%7C01%7CDirk.DeBecker%40ebo-enterprises.com%7C=
f2c82276f6b2448fde9c08db0bb43dbe%7C24133f962b3843609546979fc3caa9d7%7C0%7C0=
%7C638116640987871529%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DiS%2FzyBd=
bOpMNuDoIniOElXwANQ%2F6CK3X2cqH25Bwlmw%3D&amp;reserved=3D0</a><br>
<br>
Best regards,<br>
<br>
Thomas<br>
--<br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://eur06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fbootlin.com%2F&amp;data=3D05%7C01%7CDirk.DeBecker%40ebo-enterprises.com=
%7Cf2c82276f6b2448fde9c08db0bb43dbe%7C24133f962b3843609546979fc3caa9d7%7C0%=
7C0%7C638116640987871529%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DVIGuMU=
RAvlIEalseolNbf05d5BH%2FubIKee%2F01piDErY%3D&amp;reserved=3D0">https://eur0=
6.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;=
data=3D05%7C01%7CDirk.DeBecker%40ebo-enterprises.com%7Cf2c82276f6b2448fde9c=
08db0bb43dbe%7C24133f962b3843609546979fc3caa9d7%7C0%7C0%7C63811664098787152=
9%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DVIGuMURAvlIEalseolNbf05d5BH%2=
FubIKee%2F01piDErY%3D&amp;reserved=3D0</a><br>
</div>
</span></font></div>
</body>
</html>

--_25c36480-db71-4090-a8b4-4b856cfe0606_
Content-Description: microsoftteams-image_b51463d7-6b52-402b-8e2d-555faff69bb4.png
Content-Type: image/png;
	name="microsoftteams-image_b51463d7-6b52-402b-8e2d-555faff69bb4.png"
Content-Disposition: inline;
	filename="microsoftteams-image_b51463d7-6b52-402b-8e2d-555faff69bb4.png"
Content-Transfer-Encoding: base64
Content-ID: <microsoftteams-image_b51463d7-6b52-402b-8e2d-555faff69bb4.png>

iVBORw0KGgoAAAANSUhEUgAAANEAAAA4CAYAAABjcR2lAAAABGdBTUEAALGPC/xhBQAAACBjSFJN
AAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAhGVYSWZNTQAqAAAACAAFARIA
AwAAAAEAAQAAARoABQAAAAEAAABKARsABQAAAAEAAABSASgAAwAAAAEAAgAAh2kABAAAAAEAAABa
AAAAAAAAAEgAAAABAAAASAAAAAEAA6ABAAMAAAABAAEAAKACAAQAAAABAAAA0aADAAQAAAABAAAA
OAAAAABWsh1rAAAACXBIWXMAAAsTAAALEwEAmpwYAAABWWlUWHRYTUw6Y29tLmFkb2JlLnhtcAAA
AAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUg
Ni4wLjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIv
MjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgog
ICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyI+CiAg
ICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgIDwvcmRm
OkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgoZXuEHAAAeBElEQVR4Ae1d
CZAdxXnu7jnevfv21i5aSSutDrQISSAEEsKIshPHOAQqBmJXgm0cxyTlxAnYVBIHx7IdyqaMgys2
jp0YAyEuG6g4YAjmMGiNkSx0ALqQtFpJK2nv6+2735s3M53vn3foraRdHehaMb27Mz09Pd3T//TX
/9///3cvY25wKeBSwKWASwGXAi4FXAq4FHAp4FLApYBLAZcCLgVcCrgUcCngUuD8UICfn2rdWl0K
XDgUkFJyNrwnyPSAxky/yaqrE5xz+2Tf0AXRyVLKzXdRUiA7engRG9n9USu+Z5E0olWcew1eMetd
tWbpi2pdyyaAKX2ihrsgOhGF3PsXJQXAfYTVu/NPMnt+9A/G8GuXcXNMMC4YkybjSpCJyqXdWsun
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
gg==

--_25c36480-db71-4090-a8b4-4b856cfe0606_--

--_000_DB7PR03MB4841EF79C4A0EC6DF2E96CD9B5DC9DB7PR03MB4841eurp_--

--===============6098033293260281911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6098033293260281911==--

