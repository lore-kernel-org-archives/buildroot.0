Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436DBC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 07:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D783760E03;
	Fri, 12 Jan 2024 07:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D783760E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0UrnfC-lbzE; Fri, 12 Jan 2024 07:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AD1C60DF9;
	Fri, 12 Jan 2024 07:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AD1C60DF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D758C1BF331
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 07:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A1FE402E5
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 07:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A1FE402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siKtUPPn0jn0 for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 07:21:06 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 060D440386
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 07:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 060D440386
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwicTAzBf0OpdkCFZErMXfc0ZsUKg2Tuz8YYvieR7Qr5sLKuEu2Ad7kfdikIXqV1ntEsJYvzbIhZ6yUVRmYceNu0lTGJEQPQzMj0EONupOgDCENHgbh123F9ns2MVhWlfUaptlWR8nFMg/BM7Z/LazYkS5uUAAyC7P8WhH+neZIgMYSH33ScqiHQniGO1vdYGbK3QoncyGmMRaEY+OcY05hBxuYPLNZ7M/DQZJ8ucNK3MfgLLOopZ+MioZybl+1WvG4Knv9Q8PqCcrYCPnVJoxXPOZPx2+35Wh17THsb1cUv/Y22V8ALei9kMNn8zn5Ygo4hBNH0lT2ft+dXaILY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyS6Uo6cMmYCOnIiSSPpF+EwOnavKZpzqHPPdqPdvwo=;
 b=Jdc70T3WCRrVayo5u8OJxTFiaGj+BUChsj7wVAkdHj6EDtHThQVagupgjJoEisCUW7HXVKrKD3caIy05AHrgh4NecKB8/rkbNEJvFq7nwUJBWQQ3Bou70K9h5s85afpRl4cIWzQGdK23H3l418JOwfnrjKe+UI1n5WyIAyEGcB51pnVUzNtxBnFycTxeU/NLFsJaoh5TbL5FNGm5DsbCdt6LLo4dWRLxIT2qWWU3gAKxMdNbShAUkk+qxEpcUzJnaYpNo4M0V8JVJ9z7u+LzM70DsCURZlEur6tCNJD3svPSnKd2mwz34GSWgBUDjskQbQfcpo8mmGo4Jt/PkE/a3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH0PR12MB7791.namprd12.prod.outlook.com (2603:10b6:510:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 07:20:58 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::54d5:15f4:b050:6297]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::54d5:15f4:b050:6297%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 07:20:57 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
