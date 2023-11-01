Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8F8C4167D
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 13:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F4984855;
	Wed,  1 Nov 2023 13:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86F4984855
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DWgtAILv4UY; Wed,  1 Nov 2023 13:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FAB84AE7;
	Wed,  1 Nov 2023 13:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37FAB84AE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59A721BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 13:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 169BD6FBFA
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 13:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 169BD6FBFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqRtZa9HIUrt for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 13:23:21 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::620])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 409446FCDD
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 13:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 409446FCDD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yf6W0lBqXr97AjaOxOl1zcQ9NEawh5Oc4DHCcismbhnt4HV41tvxcVY2TE5SMpaGZQ7aWHSeLthDtXTciVLlTeSQ1tYcJG1DF60vMyGv1N6QWVJBR/UpEBpv/RG5yb7/tLZf5eytKLpNU22lIOE2b6MeHEHRYNiVbCf80ZaVW2YiQSH/chPJP0k7NlyW2Wxgl7vaseh+YuVJSre6QrR8s0CWONUcDJy8CPILoveA9m5YZYavMKabcF+Lruk86DxAMRkWBLe8h/2I/nulr5AmNIT4oecYTc+tgLE0GcZsu5C92t3a3AsN1uUcMdtwLfP5esy5EFYCFRJgMlvUkJXCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xmj/K89VqPfgJBVQDBSYu4+CMfsrg5LiSgZFffTyCk=;
 b=i5TFsV9wCQNGfGRNAOjIALu6w0B384yv1jx8hD6Rcyc+wNpV6cgmszUqY7ujQ3JLBdqjsWvmahUlAgymFFXWDZDGvHUejj/Mg2WjWdmOZ9RNINB5RdKQew2Cj3x4ifyPcL+42FyJppxV8vi+K3WAAtWxpXvbOBX1jKJ5T8h3cTXQmvdj5BHJK7/BpWSZZ/BNDQgot6yE2Gu+rE9fefmXjPO0XiY+TPFtdYLkQJEBT4gR0ZJNnKCFSRoG5DNEGI2DTZf9w/yb2qWARoHGziRrXLtCJThIVIj/Eiefh53ktEW1SNxxeNkMqYlcJUlv91IAVGzBS/pQNhe0TdyTwzBzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB5952.namprd12.prod.outlook.com (2603:10b6:510:1db::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Wed, 1 Nov
 2023 13:23:12 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6933.032; Wed, 1 Nov 2023
 13:23:12 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
Thread-Index: AQHaA0qXU55l7C7pwkan+EbiGTH5Q7Bj6Q6AgAGBHmCAAAKNAIAAGPkw
Date: Wed, 1 Nov 2023 13:23:12 +0000
Message-ID: <CH2PR12MB50049049609F6BE2EF07D89FF0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
 <20231031134317.4ce2349e@windsurf>
 <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101125048.01553f76@windsurf>
In-Reply-To: <20231101125048.01553f76@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB5952:EE_
x-ms-office365-filtering-correlation-id: c858ad84-8cfc-447a-97f9-08dbdaddb2f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WqR5e8ORoMH0fX1BOcg7JK7Re5pIXEQ+0e+1/0oTMCEK6uCo6JfyJoJXXvhnb2U7DILLSmVUqMPTlxCs3XilyQt3dqkn3IfDZmYaBFWNoiqSoc9n9hFB4IT7fMNLzXKTZXA61/9qAWrwdzW2S9Is63MyMVh4eQ09vu2K4TmaPZSO3Yu0DBzIE/6cW4A3+MO0FtMhiSrbi5+72keCN1kOx2CvxtjMhF5Mt5PW73GqtTArdyTszvYVYCn1Tii1giXJfynMjN4z9/HAKBZMfo0mG2ZEKmbZKJtQHnnSFsYnluCbsco8A+z6s19TzcXqR5KPdhFJaetTS22MxvSC56ANE2BfhtAOsYBk1ENRnpFgsIMPhZA1KbvoUR8/95C+xhhTO/+ZfTbII6J9VySPHp6q+z2o8QNdYXQTW65V0ZY21e4nwLzgvjm0Pdn/QmEz8UudI2yTWApGPh6g4X9doP6oQEVqnGDZtYfjUu+lY+n9Z/JnQSRAzYpIRi0SAwHmzwUGMLDCAL/Zpo9LT40L82+9EH4kQGfLBZr2FEmYERksZoqhG/skFVHseNVAnAStpgUT65n7UWpzqK9sBpp8preRBsqgPsb2mVhxYKb0rrUn3gCYStQEi3v86AqyMLyb+fON
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38070700009)(122000001)(38100700002)(26005)(9686003)(83380400001)(2906002)(86362001)(478600001)(6506007)(55016003)(7696005)(71200400001)(6916009)(66946007)(66476007)(76116006)(66446008)(54906003)(66556008)(64756008)(4326008)(316002)(8936002)(8676002)(52536014)(66899024)(41300700001)(5660300002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?99Q9XDHqn5R/uK9LT5KmO5+TvHbywv7+zDmOwck8UUpsTTSnRpEjbiBtBuAo?=
 =?us-ascii?Q?5blS32hI8ew02UIhxj5f780Kz/6fUMzKF0ZowBxLc9lFbCgymi9o1GC9Mul4?=
 =?us-ascii?Q?upu999BLL5cvVyUnuVBH4f2zGBoDMd3ScjzLCxfSNnRjFX3FAwUreBxYhKZS?=
 =?us-ascii?Q?/Y9NjBNM2QyqDBoD5W+VNEHrpYoIZewTJxOmPu3XJZMAtIwbsk03X0Md+66g?=
 =?us-ascii?Q?0eYFJOqR2hZBgCB9jfj9ARinHfWrtNllkKPQfM7VqJZ+YBF8IHJMmD6u00u5?=
 =?us-ascii?Q?0sdj4D1zgo3RpEUt/HCmVIDI9CYh1smiDr+iW8DLisj5tDEtxOZZrmBtP5jD?=
 =?us-ascii?Q?P3h53rusKCvAlZkK/zaavyZopHBb+WKypemsNEdTbtjMU2IKV5DUm9YzdacI?=
 =?us-ascii?Q?X9jF50RwMbFoC44d14WXgtjB7kKifrOw6GhJ5mTrc1fsEbLh+VAnPlnAUhVS?=
 =?us-ascii?Q?I/XG2Re37GIwIPO87tCC4TbM0EtaCeVGAv2TBV9MtBif41YILoqKU3m6QESU?=
 =?us-ascii?Q?DvGqzcSSdLkNkuXCy+Ww8u9H/TsOBk58/+Sy7olqPjQYawmHwOnvdWhocatU?=
 =?us-ascii?Q?MjQ+SHvv85+3TKDX0an1a5l+Q5p0rrVbkrfhu3Lug+s8NLz2ZwKHq0ecLXRB?=
 =?us-ascii?Q?CBNkwy+yMPJIt7gWeqQolXmvKmFkWx23OW6ljtCKoAz+ke2NAvY7gw44trxi?=
 =?us-ascii?Q?sTqW+5T7sKT/HE0tMfAtUleyMEah64c9ktzkaJvBJw/mgd2oDSqMyH4a8/3a?=
 =?us-ascii?Q?AbJ6iK1C8w40/lbe1WJadDJacgP+zf74XfdxgAz4hadbg0KwMvVGUqm60BLh?=
 =?us-ascii?Q?2lQFtvnGPnArvBi7URCSr5HhsDvNctApbIJeoH6ZVIncH9Rtix14E15vK4D7?=
 =?us-ascii?Q?+kYSZQoKAjH0aj+1qRcWeEG4SKi5QoiyX56QigmZWQfGVX84cPHRog0suELE?=
 =?us-ascii?Q?a2D1Sfh1Al/pVW+U5o9TYcKzr/TmmHMCLfmi2vatNgMHJEBfYoHedqPuDls4?=
 =?us-ascii?Q?7gVv5/PTTimNIapJXG3fV5YC4LFyEmYd0GGx/NpEj+0WMIZkMxMp/TeVsn/m?=
 =?us-ascii?Q?dHbfDl23svoB5MGh7jMkD/wihQkNbVumW01OS4MUKJzY1kdgPiII0xFSQ8ZN?=
 =?us-ascii?Q?AqqgT9CwdB6cyf2xj4aTKQKH/Em/+HRAd9u5sbDKM8cpfxPx1Vh/T8rgF+n6?=
 =?us-ascii?Q?PvxVYtOUaHDekvI7w+znaNOc+r7P9zXh8c7Lh63t+yOjCMAy7eibKV/DZJvb?=
 =?us-ascii?Q?u2tuEYX27rAZx/v+Tdj984tLTdidSyOmTc0tCL9W7kbbricqk9R75o0h0ITQ?=
 =?us-ascii?Q?1z7v+g2Tnf+W3jF/5AvujHBSjYKrJGvcvolYgXEWvBiZAcktbnFswZwztsp2?=
 =?us-ascii?Q?1QyC39qpRQP92ieubo+z6Jcs2rOAwSrOsGJpEvinfJ3Q97iVvYxRluEve//7?=
 =?us-ascii?Q?vZD+mtZIH3H/7txw6+NwMG/apuiQFQEuUNa2SbLsaLfDprtaAYAumErdfCZy?=
 =?us-ascii?Q?CmMoYHaipVtUhDnf2Ds0WmBRLQDHeqbm9C0I8D/5+9a32/euNrq6zSob4C81?=
 =?us-ascii?Q?OYOFdlBg4FpHcOBgHDE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c858ad84-8cfc-447a-97f9-08dbdaddb2f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 13:23:12.7869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5cp1Ov1sfQ6XraT0GzLMa5f4aadb0IGfBqSPzcsMLS5wT5YFdxdhroN4vSd9tsgg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5952
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xmj/K89VqPfgJBVQDBSYu4+CMfsrg5LiSgZFffTyCk=;
 b=QZGhVkF3q6Oq+hUhnLHRNjCXq0irRBe073wQvbuZwX+m4XXPeySWYe+PYlw6lUyw6qJFghc5TYZrsaPzealtUiMK7CFzl23ydlmE6FOtAie3FmUfUm1jpOG5zjLPrzM1Ii1v5Y9FJ5JkUDrlJeVQCtA6ZgtWbO+bJg6TFdwQaEU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QZGhVkF3
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> Are you sure that the Config.in files can be dropped?  
> 
> When I drop them, I am stuck with the following build error:
> Makefile:576: *** newlib-bare-metal is in the dependency chain of toolchain-bare-metal-buildroot that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> How can we deal with this without selecting the packages and having Config.in files?

> Ah, yes, I asked to change the newlib-bare-metal package to be a target package. In this case indeed you do need a Config.in file. However, its option doesn't have to be visible, it should simply be selected by the toolchain-bare-metal-buildroot package.

> config BR2_PACKAGE_NEWLIB_BARE_METAL
> 	bool

Unfortunately, by making newlib a target package instead of host, the buildroot
infrastructure does not seem to like that newlib was built for Xilinx MicroBlaze
and not the expected AArch64 target architecture.

Below is an example of the error message:
ERROR: architecture for "/usr/microblazeel-xilinx-elf/lib/libc.a" is "Xilinx MicroBlaze", should be "AArch64"

Is there a way around this, or do we need to keep newlib-bare-metal as a "host" package
to avoid this issue?z

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
