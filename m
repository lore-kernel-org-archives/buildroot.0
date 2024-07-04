Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97E1C3271E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 15:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62218402E0;
	Thu,  4 Jul 2024 15:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHtKgCQ5s8It; Thu,  4 Jul 2024 15:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2485740375
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2485740375;
	Thu,  4 Jul 2024 15:51:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 242311BF2BF
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 15:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C00740375
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 15:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uY1qNPvYfIg5 for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 15:51:49 +0000 (UTC)
X-Greylist: delayed 3624 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 04 Jul 2024 15:51:48 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75CF1402E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75CF1402E0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=91.207.212.93;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=791577f913=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75CF1402E0
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 15:51:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464C30jp013828;
 Thu, 4 Jul 2024 16:51:21 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40295dnh5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 16:51:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 37D2D40048;
 Thu,  4 Jul 2024 16:51:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17AA32283C0;
 Thu,  4 Jul 2024 16:50:56 +0200 (CEST)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Jul
 2024 16:50:55 +0200
Received: from SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1]) by
 SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1%13]) with mapi id
 15.01.2507.035; Thu, 4 Jul 2024 16:50:55 +0200
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: Kory Maincent <kory.maincent@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 3/3] package/optee-examples: Add support for custom
 tarball
Thread-Index: AQHawx+fVZJavimhQEWSWMtb0kyHWrHmvFTX
Date: Thu, 4 Jul 2024 14:50:55 +0000
Message-ID: <957c75fa652a40ce9abeb198788639cd@foss.st.com>
References: <20240620143853.1259543-1-kory.maincent@bootlin.com>,
 <20240620143853.1259543-4-kory.maincent@bootlin.com>
In-Reply-To: <20240620143853.1259543-4-kory.maincent@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.86.128]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_10,2024-07-03_01,2024-05-17_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 H+2uIt9T61dW1pSLHrCRxpG+EDI3P7lVpYAAk06ABDA=; b=I2SVMKPkzmYXhC/g
 BJrQj9RYebPnSi65zylYeuwotkE/l50jnggS6FI6/crkPLLj/K59xPwVYnlMFwnO
 SyYK0fTobQ7ofC3db3yTIbe67aYuqx2foDQPvU8oOMM0DLRff4rXf8285rrH3Xmn
 IG0F8NEa7EdBBIIXRbebqZs5a4w/1Uhx3A/Q7FI6mihGQ5DeZ0aOyEhg9GH955Rf
 nmaKoOEX3d/3fJvt4y3Dpm6uv6cg6Db6bUoFSeqoBBkDsv0w+agQjZEIEYHjZ1lS
 /6T22KXhAdGAoMOanPj3UBZA/r4MLVVl0Br+T0sgaIbBL3XRYWB4SPd25IdxgehW
 8XxE8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=I2SVMKPk
Subject: Re: [Buildroot] [PATCH 3/3] package/optee-examples: Add support for
 custom tarball
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Thursday, June 20, 2024, Kory Maincent wrote:
> OP-TEE OS supports custom tarballs. If the OP-TEE OS custom tarball version
> does not match the latest optee-examples version supported by Buildroot,
> optee-examples might not build or run properly. This patch adds support for
> an optee-examples custom tarball URL to address this potential issue.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  package/optee-examples/Config.in         | 42 ++++++++++++++++++++++++
>  package/optee-examples/optee-examples.mk | 26 +++++++++++++--
>  2 files changed, 66 insertions(+), 2 deletions(-)
> 

Acked-by: Etienne Carriere <etienne.carriere@foss.st.com>


> diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
> index eb6ee16502..83a1e9cb09 100644
> --- a/package/optee-examples/Config.in
> +++ b/package/optee-examples/Config.in
> @@ -26,3 +26,45 @@ comment "optee-examples needs a toolchain w/ threads, dynamic library, headers >
>         depends on BR2_USE_MMU
>         depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
>                 !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
> +
> +if BR2_PACKAGE_OPTEE_EXAMPLES
> +
> +choice
> +       prompt "optee-examples version"
> +       default BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
> +       help
> +         Select the version of optee-examples you want to use
> +
> +config BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
> +       bool "4.2.0"
> +       help
> +         Use the latest release tag from the optee-examples official
> +         Git repository.
> +
> +config BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
> +       bool "Custom tarball"
> +       help
> +         This option allows to specify a URL pointing to an
> +         optee-examples source tarball. This URL can use any protocol
> +         recognized by Buildroot, like http://, ftp://, file:// or
> +         scp://.
> +
> +         When pointing to a local tarball using file://, you may want
> +         to use a make variable like $(TOPDIR) to reference the root of
> +         the Buildroot tree.
> +
> +endchoice
> +
> +if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
> +
> +config BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION
> +       string "URL of custom optee-examples tarball"
> +
> +endif
> +
> +config BR2_PACKAGE_OPTEE_EXAMPLES_VERSION
> +       string
> +       default "4.2.0"         if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
> +       default "custom"        if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
> +
> +endif # BR2_PACKAGE_OPTEE_EXAMPLES
> diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
> index 7d52a277d2..2e20dc4dd4 100644
> --- a/package/optee-examples/optee-examples.mk
> +++ b/package/optee-examples/optee-examples.mk
> @@ -4,10 +4,26 @@
>  #
>  ################################################################################
> 
> -OPTEE_EXAMPLES_VERSION = 4.2.0
> -OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
> +OPTEE_EXAMPLES_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_VERSION))
>  OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
> +ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_LATEST),y)
>  OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL),y)
> +OPTEE_EXAMPLES_TARBALL = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION))
> +OPTEE_EXAMPLES_SITE = $(patsubst %/,%,$(dir $(OPTEE_EXAMPLES_TARBALL)))
> +OPTEE_EXAMPLES_SOURCE = $(notdir $(OPTEE_EXAMPLES_TARBALL))
> +else ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_GIT),y)
> +OPTEE_EXAMPLES_SITE = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_REPO_URL))
> +OPTEE_EXAMPLES_SITE_METHOD = git
> +else
> +OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES):$(BR2_PACKAGE_OPTEE_EXAMPLES_LATEST),y:)
> +BR_NO_CHECK_HASH_FOR += $(OPTEE_EXAMPLES_SOURCE)
> +endif
> 
>  OPTEE_EXAMPLES_DEPENDENCIES = optee-client optee-os
> 
> @@ -28,4 +44,10 @@ endef
>  OPTEE_EXAMPLES_POST_BUILD_HOOKS += OPTEE_EXAMPLES_BUILD_TAS
>  OPTEE_EXAMPLES_POST_INSTALL_TARGET_HOOKS += OPTEE_EXAMPLES_INSTALL_TAS
> 
> +ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL)$(BR_BUILDING),yy)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION)),)
> +$(error No tarball location specified. Please check BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION)
> +endif
> +endif
> +
>  $(eval $(cmake-package))
> --
> 2.25.1
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
