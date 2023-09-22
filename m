Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6180E6FE36
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 14:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B1244206C;
	Fri, 22 Sep 2023 14:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B1244206C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETYGdhNFSU4M; Fri, 22 Sep 2023 14:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C6C842080;
	Fri, 22 Sep 2023 14:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C6C842080
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30E941BF2F0
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 14:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 148EE4206C
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 14:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 148EE4206C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WDpVxf0MvA9 for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 14:16:05 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::617])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61B5342080
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 14:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B5342080
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpVdRvpKbKVem2zs9vl1Zh6pZr1F12AewQWkeM8HtyXn2uWt/GWYCQL8JL9NPlbDvpQN0qpoUVv81SVYQyV7dFmqFT2V74TRS/cluvPwei6DlPu7RKlYqco+UTclpflYl7VD5xSM20FHSjMiyLA73igJMB9rltyk/QEvcRWDPad8Q2vI/9phmVkdMophUPpNszBGDfGk+skG3BkqDVYf7tlLAQLx9jDX1rkdvmDzhEUonM9hfv0y3HJw1gIQbJIi3OC/AVzwkTi7bqRT5a1mo9hQx8WO/971Op5ptCJ3fYuuMG/T08ZbxR5j1yvwK8CCnvBIVZkv8nyUO/ds4iAuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy4ZlOUE2HxGf05n/hYPEmuiGI4kd3gv3m8Sp7NrF8o=;
 b=doF7ZbIDfAI9H+OZd1XSIMnMrcHD+G4cM2oyLeq31fkoclXEN/HoZjuzdbuJRquAlrbtEHLUx7/F4CwhT/poNHzjDXz6wDizGRN7Mf5TW2fRFkcxT1lQBqKUHDy7EEZGxe/aMvVOPZuTAI8urLHk8kao0lRx2T7GbweXx/ImfqwJan+JNZvh0fBzVjT4fcdOye64luzQV/sAwHZnR7+E6MAH8elZfD6duT1ncnNrvbwkdoysLYFVbms3zfJ66TbPDYokxdEL5yiFaSu4U8n3K7xWFeqICP2+tg+pu1ZFkd3VcIxd11ZeSoBrzZwhcmGWyES3JQlpTvuFnshPgcANTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB7163.namprd12.prod.outlook.com (2603:10b6:510:202::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Fri, 22 Sep
 2023 14:16:00 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20%2]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 14:16:00 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 1/1] configs/zynqmp_kria_kr260_defconfig: new defconfig
Thread-Index: AQHZ3jvnxvKzYf2oEEOLEsgyz5e1abAnAKwAgAABDSA=
Date: Fri, 22 Sep 2023 14:16:00 +0000
Message-ID: <CH2PR12MB5004563EE8977FBDFC6D2375F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230903075427.738733-1-neal.frager@amd.com>
 <20230922161042.5c4bd39a@booty>
