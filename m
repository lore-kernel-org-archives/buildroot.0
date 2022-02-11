Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA41C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 13:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B1A60C2E;
	Fri, 11 Feb 2022 13:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXaK7PiYZqPF; Fri, 11 Feb 2022 13:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D4A960C0F;
	Fri, 11 Feb 2022 13:20:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EFE61BF2CC
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 13:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CF1260675
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 13:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6Nmk7rV_YJc for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 13:20:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C061660C0F
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 13:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9so98SLndfbpPmmHfD6sYVaVy+FsUVBsezDVyRg1ApfBQux2C9jNcqlJdI/B7nAovhdoz5tL5s1k5WrtmT6ZbPd08ZSeqOrCpptVigrOYxIEXqTowuQrHqvHOZsMnMZ47RKw85jC7bXjEues1JJQjmWmbBTqajKfMYVvOHvGC1xHjTc6ldrLnRvbV+vsCPrTJRgpEDw7vNs2u/q6D3pa0Ts4e5v3dTMasvihNPVUcC0yUBhe5Wz5dLZb11StQpAkf4//0orfJjoVjyh89utmoZOoukfu+HYFIyMBsW3dFK484NEYteybM2VyHajAVYPse9JATe0AM6TC1AeDqP21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyC79V/73vSrepPHbHIj3b0/n3xWgsj5LHYxMJfzMy4=;
 b=PeAd5wP3PMDj0Uw3ac8NtvJ4ohU3Fq+u6+knoBmMmcyXrnMQk1minXgidjPRBr/SBPlVGWGILjvPTRNaiQEernKkdrrk8x4lfujG5r2+cemCZJFbIubaEcHh/JitppLHdVfSE5XzegBZa+BfNQ6SS+kRg9CVcNWyi1Upq5lK9zle+Y0ib3A8jOe8C5sPec0BWae0u3rtCQRarN/x7Zhbs0b9r6nERSr+UlWsW7t8LdeYYRV+YqDtSkUgsUCBickY1qwtNPl6+lR3Rwq9l4MZC6ugBXpx1btif3A7vgc/T/zibiBQumANoNaOYFf4rmL1W3+f0sCnyJRgCLOkAHmFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyC79V/73vSrepPHbHIj3b0/n3xWgsj5LHYxMJfzMy4=;
 b=lZjiJRA387zoZgBw8cG6Y+LKggypXe8gfzSRCAnXK1fuAdzqX/J6fidSJzM41yKhnJ61IB7qgkCYQPuViid4sNd5OlseJ4NIC05iGnWTpchPbnQiuzf5Ot8B2GGSmG/aIWnSwpPo1gk138/XDlEpmJnyUgZmwhPZSf8XDGR8kY4=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CY4PR02MB2325.namprd02.prod.outlook.com (2603:10b6:903:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Fri, 11 Feb
 2022 13:20:31 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:20:30 +0000
From: Neal Frager <nealf@xilinx.com>
To: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>
Thread-Topic: [PATCH v5 2/2] add configs/zynqmp_zcu102_defconfig
Thread-Index: AQHYH0GFBqHvjb+TsUOnsm61PnAReayOUpywgAACe4A=
Date: Fri, 11 Feb 2022 13:20:30 +0000
Message-ID: <SJ0PR02MB775869979604C048051535B0D7309@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220211121740.1257919-1-neal.frager@xilinx.com>
 <20220211121740.1257919-2-neal.frager@xilinx.com>
 <SJ0PR02MB77587E2B08F7E6F164D63093D7309@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB77587E2B08F7E6F164D63093D7309@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82424c02-6c01-4f69-a23e-08d9ed614717
x-ms-traffictypediagnostic: CY4PR02MB2325:EE_
x-microsoft-antispam-prvs: <CY4PR02MB2325B470A18891B2E8BEB15DD7309@CY4PR02MB2325.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pMUDSHksOnbdDC92AfmFkJgebPg/3r/97GHLiX7fU2ZUT348+53gpq6H9WJBfeiM1kAmYpfkYxw9lZmqRZX5NFlGqulxfb96Q7/H9Yr4lPhqbqd0JqmC04tl8bE4d1x00gXR0QQJtut61mbns3fgzIt74qbS8ss+GE+ll1LisoMQru7zmq31gTqphoscRSetRFXNYA+WYJnaQLwPTc7M3qO0N9e2DscUH5eLBCOg4L6QON63OYajqDzx9N/ri9RzHtlHsi/aRvwjBFpymZdTAATHob81lyZabs37IkbCWw7gQKPfncqZbc+GxOkdRJb8mbf/Ga/whbzgGjbq3LzuPMwpjdcAoikxyVnmTrbZupikBAlnHA69meg27AzfSiK7KMSBPv6XO3b2K3Yla/IVZ3Ddd2Yce6ddq0xeNZxgmd+ga8eEvt8SVfHcuaMWiG6w7hnAAJxyjFoI1HFnD0gPtQjF8TShOep0ZnIQPRI+g7vt0G4YWjRnC8JjpiaooxhIzDDsfu5eOmOeSHr55AxzxCYWYt8wNflCPOidpr1EVr7xPUfWMBgE+k/xvL6SVovr0H7aAefvLVQfbbfF7kWkFpQgYvflq35R6sNmKUC8mq+t7bpT+nUmy3IolDMy3nWj5R8sIcLIA6V0t7omWrOheeldSF04bNPA+7xSgg0kXnL0VTjOk4vYRe8GlFPxiOUeB3bgCbTC67igEXLDP9GT7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(54906003)(52536014)(9686003)(26005)(66556008)(4326008)(8676002)(110136005)(66946007)(86362001)(38100700002)(7696005)(6506007)(64756008)(76116006)(2940100002)(122000001)(186003)(38070700005)(66476007)(316002)(66446008)(71200400001)(508600001)(83380400001)(5660300002)(33656002)(2906002)(55016003)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KNf9ctjRLWvpLp12UPOHENUqoUitnYVFdlz1mtv0BdiE5ZlyZZIT5f5ImRcM?=
 =?us-ascii?Q?XHCtMdrTahNhrBtQRIhEdzLgCjX1TYIkvTusTWAVzY+d2uCt3MjFShzlJxky?=
 =?us-ascii?Q?TzOgU/npkH4Hfg4mNsoaElmhOMLshFn3zDT6Wwt++WS+yE1xlwADSdB0R+lG?=
 =?us-ascii?Q?SUZLv3d/h7fNfhVJ6wayZhVocaZ6Qre8xReXG831fwJHfGl2ZFoUkpj0noVQ?=
 =?us-ascii?Q?5q2qOVZG4YklNMtR0HdbbZZzXGxM9oTS7WYy+BBEFsP5gedigJz8a83lEHlO?=
 =?us-ascii?Q?TzVyLQUW1O2slDfCj2CU9gnd3+c6ktirrXilFIRVf/oxZIEvrC0kqmvj6Pdg?=
 =?us-ascii?Q?MHKIPa0Shw6VV4ZDRcGasgJk9dMHxRyk33GuB9cYhWeBoY95SN7V/NH60sMu?=
 =?us-ascii?Q?TUfTbNy7razeRQqT6B6TYOM38F3KZ11e1iX/SrSgFhNrUKhYkJiItvnJxcpJ?=
 =?us-ascii?Q?juk9qalLuhkU6Fudt5vlFiw1zF1cIENNAQ9NOfhbleiwRMW+2aIuu1Sg+to8?=
 =?us-ascii?Q?HiAL7Nr37JGQlvVAgWdiWbDACNjPLxajM9rbAA48bmXeWboNdnKDwpWuLA/r?=
 =?us-ascii?Q?8JviZLWvwsGetsDxB+YXgNNkd76x1+LVnZAA3qM5kEp8ii1cXANfFAnDUgNX?=
 =?us-ascii?Q?ByoAXgL/Aet+2AwSiIFthhGEc18tJgGogd3BUFz5KTOt530YQ5gbTRotFuD8?=
 =?us-ascii?Q?bnLz/P/lF1I+qbF5bi7wFUUOoVMS5Y919dyjNhxyf2VdmF3rLuUEbwWdSylu?=
 =?us-ascii?Q?Xkp5C4BKKjPDT2CNPXw4JnXgmCZEb333URys4FiPk7RxHFsiFJ3LfacKffdj?=
 =?us-ascii?Q?5AMzsI9NTGxEh3wWDiCmEv4y2mGwkvB8BYshbwwFj9E4mTzmM3MQ6nkET40W?=
 =?us-ascii?Q?HgLpImsde1ebglNmOCOeRn1Bm5yLK6uVFKz6gckzfJCHdgcGnRX83+8v88Wi?=
 =?us-ascii?Q?ubAsiLxPmC4flu7pff6DgICQJk/4Z1eDfMJAfhVp7WqOk6jbFd1qlftdIJ7a?=
 =?us-ascii?Q?CciGHFXmzOviwQFy06qKcneTFABxgvkD82kMTfgbJT0qHT/c5xBWXRbovJlG?=
 =?us-ascii?Q?+ieoMu3NC//07khkbiHXpH8vVb8I23iR6Pjd+ykVGHC3JcKCOBjac4SZbZL4?=
 =?us-ascii?Q?fLZi9hz1gPLKqyjikeJeTcTCaJ35dKOz9YmfAG4IxKdXvSDlcveFzV/fjdeo?=
 =?us-ascii?Q?TUZa+JecV5WZs/axaMB0Q5En934tTdNQCEXCltRrlR+bOMz0kcNflscqnv6Q?=
 =?us-ascii?Q?LS3gmHL4d2ep/Y1WCEg7LH8g3t3zvdjS2TXUADCPoK3F+1WRopA+lldb63Lw?=
 =?us-ascii?Q?1xCZeflavcmnxeWE7QJ1uJRUkxLcgueGcBgyA8Os77xFTEAsLJEHAKARiLyP?=
 =?us-ascii?Q?HJ8NQGoI18g8LSicL9xd7dyS+4ObdAIQKzt0c1Cgv9oTWEjypZ2zQVBCAZF4?=
 =?us-ascii?Q?O2h+ia3gYguA5GjA7qPqtImn5S/g2TCEwSP+x7FcTfplGd3/Aoo3rai9IPwA?=
 =?us-ascii?Q?jhc/OgW/xI6m6Jy9EjwDg6iv4pvUNhOLOEBFvwPv/8BqXNMVfs9LbrzwSFHU?=
 =?us-ascii?Q?2f8Oy5tS4AB6HmQG/tGX+gw2ktKqCfM4dwGEWkCetG3AddLAY8xd9CPqAh7M?=
 =?us-ascii?Q?Zg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82424c02-6c01-4f69-a23e-08d9ed614717
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 13:20:30.8571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WgIVBW5ZgSGYphCEy0XQmJpSkbGEyG8CIXXQKIVLGMLJV36/n9MKE1raLiVxxyQdzyXGmljdFr2/Ud4rqCgABw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2325
Subject: Re: [Buildroot] [PATCH v5 2/2] add configs/zynqmp_zcu102_defconfig
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
Cc: Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio, Luca,

As PM_CONFIG_OBJECT_TYPE_BASE is used only a single time in the pm_cfg_obj.c,
I am going to solve this by removing the define and replacing it with the value 0x1U.

In the meantime, it would be great if Luca could update the script in mainline to
handle new Vitis generated pm_cfg_obj.c files.

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
