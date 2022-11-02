Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AB3C43217
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 17:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E60416EA;
	Wed,  2 Nov 2022 17:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E60416EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1LLA03K2wer; Wed,  2 Nov 2022 17:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB2FC416E5;
	Wed,  2 Nov 2022 17:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB2FC416E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7AD11BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74C0F408BB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74C0F408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXDCHdqDdlTv for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 17:10:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03AC940329
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03AC940329
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 17:10:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beD/Iy31OuWfUhvDialKDJuHDPFe84gRGbBHakdN90U02gVVxMU1GlpIoNky5qAPPqmISSs8V9BoBXjIDuxPTJrz2TW35DdltvqPe6lH9IP+dFO/Vl4CY2q+eApE6mqWpUakAC/BxAiijnC24iDLp2Tz0MmIAkGDKM0cVC0bwjjsYH50Aqw99JJK0Dm4NTINtPzshuW8TjiWpKUh/dEqDWw6uAp0MUyQL1/bZPCkw9UXVHRzJl9BlTbkYQ19iN+Cr/1tjbUjKf0NJiD2zmOXvTWGttqXS2TYGGjx/uz3MI37FrqIcVrwoOs8QN70LgnkzciMf1Qqm/q1DCKg9Qp1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02A4PPqAO9hSZo6JECnhdYLKgqI+u8x6vkmDE6ocodk=;
 b=DwPQsmjGIdhxyHlehBflHRFVHayXqc++NRjNiS9M4oiXulEvNDc1ZkyG6OtnbW/oim0QvMKCO3nNxtO0HPHat881v6rck6+ADC2W/lsirpPHgQp9tp1MAo3TtBzQ0yxgzbKRcvnbJEmzNI6zGKxPkDd8hLU8yy9GI5V3AopdbjIsiU/VP/qJsnTJoKuju7M1rEcftE57n9B6MgHu0/T8kVaEVtoU5RDgwNCdaXYji0EflIOBjZMXURureEjtzk+ZkjQ7AqLaYxbA3IAMgUCV9HVHWyQ0sos+V0ee1OYXxNasp5mho8UaN5t1V2xIw4MG2av7sAMvJRogyRfjyxkmaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 17:10:44 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000%7]) with mapi id 15.20.5791.020; Wed, 2 Nov 2022
 17:10:43 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v1 1/3] add package/versal-firmware
Thread-Index: AQHY57QIHKFrcdzw5k+BQFfLZ6/jW64r5T2AgAAEJAA=
Date: Wed, 2 Nov 2022 17:10:43 +0000
Message-ID: <CH2PR12MB5004BF77566EF32C9500AA3FF0399@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
 <20221102174407.4b29cba1@windsurf>
