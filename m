Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7325FE7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F03DF83C93;
	Thu, 21 Sep 2023 19:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F03DF83C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxpopIaUiV0Z; Thu, 21 Sep 2023 19:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D77F83C9F;
	Thu, 21 Sep 2023 19:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D77F83C9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB6AF1BF3EE
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0B9441F1B
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B9441F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTrBhgTSPgnD for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:07:46 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14C2A41ED5
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14C2A41ED5
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-532c81b9adbso1563393a12.1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695323264; x=1695928064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MeI+JJmueQz6Y65/FCmv4OfFUrMC9gug6QPMjGEjOZI=;
 b=jzTS8B8HE/SfqSVtVw1Zx38x7wHnX82i3El4mgnFHfNhj6TlD977bF3C3LQI3jgE1I
 CQaHAijyLVPtMQLskNh9ZtXmY8v8dQ0hGhlSGImQKH8zlXih+mOIbgYrC6RLSQrLtJCI
 R7o0lieGBV+R2JD5X6EGXhmRJpD4CgF0QYcP1E/ax/xQgbHPEdz0K+qZBPCnmxvKotsd
 I6lAnInrnMbOV2urvzgv7w2xat5nJSapVtPqDIM1M6vIppBvXuwThTZO+hmhmUeyuIvE
 LT0s7sWczs8EGNjhuz1Qd7oopbINeCXiHuKnLR+e03T5xL+DCcuN/p3IzqPEznQfdUmp
 1Uqw==
X-Gm-Message-State: AOJu0Yy+iV4fkVDqkFErJrGYe6pgT3XYTkaPO0dpCJIAFdFJhu8AzP/N
 VAHVdXBzsULt7c9AvpbE5Eb4+g==
X-Google-Smtp-Source: AGHT+IH6aRt/1y/C26rH/fnU+6AVxHnIOyyviAbsbFw5bwdyf+dDhQPOibIR6ZFNXcpC1xwT2IOytg==
X-Received: by 2002:a17:906:3caa:b0:9a1:fb4c:3b6c with SMTP id
 b10-20020a1709063caa00b009a1fb4c3b6cmr5586922ejh.59.1695323263905; 
 Thu, 21 Sep 2023 12:07:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906529300b00992e94bcfabsm1465023ejm.167.2023.09.21.12.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 12:07:43 -0700 (PDT)
Message-ID: <2fdbac8a-9a26-8350-e21a-ffef3d62cde4@mind.be>
Date: Thu, 21 Sep 2023 21:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Jens Maus <mail@jens-maus.de>, buildroot@buildroot.org
References: <20230917210523.1577198-1-mail@jens-maus.de>
In-Reply-To: <20230917210523.1577198-1-mail@jens-maus.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695323264; x=1695928064; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MeI+JJmueQz6Y65/FCmv4OfFUrMC9gug6QPMjGEjOZI=;
 b=DKWghHkLIpkn6nzD5LzPyfJqoZ11aXjpbO9of7kKXfMU4/7zJPPB6xo47XtsDoa4bS
 pBj+Qlm/iX/XmeRar98JclrvSoGhN/TVhU++zTiqsXH1UZfd3qsXl2gJVcve6yiGr278
 Afsis9PuFEcpNEXtPflWPNrJ64QOlGsf20LRQSI9YOvHGcgOlUY6dWL+9wJAHs0zm7BN
 USeBT2wsr6AaKweGISJGxXEzd7RaNMh8Fu2FJ+W2HEtw2QdLpdpp2imCXFWmSCHPLi0T
 km0LhhKNA5MFu5WFBVyhd1YYaKxPt17R8P+qhlFNJPb9iRJB4HdXrIvvazExzIgBkwhx
 /Hyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DKWghHkL
Subject: Re: [Buildroot] [PATCH 1/1] package/monit: update to 5.33.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Jens,

On 17/09/2023 23:05, Jens Maus via buildroot wrote:
> This commit updates monit to the latest 5.33.0 version which also
> requires some additional patch to configure as well as enabled ipv6
> support.
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>

  I have a few comments - a bit too much to just fix while applying, I'm afraid. 
Can you address them and resubmit?

> ---
>   package/monit/0002-configure-fixes.patch | 24 ++++++++++++++++++++++++
>   package/monit/monit.hash                 |  4 ++--
>   package/monit/monit.mk                   |  8 +++++---
>   3 files changed, 31 insertions(+), 5 deletions(-)
>   create mode 100644 package/monit/0002-configure-fixes.patch
> 
> diff --git a/package/monit/0002-configure-fixes.patch b/package/monit/0002-configure-fixes.patch
> new file mode 100644
> index 0000000000..74698e9927
> --- /dev/null
> +++ b/package/monit/0002-configure-fixes.patch

  check-package says:

