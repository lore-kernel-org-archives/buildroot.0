Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150A1C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 06:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A39582F14;
	Thu, 24 Feb 2022 06:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Rzf7EhoqYIL; Thu, 24 Feb 2022 06:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E506582EBA;
	Thu, 24 Feb 2022 06:54:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 698931BF5E0
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 06:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 572564017A
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 06:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m1DyE2NsxNiw for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 06:54:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::621])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C7E9400AF
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 06:54:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWo55Duwjy3H8RR+//KSaliebGDBvyhC7YAO3BhctLp0GHrorXQtrSgtXBYRDLE4wa+b3r7Mh8jw/YDKImKAiC0y2kL160BlGJwnpJUhKaXLnE1rzT5+WHydpmUa6UK0Oy+BTMjIG1Jonzwi6SfrDJwVcCR1m30NdCZtcGdpuQqcDWz1iURnGFzyMi8nV39VtX5bD9ZpEE1NRnOQnTq65X5ikiHnFcs8yinEdizqophMOnFFSsjGwbjADcyJ0yLYCsSWaDFZ4zce51Lg+4AVrUf6d80iDUjAJzABAYJkJAo1UHGKerib4ARO9KzAupNuH3rdFK5JqAr0GYxHsjYZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP1cqBVYxSHHW42NDcE3l5sOnKA/DTXSmlpH1myMMlQ=;
 b=Wlygo4MgXSKFlP35mcarUOXEuyLGIG5RTQtNLR+XkKowrR1XdHxNNL5wHMfgS/poxxZCRNDAKKGubbmZoeZQn1QHEHVdSSYFaPMvajZYIvY3yY9KYPWdAAJL0nVTmoCVp8kzJhJc9ehz7kOI208IIjF3E1RZypSk3ExcycVeE3OtO6tbaYGH30EmWgdTvCFXC72mFeNhhDX7FlQrnywHQysjrY2AZIEySceklwDH51FbloTAyhO5eicfhwChGSJk/KtxSEfpWOFcbj8DugRrCgn48cMpKpXNnv1TLIfVBexu+QBuG0hhmwYFcwDfpJg/V7rVe1CDpceQujIffTpLpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP1cqBVYxSHHW42NDcE3l5sOnKA/DTXSmlpH1myMMlQ=;
 b=RsI/BNG9wIK8jeiq0BJyYX27iOrBqBuhs863/9y5+ERfqMcqaNI2Ss/Elp/UazDfeRwHzarrlWPv6BWfXFiWIjAZbInShsF9f/53raLfr0XK4sTFwXd7IibDBSTbGbGNxgny2cqpjcONYNusAZMIZ0bNJIdezrkVqNURjiI+VYI=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by PH0PR02MB8422.namprd02.prod.outlook.com (2603:10b6:510:10f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 06:54:35 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 06:54:35 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v4 1/1] configs/zynqmp_zcu10x: fix U-Boot dts config
Thread-Index: AQHYKN+2jZNwNumen0au9fXDLnTh26yhkARNgAC0LDA=
Date: Thu, 24 Feb 2022 06:54:35 +0000
Message-ID: <SJ0PR02MB7758C7A233840BA37FFADBF3D73D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220223180336.3372352-1-neal.frager@xilinx.com>
 <87wnhl4ab4.fsf@dell.be.48ers.dk>