In-Reply-To: <20221102174407.4b29cba1@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH2PR12MB4264:EE_
x-ms-office365-filtering-correlation-id: 8de38010-caf5-4b0e-c350-08dabcf52d49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 757F/RUtrjfp52dewi6/qkqEGSLRCwNeeCgvWhpIuG4eJlwnZdC2BpoflVwacRM/dAykuZb5iyvD4JrGR2MQy+Z3jIbxtHOHzvX9D+49rWsiDgRNSYtGo4G32LkVr+A8QJtiVQFwKJlMYtHGZaeDtT6t6QAWlV3Eas+J1q84/WJk930vLVlUod3NQks60hveGkJ7VhQtjOOyMfQKBtwbJ8OwSRy0YtLr2COJs105O7qwPa1EiTZ44sPUpox5ThYoxDgvqXjeHCwGBxTWb0EJEPymjpWSvn8/tGufckgJXhQsG8MCGCrJMyEb8l942PpbWch0yJtYoYOpecWNJ7P1mHvTsffyqGlGZAnlJDvQgG9t5en/0sZayiPS48nA8+89Ijy3MF35SbTMlmR6NUP206j26gEgPsXwjoSF4ovhaBM5STCbvCedoDxhGf4zgT6z167qBD4gmNAZKF4+nG7O+H2mzI+HDQuyo026J35ovn+/EC7/MBFc1s9ozHWCohHcv+Y2/X3WkNJtZlzbmGx2spWg+wl6A6uifeyIXoG8lemHgIsfmqjbnpp4sDiDPV2TTQuBLwsSUq6nSbBmdRw5OT4yfDtSgfs/eK7H5uD5bbOjthyLVlW91yCpb33omqI6iXU5z+puUNVKKXnQnr+LkFhzvDreYqSl2pwjNtYkr3MKhnbhqzQ5dUZw2xzZgN6mEqwbgAWD5SWEWBqSHUZfb4De+xgdyeab+EnfpDeo4KJ+SJplAV1wiRcoF9EibzPUmw2TLzraUTBAazU80wIdNQehY7qrXzeuy2mFUcSJHKs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199015)(83380400001)(64756008)(86362001)(55016003)(122000001)(6506007)(2906002)(7696005)(966005)(71200400001)(38070700005)(38100700002)(33656002)(186003)(9686003)(478600001)(66946007)(66446008)(316002)(66476007)(8676002)(66556008)(41300700001)(76116006)(6916009)(5660300002)(54906003)(4326008)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FFdmgsQU7e8ntc7lrdrLqlXTC/1QcqxCD2cnWo8aRzdcHdHdMsH9tJejuSxa?=
 =?us-ascii?Q?KE35GkkjmsT3YC/wUu0g4GYVlI2DSrPsASbDAbdxihXi9rlJguFOVheukLED?=
 =?us-ascii?Q?lIcjP/UWKt6w61Ksci0/dLlK0mZp2/IvMLpRVGUBqmkS/Im78J9wpW7l/NJ/?=
 =?us-ascii?Q?Cft6N8OPiltPmFE9rFtJk8KQMJ8utjS5/O1rpDK3DdaTrHCXu4zha50oO2i0?=
 =?us-ascii?Q?Pu0vP9WMMDMw8W6w5p475isuChW0Mr1d2LuR+lU9oX7mHt+1N9TWksi1Uhyq?=
 =?us-ascii?Q?PbSna46qa+KgVFVgf9X/AAa89v1lDBUT39XYFRMKttY4XbtebXknj6QUTDRO?=
 =?us-ascii?Q?UD8dHXfAG+hiLHqiI3h99gUb/5I7o7jszTfZm7GVqkN/+jPiLyVQEuIEd0Wl?=
 =?us-ascii?Q?1TFeiBCN7u9G3Yo+FhGRhUsDyodFStkCTQzbh/B07phsYdeASYauSdb+P42o?=
 =?us-ascii?Q?AdkQymkMiN475c9lb+BXdK9AvGwPxbpSYz5ujH7hglBA5A5qraPlP1ciwDGZ?=
 =?us-ascii?Q?P++z6boBQcU6FPQrpv1LvCSsiRSo0YxJo9AFkZqVBnNUDkpRRQ4VuizssPq1?=
 =?us-ascii?Q?BV0UsBU+P9HBnj6omKuPzOKh2rzqTutm21E5bgWrKsN5p/Q4/UryL0X2DNV6?=
 =?us-ascii?Q?DHOjgu+Nk5t5xBNSfAfqwqi5oZXLuUTIQxVUhGZYjR+w8Xt7aT6T61fFRUN0?=
 =?us-ascii?Q?fbFIKPHCNVAmjG+o7nwnutgLemKKwYaJWUanTu+Cbb1Z7GFmjU334U1J5PZ2?=
 =?us-ascii?Q?1OgXkcqevetiP+IHJ0GbcBlrCbqZL2kopxCkImCoFPvuPOuQnnGMgvo6nOGD?=
 =?us-ascii?Q?76bM80SoCzdHKogq2Cta/pqdqNEcf8FD/Wmaw8DgKeeBJslJ/OUjlOoGcPrt?=
 =?us-ascii?Q?xEDhph7C6gFrayHT9WVhCyjRPZvwyhMVY7zwkNYVyQuUF+CCiJq4TkRhEFpC?=
 =?us-ascii?Q?7X9NYaoebf66Ubd7xvjFHtbvK7fzC/NSQHrL6C1X3sAhYWIhvEuJ99hN0UDQ?=
 =?us-ascii?Q?cnOUgAJl5eFJ+Cqx5mTmJRiN5YBS6VlaT6/ygP78zs1aAUNXErT6d2hAdp/y?=
 =?us-ascii?Q?NGDO6XOt3rQypRjlBX/fsoBfYJZEcxnLxl3TA8mfvo2oAp1s3qJHGhlTi0jZ?=
 =?us-ascii?Q?SGhBhZWq5r36soUKzgwxpvlUnqKqu7hPI8u/dK49zHafJUcHj3gIOQp96JB6?=
 =?us-ascii?Q?55BbTb6djOUTPayCQyPztF/5GL1sxx63Jd/ldSstoav4eVjIHdLnSallLexn?=
 =?us-ascii?Q?aD3sjrR97r+ZPMNoc5ObTm9ETK+nUbOEeyGmQdtYYojiTTItAMuCabFeZej3?=
 =?us-ascii?Q?MUNPe9Ovecwv2ZVc8wCo6RldhjrvK+6EyHgOaKG5/krZS8TSdxfKiT9iciEo?=
 =?us-ascii?Q?GkJU8PDlcrYQM+ZzLe8bKZlnmAE5nAcnEPARFGX1ZMRYWMKmqIpcQR0l+ONT?=
 =?us-ascii?Q?7a9F8tmFFVm1ht5u1fJqHDVcu87XUDzx/BTfd0VYDlDEOFGfxh92f1q8AoXy?=
 =?us-ascii?Q?BsC/imJ6r/WBE7gEB2EMKI1xLCLLf3ni8ALKBHEkTPd2WDC2NgVvOxJBG7B2?=
 =?us-ascii?Q?jw14XcKaAwX+CO//6FjkjljDbBQdIdXYPKYGiRmVcbPIOGMpz9XbkKRwHmhR?=
 =?us-ascii?Q?h790/g9PjsMTwF52feL4HHQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de38010-caf5-4b0e-c350-08dabcf52d49
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 17:10:43.8852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3TX9R3921DrJlgkTzS67R2/l7rLVQRmgYk7REx2lh9CmiH4KQvjFUOd7xjC4ikk/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02A4PPqAO9hSZo6JECnhdYLKgqI+u8x6vkmDE6ocodk=;
 b=QmpYlSadOwwXWiXJJ7aehJVqDYcteCsB3vmGi65Pf4kpihWWa50D5WIimBrYLPLlfAx95xiFHSxaaejHeyaBDfyrjkoZfmzMEdIQPKmKt1GABb+bVitq4GI6CgyAqtcMvrq4/cCC8gkKphBxDiQ9f5w86VAxLpnmRhQHmVL9Ews=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QmpYlSad
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: "O'Neal, Terry" <terry.oneal@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> Commit title should be:

