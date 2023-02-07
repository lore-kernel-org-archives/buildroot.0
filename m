Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCD5C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C8E241721;
	Tue,  7 Feb 2023 10:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C8E241721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4EPAGmczteWT; Tue,  7 Feb 2023 10:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61FB441748;
	Tue,  7 Feb 2023 10:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61FB441748
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4DFE1BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E34768176D
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E34768176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxcLZsQhjUYt for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:48:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CD568175D
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CD568175D
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:48:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVQf+GQQF2vzwNM/7vE4Qf7Yply4TDeoJZ5BJcKNSm/Nnv5mrIgk+/mi90Ehepk3NsZr7lTIT008XuYWdG+YXKuGqzcFqvOw+WTpcTEwTYSkAXMTi71ORWyGpMWdF0T3bqCTwrWBUPba+/0AuWJp+Uxzafss8QZ0+7721DnvTITC840nzZdeZO7lKrx1vaN3G8qMkx+Spf6UMgVj93aUPY7XHQIZVjeavtiuLp/L8IDH+VfWG2/MmTmVzVfBkgFRRYX6TP8aqQhhhghqXbp8ar1gWrMcoWAjyVHd5v2h52IZgzbvrzDm0S1WauWolrvFL7cdY2y9SdEVhimuL047zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGIhgfr5i8NWhgjHZgVY+eQCsLDItm6DpRK1KMBv34I=;
 b=Jx8GrGqNAsF8iVqumna/Tj66sDKhj+yiV8+1oVqzbWr/dMGfkOc0XWUXVWOHoOmgifL23JuZAK5S80MfoypbvEBdMAJpIvQW6NQ1nVgT0QIlbPdCytUCCxg5XdFXvhiRShUzf5tU2+XJF448eurz4UAftNBlUuiu4bzGOLrs9kHtj16YpLCTZsBHgzSUjyg6t4kN4TVz7+PdYBiw5g0vp9vwF2L9O8/bjXOj9sYWZrh9sRbvY+gPj2hkpp3iQy/ZCt0a6yTKwxmuKpdwdCproHCUfCmjVmZ0Q1fGFhXotiQdhgRT66ZKICLRRLrpsV5kdGtU3LfRKePWduZ0qm/4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB7322.namprd12.prod.outlook.com (2603:10b6:806:299::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 10:48:54 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::2028:6128:1d9c:22ba]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::2028:6128:1d9c:22ba%7]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 10:48:54 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: use
 Xilinx github for versal-firmware
Thread-Index: AQHZMj2MMC/1RhENFE6QeM0A6ggGo67DXYKAgAAASiA=
Date: Tue, 7 Feb 2023 10:48:53 +0000
Message-ID: <CH2PR12MB50049CCA64BBFA96DE2553F9F0DB9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230127105305.25877-1-neal.frager@amd.com>
 <20230207114321.2b5c2df6@windsurf>
