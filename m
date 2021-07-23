Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F37C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:40:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63DA160F25
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63DA160F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 288C640654;
	Fri, 23 Jul 2021 22:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBv_ZVT9bK13; Fri, 23 Jul 2021 22:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFD5240665;
	Fri, 23 Jul 2021 22:40:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 018B91BF3EE
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1BD8401CB
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="XusWMSHA";
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.b="OST2eGe+"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiBJwSDWU8VB for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:40:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AD4C400B9
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 22:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627080043; x=1658616043;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=R0fvRWIiO9J97GoWk8wXg2pN8PldEWQg3SllW7qyDOg=;
 b=XusWMSHApfTm5GL4yPXrF5Dc0LkaETjn81K49ycDTD1tvpe8RkljOpOO
 Fu03Ck3hRMsAOtO47pEMDJye/8lOCXCtNvWPq+d58A37dYjcplWAdHwNr
 9HczRloUIxgbetjlYXjHaBFz5TuEeYamac6LsYIz57rSgFqtcJBijonPR
 0aPN8KQpEcFnwHHp3UI1quMjHX5gH7jdlM0050/k59kIxm3lnxT/B3pHY
 D0rLEJ0lCWS8hUaxM0upd/TtRfzviZVRE5/f7YX59TGRdAuk79KA9i5Q9
 Ilqqs+Ch4FSZcEBYWeTIceznlXrNVU94YvlaQAvE7kNEJ4R2Qz3VOVtGe w==;
X-IronPort-AV: E=Sophos;i="5.84,265,1620662400"; d="scan'208";a="175950667"
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 06:40:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mexHlzhILek9QPo5zgMGY/dsneeeWQRAmQz0aE6g9DwlQ/SN2rniy4gxw6te4+gMGIM4qts/ZNJjORmXI5svXMIDdL9EZuvDAIbodKKzVH/bhieO9kWpPpFOK3kjrivVYBzA8zA9N4G9g6jrpgtInsi8VSYYPnuYk1ewZpS13Z5WYoBirRN6+sMP/zMDVb5MUOcZM/ucJP8xcohtu48q1Vehidu+wsCsxYMo/973UCXqUX+jY4nQgBXEXAGjITZsblxoemm9UYT6khZxr3i6Gu/3Ujf9P2K1QLktONNW2jB6YUcyivjP8hgrDI5K+A30OPQf9uEblJijU2iv84MNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYEYoP4BrIW1Wyr82xXErZS6vnFjFbT5W3bDGPMC7Tc=;
 b=gKLBrtE+MkQHkUf0eyRro8RXVIGcIqB+A5WbXG0yjlGp92nnp1kkgflZeBhf+GX52SYcApgbTplorj8kSsJX+2d36zliTAr+tK30vQtLSBF0Z14AgPdGMu5eQeIBaO5eLBbo+IWLFDo6Hw1M6H4im5u/uuXIdiMQ+SPOjsJi6qsLC7DjvtaOhz38nEJ1WnHVbwZ16f8BpqFfoIwHs9dlX/GG6NIeCoOM4Md34UAEt6dOxyM7lvwtsscFD16ApezfNAouyN5n8E/jwtlNZ8B1676EKDqwexVeUlYt4tZpp/umEHdL4ZYwk+HeksdrHc6lXUPumb6Q0oE0x3KJMTzkOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYEYoP4BrIW1Wyr82xXErZS6vnFjFbT5W3bDGPMC7Tc=;
 b=OST2eGe+eHOjUl2E/wNLBnyz7XU3fgOZB+y++f8s1PFqd1ipbBlVv5YikzKQa3rZWdQ6sJFq7uI7+4MvTg40PtiURq5jvW6VhseXuNuiE9atDPN200HE87yDLjT+9UvZuTf/E202dJet5cLeq+zE9nypWiHi75UmmhY/hrHaCHc=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM5PR04MB3756.namprd04.prod.outlook.com (2603:10b6:3:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 23 Jul
 2021 22:40:40 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::44e6:14cc:4aab:3028]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::44e6:14cc:4aab:3028%8]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 22:40:40 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot
 <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Corbin <mark@dibsco.co.uk>
Thread-Topic: [Buildroot] [PATCH v2 0/9] Add RISC-V NOMMU and Canaan K210 SoC
 support