In-Reply-To: <87wnhl4ab4.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f96dfd65-4c31-4a61-16ce-08d9f76284ad
x-ms-traffictypediagnostic: PH0PR02MB8422:EE_
x-microsoft-antispam-prvs: <PH0PR02MB84229D2269DF6FBC97D7E94BD73D9@PH0PR02MB8422.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ehkkcfDiVrTyLd7LLw00GnHcjGrJKD9NDDxvLdQgvfrbufP/s/eNq4mLnOlqD4Znz0S1ekb7LQikBcSZMqRMMmQMoDY+n+ygyRP36lcTcC05+nTQ0BT1Nu2uFILxr6soFGWK2P+c7QUzBxEOjO1YJBrg//FsMPHaCpK+qGK5C1Qp33ZgpVidxupgF+DrucOMjigOELpm/HihdpIwfIzZY3OeJglaUw9/R6Qwm7IP23aTgYVBP6t+wYj2FGglHNHER7ojhZpAk0GZB+o7IQJmYKPOPsFvAaRsbGYaGPbEPUH/nQAtzAQ/qciGSfvmYRhCscYB5U+2UnPjcuRbEwe/WvO2HwEQCq/WYUbZisC0hSHCEO5qPvv8vZQPCxwpzvfvporOforXpgpe913dsKEET3loJUO7A8KAMdLB7Vk1pfuMD1HlsvzkisFw11oUqiQCxPpRAkrxeXaEa7uRxVXG2gD5Vw5UpnFBAWJW4qmoBO2qitcG7L2QfAk1aHLZDoRhkhQe+QcT7Fvr6XY7UZRwwJZUCOSRCMpma/mbK5+fn9atOFFI82gqrdFBu3CuRYvoRJTY6/v2vh8+MzECUtnoGK56B3v0De59G4F3/TP3fg7FrQJvdOev/S+YAxm0+e/dEDqdIMsR5qt+jGEW8RP71SSpeQPKqOoyyCuFBIlnlHIEZrYsaSYjvPI8b5TRx5kGyqrwsOKbvNZ+xs9Xn0gZTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(186003)(76116006)(66476007)(55016003)(66446008)(4326008)(64756008)(8676002)(33656002)(316002)(508600001)(66946007)(66556008)(6916009)(7696005)(54906003)(71200400001)(8936002)(26005)(6506007)(38100700002)(9686003)(2906002)(4744005)(38070700005)(86362001)(122000001)(5660300002)(52536014)(107886003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PpoVhKOgUT0IiDMQILG94JCj4ZyPb1nkyMokQHIhniTPpaBKLXr3eohEs1vT?=
 =?us-ascii?Q?xrIa9dg5uhSDnh+r/Lo6vsoeJ7rpeWlzexMqDfTjmdKgf5sPABCDbi+Wq6Nl?=
 =?us-ascii?Q?s5wOMF4u+4tTUoHA/CGhEkXo70sP6WUv0soGqaxAufm4lYT+gZf3hMW9Qa0C?=
 =?us-ascii?Q?soQy0Sze8uroPRS6VZCQm9tZyc/oKlLRQsZFzQ4dt0NbhKvsM48hwPbNAgIi?=
 =?us-ascii?Q?fqTr17UKjuWMTAMUm+Ac5O/zaO/oUZi+6n5hFiXoJgfpuW9hxHjdCXxMJT8e?=
 =?us-ascii?Q?qOVobSlL7uEA7weyfXig9cStX+Qaie/zDbRpLW6dESNpFmTzg6BMgNC0qyZE?=
 =?us-ascii?Q?EX1LX0ecTxS+hMbP0auUOdZQcM6Txi/keov/y5/lE4UleSIc2+EKNNH8rVak?=
 =?us-ascii?Q?5rTqQXTR3EU37JY+e59ZaGi5s5gJWFOhQuFliRoPyKNVBMge7qKcnuK9Rru6?=
 =?us-ascii?Q?SJuaCHdBFr5J+oW4+aKjODn+D7Is73x8L2XOmY3hesPa1/0zmS2Vcl8iOnSH?=
 =?us-ascii?Q?fCl+Ic0sVGbVkGe0H9yF9dJscy+P3SprLmjCAEJxqEqQ8pYu9UXUohDtUELH?=
 =?us-ascii?Q?yzcdS/boPlZbwiioedthGEVkw/ofzjg13TSHcADKYTmpBDErb3NbeNrrFJMX?=
 =?us-ascii?Q?TFOYR80xSpz/apzutTlIUX+GFLGvRywM0Ls9aKo9FxwMlNIghzoPNpUzixtH?=
 =?us-ascii?Q?g8UqzCJ9We09kNoPVAhzAR6tMENa/15Sr+4kDVrkPlsyCXcAyL//3Wgft4tj?=
 =?us-ascii?Q?GBtaUm9MKwvnZgb4/GegRTab8rslvhXtscGdlmuJxTOSddRSuyTYryOu25Pz?=
 =?us-ascii?Q?KVFgQvFMNoyjIYqfNPecMhkclQ7+hPDhgxYvPJYDmj6kGKv78uIOjsusiT+5?=
 =?us-ascii?Q?nSNgUUTbDcSm/LwYOEXmNElZKbLyh+GtUjIQRmNfCL7gcmH2GIsqLSMOfssl?=
 =?us-ascii?Q?nmWl6nFfk6vQVN8nu7J/phxGef6tHU+nYeBoAdnGBREwsyqAmoxdwkxpxYLB?=
 =?us-ascii?Q?PB6Hw63r31tGZlpaIDFGQNEnusG5PdSncwHaDaMgjlG39rnbtt98tLL6C2rN?=
 =?us-ascii?Q?k9etUNd30YnPtxeCndxMzX7Xi0NI5CNeqCrcZgO5mVXGbzTaO3CThWFwVFfn?=
 =?us-ascii?Q?BbJs9pddTVI8ASx7r/o4Q/ayTOhaWKtqfMWyVY6buIWRPjSf3YHHZgtk33Ud?=
 =?us-ascii?Q?Dc56yB6TqBIYtDGQKW/wIDhLJP5msnyiPj2NubfDOyYjh3vUb5R5BCLEFJjI?=
 =?us-ascii?Q?8nb32Y7i9lYcBRRcP7T7wXiv7A33T8G9ujMTckR/yurLQyH6onLIYpLo4HMf?=
 =?us-ascii?Q?mw/28p8DCme09aGxXNccDO6vHW4C5vTmMOLuwvUTSvCjEF+Ut5fATKm5mKdh?=
 =?us-ascii?Q?cNVjxSS51FmDP40pelSpXTOMu9hmPs8203tvxdPwiCX7Ls1+4mjBB4Dmg4dj?=
 =?us-ascii?Q?ZIziL/aAVyASk1Hzrl13oUx2AkE/9/K5qwrGNVpPquHZRo2GRP6TyjZk98jp?=
 =?us-ascii?Q?5KsVcrBAck4bs1/KJYTozdIgiLPerK9+OiAiawOH5gcEz/TS0bz4SJaBkys8?=
 =?us-ascii?Q?l+ma2b5zA+50AGJcGfiMxC7EFUbU6dD0O9YXO2VP5A0LDIHBzEYX7SDorNWb?=
 =?us-ascii?Q?CnB7z0kJOJLmyxmPH2C5x60=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96dfd65-4c31-4a61-16ce-08d9f76284ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 06:54:35.3490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OY9PeS2LUTVohm8vR64o7+LgAL9ow5mVU3u9RdJsxhWvkcLjbdZPaslrVYerfJccmEO2RBNPSes8JeKzypNjwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8422
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> Most (but not all) fragment files are using the .fragment suffix, so I renamed these to uboot.fragment. I dropped the reviewed-by and reworded the commit text a bit and committed - Thanks.

Thank you for this update and commit.  I have tested the clean build with this patch this morning, and I confirm that it works as expected.

I am not sure why I had a build issue yesterday.  Starting from a new clean build worked correctly.

Also, I confirm that I ran my test with the environment variable DEVICE_TREE undefined.  With this new patch, there are no requirements for environment definitions.

Have you tested this patch on your ZCU106 yet?

Best regards,
Neal Frager
Xilinx

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
