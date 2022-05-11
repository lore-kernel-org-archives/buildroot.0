Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24BAC433FE
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 13:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5193B40B80;
	Wed, 11 May 2022 13:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-NhYukw8d9i; Wed, 11 May 2022 13:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 983E04052C;
	Wed, 11 May 2022 13:41:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE1661BF47F
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 13:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABB00610E3
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 13:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzFh4vFaIN7z for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 13:41:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C759A610D5
 for <buildroot@buildroot.org>; Wed, 11 May 2022 13:41:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYSUMJW++652AjFMNF0UfVPieuvdI/xPOAnT0ARBbL9a478jQDQKmnOfH9cnwSDKilz+1E8vjEKDwiCY4nDQi/A/Boa3vcHFcReWKYOx/YMxTR+1ZBT3EqKsENof5gKO7p+NcgPqM2DeMvgte1k4eZ8lwsnZlcWG7Si6vdDUECgaih0EC8zw4rj+WTlj5Qaf9QMs1RoQNmb1Dd3l4JbbvQ5DID2DbYTQWdO8/eZkO2gxgGN0OmFUAkIYDP6h0P7mBgHTB10AIFaPLKpfgiiuTilEa7P9PnDFMNX/cnMrEjKB2haotEKq4GZAR0PsTEHzZV5CzKd+sJMC1NzeHZEs2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODajOX2KETDFkVVGWl5GRQQNH85QSYbww4H6lYkv/54=;
 b=UYW2OTRNwmh5FLgt+HREve0GHPrn7npNzceZfIl1hRWmBRZ2WWv2Af9cd8qJZ0e5gZTffWW+Bd2eDVJ4g7+A1NUxlCZNuQ2aN5wR10RZDs4G51qbzkK/GZPwErDjfXHuq2+as28qgc2bELW5UL+fjMV/Jr1IKuDCYoi6w4GeaGr93waJvAa+8ksDQP9RmthyQAz1K8gLPjLUqY+bmXZXqjTnv9grvmdBftnxpzDnmRiNlDA+APBEgYu2aUHatJA1zRgE6omgrkcls/GGAl7MedLqxJuMc64yOJZ/zwXG4C1w+BanulFEsTSMmFh9mn8iejD+WZvFuVk81rmPnDqOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODajOX2KETDFkVVGWl5GRQQNH85QSYbww4H6lYkv/54=;
 b=UztxkJLOcb6UqoDkCGxqZhyuoLkMiCA+9ehzMLCbhuMcPEhDQ5fblJvrJAfJqhKyWVLsIRBUFT9AlU5PbUOhUgZXUOa7pM/JHoWqUbgktAnqmv7ZXR6duPUmyBCqZ0V+L1g58Uaof5w5YevNDtUxYRfiVJPiLENbU40XlDpw/fo=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BL0PR02MB5379.namprd02.prod.outlook.com (2603:10b6:208:81::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 13:41:08 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 13:41:08 +0000
From: Neal Frager <nealf@xilinx.com>
To: Neal Frager <nealf@xilinx.com>, Peter Korsgaard <peter@korsgaard.com>,
 Michal Simek <michals@xilinx.com>, "luca@lucaceresoli.net"
 <luca@lucaceresoli.net>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6ggAAnsZA=
Date: Wed, 11 May 2022 13:41:08 +0000
Message-ID: <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7024288-95d4-4f56-74f7-08da3353e754
x-ms-traffictypediagnostic: BL0PR02MB5379:EE_
x-microsoft-antispam-prvs: <BL0PR02MB53799603AD3408619ACFD396D7C89@BL0PR02MB5379.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9d4wjH3x8cesU2CBVfO3ZTNLjsXBo8Vc9bg21NgiOXbwmwp48ginVyciH10RQAZnTS+vzDxdgnRS3znx76ehzzhVharJKnpVn3+exvw4XoN9qen1uuaQ55WOra2ujGVPTZpJWsnRVe/4lA5F0kiDqZdDk+96YyETH2YJeM24mEqKBPNeMJBkRWaNxBzNJD98Sw1g62U8i4oxLwmlF33D/rjHD9CxzIOLl6gTlS+wNv6QFPffYqa+QRpXBscggIgd8d8/QNB4ibxEMrRAJgQEB608ssjvvG/8sk6IM/b9q1mnwrypKii5K5IPnf95XqOpsOpM4/gjBlQ4+RiTVUk3VMRfyMBnjpyiE7AO71Zk391GcbLMZiCCvA0i/dkYM7O4rxxyGwBkekK3cjkolAC02fnAJE1jfFftEKWOMvfnjHAEp2wvNxwSLFLneXwa3k3VdlJVT8Npn2pS2JKwiCC38B+4kUS7mqArJJXE0/M6Ly9jsX6H5htoQ693yJEfVAMw98BQsApAw1UAR67aaHU+bOdUyqlfXCtTjFZdsQCkncnGabMHLd8lfSetYiCzGvTwPS6P/ftv2wxFf6Feqq764p2D3KM91rD8+Zy5quGQvabDvL4BhCX7yQUu5tHnZnZ7YnY7+nBTZaFEo03neLCqFXcXfD91GA15BQPOiZ90cbQAkss2TsK1TWqWDcOlznzrfKIJPsGgJTzfM6nmQaopSoa610xuMDiYBLVJ349PwxUG6guuO0jO7jlxIXDoZDu7Or1ejho9YTkadeIWjSTKwKFinSWr6qLU3W6cNOWSmjHqY1zz5dT0hliZmATSC2le
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(84040400005)(5660300002)(508600001)(4326008)(66476007)(66556008)(66446008)(30864003)(8676002)(66946007)(52536014)(64756008)(71200400001)(38070700005)(38100700002)(122000001)(2906002)(186003)(26005)(2940100002)(55016003)(33656002)(54906003)(7696005)(966005)(9686003)(86362001)(110136005)(76116006)(8936002)(316002)(83380400001)(6506007)(53546011)(21314003)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0qaie/c7+Ux2EgxFCDuwblx3npqX7WrXUuIGFjzQUAVlzOILT6EPDwC26e?=
 =?iso-8859-1?Q?EQHqkaX0+G7PvXmCXJjrUBRnOYA8oap01UxOwVYYeE96gRUJVjdixx6KZ4?=
 =?iso-8859-1?Q?kaxLZVNyY2o4X/fGBKc15QRBLkIhoCz9kIRIWGQNybn+NrG4fHhHQ/Y1K4?=
 =?iso-8859-1?Q?FFwtW4knWLPWCA1q2U1WtGWqWnfY+bUeBtImOc9sRWyT+74gDU01cJYUjv?=
 =?iso-8859-1?Q?vKuE6+ob2+DzBff+T2x9pAo4cWZvQTnjC3m061ORgQ064ity0B3f4kkPaI?=
 =?iso-8859-1?Q?kpAf6kcdaSd1vFI6BUVYQgYTaCkwcj4d+2crzlETA8trvlLI24xDJJ3sxs?=
 =?iso-8859-1?Q?fFpGwqeJgW3XaNs/dl7TdFJwRTUyhYr0irD9qLOXt4G+xpQ+oGzMqY8Qdc?=
 =?iso-8859-1?Q?OKCJ5MCwUuiQYlbVjlQw6H/ysl+rsWcBlwKirDKVeyYwx+aRHmGNmQrTJ3?=
 =?iso-8859-1?Q?ABPRFzfM8AOZknIfzTxN4N5uXUunCR5/xnvVwDZY9TW9sqX5VN2ukG50s3?=
 =?iso-8859-1?Q?nXRx5v4O+ELt3NPsE1jRb7g4CR7qmrummgGJX9wyS1RNxaFy+j1Qc1XNm5?=
 =?iso-8859-1?Q?x0cz19b2ajxq0+COzz0JEB16oBttKqQO+UsarV5hZjOqG1WvVWLcO9zNBc?=
 =?iso-8859-1?Q?Yr1PXYQIoBqE68BXGcgzkKmgAJ9knKfTBm2Qp8ZqqurseThuuTNbtQ0VSl?=
 =?iso-8859-1?Q?s0SBC4WNLoqaWluS2wElAWLVgKF51MXzpVAphBV8vSDBkSctu5kosW75iw?=
 =?iso-8859-1?Q?1YInibYV78UL/tMNleV0QqPR0m1pbKfgOgOQpEC5ekvay5R+7gpzu8PtFx?=
 =?iso-8859-1?Q?DQDaA3cNi1GRSyDGavpYJruvF5+T+XTwCsz7ircSgxpDmQKWF5f+uxBep3?=
 =?iso-8859-1?Q?6uYXgdJqMx5+yDQ/stSAQ1Vuelrz0WyrsgCCGFYEF3pcZSBnEw5XgVZmgY?=
 =?iso-8859-1?Q?x9qZwdSvtmYRbST2hAq7rlZ0JEdAKee/wGSeA/bwNV3YYSs1fjBvxPlJmD?=
 =?iso-8859-1?Q?L7NTBaqN2LgSpBRKJPmv9BpjFOoDzuuv76oJTvyM64Mu4B+Jy1gmRPg0cu?=
 =?iso-8859-1?Q?Q14reMZhm/tlXXvpZri5Qs/uB9cSHXOWrXFBLg8ZslF6Exf/YXako69mbB?=
 =?iso-8859-1?Q?3O+5ZhhFYTEcFKqRT8lUhS+2RZSmKKvS4pNNLvpkqyat9PdONZ0p5OYEld?=
 =?iso-8859-1?Q?8v9exojJU5O+QZSNlw4nxakyu4OEcnV2od6h8YY2XWbGfVbwKCm/TOjHH3?=
 =?iso-8859-1?Q?vdTXiWtxo//jNgfFRhmQl7BLJOZLgE1cd3NHhnajYlqgXhM/t5emrjMkju?=
 =?iso-8859-1?Q?9i6zYGzzzdU4YUFiQ0oRJ5bBSM7wieqIf7cT7jyD3mCjPrfzm1BcV6tMbp?=
 =?iso-8859-1?Q?1QhCYvX1xVK5R03FqYzBtoWBzYsFZk5br+ifSR/kkKnj/i503B7T8oItub?=
 =?iso-8859-1?Q?K1+kDy8UtYm/fhJQOjRHOk9EedEOCllgBZ8tXBaEwMw5sUS+WR4NnrqiAR?=
 =?iso-8859-1?Q?hOyOI3SCm3DzzIob1unSA1zUo5gDO9IdDMi8L7qxizYEnhgWTy9ltyt154?=
 =?iso-8859-1?Q?9h4zkdUVHtQqJqNMd/ko5xuF6BEkZGY/H8CucEne5ih/cnIiApZ9T1SomE?=
 =?iso-8859-1?Q?njHiggBnqrIhS1I7qWQRDAACbVwQYXI/Sqh60ypmMPmzr68DbLvTLwADsc?=
 =?iso-8859-1?Q?QS37+3VXu8HM2omfH6xXFJDz6qRICgSZSojbPZNO3ebCK8XeP9MB1WovEU?=
 =?iso-8859-1?Q?Vvc7pweOaPE0RXIhX/WSz3TCgMDAVLVAn0gOMZycGM3NGyKjrC9WTLlm/v?=
 =?iso-8859-1?Q?DW3nremDTA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7024288-95d4-4f56-74f7-08da3353e754
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 13:41:08.2408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o2u5LrCDcpH8aiVRpotltFW4eDJe/kMp28BVxq2uG44Kn10Dvrqt8iXwPtapjhqEIU8R9DJIrG1gvFMjWP7vAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5379
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

We may need your help on this one.  =


Peter and I have both replaced the pmufw.bin generated by the zynqmp-pmufw-=
builder with the one generated
by vitis or petalinux.  When we build the boot.bin using the pmufw.bin from=
 vitis or petalinux, reboot works
as expected without changing anything else.

So there appears to be something in the zynqmp-pmufw-builder which is incor=
rect for the pmufw 2022.1.

I am going through the build logs to try to find a difference.  Could you h=
ave a look as well?

Build log from zynqmp-pmufw-builder: (reboot fails on zcu106)
BSP directory already exists
Standalone directory already exists
avbuf directory already exists
canps directory already exists
csudma directory already exists
uartps directory already exists
ipipsu directory already exists
ttcps directory already exists
emacps directory already exists
iicps directory already exists
sdps directory already exists
qspipsu directory already exists
gpiops directory already exists
usbpsu directory already exists
wdtps directory already exists
sysmonpsu directory already exists
zdma directory already exists
dpdma directory already exists
dppsu directory already exists
video_common directory already exists
cpu directory already exists
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/avbuf/src'
cp *.h ../../../include
echo "Compiling avbuf"
Compiling avbuf
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xavbuf.o xavbuf.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xavbuf_clk.o xavbuf_clk.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xavbuf_videoformats.o xavbuf_videoformats.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-ar =
-r ../../../lib/libxil.a xavbuf.o xavbuf_clk.o xavbuf_videoformats.o
rm -rf xavbuf.o xavbuf_clk.o xavbuf_videoformats.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/avbuf/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/canps/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcanps_intr.c -o ../../../lib/xcanps_intr.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcanps_hw.c -o ../../../lib/xcanps_hw.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcanps_selftest.c -o ../../../lib/xcanps_selftest.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcanps_sinit.c -o ../../../lib/xcanps_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcanps.c -o ../../../lib/xcanps.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcanps_g.c -o ../../../lib/xcanps_g.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/canps/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/cpu/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xio.c -o ../../../lib/xio.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/cpu/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/csudma/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcsudma_intr.c -o ../../../lib/xcsudma_intr.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcsudma_selftest.c -o ../../../lib/xcsudma_selftest.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcsudma_sinit.c -o ../../../lib/xcsudma_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcsudma_g.c -o ../../../lib/xcsudma_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xcsudma.c -o ../../../lib/xcsudma.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/csudma/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/dpdma/src'
cp *.h ../../../include
echo "Compiling dpdma"
Compiling dpdma
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdpdma_g.o xdpdma_g.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdpdma_intr.o xdpdma_intr.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdpdma_sinit.o xdpdma_sinit.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdpdma.o xdpdma.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-ar =
-r ../../../lib/libxil.a xdpdma_g.o xdpdma_intr.o xdpdma_sinit.o xdpdma.o
rm -rf xdpdma_g.o xdpdma_intr.o xdpdma_sinit.o xdpdma.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/dpdma/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/dppsu/src'
cp *.h ../../../include
echo "Compiling dppsu"
Compiling dppsu
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdppsu_spm.o xdppsu_spm.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdppsu_g.o xdppsu_g.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdppsu_edid.o xdppsu_edid.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdppsu_serdes.o xdppsu_serdes.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdppsu_intr.o xdppsu_intr.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdppsu_selftest.o xdppsu_selftest.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdppsu_sinit.o xdppsu_sinit.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -o xdppsu.o xdppsu.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-ar =
-r ../../../lib/libxil.a xdppsu_spm.o xdppsu_g.o xdppsu_edid.o xdppsu_serde=
s.o xdppsu_intr.o xdppsu_selftest.o xdppsu_sinit.o xdppsu.o
rm -rf xdppsu_spm.o xdppsu_g.o xdppsu_edid.o xdppsu_serdes.o xdppsu_intr.o =
xdppsu_selftest.o xdppsu_sinit.o xdppsu.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/dppsu/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/emacps/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xemacps_hw.c -o ../../../lib/xemacps_hw.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xemacps_bdring.c -o ../../../lib/xemacps_bdring.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xemacps_control.c -o ../../../lib/xemacps_control.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xemacps_intr.c -o ../../../lib/xemacps_intr.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xemacps_sinit.c -o ../../../lib/xemacps_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xemacps_g.c -o ../../../lib/xemacps_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xemacps.c -o ../../../lib/xemacps.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/emacps/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/gpiops/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xgpiops.c -o ../../../lib/xgpiops.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xgpiops_intr.c -o ../../../lib/xgpiops_intr.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xgpiops_g.c -o ../../../lib/xgpiops_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xgpiops_selftest.c -o ../../../lib/xgpiops_selftest.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xgpiops_sinit.c -o ../../../lib/xgpiops_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xgpiops_hw.c -o ../../../lib/xgpiops_hw.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/gpiops/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/iicps/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xiicps_g.c -o ../../../lib/xiicps_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xiicps.c -o ../../../lib/xiicps.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xiicps_options.c -o ../../../lib/xiicps_options.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xiicps_xfer.c -o ../../../lib/xiicps_xfer.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xiicps_slave.c -o ../../../lib/xiicps_slave.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xiicps_hw.c -o ../../../lib/xiicps_hw.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xiicps_master.c -o ../../../lib/xiicps_master.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xiicps_intr.c -o ../../../lib/xiicps_intr.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xiicps_selftest.c -o ../../../lib/xiicps_selftest.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xiicps_sinit.c -o ../../../lib/xiicps_sinit.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/iicps/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/ipipsu/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xipipsu_g.c -o ../../../lib/xipipsu_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xipipsu_sinit.c -o ../../../lib/xipipsu_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xipipsu.c -o ../../../lib/xipipsu.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xipipsu_buf.c -o ../../../lib/xipipsu_buf.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/ipipsu/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/qspipsu/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xqspipsu_options.c -o ../../../lib/xqspipsu_options.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xqspipsu_g.c -o ../../../lib/xqspipsu_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xqspipsu_control.c -o ../../../lib/xqspipsu_control.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xqspipsu_sinit.c -o ../../../lib/xqspipsu_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xqspipsu_hw.c -o ../../../lib/xqspipsu_hw.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xqspipsu.c -o ../../../lib/xqspipsu.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/qspipsu/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/sdps/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsdps_host.c -o ../../../lib/xsdps_host.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsdps_sinit.c -o ../../../lib/xsdps_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsdps.c -o ../../../lib/xsdps.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsdps_g.c -o ../../../lib/xsdps_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsdps_card.c -o ../../../lib/xsdps_card.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsdps_options.c -o ../../../lib/xsdps_options.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/sdps/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/standalone/src'
make -C profile COMPILER_FLAGS=3D"-O2 -c" EXTRA_COMPILER_FLAGS=3D"-g -Wall =
-Wextra -Os -flto -ffat-lto-objects" COMPILER=3D"/home/nealf/x-tools/microb=
lazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc" ARCHIVER=3D"/home/nealf/=
x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-ar" AS=3D"/home=
/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-as" incl=
ude
make[1]: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/z=
ynqmp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/standalone/src/profile'
cp -rf profile.h mblaze_nt_types.h _profile_timer_hw.h ../../../../include
make[1]: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zy=
nqmp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/standalone/src/profile'
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/inbyte.o inbyte.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/print.o print.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xplatform_info.o xplatform_info.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/fcntl.o fcntl.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/microblaze_sleep.o microblaze_sleep.c
microblaze_sleep.c:73:9: note: '#pragma message: For the sleep routines, as=
sembly instructions are used'
   73 | #pragma message ("For the sleep routines, assembly instructions are=
 used")
      |         ^~~~~~~
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_cache.o xil_cache.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/microblaze_interrupts_g.o microblaze_interrupts_g.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_printf.o xil_printf.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_sleepcommon.o xil_sleepcommon.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/outbyte.o outbyte.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_misc_psreset_api.o xil_misc_psreset_api.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_assert.o xil_assert.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/_exit.o _exit.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_exception.o xil_exception.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_testmem.o xil_testmem.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/pvr.o pvr.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_mem.o xil_mem.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/microblaze_exception_handler.o microblaze_exception_=
handler.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_testio.o xil_testio.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/errno.o errno.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_testcache.o xil_testcache.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/  -o ../../../lib/xil_util.o xil_util.c
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_update_icache.o microblaze_update_icache=
.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_selftest.o microblaze_selftest.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_invalidate_cache_ext.o microblaze_invali=
date_cache_ext.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_flush_dcache_range.o microblaze_flush_dc=
ache_range.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_invalidate_icache.o microblaze_invalidat=
e_icache.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/hw_exception_handler.o hw_exception_handler.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_disable_dcache.o microblaze_disable_dcac=
he.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_update_dcache.o microblaze_update_dcache=
.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_disable_exceptions.o microblaze_disable_=
exceptions.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_disable_interrupts.o microblaze_disable_=
interrupts.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_init_icache_range.o microblaze_init_icac=
he_range.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_invalidate_icache_range.o microblaze_inv=
alidate_icache_range.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_enable_icache.o microblaze_enable_icache=
.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_flush_cache_ext_range.o microblaze_flush=
_cache_ext_range.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_scrub.o microblaze_scrub.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_flush_dcache.o microblaze_flush_dcache.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_invalidate_dcache_range.o microblaze_inv=
alidate_dcache_range.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_invalidate_cache_ext_range.o microblaze_=
invalidate_cache_ext_range.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_disable_icache.o microblaze_disable_icac=
he.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_invalidate_dcache.o microblaze_invalidat=
e_dcache.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_init_dcache_range.o microblaze_init_dcac=
he_range.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_enable_interrupts.o microblaze_enable_in=
terrupts.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_enable_dcache.o microblaze_enable_dcache=
.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_flush_cache_ext.o microblaze_flush_cache=
_ext.S
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inc=
lude/   -o ../../../lib/microblaze_enable_exceptions.o microblaze_enable_ex=
ceptions.S
echo "DEBUG NON_LTO_OBJECTS is ../../../lib/microblaze_interrupt_handler.o"
DEBUG NON_LTO_OBJECTS is ../../../lib/microblaze_interrupt_handler.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
  -O2 -c  -g -Wall -Wextra -Os   -I./. -I../../../include/   -o ../../../li=
b/microblaze_interrupt_handler.o microblaze_interrupt_handler.c
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/standalone/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/sysmonpsu/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsysmonpsu_intr.c -o ../../../lib/xsysmonpsu_intr.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsysmonpsu_selftest.c -o ../../../lib/xsysmonpsu_selftest.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsysmonpsu_sinit.c -o ../../../lib/xsysmonpsu_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsysmonpsu.c -o ../../../lib/xsysmonpsu.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xsysmonpsu_g.c -o ../../../lib/xsysmonpsu_g.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/sysmonpsu/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/ttcps/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xttcps_options.c -o ../../../lib/xttcps_options.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xttcps_g.c -o ../../../lib/xttcps_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xttcps_selftest.c -o ../../../lib/xttcps_selftest.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xttcps_sinit.c -o ../../../lib/xttcps_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xttcps.c -o ../../../lib/xttcps.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/ttcps/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/uartps/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xuartps_g.c -o ../../../lib/xuartps_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xuartps_selftest.c -o ../../../lib/xuartps_selftest.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xuartps.c -o ../../../lib/xuartps.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xuartps_hw.c -o ../../../lib/xuartps_hw.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xuartps_sinit.c -o ../../../lib/xuartps_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xuartps_options.c -o ../../../lib/xuartps_options.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xuartps_intr.c -o ../../../lib/xuartps_intr.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/uartps/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/usbpsu/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_hibernation.c -o ../../../lib/xusbpsu_hibernation.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_device.c -o ../../../lib/xusbpsu_device.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu.c -o ../../../lib/xusbpsu.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_event.c -o ../../../lib/xusbpsu_event.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_command.c -o ../../../lib/xusbpsu_command.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_intr.c -o ../../../lib/xusbpsu_intr.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_ephandler.c -o ../../../lib/xusbpsu_ephandler.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_sinit.c -o ../../../lib/xusbpsu_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_endpoint.c -o ../../../lib/xusbpsu_endpoint.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_controltransfers.c -o ../../../lib/xusbpsu_controltransfers.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_g.c -o ../../../lib/xusbpsu_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xusbpsu_ep0handler.c -o ../../../lib/xusbpsu_ep0handler.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/usbpsu/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/video_common/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xvidc_parse_edid.c -o ../../../lib/xvidc_parse_edid.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xvidc_edid.c -o ../../../lib/xvidc_edid.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xvidc_edid_ext.c -o ../../../lib/xvidc_edid_ext.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xvidc_timings_table.c -o ../../../lib/xvidc_timings_table.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xvidc.c -o ../../../lib/xvidc.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/video_common/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/wdtps/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xwdtps_sinit.c -o ../../../lib/xwdtps_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xwdtps_g.c -o ../../../lib/xwdtps_g.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xwdtps.c -o ../../../lib/xwdtps.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xwdtps_selftest.c -o ../../../lib/xwdtps_selftest.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/wdtps/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/xilfpga/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  -DXFPGA_SECURE_MODE_VAL=3D1 -o xilfpga_pcap.o xilfpga_pcap.c
In file included from xilfpga_pcap.c:127:
xilfpga.h:266:9: note: '#pragma message: From 2023.1 release onwards the Xi=
lFPGA BSP user configuration  flags 'reg_readback_en' and  'data_readback_e=
n' will be disabled by default but users can still be able to enable these =
flags as needed'
  266 | #pragma message ("From 2023.1 release onwards the XilFPGA BSP user =
configuration  flags 'reg_readback_en' and  'data_readback_en' will be disa=
bled by default but users can still be able to enable these flags as needed=
")
      |         ^~~~~~~
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  -DXFPGA_SECURE_MODE_VAL=3D1 -o xilfpga.o xilfpga.c
In file included from xilfpga.c:74:
xilfpga.h:266:9: note: '#pragma message: From 2023.1 release onwards the Xi=
lFPGA BSP user configuration  flags 'reg_readback_en' and  'data_readback_e=
n' will be disabled by default but users can still be able to enable these =
flags as needed'
  266 | #pragma message ("From 2023.1 release onwards the XilFPGA BSP user =
configuration  flags 'reg_readback_en' and  'data_readback_en' will be disa=
bled by default but users can still be able to enable these flags as needed=
")
      |         ^~~~~~~
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-ar =
rc ../../../lib//libxilfpga.a ./xilfpga_pcap.o ./xilfpga.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/xilfpga/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/xilsecure/src'
cp xsecure_rsa_hw.h xsecure_sha.h xsecure_sss.h xsecure_sha_hw.h xsecure_ut=
ils.h xsecure_aes.h xsecure.h xsecure_aes_hw.h xsecure_cryptochk.h xsecure_=
rsa.h xsecure_rsa_core.h ../../../include
Compiling XilSecure Library
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -Wall -Wextra -Warray-=
bounds=3D2 -Wformat=3D2 -Wno-main -Wimplicit-function-declaration -Wmissing=
-prototypes -Wmissing-braces -Wmultistatement-macros -Wparentheses -Wreturn=
-type -Wsequence-point -Wbool-compare -Wbool-operation -Wchar-subscripts -W=
enum-compare -Winit-self -fno-strict-aliasing -Wtautological-compare -Wunin=
itialized -Wunused-function -Wunused-label -Wunused-variable -Wcast-functio=
n-type -Wenum-conversion -Wmissing-parameter-type -Wtype-limits -Wshift-neg=
ative-value -Wshadow -Wdouble-promotion -Wundef -fno-common -Wconversion -W=
null-dereference -Wmissing-include-dirs -Wswitch-default -Wswitch-enum -Wsw=
itch-bool -Wshift-overflow=3D2 -Wswitch-outside-range -Wswitch-unreachable =
-Wunused-parameter -Wduplicated-branches -Wduplicated-cond -Wdiv-by-zero -W=
shadow=3Dlocal -Wpointer-arith -Wunused-macros -Wconversion -Wdangling-else=
 -Wlogical-op -Waggressive-loop-optimizations -Wstrict-prototypes -Woverflo=
w -Wredundant-decls -Wvla -I./. -I../../../include -c xsecure_utils.c -o xs=
ecure_utils.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -Wall -Wextra -Warray-=
bounds=3D2 -Wformat=3D2 -Wno-main -Wimplicit-function-declaration -Wmissing=
-prototypes -Wmissing-braces -Wmultistatement-macros -Wparentheses -Wreturn=
-type -Wsequence-point -Wbool-compare -Wbool-operation -Wchar-subscripts -W=
enum-compare -Winit-self -fno-strict-aliasing -Wtautological-compare -Wunin=
itialized -Wunused-function -Wunused-label -Wunused-variable -Wcast-functio=
n-type -Wenum-conversion -Wmissing-parameter-type -Wtype-limits -Wshift-neg=
ative-value -Wshadow -Wdouble-promotion -Wundef -fno-common -Wconversion -W=
null-dereference -Wmissing-include-dirs -Wswitch-default -Wswitch-enum -Wsw=
itch-bool -Wshift-overflow=3D2 -Wswitch-outside-range -Wswitch-unreachable =
-Wunused-parameter -Wduplicated-branches -Wduplicated-cond -Wdiv-by-zero -W=
shadow=3Dlocal -Wpointer-arith -Wunused-macros -Wconversion -Wdangling-else=
 -Wlogical-op -Waggressive-loop-optimizations -Wstrict-prototypes -Woverflo=
w -Wredundant-decls -Wvla -I./. -I../../../include -c xsecure_rsa_core.c -o=
 xsecure_rsa_core.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -Wall -Wextra -Warray-=
bounds=3D2 -Wformat=3D2 -Wno-main -Wimplicit-function-declaration -Wmissing=
-prototypes -Wmissing-braces -Wmultistatement-macros -Wparentheses -Wreturn=
-type -Wsequence-point -Wbool-compare -Wbool-operation -Wchar-subscripts -W=
enum-compare -Winit-self -fno-strict-aliasing -Wtautological-compare -Wunin=
itialized -Wunused-function -Wunused-label -Wunused-variable -Wcast-functio=
n-type -Wenum-conversion -Wmissing-parameter-type -Wtype-limits -Wshift-neg=
ative-value -Wshadow -Wdouble-promotion -Wundef -fno-common -Wconversion -W=
null-dereference -Wmissing-include-dirs -Wswitch-default -Wswitch-enum -Wsw=
itch-bool -Wshift-overflow=3D2 -Wswitch-outside-range -Wswitch-unreachable =
-Wunused-parameter -Wduplicated-branches -Wduplicated-cond -Wdiv-by-zero -W=
shadow=3Dlocal -Wpointer-arith -Wunused-macros -Wconversion -Wdangling-else=
 -Wlogical-op -Waggressive-loop-optimizations -Wstrict-prototypes -Woverflo=
w -Wredundant-decls -Wvla -I./. -I../../../include -c xsecure_sha.c -o xsec=
ure_sha.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -Wall -Wextra -Warray-=
bounds=3D2 -Wformat=3D2 -Wno-main -Wimplicit-function-declaration -Wmissing=
-prototypes -Wmissing-braces -Wmultistatement-macros -Wparentheses -Wreturn=
-type -Wsequence-point -Wbool-compare -Wbool-operation -Wchar-subscripts -W=
enum-compare -Winit-self -fno-strict-aliasing -Wtautological-compare -Wunin=
itialized -Wunused-function -Wunused-label -Wunused-variable -Wcast-functio=
n-type -Wenum-conversion -Wmissing-parameter-type -Wtype-limits -Wshift-neg=
ative-value -Wshadow -Wdouble-promotion -Wundef -fno-common -Wconversion -W=
null-dereference -Wmissing-include-dirs -Wswitch-default -Wswitch-enum -Wsw=
itch-bool -Wshift-overflow=3D2 -Wswitch-outside-range -Wswitch-unreachable =
-Wunused-parameter -Wduplicated-branches -Wduplicated-cond -Wdiv-by-zero -W=
shadow=3Dlocal -Wpointer-arith -Wunused-macros -Wconversion -Wdangling-else=
 -Wlogical-op -Waggressive-loop-optimizations -Wstrict-prototypes -Woverflo=
w -Wredundant-decls -Wvla -I./. -I../../../include -c xsecure_sss.c -o xsec=
ure_sss.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -Wall -Wextra -Warray-=
bounds=3D2 -Wformat=3D2 -Wno-main -Wimplicit-function-declaration -Wmissing=
-prototypes -Wmissing-braces -Wmultistatement-macros -Wparentheses -Wreturn=
-type -Wsequence-point -Wbool-compare -Wbool-operation -Wchar-subscripts -W=
enum-compare -Winit-self -fno-strict-aliasing -Wtautological-compare -Wunin=
itialized -Wunused-function -Wunused-label -Wunused-variable -Wcast-functio=
n-type -Wenum-conversion -Wmissing-parameter-type -Wtype-limits -Wshift-neg=
ative-value -Wshadow -Wdouble-promotion -Wundef -fno-common -Wconversion -W=
null-dereference -Wmissing-include-dirs -Wswitch-default -Wswitch-enum -Wsw=
itch-bool -Wshift-overflow=3D2 -Wswitch-outside-range -Wswitch-unreachable =
-Wunused-parameter -Wduplicated-branches -Wduplicated-cond -Wdiv-by-zero -W=
shadow=3Dlocal -Wpointer-arith -Wunused-macros -Wconversion -Wdangling-else=
 -Wlogical-op -Waggressive-loop-optimizations -Wstrict-prototypes -Woverflo=
w -Wredundant-decls -Wvla -I./. -I../../../include -c xsecure_aes.c -o xsec=
ure_aes.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -Wall -Wextra -Warray-=
bounds=3D2 -Wformat=3D2 -Wno-main -Wimplicit-function-declaration -Wmissing=
-prototypes -Wmissing-braces -Wmultistatement-macros -Wparentheses -Wreturn=
-type -Wsequence-point -Wbool-compare -Wbool-operation -Wchar-subscripts -W=
enum-compare -Winit-self -fno-strict-aliasing -Wtautological-compare -Wunin=
itialized -Wunused-function -Wunused-label -Wunused-variable -Wcast-functio=
n-type -Wenum-conversion -Wmissing-parameter-type -Wtype-limits -Wshift-neg=
ative-value -Wshadow -Wdouble-promotion -Wundef -fno-common -Wconversion -W=
null-dereference -Wmissing-include-dirs -Wswitch-default -Wswitch-enum -Wsw=
itch-bool -Wshift-overflow=3D2 -Wswitch-outside-range -Wswitch-unreachable =
-Wunused-parameter -Wduplicated-branches -Wduplicated-cond -Wdiv-by-zero -W=
shadow=3Dlocal -Wpointer-arith -Wunused-macros -Wconversion -Wdangling-else=
 -Wlogical-op -Waggressive-loop-optimizations -Wstrict-prototypes -Woverflo=
w -Wredundant-decls -Wvla -I./. -I../../../include -c xsecure.c -o xsecure.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -Wall -Wextra -Warray-=
bounds=3D2 -Wformat=3D2 -Wno-main -Wimplicit-function-declaration -Wmissing=
-prototypes -Wmissing-braces -Wmultistatement-macros -Wparentheses -Wreturn=
-type -Wsequence-point -Wbool-compare -Wbool-operation -Wchar-subscripts -W=
enum-compare -Winit-self -fno-strict-aliasing -Wtautological-compare -Wunin=
itialized -Wunused-function -Wunused-label -Wunused-variable -Wcast-functio=
n-type -Wenum-conversion -Wmissing-parameter-type -Wtype-limits -Wshift-neg=
ative-value -Wshadow -Wdouble-promotion -Wundef -fno-common -Wconversion -W=
null-dereference -Wmissing-include-dirs -Wswitch-default -Wswitch-enum -Wsw=
itch-bool -Wshift-overflow=3D2 -Wswitch-outside-range -Wswitch-unreachable =
-Wunused-parameter -Wduplicated-branches -Wduplicated-cond -Wdiv-by-zero -W=
shadow=3Dlocal -Wpointer-arith -Wunused-macros -Wconversion -Wdangling-else=
 -Wlogical-op -Waggressive-loop-optimizations -Wstrict-prototypes -Woverflo=
w -Wredundant-decls -Wvla -I./. -I../../../include -c xsecure_cryptochk.c -=
o xsecure_cryptochk.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -Wall -Wextra -Warray-=
bounds=3D2 -Wformat=3D2 -Wno-main -Wimplicit-function-declaration -Wmissing=
-prototypes -Wmissing-braces -Wmultistatement-macros -Wparentheses -Wreturn=
-type -Wsequence-point -Wbool-compare -Wbool-operation -Wchar-subscripts -W=
enum-compare -Winit-self -fno-strict-aliasing -Wtautological-compare -Wunin=
itialized -Wunused-function -Wunused-label -Wunused-variable -Wcast-functio=
n-type -Wenum-conversion -Wmissing-parameter-type -Wtype-limits -Wshift-neg=
ative-value -Wshadow -Wdouble-promotion -Wundef -fno-common -Wconversion -W=
null-dereference -Wmissing-include-dirs -Wswitch-default -Wswitch-enum -Wsw=
itch-bool -Wshift-overflow=3D2 -Wswitch-outside-range -Wswitch-unreachable =
-Wunused-parameter -Wduplicated-branches -Wduplicated-cond -Wdiv-by-zero -W=
shadow=3Dlocal -Wpointer-arith -Wunused-macros -Wconversion -Wdangling-else=
 -Wlogical-op -Waggressive-loop-optimizations -Wstrict-prototypes -Woverflo=
w -Wredundant-decls -Wvla -I./. -I../../../include -c xsecure_rsa.c -o xsec=
ure_rsa.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-ar =
rc ../../../lib/libxilsecure.a ./xsecure_utils.o ./xsecure_rsa_core.o ./xse=
cure_sha.o ./xsecure_sss.o ./xsecure_aes.o ./xsecure.o ./xsecure_cryptochk.=
o ./xsecure_rsa.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/xilsecure/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/xilskey/src'
cp xilskey_bbramps_zynqmp_hw.h xilskey_eps_zynqmp_hw.h ../../../include
Compiling Xilskey Library
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -c xilskey_eps_zynqmp_puf.c -o xilskey_eps_zynqmp_puf.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -c xilskey_utils.c -o xilskey_utils.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de -c xilskey_eps_zynqmp.c -o xilskey_eps_zynqmp.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-ar =
rc ../../../lib/libxilskey.a ./xilskey_eps_zynqmp_puf.o ./xilskey_utils.o .=
/xilskey_eps_zynqmp.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/xilskey/src'
make: Entering directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynq=
mp_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/zdma/src'
make: Nothing to be done for 'include'.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xzdma_intr.c -o ../../../lib/xzdma_intr.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xzdma_selftest.c -o ../../../lib/xzdma_selftest.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xzdma_sinit.c -o ../../../lib/xzdma_sinit.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xzdma.c -o ../../../lib/xzdma.o
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -O2 -c -g -Wall -Wextra -Os -flto -ffat-lto-objects -I./. -I../../../inclu=
de/  xzdma_g.c -o ../../../lib/xzdma_g.o
make: Leaving directory '/zynqmp-pmufw-builder/embeddedsw/lib/sw_apps/zynqm=
p_pmufw/misc/zynqmp_pmufw_bsp/psu_pmu_0/libsrc/zdma/src'
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_interrupts.c -o xpfw_interrupts.o -I../misc/=
zynqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_mmio_access.c -o pm_mmio_access.o -I../misc/zy=
nqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_system.c -o pm_system.o -I../misc/zynqmp_pmufw=
_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_scheduler.c -o xpfw_scheduler.o -I../misc/zy=
nqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_gic_proxy.c -o pm_gic_proxy.o -I../misc/zynqmp=
_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_aib.c -o xpfw_aib.o -I../misc/zynqmp_pmufw_b=
sp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_events.c -o xpfw_events.o -I../misc/zynqmp_p=
mufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_pinctrl.c -o pm_pinctrl.o -I../misc/zynqmp_pmu=
fw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_ddr.c -o pm_ddr.o -I../misc/zynqmp_pmufw_bsp/p=
su_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_sram.c -o pm_sram.o -I../misc/zynqmp_pmufw_bsp=
/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_user_startup.c -o xpfw_user_startup.o -I../m=
isc/zynqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_wdt.c -o xpfw_mod_wdt.o -I../misc/zynqmp=
_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_proc.c -o pm_proc.o -I../misc/zynqmp_pmufw_bsp=
/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_reset.c -o pm_reset.o -I../misc/zynqmp_pmufw_b=
sp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_dap.c -o xpfw_mod_dap.o -I../misc/zynqmp=
_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_platform.c -o xpfw_platform.o -I../misc/zynq=
mp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_node.c -o pm_node.o -I../misc/zynqmp_pmufw_bsp=
/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_common.c -o xpfw_mod_common.o -I../misc/=
zynqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_usb.c -o pm_usb.o -I../misc/zynqmp_pmufw_bsp/p=
su_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_sched.c -o xpfw_mod_sched.o -I../misc/zy=
nqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_ultra96.c -o xpfw_mod_ultra96.o -I../mis=
c/zynqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_ipi_manager.c -o xpfw_ipi_manager.o -I../mis=
c/zynqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_master.c -o pm_master.o -I../misc/zynqmp_pmufw=
_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_ioctl.c -o pm_ioctl.o -I../misc/zynqmp_pmufw_b=
sp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_error_manager.c -o xpfw_error_manager.o -I..=
/misc/zynqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_restart.c -o xpfw_restart.o -I../misc/zynqmp=
_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_module.c -o xpfw_module.o -I../misc/zynqmp_p=
mufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_notifier.c -o pm_notifier.o -I../misc/zynqmp_p=
mufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_requirement.c -o pm_requirement.o -I../misc/zy=
nqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_core.c -o pm_core.o -I../misc/zynqmp_pmufw_bsp=
/psu_pmu_0/include -I.
In file included from pm_core.c:27:
../misc/zynqmp_pmufw_bsp/psu_pmu_0/include/xilfpga.h:266:9: note: '#pragma =
message: From 2023.1 release onwards the XilFPGA BSP user configuration  fl=
ags 'reg_readback_en' and  'data_readback_en' will be disabled by default b=
ut users can still be able to enable these flags as needed'
  266 | #pragma message ("From 2023.1 release onwards the XilFPGA BSP user =
configuration  flags 'reg_readback_en' and  'data_readback_en' will be disa=
bled by default but users can still be able to enable these flags as needed=
")
      |         ^~~~~~~
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_config.c -o pm_config.o -I../misc/zynqmp_pmufw=
_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_xpu.c -o xpfw_xpu.o -I../misc/zynqmp_pmufw_b=
sp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_overtemp.c -o xpfw_mod_overtemp.o -I../m=
isc/zynqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_binding.c -o pm_binding.o -I../misc/zynqmp_pmu=
fw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_slave.c -o pm_slave.o -I../misc/zynqmp_pmufw_b=
sp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_pm.c -o xpfw_mod_pm.o -I../misc/zynqmp_p=
mufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_qspi.c -o pm_qspi.o -I../misc/zynqmp_pmufw_bsp=
/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_resets.c -o xpfw_resets.o -I../misc/zynqmp_p=
mufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_util.c -o xpfw_util.o -I../misc/zynqmp_pmufw=
_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_rtc.c -o xpfw_mod_rtc.o -I../misc/zynqmp=
_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_rom_interface.c -o xpfw_rom_interface.o -I..=
/misc/zynqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_node_reset.c -o pm_node_reset.o -I../misc/zynq=
mp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_callbacks.c -o pm_callbacks.o -I../misc/zynqmp=
_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_stl.c -o xpfw_mod_stl.o -I../misc/zynqmp=
_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_extwdt.c -o xpfw_mod_extwdt.o -I../misc/=
zynqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_extern.c -o pm_extern.o -I../misc/zynqmp_pmufw=
_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_clock.c -o pm_clock.o -I../misc/zynqmp_pmufw_b=
sp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_core.c -o xpfw_core.o -I../misc/zynqmp_pmufw=
_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c idle_hooks.c -o idle_hooks.o -I../misc/zynqmp_pmu=
fw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_pll.c -o pm_pll.o -I../misc/zynqmp_pmufw_bsp/p=
su_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_periph.c -o pm_periph.o -I../misc/zynqmp_pmufw=
_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_hooks.c -o pm_hooks.o -I../misc/zynqmp_pmufw_b=
sp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_gpp.c -o pm_gpp.o -I../misc/zynqmp_pmufw_bsp/p=
su_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_rpu.c -o xpfw_mod_rpu.o -I../misc/zynqmp=
_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_power.c -o pm_power.o -I../misc/zynqmp_pmufw_b=
sp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_main.c -o xpfw_main.o -I../misc/zynqmp_pmufw=
_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_em.c -o xpfw_mod_em.o -I../misc/zynqmp_p=
mufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c pm_csudma.c -o pm_csudma.o -I../misc/zynqmp_pmufw=
_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift -mxl-pat=
tern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-div -Os -=
flto -ffat-lto-objects -c xpfw_mod_legacy.c -o xpfw_mod_legacy.o -I../misc/=
zynqmp_pmufw_bsp/psu_pmu_0/include -I.
/home/nealf/x-tools/microblazeel-xilinx-elf/bin/microblazeel-xilinx-elf-gcc=
 -o executable.elf  xpfw_interrupts.o  pm_mmio_access.o  pm_system.o  xpfw_=
scheduler.o  pm_gic_proxy.o  xpfw_aib.o  xpfw_events.o  pm_pinctrl.o  pm_dd=
r.o  pm_sram.o  xpfw_user_startup.o  xpfw_mod_wdt.o  pm_proc.o  pm_reset.o =
 xpfw_mod_dap.o  xpfw_platform.o  pm_node.o  xpfw_mod_common.o  pm_usb.o  x=
pfw_mod_sched.o  xpfw_mod_ultra96.o  xpfw_ipi_manager.o  pm_master.o  pm_io=
ctl.o  xpfw_error_manager.o  xpfw_restart.o  xpfw_module.o  pm_notifier.o  =
pm_requirement.o  pm_core.o  pm_config.o  xpfw_xpu.o  xpfw_mod_overtemp.o  =
pm_binding.o  pm_slave.o  xpfw_mod_pm.o  pm_qspi.o  xpfw_resets.o  xpfw_uti=
l.o  xpfw_mod_rtc.o  xpfw_rom_interface.o  pm_node_reset.o  pm_callbacks.o =
 xpfw_mod_stl.o  xpfw_mod_extwdt.o  pm_extern.o  pm_clock.o  xpfw_core.o  i=
dle_hooks.o  pm_pll.o  pm_periph.o  pm_hooks.o  pm_gpp.o  xpfw_mod_rpu.o  p=
m_power.o  xpfw_main.o  xpfw_mod_em.o  pm_csudma.o  xpfw_mod_legacy.o  xpfw=
_start.o  -MMD -MP -Wno-stringop-overflow -mlittle-endian -mxl-barrel-shift=
 -mxl-pattern-compare -mno-xl-reorder -mcpu=3Dv9.2 -mxl-soft-mul -mxl-soft-=
div -Os -flto -ffat-lto-objects -Wl,--start-group,-lxil,-lgcc,-lc,--end-gro=
up -Wl,--start-group,-lxilfpga,-lxilsecure,-lxilskey,-lxil,-lgcc,-lc,--end-=
group -nostartfiles -Wl,--gc-sections -L../misc/zynqmp_pmufw_bsp/psu_pmu_0/=
lib -Tlscript.ld


Build log from Vitis: (reboot works on zcu106)
make all =

Building file: ../src/idle_hooks.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/idle_hooks.o" -Os -flt=
o -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zc=
u106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlitt=
le-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul=
 -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/idle_h=
ooks.d" -MT"src/idle_hooks.o" -o "src/idle_hooks.o" "../src/idle_hooks.c"
Finished building: ../src/idle_hooks.c
 =

Building file: ../src/pm_binding.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_binding.o" -Os -flt=
o -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zc=
u106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlitt=
le-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul=
 -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_bin=
ding.d" -MT"src/pm_binding.o" -o "src/pm_binding.o" "../src/pm_binding.c"
Finished building: ../src/pm_binding.c
 =

Building file: ../src/pm_callbacks.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_callbacks.o" -Os -f=
lto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/=
zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mli=
ttle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-m=
ul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_c=
allbacks.d" -MT"src/pm_callbacks.o" -o "src/pm_callbacks.o" "../src/pm_call=
backs.c"
Finished building: ../src/pm_callbacks.c
 =

Building file: ../src/pm_clock.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_clock.o" -Os -flto =
-ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu1=
06/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle=
-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -=
Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_clock=
.d" -MT"src/pm_clock.o" -o "src/pm_clock.o" "../src/pm_clock.c"
Finished building: ../src/pm_clock.c
 =

Building file: ../src/pm_config.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_config.o" -Os -flto=
 -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu=
106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittl=
e-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul =
-Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_conf=
ig.d" -MT"src/pm_config.o" -o "src/pm_config.o" "../src/pm_config.c"
Finished building: ../src/pm_config.c
 =

Building file: ../src/pm_core.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_core.o" -Os -flto -=
ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu10=
6/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle-=
endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -W=
l,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_core.d=
" -MT"src/pm_core.o" -o "src/pm_core.o" "../src/pm_core.c"
In file included from ../src/pm_core.c:27:
/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu106/export/zcu106/sw/=
zcu106/standalone_psu_pmu_0/bspinclude/include/xilfpga.h:266:9: note: '#pra=
gma message: From 2023.1 release onwards the XilFPGA BSP user configuration=
  flags 'reg_readback_en' and  'data_readback_en' will be disabled by defau=
lt but users can still be able to enable these flags as needed'
  266 | #pragma message ("From 2023.1 release onwards the XilFPGA BSP user =
configuration  flags 'reg_readback_en' and  'data_readback_en' will be disa=
bled by default but users can still be able to enable these flags as needed=
")
      |         ^~~~~~~
../src/pm_core.c: In function 'PmSecureAes':
../src/pm_core.c:1136:34: warning: 'InstancePtr' may be used uninitialized =
[-Wmaybe-uninitialized]
 1136 |                         Status =3D XilSKey_Puf_Regeneration(&Instan=
cePtr);
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
In file included from ../src/pm_core.c:41:
/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu106/export/zcu106/sw/=
zcu106/standalone_psu_pmu_0/bspinclude/include/xilskey_eps_zynqmp_puf.h:144=
:5: note: by argument 1 of type 'const struct XilSKey_Puf *' to 'XilSKey_Pu=
f_Regeneration' declared here
  144 | u32 XilSKey_Puf_Regeneration(const XilSKey_Puf *InstancePtr);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
../src/pm_core.c:1123:21: note: 'InstancePtr' declared here
 1123 |         XilSKey_Puf InstancePtr;
      |                     ^~~~~~~~~~~
Finished building: ../src/pm_core.c
 =

Building file: ../src/pm_csudma.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_csudma.o" -Os -flto=
 -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu=
106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittl=
e-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul =
-Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_csud=
ma.d" -MT"src/pm_csudma.o" -o "src/pm_csudma.o" "../src/pm_csudma.c"
Finished building: ../src/pm_csudma.c
 =

Building file: ../src/pm_ddr.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_ddr.o" -Os -flto -f=
fat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu106=
/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle-e=
ndian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -Wl=
,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_ddr.d" =
-MT"src/pm_ddr.o" -o "src/pm_ddr.o" "../src/pm_ddr.c"
Finished building: ../src/pm_ddr.c
 =

Building file: ../src/pm_extern.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_extern.o" -Os -flto=
 -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu=
106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittl=
e-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul =
-Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_exte=
rn.d" -MT"src/pm_extern.o" -o "src/pm_extern.o" "../src/pm_extern.c"
Finished building: ../src/pm_extern.c
 =

Building file: ../src/pm_gic_proxy.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_gic_proxy.o" -Os -f=
lto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/=
zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mli=
ttle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-m=
ul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_g=
ic_proxy.d" -MT"src/pm_gic_proxy.o" -o "src/pm_gic_proxy.o" "../src/pm_gic_=
proxy.c"
Finished building: ../src/pm_gic_proxy.c
 =

Building file: ../src/pm_gpp.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_gpp.o" -Os -flto -f=
fat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu106=
/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle-e=
ndian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -Wl=
,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_gpp.d" =
-MT"src/pm_gpp.o" -o "src/pm_gpp.o" "../src/pm_gpp.c"
Finished building: ../src/pm_gpp.c
 =

Building file: ../src/pm_hooks.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_hooks.o" -Os -flto =
-ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu1=
06/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle=
-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -=
Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_hooks=
.d" -MT"src/pm_hooks.o" -o "src/pm_hooks.o" "../src/pm_hooks.c"
Finished building: ../src/pm_hooks.c
 =

Building file: ../src/pm_ioctl.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_ioctl.o" -Os -flto =
-ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu1=
06/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle=
-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -=
Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_ioctl=
.d" -MT"src/pm_ioctl.o" -o "src/pm_ioctl.o" "../src/pm_ioctl.c"
Finished building: ../src/pm_ioctl.c
 =

Building file: ../src/pm_master.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_master.o" -Os -flto=
 -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu=
106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittl=
e-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul =
-Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_mast=
er.d" -MT"src/pm_master.o" -o "src/pm_master.o" "../src/pm_master.c"
Finished building: ../src/pm_master.c
 =

Building file: ../src/pm_mmio_access.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_mmio_access.o" -Os =
-flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu10=
6/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -m=
little-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft=
-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm=
_mmio_access.d" -MT"src/pm_mmio_access.o" -o "src/pm_mmio_access.o" "../src=
/pm_mmio_access.c"
Finished building: ../src/pm_mmio_access.c
 =

Building file: ../src/pm_node.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_node.o" -Os -flto -=
ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu10=
6/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle-=
endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -W=
l,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_node.d=
" -MT"src/pm_node.o" -o "src/pm_node.o" "../src/pm_node.c"
Finished building: ../src/pm_node.c
 =

Building file: ../src/pm_node_reset.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_node_reset.o" -Os -=
flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106=
/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -ml=
ittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-=
mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_=
node_reset.d" -MT"src/pm_node_reset.o" -o "src/pm_node_reset.o" "../src/pm_=
node_reset.c"
Finished building: ../src/pm_node_reset.c
 =

Building file: ../src/pm_notifier.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_notifier.o" -Os -fl=
to -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/z=
cu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlit=
tle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mu=
l -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_no=
tifier.d" -MT"src/pm_notifier.o" -o "src/pm_notifier.o" "../src/pm_notifier=
.c"
Finished building: ../src/pm_notifier.c
 =

Building file: ../src/pm_periph.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_periph.o" -Os -flto=
 -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu=
106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittl=
e-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul =
-Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_peri=
ph.d" -MT"src/pm_periph.o" -o "src/pm_periph.o" "../src/pm_periph.c"
Finished building: ../src/pm_periph.c
 =

Building file: ../src/pm_pinctrl.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_pinctrl.o" -Os -flt=
o -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zc=
u106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlitt=
le-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul=
 -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_pin=
ctrl.d" -MT"src/pm_pinctrl.o" -o "src/pm_pinctrl.o" "../src/pm_pinctrl.c"
Finished building: ../src/pm_pinctrl.c
 =

Building file: ../src/pm_pll.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_pll.o" -Os -flto -f=
fat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu106=
/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle-e=
ndian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -Wl=
,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_pll.d" =
-MT"src/pm_pll.o" -o "src/pm_pll.o" "../src/pm_pll.c"
Finished building: ../src/pm_pll.c
 =

Building file: ../src/pm_power.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_power.o" -Os -flto =
-ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu1=
06/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle=
-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -=
Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_power=
.d" -MT"src/pm_power.o" -o "src/pm_power.o" "../src/pm_power.c"
Finished building: ../src/pm_power.c
 =

Building file: ../src/pm_proc.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_proc.o" -Os -flto -=
ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu10=
6/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle-=
endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -W=
l,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_proc.d=
" -MT"src/pm_proc.o" -o "src/pm_proc.o" "../src/pm_proc.c"
Finished building: ../src/pm_proc.c
 =

Building file: ../src/pm_qspi.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_qspi.o" -Os -flto -=
ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu10=
6/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle-=
endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -W=
l,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_qspi.d=
" -MT"src/pm_qspi.o" -o "src/pm_qspi.o" "../src/pm_qspi.c"
Finished building: ../src/pm_qspi.c
 =

Building file: ../src/pm_requirement.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_requirement.o" -Os =
-flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu10=
6/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -m=
little-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft=
-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm=
_requirement.d" -MT"src/pm_requirement.o" -o "src/pm_requirement.o" "../src=
/pm_requirement.c"
Finished building: ../src/pm_requirement.c
 =

Building file: ../src/pm_reset.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_reset.o" -Os -flto =
-ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu1=
06/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle=
-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -=
Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_reset=
.d" -MT"src/pm_reset.o" -o "src/pm_reset.o" "../src/pm_reset.c"
Finished building: ../src/pm_reset.c
 =

Building file: ../src/pm_slave.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_slave.o" -Os -flto =
-ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu1=
06/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle=
-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -=
Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_slave=
.d" -MT"src/pm_slave.o" -o "src/pm_slave.o" "../src/pm_slave.c"
Finished building: ../src/pm_slave.c
 =

Building file: ../src/pm_sram.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_sram.o" -Os -flto -=
ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu10=
6/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle-=
endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -W=
l,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_sram.d=
" -MT"src/pm_sram.o" -o "src/pm_sram.o" "../src/pm_sram.c"
Finished building: ../src/pm_sram.c
 =

Building file: ../src/pm_system.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_system.o" -Os -flto=
 -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu=
106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittl=
e-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul =
-Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_syst=
em.d" -MT"src/pm_system.o" -o "src/pm_system.o" "../src/pm_system.c"
Finished building: ../src/pm_system.c
 =

Building file: ../src/pm_usb.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/pm_usb.o" -Os -flto -f=
fat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu106=
/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle-e=
ndian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -Wl=
,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/pm_usb.d" =
-MT"src/pm_usb.o" -o "src/pm_usb.o" "../src/pm_usb.c"
Finished building: ../src/pm_usb.c
 =

Building file: ../src/xpfw_aib.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_aib.o" -Os -flto =
-ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu1=
06/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle=
-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -=
Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_aib=
.d" -MT"src/xpfw_aib.o" -o "src/xpfw_aib.o" "../src/xpfw_aib.c"
Finished building: ../src/xpfw_aib.c
 =

Building file: ../src/xpfw_core.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_core.o" -Os -flto=
 -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu=
106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittl=
e-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul =
-Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_co=
re.d" -MT"src/xpfw_core.o" -o "src/xpfw_core.o" "../src/xpfw_core.c"
Finished building: ../src/xpfw_core.c
 =

Building file: ../src/xpfw_error_manager.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_error_manager.o" =
-Os -flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_z=
cu106/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/includ=
e -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-=
soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"sr=
c/xpfw_error_manager.d" -MT"src/xpfw_error_manager.o" -o "src/xpfw_error_ma=
nager.o" "../src/xpfw_error_manager.c"
Finished building: ../src/xpfw_error_manager.c
 =

Building file: ../src/xpfw_events.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_events.o" -Os -fl=
to -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/z=
cu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlit=
tle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mu=
l -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_=
events.d" -MT"src/xpfw_events.o" -o "src/xpfw_events.o" "../src/xpfw_events=
.c"
Finished building: ../src/xpfw_events.c
 =

Building file: ../src/xpfw_interrupts.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_interrupts.o" -Os=
 -flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu1=
06/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -=
mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-sof=
t-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/x=
pfw_interrupts.d" -MT"src/xpfw_interrupts.o" -o "src/xpfw_interrupts.o" "..=
/src/xpfw_interrupts.c"
Finished building: ../src/xpfw_interrupts.c
 =

Building file: ../src/xpfw_ipi_manager.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_ipi_manager.o" -O=
s -flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu=
106/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include =
-mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-so=
ft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/=
xpfw_ipi_manager.d" -MT"src/xpfw_ipi_manager.o" -o "src/xpfw_ipi_manager.o"=
 "../src/xpfw_ipi_manager.c"
Finished building: ../src/xpfw_ipi_manager.c
 =

Building file: ../src/xpfw_main.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_main.o" -Os -flto=
 -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu=
106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittl=
e-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul =
-Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_ma=
in.d" -MT"src/xpfw_main.o" -o "src/xpfw_main.o" "../src/xpfw_main.c"
Finished building: ../src/xpfw_main.c
 =

Building file: ../src/xpfw_mod_common.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_common.o" -Os=
 -flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu1=
06/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -=
mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-sof=
t-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/x=
pfw_mod_common.d" -MT"src/xpfw_mod_common.o" -o "src/xpfw_mod_common.o" "..=
/src/xpfw_mod_common.c"
Finished building: ../src/xpfw_mod_common.c
 =

Building file: ../src/xpfw_mod_dap.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_dap.o" -Os -f=
lto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/=
zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mli=
ttle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-m=
ul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw=
_mod_dap.d" -MT"src/xpfw_mod_dap.o" -o "src/xpfw_mod_dap.o" "../src/xpfw_mo=
d_dap.c"
Finished building: ../src/xpfw_mod_dap.c
 =

Building file: ../src/xpfw_mod_em.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_em.o" -Os -fl=
to -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/z=
cu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlit=
tle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mu=
l -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_=
mod_em.d" -MT"src/xpfw_mod_em.o" -o "src/xpfw_mod_em.o" "../src/xpfw_mod_em=
.c"
Finished building: ../src/xpfw_mod_em.c
 =

Building file: ../src/xpfw_mod_extwdt.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_extwdt.o" -Os=
 -flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu1=
06/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -=
mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-sof=
t-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/x=
pfw_mod_extwdt.d" -MT"src/xpfw_mod_extwdt.o" -o "src/xpfw_mod_extwdt.o" "..=
/src/xpfw_mod_extwdt.c"
Finished building: ../src/xpfw_mod_extwdt.c
 =

Building file: ../src/xpfw_mod_legacy.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_legacy.o" -Os=
 -flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu1=
06/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -=
mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-sof=
t-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/x=
pfw_mod_legacy.d" -MT"src/xpfw_mod_legacy.o" -o "src/xpfw_mod_legacy.o" "..=
/src/xpfw_mod_legacy.c"
Finished building: ../src/xpfw_mod_legacy.c
 =

Building file: ../src/xpfw_mod_overtemp.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_overtemp.o" -=
Os -flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zc=
u106/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include=
 -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-s=
oft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src=
/xpfw_mod_overtemp.d" -MT"src/xpfw_mod_overtemp.o" -o "src/xpfw_mod_overtem=
p.o" "../src/xpfw_mod_overtemp.c"
Finished building: ../src/xpfw_mod_overtemp.c
 =

Building file: ../src/xpfw_mod_pm.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_pm.o" -Os -fl=
to -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/z=
cu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlit=
tle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mu=
l -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_=
mod_pm.d" -MT"src/xpfw_mod_pm.o" -o "src/xpfw_mod_pm.o" "../src/xpfw_mod_pm=
.c"
Finished building: ../src/xpfw_mod_pm.c
 =

Building file: ../src/xpfw_mod_rpu.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_rpu.o" -Os -f=
lto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/=
zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mli=
ttle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-m=
ul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw=
_mod_rpu.d" -MT"src/xpfw_mod_rpu.o" -o "src/xpfw_mod_rpu.o" "../src/xpfw_mo=
d_rpu.c"
Finished building: ../src/xpfw_mod_rpu.c
 =

Building file: ../src/xpfw_mod_rtc.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_rtc.o" -Os -f=
lto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/=
zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mli=
ttle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-m=
ul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw=
_mod_rtc.d" -MT"src/xpfw_mod_rtc.o" -o "src/xpfw_mod_rtc.o" "../src/xpfw_mo=
d_rtc.c"
Finished building: ../src/xpfw_mod_rtc.c
 =

Building file: ../src/xpfw_mod_sched.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_sched.o" -Os =
-flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu10=
6/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -m=
little-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft=
-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xp=
fw_mod_sched.d" -MT"src/xpfw_mod_sched.o" -o "src/xpfw_mod_sched.o" "../src=
/xpfw_mod_sched.c"
Finished building: ../src/xpfw_mod_sched.c
 =

Building file: ../src/xpfw_mod_stl.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_stl.o" -Os -f=
lto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/=
zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mli=
ttle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-m=
ul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw=
_mod_stl.d" -MT"src/xpfw_mod_stl.o" -o "src/xpfw_mod_stl.o" "../src/xpfw_mo=
d_stl.c"
Finished building: ../src/xpfw_mod_stl.c
 =

Building file: ../src/xpfw_mod_ultra96.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_ultra96.o" -O=
s -flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu=
106/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include =
-mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-so=
ft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/=
xpfw_mod_ultra96.d" -MT"src/xpfw_mod_ultra96.o" -o "src/xpfw_mod_ultra96.o"=
 "../src/xpfw_mod_ultra96.c"
Finished building: ../src/xpfw_mod_ultra96.c
 =

Building file: ../src/xpfw_mod_wdt.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_mod_wdt.o" -Os -f=
lto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/=
zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mli=
ttle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-m=
ul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw=
_mod_wdt.d" -MT"src/xpfw_mod_wdt.o" -o "src/xpfw_mod_wdt.o" "../src/xpfw_mo=
d_wdt.c"
Finished building: ../src/xpfw_mod_wdt.c
 =

Building file: ../src/xpfw_module.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_module.o" -Os -fl=
to -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/z=
cu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlit=
tle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mu=
l -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_=
module.d" -MT"src/xpfw_module.o" -o "src/xpfw_module.o" "../src/xpfw_module=
.c"
Finished building: ../src/xpfw_module.c
 =

Building file: ../src/xpfw_platform.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_platform.o" -Os -=
flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106=
/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -ml=
ittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-=
mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpf=
w_platform.d" -MT"src/xpfw_platform.o" -o "src/xpfw_platform.o" "../src/xpf=
w_platform.c"
Finished building: ../src/xpfw_platform.c
 =

Building file: ../src/xpfw_resets.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_resets.o" -Os -fl=
to -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/z=
cu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlit=
tle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mu=
l -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_=
resets.d" -MT"src/xpfw_resets.o" -o "src/xpfw_resets.o" "../src/xpfw_resets=
.c"
Finished building: ../src/xpfw_resets.c
 =

Building file: ../src/xpfw_restart.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_restart.o" -Os -f=
lto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/=
zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mli=
ttle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-m=
ul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw=
_restart.d" -MT"src/xpfw_restart.o" -o "src/xpfw_restart.o" "../src/xpfw_re=
start.c"
Finished building: ../src/xpfw_restart.c
 =

Building file: ../src/xpfw_rom_interface.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_rom_interface.o" =
-Os -flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_z=
cu106/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/includ=
e -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-=
soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"sr=
c/xpfw_rom_interface.d" -MT"src/xpfw_rom_interface.o" -o "src/xpfw_rom_inte=
rface.o" "../src/xpfw_rom_interface.c"
Finished building: ../src/xpfw_rom_interface.c
 =

Building file: ../src/xpfw_scheduler.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_scheduler.o" -Os =
-flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu10=
6/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -m=
little-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft=
-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xp=
fw_scheduler.d" -MT"src/xpfw_scheduler.o" -o "src/xpfw_scheduler.o" "../src=
/xpfw_scheduler.c"
Finished building: ../src/xpfw_scheduler.c
 =

Building file: ../src/xpfw_start.S
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_start.o" -Os -flt=
o -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zc=
u106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlitt=
le-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul=
 -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_s=
tart.d" -MT"src/xpfw_start.o" -o "src/xpfw_start.o" "../src/xpfw_start.S"
Finished building: ../src/xpfw_start.S
 =

Building file: ../src/xpfw_user_startup.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_user_startup.o" -=
Os -flto -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zc=
u106/zcu106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include=
 -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-s=
oft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src=
/xpfw_user_startup.d" -MT"src/xpfw_user_startup.o" -o "src/xpfw_user_startu=
p.o" "../src/xpfw_user_startup.c"
Finished building: ../src/xpfw_user_startup.c
 =

Building file: ../src/xpfw_util.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_util.o" -Os -flto=
 -ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu=
106/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittl=
e-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul =
-Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_ut=
il.d" -MT"src/xpfw_util.o" -o "src/xpfw_util.o" "../src/xpfw_util.c"
Finished building: ../src/xpfw_util.c
 =

Building file: ../src/xpfw_xpu.c
Invoking: MicroBlaze gcc compiler
mb-gcc -Wall -O0 -g3 -c -fmessage-length=3D0 -MT"src/xpfw_xpu.o" -Os -flto =
-ffat-lto-objects -I/group/xirguup/nealf/buildroot/vitis_2022.1_zcu106/zcu1=
06/export/zcu106/sw/zcu106/standalone_psu_pmu_0/bspinclude/include -mlittle=
-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=3Dv9.2 -mxl-soft-mul -=
Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"src/xpfw_xpu=
.d" -MT"src/xpfw_xpu.o" -o "src/xpfw_xpu.o" "../src/xpfw_xpu.c"
Finished building: ../src/xpfw_xpu.c
 =

Building target: pmufw.elf
Invoking: MicroBlaze gcc linker
mb-gcc -nostartfiles -Wl,-T -Wl,../src/lscript.ld -L/group/xirguup/nealf/bu=
ildroot/vitis_2022.1_zcu106/zcu106/export/zcu106/sw/zcu106/standalone_psu_p=
mu_0/bsplib/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcp=
u=3Dv9.2 -mxl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "pmufw.elf"  ./s=
rc/idle_hooks.o ./src/pm_binding.o ./src/pm_callbacks.o ./src/pm_clock.o ./=
src/pm_config.o ./src/pm_core.o ./src/pm_csudma.o ./src/pm_ddr.o ./src/pm_e=
xtern.o ./src/pm_gic_proxy.o ./src/pm_gpp.o ./src/pm_hooks.o ./src/pm_ioctl=
.o ./src/pm_master.o ./src/pm_mmio_access.o ./src/pm_node.o ./src/pm_node_r=
eset.o ./src/pm_notifier.o ./src/pm_periph.o ./src/pm_pinctrl.o ./src/pm_pl=
l.o ./src/pm_power.o ./src/pm_proc.o ./src/pm_qspi.o ./src/pm_requirement.o=
 ./src/pm_reset.o ./src/pm_slave.o ./src/pm_sram.o ./src/pm_system.o ./src/=
pm_usb.o ./src/xpfw_aib.o ./src/xpfw_core.o ./src/xpfw_error_manager.o ./sr=
c/xpfw_events.o ./src/xpfw_interrupts.o ./src/xpfw_ipi_manager.o ./src/xpfw=
_main.o ./src/xpfw_mod_common.o ./src/xpfw_mod_dap.o ./src/xpfw_mod_em.o ./=
src/xpfw_mod_extwdt.o ./src/xpfw_mod_legacy.o ./src/xpfw_mod_overtemp.o ./s=
rc/xpfw_mod_pm.o ./src/xpfw_mod_rpu.o ./src/xpfw_mod_rtc.o ./src/xpfw_mod_s=
ched.o ./src/xpfw_mod_stl.o ./src/xpfw_mod_ultra96.o ./src/xpfw_mod_wdt.o .=
/src/xpfw_module.o ./src/xpfw_platform.o ./src/xpfw_resets.o ./src/xpfw_res=
tart.o ./src/xpfw_rom_interface.o ./src/xpfw_scheduler.o ./src/xpfw_start.o=
 ./src/xpfw_user_startup.o ./src/xpfw_util.o ./src/xpfw_xpu.o   -Wl,--start=
-group,-lxil,-lgcc,-lc,--end-group -Wl,--start-group,-lxilfpga,-lxil,-lgcc,=
-lc,--end-group -Wl,--start-group,-lxilsecure,-lxil,-lgcc,-lc,--end-group -=
Wl,--start-group,-lxilskey,-lxil,-lgcc,-lc,--end-group
Finished building target: pmufw.elf
=A0
Any ideas?

 > On 5/4/22 08:49, Peter Korsgaard wrote:
 >>>>>>> "Neal" =3D=3D Neal Frager <neal.frager@amd.com> writes:
 >> > This patch migrates configs/zynqmp_zcu106_defconfig to tarballs  >> f=
or TF-A, u-boot and Linux.
 >> > This patch has zero change in code running on the device.
 >> > The goal is to improve build speed and align with the zynq_xxx_defcon=
figs.
 >> > Signed-off-by: Neal Frager <neal.frager@amd.com>  >> Committed, thank=
s.
 >> Notice: I'm still seeing noisy warnings from the kernel during boot,  >=
> did  >> you hear back from Michal abot that?
 >> [    4.384715] zynqmp-display fd4a0000.display: vtc bridge property
 >> not present
 >> [    4.393156] ------------[ cut here ]------------
 >> [    4.397776] More than allowed devices are using the vpll_int, which =
is forbidden


 > This is caused by not proper psu_init which setup PLLs incorrectly.

> I just noticed a different issue, reboots from Linux are not working, as =
the PMU hangs with an exception accessing the TCM as the RPU is powered dow=
n by default (ENABLE_UNUSED_RPU_PWR_DWN defaults to 1).

> Resets from U-Boot works, but that is presumably because the RPU is still=
 running there.

> Doing a build on the PMU firmware with the PM log level set to 4 I see du=
ring Linux boot:

> APU> InitFinalize
> rpu0 active->forced off
> ipi_rpu0 1->0
> tcm0b 2->0
> tcm0a 2->0
> vcu 1->0
> gpu 1->0
> ipi_rpu1 1->0

> And then when rebooting:

> [   15.705425] reboot: Restarting system
> APU> SystemShutdown(1, 2)
> Err: #1 l2$ state#2
> Error in change state for l2$
> Err: #1 ocm0 state#2
> Error in change state for ocm0
> Err: #1 ocm1 state#2
> Error in change state for ocm1
> Err: #1 ocm2 state#2
> Error in change state for ocm2
> Err: #1 ocm3 state#2
> Error in change state for ocm3
> rpu 0->1
> Received exception
> MSR: 0x200, EAR: 0xFFE00000, EDR: 0x0, ESR: 0x4C4

> This is not great :/ Are you seeing the same? On a custom board running a=
n old 2019.1 based PMU I don't see it, but after updating the PMU I do sinc=
e the exception was silently ignored before v2020.2:

> https://github.com/Xilinx/embeddedsw/commit/b2bc5ed0e63ad1abbf2a3bc28dbf3=
c185b7092e4

> Any ideas about how to fix this (besides using a custom pmufw with ENABLE=
_UNUSED_RPU_PWR_DWN turned off)?

> I have duplicated your issue with my zcu106 board.  I had not tested comm=
and line rebooting until now.

> My next step is to test out the petalinux 2022.1 pre-built binaries to se=
e if the issue is there as well.

> If the issue does not exist on petalinux, I will look closely at the buil=
d options to see if there is anything different from what we do with Luca's=
 zynqmp-pmufw-builder.

> We may also want to check psu_init differences between the fsbl and spl a=
s well.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
