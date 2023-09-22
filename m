Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910C2E6FE41
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 14:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29FC8400BA;
	Fri, 22 Sep 2023 14:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29FC8400BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvS_8hroCNtn; Fri, 22 Sep 2023 14:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13681401D2;
	Fri, 22 Sep 2023 14:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13681401D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98F011BF2F0
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 14:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C1F141DC9
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 14:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C1F141DC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8qVZk84RTJx for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 14:57:16 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::628])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75FA6415CB
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 14:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75FA6415CB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrPSFckMKmB6zWrvT9fJCXryHUbCb/ovCEGTt0dQYupyO2JHgrA/rXrJFUUJ8a0Bjxjaj5sMJYGlEKOCuR/h7WfcFFrL4aUShyGtI15w96x7QlINRmLgblB6szm0bpNatjBOXLDjvoN6I2785UlKT1GLtvGXZA1r+Eqm7kXcPehAjfJG3xOt7P4gaOIYVZ6FOreYa5/RmA4X5maXaFJBudbp0maNZnX5qE/ujJdqU4S2eQDgBHGYNGBM3P3dXBda+0FcDHJQLCqjCf6zJviQVk19jS+ETmCYyXNn9OqqGoFrtVc9isMa9UlOppCLGhJ0/YI49YXrsziiDdICbrEh2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1UNqwERjg9YL4xu7NaltqNJhe0yRpt8JrPzYgPLxpY=;
 b=fvg7i6TP6OPygzvuau2jSMwkE8Hj90fiiW3fYU9Wnb8x1Fp5jBVcKReORoVApW9v4Vz1cgN1UaWdvSiPmJScoHwnu5JVYi5LXsqJJEL5ia8gxUruZr9YNuaQ44wirTo5+0G30AJRYAOkPx/qxc7DIllqvoaQZ24j0e9GUsKJPH5wdsxytdpqQe+NN5GKR/+9Lj7yjmqr0eMnRFzMTsOBAp7b0rSdZGn/rPM5lPlfQIL42Ckkowhn1wN9kePuk2mE+7NlY20IP+YWt1q7suRaX0aXSZE49Ei3LtOz0lJUEuv6AW0qWuWOGrDTPZCAq2otQJNO0BCC9ftcIOGjtQzi2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ2PR12MB8847.namprd12.prod.outlook.com (2603:10b6:a03:546::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 14:57:12 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20%2]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 14:57:12 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 1/6] package/binutils-bare-metal: new package
Thread-Index: AQHZ3xdOetzd6qes5kKjvQ75CSQimbAm6SMAgAAITYCAAAnbgIAAD+SQ
Date: Fri, 22 Sep 2023 14:57:11 +0000
Message-ID: <CH2PR12MB5004C65AFCE251505428888AF0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230922145236.027dc287@booty>
 <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230922155735.43ddc356@booty>
