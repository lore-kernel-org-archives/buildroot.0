Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2BBCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 12:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F696149C;
	Wed, 18 Oct 2023 12:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F696149C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3N8YV7LvyslK; Wed, 18 Oct 2023 12:46:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3871561498;
	Wed, 18 Oct 2023 12:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3871561498
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE5211BF2A3
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 12:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4B7C40396
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 12:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4B7C40396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siYaN58kJbQ8 for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 12:46:47 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C59F4037C
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 12:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C59F4037C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aE8e3wuCW1Mb9SW0QPbFM83zpzrjJbJQkjHqMau+h7gUUcYTxeeZgAQD99BXDTN6z73whuqyk+iFlZAjAY4U74T15mlwmCzJuEixQEJo2yH7xrP7IW7ECKz1fGRVqU4st0s4Of3tPSZXekq54R698ICsykkn3iQHNdatRbmMbla6tlkwQAfPIboQ2M5W2j+rTv3vNl1JnfADdimGxyDZH1chuewd9TnD9hdEhhjN2FcCJZ+fVdrX0buXNBtXGZwwnTrtW4BDhnpuqmQpc+oAN5ImLKZb7eNZ9QVSd/OJigbJE6eSgyrf4Wza8AIdH3diVkePDTmCP+GoCPV+X2GDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abpErWsyYkarCr5qwijow1MtYNvOYWgUNhAtvpSDUjA=;
 b=YMvZYB9c5FkaEiFhxRXBOV1cKilH0IPcV0M5jHT3mOEiXUnAvaXnnWNONR1fe6R3Gj9Ac8ntq0G8kp+pPxG127gTsvwevQf70OIbai/4Dcg9KTHrKLJ7BgUm1IQkCt6ZVUp08oOvxWYcUZoSmyYgOEx7TWNY4gUS1Yfx6P6Kb6WkFfwXFsUNywphe4xNJd9jcPkJ1KRRGFowFTIDmE762Yh/rvlSWLe58gFos/vd6dr80rsW6sc0ovzCPqxE6DdFawV/kDrTFRm0Nt6yDj8FeoofqSTtTLhygewU+GNmigECEEzoQcsVs9fLo15KNWu2FISzxgOAuUyom4K6Br8lBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 12:46:41 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::53cc:feb5:431:6de1]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::53cc:feb5:431:6de1%4]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 12:46:40 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v4 04/10] toolchain/toolchain-bare-metal: new toolchain
Thread-Index: AQHZ7vmb81VA12+4i0uq6vMxKQbJh7BMVGUAgANOgZA=
Date: Wed, 18 Oct 2023 12:46:40 +0000
Message-ID: <CH2PR12MB5004F0808389B4F67C1936A6F0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
 <20230924151205.2099293-4-neal.frager@amd.com>
 <20231016121148.0eaec482@booty>
