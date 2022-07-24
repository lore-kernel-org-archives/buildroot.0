Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA39C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5909D83F73;
	Sun, 24 Jul 2022 08:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5909D83F73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2ppNsDuDGFt; Sun, 24 Jul 2022 08:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0755A83F4F;
	Sun, 24 Jul 2022 08:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0755A83F4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C12A71BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A89F740BC9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A89F740BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gi7SWAe_5ZBI for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:09:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 429C640156
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 429C640156
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:09:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b26so11907800wrc.2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 01:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pLMpCr2WVn1/6YCVD+lhAQD+ZGj5NgyaawSNYxYA30g=;
 b=Frecg4O2mxOasY7+21mNKjLdinYWGNMp98K0EnmJUJkf4Ey4xjnXNFa591KV4dys2r
 YxRjrYy5mWdWC9VpRbkun2TZPuyjns4tT6RdGoRFEMbSspmBrLAQPXCea3Nj3v5nAc6n
 +fk70Qa+ZsypHnUTm2x854PN8xo+52D7uSSNybfeCVWZGXzWREJYMuScupmSLm+7ntwJ
 lB5qomFuTJ/JkdqVfmINh1b09cnGGwDdA+FeOK3oyHFtQyjyyTDiVuOcAgM9t0/1JS82
 FQn+AqTRe6HdihADjmUDkeobX4pBUT7JlB7h8ND3VOOYiobBZyt9dJLbt3UVB+TNMauC
 WPEA==
X-Gm-Message-State: AJIora/RxkJjSD4w5WFrvuo6RoU7c8y73m+QwEr1ZsOSFtSfk2owMCnI
 NlsLMnRGKJ+ABZ2CLa0QCyaOuU2bl1oBvA==
X-Google-Smtp-Source: AGRyM1tp/po+fbQvdv1SGScbt0oUnFQdS72yOfWlr+UUCcp7Hwizv7Y2meHT4XuRNnbdAzDCGm53Bg==
X-Received: by 2002:a5d:648b:0:b0:21d:a61c:a9c9 with SMTP id
 o11-20020a5d648b000000b0021da61ca9c9mr4515983wri.268.1658650148369; 
 Sun, 24 Jul 2022 01:09:08 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 e29-20020a5d595d000000b0021e501519d3sm8802988wri.67.2022.07.24.01.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 01:09:07 -0700 (PDT)
Message-ID: <e97beaf0-5173-e6f5-1155-db4b18cadace@mind.be>
Date: Sun, 24 Jul 2022 10:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>, buildroot@buildroot.org
References: <20220723194639.577589-1-aleksandr.o.makarov@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220723194639.577589-1-aleksandr.o.makarov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=pLMpCr2WVn1/6YCVD+lhAQD+ZGj5NgyaawSNYxYA30g=;
 b=e2ffE2v8ro6jo7PwtI325HDGPDhjgTAB+r21BJ7KzApk5v9vZ7jHK81ZfZaEN/J4dV
 0s1OqycLh6tmJHD+C4Yfb/9O/SOpuK5wvDlSaQ2jb0K925g4rOwdw0Mcex3fT9ixSnUJ
 uhOzxil97cm+HaAf6uFDEMm/6jqPxk5DlrPDQSnvAAKQ3j3BBi+PsxT+EqqJm55Asyew
 9FNTgUE4ifNsAErD8eBlk/ERhOPVOMCSqi89iGw9p9XExFwtPhHF5ZqLnsSAGxXxoJi/
 orsjv8Nxk8bvuHuyUx0KcmKtHPUZsN9Y0eDZ5xBU5rMWOuvjsUbb0JeEpWFKP8mPBzkB
 o50Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e2ffE2v8
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libest: bump version
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Alekxandr,

  I have a few more comments on the patch. I could fix it up while applying, but 
since you were pretty reactive in the first iteration, I wanted to give you the 
opportunity to do it yourself (and save me a bit of work).

  First of all, what is the reason to bump to an unreleased version? It's 
probably something like "Upstream makes releases very irregularly; our current 
version is already two years old and upstream HEAD contains a lot of fixes. 
Therefore, bump to the current HEAD sha1." It's good to put that in the commit 
message. Also, the subject could be better with "... bump to current HEAD" - we 
normally put the new version in the subject line because it makes it easier to 
understand what's going on, but a sha1 is not saying much anyway so "current 
HEAD" is enough.


On 23/07/2022 21:46, Aleksandr Makarov wrote:
> - Removed patches applied to upstream
> - Added patch to fix erroneous './configure --without-system-libsafec' behavior

  Since we're no longer using --without-system-libsafec, this patch is not 
really needed for Buildroot, right? It's good that you submitted it upstream though.