Thread-Index: AQHaJoRsxU6mz5uOtESx1TgKL/L3BLCn2nkAgC4jvmA=
Date: Fri, 12 Jan 2024 07:20:57 +0000
Message-ID: <CH2PR12MB500426F03632B4848F102FD2F06F2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
In-Reply-To: <20231213232854.5242117f@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH0PR12MB7791:EE_
x-ms-office365-filtering-correlation-id: 38884428-f40f-462c-7cbb-08dc133f0593
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tFuXoTXq46k+j3vCMxI+vtghbGBw5jJFkWdZFtqJENki+av5/zHxPfK7n+pm7A3qcw9WMIMo9RcLhEszHGy59b4w7nkAnMAgtqUzit93h6DGCPLqxiddf1ySE/fmmMb209xwbhbNDJl5TFXQSCDM/WnAMcpejp4aS0MJy7sZvQnbAlNNZ65Iy73aNtrYtC3lXPOKu2YuImuHZfuKuAOi/PG6+OUo37RvKAtFLZmYkIb2umHD2UJFNKzy6T78jzb36oB03Cc6Q2RIQ+QSLTCE4P85qRouz0tQOcPrk8O64zfil3FMfZdZd5YpqHJ3SGG2/e25OElNmlEkj9jo222RnOV0vYLopJLjKbQQ+rwxcPlXbJYc4wy5u4z55bJENYOzqsbA6JdFeK1T94CRrB+UJWONjbDo2NsKMH6EncyYzXWcBAk6JBKwSl2KNTm8RotVZX7UqhOTr3BN4srBXAWAc6SapBYhgVdYvQKux3Gsy1a1TtVezNuyxsQO7cxegOSK4W9zES8OfUWapMvOqdWkT4+FNzjDVR/G6pvcGbwg/xyjScjTGto7nONLbvLG5fsezWstF6/JvmNbwqEk20z11IrLISDZT03TRWN9xMXkzn+4FxuwPr2wU+IPOJLhaoi9E5ssYH8JnVoInSGMpdcqPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(38100700002)(122000001)(2906002)(8676002)(41300700001)(52536014)(54906003)(316002)(8936002)(5660300002)(71200400001)(966005)(4326008)(6916009)(38070700009)(66556008)(76116006)(478600001)(66446008)(66476007)(33656002)(6506007)(7696005)(64756008)(66946007)(86362001)(9686003)(55016003)(66899024);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+P3KBkYkIM9PFMpAN8+D0SmPmjT9LlFRXUf55rwkcgWLX9QZoE7woCcPJ2j8?=
 =?us-ascii?Q?iF7jhenhPD0GCA1k3MnsewgC5kYg7zFE8VAb3C1ASQQE9DZjUxYi9Z1Vg8w4?=
 =?us-ascii?Q?BoVrqdAbgHyimwzxwmvW8jwysyK1z+uGacDxJzaNMS5a5RrSUOgxE8c2x9Cq?=
 =?us-ascii?Q?mt49wQ+IP2769dueDwx/3VbTG/HtsaJKl4ze7M/OZA+/+kwT7UKB1eVxafas?=
 =?us-ascii?Q?f4YX1UFGKYrHw48hX9TDSl8m/e2p4EEpJ84eWSHR0moTTk0gygCOD3OzAdZG?=
 =?us-ascii?Q?FsAqljFmkWcuNp8JuTKKIGp91zUbHfFNqapoZgy83ISJCJtcuNXmpnfSmGkv?=
 =?us-ascii?Q?AoFMMwFbL2kdcZrWCRunr3/I9+B6GQ967Xj7pBqDP0PfMIC5yFVlXHynATSV?=
 =?us-ascii?Q?jvWhzvP/DFddlomGbO1k4aARzmPO7W6qihT5OKjYFjfbmmjKf2S28K/faSL6?=
 =?us-ascii?Q?hXkUcB289eOSUc65UvUDrjU3zARhX9K1zfJ00wtr/iG/4tcHGdh06oR+cnjV?=
 =?us-ascii?Q?yydsLOjzJV4x/1iOQo9erQ/6iFNC7Dv5JAeNhgdgg/kbQe9AAfxhE0MGZ+T9?=
 =?us-ascii?Q?+Lx7Sn3328Tx41JOhBXBUhhrzo4h8CY9CnUfMAO+z79HtrYKzWtm1w2EnzCf?=
 =?us-ascii?Q?deKI+RYXALpYmJfnYR3m0yorW4Z+vMoOoUUmFCPqpIQAxx2Gc3FuAoOUs7jS?=
 =?us-ascii?Q?xEOkTCrWIVsTqFptq+zrJfbSgaO4UXwUVKfmSQHrQcZh/KNeCJKVrbgnO7b3?=
 =?us-ascii?Q?XaqK12K8YD7dSNDFVBLcFv/zUDQ9/QNb4oFtSSqULvYz/50EXDPHm5YAn65T?=
 =?us-ascii?Q?lQ/QtP6qRNp9JrBLTd1ZZ0Mk0Lpmk1tIt7s5dcYzRPdPHv2zyBouAcURfYQQ?=
 =?us-ascii?Q?Ym6eAVyq7LvCrt4bq7JxW/EooQGGfcLwcWz60d+VcU4dSHx65tV6LBscqyxc?=
 =?us-ascii?Q?OFsxA9QF2NSaStXpTgzQ71inWcktPdNhlABWLh8NzuYzIA/0Xf5tLLdlFUZk?=
 =?us-ascii?Q?IBTNb90FK6jCie0nbKUTtq/4V12jmaqh2lE7elcfbhYdoE0GAuKbDU1aEIzX?=
 =?us-ascii?Q?7IuoYYbm7e5TPvv6UM47EwebYRypESl/47kPnCpzLO0s5QEvnBk06tYqnnAj?=
 =?us-ascii?Q?cOxn8qN6fvWoOrEcTHuUd37VLH/fGcaAyExe4mBTpL6rAu8Kp4B68tZg7fE/?=
 =?us-ascii?Q?pYn5IibsNKph9YiUb0STmQfzjub4FbqTyEw1K2OKM3ljPyrmyo5f1WfqmlOw?=
 =?us-ascii?Q?0sUBsNjwiEdSPSusvjv3MW+N7P1vJngkMdz4Nmzk9+USeKFRUCgqVkN0jSq1?=
 =?us-ascii?Q?VpbqLKnBcZt7rmsUi4cC7sV/FxNfxy9nnAW4eUQrWjEv7KgcHyu7Kgm6VgGW?=
 =?us-ascii?Q?+XtNVAqmLbx6D5zM5vRdPpVlMmm2H/ZXeEb3g+KjkAK3keKFoqX87viKeO6V?=
 =?us-ascii?Q?9fVTDdt0Igt1fn1UaBehUqAD2R/Wp7RdYObrk5J4tDILUDzrdc6GnmFFH470?=
 =?us-ascii?Q?qvwEfhI2JBtHUE1/FEjL5vR2ahdTZzRgavqSeOsPqRwBl2WUeiHfmGJv53uG?=
 =?us-ascii?Q?x3ggUgPH+887yh0Vy98h+ujcpXBikYOWS0xAqUA/jB8j6CP9r8u6t4j2zyK6?=
 =?us-ascii?Q?VDaXCvSt0ifjjqDXM7Iz5V4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38884428-f40f-462c-7cbb-08dc133f0593
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 07:20:57.7168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+zS5ooTKteWNzOLdyVDv2sZUvEFaTC0At2n6HT7m0A4ZMldo9apnAkyqU8OjupQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7791
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyS6Uo6cMmYCOnIiSSPpF+EwOnavKZpzqHPPdqPdvwo=;
 b=is1JI/7SER8JSuykA055UjKcp0C1honviKxsJ9VnKkwfR05n9Ok6qGIC58wDIA2b7icfJOmKL7dyFm1390HoiqsXEdKZF6U4U+2ONxMDiWXaJNfD/h2VKEQqtnL0swxOUBFLxaxDNX7H9dhmScgIhGw7agBG+j0Wh6h+rWzR9XE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=is1JI/7S
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
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

