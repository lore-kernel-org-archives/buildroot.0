Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6C6C3271E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 14:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D91DF846EF;
	Thu,  4 Jul 2024 14:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7W1Sj_e72ju; Thu,  4 Jul 2024 14:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1D77846F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D77846F8;
	Thu,  4 Jul 2024 14:51:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3BA31BF2C3
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 14:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACE2260851
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 14:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHsHy2jQTwad for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 14:51:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.182.106;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=791577f913=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D560760866
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D560760866
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D560760866
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 14:51:03 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464CQwW5011328;
 Thu, 4 Jul 2024 16:51:00 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 402uu13qen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jul 2024 16:51:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5A79140049;
 Thu,  4 Jul 2024 16:50:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F225D226FB6;
 Thu,  4 Jul 2024 16:50:41 +0200 (CEST)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Jul
 2024 16:50:41 +0200
Received: from SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1]) by
 SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1%13]) with mapi id
 15.01.2507.035; Thu, 4 Jul 2024 16:50:41 +0200
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: Kory Maincent <kory.maincent@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/3] package/optee-client: Add support for custom tarball
Thread-Index: AQHawx+eGai1Sh/ft0aLDNinsNnikbHmuOF6
Date: Thu, 4 Jul 2024 14:50:41 +0000
Message-ID: <66b5999ac0c54a3d881157d07f409257@foss.st.com>
References: <20240620143853.1259543-1-kory.maincent@bootlin.com>,
 <20240620143853.1259543-2-kory.maincent@bootlin.com>
In-Reply-To: <20240620143853.1259543-2-kory.maincent@bootlin.com>
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
 fc8rh7rnMCdjUQ11CyLPhnL4apBETm/hsxSmVgHWcio=; b=QBp/eu4vrOUw+/ei
 pNIfrgdgBNRwXJOe9cfeco0voYZIVERKscRcv+jph82706aA3ucPRGi8O4vrNWGJ
 QqB4ht+mtFzV4zxtezPlumSgbr1BwEDkGq9jbaYC6uBhgEMjmkMAJ0Q+pbI/mh/0
 swsSenpSj3rcgx1m+QUqIq6iLTfA90zEGfLdhz68KhMXLxXwvgVSpKe/yBNeP2rD
 KSa+vr3x9Jze/gLOvzOf+cSgL9hhuUXCj486XgC/U+f3NTfDVUzPq4jXblAGLyXW
 ExIY6JCVHdk/s1W8PB1tAgQiXAJmM1oFL+k6eMw8YyCkGYUgIL8xoOws7CzFrOwF
 vXSOVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=QBp/eu4v
Subject: Re: [Buildroot] [PATCH 1/3] package/optee-client: Add support for
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

Hi Kory,

On Mon, Thursday, June 20, 2024, Kory Maincent wrote:
> OP-TEE OS supports custom tarballs. If the OP-TEE OS custom tarball version
> does not match the latest optee-client version supported by Buildroot,
> optee-client might not build or run properly. This patch adds support for
> an optee-client custom tarball URL to address this potential issue.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  package/optee-client/Config.in       | 38 ++++++++++++++++++++++++++++
>  package/optee-client/optee-client.mk | 24 ++++++++++++++++--
>  2 files changed, 60 insertions(+), 2 deletions(-)
> 

Acked-by: Etienne Carriere <etienne.carriere@foss.st.com>

> diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
> index 4061164cbb..3a59ce9725 100644
> --- a/package/optee-client/Config.in
> +++ b/package/optee-client/Config.in
> @@ -17,6 +17,44 @@ config BR2_PACKAGE_OPTEE_CLIENT
> 
>  if BR2_PACKAGE_OPTEE_CLIENT
> 
> +choice
> +       prompt "optee-client version"
> +       default BR2_PACKAGE_OPTEE_CLIENT_LATEST
> +       help
> +         Select the version of optee-client you want to use
> +
> +config BR2_PACKAGE_OPTEE_CLIENT_LATEST
> +       bool "4.2.0"
> +       help
> +         Use the latest release tag from the optee-client official Git
> +         repository.
> +
> +config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
> +       bool "Custom tarball"
> +       help
> +         This option allows to specify a URL pointing to an
> +         optee-client source tarball. This URL can use any protocol
> +         recognized by Buildroot, like http://, ftp://, file://
> +         or scp://.
> +
> +         When pointing to a local tarball using file://, you may want
> +         to use a make variable like $(TOPDIR) to reference the root of
> +         the Buildroot tree.
> +
> +endchoice
> +
> +if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
> +
> +config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL_LOCATION
> +       string "URL of custom optee-client tarball"
> +
> +endif
> +
> +config BR2_PACKAGE_OPTEE_CLIENT_VERSION
> +       string
> +       default "4.2.0"         if BR2_PACKAGE_OPTEE_CLIENT_LATEST
> +       default "custom"        if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
> +
>  config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
>         string "Path for normal world OS secure storage"
>         default "/data/tee"
> diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
> index 6600a9c4fc..a91548a43b 100644
> --- a/package/optee-client/optee-client.mk
> +++ b/package/optee-client/optee-client.mk
> @@ -4,10 +4,24 @@
>  #
>  ################################################################################
> 
> -OPTEE_CLIENT_VERSION = 4.2.0
> -OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
> +OPTEE_CLIENT_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_VERSION))
>  OPTEE_CLIENT_LICENSE = BSD-2-Clause
> +ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_LATEST),y)
>  OPTEE_CLIENT_LICENSE_FILES = LICENSE
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL),y)
> +OPTEE_CLIENT_TARBALL = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL_LOCATION))
> +OPTEE_CLIENT_SITE = $(patsubst %/,%,$(dir $(OPTEE_CLIENT_TARBALL)))
> +OPTEE_CLIENT_SOURCE = $(notdir $(OPTEE_CLIENT_TARBALL))
> +else
> +OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPTEE_CLIENT):$(BR2_PACKAGE_OPTEE_CLIENT_LATEST),y:)
> +BR_NO_CHECK_HASH_FOR += $(OPTEE_CLIENT_SOURCE)
> +endif
> +
>  OPTEE_CLIENT_INSTALL_STAGING = YES
> 
>  OPTEE_CLIENT_CONF_OPTS = \
> @@ -38,4 +52,10 @@ define OPTEE_CLIENT_INSTALL_INIT_SYSV
>                 $(TARGET_DIR)/etc/init.d/S30tee-supplicant
>  endef
> 
> +ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL)$(BR_BUILDING),yy)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL_LOCATION)),)
> +$(error No tarball location specified. Please check BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL_LOCATION)
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
