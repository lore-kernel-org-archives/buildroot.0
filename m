Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9424C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 09:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 530E481464;
	Sat, 10 Dec 2022 09:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 530E481464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2hRzm0t8U7p; Sat, 10 Dec 2022 09:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A27081495;
	Sat, 10 Dec 2022 09:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A27081495
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2EF1BF32D
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 09:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF21581495
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 09:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF21581495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEpkjTc0qltX for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 09:55:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C4E8144A
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42C4E8144A
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 09:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSSUyTk19k8+rsWIisSmHCq748Fx9bhiDa+XmGdGCsCJInlXATvnGrJExgTD1fqh+A8EgAketyXIetCzudbXnslyd7+cyAyHE81ZQ+JhqKrX6UmR4GotoCMzizkHXPAapUivvTARBsuyqHrA4jZs0KvrfieYFAuDR39IB7xjFjyzXkJfx053CvrFJsOcfwnyafGzx7tNX0TEqhF3/qxf3BcZOgOmTtBgHkSlx+P0y4CedyeamYHFfn947EDhw5V4I9GOl/6AazLg/xWRBc/bEH0ZimymABTFd0H4vKPF/BsilBHfI5/jrto9rODFrFk0sF7NNJERzWYJymIcoKTCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1npy5hOFa2GWK7g4o3m260lejpBFGsteUjzLoDAC2mw=;
 b=mo4E9/fqm+MCT5d450sOiAThoXUv8AMvc9Q2/dt3JlhmooCajK79ImOhZw+ehCi8N01GuYC+D7LuLi9UILLscSzRd3Kg7IW08IjoaxLZkBXo3UYX4/GFzg/VIpyWSczQgX6bt+u3rJLWH9AKMVG97jx2pCupoVk5XZbP/PL+wDFvhZde6BRyqOi1xCpxzwbJIFBwDzU9L26jsl0piSe6KiegZwbzxX5tTAWch/mhyOoIXmMBMypSsFzwL/X9g/Owh7flcvx9RYo+7zOK2s7am6fP+a5kkcn3UbDOtdcHTsgmyTQbi9O2NGCTnzTUDnJ76qvNJvvSm8YN4x/7cd9O0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Sat, 10 Dec
 2022 09:55:01 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5880.019; Sat, 10 Dec 2022
 09:55:01 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] boot/uboot/uboot.mk: support binary pm_cfg_obj