package/monit/0002-configure-fixes.patch:0: missing Signed-off-by in the header 
(http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
package/monit/0002-configure-fixes.patch:0: missing Upstream in the header 
(http://nightly.buildroot.org/#_additional_patch_documentation)

  Please make sure the patch is sent upstream (or explain why it's not possible).

  Also (but not a hard requirement), we prefer git-formatted patches - clone it 
from git@bitbucket.org:tildeslash/monit.git

> @@ -0,0 +1,24 @@
> +diff -ruN monit-5.29.0.orig/configure.ac monit-5.29.0/configure.ac
> +--- monit-5.29.0.orig/configure.ac	2021-08-24 18:15:35.000000000 +0200
> ++++ monit-5.29.0/configure.ac	2021-11-20 10:34:31.074783265 +0100
> +@@ -8,7 +8,7 @@
> + # Example: 5.0_beta2
> + AC_INIT([monit], [5.29.0], [monit-general@nongnu.org])
> + AC_CONFIG_AUX_DIR(config)
> +-AC_CONFIG_MACRO_DIR([m4])
> ++AC_CONFIG_MACRO_DIRS([m4 config])
> + AM_INIT_AUTOMAKE
> + AC_CONFIG_SRCDIR([src/monit.c])
> + AC_CONFIG_SUBDIRS([libmonit])
> +diff -ruN monit-5.29.0.orig/libmonit/configure.ac monit-5.29.0/libmonit/configure.ac
> +--- monit-5.29.0.orig/libmonit/configure.ac	2021-08-24 18:15:35.000000000 +0200
> ++++ monit-5.29.0/libmonit/configure.ac	2021-11-20 10:34:54.123439163 +0100
> +@@ -4,7 +4,7 @@
> +
> + AC_INIT([libmonit], [1.0], [monit-dev@tildeslash.com])
> + AC_CONFIG_AUX_DIR(config)
> +-AC_CONFIG_MACRO_DIR([m4])
> ++AC_CONFIG_MACRO_DIRS([m4 config])
> + AM_INIT_AUTOMAKE
> + AC_CONFIG_SRCDIR([src])
> +
> diff --git a/package/monit/monit.hash b/package/monit/monit.hash
> index 26d665c083..1d9feca57b 100644
> --- a/package/monit/monit.hash
> +++ b/package/monit/monit.hash
> @@ -1,4 +1,4 @@
> -# From https://mmonit.com/monit/dist/monit-5.26.0.tar.gz.sha256:
> -sha256  87fc4568a3af9a2be89040efb169e3a2e47b262f99e78d5ddde99dd89f02f3c2  monit-5.26.0.tar.gz
> +# From https://mmonit.com/monit/dist/monit-5.33.0.tar.gz.sha256
> +sha256  1ace889c0183473a9d70160df6533bb6e1338dc1354f5928507803e1e2a863b5  monit-5.33.0.tar.gz
>   # Locally computed
>   sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
> diff --git a/package/monit/monit.mk b/package/monit/monit.mk
> index 6d5d475813..69db62d711 100644
> --- a/package/monit/monit.mk
> +++ b/package/monit/monit.mk
> @@ -4,26 +4,28 @@
>   #
>   ################################################################################
>   
> -MONIT_VERSION = 5.26.0
> +MONIT_VERSION = 5.33.0
>   MONIT_SITE = http://mmonit.com/monit/dist
>   MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
>   MONIT_LICENSE_FILES = COPYING
>   MONIT_CPE_ID_VENDOR = mmonit
>   MONIT_SELINUX_MODULES = monit
> +
>   #

  You can remove this redundant #

>   # Touching Makefile.am:

  It wasn't in here before, but please mention in the comment which patches 
touch Makefile.am and configure.ac.

  Applied to master, thanks.

  Regards,
  Arnout

>   MONIT_AUTORECONF = YES
>   
>   MONIT_CONF_ENV = \
>   	libmonit_cv_setjmp_available=yes \
> -	libmonit_cv_vsnprintf_c99_conformant=yes
> +	libmonit_cv_vsnprintf_c99_conformant=yes \
> +	ac_cv_ipv6=yes
>   
>   MONIT_CONF_OPTS += \
>   	--without-pam \
>   	--with-largefiles
>   
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -MONIT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
> +MONIT_CONF_OPTS += --with-ssl --with-ssl-dir=$(STAGING_DIR)/usr
>   MONIT_DEPENDENCIES += openssl
>   else
>   MONIT_CONF_OPTS += --without-ssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
