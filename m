Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73CDC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 10:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EC648133C;
	Mon,  7 Feb 2022 10:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q30QB5Evot7w; Mon,  7 Feb 2022 10:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADD548131A;
	Mon,  7 Feb 2022 10:11:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24BE71BF41D
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12FD060B2C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="ayktbyte";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="ccV3UYyI"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0eDKFB3RvKa for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 10:11:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80A64605A7
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 10:11:10 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F256040AFD;
 Mon,  7 Feb 2022 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644228670; bh=c/R71GGhF8zqYOlxDOBmyf9luI0ff/eW3wDhR7xNDPI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ayktbyteY/LjzdtDZfz2AkVfHpGah1P/GlaW4oNZfqFdXM7rp0Miw+CBEfp2Dek7o
 bvSfoNGPeEm1gc82HYaYbhKyegAxHsUNI9D7CTw3q07s7WlHUiIm1j9Sv2cgiAb64a
 yf8IdSlEDEa940H/G3jYBfbW6pp8ARVe0kEdyFuGuVEtMROJJoEdbxYbFg9wGnPV4h
 TF1DdzRbBnCrKeeZj5rs97dWj2a4W7xqgUMnFM3S7Y8DF1/uv13z1lXbD0p/5H56Kv
 hjMfvHEFUDHsweCqTBjPGLU3irtZHvvS09CCzfUIULYc5dHS2u+2t0H4urAwkPLgAt
 zr+HxtcLDx74A==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E3EC2A0070;
 Mon,  7 Feb 2022 10:11:09 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B9710400DA;
 Mon,  7 Feb 2022 10:11:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ccV3UYyI";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnHw3Te4i1lzaMgXg5Fx6dahnQCWFWUaUtKzYoSjr6pA1XGyfR4XSI5VInOn9getZh7i0VPXj/70s3QDvPOPuW7BoWOELEiKxY4ysB2JqdCXKHHIuhnK1QweUB0hHRM30mnj/GSAt4xMy2URWID9eMeiBNPjuSCi7ocA2I6HGdeX/XCT6gWyLH/HfNLh0JTfyfT9JEZftv2r4ED/9NB30GfiVqcLHJQ3JDAIRIdS3Vqs3IqfUugDjSe7wlxkkHqToqhB2kryKsLFaRRJ/GMr6/iiox8uupYzKcG3J0bAZa2vM+ZuT/tAJYvSg5VtGoZ8/sMfRpH/AnvKzFit7w66hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/R71GGhF8zqYOlxDOBmyf9luI0ff/eW3wDhR7xNDPI=;
 b=jLI1OEpMf7ReDuGoVNxsH4z/RQJAgibdOzXQ9wqn+aVgx54uHhUb7LdcimzU2mykd4PxMHKCUbzMPIOg7pBfHk6k9D8g97T21n+x7xmknE3KHdrzQM6gsWhF5Yci5zGJH4d/IrEIK04ZKv822gqIb/9Pxy40ekWZcVgJgw3InzrpD+wdMo/hP8dd/zmGcJtF0qFJJdNYeTirPbECWqMcjyoJgSG3OLKEaRQCFpjXnnSFbHNLfdB7PcFkvIpPlqGqzaZwNgsMp8kWqioAgGvHt+lUT9UY16dzThtwNDv2RQvRcJwMefq6KCRMjvqn6iTrb8P1cbati4QbiayKfU5xxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/R71GGhF8zqYOlxDOBmyf9luI0ff/eW3wDhR7xNDPI=;
 b=ccV3UYyI9yoXQauE0I9wvMdumJgnfc5nbgnpiuB4sCPecMSuDRwBWYzz0NrihrvyjXl0Nl8yp9hVAQMQ5b2rdGaug4P4xO+XkjXvzaGt0pZWiPrjPYRrbqJbkGVcaCD9htVlZ3dzAefPkb/n9ED2vNeatD1DKzs5jGm1zWrm+ZE=
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com (2603:10b6:405:57::7)
 by DM6PR12MB3145.namprd12.prod.outlook.com (2603:10b6:5:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 10:11:07 +0000
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d95b:ceff:cf14:c484]) by BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d95b:ceff:cf14:c484%11]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 10:11:07 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Sergey Matyukevich
 <geomatsi@gmail.com>
