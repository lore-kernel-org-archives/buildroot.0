Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0727C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B7FF430DE;
	Wed,  1 Nov 2023 11:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B7FF430DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLtY5-SIiibY; Wed,  1 Nov 2023 11:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B98E6430DF;
	Wed,  1 Nov 2023 11:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B98E6430DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97B241BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 428F46FCA3
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 428F46FCA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z3V4J2MfpLXd for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:43:38 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::610])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EC406FC9F
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EC406FC9F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+PNl7d4FvakBS84G/wuAKmGWEbQKZGtjqYyD3Cr/JJTY/y+Qw5jmsaQ5aAXoFEqAyKo9Nz9Odt0qz04Cm/B3Ilh+laaztEDnHEpolSzU53+pYgvAWdu5496V2ECA+jl6Z1hNaJ1zcFE1HAFfY0Fm6wgdbJAJVKax349M3AGmBzOTLKUx3qkwE2L6kLhItHUDwg3vLajAKMKYKQ/ymxtlV0TSANaeV+wYj0wl2oirhHXTQBJhM1rF9tApISBQMGJz9lJXsDAedFE8iCCINotL2kjMXIJCn00mSQ5TzVn6mHov+nvEsO+C8EFckdVcipGSfoEZ6+3AMrY1THPPuoWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zrv+O8AkfgQcCqDrfWyINCeQ876uR1A1ykPONwuek0o=;
 b=j8LZi+76yecdJ/HFNLOP1avesNpih3a0OWwIcowQe1grdhqrLydUrDb7FL1jnS7htNX6OyGf5np6spHyBY6l+ZVgp9krm+PLbX9QbV6MnjoXFr6hBqr22aPSPzgnVCn2zaGdBsI0qdjLemVDBT78DyPuzr8XUuqLx3Z5PB2C3BYxs8YvRBY4HsTwTlD+k5Z5eG7CTNU1DrAkHlOzM1zHrd0spzeUxpDQoSvbae15YtpIY0AHNfN3kXn6zFRX6C1tJFvRZK7g4Y0DdPH84iPmZ74cPt7OxC9X6HMJGn0krqiIkkeu4hska1DPzEfHYbPQ4VWEoXu7SHgctgJheKKNmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB8075.namprd12.prod.outlook.com (2603:10b6:610:122::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Wed, 1 Nov
 2023 11:43:34 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6933.032; Wed, 1 Nov 2023
 11:43:34 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
Thread-Index: AQHaA0qXU55l7C7pwkan+EbiGTH5Q7Bj6Q6AgAGBHmA=
Date: Wed, 1 Nov 2023 11:43:34 +0000
Message-ID: <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
 <20231031134317.4ce2349e@windsurf>
In-Reply-To: <20231031134317.4ce2349e@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB8075:EE_
x-ms-office365-filtering-correlation-id: 4ece3877-08a2-467c-3bb7-08dbdacfc7d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jaJzM8VneduXMPbSa/lfCqZUB1Z7UWbcqGY9l6zxQGlk1Dxv1VoVZ1birsc7snTeRcMAdhRyoo6D9DoFQ9kCFnpPrYtUMROEe0ESp6yJDoOFkd6M2PJdqATOr+JeCWj6DeeQTZLYpQsXen4Xtwsb0BpiyKViRdLp7GZUnE45WPjq0zsoo53Zir61lZra+Sk/nn1kdGpeZ1Q7UPtEJoucUkmsFOOuQ/WTNi7kiNhGFFB2j40CV/hYq8znfVzmncuEnrUftrG+pZ1A0n13vA7KzH7ekyBekHNCp+zUT+WpAgXXZwGurKIUio81USaZoPduaRYqiNlD9Y+c32gGk4kjTarZyAzpy7Q+ggCP9zfLwBS6F0kWl7MOMUf6x5vVL6ZCg5Rb12e4UmvlCIjAD4j38p6mhTeyq5o20wjPce6cgQk7XL7XvBqONw+/Gax7oSYVFzx1xt8L1++33jo8uL6UZcZS/nDScLLZ1A4swjV41nfAY9MuPBMFsXRHrADX3aAtDumRu9SdcVmwAbLfPNcTMvkTDKA2X3YDjpKVkucaSxF3PEKds7sYJ8Y7y/CMuZOMWtunXQ8z6paTA8stDHlmbnKzk6HdRstPQITV/4hAibk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(366004)(39860400002)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(64756008)(9686003)(26005)(71200400001)(66556008)(478600001)(8936002)(7696005)(5660300002)(2906002)(41300700001)(76116006)(8676002)(6506007)(4326008)(54906003)(110136005)(66476007)(52536014)(66446008)(66946007)(316002)(38070700009)(38100700002)(86362001)(33656002)(122000001)(55016003)(66899024);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?STWuqeSjrOvIytSc/NWryvdR+e80cHV4IAlIoyWgV5LoqKTU3nvhHCnzceXd?=
 =?us-ascii?Q?hy15keWwEUt2WsAa4ldZ3lpOVa9I6XcvJEPziszOKU2nCKNgNpf7IPETxaRX?=
 =?us-ascii?Q?WzJAJeGRFa5IF/KQRzT8AW0plFQuBiDp6KfOHxxqoLYlSUrYl12ETRKw3SoX?=
 =?us-ascii?Q?Su5FFeexGSBIjoAikP2RLauGjRZDkWtLGMspiUm8I+E2/Rz2VLbKS3nTk+yG?=
 =?us-ascii?Q?DsC77IAKlEzT1lwQ0BKgjPenoKC7Vti8pB+gLx3pLegd13zGaWu/x6Kgpqor?=
 =?us-ascii?Q?LCEc5Zz5sdLMYOFrvqdYTfUi3DZGWU5j2FyG1UZifDHpmeNbyZFU7D2EfsHR?=
 =?us-ascii?Q?7Wtq+6qD1Okj6UG7Gf9u70dL4LEonCIF55i9QfY++kivoS9Nk65HKSaQCS4Z?=
 =?us-ascii?Q?z0gbINyP7lEB9xJ2xqFbrlHMr+In6N2uywdlt3oGW3fESUdRxL1POquEs2S7?=
 =?us-ascii?Q?uVw7bdiFQxNedRmHiWLjL5P9lYzakcvRprRgrd3kAoldDj47vJvIcv6lhL+l?=
 =?us-ascii?Q?D/W0DsXwVGFjKKcMGFaSJxME9rHrHPE2PwhKPWNFis4zeNWYv5IUcVJ3pfsT?=
 =?us-ascii?Q?NkbN1PyIwthGzv02T3YNxuaAS+tNVhMPmQfNuaf5OSXmO2cN/cCvdM+FVgjC?=
 =?us-ascii?Q?xAtemtnX1/lip78EZcrhzj3irwCRJK6wnUyV6Bt8LWk1slTLJhkm6OQOHvbG?=
 =?us-ascii?Q?vKHtepbIOUl3hGQZAWtbqm5KaWGc++88YDrxSR6Ib2AxizP2KKsY8lHtg3xF?=
 =?us-ascii?Q?zKtqeraxa4AuOWJB5l+SdVem4cV7DBiGlkmh7/N7JrCMImFvjEqb+VYOt0O3?=
 =?us-ascii?Q?ebuM6mG353tKZuSLyOAlFn/4i3yM1DfF4XgIRXoigphG6cn0mwijwIO9me61?=
 =?us-ascii?Q?PzL/wgSciskhygIfw2NwQTaIJtUYlmkercSwkFcvZikZWpNzJhQ7Fy9Ea69O?=
 =?us-ascii?Q?XJWsQgjvGiFXwrlBjccxpoAwoPSGiCiSvTBKZkrVWG1/mkhnis3SnGoTPvwM?=
 =?us-ascii?Q?afuvfQ/3rs2UfTwJXAbIVIutBtHf7cOWofVglmWax+1ERyqcCQqzWjC8Zdxj?=
 =?us-ascii?Q?7KAu8tLdLmKB/ZImDQDSEt6ApFiEVh+XIrzLDYx4XzmbDUBZANMr3ITgEdQM?=
 =?us-ascii?Q?7MUiH+27dApH1P1T1fldfDW5F5Wwk+7WfsFVoi7IfP0q2Zyvi2/lQxHhg3d7?=
 =?us-ascii?Q?gN4Kwoh03Ywz6nv+u3+8qfhJteX4ao2dpDtXlI8e3udasMuphI4122/fDRo8?=
 =?us-ascii?Q?SG6lsCNZGUSK0lZ/K6nnsPidv95dGAhJLKR/KTwOe8+O3ivDBqRb1jqB0S4w?=
 =?us-ascii?Q?8siYrRzAzqOBmZlM5K1N3FGJ6gBqOBPEoIJTZABOnviDIgd7CF3WbRYFMZku?=
 =?us-ascii?Q?vXtaS58pliMFF3gYSBZIvVLT8cdZCeXj1dcUrlEAZH5KD+ABZupj1LkYm6Bm?=
 =?us-ascii?Q?xTQKy0MZ854h5C/d6PkP5tIu/rBa0U6SqfSxbP1tcBCE8pTxixLo6CZVIhFG?=
 =?us-ascii?Q?d4RDbrMnLSG8iyeRp39AIEvM/lMFjrFRpVGSZWvoOjRLyuLH572sRPJpuAUs?=
 =?us-ascii?Q?VF45g1NhNbQ2XE7FHD4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ece3877-08a2-467c-3bb7-08dbdacfc7d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 11:43:34.8088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70PbKAD2ip+eRe1xVnfOJF9Z/xeZkJDh/82g5iG2s0FlRw458ntM2VBI4Jg5rjrD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8075
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zrv+O8AkfgQcCqDrfWyINCeQ876uR1A1ykPONwuek0o=;
 b=bXZO5vfPe+uOQaC6lJqHCnS6oHMG8b66u0b+VwY+diqe+mWzWdtcDrH59xuNTYq8RYWXQKoWZTssWs5F9kk3juzm4+y1EZc97SKPp+NDtytlIUYtIRElNqrj6kA6ToS3ZXKAF3BhZhbERrG216NRdGzfg05QJ/qfzFHGhW2hskI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bXZO5vfP
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,


> diff --git a/package/newlib-bare-metal/Config.in.host 
> b/package/newlib-bare-metal/Config.in.host
> new file mode 100644
> index 0000000000..be92a1d6a6
> --- /dev/null
> +++ b/package/newlib-bare-metal/Config.in.host
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_HOST_NEWLIB_BARE_METAL
> +	bool "host newlib-bare-metal"
> +	help
> +	  Build the newlib C library for a bare-metal toolchain
> +
> +if BR2_PACKAGE_HOST_NEWLIB_BARE_METAL
> +
> +config BR2_PACKAGE_HOST_NEWLIB_BARE_METAL_VERSION
> +	string
> +	default "4.1.0"
> +
> +endif #BR2_PACKAGE_HOST_NEWLIB_BARE_METAL

> Like the other packages: this Config.in is useless, so it can be dropped.

Are you sure that the Config.in files can be dropped?  

When I drop them, I am stuck with the following build error:
Makefile:576: *** newlib-bare-metal is in the dependency chain of toolchain-bare-metal-buildroot that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

How can we deal with this without selecting the packages and having Config.in files?

Thanks for your help!

Best regards,
Neal Frager
AMD

> diff --git a/package/newlib-bare-metal/newlib-bare-metal.hash 
> b/package/newlib-bare-metal/newlib-bare-metal.hash
> new file mode 100644
> index 0000000000..1a681ecf77
> --- /dev/null
> +++ b/package/newlib-bare-metal/newlib-bare-metal.hash
> @@ -0,0 +1,8 @@
> +# Locally calculated
> +sha256  
> +f296e372f51324224d387cc116dc37a6bd397198756746f93a2b02e9a5d40154  
> +newlib-4.1.0.tar.gz
> +
> +# Hashes for license files locally calculated
> +sha256  
> +231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  
> +COPYING
> +sha256  
> +a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  
> +COPYING.LIB
> +sha256  
> +f3b7f3e4426b1fa6f60198dae7adfedd94b77b28db2d108adc0253575011e0ff  
> +COPYING.LIBGLOSS
> +sha256  
> +422aa40293093fb54fc66e692a0d68fd0b24ed5602e5d1d33ad05ba3909057e9  
> +COPYING.NEWLIB
> diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk 
> b/package/newlib-bare-metal/newlib-bare-metal.mk
> new file mode 100644
> index 0000000000..a42e04877a
> --- /dev/null
> +++ b/package/newlib-bare-metal/newlib-bare-metal.mk
> @@ -0,0 +1,37 @@
> +#####################################################################
> +###########
> +#
> +# newlib-bare-metal
> +#
> +#####################################################################
> +###########
> +
> +HOST_NEWLIB_BARE_METAL_VERSION = \
> +	$(call qstrip,$(BR2_PACKAGE_HOST_NEWLIB_BARE_METAL_VERSION))
> +ifeq ($(HOST_NEWLIB_BARE_METAL_VERSION),)
> +HOST_NEWLIB_BARE_METAL_VERSION = 4.1.0 endif

Just hardcode the version number.

> +
> +HOST_NEWLIB_BARE_METAL_SITE = ftp://sourceware.org/pub/newlib 
> +HOST_NEWLIB_BARE_METAL_SOURCE = 
> +newlib-$(HOST_NEWLIB_BARE_METAL_VERSION).tar.gz
> +HOST_NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
> +
> +HOST_NEWLIB_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0 
> +HOST_NEWLIB_BARE_METAL_LICENSE_FILES = COPYING \
> +	COPYING.LIB \
> +	COPYING.LIBGLOSS \
> +	COPYING.NEWLIB
> +
> +NEWLIB_ARCH = \
> +	$(call 
> +qstrip,$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
> +
> +HOST_NEWLIB_BARE_METAL_CONF_OPTS = \
> +	--target=$(NEWLIB_ARCH)-elf \
> +	CC_FOR_TARGET=$(HOST_DIR)/bin/$(NEWLIB_ARCH)-elf-gcc \
> +	AR_FOR_TARGET=$(HOST_DIR)/bin/$(NEWLIB_ARCH)-elf-ar \
> +	RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(NEWLIB_ARCH)-elf-ranlib \


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