In-Reply-To: <20230922155735.43ddc356@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ2PR12MB8847:EE_
x-ms-office365-filtering-correlation-id: fd52525b-3fae-4b39-32ac-08dbbb7c33a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M4yC78In1Y3cRmBYNf6pbvZCUseeEk2nbZTJ+wJdtnCvhRb18EKsbQa6mEU/v2fneXkOEQ/i17vfnmfSJLBP8YRWH5hWOEvJOgpgqlketugzVUWb4uCve3HbSjV1FCX1eCJ8FNeJQzf4wc+27hCXw77jWqT4uBLDe1P0RZMtnJrXhHhWPjlKdHXgk4ZS86IANs92BY7MBVEtyOlhXYwS8nq0z//zQmyi1fqx4QCzG1qeInMokj7azefXqwnHHOo1CnzP4Tps80ed2P/e+6/PYVhOmp3n7wb0Qb7JkX1MtbU0MuwQ1AfJv97r1VRCuE4e+O6FLJAx50OUr3/hJ2i1/DLAU2X6FHPT2bxDxjJ13wz+YH24jh6efvlWo3i1Vv3dDKXIDmYX80Ik+QkaBI7M9iLYdGEuctB7gU9zzuftCMSFJzloUQzLzrf/BxvnACnt3U//B2Ntl39AiFPpulKSbWwY31A9zHV5V+e8wWJ8sBifr6IzM4Nn/WGUiEqlig+1wbtfSZc/T9YqF/eufF08RU6m9+cGweJkjAAGB5pRw0Sb4NIFEE/3AL2y0mtMiYaoNjzU2mGSHrJGKyjPkT7IUSmMWEpxOQ1B05QFY2a7I4RYDBwtdTLgIKLH0TXvDOVJsQ8IjJvDUAE+EcfK44bp/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199024)(186009)(1800799009)(8676002)(8936002)(86362001)(4326008)(38070700005)(52536014)(5660300002)(54906003)(76116006)(66446008)(66476007)(66556008)(66946007)(64756008)(316002)(6916009)(41300700001)(2906002)(33656002)(38100700002)(83380400001)(478600001)(55016003)(122000001)(71200400001)(9686003)(6506007)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+O8pmRuQF63tnIfXOIXD3dn+ne5+B9xTFWB/Je2/q0oqYTbN1IwTkyhxjDOR?=
 =?us-ascii?Q?XZWOtjkODf8TW/KKIXKmB6r7cA2oSxkZpeIGlovunux7VWvkfzKTWCKpzEUj?=
 =?us-ascii?Q?qWTfqFhHblfWDyASy9QVOptM4QCdO49sgLHPpZvXdNTKEjwM3Ja7c/Nx7/KZ?=
 =?us-ascii?Q?VAIvXiJkD55cs235iboFxCGlEcacWhMOYQEeobHwHrYuy/xY9UhssGc5dGta?=
 =?us-ascii?Q?VhnlmnNqTk/Jhoc559j3Tb30qHOm/BPoQBrPSKHdnYNZ9PUiqLu5Ogvz7mv5?=
 =?us-ascii?Q?TXWx+WvWKxPeXUW37ZonxNbcIpuBUIeE6G3OCM6OC5CpamxdiAVRQD/cwGOf?=
 =?us-ascii?Q?Gx7e+mnWkOADNUzsQ6GZGJgK7mgnn4mVWGL6N8ptpAOKKr3MZUFYgcXe2SrH?=
 =?us-ascii?Q?b+JKbjAFT7pF3KhL6D15Q1wNGunmFz52Kx6qM5A8XjckjE/bAfvF5wOBwWCy?=
 =?us-ascii?Q?2MJLrmEkQTVjbX2HlPqeoa1BsTPxR21+pqp13LiOgOKUFNkB1hvJv+aUHgTW?=
 =?us-ascii?Q?HBQzAL1DN1cyrtgeo4JJWnbMxAv8m0TeALnBud9Phdl6ej1wLCxkOeXzMaaI?=
 =?us-ascii?Q?vm5ZRl9v7TmRXVlfpwZ2nbaYrjAe2WydgQv96McE91aU63xHrVHXoXnwhqfM?=
 =?us-ascii?Q?HA9Ej9VJ3Qtnah9k2IJT//6VSMIcziWFF85ERU5fV8N/F6gOgHsEdCLnC2+n?=
 =?us-ascii?Q?nP/ibliXqOcsd5IgQ9pFfQZ3mqt2hToQqPTAZ1GvOLXVvsTRucT27KDptFZW?=
 =?us-ascii?Q?0VouTpnSnVBnEY0Z7E89Fhqkp8TB4OKjPlJ4fYBeSU2Y/82wKB6z2OloKy/K?=
 =?us-ascii?Q?OPuikQVttY9r3R1sGxICvjx1KW43UkfOBxUT5Jg9I+MrTOhpe11jQUaoyDp8?=
 =?us-ascii?Q?z/JOdu1N9jTqb4QpcKYCJXIy24Jimtbr0xOgibNJrThQu6N2Nq0gpa8geuCL?=
 =?us-ascii?Q?oNKyl6N9v+puQ2Lx05S0rhV6kzP3vDkfRP+JpHHgU1gnUk/lfXV6bDI15mZE?=
 =?us-ascii?Q?wDPuNbzxRdGfhnuefff67cpPkjzH34v9Zf/mpB0HrTgqiFc4S+Fe+f+YAHx2?=
 =?us-ascii?Q?crNDzHFwpw7r88hPgsxh/gvQ96l0h8t4vhNM9eJ2nLgdubskNKsj26JQqbS8?=
 =?us-ascii?Q?EWKiqDvCnpdPXrkvkYYeEKj9MBASmBX2lDoCAztx5D2zygs0A7BzKirvdr/F?=
 =?us-ascii?Q?WSk2l1wGeIN2J/mejwCXwMX1zfGEj28BX3KVmrkjw9wi/eoUMjRmcE7hWerS?=
 =?us-ascii?Q?laRydEOVibiKszZF2Ov8d8BN5kDqePpPC75kQoplMUVa62AXEHnrhO5HuwkO?=
 =?us-ascii?Q?ZsfLzAZpoQMNQp/5Otw+mj1CLOsE8aodB+2zEYnYZ6XNXKJCNq7re4d7Ou3B?=
 =?us-ascii?Q?RhkZbJ/5OGAp7hQIRlHSxefQUa87wFoRKSb6JBxXRAlBFeX1ItQOmZN/V+tB?=
 =?us-ascii?Q?zsroIRBH1bwTjvs4wzT5GjvFl9Vxhl+2EQLWv77gxJ+EL31SKOHVFNBLr8Lg?=
 =?us-ascii?Q?EicOkJnGHnwUeKjBTiXXnIREt5A8fQpz8nBkB5ePc1jTTEY7fVecf7dc/QRH?=
 =?us-ascii?Q?WV/F3SPVxO65CSwXSGQMkjIyCrLUs+4g5Lkalgwr1d9uvXuUWUQrEgNeLbVi?=
 =?us-ascii?Q?Z9551i0OHbnPR8O7ejtYHyE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd52525b-3fae-4b39-32ac-08dbbb7c33a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 14:57:11.9487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+XqQ34sydlxFzhIyPtDVLGtOylrSgmrwJeLGFvsjqSjvMzzdLJqUdUBDSSbQFWP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1UNqwERjg9YL4xu7NaltqNJhe0yRpt8JrPzYgPLxpY=;
 b=uqnF5zkOvi2ITNBNgWbaCjSz2gAKHdO7RlvOylNbW8lEwJoxjUIBeDOXSCRun4ga3pGl+EsC2/MD65AQTpvUoUVDG4C3XdVXxdqK7m9wUOw69hzVzGfEF8qmCUCbZvRQueVnxwus40m5IdeXpCkqlJ6N10AX+glFtkI9bCWiYpY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uqnF5zkO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new
 package
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
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Hi Luca,
> 
> > Hello Neal, Ibai,
> 
> > thank you for your persistence in working on this!  
> 
> > The overall patch set appears pretty clean, except for a few remarks as you can read in this and the other replies.   
> 
> Thank you for the kind words.
> 
> > I had a small hiccup while trying to apply your patches using 'git am' from my inbox:  
> 
> >   error: cannot convert from y to UTF-8
> 
> > This is probably due to this weird header value:  
> 
> >   Content-Type: text/plain; charset="y"  
> 
> > Probably some dirt in your git config. However the mbox file as downloaded from patchwork did apply without issues. I don't think you need to resend the series just for this.  
> 
> I will create a clean patch set with v4, so this should hopefully disappear.
> 
> 
> > This patch adds a new package for building binutils for a bare-metal toolchain.
> > The cpu architecture is defined by a toolchain-bare-metal virtual package.
> > While any cpu architecture could be used, the default configuration 
> > will be a Xilinx microblaze little endian architecture, so that 
> > buildroot will be able to build the microblaze firmware applications for zynqmp and versal.
> > 
> > When configured for the Xilinx microblaze architecture, all of the 
> > binutils patches that are applied to the Xilinx distributed 
> > toolchain will be applied in order to generate a toolchain that is equivalent to what Xilinx distributes.
> > 
> > Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> 
> ...
> 
> > diff --git a/package/binutils-bare-metal/Config.in.host
> > b/package/binutils-bare-metal/Config.in.host
> > new file mode 100644
> > index 0000000000..036698d418
> > --- /dev/null
> > +++ b/package/binutils-bare-metal/Config.in.host
> > @@ -0,0 +1,19 @@
> > +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> > +	bool "host binutils-bare-metal"
> > +	help
> > +	  binutils-bare-metal is a host utility for a
> > +	  bare-metal toolchain
> 
> > "a host utility seems a bit of an understatement, I'd rather say "Build to GNU binutils for a bare-metal toolchain" to clarify this is building no less than the GNU binutils.  
> 
> I agree.  I will change this in v4.
> 
> > +
> > +if BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> > +
> > +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION
> > +	string
> > +	default "2.39"
> > +
> > +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_EXTRA_CONFIG_OPTIONS
> > +	string "Additional binutils options"
> > +	default ""
> > +	help
> > +	  Any additional binutils options you may want to include
> 
> > Do we really want this without a valid use case?  
> 
> > The same question could apply to the _VERSION setting, however I feel it's reasonable to keep it...  
> 
> > This applies to patches 2 and 3 as well.  
> 
> My thought was that someone might want to add additional bare-metal options aside from the Xilinx microblaze target.
> 
> If not building binutils, gcc or newlib for microblaze, users might want to change the version and the config options used.
> 
> > diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk
> > b/package/binutils-bare-metal/binutils-bare-metal.mk
> > new file mode 100644
> > index 0000000000..fd983abc93
> > --- /dev/null
> > +++ b/package/binutils-bare-metal/binutils-bare-metal.mk
> > @@ -0,0 +1,56 @@
> > +###################################################################
> > +##
> > +###########
> > +#
> > +# binutils-bare-metal
> > +#
> > +###################################################################
> > +##
> > +###########
> > +
> > +HOST_BINUTILS_BARE_METAL_VERSION = $(call
> > +qstrip,$(BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION))
> > +ifeq ($(HOST_BINUTILS_BARE_METAL_VERSION),)
> > +HOST_BINUTILS_BARE_METAL_VERSION = 2.39 endif # BINUTILS_VERSION
> > +
> > +HOST_BINUTILS_BARE_METAL_SITE ?= $(BR2_GNU_MIRROR)/binutils 
> > +HOST_BINUTILS_BARE_METAL_SOURCE ?= 
> > +binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
> > +
> > +HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+ 
> > +HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB 
> > +HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
> > +
> > +HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
> > +
> > +# if toolchain is for microblazeel-xilinx, apply Xilinx patch set 
> > +ifeq
> > +($(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH),"microblazeel-xilinx
> > +")
> 
> > The toolchain-bare-metal is added in patch 4, thus this series as-is is not bisectable. I don't see any obvious solutions as toolchain-bare-metal selects binutils-bare-metal so I guess some maintainer can provide some hints on how to handle this.  
> 
> > The same issue applies to patches 2 and 3.  
> 
> Ok, I am not sure what to do with this feedback.

> I'd say waiting for Buildroot maintainers feedback.

> > +HOST_BINUTILS_BARE_METAL_EXTRA_DOWNLOADS =
> > +https://github.com/Xilinx/meta-xilinx/archive/refs/tags/xlnx-rel-v2
> > +02
> > +3.1.tar.gz
> 
> > This is not a huge download (500 kB compressed, 5.6 MB  uncompressed), but we use the binutils patches only, which account for 10% of the whole archive. I wonder whether there is a way to download only a subdirectory from github.  
> 
> > And looking at the patches themselves, I wonder how many are actually needed. At a cursory look, some don't really look like production code.
> > Are those changes being mainlined?  
> 
> Our initial plan was to make binutils and gcc versions that match the Xilinx software release as closely as possible.  This is why we just took the patch set blindly.
> 
> From my view, it is easier for me to maintain this if we either take all of the patches as is or none at all.

> Agreed it is simpler to maintain, so this boils down to the question:
> are those patches being actively mainlined? I have a sad feeling about it as the number and overall quality of those patches seems the same I saw more than an year ago.

As a quick test, I tried removing the Xilinx patch set to see if the build would still work.

I ended up getting the following build error with the zynqmp pmufw:
microblaze_sleep.c:81:9: note: '#pragma message: For the sleep routines, assembly instructions are used'
   81 | #pragma message ("For the sleep routines, assembly instructions are used")
      |         ^~~~~~~
microblaze_selftest.S: Assembler messages:
microblaze_selftest.S:554: Error: unknown opcode "bsifi"
microblaze_selftest.S:555: Error: unknown opcode "bsefi"

This is the same error we see when using the zynqmp-pmufw-builder.

I will go through the gcc patch set.  Perhaps instead of applying all patches, I just look for the one that fixes the above issue and apply that.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