Thread-Index: AQHZDAYolIx6yte4nUeeBVq6Bchk4K5m3+1A
Date: Sat, 10 Dec 2022 09:55:01 +0000
Message-ID: <CH2PR12MB500455907F9D4CB0D5CFAA90F01F9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221209194043.28673-1-brandon.maier@collins.com>
In-Reply-To: <20221209194043.28673-1-brandon.maier@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB7978:EE_
x-ms-office365-filtering-correlation-id: 43641ed4-745c-4db6-27d9-08dada949b18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b2j2FL8QwaQg9VKPftxPSCpkoOa3wqBuA04pKGd34VzQ/3hr0hjeAnjuqMTrQnqlZVh3B5gvg34N9ArsZEKgU9N84TuidTI0HtBa/LS8kZx+pfO5tCLJxp8NPuQrrebeXWJhKM+ZJ1LgEEiwP7/7TwjMYY7d4Kwb/ElQ6JpnLtniBccHU1X8iyLR+Z80e/emBC9ML9Ur9Wc2WWm20d1NqStlsOLSxrPlZ0Ac+qmFhHo/tGt/ucfGyQ/n+r5wWPbYcJpotE7leCe9tWubsC7nkVre+gd7/XZ89+Jdd7h6rzl9dR4ueuHaL47DhuwRpd2SsAdUDE9jTvUSfm0jJzvwZj2BjVYUdgIIBCxV7/917zuhZBh0OvfykC03Gu/lgD9s4FD6p12nNfAi0RxJbn9PDPUhap77WpxpoaSdpmWVlXSy+jUJhIRJam7fOLS8bYqR8JX7nVuqoc5TEWvofvY5V0+C+JquQdlqvjQRhvXNfvpiSbtU8bpwl4SEkny8O5RvJCFh3QityIm6Jo3juCTqugdbIqJsaQXkDIsGGs63S6dmn/nYXE1db5bwJc2Mu3mYq2tthVpb7noi1HpTKNAugGGWRGwgKsPa18EC7MTY7Ksast8Klx8/fGyy9WEkATX93waBS5jE01vu2ygoSk8rKWZeqsbE0qoJWWZ5MWNHKCcAYK+WuHKqsipsVGw2M3ulJhOXTr1wwE08fo0j224+qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(83380400001)(7696005)(38070700005)(6506007)(71200400001)(478600001)(55016003)(33656002)(86362001)(9686003)(4326008)(122000001)(186003)(38100700002)(52536014)(110136005)(66946007)(8936002)(8676002)(5660300002)(66446008)(41300700001)(64756008)(316002)(66476007)(66556008)(2906002)(54906003)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?53H4E5evgssZBf91JndRjFDwyYkTXDUVX1i6DXWyXilT0MD/eDunn9Q8wtdB?=
 =?us-ascii?Q?e1cQ/rpI/2RZTTT9jHq5xi1tb+jXn3Ni+tmgaBGliJPC9UgNGTSKOwEn1sP8?=
 =?us-ascii?Q?YaPXUQdF1cS2MkbHtfzJcG+y6LoHGyubVF/Oid4AKJq3RLeWuwI2I7/ILOfY?=
 =?us-ascii?Q?VbNYLZtRcYyuJJRXscJq1dWlBXdv7zqTaD3fyJCiDiltmwbHWZ9ucpivcLSQ?=
 =?us-ascii?Q?lryx5qzYA2Zbf/TX8GMf8SqHjjdyiGF1BBU3dzKVjIjRgFO4plkpBq5jDh4N?=
 =?us-ascii?Q?nFJtg3y/hFnMFflzfcEuA0WK8O0hl9lk9jY/tVO8+nsfTt9J6g6jfDx6lI1d?=
 =?us-ascii?Q?T5bJFg4ieC6xK9atpi0FEFNVIQYBODq+u+mE2qNlqCCj9bUaE4KhPZibAgfh?=
 =?us-ascii?Q?+5wa/flM37MeU9cvQaCyGbpq0451HC4QfselrmiLJSFuieePy9TfmS80525x?=
 =?us-ascii?Q?iDBR3YhBX5Ci4giSl0mopdvgk1BPIXNh0CyZw5eWzmE8MKNogPO3+a9L2t5u?=
 =?us-ascii?Q?/sLSfz1rvRQScrKMCu0lSZltS/SRKz90j0HCF9EPxvcgFr0rGp8ikRDkhsz8?=
 =?us-ascii?Q?CHu6BgxbryKW74sQYVebHJtpvG2zN582xxhGFCDDO19Ww1Jx87pmtkipz4pi?=
 =?us-ascii?Q?0NgMiMCxqXK2U5VJANjKZ2Y3L7PfiEAWJ3po1lFZuKqdmrz5sRo3E6Iu4kMp?=
 =?us-ascii?Q?/Gvx78p2TOKLBpJztm5Tyf44k/f7cXlx5Ak47/X0sh0RVo67QOk8D7ew6NWo?=
 =?us-ascii?Q?Hl9TNRA1+nkE59f3kic/+fcFP5fXXI0jXq/2UEI13M0WOdy11LGfvauBPdXo?=
 =?us-ascii?Q?6v6EAQQcT54EVtOaq4BMRwuoNyor1hNLS9qG/UeMFsSPRpJTzak7jedopX2C?=
 =?us-ascii?Q?S4bFJMv1awMYcnYQBPjCG6H9crH1lfl+PitsCyfM3UIOlGNXV3oF1sp33MR9?=
 =?us-ascii?Q?9NldtHTI/1hlY1sPRg9edD78s2W0Mdh5iAOKV7fyrbJEoEbBWVXBRf0TN8cY?=
 =?us-ascii?Q?eVq7Y+JD6Yj78WfL5EJSmHDBAyb+jYiqIhIpVDvmgv5aSgQye09JYC1MN3Vu?=
 =?us-ascii?Q?H4fbWWiPmXV+QRBYy4fei0qk2Fs0RVCDcFJVGc0chluP/L7fsCeebnEvmcCI?=
 =?us-ascii?Q?1dhkZHYxeSMX2RL3F5Y/1oYBhd6H4skg3uCBmPKe8IHofp2vV4MdmUQMBny7?=
 =?us-ascii?Q?8Vg+MQFtjkfpxWgDtgmmOIC3/2/QAbi8IIet8S8eNUxM0CsNEOz74fvybojv?=
 =?us-ascii?Q?dfPKS2HwVLjRCfDH4O2ikXboUpORdal2PcdFDNwX2m0S7jgcEZx7HLxw54rN?=
 =?us-ascii?Q?/HI787tiKZsvTilQ+Mnc7yb4fs1a8lWnjoXKsmKkE15Z296QMa+LjlJUx0Vb?=
 =?us-ascii?Q?0Xa/c4pHcbcPHlHA37cWYJIh7FDV0+PaauKxmOW/7e8lOK/iuYhmjCi6OOS+?=
 =?us-ascii?Q?7sJw1fXDshXYIYADJCP5vSTTUne0NUrFzlZvo3fq1nu/pIj/B9LLVWd3PAZt?=
 =?us-ascii?Q?q8yfcgR1cbJZf7Qm6f7HJ1fmLgclzAeDXjAMfW2FP/SMlD4i2mtnkENb6Iop?=
 =?us-ascii?Q?zs1m1rv9KXcFhp6eNcOiuR6PZlJPr5y3+flEE/9Mm7N4TKAeGpzR0HxqKzV8?=
 =?us-ascii?Q?Wp+Rk4QwVBCHy+yLnQ3JVxo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43641ed4-745c-4db6-27d9-08dada949b18
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2022 09:55:01.8100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i8xFIVyGvuYstqpwO9D5svI+7AmXbQmrYw4A8BIs9sDRdrUImESuvbBgrm+0kOWN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1npy5hOFa2GWK7g4o3m260lejpBFGsteUjzLoDAC2mw=;
 b=b2eBsr2gTMRCsCveO9tItzX/VXdTJzVPj+E/E4QjOd6t+8/vo5hIpFoUM9f04u13BtcDaVRt0yOCp9m5Xd1piLyn3Iao3mw7QJtNONhbk8ECjfXgwY7GRZs+SU4+XpwRySUrs1s8XrHhDDt71GiMfnTFt8l02NxJTMpKSG9MGw0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=b2eBsr2g
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot/uboot.mk: support binary
 pm_cfg_obj
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> BR2_TARGET_UBOOT_ZYNQMP_PM_CFG only works with C files, as it always tries to process them through tools/zynqmp_pm_cfg_obj_convert.py. Rework the logic so if the pm_cfg_obj isn't a C file, it is provided directly to U-Boot.