Thread-Topic: [arc-buildroot] [Buildroot] [PATCH 5/5] board/synopsys: remove
 outdated vdk boards
Thread-Index: AQHYFnpLKw6JyyXkwE+TiQTr3nJxqqyH6Owy
Date: Mon, 7 Feb 2022 10:11:06 +0000
Message-ID: <BN6PR1201MB02287F4E86EA7F89D8DA0ABFA12C9@BN6PR1201MB0228.namprd12.prod.outlook.com>
References: <20220131081214.12773-1-geomatsi@gmail.com>
 <20220131081214.12773-6-geomatsi@gmail.com>
In-Reply-To: <20220131081214.12773-6-geomatsi@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 284737db-a4ca-411d-3a70-08d9ea22282c
x-ms-traffictypediagnostic: DM6PR12MB3145:EE_
x-microsoft-antispam-prvs: <DM6PR12MB31459865250DA3ECE684943CA12C9@DM6PR12MB3145.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lp2pqaF7OZVLmYTn8KL5leGaV3jRRLLyQJc3Xh9OnHOo81Mnv5h3YldN1dQfzYRey3OHIdTpMGEVIEgUaGEtLf7GhydQsWFkvU/abwzDGmW4BPuGrxOmSZd4XP0FaX+u8CSE5gYJlFOTymFaobNQNckpOXGBXVk2BOU4twAlGdcQR5Uj3wS7IWDB+HLNOccJnbYQzOmfsdt9FK2QjeL68VKpg81eAyGUhih34WFZKOQLvv+YmUWMLU4pJz+oH4J1zAHQLLQDDB2ff0d3Ap/GcNihty/1nOGnSn8c7MPxWfP5M2iaykFmLPFwqb6x5iMyqejKdJGbfrKmgZcDGcWaBpT52MUhPN1qd95waL9ZHFW8u+RKGthSER5ePlVhO2bxRHFBn/g8tTzYtcaYiuEadjvKgurMLwlhbaoeTL3wIaUwk6q3HUF6ixlhul6QDmT6VlNk6xS2R6DWF6yCHGTm3QGvPoQYwRn0buyZKyAi6fYOlVW94uFn580U7Sa+X5MN37WGHYRexTTCaBNh1pV6R50QbpRdMSjz+NWg17eLihdnISlAl+u89N50uGxevlTjdjO7tE0oua5I793p9YsXtmMjnXPfE61xFefNVHe/1deybPUYlRawixzaXBZNicGiGe9QbwcY1sMl2S2AG18ihviaJOKF1jUaxsCg/YUFDHNI78jrILrU75GFlgob4gotJvL7wUyXv6r5h14XC7SneZd6+JBbLm1/ESlaI/Lp0qhIcCNYrUFGdfhBrLKRBiPi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1201MB0228.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(55016003)(26005)(186003)(107886003)(91956017)(86362001)(7696005)(9686003)(2906002)(66556008)(5660300002)(33656002)(558084003)(52536014)(4326008)(66476007)(66946007)(8676002)(38100700002)(66446008)(71200400001)(64756008)(122000001)(8936002)(316002)(76116006)(110136005)(38070700005)(54906003)(508600001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VvLoTm85g0fnxqIUMF+cnPt/je96jObmnkUVPi5veXVl84pH47gMNuBFg4?=
 =?iso-8859-1?Q?ixnaDCaCKAK42vDkfdIb1Y+r+I42LmKCpZSlbCIIWSl5iUzFq+xyhrvzi9?=
 =?iso-8859-1?Q?nGgbO3dy0dZ1ygpC9vqPlQ35Cbg7QeHux6JQeQQEQy1Ev7yccgYRUjseOp?=
 =?iso-8859-1?Q?d+Ec5TughxtaVfYE3Sip7bw24+Yq7KbxmbYKJuIGASDRJUSX2NaOXoFzFv?=
 =?iso-8859-1?Q?oMGGbpxFO5MKNhJCi35OwluIfk32Q+Z9nLLy9Dyh2dnSlflH09svvNSfyV?=
 =?iso-8859-1?Q?couVlkKMIoNHyyEMDBaYcScAKZn/OMaRVYSGpI1QNkLrW8gLpmUrqq/aof?=
 =?iso-8859-1?Q?ANVqbxqQDjeLf0cQ0RmDIhp/y5RX2H4mIpS0FSQIcCV4OtZTDy4dqXZR/d?=
 =?iso-8859-1?Q?dVk0uyen6qNQv2yptMDDqryNtu9se+ogW0Sxk1pCtF9NzEcE1421KUhENe?=
 =?iso-8859-1?Q?JSVw8YLDrYlvk9JCWbk51s20/S0NadNuXHUIF9Fzh2E3E0HM/Tev1Z5aia?=
 =?iso-8859-1?Q?aYbOXqb3y96Jc3DATFpnpwiW3aBshlIaPLE7TT+cZGwvliX4XXKwN8U7xx?=
 =?iso-8859-1?Q?Z1h0oE1ucLCn52bDXptThy5VAT8mouyUwH3SXOvXeltx01JJmHJiH+7yWR?=
 =?iso-8859-1?Q?PnzqhjFXHcsmluLAFuGIp8EzPU3T8LBbpYwCXdMTRBHe1FYKKr/Udld5j3?=
 =?iso-8859-1?Q?YCSz6Q6YIIf+A4nV0hmFVLAxet3tjSGYDzzd18BTZTA18NGKO3dttne8Qg?=
 =?iso-8859-1?Q?TCNai6q6FwxunmNQP26aSeunsk1jDZnBU9m7U878dzAQ1sYyetqo7fOr/X?=
 =?iso-8859-1?Q?U26dtDoevRLbbtjqroDJey/Ugcs7TzVOeS0rJENNIM7V7Pmcls89p/Jq8g?=
 =?iso-8859-1?Q?hXS7T1JeLCYJo+9/4KtMD/lGT1lpw9RKgXpgwYhU3VtFGhDnUlz15hI4Dz?=
 =?iso-8859-1?Q?Lym6gQqW7ovEMVv+sloqIhk/nBgSjlfie7+44Bnhkgab2kIU2Ay0F4r/1K?=
 =?iso-8859-1?Q?48w1b654PR3l3skhnhAW7HO2VgcrktqTYKNcGTh2Pr78DjHqteUs0IY81c?=
 =?iso-8859-1?Q?c4DDPc9z45rQL7NeKgdb4XUDwqmzshw197v31o+4MYQx0CeT28lZVbXwy1?=
 =?iso-8859-1?Q?7GNOT0YEHnnYMAPyDf7pbuKxJgVYjWrKH/BwmxRsTSBcXlUbYQnPOr/UxE?=
 =?iso-8859-1?Q?zYIg6ai3x+27UA7BvT7PFt8ZAVAOw8zYEAQ6szXlgWTuypVlqB/miwEvKk?=
 =?iso-8859-1?Q?zYNSwF438CYHFgCXiCta2zmCtkYimLUM5v7Qbz/4wAwC/aAE4lfpVrogIk?=
 =?iso-8859-1?Q?EpLpIDQuqrGdkn1VWoKAbbRGeldARwQNGMM6u9ds9bQn+dj98I4PPXmUYs?=
 =?iso-8859-1?Q?mVLz2hWKqOSCTh40C3Smn71JnpNER0DTq7qQOTbtEFVY4Ebl8UvW7VggYd?=
 =?iso-8859-1?Q?fRvJ1EpLn81fvdkt5Ig3kTY2HSfIDt9B/xZzBnquh6vn/i9tzubfD31gPU?=
 =?iso-8859-1?Q?vnWLhHCY5OzanpKhmvpa66hNX3Kw3pTmQFXtmZceyxZ5yi8la7xrJwWZ+5?=
 =?iso-8859-1?Q?6L5oo8CnrW3ub4/Ay7GU7qKItaGiFhx+MND+97mdjKC1zUWB8MJa3uQ65g?=
 =?iso-8859-1?Q?Yn+rYBKlE8iU5FLUJtYSRylmjf6/Y3luAs2rMK6XScawsyNVwgE9t6ag?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284737db-a4ca-411d-3a70-08d9ea22282c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 10:11:06.9348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0msgmccWXSDSmtNoCu2KwsBBArbGdavEaGmXFyjfTXpPWRnxDv7/pgYSWS70+3fORuEQLgbePjevsTk+LgA9Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3145
Subject: Re: [Buildroot] [arc-buildroot] [PATCH 5/5] board/synopsys: remove
 outdated vdk boards
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey, all,

> Remove outdated and unused aarch64 and archs38 Synopsys VDK boards.
> 
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
