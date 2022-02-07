Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F189C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 18:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31DBA4035A;
	Mon,  7 Feb 2022 18:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5PxJx-pK8eM; Mon,  7 Feb 2022 18:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B1E040352;
	Mon,  7 Feb 2022 18:40:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4E61BF299
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 496D060BE7
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGGKcweX_dCn for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 18:40:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 328C860B53
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 18:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRKeI0pW47gomrFkCk1e29XmJWKrWlfujZ3IPiZI9KkkThL8dzjLrOyEFQaZxB0y6Dhx6e6M2CjHJRcfGMqfSPOYy+FZ+beMZ09U4m7fJKv6lZwCNUdiiarm85YarmGtCVF/jC4Ho8dK5aeSTdfwkshQYgHOioUcyrV7DDh+laYNQWvrX9z7tou+5OlYh4hgDYB9JsjrIH6TcN+IBi50qnjWHD+NtNGZacJtYTGEp2bpdjYKLHG/cDG2c+CD0RnKsQ5KwAjMnTpp91ZQ81SyjDtMdfsnBjEJ3fWiLhRDFOh53jbPSlGWlJnn2qZWWgPZgW2gkCSYJrEd5iqyMZ2BkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOJRe/jPu8YpT//ltTbHfyx475/5gUovfTWbJzQOa5o=;
 b=ej3ZAnSjWeKzbea8fmvGGnmqM7XStYEdP9aIEIlcAtYt5+DRCppWVeyWY4pISBdJDB5RIDiz3P1wVOHbWrM5QWguL0jDuGNPnUoS6kh+RfyAmcKMVqBuCs9lFe3OkfoUsW35vSFY8TzLrVVsPoSM8SeAsNqgoz8ItAmQ6vV2yTwHKfS/JTnG362fQBxR93htWUOXGjzTGWG6QG69R0lgg2KcYusFkuQ/sfiVL5QSnlQvSzAlBK8dtPmTTsVYQdMPcdxwCkdmDxgC5U6ZllT/01ENg/vR8fDpbyHazQkPxUDE/cpgjbGPcLXhpcxQdRt8W0XjtgrQD9uC7DKopZ7O4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOJRe/jPu8YpT//ltTbHfyx475/5gUovfTWbJzQOa5o=;
 b=Do4ke0+BDvjaoHiFG8c/X1sIMQCnPDJhMF7UhuTHqY8q2GzQ3lbJxfcUbE812HIggNEdGM5s6JgO2JZ/yFmOH0mBndYEhKwLXbGMmb/svf9T4eLif6Y4pWcU0k19rLeS0pWrfhvd3bgqfG3zyGeCEdQ4OxL03hG+qhz1wizFGHA=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BYAPR02MB5909.namprd02.prod.outlook.com (2603:10b6:a03:122::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 18:40:41 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 18:40:41 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, Luca Ceresoli
 <luca@lucaceresoli.net>
Thread-Topic: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
Thread-Index: AdgbjfGkWVHh+j9fQheB50HkAzQTuQAGb/sAABRcuQAABPdHhgAE9RdwAABtZwAAAVpogAAHAYRgAACe/AAAADXDwAAAeqsAAAH4/jA=
Date: Mon, 7 Feb 2022 18:40:41 +0000
Message-ID: <SJ0PR02MB77584B2BE2DF59EFA1054996D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
 <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
 <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
 <SJ0PR02MB7758A5DBC6DD4DA837E0F47FD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758129FFD78D128D3393198D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <16f4b7bf-546b-3bf4-c6a3-b711c8cfcadb@lucaceresoli.net>
 <SJ0PR02MB77586A616AEE69FE18916F15D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <fb6fd9dc-7619-5768-a1b4-00324516b4d4@benettiengineering.com>
 <SJ0PR02MB7758884FD57FC4A53E3585EFD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <d2319e17-8500-f9af-56a4-1b4efe75fe9a@benettiengineering.com>
In-Reply-To: <d2319e17-8500-f9af-56a4-1b4efe75fe9a@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8801600-2665-428b-fd55-08d9ea6957d2
x-ms-traffictypediagnostic: BYAPR02MB5909:EE_
x-microsoft-antispam-prvs: <BYAPR02MB59096A15689F55F6E5652F19D72C9@BYAPR02MB5909.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bQJq89YGjZ5N5uThhC1p5YXdWhSLNlkDOXE9U6PxHyLorAWYhGP7IJ6tuG1Qjolc1vrFmFfdoUCFbK0tba2ePKOpG6tpVeMc1aFSDxbqqbmoDcA0Zhvt2FBU6RFksF8rM5cRyv0a8YAL54yBvBMIgZufhi2CmCNjzdLOqFrx9yZWxOBK9YrwQ3XHfLVnik28MvpYaWVSG9mpGXTi9BD98no8PQXc2exoOomLibhZZT8rcJESdr+Y6B0bxF/i1uzQ6yNmVgfw5+ZIQn6TjA91RG/E3rQD+sYM4xO0E8NKVXWUMHqcroBIIfrI05W/UlxhKqTLYG66keVwb5WxNAowIFDolY6gNXDUhg1c5Aj6WqhHLAXXHHvoZFz5/aad+ZhyEzSqNaSX8hkdznJdW4R7vjiPXBmncv05CxkFq8gNWV/5xcATnr8hDl7lEqH5ja5hXhNumgoDxCrScMKCPmYvgXXWokIkWxz2hxVf4gOmd5Oi8BkCWG6ViqVbkXd5bGaftC/XXT8l+mYdate834iTdY8IAoehlq0pdmzldYemKEVeOldUVujYj1UoNod+Y23LNJ8PzTrYmbZz//1jIuWL25B0/nkdJtBW5Whdlw8CCC4T4OpvmXmM/nK9TbK07wts4W+6V2VRD5l7wLebLKDM4yOH/+6UP3YGebgjgKhdKqP3f1PRbQV9ap0HVeeX8Uag2KlMskkqHKpN/2xe4HsiAaSilmCmFpvCZDLeX2Jqa0l3jYtG3xnMvTXSAzaghqNfZFci9FDzK3hAFZVE1LJP5ZNPoxlx30n8a2O3/hZ8tFraejv4NrlDuuUk3H63XUTaXSFA9pcZU5vVIwluE229Gg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(966005)(52536014)(38070700005)(38100700002)(7696005)(9686003)(6506007)(186003)(86362001)(8936002)(4326008)(66946007)(76116006)(66556008)(64756008)(71200400001)(508600001)(66446008)(66476007)(122000001)(2906002)(110136005)(33656002)(55016003)(316002)(8676002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXd0U3M2TkZ0WUlLTzBSVVJNdHRabHlHZFZ6TXcrNEROMmpWc0hEWjVkQ2dX?=
 =?utf-8?B?WUVjUFdJVWFuOHUvUmlLNHQ2c3F1MjBuMTlKT3h5K1QvQzY3Rm5XUVYxQjRO?=
 =?utf-8?B?ZlRZNWgzQTVoVmd4MXhMMG52VW5YYzVZOEdXd0N6VmNERnNsaFQ0QmNrMmVh?=
 =?utf-8?B?MFBlbW8zQUZDNkYydXhURXlVWmErNjA4cWZjS1NTRUc4M0crNUFqUlk2Zmpt?=
 =?utf-8?B?OHh0S3UyTFBJVDkxeU42Q3NadXJtM2psb3VVLy9qZEhHNFZUTmFEUW1oV1JZ?=
 =?utf-8?B?cjk1dVlRM252RFIxQ3ZsUkVoNkdJVFQyWDRsMVpjNW10QmFHZFN1WEI1eVdL?=
 =?utf-8?B?K1FLd01xOEJLNjFzWDJRWWJIZ2JmWXE5NE0xWi9icGdFY2h2dVM0Y3FDZ2JZ?=
 =?utf-8?B?QUhkTHVNeFVOSk9KdElDV0xISE5MMk16aFl6MU1pZVNpdTZkWms3NytyZjli?=
 =?utf-8?B?RW9DUEE4czNVYWs3alQzVlpLVDFTejIyUUozeVAvQUJHeGtLTDFCZUFlTGdO?=
 =?utf-8?B?OVJiSmNlUjMwTWxRa3VSbkxaS2daSUdHUXVRUUhKcXlmVFdWR28vK1dyaDFP?=
 =?utf-8?B?N1luYnE5ZTdTZ1UvZWJDdGtJOEQzclB0WTUySmpQZ01tZ3I0VlpFRGt2QzNv?=
 =?utf-8?B?L1UzQ3Rtbnk3aDF2YkNMYmFRUGFXV1R5N0ZqUVdncndVaEw5TTM0NzlGWTNY?=
 =?utf-8?B?REgycEkyL3ZIWnR5d0lTM2dxOTUzTXlJZENCcHNBRFljYlZ2Y0FBcXNXMlVS?=
 =?utf-8?B?UFJwRTMvbGEyN1o2ZXZqVlJoS0wyQWk5M3lDNktMY2xiZUtpK2VsMDNUOXdi?=
 =?utf-8?B?RjJISUFYZzloUi8vYXZnSEtBZU4rTkNMQjRIdk1nbnhzWXowZWtNUHFJYnBv?=
 =?utf-8?B?bmh4UzNuYXU3Nm1oNUpoL040YTFYRHNvNHU2UzJwMVY0QU5pRHZuN3dQdDg5?=
 =?utf-8?B?ZmE3MlZTSWZXSmpEL3ZTaWozQkh4ZDk2QVdBQ1hGWThoQUFwSFdTSDJxcVdw?=
 =?utf-8?B?KzMvZisvSHdwMkt1dEk4RkE3OFFHRUgwM1Vla2pJeVdNSTFIVVZodnJKd3RL?=
 =?utf-8?B?MXJPditIVVFRQ0hjbGJ6L3pSSGZ6Y25PNm9rNWpzZmZBNTAxQTNjcE1ZNS9a?=
 =?utf-8?B?NnNJVGVuODZNaHd4bjZjYTUxMDRpSGVBdHZzN1N4Y0VWQVo1bFRXb1BHZFl1?=
 =?utf-8?B?RFM4VW5tMFpKR0U2MmJoRVFINm5VNHZFSFFyeGNpNjZzaHk0ckhmb0lSWk5v?=
 =?utf-8?B?dlhrR29FdHp5VlV0TlpOT3RiYXZVai9EUDlQZVVndUN4bTkzQmh3L0c2R0Uv?=
 =?utf-8?B?dHh3ZzJ3RzN1YVNFeG9nbkRnRW9LK0pqMVRBWW9XRkZlK1AvSlhEYmxEZ2s1?=
 =?utf-8?B?d2k5Q1JwZjhOWTJ3bExINkdxaGp3c1ZHL2QwRzV3R0lmYkR5RTVhb0RWdkgv?=
 =?utf-8?B?UENYa201YmNqdXR5d1NDemgwVmRhRlJQZkkvN0hrS09tdXcyUHFoNTUwRzkr?=
 =?utf-8?B?RUVzOTdDaDNDQm5jRmkydHRqeno5T3IzeWJRdjlZLzdHbnlFTkpJNUpHaWxn?=
 =?utf-8?B?a3NxSmhrTXdkQTZPYkVHM2dYWld6OVlsVXJZU2FWUmducEh4ZFdPR003Z1c0?=
 =?utf-8?B?U3ovZ3YweC8rbGhIWFl6dmRPV0xTNmhieFdXRlRNYzlob1BDOGxsc1NwelFE?=
 =?utf-8?B?SkZxN2tVK3FJc3dxaWFjMEpVNzdIcGJFTml4b0ZXLzJ3WUxUYk90MFd1YkdY?=
 =?utf-8?B?M2VTVm9QYTlqV29sOERGb3VJZXZqbG93S1Bla0ZEWjkyQTJQdEFHYWw0aUd4?=
 =?utf-8?B?R1YxYW1tMkZ1UzVZWUNTZTZHSjgxZHpwNlRrNE8rWS9haHQ1eTdXSWo5aWRk?=
 =?utf-8?B?eXNxWmRXSFplVWhMWWsvUktHQWs3Rk5MZHNqM29uLzREbEo5MnhRbExNWFov?=
 =?utf-8?B?UW5tWDN1bmVaSlVWMHdXOWlEOTN0T0tMQWhHcyt3aEMza0NGZno2T1I4a2Fv?=
 =?utf-8?B?cnh5QjQrM0dtb3djdGFJTmY4N2kzcEs4RFQ3SnBIV0owWHVrSFV6UEZjbzNW?=
 =?utf-8?B?OFpldlVXWG80VHhvbFNNN3N1dFRlc2hMUWttTjlDRHNCbXRPRXpkMi82QUZ2?=
 =?utf-8?B?cXBPa2ozOVhQN3VQUzVFMmhNcnRBL0s2cFN2MnZXcGd5enB6NktWNkR6Z2Vw?=
 =?utf-8?B?bmc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8801600-2665-428b-fd55-08d9ea6957d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 18:40:41.4595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2CnIDW0+Y56HGQiWWP3Il1Es3spFuC6fjt3lgsMLQDC1Qd+RX3zhuv4m2kK8fz4dK+IX8lTsYoneKYnzNLumJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5909
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

Hi Giulio,

> Aah ok.
> Usually /extlinux/extlinux.conf is found in ext4 /boot/ but it's ok even in vfat.

Unfortunately, it was a bit of a chicken and the egg issue.  U-Boot could not find the rootfs.ext4 without the extlinux.conf.  So if the extlinux.conf was in the ext4 file system, U-Boot could never find it.  This is why it needs to be in the vfat partition for booting, and specifically in the /extlinux directory in the case of zynqmp.

>
> image boot.vfat {
>       vfat {
>               files = {
>                       "boot.bin",
>                       "u-boot.itb",
>                       "system.dtb",
>                       "Image"
>               }
>               file extlinux/extlinux.conf {
>                       image = extlinux.conf
>               }
>       }
>
>       size = 32M
> }
>
> image sdcard.img {
>       hdimage {
>       }
>
>       partition boot {
>               partition-type = 0xC
>               bootable = "true"
>               image = "boot.vfat"
>       }
>
>       partition rootfs {
>               partition-type = 0x83
>               image = "rootfs.ext4"
>       }
> }
>

The good news is I just completed a build of a version that builds and runs without needing any manual post-build steps.  All that is required is 'make zynqmp_zcu10x_defconfig' followed by 'make'.  The way it should be.  I will be submitting a new patch set tomorrow.  It will include the following software versions.

ATF v2.6 from https://github.com/Xilinx/arm-trusted-firmware
U-Boot 2022.01 from https://github.com/Xilinx/u-boot-xlnx
Linux 5.15 from https://github.com/Xilinx/linux-xlnx

Using these versions allow me to make use of the updated U-Boot tools/zynqmp_pm_cfg_obj_convert.py without needing to be dependent on any build patches.

Thank you both, Giulio and Luca, for your fantastic support!

Best regards,
Neal Frager
Xilinx





_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
