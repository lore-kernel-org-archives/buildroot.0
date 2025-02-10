Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE76C02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 11:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B0C260603;
	Mon, 10 Feb 2025 11:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huVAsFR5YUCi; Mon, 10 Feb 2025 11:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BEC260607
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BEC260607;
	Mon, 10 Feb 2025 11:53:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48A02C2
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 11:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 358534073D
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 11:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54cnDbdw12mY for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 11:53:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=1292f9273=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5D2840734
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5D2840734
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5D2840734
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 11:53:14 +0000 (UTC)
X-CSE-ConnectionGUID: xNGcVgQTT5Gl5vGtiYJ/rw==
X-CSE-MsgGUID: 9VBjq/1FS+yW4SGvbk/DNw==
X-IronPort-AV: E=Sophos;i="6.13,274,1732550400"; d="scan'208";a="38032570"
Received: from mail-mw2nam04lp2170.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.170])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2025 19:53:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ae106NC2u7+1ISQuQWNeiPO23OmLMcXnGC9sRv8XOnAGmsJ7V/Ncr8X6yCW0cyGqiHSu/qJLqeUTbaioYOLx/XIhg7jCwAIgPP8FGhNau3uXRpELGSANq37WXPWBCoyjJo7l0VJQmdBEZlg4LX2AALyDTD5ccXaZFO8grFSfUma8cqWymQhHgapExFJQ2SGvVx6GxxOWHRUX7ClDdnANnhUd7odPKW665oI65IztRJrlKXecAv3xiHCG/wDnI/NAs0lprZed4c9YNrPXMlBcZEeWI+Aln44RL8MvpFwGzh8Xwude17Rcjl8Z0uQT4rfo/tUuyfc5cfNnyOriRjHSTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvECnBGpx5IY80PLQFq1hAlcnj133uLQUNPyYbNBsYo=;
 b=YGNJq1Z70QkcWs3rAx64X86Jt7YQOrwv+/QAkLCzy84PtcX3OBicwts24CiZ5BdEbC0myVryjspnkQI/fMqLA2h2t9qjCu1ghz+Lx9RipyJwxngLC/ZEPCSF/lP8iXX20WO+oL2Gv3QtnCV0T4Ct4/A3Ax3N0j2sYsWv1uGjricShqvcA0FoF26pmvUgKmS8rNZ9t9blS+cwfZpPVaRpO3UtskYdhBux4L1PnEAHpHj5+qfLjysXfoCYYglkAFg3S+/TefoCdePApaflwb3a4iwnrH9KLKVb2CFULcLqJw0rAgT/8woIE9Qaov+MdHFMjnCirFttSLrMLSW9pQH0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SA1PR04MB8493.namprd04.prod.outlook.com (2603:10b6:806:326::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 11:53:01 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:53:00 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Julien Olivain
 <ju.o@free.fr>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, "linux-amarula@amarulasolutions.com"
 <linux-amarula@amarulasolutions.com>, Sergey Matyukevich <geomatsi@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] boot/uboot: fix binman failure
Thread-Index: AQHbebXByDphiZZjDkuvK0zh3v9qA7M9hsSAgALqeYA=
Date: Mon, 10 Feb 2025 11:53:00 +0000
Message-ID: <Z6nom5B5XocQWWg1@ryzen>
References: <20250207231203.3952765-1-dario.binacchi@amarulasolutions.com>
 <Z6d2a0EFzy16IcFh@curiosity>