Good idea to add this support.  It is true that since developers cannot build the pmufw with buildroot, it makes sense that they may also
build the pm_cfg_obj.bin binary outside of buildroot as well.

> +	$(if $(filter %.c,$(UBOOT_ZYNQMP_PM_CFG_PATH)),
> +		$(UBOOT_DIR)/tools/zynqmp_pm_cfg_obj_convert.py $(UBOOT_ZYNQMP_PM_CFG_BASENAME).c $(UBOOT_ZYNQMP_PM_CFG_BASENAME).bin
> +		$(call KCONFIG_SET_OPT,CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE,"$(UBOOT_ZYNQMP_PM_CFG_BASENAME).bin"),
> +		$(call KCONFIG_SET_OPT,CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE,"$(UBOOT_ZYNQMP_PM_CFG_PATH)"))
>  endef

Just a question to the community.  Should we handle the error when a user configures the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to be a file
that is not a c file nor a binary file?  With the above if statement, the file would get fed directly into u-boot and the build process will succeed.
However, the user will get a run-time error at boot time when the spl attempts to load an invalid pmu configuration blob.

In the previous version, when we only accepted c files, the zynqmp_pm_cfg_obj_convert.py would error out causing a build failure if the input
file was not an expected pm_cfg_obj.c file.

So the question is which is better.  If the user configures an invalid file format, should there be a build failure or a run-time boot failure?

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
