Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4651EC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 09:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2116605A0;
	Mon, 16 Sep 2024 09:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCaTIs4f4wiB; Mon, 16 Sep 2024 09:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2FD8606D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2FD8606D3;
	Mon, 16 Sep 2024 09:51:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AAAD1BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 184CF4031E
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnVMJpwU1e6t for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 09:51:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BD614030A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BD614030A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BD614030A
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 09:51:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.117.145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E6E60B00572;
 Mon, 16 Sep 2024 11:51:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 11:51:27 +0200
Date: Mon, 16 Sep 2024 11:51:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zuf_n3SFObkfWBOL@landeda>
References: <20240915212816.1645997-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240915212816.1645997-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726480293;
 bh=iSAJCs/Z94tl1Ogs+M9XdAdNDyCAu79+bujG/TK9mlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KmBxzZ7a3fIMhvkMuakESX7KUI26p3NEiII3QE6y23TW9MP/faDROq8yALSVIGrGa
 k9E5Fc5Jpv++7QDxCxhS+Luu4MZspgpT7eeoZwGrqUZcqGS/g7l5Ei91raRhaB0988
 2MOjFb6Sp2yQHlML+o7ovM2dd/GFRkNdQNQKfjTR5kVm/9xPHFBiuAVjrGE56wUVmi
 bb+g7eoBE3KRPyZ7xyO3YAMSbSAFgHwiXHTHwgcI+Ztg0yOQqh8wGoPgIUZYl6dxpZ
 uFBvjB2J8xvm7ZezQM972s8L9LufhCXc1fR0HXkKGHBhpCDPPUDR1nzge1v3d/KwcY
 Mg3iE81xhgFWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KmBxzZ7a
Subject: Re: [Buildroot] [PATCH 1/1] package/python-m2crypto: bump to
 version 0.42.0
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-15 15:28 -0600, James Hilliard spake thusly:
> Set openssl path via env instead of build options.

You are _describing_ the change, you are not _explaining_ it. It is
pretty easy to spot that the options are dropped and that the path
is now passed in an environment variable.

But why is that needed? What's the rationale for doing it? Is it
required by the bump, or is it something that can be done before or
after? Explaining this may ring a bell that maybe the change should (or
should not) be backported.

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-m2crypto/python-m2crypto.hash |  4 ++--
>  package/python-m2crypto/python-m2crypto.mk   | 10 ++++------
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
> index 782837081e..aa8fe09c14 100644
> --- a/package/python-m2crypto/python-m2crypto.hash
> +++ b/package/python-m2crypto/python-m2crypto.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/m2crypto/json
> -md5  280c20072afbe7010cf9e9620ea25c7b  M2Crypto-0.40.1.tar.gz
> -sha256  bbfd113ec55708c05816252a4f09e4237df4f3bbfc8171cbbc33057d257bbb30  M2Crypto-0.40.1.tar.gz
> +md5  b88bcb1d4aeb817f91eb627d08b673a2  m2crypto-0.42.0.tar.gz
> +sha256  42b62df2caf623161b1d643a7235464c2fe2a3105049ebc498a6d47dc08f64b4  m2crypto-0.42.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
> diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
> index 6c07f42d06..79dfc1beb2 100644
> --- a/package/python-m2crypto/python-m2crypto.mk
> +++ b/package/python-m2crypto/python-m2crypto.mk
> @@ -4,17 +4,15 @@
>  #
>  ################################################################################
>  
> -PYTHON_M2CRYPTO_VERSION = 0.40.1
> -PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
> -PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/9e/a3/9433817493ea250db67a05de3361cb0a1d58531847d50406f2f28455e68c
> +PYTHON_M2CRYPTO_VERSION = 0.42.0
> +PYTHON_M2CRYPTO_SOURCE = m2crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
> +PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/85/9f/b8977ce2971cf5f823db3fdb31e7e061b9662da318a17b6bf0c653f84aee
>  PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
>  PYTHON_M2CRYPTO_LICENSE = MIT
>  PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
>  PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
>  PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
>  PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
> -PYTHON_M2CRYPTO_BUILD_OPTS = \
> -	-C--build-option=build_ext \
> -	-C--build-option=--openssl=$(STAGING_DIR)/usr
> +PYTHON_M2CRYPTO_ENV = OPENSSL_PATH="$(STAGING_DIR)/usr"
>  
>  $(eval $(python-package))
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
