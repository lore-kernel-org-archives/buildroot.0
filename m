Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FDFC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 10:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 407738134F;
	Tue,  8 Feb 2022 10:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTOYKWqq3QRy; Tue,  8 Feb 2022 10:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B8181334;
	Tue,  8 Feb 2022 10:19:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C94A1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 10:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49D3060A9C
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 10:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pELQte1Y1pw2 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 10:19:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7150A60736
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 10:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4bYWLCE52TFin/rXbMlShh2ZSJzOSB4uKaqbuM+xVsPkgsVtF6ZS+KMQwSA6gM7BxTM7OViRaU+5lE7oBlmO9I7mGzAX9LYndzWynl+QgXZrYnq4+Fbtb7xqVUFfcepd/3lO9GyjeXNyJ1l2y201LtAaIMigKGhgjvKZMZxCuIZLAQo0DIB6WDskCkTR8AAz9FxclMPXKSLoygHZZXwuMi+HZqrF3FWmIJtlTtQPzO9c0esIXf/wyk67u2N5LSRBaBcuwt1qPB3QeWEWXaDJITRsgWBMlEsklUbPbEFDsV/cBoZIRAkUdeyxQAfH2a28vYlk5kAjvDZIRm5MYCEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nP8SoAf5rz2RLorpejKmmnGJOwweezRx+EUw44zsrY=;
 b=WiRgVv3Px2a2P844GhaenS4UfR6HoxdC2bCf87ZBkLcLDRWKGdttu4g8bNYdGM/T9yj0syaBG9JlOgDs/BKltMiOPnYUqTbahAvW/SbovYnMX4H5uBuht9Wj4q94lLdiS+HNk9xqBkCU73R680t2KtfZVr2nc5u9R7nIcpcKJK/FQNC56lGpPwPa5U749Jw15QTEgNnqTBUDr0G07pw5VibjclLYh/NXs4u1j3Ren2WqU3a4l9eXhh5Rmk/B1s4Kzdo0kIm8S1fCYqDw47QO+DeFwUsa5p0d7j1ngEY/5jsZ7qTgDY2ZWUEEUmyqVwmZiWBmgeyBBFF9bclSPCMx4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nP8SoAf5rz2RLorpejKmmnGJOwweezRx+EUw44zsrY=;
 b=iEJyOv9TeWbPgadkArEpqt78MbyLpwlFYuDnrowva2AOvzWFsBlpvTsZEd0FbuNaxeE1T79xpKllLExcOtrJMvtCiWyahOql6FzRyyKFfd7Rz8ByRJzysEWvuLd02PNkItj2DdAZGm8uhC5LQyyruO4QLkAudwbipoIhAxCrzV4=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SN4PR0201MB3533.namprd02.prod.outlook.com (2603:10b6:803:4a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 8 Feb
 2022 10:19:48 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:19:48 +0000
From: Neal Frager <nealf@xilinx.com>
To: "luca@lucaceresoli.net" <luca@lucaceresoli.net>
Thread-Topic: [PATCH 1/2] configs/zynqmp_zcu106: Bump ATF/U-Boot/Linux to
 Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQgAADBcA=
Date: Tue, 8 Feb 2022 10:19:47 +0000
Message-ID: <SJ0PR02MB775885C816EEADFD212C8ECAD72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eee72d07-a3a5-4dff-3b21-08d9eaec88f0
x-ms-traffictypediagnostic: SN4PR0201MB3533:EE_
x-microsoft-antispam-prvs: <SN4PR0201MB353311A5F5795DF56F90CAD8D72D9@SN4PR0201MB3533.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T0GEQaOfqysOCVgjgzuw3rCJeKT9tAkS1A2fH2cO59di2fu1qSbr3azpbP+mxf6HNUSZ/cSMguS1liXdngyektvFhhRKf0eoSgRRdwTDwyuk69lpkqYS5xh9VCOV38ekz2VjElnl5blVI5gQ7hmhblrwMMe5hWcWQF0s9jBLxg4PkFg1VnlFrDA0Xgh4+IzMXTKsmoLAwLMfI3Xin8HC1TpBIqCdJ6RvJPcJbLJWNS4REw9f8A8Gy/Sqpenm4Do0xJDi3sCwEQWB7G7VyyeCTnpKQ131BeGNFrL6pf03EJRqc9qHtYFPyOM7MFMdj26ufw/CzIXQhVPKYzsclEALZ8ZNo37vPTdgSiwb+nmgh6esMZFbdCLA2J/RcI2HhonE+dfzpoOa7OkkrdVvI/gLtHgXLY2mhzVW8KIDjfWB9/fflx1PiXcdUMRdFgCURkp/BJ/rE3aOuJrzFJ7jZID4KdId+r8nn1yOPpBFmuVLQ0lWSIQSUaHoVDa+wJLaQx1RZorVLIDaywfvTx3ywyCiB0TSS0YVmzq+lkwzUzb5V2Xae4ZF8QU8gMBw06v6QZQx3iXsjfiDykL3zRXffmRnfsZ6o56livJ0zxtDV8da8/5gEZGKcOHHGPNSWriQk852mBM0JYXxOFmQkA3NPsjVL/mdPtIKtrnZxEhZqJANUJK96NLXoZzlm8o/58Om8xzX3MpWauuPNEvhDd/6dJ9ogYepIBq46ZfhGFwFPnRDHatDjisaJRF5kr7e+F+pcatdLCAPaHDztiyGYbxOyTzy30lQ2y66BUlH7DboO80/jkM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(38070700005)(71200400001)(2940100002)(122000001)(9686003)(2906002)(38100700002)(508600001)(33656002)(66556008)(66476007)(66446008)(64756008)(8676002)(6916009)(54906003)(4326008)(52536014)(83380400001)(6506007)(186003)(7696005)(26005)(86362001)(5660300002)(316002)(66946007)(8936002)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gbE7KKygXuCt0pU23PPBOH77cyuAUkgabfQcWNIi/vNrjO2FpAp1vQmT8uoW?=
 =?us-ascii?Q?GnBKqvzXHQKsJwUZo2f7Q0+9F+BE//ZKvLnlfEp7ksxqvaJQMFXLqlUomtii?=
 =?us-ascii?Q?XtwbPzc/rwsXYvdOlxGCdyi76B4pjQY83mqEuagn/JK5CAydQ6Ec3PoXkkPb?=
 =?us-ascii?Q?0AqmyP1/S+3nLPM6Sjzshh/3/uuOd/uz735Kv0CNrqjCH8WBKtueoI6sLyme?=
 =?us-ascii?Q?gQuOMPaXGSTBQRxqiK0zopdXUIBAoiNRo2t8vQohYESBU2kfWkVrTm9kBYEY?=
 =?us-ascii?Q?6UpxTNG3il51RO1Z8Idr8Fqs7ESYmDe9O2U6Lynp9kZNBKmVhQjRK2uCApCK?=
 =?us-ascii?Q?34Olynns7gnnZU8hiCZS+gbygiPNxjOSmbe52CalKtbrhnOZwTVvzavxkXto?=
 =?us-ascii?Q?4nXpaa3+3y2xRtYMmX5Nl0RIB7wE4cbvlQtGMRz34veK4LHELXlUq2mGbdaz?=
 =?us-ascii?Q?yybuKwlGK9HzJ2qLxWMiMN6Ekfwm5f2AfzE4KXCSZfIZXmsDFezK23HUeNCw?=
 =?us-ascii?Q?u9kRsxSY4ZvOeYE14/e1y6Mdq/QqIZaYbAA/1Tz8FhLYdJtgQ1gW4WpeXXrs?=
 =?us-ascii?Q?gc1ceZJEQYkZ6nuKp0JNDJacPY8QqazJ3NFR1Zljw2VxN9nsqQMc39UOxBFT?=
 =?us-ascii?Q?IAWH3vkafIHu4uhjblcoUBO3722ngVpB9KNFElA7Gh7h0oFYEa/qE0fysyJh?=
 =?us-ascii?Q?p3mz85lmSPoqnnpa27rFAZxwf1v1N1GBboe51psgeQ4bSekJ/8IpOjmQfmPc?=
 =?us-ascii?Q?2Z4Kj5YHMH7RcTN19GooeVo3NuozcxuYL0CXvun/kbhNFZY1a5kp/gr3zn7y?=
 =?us-ascii?Q?pOtYZkLS+Tb/5TB3kzf4BgnyGsY24MjXYmrGIpj8+J/LUNKAkW5oEBqsxa8n?=
 =?us-ascii?Q?lq00R0irRC8jTSBQeE7gXYp1qd0Crt0Pa/4kJuBLO9V3HPlMMV08DW8GkUF6?=
 =?us-ascii?Q?8FjfNu4QWbueEcQhyqmo9ow4BLKDHtvxwTdTIHezUbPFW2QY6VcMNPtJtaTB?=
 =?us-ascii?Q?yOd2fAEYbOMNx0iTmRSaPXUmzckH1kPvZI4T1XxIND2j/bGb5R7DXUO2HzzT?=
 =?us-ascii?Q?3no2Eu+KijRpxKSfezSuQYaAVp0CIzqqc9QsyGZlqGhOlbWVcM7qh33AEOVQ?=
 =?us-ascii?Q?7M3+152CM836a6a2cSxEAVNZGpsdx4k/yirVPXW70toYjPgK1dtpm2LvPkmn?=
 =?us-ascii?Q?UbWGSoYm5B/MmyFBfV8v9bd2tI7a/tXc6hCn6GCmoDsTZ4aJaZlyRlvEj0u4?=
 =?us-ascii?Q?+PXdd3eTMPHiMjNZWG7MU3MkWOwEwIZGCfNdvOUCVQQi88fnl1nsxwAouyy+?=
 =?us-ascii?Q?RlXIOJXmK3A53h59SXv4ZAsR5BH2DIa87eCBMqWhklRsw/ZDkGRNVaIywdik?=
 =?us-ascii?Q?9S7eM3HQrjP9ojrA3hcFj+CyPf2FzdXFfHjlV5y2LIxaKsnQnaVOxv+k6rbN?=
 =?us-ascii?Q?vQ1fLYAxVveLZvJ3QFKTaUpXa572xug0H7bmbw6yXfbsaVyCF+wZ1nFVYUmy?=
 =?us-ascii?Q?vHxBjK8TrYAoJ1yiOQQrZtgzHe0L/YxoSAqTuwuCrya05B5tccZod/sd47Yl?=
 =?us-ascii?Q?bEjoyLB8yMyFcRLwyODKdpJarEZwh/zgZ+AnzLDKqcXIWm4JCOBqD6RnNffg?=
 =?us-ascii?Q?wgT2ENch0qEMw8fpPht/Dl0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee72d07-a3a5-4dff-3b21-08d9eaec88f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 10:19:47.9325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9MX88oA/CV9BOOfr0lwtF/0VMmoeoRhOrw4pT7zJ7H6kCERte3Z942g6ObGMp3DmsP5rwBxlW+hvGo+OozPuXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3533
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

Perhaps you can help with this step.  It seems that the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG configuration requires the pm_cfg_obj.c file to already be downloaded to the local machine.  One solution which I have already implemented is to add the pm_cfg_obj.c file to the board/zynqmp directory.  

But I would imagine a better solution would be to download it off of the Xilinx github, so that users can always get the correct version should they want to use versions of software which are not pre-defined in the defconfig.  Could you help us with adding support to the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG configuration to enable the ability to download the pm_cfg_obj.c file to the dl directory like we do for the pmufw.bin file?

BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="https://github.com/Xilinx/embeddedsw/blob/xlnx_rel_v2021.2/lib/sw_apps/zynqmp_fsbl/misc/pm_cfg_obj.c"

Error message:

Traceback (most recent call last):
  File "/buildroot/output/build/uboot-xlnx_rebase_v2022.01/tools/zynqmp_pm_cfg_obj_convert.py", line 252, in <module>
    in_file  = open(args.in_file,  mode='r')
FileNotFoundError: [Errno 2] No such file or directory: 'https://github.com/Xilinx/embeddedsw/blob/xlnx_rel_v2021.2/lib/sw_apps/zynqmp_fsbl/misc/pm_cfg_obj.c'

What are your thoughts?  Thanks for your help!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