In-Reply-To: <Z6d2a0EFzy16IcFh@curiosity>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SA1PR04MB8493:EE_
x-ms-office365-filtering-correlation-id: 44229062-4478-4a3d-0e1e-08dd49c977f8
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CQs96lpNB2v1dbNc9/I2aAZcpS+0VK4eiQXIXxTW441S3pbXCnjBfAuSWjs9?=
 =?us-ascii?Q?TmEBiDiAfpNsHnkWv0kLepAGmwOcwehDATw2tmZ5lsK46aXMlEXXp4zulSIr?=
 =?us-ascii?Q?o1pL2xDC5oc5ul2gvGcDiodvAFOlg3o0hUhniw69CyCiV5Kmy29IggfNQwl3?=
 =?us-ascii?Q?3AHw/di5bnW7ON7Qt1Uio4eJ0EWUrMd5Px82kuVY+UMaFt7ZW4NA1JYitJuR?=
 =?us-ascii?Q?JBdRIPCXdVSAo+sBr8VYNGDEkB1XJtUxWUbJQU5gOWeIkjs5Du9/enoIe2bz?=
 =?us-ascii?Q?vcVB1PYlQzKPQfi54TmCFubGWIzUS6n2xwhkvTLV1G/QYAAd0zDaiCJw0O7K?=
 =?us-ascii?Q?XjA4G5kfOnF/1exCkOPTyU0/q4eWucwYn8fbbgdsjPuDRCbiEDlX4aAdPW7W?=
 =?us-ascii?Q?9i2flYYu719kUUWQFWOoadYo/f9vxS/HWr6STvkSrdTVVtu3l8A3V8BlTwOE?=
 =?us-ascii?Q?zWlDAVwGiNYNcbSWCfptTKfJ6rQGSEbrCIRIwAmjj+6Hqk8pUwAYAAh0ULfY?=
 =?us-ascii?Q?bRSLVPohMbahVH6kX+aU7rOD5oNAXWO18/tAkTgJ5FzdQfVGCUupnSribWln?=
 =?us-ascii?Q?6ycVUzSzgYelYhkpMC6OrxZEyj/8L+1y24yaTrWbutCunYAXaaQ1Fuvpv4p2?=
 =?us-ascii?Q?SPq9rGhyANyTNT8QReNeLJNZXqdFRz2LuhFdre5qh5HUdJ9hnfZxtW5+D/M1?=
 =?us-ascii?Q?zbBbh5lZe+0Mdco22GLQ4QdMXxjIO+ZaoFaaLR7qLN/DWMQ++zQxMcUvapLL?=
 =?us-ascii?Q?+bpDWy7T7M44s5pf8usXH8kDYW4EXd8WQpKqrJIPoRYfSN2T4W4WgpSpSSbQ?=
 =?us-ascii?Q?65gFi/0gh5xe1x7eyIpf67mkV6y50tWZXaDRU//UeG4MFWsQGlDdXQTukINv?=
 =?us-ascii?Q?7AzwghUjybrzKtwAxRcDd7/vIPoso8vXPaOTh1DzSHhPrU1zQ4ss6vIoEJ7G?=
 =?us-ascii?Q?5l/63ZPQaJihjf6AFQBvzNAiYVrqJ0OJefKQWsjKmgcPfTreaUDkSTTeMCTI?=
 =?us-ascii?Q?CtsFeoS+z8vcbxKjhjsefVMdzcp8/H/xRWWvNpuuiUdUt/XBi5e4quH+ovaP?=
 =?us-ascii?Q?ZEGe0OcTrJPNGW3w6bzV/Eqk4twUvsL88S8XdDD5DU5u0wB86Ip9TQZFH/am?=
 =?us-ascii?Q?BEndkFXUwY8bER3MQVDbs+Jv6vB+rwxlv9JF46ZONpiRvPBORygc5WwmHxDG?=
 =?us-ascii?Q?PfjvI5A2gTeG3ki4qJGQ60BImUhlKIZ8JU7Y/rxCN0uTmPRLHEjETLGkRkJU?=
 =?us-ascii?Q?gieZRpahthFZmIADIjc0bkzXOuJ8+pmwrjfcn1HofgvDqN431ATZ0cZap7p3?=
 =?us-ascii?Q?gyk7lg+uskA/xXjIbeJVgRTCrd9Vq+KQqJyjTdjAon1HR5VqSdpbqBTCSxRg?=
 =?us-ascii?Q?vXnEn922UbjR45QkOaWdEttcXGhjkWIw2UByFmL+dkPCrvXOqpV2KFKUBDhq?=
 =?us-ascii?Q?kWARNdEZ1gCjjv4V29ewMd012cwBSd/1nAIbCel7t0tS0SO/tS0vzm3ZqvYW?=
 =?us-ascii?Q?kzLy1pXQv7E3drU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zcbv9aZVAumQZrnTdAV3dmCMNgeI3hfq/iJjBL2h132WpvG3V6NmFrI2ZdgI?=
 =?us-ascii?Q?D36x8ppGSBZQf4Y8lmtYmby12qdHG5rrFcwCwx+C8IN4Y3a9T/ybXfMSOvBC?=
 =?us-ascii?Q?/ssp4JUf/NLoiUHGKDl/10q5XKtpzMxyensDnbygrm6EvaP3/pM23rjncyQm?=
 =?us-ascii?Q?Iq03LkFHMSg1uzcIOMw1ehIT5Xh7ihefYxctNhyH5zQy5Bycj27AO5PkABgs?=
 =?us-ascii?Q?iQcoCL5/DVX/7cBx5cVPb+C18Z4knuhOR4yHKmXdPlmI2fzuaL5Kz+5yWP95?=
 =?us-ascii?Q?+QR5sMXne8U9RE7CBKpZBWZti96r9CZq8h3y/kZQn0z/WLYdnL3M3AFYPkso?=
 =?us-ascii?Q?0DOQ48LMqp/PLjEzW0WvLNCAgOA+oty/pCf1HCX9DwVcs89GzMrw1QZKcX2e?=
 =?us-ascii?Q?rtAutn04yqiL+JkH1iY9osvlhcp+SyHYIu/ck6NjrwHdIO/2w3QnBQd4ptMK?=
 =?us-ascii?Q?zDxftvWJuGSkMY543jNBX+k5jKUl1KzMf7ErFkTCSF1kC8kvMvoB08OhQm4Q?=
 =?us-ascii?Q?ln/+8tDGY359bR6ncpwgFT7clqwmbx/s6A3wcQDaB89yGAMWvK7qEPuak82y?=
 =?us-ascii?Q?rbqPn7e0aK0PRvXZkGUQHP4gp2CR5RI/FtGRR760MoyuTanCPVhTfZgjc5k4?=
 =?us-ascii?Q?W7GmF3Iu0EAhrmsn92V5dW+xf1AIz3m9EQco2zQJ8QlaJDA8cuO64fDPQbYa?=
 =?us-ascii?Q?trUEjToSugOLcF4ruPVX94iGw4MFlKLUaEadxi1v6sLb7MWBDkw+wHSQ0j+j?=
 =?us-ascii?Q?tTc2FwoY7AwLYOTtz1wIFKdVLX2gOiLZ8cFxcXta6Iuw+UN1ksG8Heuuacf4?=
 =?us-ascii?Q?9V9Hk13miy3VFQVnEWxOYrcySiPldj8fG7FU8Hph5Ct4EW/z8KH/xMWfzhtk?=
 =?us-ascii?Q?srZLmcAXLPyzJI40rCXhUA6b2G42SVqnkHmIIaiBoG+0Sf2pRwnd16zZVB2G?=
 =?us-ascii?Q?g+SjIVACTFkAwQb0/9w4rQZ2fQzKgwtZ2jq4+DiyrXtJsf4Fe2eLjQ7lIqYb?=
 =?us-ascii?Q?T/y3UZYvHXrJ8acKDohKw+63QVTAsKEeoWE8U7i715PUpT5Yv44WrqVpnKPd?=
 =?us-ascii?Q?3QeZ6/lsyHvyXc6vuhspZ/HPgnQ8LOMcCMzemwU60qMvCymfKQnaL4P9YXt2?=
 =?us-ascii?Q?jQKII8taeK6TiEEphcg2SXNCw1fOcI/PDWKMAliWXj3kggakYU8vvcWFKtoG?=
 =?us-ascii?Q?nXBwRkDAqmTWWeMHDTfWIVttxZfJAqJtQEVB0K9+6/3aoQSvlBWhuSEYWnay?=
 =?us-ascii?Q?w6OPT1BsWpzTASsD9MXjNhye2gXSANaaWnugDfqV4CDPfvLGqvmojCPMdPuz?=
 =?us-ascii?Q?xEI4U00V6nlQsTprzOhecQBnLh4GzL45CmbXDK2uhmsec8Ty/SXLOzORe/s3?=
 =?us-ascii?Q?YZySZ8QSao4scvSTuL7rPyPcyobtmf2lzISCidcCuFKXO3SzkdByxw904bOz?=
 =?us-ascii?Q?aBzHzjPB9wPN3D/Yn5cGF1Af/x0W/xFVVHqvwoMDmjX0Gbyv8wzceVDbvIDs?=
 =?us-ascii?Q?3FN35MD6q5+hm+kqFU4gPwl9fSPG0BlD4+UCzoQ97BtBB1kmPe+D7Ui1I3Ej?=
 =?us-ascii?Q?c6fra7nn0mdpIQrB4TgwI67D7st9m+57m1jaRNyHcbO6n5eBJReOL1PJW9Oa?=
 =?us-ascii?Q?sQ=3D=3D?=