In-Reply-To: <20230207114321.2b5c2df6@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB7322:EE_
x-ms-office365-filtering-correlation-id: 91c60c68-41af-4a3d-5894-08db08f8e7fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mw0haWmKRMRB4qFEIrFuAfiwcw/hN2lljxKYEohRYsX9gi9k6deQYeTUoQD7TRjzhHx08WqEr9Jrmw6Zi+SZJMOZ8cBJMX7/+PrO3zvxCdfjWSOYiqyozXJdA3n8/uLMoKXiiyAZaH57n+RlkozTIptz5irRIDkI7Qn/zrjeMoIuuu9bimujI8RONPK87HvlAQwvQAkL20u77Tj2qaT/66FBVsMf7avOix1fI3FNzV3l2xohcFyp5F1QeFXpIVEHD2BJ0Ta7AmnYPow5y/wHY9msjzT77BDzAAxgwSfhUH/6YfMgqksDE1k0n+pgSiK2FVz9P/RBE0ighnl1afCVPu1prHulU8njSTyHtjAW7s5wEFfzNK96o50Z3838pFVJiRQL7OkpiVpXpSuKf3oHbV0NCRK1+8UJdT1fPBjUsvNEqIhoxKN5IOohjXT8uLwrIl/k9quhqFxyeikOrIyG3fiS9Y1cgzkTxCXjKEvjfvtY88WuZxfafYf5LujGvb51LDAWM+0l6RV+4P/7X40Iw2+GDjfKMaxkUkO1JB2N9ktjxhb3UD/mW1oZ+tZPlIySfJLmfp4nqcRwnC7Yl7y8ONXsnJeEC7JNzLKvNLiw/FGIiz+p+ZCT5uN8A/Ig/vLZOwH8IvOe4M/CG+wz9/QTsmMT/rK9NkL7uOVpucV0w1XAGMxgoKqM6ba2RVmZBHdqSbI350lkZULRz638EviVQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199018)(38100700002)(54906003)(110136005)(5660300002)(52536014)(8936002)(38070700005)(83380400001)(122000001)(86362001)(33656002)(55016003)(71200400001)(2906002)(9686003)(186003)(7696005)(478600001)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(8676002)(4326008)(316002)(6506007)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iYAaT/2G8EeTdGYJZa+MGp4MY9OsYlP2g3sr2tc/PdD8p3/hUyUEi9Q1ra3z?=
 =?us-ascii?Q?EM8kjjjweHzSvMFkUdQLfjIvjvU/f3ka4Ad2CP4UbZQDvMp+DLNvRPwMqrI5?=
 =?us-ascii?Q?E63uhKRG0ng5K34/sNIqQ4ipZkvytds8CJJzNczMswVF6Qn+5ZKOwP0gZL2F?=
 =?us-ascii?Q?b3CW5JsqZfrfaiGdE1nPRgbevWHLCCYcIU8QULTUTCf9/JOR3sb6TTrPywNl?=
 =?us-ascii?Q?5lzJK8umHbE3GWxJI/yI2sWnf9t9f/bh8envKV9DYP8qc0iWyi95fDH1Q6fB?=
 =?us-ascii?Q?s9PAtmN5W6NkdZ7cWbFHeqtFkPKWrldAtPyKxBw9l64W6MD37GOLGmN3hQX4?=
 =?us-ascii?Q?VQLuP02pN1hS2oC2+AUw1aWB8Bg79C99OD3kJjsPKYPKh0PArb9/2F4KHrOG?=
 =?us-ascii?Q?9L5AE2YGJuZ2IbPsJL6loKyXFpif5P7P8PHjCPhAqvUVQGE3QDqXPrt1znJR?=
 =?us-ascii?Q?UJZMIuaD5tqnmLlaGWLAb0jDFJGACoRwkNXngoDhDlho1o6Etwmd+XgLVPPg?=
 =?us-ascii?Q?w8O/yRa2lxcdpk4fNvmUm7cL4npQHVImMDjGIofvrZN5CbRNot6DBHdwHZ1m?=
 =?us-ascii?Q?yDk/CP6vqzMFsBlEINsjpOskiXSSerWiP7Hnjdj57kiqxmghNfj6ZbgUA5+G?=
 =?us-ascii?Q?G30NWm5yyLr4wa/3BuJa4bwFwaeYZKnCiJewn8xxfXBHyMXpSmeBqPgVgLF4?=
 =?us-ascii?Q?vva5MRi2dO0u93E23J8PJOcuipdvAJCkSIcqWmnBSocSd47BAGWrbKEg4xCj?=
 =?us-ascii?Q?ufE8nn/7rhf7tGNSd/JcABl6h2tLS0g7FrhQfiGvAjfJwP1orj4UMyp7uiqG?=
 =?us-ascii?Q?mlZ121e0bUwQUSvHn6SJiw0BWnYLFvLcjhgzBBscu6gBXaNS4xjxFJWsNMsN?=
 =?us-ascii?Q?Y2nJuHjcqWjQuTO41naxf6w6k9egMPRXC0+Obw73FTslLrmCmafz/dt1oKX2?=
 =?us-ascii?Q?YiWqrf2Lm2haHo2LXF8qyRnx6QHb7Am2tPE+ryxpQGjbcx3Y6/EGN5oOvt0s?=
 =?us-ascii?Q?Jg3jpqnGTP7bqqRb0ljzzSxDOZTgYBFPYvqGGftQtjPE1Z398vJcEbYt8CK/?=
 =?us-ascii?Q?b2zQtJdP8um556SONIAYfNo11yuHzt7KwBEbjXKTHtl04JFg8I8OwVpGtqPL?=
 =?us-ascii?Q?uKb1v4pwEeZhIdZcOlQs6p3u72n7V5J+RWjNhaa9Dboxnrueh1ApFw+WmuJH?=
 =?us-ascii?Q?oXBSHt5uQFcn6mFCBT9ffwdOkMLEzDxW7/tAXsUfjNob1T9y4Gx33SAgCXzv?=
 =?us-ascii?Q?aWFgkR2gxmCWFyxbClTtSKetk1qnF+Iz1FOBR1iqX/y27zLkpQmrc5dk3Bm9?=
 =?us-ascii?Q?oib/LeqFL5oGL263AwfOAXjGUntUNRqePvy88ugok40vC2dfOvNnYlS3ar9Z?=
 =?us-ascii?Q?T4zcjMpiGGg/W6eb4C7LrsQzJb1zKK3JYLHOYlW5QsyQtRqCBMXgnzLRJ2jU?=
 =?us-ascii?Q?rrQWW4A7kkhw3z6GhyWH4fsQstO5q96+KVe/jpRjZ7YTSntC0u1ldkxwgb3h?=
 =?us-ascii?Q?aATOe36KOzyDjy5AHAF71wbjr392L0Ta69oo7tslh5d/50PBaxciZO7D/Tda?=
 =?us-ascii?Q?cYKdmoQrCy1ZFUiNnoFuzrwfc0qvfIo6OMWBHR3RChs1e7KSaB3Ln/tZAOjq?=
 =?us-ascii?Q?675F4UWECLKYNIWzfnrUBWQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c60c68-41af-4a3d-5894-08db08f8e7fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 10:48:53.9756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /PTET6x/PtrvH7yCCOqT1rqlwkc/sK9+u806hOMrhs3/Tfzdw8VFX5AJ43oE8afv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7322
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGIhgfr5i8NWhgjHZgVY+eQCsLDItm6DpRK1KMBv34I=;
 b=0zj14KQ+RchNHA1UVVX0uNvlZN1UqkxBxGHoOc/zkh4WodnxnIUXAgzCeVQTrsOE9FR/T7Sr1yNqnRveDbBGylxJb/SRFutx3HeUDh1zHBOhC/LSIxqOoLchPjDxYn2BzCwUdtrAGSDI3M2xpyV+Y2Tx01Hx3rQeGKTTVN9Zl64=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0zj14KQ+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: use
 Xilinx github for versal-firmware
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
Cc: "Simek,
 Michal" <michal.simek@amd.com>, "Chaplin, Kris" <Kris.Chaplin@amd.com>, "O'Neal,
 Terry" <terry.oneal@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> Migrate versal-firmware package from nealfrager github to Xilinx github.
> The images are identical, so this patch has zero impact on functionality.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/versal_vck190_defconfig            | 2 +-
>  package/versal-firmware/Config.in          | 2 +-
>  package/versal-firmware/versal-firmware.mk | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

> I've applied, but to be honest, it still looks a bit weird. The branch on the repo is special for Buildroot, and its contents are completely different than the master branch of the ubuntu-firmware repository. Why are those firmware files specific to Ubuntu, or specific to Buildroot?
> They should normally be distro/build-system agnostic.

Yes, I fully agree with you.  We will have a proper firmware repo agnostic to ubuntu starting with our 2023.1 release.

In the meantime, Terry O'Neal implemented this solution as a temporary one for 2022.2, so that we could get off of using my private github.

I am confident that our 2023.1 solution will clean this up.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