In-Reply-To: <20231016121148.0eaec482@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CY5PR12MB6299:EE_
x-ms-office365-filtering-correlation-id: 48dc1542-b42a-4ce5-cba2-08dbcfd84653
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S0jSQGpjlEcJW1rmzqdWLHQ36VRspx9VWD1aJZqeAC//a5GHXnr0vR3N1idDK/tT1eo/kA7xrPB9bVOkF8lsjGSdqsYQ6xFnOL+n1rKAMsVbY2/mHh3w3T9mDOIgkrg2vQKhpn92muT9ZxzKUb6k5sXvnugqswOy1ilIUUK6ZqCSBXIbbz0xhL8OTMlN2L4gxwe6abOx6meN4fQDcS5FAr5PBKXGDCRO+nCPmdJ+bbF55qlwJKUQpq64BrqLlStdK6INqatmy+MAJrVBHQWToAVyU/J+FHhWeTGX3IenniT8o164mcCT9CcvWhjb8RB4em79VJgO5ReBuxa770m7ZWMZWD6oW6nLL/avA1sE06EnzL8HyTH/3Ej29fBEfC8jNdun+XHKzHvCsAEBiIB7y2zeiddGF68NZcQ5ynqHMfaUN+VzstuqMPjvNOtGHlfSKG0qFFU6u+E0lH+v34YLlRRAbMSZgQICOdJyRuq8faTzBYwtS6X59FHygvbcdhHuZ8CDhzSnK+NT1jvnegmhRhJ+MIJGlwEbAxq5whXiuD1QJXujAetZZ0qs3SpDucRzVj/Vfx6ycLItdbb0ZoswW/F7ZnoJTa5zRIHKcI2EzDRGIsGZdAHAScAH4jyXWaKO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38070700005)(2906002)(478600001)(55016003)(71200400001)(8936002)(66476007)(38100700002)(52536014)(33656002)(5660300002)(64756008)(66446008)(110136005)(54906003)(76116006)(8676002)(66556008)(66946007)(4326008)(122000001)(316002)(86362001)(41300700001)(9686003)(7696005)(6506007)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dwtHvtVlUMY+ecKlfXqGW2WuJI6Oth2GjDL5j7j0C6+9EcB+sDRHgpVYUSeF?=
 =?us-ascii?Q?FpHedFXuWpTIs6pa/ZdGnF8KtUXpYNezZ+adC/He2NQWq02qybovYgixCgru?=
 =?us-ascii?Q?UV4WfmEg5O5trHcliS9CEKuk7ym/y2Uk8b1oxt+p3F8rAysISkFrVhXRQK6v?=
 =?us-ascii?Q?abgAOkbXunmuh8eExWzrHoHrmv0tnzvPDcFlOmmHDjI/EDakPsgG02UFqYwp?=
 =?us-ascii?Q?mNs8PFvDAY32qd+6nSTLV8hvusUM5AhmPOAesFmxa91fQjZZYO6p2B3p9+fw?=
 =?us-ascii?Q?x2SmMSdaDq4hidMw/bck3vYCYFqMX8JWGS/uKmL2cXLePAR4LE3ba4k2mlFI?=
 =?us-ascii?Q?VdDxgKzgXN371Jm6oDqBKXT7UdEN8Zh4e0c2FCwJk8RX8FRptO6arFI2Mt28?=
 =?us-ascii?Q?R0zwz4PowwEDqPKXdtA29KPcdCPu7Z2Im1zN/tUQRfw4U/g6uyfOSX2guQeC?=
 =?us-ascii?Q?BhnGdb94slroBPRQ8b/5Y8dC4R44cKmq8O6ctoVu3kHIS+s3/YHoA30jeZs6?=
 =?us-ascii?Q?Fm8bdiWtEs5Lv0tsRoBpP8anE12XrKDy79wcIksQfLquGGATdwU6mIx7WoB7?=
 =?us-ascii?Q?VANz78FM7iHaHshJD3ucwbbzyRCJhAUiDgYSe3eqsHmhGJ48sEtbyzu1jbWe?=
 =?us-ascii?Q?p2+CrzIMfbcOTSNuvmTO05H4iFJp4EbH1iIJnZegLSZhlB57gzd6gkSf7AEi?=
 =?us-ascii?Q?N8p7d76jMXk6ouvcf+XAuOfOgPm86iV2ZOpx6tef6jW/FAdRG6zh8OMI5he/?=
 =?us-ascii?Q?eeeIZKdXjnoXUCyWFUnNwiu9AJZ3dzz9wbfDGkQwIbrF3v5noZVuHKG0XZLe?=
 =?us-ascii?Q?YKVmsA1847E1JRoLIRDEGSUYRfMEZINvlgsb4xCNr66F8Het5Z1EaeSUtN2O?=
 =?us-ascii?Q?Oj6ELEDTSDvoUuqqJKQNyajgiKG5sbf9zwGQaMzpzh86AOt2gnzcRkYJoZlH?=
 =?us-ascii?Q?uGr/7MsvY3ADuAr/9zjwEzUDqBFCqIZ26vjMtUhZfS/OGsY5Ab+A2oJkvSTp?=
 =?us-ascii?Q?O6R10N9ar9U3oA5tLiKaFlrUyBiGaXLQAeZykA5vJlcMj+6NXzQ5dpKvi3+d?=
 =?us-ascii?Q?jz1S4MkBj2L2gHbKEJ92kxGfWNoDDT6eVDL15Vg6rvuYDZHC/9jLKOympAm8?=
 =?us-ascii?Q?PMrwknKS/ee0T0UecOynBJlTSyItLGZjNyGbEb5foTZd97G1/9yPOG2M9niv?=
 =?us-ascii?Q?SZwgbWYiB7yAGUWND8J9xjXPz96n272M2ukSxxGwGUEFZ/0bSXKkGJNZqin6?=
 =?us-ascii?Q?Lv+2tVE8jv5fKLiNAZLsZDojUXIPG4GkuGzwyGJFZIxjReH+HEEgT0e3lFgd?=
 =?us-ascii?Q?SWpwmybvTyRZGRVtrLAB0ZGnzEz9Gf8RbotHa8VW+/GBlrJ+WYUQfCXTTfnj?=
 =?us-ascii?Q?yywFa96RKtfxbe2QI9ap39ZDKGDhXo+p9ZqV2+KceN3txSuGNemcmVGkRf4B?=
 =?us-ascii?Q?lKgtAEk+dSFT5MxXn+glfkxEOniZbeh4bxypBgArPQ5rMdKih98E+m71bVYp?=
 =?us-ascii?Q?58/Hb0romvL+1FRB3pvVJ2B8wiOba558ofyWO8hXLX3vir8xHD+UJtYrqMt2?=
 =?us-ascii?Q?e0OSQUPtU3uRripnhbE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48dc1542-b42a-4ce5-cba2-08dbcfd84653
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 12:46:40.2284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1cd/VbgNEnJotWrdOaEEm9bIw43L8X3wSLFqCifdKfvcQ0D4KDm+0WuVxDHTOs0b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abpErWsyYkarCr5qwijow1MtYNvOYWgUNhAtvpSDUjA=;
 b=xEfBRMOWdVMDEBj5+MUGSundqU8Gy05Ei48IanpQlVuN6Ig0qKZzvYPaaOKJyhWyFuyC7MTahpCt1vRcEjuhbJY+hS5rKYigo+I6bL6zPa0Ct7oKqezwZe+c1xVID5aJPp341/1NPLbQgdJmaLuax01TFAr+s7ZDLuFDUrm4mfU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xEfBRMOW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 04/10] toolchain/toolchain-bare-metal:
 new toolchain
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch adds a new virtual package for adding a bare-metal 
> toolchain to buildroot.  By default, this package will configure a 
> bare-metal toolchain for the Xilinx microblaze little endian 
> architecture.  When configured for the Xilinx microblaze architecture, 
> this toolchain can be used to build the microblaze firmware applications for zynqmp and versal.
> 
> Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - adds select option to bring in all packages needed for 
> toolchain-bare-metal
> V2->V3:
>  - no changes
> V3->V4:
>  - moved from package to toolchain directory
>  - improved menuconfig help comment
> ---
>  DEVELOPERS                                    |  2 ++
>  toolchain/Config.in                           |  1 +
>  toolchain/toolchain-bare-metal/Config.in      | 21 +++++++++++++++++++
>  .../toolchain-bare-metal.mk                   |  7 +++++++

> I wonder whether this should be in
> toolchain/toolchain-bare-metal-toolchain to make room for a future toolchain/toolchain-bare-metal-external.

What is the value of adding another toolchain in the name?

For example:

Internal Toolchains:
toolchain-bare-metal
toolchain-buildroot

External Toolchains:
toolchain-bare-metal-external
toolchain-external

If anything, I could argue that we should then rename 'toolchain-external' to 'toolchain-buildroot-external'.

That would give us the following:

Internal Toolchains:
toolchain-bare-metal
toolchain-buildroot

External Toolchains:
toolchain-bare-metal-external
toolchain-buildroot-external

What do you think?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