Content-ID: <F3A981ABCEF5A843A26EE021C28C8D58@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: M/phfw15tJWnbnbCHiGHm53uE0l2is3Qh+tadVYLQApJlMLHYsAXABdi3IFuscsSbSZrLOtwQ8GmwVXe4MscASS1T7O1r8IM3ZipsJ7Ha4ftzG+ipkO0yRPIgiinUPIOUHT85JzVfOAmCJLVw5Hh7Ulwy7BJd4JMazfRNjy1i/tNuL2OaZbiRBqNMYTFw0AFwvnZLjbpBF2qBY6w0e11K7i8jMS/Kgpt2wW2xnflypM0ewAkfj9lIyPxc4FxbxzbB2BE6ji2FAxcRNTgYWhYj20phe9TmdzV+9SpBGC/0jAgT8QSpbv4Ro6C1hrR6R1yqgrg01+IUYZ871sfUnrrJtePy+1GZQVEYIxUHPNkxl/LuYvBoWtaAeCOnc2RaPPYaJqn33yOD9le3wLUhWEfhzbpd0n2rYj4s0vn3hgKDN+NZxntUW6A7ezcBAfuelf4QUBv71To2nBa4sHRBq86SaImDDtUA3tlcWBY1KG6bMQwIjrEHOK5PX20FNlAsToMovKcTbntIdk8jP5ET6OCVli4k0wglVBQJUJZFYiMLIM1fDZqxnSeQk5Z3KPV5D247BGjd2G+C0I4UQL9vUkDmq7HwXGXJN8pEdT48CGs5WurDuc4phC6vON9FqHzRyBl
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44229062-4478-4a3d-0e1e-08dd49c977f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 11:53:00.6454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQfm3ri2rXRRwr5HLCnvobOr1HEHig3RFAxbD4UhQMIgthUhw8FLBj8R8mXAbxN7EXDrh3iMcJtbYZTAsVslUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR04MB8493
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739188395; x=1770724395;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=YeyPD6vD4uL+H7F21YcaqE6FtdIaB2mHTuYY4CBn8w4=;
 b=AIPIbix207OUd8fZ81fe1CqkbNeg0vLWYMcDWjoJh8ommkYwvHoda+p0
 uk5Qzi/cDRBhiGVyV5VEQS2WRzgDGO1r82dd6PrpjZOtVWzbChVUUokuX
 a6tAzTKr8Jw+vNOf1Qi55BcxdJESkUT4bbRhpyZB312sNs2tLFO6tm1yC
 9ssHrM68s5fGcAcFDmbQR+Z+5ZQdM+cxXXCH0/fqcu4OrxnD9EYQAj422
 MTWy6bMTEhTp6t6S4EEPglDdIl/ysFzZ71S0ylpIQrYQc90qtmKGLSrky
 u5Kfc0k6lioUeDts5WzOrj402di5CD9DxRBoxtNBN5KNUV4wmUtORt7Tm
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvECnBGpx5IY80PLQFq1hAlcnj133uLQUNPyYbNBsYo=;
 b=S0edoHgHXiWv4zEMW7duZxMHnA9TLhGCe3xh2A+Pvu8jFE4JY3wtCEYwemdRA4W47g2ROE+P9ZN6xFFFGEKKlMxcOJAhWoM0izAdsK27c5S42SYYsTfZRS7VZo4KiYqAmedKEZDfWn/O/ApsRUiX1JKSvapmuSXC2aJSD/1ANBQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=AIPIbix2; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=S0edoHgH
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: fix binman failure
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Feb 08, 2025 at 06:21:15PM +0300, Sergey Matyukevich wrote:
> Hi Dario,
> 
> On Sat, Feb 08, 2025 at 12:12:03AM +0100, Dario Binacchi wrote:
> > The commit 4bce3270d680 ("Config.in: timeout earlier when connecting to
> > download servers"), among other things, adds the connection timeout
> > parameter to the default scp command:
> 
> ...
> 
> > Fixes: 4bce3270d680 ("Config.in: timeout earlier when connecting to download servers")
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >  boot/uboot/uboot.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > index 2796b0a31010..6bbdc4151fac 100644
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -176,7 +176,8 @@ UBOOT_MAKE_OPTS += \
> >  	ARCH=$(UBOOT_ARCH) \
> >  	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
> >  	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
> > -	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
> > +	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS)) \
> > +	SCP=$(word 1, $(SCP))
> >  
> >  # Disable FDPIC if enabled by default in toolchain
> >  ifeq ($(BR2_BINFMT_FDPIC),y)
> > -- 
> > 2.43.0
> 
> Thanks for the fix ! I received several autobuild reports for OrangePi
> boards today and tested your fix for some of them. Here are the links:
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932579
> https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932525
> 
> Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

Tested-by: Niklas Cassel <cassel@kernel.org>


Could this please be picked up?

The buildroot master branch currently fails to build without this patch.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