> 	package/versal-firmware: new package

Ok.  No problem.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index c8183b2290..ed696f4cd0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2176,6 +2176,7 @@ F:	configs/zynqmp_zcu102_defconfig
>  F:	configs/zynqmp_zcu106_defconfig
>  F:	configs/zynqmp_kria_kv260_defconfig
>  F:	package/bootgen
> +F:	package/versal-firmware

> Final / needed here.

I saw this as well, and have fixed it for v2.

> diff --git a/package/versal-firmware/Config.in 
> b/package/versal-firmware/Config.in
> new file mode 100644
> index 0000000000..e184ba1925
> --- /dev/null
> +++ b/package/versal-firmware/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_VERSAL_FIRMWARE
> +	bool "versal-firmware"
> +	depends on BR2_aarch64
> +	help
> +	  Pre-built firmware files for Xilinx Versal boards.
> +
> +	  https://github.com/nealfrager/buildroot-firmware
> +
> +if BR2_PACKAGE_VERSAL_FIRMWARE
> +
> +config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
> +	string "versal firmware version"
> +	help
> +	  Release version of Versal firmware.

> Does it make sense to have the version configurable? If the version is configurable, then probably the location (Git repository) should also be configurable.

I can imagine users may not want to always update the boot firmware version.  
While I plan to keep the versal defconfig examples on the latest version available, I expect many users may want to build with older versions available on the repo.

We could make the repo location configurable as well, but normally, it should be coming from the Xilinx official github source which will be available soon.
My plan is to migrate this package to the Xilinx firmware repo as soon as it is available.

> How do we expect this to be used by people who design their own boards based on this SoC? Will they fork this repository? Do they have the source code to create their own firmware?

> Should the version have a default value?

> +config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
> +	string "versal board name"

> Should the board have a default value?

Yes, this is probably a good idea to make sure something gets picked up in case not specified.
For now, I will set the default to vck190 in the next update.

> Think of what happens when people just enable this package, without using a specific Buildroot defconfig. In particular, our autobuilders generate random Buildroot configurations, so they should build.

Ok.  Clear point.  I will set vck190 to the default, so that it always builds even if not specified.

> +	help
> +	  Name of Versal target board.
> +	  Used for installing the appropriate firmware boot.bin.
> +
> +endif # BR2_PACKAGE_VERSAL_FIRMWARE
> diff --git a/package/versal-firmware/versal-firmware.hash 
> b/package/versal-firmware/versal-firmware.hash
> new file mode 100644
> index 0000000000..7a8ea04c91
> --- /dev/null
> +++ b/package/versal-firmware/versal-firmware.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  
> +14c505cac0216637ab2d08590acffb4861446e480bdbf7417e699816048ab39b  
> +versal-firmware-v2022.2.tar.gz

> Having this hash value is a bit useless when the version is configurable.

Ok, I will remove the hash file, since the version is configurable.
I will also set the default version to latest available.

> +sha256  
> +f9796efcd98f47fb3e1d5d4c23e224613e91c70207b759a2087de368be50c315  
> +LICENSE
> diff --git a/package/versal-firmware/versal-firmware.mk 
> b/package/versal-firmware/versal-firmware.mk
> new file mode 100644
> index 0000000000..35dfbaa512
> --- /dev/null
> +++ b/package/versal-firmware/versal-firmware.mk
> @@ -0,0 +1,24 @@
> +#####################################################################
> +###########
> +#
> +# versal-firmware
> +#
> +#####################################################################
> +###########
> +
> +VERSAL_FIRMWARE_VERSION = $(call 
> +qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_SITE = $(call 
> +github,nealfrager,buildroot-firmware,$(BR2_PACKAGE_VERSAL_FIRMWARE_VE
> +RSION)) VERSAL_FIRMWARE_LICENSE = Xilinx-Binary-Only 
> +VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
> +
> +VERSAL_FIRMWARE_INSTALL_TARGET = NO
> +VERSAL_FIRMWARE_INSTALL_IMAGES = YES
> +
> +define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_plm.elf \
> +	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_plm.elf
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_psmfw.elf \
> +	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_psmfw.elf
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_vpl_gen_fixed.pdi \
> +	
> +$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_vpl_gen_fixed.pd
> +i

> Please indent the continuation line. But maybe this could be handle in a slightly better way:

>	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
> 		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f) \
>			$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f)
>	)

Cool.  Thank you for this!  Looks much nicer this way.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
