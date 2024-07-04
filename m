Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C46C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 14:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85AE484799;
	Thu,  4 Jul 2024 14:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnnAF98oZmd3; Thu,  4 Jul 2024 14:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFDAA8475C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDAA8475C;
	Thu,  4 Jul 2024 14:51:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A72381BF2C3
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 14:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0AC840446
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 14:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJVy-361wzsH for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 14:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.182.106;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=791577f913=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36BB340428
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36BB340428
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36BB340428
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 14:51:10 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464BtmJh003780;
 Thu, 4 Jul 2024 16:51:07 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 405u9srnte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 16:51:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2EAAD40044;
 Thu,  4 Jul 2024 16:51:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2791A2283CB;
 Thu,  4 Jul 2024 16:50:50 +0200 (CEST)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Jul
 2024 16:50:49 +0200
Received: from SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1]) by
 SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1%13]) with mapi id
 15.01.2507.035; Thu, 4 Jul 2024 16:50:49 +0200
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: Kory Maincent <kory.maincent@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/3] package/optee-test: Add support for custom tarball
Thread-Index: AQHawx+e+z40Yu4vvE6h2ojmVEQrl7HmuxF7
Date: Thu, 4 Jul 2024 14:50:49 +0000
Message-ID: <6edaae80a54b48c5a1c98e84d9b8f9fe@foss.st.com>
References: <20240620143853.1259543-1-kory.maincent@bootlin.com>,
 <20240620143853.1259543-3-kory.maincent@bootlin.com>
In-Reply-To: <20240620143853.1259543-3-kory.maincent@bootlin.com>
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
 KigDVIFS8rLV9ece1gXi5RXzYFA8uorlLnADl1nJGZo=; b=fRvu4RkeHwv+TpAj
 MnbbEUVIRDEftwZ9y7GXMTr738iDaTNxg59CjGZaQDulvqCJgnPtC9sFcuszG4xv
 6ExrvI/2OP2ChIOzjjZi30fXD3Q3+ordo6E6Ztnr3aXNNKdt/TwN2rS8W05I6xz9
 8vM8gO0kGYnHa8Tkqtl6bNPT8f0p3NNesE0XHHjFW/oMlSo9psqglt8d0jfKg7OD
 7ms9bsAYmHqrSsVZeGn9Co5n4xByOOlFAZWU4tr2hmIHSFHX+ZUtpH2us9eDjxAu
 LNlhIZBDlp1CFu8yRgN2/0OaqcWtk02V2uOQcgIAEtX9s3m9F31VWFf6OABErIkw
 ILiJyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=fRvu4Rke
Subject: Re: [Buildroot] [PATCH 2/3] package/optee-test: Add support for
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
> does not match the latest optee-test version supported by Buildroot,
> optee-test might not build or run properly. This patch adds support for
> an optee-test custom tarball URL to address this potential issue.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  package/optee-test/Config.in     | 41 ++++++++++++++++++++++++++++++++
>  package/optee-test/optee-test.mk | 23 ++++++++++++++++--
>  2 files changed, 62 insertions(+), 2 deletions(-)
> 

Acked-by: Etienne Carriere <etienne.carriere@foss.st.com>

> diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
> index 57a7834c75..1c4dbf7fb4 100644
> --- a/package/optee-test/Config.in
> +++ b/package/optee-test/Config.in
> @@ -31,3 +31,44 @@ comment "optee-test needs a toolchain w/ threads, C++, dynamic library, headers
>         depends on BR2_USE_MMU
>         depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
>                 BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
> +
> +if BR2_PACKAGE_OPTEE_TEST
> +
> +choice
> +       prompt "optee-test version"
> +       default BR2_PACKAGE_OPTEE_TEST_LATEST if BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +       help
> +         Select the version of optee-test you want to use
> +
> +config BR2_PACKAGE_OPTEE_TEST_LATEST
> +       bool "4.2.0"
> +       help
> +         Use the latest release tag from the optee-test official Git
> +         repository.
> +
> +config BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
> +       bool "Custom tarball"
> +       help
> +         This option allows to specify a URL pointing to an optee-test
> +         source tarball. This URL can use any protocol recognized by
> +         Buildroot, like http://, ftp://, file:// or scp://.
> +
> +         When pointing to a local tarball using file://, you may want
> +         to use a make variable like $(TOPDIR) to reference the root of
> +         the Buildroot tree.
> +
> +endchoice
> +
> +if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
> +
> +config BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION
> +       string "URL of custom optee-test tarball"
> +
> +endif
> +
> +config BR2_PACKAGE_OPTEE_TEST_VERSION
> +       string
> +       default "4.2.0"         if BR2_PACKAGE_OPTEE_TEST_LATEST
> +       default "custom"        if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
> +
> +endif # BR2_PACKAGE_OPTEE_TEST
> diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
> index 69e84fdbd2..9bc074b215 100644
> --- a/package/optee-test/optee-test.mk
> +++ b/package/optee-test/optee-test.mk
> @@ -4,10 +4,23 @@
>  #
>  ################################################################################
> 
> -OPTEE_TEST_VERSION = 4.2.0
> -OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
> +OPTEE_TEST_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_VERSION))
>  OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
> +ifeq ($(BR2_PACKAGE_OPTEE_TEST_LATEST),y)
>  OPTEE_TEST_LICENSE_FILES = LICENSE.md
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL),y)
> +OPTEE_TEST_TARBALL = $(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION))
> +OPTEE_TEST_SITE = $(patsubst %/,%,$(dir $(OPTEE_TEST_TARBALL)))
> +OPTEE_TEST_SOURCE = $(notdir $(OPTEE_TEST_TARBALL))
> +else
> +OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPTEE_TEST):$(BR2_PACKAGE_OPTEE_TEST_LATEST),y:)
> +BR_NO_CHECK_HASH_FOR += $(OPTEE_TEST_SOURCE)
> +endif
> 
>  OPTEE_TEST_DEPENDENCIES = optee-client optee-os
> 
> @@ -34,4 +47,10 @@ endef
>  OPTEE_TEST_POST_BUILD_HOOKS += OPTEE_TEST_BUILD_TAS
>  OPTEE_TEST_POST_INSTALL_TARGET_HOOKS += OPTEE_TEST_INSTALL_TAS
> 
> +ifeq ($(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL)$(BR_BUILDING),yy)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION)),)
> +$(error No tarball location specified. Please check BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION)
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
