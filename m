Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9925C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 13:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D2883F77;
	Tue, 21 Jun 2022 13:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D2883F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n4n8J8GrYSMS; Tue, 21 Jun 2022 13:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4538383F6A;
	Tue, 21 Jun 2022 13:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4538383F6A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFEC11BF2CF
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 13:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8EB283F6A
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 13:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8EB283F6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbMeUbCevNdx for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 13:31:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E72F383F4D
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E72F383F4D
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 13:31:11 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-101b4f9e825so13895817fac.5
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 06:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEW71h/fdNWxHMjLDcQE8YG50UQFlgD1o6X6XCQUnFo=;
 b=0Xc1uzfzpsrToiEt3uKduBxPhgXIxj95gKYTIYSlUX/8QYILCCHA0Yx+mBvWe5/qlj
 KsvVuqdGPd94X3BnwH8+mx6QuIBvKsHeVqL3MTT1ZaJYFv+sNYa6c/PxN5IPFMRsybA1
 Itg7yco2+ShZRxa9OKefQPArnzG5t+XFVeIY0hKqnIjVjCweGWWOEY9bg9s2bX718beE
 9IXVc4J+J2aO2MehphOXFRV0BRaWZ8ulxJchLwhJ/K9EuiYY5xt++WIV4h28yS1Bi0og
 FtSNlPWc8MiG88fF10uzRRxEeVTVRBhtnOKizP6gl+t7AdJbbfPoC1f/EQAnAmVHT6AK
 46gg==
X-Gm-Message-State: AJIora9xLoNaGOVD1fqAlX6DuLkLwug47oGMGaF0BQqypvDCBoh0e5Ob
 1lC8VWbYNlGGf1stzx2vnSOjb5Rsw25htL+an7XZvNPj14n1ng==
X-Google-Smtp-Source: AGRyM1v1A7lBKtOqD7JxoHgVkTUU5jwH5Qp3XTU7WhyyxO6qFZqR/Lb55Pts6xqskZWEz59YN14LLwPUkr5+5oxzjIQ=
X-Received: by 2002:a05:6871:69e:b0:101:b7d2:7d0f with SMTP id
 l30-20020a056871069e00b00101b7d27d0fmr10674273oao.217.1655818270842; Tue, 21
 Jun 2022 06:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220621130636.1100016-1-kory.maincent@bootlin.com>
In-Reply-To: <20220621130636.1100016-1-kory.maincent@bootlin.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 21 Jun 2022 15:30:59 +0200
Message-ID: <CAN5uoS9XgxK9-A8-QKGCuifxXAS6-EUMHDJsfBrUdjYB3qcPdA@mail.gmail.com>
To: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NEW71h/fdNWxHMjLDcQE8YG50UQFlgD1o6X6XCQUnFo=;
 b=Eskr3AsJ9hrBvVZO/vrsVnvVaY0xiu0v/t0hE5TtskbUWn5yjT1Ab+o3jqjhtQW9Ec
 1WzH4BFIjr9iNTHRXmyTogfs8giLlX9ViK/+yMSGZRL8rCZ2KmCgqKG0ii3XgHxTv/N/
 TwrovsTtn1f1PoFOMOuNXMI/UL35qz0dow6uo0OYodyLmjsnWeUyu/c3idwDBJl6oLo1
 OehNkF5IrH/GB38+j6BBpWytQ5fGb8xEb9PPWeoeccROeHpml/Muks3dUgf74rC274yA
 3p7WU4mC6Pr+KoVgQwuFSYUH4uuM8HnCl0eul7Cv3q05KH+L/HdkxRyDNyEQt1SqnCQS
 TcxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=Eskr3AsJ
Subject: Re: [Buildroot] [PATCH] boot/optee-os: add support for custom
 tarball URL
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kory,

On Tue, 21 Jun 2022 at 15:06, <kory.maincent@bootlin.com> wrote:
>
> From: Kory Maincent <kory.maincent@bootlin.com>
>
> For now only latest release and custom git repository was supported.
> This patch adds support for custom tarball URL.
>
> It also adds configuration verification for custom git repository and
> tarball URL.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  boot/optee-os/Config.in   | 11 +++++++++++
>  boot/optee-os/optee-os.mk | 25 +++++++++++++++++++++++--
>  2 files changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index 0be6e68b0c..d56cf53c8a 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -25,6 +25,9 @@ config BR2_TARGET_OPTEE_OS_LATEST
>           Use the latest release tag from the OP-TEE OS official Git
>           repository.
>
> +config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
> +       bool "Custom tarball"
> +
>  config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>         bool "Custom Git repository"
>         help
> @@ -32,6 +35,13 @@ config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>
>  endchoice
>
> +if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
> +
> +config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION
> +       string "URL of custom OP-TEE OS tarball"
> +
> +endif
> +
>  if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>
>  config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL
> @@ -53,6 +63,7 @@ endif
>  config BR2_TARGET_OPTEE_OS_VERSION
>         string
>         default "3.17.0"        if BR2_TARGET_OPTEE_OS_LATEST
> +       default "custom"        if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
>         default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
>                                 if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>
> diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> index 88f14b48e4..cc90cff2cb 100644
> --- a/boot/optee-os/optee-os.mk
> +++ b/boot/optee-os/optee-os.mk
> @@ -13,14 +13,22 @@ endif
>  OPTEE_OS_INSTALL_STAGING = YES
>  OPTEE_OS_INSTALL_IMAGES = YES
>
> -ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
> +ifeq ($(OPTEE_OS_VERSION),custom)

It looks strange to me that "custom" is a reserved version identifier
when using a custom tarball.
I'd rather use:
   ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL),y)

> +# Handle custom U-Boot tarballs as specified by the configuration
> +OPTEE_OS_TARBALL = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION))
> +OPTEE_OS_SITE = $(patsubst %/,%,$(dir $(OPTEE_OS_TARBALL)))
> +OPTEE_OS_SOURCE = $(notdir $(OPTEE_OS_TARBALL))
> +else ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
>  OPTEE_OS_SITE = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL))
>  OPTEE_OS_SITE_METHOD = git
> -BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
>  else
>  OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
>  endif
>
> +ifeq ($(BR2_TARGET_OPTEE_OS)$(BR2_TARGET_OPTEE_OS_LATEST_VERSION),y)
> +BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
> +endif
> +
>  OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
>
>  ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
> @@ -130,6 +138,19 @@ ifeq ($(BR2_TARGET_OPTEE_OS)$(BR_BUILDING),yy)
>  ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM)),)
>  $(error No OP-TEE OS platform set. Check your BR2_TARGET_OPTEE_OS_PLATFORM setting)
>  endif
> +
> +ifeq ($(OPTEE_OS_VERSION),custom)

Ditto:
ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL),y)



> +ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION))),)
> +$(error No tarball location specified. Please check BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION))

There is a extra ending parentheses to be removed in each of the 2 above lines.

Br,
etienne

> +endif
> +endif
> +
> +ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
> +ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL)),)
> +$(error No repository specified. Please check BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL)
> +endif
> +endif
> +
>  endif # BR2_TARGET_OPTEE_OS && BR2_BUILDING
>
>  $(eval $(generic-package))
> --
> 2.25.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