Thread-Index: AQHXeRNpVU2a2KhQ5Eq7PKb+9hA3Wg==
Date: Fri, 23 Jul 2021 22:40:40 +0000
Message-ID: <DM6PR04MB7081A10C9989A566F1A380DBE7E59@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <4bcbc59a-0294-8cc8-0138-d0cdeb1ada7f@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mind.be; dkim=none (message not signed)
 header.d=none;mind.be; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49e77b56-03e1-44a5-21bb-08d94e2ae5e5
x-ms-traffictypediagnostic: DM5PR04MB3756:
x-microsoft-antispam-prvs: <DM5PR04MB37567C8FDF40804CF744359AE7E59@DM5PR04MB3756.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vHDQUzQ2sc4IlM1mjmTxMhtAVBCBzPB2TKaoB+/2PEd0y0Bo6wgaGyHPEdAu/lZG/Y7PdosTT0lUJ7YnU/bL1F1eqetTr7QgwHPUob52aiIJoQ9KSeqnDNJPJpg83/One2BKAsi2rqoGSZ3JDP/6AaYFvUZ4ZvAKauEYQd8qQQixL+U/lPgE9ES2ZouESYKi7mcR1anf2C5A8mUvo9zh29B+GMP03lWlPwV2eXAYlXI6zAC7Iq9ZulGlsm/ICHEjz5joZH4nfTDj/E1UfLSwXLdMIlA7VTK2r+wKmFR7jYc5xQ16UL5wgmazoZyiK359h7RHdZQbifZ7tmswOngSbBbo6QhV5uLKI2p9L6IUS4bMg+l/vPtdJDeTUcDwz+deWS1a1Ayzu4m/w+gYhmIaTcGXsVhD5CS5YtGEyNQ9veZC6kes7nE8HSCTCSlrR/RvZgzWVQ/ZfpiT8HWMI84hX6oFsSr34qYiwX0zOyddxcJElT7HTPSK1kxM+8Tl5vOwod5PFaULwBxTgVmexQFpvKqfj+g+2FkqAkDcJqhVPnNQyhQptu+SJV8V3j/Ul/6YJMdV5ACZukpT/korBAJt9D5T6GOtEkfejwxjM42JkS14KXFAZc/dUc6m0/YUkyfBl1nBYIPJijQVSsy4DDp7JSmna64hu8JtXT6v9yu9jWQrXVV0+7XuNmSeWRnD0KbJMal1fMiSFGAFAIIb+ZibHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(4326008)(8936002)(33656002)(66946007)(2906002)(52536014)(478600001)(5660300002)(316002)(53546011)(122000001)(91956017)(110136005)(76116006)(6506007)(55016002)(71200400001)(86362001)(83380400001)(66476007)(8676002)(66446008)(64756008)(66556008)(9686003)(186003)(7696005)(38100700002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cGAuAQ7DhlQltAOSrPLBzosmMna/WQv1NVXBDdLyzHoQTN2aOmRqRO0E10DO?=
 =?us-ascii?Q?dP5bMhgcWu7yRM6NULFXkuLn+JRbcq9P0UHqjv339MuuLtvbj9/9qZQp0tpf?=
 =?us-ascii?Q?P2hSSnRkBmyuzoxltqwymf46VMRitLSgN0sUmGyYgMdfRjza8LY3BsWfoSJj?=
 =?us-ascii?Q?PO2RnRfrf1AdPk1mTrkiGlhEOXoxkPjnQK8jff2dpwzTIf1qfnu/ZwjxXEWF?=
 =?us-ascii?Q?+8jgf4VwnmvASVTHC/gL7tSKu0Raa86cVgkEnxO7Pjg3FwlB/3UDpx1ps/rp?=
 =?us-ascii?Q?Z//Y6QBx8b67Y1biUrUlFXisIa8lAiex/Jn1zgaVYmYkApfngRj5uAp/aKm1?=
 =?us-ascii?Q?MxVqDWP5dWjjk0rkFDYpePuYGhWB6oCyXozKpwpbB1b8yDIsRXV1wWgThyd1?=
 =?us-ascii?Q?J2yDOynQSl/YoVFt6U6tmpzrxt4s7nSvoYNnMcf9ZX6oShEp1+LdPV7RAKWe?=
 =?us-ascii?Q?SfKdMi7EB/MCIsf8BnNzq8CuKJ2DvxRl/eE5hwWbSECVpN7xRSHcWT/lQLCK?=
 =?us-ascii?Q?Z1jiSP/n1bmhnuvMh4VbLKHHrkmWSotQMFReZdCbomSas2gy/6d8Dzg3l39W?=
 =?us-ascii?Q?NCcmETQeu19nnVRCpouktCK98iKL4tEPrwv1bKLCmvrmz8Z4AlJ0/fdJ7HWg?=
 =?us-ascii?Q?rp5BzmsOKTdO51K4fUTRFJ42Cizu2ukW3vgzpQWxA60dDFhIfkEvdy4CHHMg?=
 =?us-ascii?Q?wPVI23MT3lPRFTNVn95WCbUyfdoHbwmVaVavCpCE2VccT4uBrzZkqdRcqaF8?=
 =?us-ascii?Q?nQyo98gjZc2NIjk9hGN6XpM0wvbZPkwGy9PSlGJEAZfHekAd7vWFUJnwORM5?=
 =?us-ascii?Q?Ga0pU9frocaX9uwVH/EWHEVEISpEZsgXAgxI9TunvsUWVF7lIweRBvMn/8GZ?=
 =?us-ascii?Q?7MKleXB2aEoIQIbE54Em5u0OR/ntI2ZlYMnVvR2sS4wQTqqpSPQB6ADytc86?=
 =?us-ascii?Q?EliP+P/4FDCSUBm2FEJMiqP/qGAH5lFaiEtfnOfBh6lLQFAktOkZsM+AEEqa?=
 =?us-ascii?Q?q70DfnEu4JsJBttyOVSuysmIqwu9jNrb2YSOJkfniIWRLrjtsKr6n7qa28Vy?=
 =?us-ascii?Q?gQSFtFfiSw8tMgNRMM39fbvKFolHt+e4opvqog/ev1jtX0FHbFEAOWUEKIbi?=
 =?us-ascii?Q?ReRCt0d5O3Vgkma6vewdB4mqVQlAGCHsQaJlWedaJuj65IqUz8EgoyEtYKRU?=
 =?us-ascii?Q?3XkGOFucG4Qmmcem8DQ9ODzMicuX2W16ojjjAi/5inSjKzyQ/mEDXTqu/ddt?=
 =?us-ascii?Q?yGsmZVWGiHvLwFhRM4OeEsoxzsNX4BEGmpx/er1XMmI0slNzklIIeVda5iBo?=
 =?us-ascii?Q?58TPs7urEU4q66HNoonKokzhSappYQtd4EG6DgmcuiWBW9dxFlhsTc7Zjfi/?=
 =?us-ascii?Q?mGoyJFNwWky/RCPNq0O8UIBEaz2Abr7GHcCug2w5hpN1YUZLPw=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e77b56-03e1-44a5-21bb-08d94e2ae5e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 22:40:40.0634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kre8jBPLnJ5jr2TvGYtgzR8CrYAzpxkWsKi4z721kyQEhSFS88heq5lGgYdPEVX2zxIBNQDIcx+j5TIFtDAsqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB3756
Subject: Re: [Buildroot] [PATCH v2 0/9] Add RISC-V NOMMU and Canaan K210 SoC
 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 2021/07/24 7:26, Arnout Vandecappelle wrote:
> 
> 
> On 15/07/2021 02:48, Damien Le Moal wrote:
>> This series adds support for building RISC-V NOMMU kernel bootable
>> images for boards using the Cannan Kendryte K210 SoC.
>>
>> The first patch makes MMU builds optional for RISC-V. The second patch
>> enables RV64 support in elf2flt (patch sent to uclinux-dev). The third
>> patch changes the base name of the toolchain to avoid build errors.
>>
>> The following 5 patches add default build configuration files for
>> various boards: MAIX-bit, MAIX-go, MAIX-dock (Dan Dock) and MAIXDUINO
>> from Sipeed and the Canaan KD233 development board.
>>
>> Finally, patch 9 documents how to build and install images for these
>> boards.
>>
>> Changes from v1:
>> * Rebased on latest master
>> * Simplified patch 3 as suggested by Baruch
>> * Fixed typos in documentation (patch 9)
>> * Added reviewed-by tags
>>
>> Christoph Hellwig (2):
>>   package/elf2flt: add RISC-V support
>>   package make: build RISC-V nommu builds as linux
>>
>> Damien Le Moal (7):
>>   arch/config: Make RISC-V MMU optional
>>   board: Add Sipeed MAIX-bit support
>>   board: Add Sipeed MAIX-Go support
>>   board: Add Sipeed MAIXDUINO support
>>   board: Add Sipeed MAIX-Dock support
>>   board: Add Canaan KD233 support
>>   board: Document Canaan K210 based boards support
> 
>  Given the feedback from Yann and from me, I've marked the series as Changes
> Requested in patchwork.

Thanks. Cooking v3 :)