> This patch adds a new package for building binutils for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration will be a
> Xilinx microblaze little endian architecture, so that buildroot will be able
> to build the microblaze firmware applications for zynqmp and versal.

> Thanks for sending this new iteration. I finally took some time to look
> into it, as I wanted to merge patches 1 to 4 today. I did some good
> progress in fixing a number of issues, and my current progress can be
> seen at:

>    https://github.com/tpetazzoni/buildroot/tree/bare-metal

> Do you think you could rebase your changes on top of this, and see if
> it all works fine? I of course encourage you to review the modified
> commits, to spot what I fixed/changed. If you agree with my changes,
> and they work for you, I think the changes in my branch are ready to be
> merged, so I will be happy to apply them.

I have gone ahead and verified that your version of the patch set
works as expected.  I can build all of the zynqmp and versal microblaze
images without making any changes to patches 5, 6, 8 and 10 of my
latest version.

The only update required is adding the following define to the
defconfig files in patches 7 and 9:
BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"

> One thing that still bothers me is:

> +define NEWLIB_BARE_METAL_FIXUP
> +mv $(HOST_GCC_BARE_METAL_SYSROOT)/usr/$(NEWLIB_BARE_METAL_ARCH)/include \
> +	$(HOST_GCC_BARE_METAL_SYSROOT)/usr/include
> +mv $(HOST_GCC_BARE_METAL_SYSROOT)/usr/$(NEWLIB_BARE_METAL_ARCH)/lib \
> +	$(HOST_GCC_BARE_METAL_SYSROOT)/usr/lib
> +endef
> +
> +NEWLIB_BARE_METAL_POST_INSTALL_STAGING_HOOKS += NEWLIB_BARE_METAL_FIXUP

> But I was able to find that it's due to:

> tooldir='${exec_prefix}'/${target_noncanonical}

> in newlib's configure.ac script.

> And interestingly, this issue had already been spotted in an earlier
> (2015) attempt at bringing newlib support in Buildroot:

> https://lore.kernel.org/buildroot/1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com/#Z31newlib-0001-configure-tooldir-path.patch

> I'm not yet decided on what is the most appropriate: your hook that
> moves things around after installation, or patching the configure.ac
> script to get things at the right place from the start.

As you know, I do not really like the fixup either.  This is
why I am working on upstreaming a patch to newlib
which will make the tooldir path configurable.

The problem is newlib requires autoconf 2.69 and
buildroot uses autoconf 2.71.  So the patch I am
upstreaming for the configure.ac file will not work
with buildroot because the autoreconf will fail.

At the moment, I see two ways of dealing with this:

1. Keep the fixup until we can bump to a newlib version that
has a configurable tooldir.

2. Apply a patch to the output configure file matching what
the upstream patch does, but allowing us to skip the autoreconf
step.

I have created the following pull request for your review:
https://github.com/tpetazzoni/buildroot/pull/3

I am ok with using either option.  And if you have a third idea
regarding how we can deal with this, let me know.

Thanks again for your thorough review and assistance!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