In-Reply-To: <20230922161042.5c4bd39a@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB7163:EE_
x-ms-office365-filtering-correlation-id: 821b5531-7d73-4125-ef47-08dbbb76724d
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kBdyImWontq0VuzdVqtgBYsxQLVZS1o8QSs1JiJpilskJdY7WXUdVFWf6Q+r83339Jz1v6fwXy+e7NuZsJ0C+3QBJ93BtfpGH4WSxi6dISMviOhgP1dKuejWDl+M8onFL32jwRTm/JB0EUcasDj7QZxQe2/TxhmDwJ1vqnsif8wgcWG7e5PnwvXygOsNiv0prp5dxwQ1l6CEFcYHW6WfjlXPGbB9p5oEl5KYm8Vpiql0WVHibkvtGCAnhYcpujEdOyxrmjFKQm6XgqRdAocJETvluXpqqpKf22YJ2VyN5vSXrezIb92w3JYQyepiAKgmlrpWwzonQc/Kpaho8XRvgVSdEePO+fGV96vL09UetbDWMtAIrri/AjYMCQGIjaPHxBSktvsqLxtNDnI0GS7AxNgBgwvoGnM0iuci1cVUpA1govO5NVevW5kWi7DM6515XLa7s6BlphS/DqZFFV5PGtpeuqRxOubcKbKz4bHo1nr3xRwlRAt2cS/Zlq9esPEYY9x17vVGzq2jlBLXf4dKUYGnNE6TykzuAeAjkj5fQMF/sfDiY+nJ+/r9S7IEjpZUDwUZqMQaE2fuXzCXh7NwbPtLw59g/Z9/E0hVXu2ZBEwlyLW9APj03tqUmZwR+QilWigFFNeQcDVdi+b/1fRTkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199024)(1800799009)(186009)(66476007)(66446008)(66556008)(83380400001)(55016003)(5660300002)(54906003)(64756008)(6916009)(316002)(52536014)(41300700001)(8676002)(2906002)(8936002)(4326008)(966005)(66946007)(76116006)(33656002)(9686003)(86362001)(7696005)(6506007)(71200400001)(122000001)(38100700002)(38070700005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xeOW09VOFT//Q6F8CCVsuKYclfWstdr+nkE2eOBouvdBap+k6+fgjZs2T030?=
 =?us-ascii?Q?F/94Cp+H2IV2xC+HEa94L17XMLq9Wkm6VguWlzhudb5UNNyEpArOmZKO4wy7?=
 =?us-ascii?Q?DelD0dBRUaKek5jOliIy00GpPT3xCGM94G/QX/zhe1CyAPmgTD+7OzasBwkl?=
 =?us-ascii?Q?bnt9N6F8FF6l7Hncg4zFsB4jLdWFbvRDOzOtWfW6g6P015bYg2AwjT52ivzF?=
 =?us-ascii?Q?FP6lbqrAelT900ggPtEAkmKf/yF7nyDVBZB29P+P7rpyYqO0BU3ngVkl5PT2?=
 =?us-ascii?Q?6FXiAmJGYE357Zu53lUEw4zSApJezu0ux2JAzDG1UzQVgfhh6rix1VFnVkHb?=
 =?us-ascii?Q?vC2Fkg9OjuUjBsuZPUA/bmKJiw1O1LNxDMgYeTwQ4uUi8Kjg2GX8QKHS8rqt?=
 =?us-ascii?Q?7n9ht5j9Ys5HWNZ5IbGnE0u4eOKH7I//2LDfYfYZcmgKhBhCmRzra1tx/pss?=
 =?us-ascii?Q?0QpdO/UQCkeEHBi4c7u2unNapZR7inWekpMb7ETIDI+26yi/Q1rlIYaDRFeU?=
 =?us-ascii?Q?wqFl47v1A2V8Ls6Cdn8LjIYH42AAcCjYv0Hkbteas6hPxQqOdkyOChK4o7Pb?=
 =?us-ascii?Q?k+rKVcnK9LR6/1PqwAXK7693Gw4TA1Ubnp0FmEr6g4R/Ci0sQ4RCnqfrOy8u?=
 =?us-ascii?Q?uoTAVmHK7cFc0wctmxopor4ehB3jpI1QYfO3XMVnnMT5Lm1FbroMCx2PTiL3?=
 =?us-ascii?Q?zZWGTR7DpcLUhRO4hrsm+5ckO+D+2ZKTpGr52fRmfdMwE1Xi0FEzQtOuNIel?=
 =?us-ascii?Q?G4Nz/5uxOZ9MBNNH7Fro4qO0SFA/C4sTkfazLetrFgVkK1Qo5NW3ksJM7Cyl?=
 =?us-ascii?Q?otbt30oNKK1XjN6gq1y/gM/eILISvQowZi/nYv/80HtWhp9yS/hz/8Q69rBt?=
 =?us-ascii?Q?NML6Sk12WW4yQSnYP6XHFzigvLq+Btlcxe1j7A7vlMf872TjvHMoyk+Nt3b8?=
 =?us-ascii?Q?SKOA2zxcmXlgJ7YCy5eSL6JmWZDsdIKGBnaqGrGLywlH5NFjoMeAiVIlg6KS?=
 =?us-ascii?Q?fmr5LUFUHeNVK3mM6FAh6oq5lezGqc+JiwOYtWEHA/kzBEa2ykzQXjL9WC23?=
 =?us-ascii?Q?oBTaQ6MCcZt5sfOgiOVtTNG0gFxNorNv7Rw/KbLu/8xqyhc2GAf9q0m0YXpH?=
 =?us-ascii?Q?JZ3cMYR0pUtyr/O/BAxMnm0N+hJ20wbufuppGSnR/vZ6uH737nKthtLsZsG5?=
 =?us-ascii?Q?cZCukAufGuW/46IAthZAJIMZ6CRXnqt6ZtkIi0b+PcNk3pHQmVbgGD/pQ89d?=
 =?us-ascii?Q?hxRHUcpbUiB+ZJhQ+RMFS7/FAnPtk4iv5htxzngVsXG1sT4XZZbQiSr4Od4L?=
 =?us-ascii?Q?O36tyq5olXoi6UFN8fqz33nHrJk6DSv+ObQvXEmg0jkJ8BLtQFMdzFN/N+2Q?=
 =?us-ascii?Q?BCQvL/8OJAdA0NJxsEYV4lOEjaWtkQ1QscIQ7IxiBYzIXmcjUhwzDMgkiNEk?=
 =?us-ascii?Q?0+q6M5W+YynaDN56Nx2RauWehuYi1DvyX2Of/EG6L2C1CBSRiPG+T8HbUqUL?=
 =?us-ascii?Q?FFWVFZLVcd3Nj2PcV+kjzhnOVIsRUDilzMxXM1llJf5c4+phaXKKzpy19M8Z?=
 =?us-ascii?Q?QHqU2L9WrzySRZeuHv/rwDr2frpLwFMQ3UkH08UcUHG8/68rBbcv+04I6Xs7?=
 =?us-ascii?Q?VakIpmxTf/y2Gz8uCywnnxc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821b5531-7d73-4125-ef47-08dbbb76724d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 14:16:00.0821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +mz6k0wJQcLQdiPyZLwktd0Bznh5yrRxoi+dnknbDNhWw1IayQo5RTyM0aWepZrO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7163
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy4ZlOUE2HxGf05n/hYPEmuiGI4kd3gv3m8Sp7NrF8o=;
 b=zjElprCxdCp1O4ieZ21aT60S2NDgs9plinTm8FtZc8q0KfjM7EmM6rGOt0EPrZCmo3C0sC0PKGqlbX2Dm4BsyprOEYqE7ACcMP4G7PHKfiK8V65lN4/VEIvL7eR744xfpN/Wb79EtSucQkoT2waS/zg8O+7lQThqdWJDTp4ATq8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zjElprCx
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
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
Cc: "Bradley.Gamble@entrust.com" <Bradley.Gamble@entrust.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "david.evans@ebv.com" <david.evans@ebv.com>, "Bespalko,
 Dylan" <Dylan.Bespalko@amd.com>, "Simek, Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,


> This patch adds support for Xilinx Kria KR260 starter kit.
> 
> KR260 features can be found here:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.ht
> ml
> 
> While the Kria SOM is based on a ZynqMP SoC, there are some key boot 
> config differences from the other ZynqMP evaluation boards.
> 
> 1. There are no boot switches on Kria SOMs. The boot mode is thus hard 
> configured for QSPI flash. A pre-programmed boot.bin comes with every 
> Starter Kit. U-Boot can then find the Linux kernel and file system on 
> the SD card.
> 
> Optional instructions for updating the boot.bin in the QSPI flash can 
> be found in the readme.txt file and the link below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+
> K26+SOM
> 
> 2. Kria SOMs use UART1 for the console instead of UART0. For this 
> reason, Kria Starter Kits will use a separate extlinux.conf file from 
> other ZynqMP evaluation boards.

> The above 2 items are the same as the KV260, right?

Yes indeed.  1 and 2 apply to all Kria starter kits.

> 3. The KR260 has a USB to SD card bridge, so the Linux kernel and file 
> system are found on /dev/sda1 and /dev/sda2.
> 
> 4. The following patches have been submitted upstream for u-boot.  
> They are required for enabling the pinctrl of the tri-state registers, 
> so that u-boot can detect the SD card connected via the USB to SD card 
> bridge on the KR260 carrier board.  These patches are temporarily 
> included with buildroot until they have been applied upstream.
> 
> http://patchwork.ozlabs.org/project/uboot/list/?series=368369
> http://patchwork.ozlabs.org/project/uboot/list/?series=371196
> 

3 and 4 are specific to the KR260.

> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> Luca

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
