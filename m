Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A374C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 14:41:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC467611CA
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 14:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC467611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58F1D4010A;
	Fri,  6 Aug 2021 14:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id szqTdo9H5epW; Fri,  6 Aug 2021 14:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EA0A402D2;
	Fri,  6 Aug 2021 14:41:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A75C1BF321
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 14:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29EA183ACC
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 14:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R28KEM70O8lZ for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 14:41:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::608])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA24783AC3
 for <buildroot@busybox.net>; Fri,  6 Aug 2021 14:41:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0rVIhfdk95IuZEl42sNQNb/0iZArCYTUOQZ9PSLlE0jyl9lPd5sMa5qndr0hMApV41ePUGEHDRan3Q9I8Uaw5EGIrJf0zuEU1ovMHRtWxc4O4k7ue4pkk8Er/aAjOjZZ7zG8/EPuWDwmNkI31K2cqGDltxV7CAFXOQS+oCRhmsvMnyawE6xGLUR+qKaYboYRC6yts67LHLp/mfu9DaLzJhU1I+Rpa9ogaE8OXKYpkEa1e2zmmgiwNBMXdnA6EpPscDMA5mxhjDn7gQklwJuhvam3XRrzzcw2qyekUo0L16xdMxzIEQQwCdCkrB94DR/Jbe9/7KAURV7JKfMwyp5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMkd3R0Rfx9prLxkdnHstq06OSiWSZSf4Q/bJpx3eoc=;
 b=BD/86qRu/LC2S8Ea67k33n3F9Qm6fmrf3qU1tzo12xqz5rdtWnLo/Ny16qVn6gSuSU1KRL/Vs/mICtdN8LbWzed0EBJHeABIIXQ5ADIRZKNI+p4WiPTYc+EYkHrlejcPpE3OyvEphCOLWz5zR/Ysang2GdERTR0QU0PTo7KOxlubaUKhzw1HlSsQo0RCE8LaKa7imgBlbRtX3yk0MxDj7/l5DYCCLRacqa+j2i8C1cMlcjwd4g9t7tF2IkjPKn3G+4XqYCLCwvsAAeeKkRqasMoNcvEviLH/BZw+6QOblmfMr87SDnM+n3TmIwci1KQQNrIBYuzMmdDA0dBnjmqamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMkd3R0Rfx9prLxkdnHstq06OSiWSZSf4Q/bJpx3eoc=;
 b=NcbHv21FXwtZ3AVBxH8qOrlzH5IZmgnTXWsiDbiNWWaaYcX8dek4GFW0Og3zo8HxTVYYQo6cLt8PdiPO6QZHU+tvVhDVVW9W3zOpFEPRD7mj90s6txXBCWjcuwWohs8xSBqqL2V4+ZNUai9cuTP+ssPBSlML0GiHsp671SxgUMY=
