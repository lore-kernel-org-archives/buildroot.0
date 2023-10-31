Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE90C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3E12428E5;
	Tue, 31 Oct 2023 12:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3E12428E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lC83DLfngzS6; Tue, 31 Oct 2023 12:12:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD4C4428F1;
	Tue, 31 Oct 2023 12:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD4C4428F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E59C1BF31A
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E57334173F
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E57334173F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DnmE4g4KkhWq for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:12:52 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::605])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 515D541720
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 515D541720
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g27vZcAamPDoVSjPzhWh/XPVBwyfGKMTRad350IkbGswJJWPGVB4N0rynCFD1RAj0RrNESZV+Iep09FDLVqbKHZt/dm70RPkUArJaF5uNMxn/pJEFvG/Qz0AZ4MT8tSM6ImWlv8RNFuynJTVWUaLHfKWZ0f6ynyV5on1hfr/piNwMjjp5cxNI5Oi0M3+PD7D6dDdbXR5HWV3heelX8QzTA8l6T4+wlQmOCAfV9dmPvTsNvI4Rg0Jjre7frNOQF+TCqSROBvDRAoiCi3Ix2kH6ctIVR3uAxFxYIP/R/BlA/kFVvSmgYpMWTMcj8fXcN2rrZ1wTVPUxqd/HFD0CuqRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cF0LiXiO/lL+VIBT+b8Eky7hWY+NSbeUtmOZcUzgAo8=;
 b=FlRzs5rHncfXk4X8oK9Ggl35atuqZhKIPgt8dNxxufvTwHXncvaoWYcr4XfSaI7DO+0t4D71Wubj2EyFFiCLiMAGyhZNnW9G1xBHJzt79VXjHixx9VtDT3XXZpXl7Ho/jqIhIEN7vKNyWR2iKMvqZXFthUsuvYnGMaBAAARE1anepAomvaBQlURRbRVr8qCn4vMlMRQ+x0izrLw0fQT1XiRBNe1yXB5c+uxsPW0MLSGz9wsrjakxGEHudAq7tpiO+92ixFRs0mltBVOedcyTaIlECO9+suNHpaeFSKS10irzPHgPypBSFpBKgSZsTFwFhc1vLGan7DZtbr6SBWStDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB7346.namprd12.prod.outlook.com (2603:10b6:806:299::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 12:12:48 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 12:12:47 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "peter@korsgaard.com"
 <peter@korsgaard.com>
Thread-Topic: [PATCH v2 1/1] configs/zynq_zc702_defconfig: new defconfig
Thread-Index: AQHaAbQ3Mm25p1p3fUKYJaXPsu9PIbBj0tQAgAAE7hA=
Date: Tue, 31 Oct 2023 12:12:47 +0000
Message-ID: <CH2PR12MB50042DEEED0FC5E7D3BBCA99F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231018111357.2898095-1-neal.frager@amd.com>
 <20231031121222.1dfa4035@booty>
In-Reply-To: <20231031121222.1dfa4035@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB7346:EE_
x-ms-office365-filtering-correlation-id: 96a71401-48c2-4136-19d9-08dbda0ab240
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LfsLNn7nyOhCZf8a7nJciygzSDuDJEovlaNESZvKgmwdQXePgHREUhtorpxOTzCtUXvcko8YFE1OlUOj3u4cL9cRGIHK1YXalqTC7tOV4eeOHFgQ5Twfsg0bmdktdCx9beornjQk+DBLRVC7anzaHSxlyLXxmwdd/24nPr1Jn8Pf2o9xzkDnsezUHkeNtScPByNA3AZdDiyH9NOvqq1VP6eLo9A6UM9D0oQYfqSqTY+J3F7qTUguBpZfaSW/QHeA1cCu0sqwdJ+zrOwaGYeNfefVxhYRyL9bGH4m4X9ZyxoLip7B9H2avTUh6+rNC5Ij19AGCKBQHyDEnTP7Atq/rmI6vZ++kUfhFm7ORa9BvU7XCpBxXMntMfdW/tbuBUVlaSBHNci223JIEFW/fENb1m4NAEU/k4JQgBLmWPoyFhpGGvbAyxsQpOhciNkbgt3jfocZUsDCvNU+uZ8w2HdIAXjEZGcVpWIYgDfgSmO6hr3XRCPESvWx541wMrzrrmYTbIE4mtvSqSXMU/EWW8njjrYuOyv8gbgCjYkByjr2r3Puv4pfDVUzQQwk9Ct0hyFtX6D3+2Y99amFxzkKvo1yVMPdcUFye9k5Nrx5hg20AX/9S32fxLFAvH+YjsV4FDxxM9y2AmUwdfRErzMsRrZ4QQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(9686003)(478600001)(71200400001)(7696005)(6506007)(83380400001)(5660300002)(66476007)(76116006)(110136005)(41300700001)(4326008)(966005)(66946007)(8676002)(8936002)(54906003)(64756008)(316002)(66446008)(66556008)(38070700009)(38100700002)(33656002)(86362001)(122000001)(52536014)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Oj5wxdQ//dIacybewaAnvUph+G/zqBB7cL6yOVYG619zUuipEeKr6MlfRDBl?=
 =?us-ascii?Q?zZKZCB/cpSoncQ0obTavCwMhyLrSoUqcppJ1k0I5MeNJoOHfQxhDAQw4ZzTB?=
 =?us-ascii?Q?vgTclWouViOiQDMIesxOqii8H6cjevFal6/q3oL48aWhceUGzo0MkHRjL2Lx?=
 =?us-ascii?Q?zV4n3U8aNs/AGYVf2vgmsoTTN+LC3CtfO7qWe62pGca2zRr/mjS1S2t42sF7?=
 =?us-ascii?Q?1Q3GXWjQoOMELdUeDcGPJwg9BE8A2wAe+vk69dqVBHBLLL/Szedh+m5jJPL8?=
 =?us-ascii?Q?Xo0mYweOaixikLqDjy9cIpPN30AvRRFj4Yod7nJli9JPqYZ2AJsq1lnUw8Cy?=
 =?us-ascii?Q?idxsno+3atpcUH40ajlXPIzdXWLJUag1z3jfUqQV2oWZ6pgfJZ4B2pezXUC4?=
 =?us-ascii?Q?lrBRFSlH/xSYXswGiHdeeBUEW9CsP5WIW9iA+vqW1akIm3+KBISFuYYsrcao?=
 =?us-ascii?Q?/VyTgYviOmfIeh9wYOF8CviPrYLGAyavYu+XoF05fdr9Ci6rDqnL54nwQ4Zb?=
 =?us-ascii?Q?17lu3QPr4JVX9fPcHAQ73Oqlg6PLhCHluR3AWKuyGRBgFx3YvNyCievmPg1D?=
 =?us-ascii?Q?1LOkXI/y34tSpxmSUi2EWyEGjSRfL6F83MtrvBh6UfRc5jD7ZRQdESlcl69V?=
 =?us-ascii?Q?CJe+9Xo/MbLLs3tNC2dFEin3IakGJU9l8jOqsdEnT7mo3jJ1avQlvvKPXphV?=
 =?us-ascii?Q?rDkh8Lotc9m6jqmrj/tO/8ig2fNMZLgMmK4jEIyLrNBq7s+6Jx9i9E6SKR6m?=
 =?us-ascii?Q?I4ld019AvRiO3Se78IKF9CiNFIOor/ea0zxGkLWnIvNXdGfSexdF+qJXeJfP?=
 =?us-ascii?Q?s51g5gUwFIyJQ5iSPaI1bqILl8q4JCBzKPvv5Qx7JIS2GDoO8smvtyW3C0HL?=
 =?us-ascii?Q?gTMozT8doFqn0xEXxhhmfBATnQcOxkZwUzSppziLg4KEQGCyPWGelieeDu2v?=
 =?us-ascii?Q?VxwoJvLudE5D7KAkcsD559obvDbvOFQkMShw9dms1gkoCLYWwTY0kyMbdF4W?=
 =?us-ascii?Q?Cgrs3C3QHJDYjqz2RlQktS+dO3GnVtdwJIzn0KCbbQhBdrCXahDh+YXiFTDt?=
 =?us-ascii?Q?h/BKRhwTNwOSFCg/00ECJJyJ6Lf4CqQ3Wde+/0uLUyeTutbO/j6k2eBnmwar?=
 =?us-ascii?Q?22HHHIC06jZJEieZAJhHhorEmrpDULTmUXqB+gXAVZsXSM7VJSNoWCOggijo?=
 =?us-ascii?Q?+E6UDFAOIFxphxssFuiw9hKbSGi/33yng0hvyYyKq1dxTfHDHXjcF3AgGTr7?=
 =?us-ascii?Q?bb9QNQnX+gL/X1LT8ySRlw5aoy1sgWI8B8V3FlO9yp6lsP5ovrOsqWnTrOly?=
 =?us-ascii?Q?B5Gj7RdNXdFwKSoXlN6sGKWrQzBdvgMeCKbdNNLMMqB5FhP8BZDUh/27BrDw?=
 =?us-ascii?Q?DBZ2bKYG1IjT9LomblUsJF97yf2HDHcXxkWxvp7BJ8iJ+ritlbM0J+VDspVZ?=
 =?us-ascii?Q?YB1g47ig7b0sm1MC1OMoDMqVO55KvEofWskSJwI70knVsHjsMQpSsT9ho+WB?=
 =?us-ascii?Q?Qt9UnEWZsrFX8+RLgd6ngz7q1UC0v7soAXSKK2VJzmn78CXZ7+EqzgzJfaAe?=
 =?us-ascii?Q?GB20F6yli7YVwlU8q1MWzse7e3pF5FaHDa0nQ+2AF8HyJxA3QQi4RbnCkMUl?=
 =?us-ascii?Q?+IEgLJ+uauhXh+LRxlG0lNA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a71401-48c2-4136-19d9-08dbda0ab240
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 12:12:47.7932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kllgZzN3hmcF7AafJkbRExz8iUZT62lM56paEUJq57NQQAYn17cqMYwcdRe4OIFu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7346
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cF0LiXiO/lL+VIBT+b8Eky7hWY+NSbeUtmOZcUzgAo8=;
 b=OmBKSOoGIV2+a5nMsLLEQx/IANThRN9Ge7hGhgiktFpBhGwi7Al6bv4FV1+N4iG6QJjy2eXSE7xulAbqgAVTj/EBId2K6SAYes1RwlfBTpmAPEsZN0YsdX40HgQ9KjAcqvTRl166upzEQ/5WbH/8ff8LZYYmo3MIQX7HaKfV64Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OmBKSOoG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynq_zc702_defconfig: new
 defconfig
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch adds support for Xilinx Zynq ZC702 starter kit.
> 
> ZC702 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/ek-z7-zc702-g.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> This patch looks very clean, however I have a question. The zc702 config you are adding is identical to the existing one for the zc706 except for the device tree:

> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc706"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc702"
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc706"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc702"

> However, exactly because it is so similar, I am not sure about the usefulness of having a large number of (from the build system
> perspective) very similar configurations, where a user can simply 'sed s/zc706/zc702/' to work on a different board.

> I'm wondering whether we could have a unique defconfig that builds artifacts able to boot on both boards. This probably build down to whether the hardware components involved in the boot process are similar enough to allow U-Boot to boot with the same embedded device tree for both boards. At a quick glance the two dts files appear very similar.

I do understand your point.  From this perspective, we can say the same thing about the zynq_zed_defconfig and the zynq_microzed_defconfig as well.  For all 4 of these zynq boards, the DTS definition is all that changes from one defconfig to another.  And in all 4 cases, the only differences in the dts files are things like gpio LEDs, switches and whether or not there is a CAN peripheral on board.  So you could potentially boot the same images across these boards.  You would just lose a peripheral or two that is included in one dts file but not another.

My reasoning for creating the zynq_zc702_defconfig is the same as with the zynqmp_kr260_defconfig.  I would like for buildroot to be a clear alternative to yocto.  This is my primary motivation as an AMD employee.  At the moment, if a new user wants to run a yocto or petalinux build for any AMD Xilinx evaluation board, they simply need to use that board's configuration as all of them are included with the meta-xilinx releases.

I get that knowledgeable buildroot users can simply 'sed s/zc706/zc702/' to work on a different board.  But what about the new user who does not know that changing the dts is all that needs to be done?  It may be hard to believe, but I have received questions about certain boards like the zc702 or the zcu104 which do not have an explicit buildroot defconfig, and some users interpret that to mean the board is not supported.  But in reality, you and I both know that it takes very little to support another zynq or zynqmp evaluation board now that all the board support is already included in buildroot.  The new user does not know this.

Even internally at AMD, some people think buildroot does not have support for our products.  @Peter can vouch for this as he has personally been involved in getting AMD technical support, and received the feedback that we need to duplicate the problem using the "petalinux flow" even though buildroot and petalinux use the exact same u-boot and Linux release tags.

If we compare buildroot with yocto/petalinux, we can see how many boards are supported "out of the box" by yocto/petalinux without having a buildroot defconfig.  Below is a nice github containing all of the yocto/petalinux pre-built binaries.

https://github.com/Xilinx/soc-prebuilt-firmware/tree/xlnx_rel_v2023.2

You can see that buildroot only includes the following defconfigs:
zynq: 1 out 2 defconfigs
zynqmp: 2 out of 5 defconfigs
kria: 1 out of 3 defconfigs
versal: 1 out of 5 defconfigs

In many cases, I think this can be a blocker for many new users when deciding to go the buildroot or yocto path.

If having too many defconfigs is an issue for buildroot, I would propose we drop support of some boards like the zynq_qmtech board, and include more of the boards that are still actively supported.

Would the community be ok with the following list of AMD defconfigs being included in buildroot?  I believe the following list includes the most popular boards on our side.  I know 10 defconfigs is a lot, but I have no problem with maintaining them, and it would definitely give buildroot the appearance of being an officially supported platform for new users.  Half of these defconfigs are already included in buildroot.

zynq_zc702
zynq_zc706
zynqmp_zcu102
zynqmp_zcu104
zynqmp_zcu106
kria_kd240
kria_kr260
kria_kv260
versal_vck190
versal_vmk180

What do you think?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