> 
>  Regards,
>  Arnout
> 
>>
>>  arch/Config.in                                |    2 +-
>>  board/canaan/k210-common/README.md            |  318 +++++
>>  .../k210-common/busybox-tiny-initramfs.config | 1183 +++++++++++++++++
>>  .../k210-common/rootfs_overlay/usr/sbin/init  |   26 +
>>  board/canaan/kd233/README.md                  |    4 +
>>  board/canaan/kd233/linux-dtb.config           |    2 +
>>  board/sipeed/maix-bit/README.md               |    4 +
>>  board/sipeed/maix-bit/linux-dtb.config        |    2 +
>>  board/sipeed/maix-dock/README.md              |    4 +
>>  board/sipeed/maix-dock/linux-dtb.config       |    2 +
>>  board/sipeed/maix-go/README.md                |    4 +
>>  board/sipeed/maix-go/linux-dtb.config         |    2 +
>>  board/sipeed/maixduino/README.md              |    4 +
>>  board/sipeed/maixduino/linux-dtb.config       |    2 +
>>  configs/canaan_kd233_defconfig                |   23 +
>>  configs/canaan_kd233_sdcard_defconfig         |   23 +
>>  configs/sipeed_maix_bit_defconfig             |   23 +
>>  configs/sipeed_maix_bit_sdcard_defconfig      |   23 +
>>  configs/sipeed_maix_dock_defconfig            |   23 +
>>  configs/sipeed_maix_dock_sdcard_defconfig     |   23 +
>>  configs/sipeed_maix_go_defconfig              |   23 +
>>  configs/sipeed_maix_go_sdcard_defconfig       |   23 +
>>  configs/sipeed_maixduino_defconfig            |   23 +
>>  configs/sipeed_maixduino_sdcard_defconfig     |   23 +
>>  package/Makefile.in                           |    5 +-
>>  .../0004-elf2flt-add-riscv-support.patch      |  293 ++++
>>  package/elf2flt/Config.in.host                |    2 +-
>>  27 files changed, 2085 insertions(+), 4 deletions(-)
>>  create mode 100644 board/canaan/k210-common/README.md
>>  create mode 100644 board/canaan/k210-common/busybox-tiny-initramfs.config
>>  create mode 100755 board/canaan/k210-common/rootfs_overlay/usr/sbin/init
>>  create mode 100644 board/canaan/kd233/README.md
>>  create mode 100644 board/canaan/kd233/linux-dtb.config
>>  create mode 100644 board/sipeed/maix-bit/README.md
>>  create mode 100644 board/sipeed/maix-bit/linux-dtb.config
>>  create mode 100644 board/sipeed/maix-dock/README.md
>>  create mode 100644 board/sipeed/maix-dock/linux-dtb.config
>>  create mode 100644 board/sipeed/maix-go/README.md
>>  create mode 100644 board/sipeed/maix-go/linux-dtb.config
>>  create mode 100644 board/sipeed/maixduino/README.md
>>  create mode 100644 board/sipeed/maixduino/linux-dtb.config
>>  create mode 100644 configs/canaan_kd233_defconfig
>>  create mode 100644 configs/canaan_kd233_sdcard_defconfig
>>  create mode 100644 configs/sipeed_maix_bit_defconfig
>>  create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
>>  create mode 100644 configs/sipeed_maix_dock_defconfig
>>  create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig
>>  create mode 100644 configs/sipeed_maix_go_defconfig
>>  create mode 100644 configs/sipeed_maix_go_sdcard_defconfig
>>  create mode 100644 configs/sipeed_maixduino_defconfig
>>  create mode 100644 configs/sipeed_maixduino_sdcard_defconfig
>>  create mode 100644 package/elf2flt/0004-elf2flt-add-riscv-support.patch
>>
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