> - Auto-select libsafec

  This warrants a bit more explanation. The comment that you put in the .mk file 
is exactly right.

> 
> Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> ---
> v2:
> - More detailed commit message
> - Describe contents of configure.ac patch
> - Auto-select libsafec
> ---
>   ...without-system-libsafec-mistakenly-e.patch |  37 ++++
>   ...client.c-add-support-for-OpenSSL-1.1.patch | 112 ------------
>   ...le-examples-flag-to-toggle-examples-.patch |  90 ----------
>   ...libsafec-flag-to-link-against-system.patch | 109 ------------
>   ...Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch | 164 ------------------
>   package/libest/Config.in                      |   1 +
>   package/libest/libest.hash                    |   2 +-
>   package/libest/libest.mk                      |  21 +--
>   8 files changed, 48 insertions(+), 488 deletions(-)
>   create mode 100644 package/libest/0001-Fix-.-configure-without-system-libsafec-mistakenly-e.patch
>   delete mode 100644 package/libest/0001-java-jni-client.c-add-support-for-OpenSSL-1.1.patch
>   delete mode 100644 package/libest/0002-Add-enable-disable-examples-flag-to-toggle-examples-.patch
>   delete mode 100644 package/libest/0003-Add-with-system-libsafec-flag-to-link-against-system.patch
>   delete mode 100644 package/libest/0004-configure.ac-Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch
> 

[snip]
> diff --git a/package/libest/libest.mk b/package/libest/libest.mk
> index d9f3cf87bc..faf3aed318 100644
> --- a/package/libest/libest.mk
> +++ b/package/libest/libest.mk
> @@ -4,22 +4,26 @@
>   #
>   ################################################################################
>   
> -LIBEST_VERSION = 3.2.0
> -LIBEST_SITE = $(call github,cisco,libest,r$(LIBEST_VERSION))
> +LIBEST_VERSION = f8a6e5b53a5f70e72fe4029981df0693b17cbb32
> +LIBEST_SITE = $(call github,cisco,libest,$(LIBEST_VERSION))
>   # We don't build examples, so we're not affected by the OpenSSL
>   # license
>   LIBEST_LICENSE = BSD-3-Clause, MIT, W3C
>   LIBEST_LICENSE_FILES = LICENSE
>   LIBEST_INSTALL_STAGING = YES
>   LIBEST_AUTORECONF = YES
> -LIBEST_DEPENDENCIES = openssl host-pkgconf
> -# libcoap support is explicitly disabled because it breaks the build
> +LIBEST_DEPENDENCIES = openssl host-pkgconf safeclib
> +# libcoap support is explicitly disabled because it breaks the build.
> +# Support for libsafec can not be completely disabled - currently,
> +# --disable-safec just uses bundled copy of library. To avoid that,
> +# we install the full-featured safeclib package and always use it.

  The comment is not really useful here. When you look at it on its own, it's 
pretty obvious that we want to use system libsafec rather than the bundled one, 
so no explanatory comment is needed. It is needed in the commit message however 
to explain why this is a change from how it was before.

>   LIBEST_CONF_OPTS = \
>   	--with-ssl-dir=$(STAGING_DIR)/usr \
>   	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthreads,--disable-pthreads) \
>   	$(if $(BR2_PACKAGE_LIBEST_BRSKI),--enable-brski,--disable-brski) \
>   	--disable-examples \
> -	--without-libcoap-dir
> +	--without-libcoap-dir \
> +	--with-system-libsafec

  It seems that this change is independent of the version bump, i.e. it is 
already applicable to the existing version of libest. Therefore, this part 
should be done as a separate patch, which will possibly be applied to the stable 
branches (it's a bit borderline, Peter will decide in the end). So please make a 
series of two patches: the first one just adding --with-system-libsafec and 
removing the optional one, using the explanation in the comment above as the 
commit message. And the second one the actual version bump.


  Regards,
  Arnout


>   
>   ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
>   LIBEST_DEPENDENCIES += libexecinfo
> @@ -55,13 +59,6 @@ else
>   LIBEST_CONF_OPTS += --without-uriparser-dir
>   endif
>   
> -ifeq ($(BR2_PACKAGE_SAFECLIB),y)
> -LIBEST_CONF_OPTS += --with-system-libsafec
> -LIBEST_DEPENDENCIES += safeclib
> -else
> -LIBEST_CONF_OPTS += --without-system-libsafec
> -endif
> -
>   define LIBEST_INSTALL_PC
>   	$(INSTALL) -c -m 0644 $(LIBEST_PKGDIR)/libest.pc \
>   		$(STAGING_DIR)/usr/lib/pkgconfig/libest.pc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