Authentication-Results: mind.be; dkim=none (message not signed)
 header.d=none;mind.be; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7154.eurprd04.prod.outlook.com
 (2603:10a6:208:19f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 14:41:24 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4394.016; Fri, 6 Aug 2021
 14:41:24 +0000
Date: Fri, 6 Aug 2021 16:41:21 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210806144121.4hdmevs5lvxbxwsr@fedora>
References: <20210805103124.tnyy4uqurvngvq5g@fedora>
 <0875c705-8f2e-ca10-cb41-bb83d9ab85df@mind.be>
Content-Disposition: inline
In-Reply-To: <0875c705-8f2e-ca10-cb41-bb83d9ab85df@mind.be>
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend
 Transport; Fri, 6 Aug 2021 14:41:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaf3e160-eda4-4a60-90b8-08d958e8438a
X-MS-TrafficTypeDiagnostic: AM0PR04MB7154:
X-Microsoft-Antispam-PRVS: <AM0PR04MB71540A3C8F99648F194FAC40C2F39@AM0PR04MB7154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K8UPie7drw24iA0LJIkWjiqiX8gzARn9Ld1PtCOPOyilxsjdnOo8eVnEiYb+EmGTwtKxt4V5Q8yUDZyXZ4cmJtINnAwPqKnO76cJ9fWH3iBqjj5KBvyixjiJSzxf8NzGNC5DD/GBLOg50mmRHIInW+qZ2BVIw4D5oF0WyJt0YyPuPo4rbqxXweWTBc8aaXz05jAf2mFkiEPl+YnF3eOwyRZ7wplI7Ol+Ellky7/fL6oEezmjh8A8vs5z5q1Uv0+cZPo0f/dEhZT+Y1wD8CXUXbo30tuCfvUYOefd4dvod7XnuoMh0HAhbpJxzojeQFMhG7zkiowVBMbq7uHCKLm+Zm5VWN0Tevck1J/ZS7IRREMw4z4zTqkA/qV00Hmx+fzsp03cujeG2ATqsu0uEtBFRu4VEY/Qzc16b18BKdvuoprx+iF6ldRN2tM7QtSqHlf4SMiPze547Nfp8Hbht18wTMuiDYCOc40f1gk9rQ3vSTDRvGEVLGUiy5QMdVOijbRV1tV14LDqlEG8/dH32bvW3W9/Ld1a61KZGAWFgohnJwrHJWpesD4M1P3VotZIPEcNWrsCwxlBb6f1BBrUq/nmCEwuqzJZMlU2qq1e4q8aaHe9QiB9GzOw9tfATuvnRTVnntoMGjnw+7a3hngVgJEUNB+cpbDWVjMoHzTWeGqNe8OxedkwdmA7AYF4nm50iP2UfF5EHbLwmpy4SORBTLwHuvWsbED5KDszJZ7zyd79eP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3348.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(366004)(376002)(136003)(396003)(478600001)(53546011)(33716001)(956004)(1076003)(38100700002)(38350700002)(316002)(66946007)(66556008)(86362001)(66476007)(44832011)(2906002)(6916009)(8676002)(9686003)(9576002)(8936002)(6496006)(4326008)(55016002)(5660300002)(52116002)(83380400001)(26005)(186003)(42413003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Li+Oblr59UQrotN0DHTM91+v3hTVheI3cOjZTCPNqfA77XfNOjg5KrVfj9ma?=
 =?us-ascii?Q?jAT+/2UqAcivF5dmMc9InIzd4tgRX9DVfKGdftB30m2EK3lM9h5Xgoyr4aSo?=
 =?us-ascii?Q?+QmTveJj3yMQu3FeJtzgyP8C0HMSZpjktZyb6OJrndNZgSemJm4VQRdRp3DZ?=
 =?us-ascii?Q?HZl4D34HA3sVUVKGt8Gh9Ym8/Ma4NXJPQiMFvkVOOjQd5hIW2zMgeRQJYeXj?=
 =?us-ascii?Q?bUACJ0IJlmxeMuc7h+dPW7eAETvX/IUKLuqms/bVGLUqRIJbhxgm2hooLjCQ?=
 =?us-ascii?Q?gmgx386KAA0HdS5QBoKG1V2VMEwQ9XZP1RMmn22T1lLW1oZ5UQ5Cqx332X4/?=
 =?us-ascii?Q?DHxrwGJ0hGLpPdl2YwvO+LzpSNlAp66sq5yisUh2iw+rNwwbszhEhOuv6pjJ?=
 =?us-ascii?Q?cAlUP//xxb+O1BVOp3Jp71NBjJ4RJwmBgf33DSQyakzXGzIQILnu4BDjiDKY?=
 =?us-ascii?Q?Rtmx/LytkRc7yuxjADV0hEG+JbSl9Akw4HnTMuLpkRF3NK1uPysGErjd9eKg?=
 =?us-ascii?Q?2gTzvs9EvPv87hZ9Ci13RMC96ghU42dXdOpHeRGAdIrJC4NSES74q/Lwdp/q?=
 =?us-ascii?Q?/Py534eET9ySEavof+UkJ1FpJ9XcNb1E3X+8wi4CrE+dUrk6Fqv2d70ZKqEf?=
 =?us-ascii?Q?A1p/vYbQBHzDCMo4t9crEdqDqmM4uY5cLbvX3pgm77Lf4XGfE7FHodyXeYop?=
 =?us-ascii?Q?mGUSsQ70PWDjMGgJTYV7Gt5/qwYTB80wspD2MaNL8/a61Xaoxwqh1XFWuSgB?=
 =?us-ascii?Q?NP/pwVqvgsPvGeMciVSUd/hb6sJbb80B4bb5G7uflfJS0Sxqg2t9NmYgB3Tr?=
 =?us-ascii?Q?8v8d69d0ClgnR6fwEZEqQI8q7GXyCoNdMzxxHswv6il/vtXdmDVuu8gzdNfg?=
 =?us-ascii?Q?BzdTjKjNFkpZbLuvtqn3v4N0LUEnxWbZwlDAyxE30oz46XfBc5NMhJfm3ZvT?=
 =?us-ascii?Q?Dg/1Ts7mCxXW1pUzblv1vTVevzqT8T8tDS/MUbR6NNX2CaVXTuQMmflKcOeW?=
 =?us-ascii?Q?ypgJzvZw2GandEdG3BG3o6p2qojDtRQNV77uQyB5J5pqaHOTXT3QYNL1PdrE?=
 =?us-ascii?Q?89r3kR3Zk/Sn3rH2fRCP5xkbWkB97h/NA5Fr2Em5aOs0ZiWd+v7DAFCdGK1j?=
 =?us-ascii?Q?QN4utiwfWUwbTIg/xDti5Au2JxVChCEVhQTl5jc+R22Mc9mMvDaJGv7d9PXW?=
 =?us-ascii?Q?pr4ItikcKcJSk2oqjFPYHMJEZ64RZDb3KE2K+5FK3qQcEsaKTf1NFhWCOJEB?=
 =?us-ascii?Q?bQ5tfEv0ohZUDabP84Ep1SpcnOA5SofARzlzTZFmOk0lscxdhEgrXS5xJd2p?=
 =?us-ascii?Q?aB/hVONRj2KMhcq73FTXsdNs?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf3e160-eda4-4a60-90b8-08d958e8438a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 14:41:23.9265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dULdh/wp/EVpgWIJ26LdSn37F7dKL1f25aDEWuxnczHTiRFa9kytMY7hD0wrLl6pOQ5+m2bo1TzQsvKiAzYUJ4j2Cn9aRoZdKePMNglsU18X7kV7tZAx5i4yX7BU0Gdj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7154
Subject: Re: [Buildroot] [BUG] qt5declarative not building on host distro
 without libatomic.so
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, ps.report@gmx.net, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Arnout,

On Thu, Aug 05, 2021 at 04:43:50PM +0200, Arnout Vandecappelle wrote:
>  Hi Quentin,
> 
> On 05/08/2021 12:31, Quentin Schulz wrote:
> 
> [snip]> From the logs and also the Makefile, it seems that qmltyperegistrar is
> > built with the wrong -spec passed to qmake. It should be
> > common/g++-base.conf (or something similar) and not
> > devices/linux-buildroot-g++ as currently.
> 
>  After a lot of analysis I come to the same conclusion.
> 
> > This is confirmed a bit later in the Makefile with `-latomic` making it to LIBS
> > which might not be what's wanted?
> > 
> > This `-latomic` was added in
> > 7d286be4f96cfb731e184c3e8cfea27a031bde3c "package/qt5base: link with -latomic when needed".
> 
>  We end up with $(HOST_DIR)/mkspecs/devices/linux-buildroot-g++/arch.conf that
> looks like this:
> 
> -----8<-----8<-----
> LIBS += -latomic
> -----8<-----8<-----
> 
>  Perhaps that should be changed into:
> 
> -----8<-----8<-----
> !host_build {
>     LIBS += -latomic
> }
> -----8<-----8<-----
> 
> 
>  Can you give that a go, and if it works, create a patch?
> 
> 

This seems to work just fine, thanks!

I've sent a patch. I've added a Suggested-by for you, not sure if it
should have your s-o-b or if you want to be the author, lemme know if
there's anything you want changed.

Thanks!

Regards,
Quentin
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
