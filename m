Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F562C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 09:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEA3D60A80;
	Mon,  7 Feb 2022 09:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CX-W8Ntq581v; Mon,  7 Feb 2022 09:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A6B1605AD;
	Mon,  7 Feb 2022 09:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 441EC1BF389
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 09:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F49981319
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 09:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CN92tVj4yLe for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 09:35:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D84C81303
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 09:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEsvGaCuDMHG/DMM32Q1ouZweIgdYxLy/nR9zYFg3e+oH3cG0jku92MUcHOcuMDMWsdrxmjPjvUASqg7asqYyQ315Wr8+mNaa2pjxt0uI2zCjPD7wWOngrVYobruLNx7xr3U2gWdnAWqx5C3fuPlRfb41AEd/8BumN1QFH/bKVCgXkMCVLrsflTyTG9SkVmXSHTIfSk/zWhOZX/37O5Jariay1iFL/DHDyBIrqCmUENVgsE6v+Yt8IuFq06SKUwVWoKAHiKzJE2+zJh+L3FiQeMMpcOUhOiv5sQjR+z3nzP/VT8pF1KicgfkXItKl1oFj+qliJ+IA/7A03eHwg9vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y3VVuRjDOmK/iKeNHaL/cS5X3kT+gbtYpfnSsa5ew0=;
 b=J4+mXgdd4cd/mGQ9enUBS/MP5QNu1LsuE2UW1NdtDGgTVva0+hpINXLW5Qv5IZE4mmsxfyPwK0ckxEzxRfIZnY+Pj1cm5LUwTVOekFYnJ7r7ke3k4cVxf75keFywuoJJAs5GHXH/DPYK4FdbwatNRM5UnuVBEEORzuxE85fAnXripRGhmfhVmru26MG5CX/mOGxjeetccWadhH5iJ7s7vNGSJfM0iYB797GeLVofjHtVYo4RMphpsDt05zlrlqdMBebVGlqxxenFehfo0SW7XloQhykiNj9+s3TSDEnUlHsY4qx0D3XkOJUkFuS5qQ8wCuDlDNIZMgNXtN9hMuwyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y3VVuRjDOmK/iKeNHaL/cS5X3kT+gbtYpfnSsa5ew0=;
 b=sCyDOw0L7zUtrkU4e3NDwuNpVfvfV2JyNdaTfNW5dgjXQqiW+8q6HL1uMddTORBK+RsdmIpHvhs1T5kIW9dZhAGL50rXQwz5W6mAEsJSdG/4lMKNidt29LKfOMoL9uqB+7HfiDSQtyJ1o7tQCqHhbdFaWAO30TKUA6jwtldPilg=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 09:35:12 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 09:35:11 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "luca@lucaceresoli.net" <luca@lucaceresoli.net>
Thread-Topic: Xilinx zynqmp_zcu10x_defconfigs: two things left
Thread-Index: AdgbjfGkWVHh+j9fQheB50HkAzQTuQAGb/sAABeQTPA=
Date: Mon, 7 Feb 2022 09:35:11 +0000
Message-ID: <SJ0PR02MB77582044BECC55EA1511E4FBD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
In-Reply-To: <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f3b3209-0115-475b-e9db-08d9ea1d237c
x-ms-traffictypediagnostic: MW4PR02MB7186:EE_
x-microsoft-antispam-prvs: <MW4PR02MB718678CE3871610E9C60E2F6D72C9@MW4PR02MB7186.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KYMEE8qgVyzzZ9+cZtE+/QT5MVLw/GN1qnoN0dcYUMKu7HyafH3HaiXWxXgfo0S6obXisWEFSdqERc4mm+l6E6190CXwXUQ7XBqCReel6etH3YGC8fDRZc1JPuoQLlaQbFygPfUxitTcMvLpZw/szltFqxzM0nhQy/5LQCgm/Cx1Ey0Ng7+7avnIlrKMSEr5IwS1FB0Vm1lsXAp1rHEvKJbYIva32mX6xP8ojYe1m9TM8O8Sonp2A9Ikq2kq/apso0BUVTbsGLy3lt2g74SdOWZs2NQX/Sm4ZBD7XyuDsv/NcLJY2WSNTCLY25CbAGEsBs7h2rx1sbpD0s5LdkEh00OgDzzs6GMJXMI7pflvW0reUorut/mqtuW1xdhss2s+NEJ+PPl3+3D5Ugg1ygjJCHy1JYB1/Wxl3vzwh3GzPcuG0JXHwKcCIs9yRnl5YTxgIygJWf+cbCB+/AJ7qY7Y4DETOsTjx/e7Odi9otOXpg4Obp0TVg8mIh5YFZDEiLGrKX+lXixNSoZssmS284UQzZvB5Kc5KQ4xzDl7zSqbwDBRCJYE9r4N2bNpghHx75aTX9RHK9ZNsoIY4poUISdojctYVOu1lskvs9yqL0MC/RuRqZ/Rgce6JBZwzcWjQ+gI5D9RGjXD4I3GVKmB7n4aKkgyTP/XWJiPgeVU5/M/JvfXvsZIA5/s+NqXsQT94kdRZk6tbjjPRuM97f2mdMNRRaILl9OG4sjnW949vqTSziNz1FRC8c7pvIsUR6SwWllRq8DFA7Q8BAPa3CE1ZDXXTimtYvvVT5Xmh7HJjZlR2bGo1qwOaY/QyNPhqaHJbtVeXAY00FwxuQek4EI3VSomacinTZRg7clED56W4vvXqF8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(6506007)(7696005)(2906002)(53546011)(9686003)(8936002)(8676002)(966005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(316002)(110136005)(122000001)(52536014)(508600001)(38070700005)(5660300002)(55016003)(4326008)(186003)(26005)(83380400001)(86362001)(33656002)(71200400001)(139555002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MndiSEMzNjgwcHd5bXNZV2pkejNGSUQveXhYTWxsaWMwRXpzcFBobjZVTXJv?=
 =?utf-8?B?bWVoRDBGYUoxaTBiaXZTQ2E0SStRNWMvSkwvemMwZXpxZ3EybDNzVERwQXVn?=
 =?utf-8?B?cTQvc0RtMzFMREZlcnJtSjRuUlNNVTZZODZxcXFhdTdKMWJCcVhreGV3Mk00?=
 =?utf-8?B?NGpvS0laNHNNMGVpbi9PdzdrTWlLRGg1S3M3Y0poK05ZN2kvSTFLUkhvcjRR?=
 =?utf-8?B?b2k1cnZJekI4c2NjaTlYV2FUbmhMeUpsMG96NHlYcTY4VGVEYzVpSWlTekRr?=
 =?utf-8?B?QzFUc2tuK1p2Z0loWk1vT3VmZTFWMzVzQUFVbDlMMFZVQWJNVmR6UGxYbXhw?=
 =?utf-8?B?bHpFL3h3WFJqN0QzbHpzREpJeDVSQjlRV0FQbS9adlZIUTRzR3lLYURWZnU5?=
 =?utf-8?B?WnV2UmllRUcvV1BXQ2JGa0dvckZ0b1Z5ZHpWTG9xWWhUcUVrL3BPZ080OXlX?=
 =?utf-8?B?UEJlZWFad0ZRaDFoT0QwS0NzUG05Y1lManRDY2tncVJZU2lvVFZ1QWsyMFF4?=
 =?utf-8?B?WStZZjNBZUxnWFp5ZnRjZWFLRkErT3RndFhhOXA1TzN1S3A3M2NnOWxoejdj?=
 =?utf-8?B?ZUNzQkFWWHRGdzJ5aDdjTWREMWltMlpKRXZ5aUN0RVBKNThhc28zdGU3YWlv?=
 =?utf-8?B?Yjc2VWl2TlRnOEw4aVJDUnRiWVpmTURJODlYbllJbDVQemNrY1JiOTlqYWtn?=
 =?utf-8?B?QUc2cGxDdzRNM09wRklqZHI3bjVUTW0yTnJPT25UekYvd3ZJSDN3VmJlWk54?=
 =?utf-8?B?T3N1OU1lbnl3QWVocFJpUWxEV2VBem82YUtlcWhwcFRLNkFCVHl2c090dDRl?=
 =?utf-8?B?ZDlWZDZDbFNLdHRpZjY3Ym9zdVR6aW1XVGo5K3FUNy9FdThyL083SFRQWDh5?=
 =?utf-8?B?NWZpNGRMTkVlaFFnaEJBamRBK0VpRnNKSFBCVi94UVNWWHpXcUhpM3lyRm1I?=
 =?utf-8?B?YW5LZ3B0b2lpZ0w1Z3dBcnFlWU5sNkNCUzMxNjhuZ3d5VHMrSzdBT3dFd1Qx?=
 =?utf-8?B?QmF6TEhqcHMyc3RkUlgvTDN1NWd5bHcxcENxb0xYeXZwdGVWRUN3cXNzQjBL?=
 =?utf-8?B?cXREOUdqekZySlRBY2JqWWV2TXBLZEZWQ3VnSzBsZWo1VHJ1ektlbVdyWnh5?=
 =?utf-8?B?UUlaVUp4Wm1JYVF1Zm14R0xJQ0w2ZThSSUlTRkR4VklnTjVZSitvVDVHaWtF?=
 =?utf-8?B?VWk0UTZpMmpyRU1lclMzWVdYOGlyZFcxT04rY1I5dzZidkxqTGNVSG1qMmtF?=
 =?utf-8?B?V3ZTTnprU2JybFMzam1JNWlRekRvYU5qbU9WUWFobFdRcEZzWklOVDBXZlNT?=
 =?utf-8?B?M1A2Mk96bVNHa1dSdG5MeWJMYk1qNnJDT2lyNmF2ZFZobFRuMnRXbXRva1U1?=
 =?utf-8?B?N05adG9RZDY3QytVYnVEaVkvNmIrdmhYTEdOYXR3dDJlVFg0YkxnTFpGVjNM?=
 =?utf-8?B?bUJqQ283ME5jUUV5Mllja3ZzVXFQeHFZa3V2MFJlalM0NmdXdzN5SkhuaUFR?=
 =?utf-8?B?K2tDTXJKUTN6cEwxV2lQK3ZpWlZzd2pidnh2YzNZeEg0Z0RrMFJhenl6d1pw?=
 =?utf-8?B?RkJRTTZpOTRTSkZ5QkdsekF2VThOak9TQTJZQVU5azlJSStSc08yRDNkSzNn?=
 =?utf-8?B?dWhFa3V0eDU4S2FYVWRadzVEMWxZL3NQTTZzejQwSktyOHBsT1VCMUhZYVVH?=
 =?utf-8?B?MDhwK2VnYWJGMnBtOGJIZWhFazA4VkVhNjN5NXpQdTUweXJIMUtqcWJLaE5Y?=
 =?utf-8?B?QktYYWgyUzkzZnV5OVBabzRqd3pSdmMweFU4L1FvTW1EVEszYVQrMDJON3Vz?=
 =?utf-8?B?ZGgrQkJRQzRBazZtT1RQSUprVkV6eGQ1a3hyQkFEV3Exb3NTeWF2eDhHSS8y?=
 =?utf-8?B?Wjg2eFp6U0hTd21vOCtkYkVmdGlnQllEcWZwdXRoUXR1Smp0aHhkcm8yRHdX?=
 =?utf-8?B?cmdzQkpKSzVLNUhNcjRmbG1SemxsSXJ2VVMrWncrVWhVSXJuMUIvRVJJbSsv?=
 =?utf-8?B?V3YzYUFzclZkRm1PenUzL1d4YzVyR0FXazIzVHFRMHM5Wk1vODVXRFUvaTRQ?=
 =?utf-8?B?Y1lqMzlXV0JpMTRSU052Uk00SXZBRjkyMlpqRlg5VFl2KzJOd1FuK295S3o0?=
 =?utf-8?B?SVV3bkxoUnRtSVRtTDNiNWY3MFZGMGdUNW1ueUxIbUliY2E2OC9FK2lMSVRy?=
 =?utf-8?B?K1E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3b3209-0115-475b-e9db-08d9ea1d237c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 09:35:11.9038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ikv7+3DvA7aL1DZ+KEmtD+scGPZhANoLAZUqD6PPFOB4uicMYgzx53WHA+EHII/dqQR8+IGirLTqbeyiUaA9+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7186
Subject: Re: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding buildroot ML on copy of discussion:

Hi Neal,

On 06/02/22 20:27, Neal Frager wrote:
> Hi Giulio, Luca,
>
> I now have a version of the defconfigs which will at least build cleanly with buildroot without requiring any manual steps.  However, in order to get Linux to boot and login to the rootfs, I am still doing two manual things to make this happen.  If our goal is to make defconfigs that just boot, then we need to find a solution to make these two manual things included with the buildroot build automation.
>
> 1. PMU firmware configuration object.  Without configuring the following U-Boot .config option, the PMU firmware does not appear to be working properly.  I have been fixing this manually by adding this configuration, rebuilding U-Boot, and then copying the results into the output/images directory.  While this works, it is not a clean out of box experience for new users.
>
> CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE
>
> Is there a buildroot config option like BR2_TARGET_UBOOT_ZYNQMP_PMUFW available that can be used for configuring this with the automated build process?

There is a better option I think:
BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES

With this you can add a fragment file like:
https://github.com/buildroot/buildroot/blob/master/board/olimex/a20_olinuxino/linux-disable-lima.fragment

in your board that simply enables that option, so it will contain:
CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE=12345

To test it, remember to rebuild uboot from scratch with:
# make uboot-dirclean uboot

With this it should simply work.

Hint: if you need to configure uboot, don't navigate to build/uboot-...
and hint make menuconfig, but, in the buildroot folder simply hint:
# make uboot-menuconfig
and this is true for Linux too

> 2. Kernel bootargs configuration.  I suppose this should be the easier one to fix as there is probably already a solution.  The current out of box buildroot build will fail to find the rootfs unless I stop the boot process within U-Boot to execute the two commands below.
>
> setenv bootargs "console=ttyPS0,115200n8 root=/dev/mmcblk0p2 rw rootwait"
> saveenv
>
> Once the bootargs parameter is saved in the U-Boot environment, my buildroot image is able to boot properly.  Is there a way to configure the bootargs parameter from the buildroot defconfig?

Yes there is.
You can go with 2 typical options:
1) use boot.scr script that ends up to rootfs /boot/
2) use extlinux.conf

The 2nd solution is the most used in the last months. You can take a look here:
https://github.com/buildroot/buildroot/tree/master/board/orangepi/orangepi-lite2
and check extlinux.conf and post-build.sh scripts you will have to provide the same way and then add:
https://github.com/buildroot/buildroot/blob/master/configs/orangepi_lite2_defconfig#L48
to your defconfigs.

That way it should work depending if your u-boot search for extlinux.conf, but usually yes.
So give a try that way and let us know.

> I believe we are almost there for creating a new image which can build and run without any manual steps.  Thank you both for all your help!

Awesome!

Best regards :-)
--
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
