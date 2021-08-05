Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9716C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5147261104
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5147261104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 105C7400CD;
	Thu,  5 Aug 2021 20:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5tesBomgmaQ; Thu,  5 Aug 2021 20:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDD0640287;
	Thu,  5 Aug 2021 20:20:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9222F1BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BCF982F0F
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlP5SDL7lo8A for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:20:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C4B482EA2
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:20:21 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id x11so11559212ejj.8
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zc7acINgBRmd9s2VcSU/5aLCSwC2X0n7p/8Lq9FHAPg=;
 b=K+IKEu0pPWqDZuFZ7bVO68oWC9hmuzc2i/Jnp6rNNrsMyJ4CuACkhzbY+gWlNdQz/j
 xGTboPjJfTc+Vru3bIW4I+xdmoHv+FKmXrqx9V+XaWvPRwidlNcBtpa+7tsAO9TwZKyq
 0mlYikMmXFucelwCVBtDnFRdl0rYzns0mD1jO+LjsKv58dEXgbCPQghPUPnoCtrqDqca
 BPVplfkaGa3a4Fw7eJiqKmeKRrinfJVcfIVYBcdnrv3ryAn1gI2hKhkL3LK0vWtKQbZJ
 5yhkSLtam0jgO9UM6fWdbw0Ypk+1InJ0Z9Tp6aWWnAl0zOlQLXIxeZKZEdC0qJKUToFn
 Jo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Zc7acINgBRmd9s2VcSU/5aLCSwC2X0n7p/8Lq9FHAPg=;
 b=gdCj/HVKEg+yAsXlbtXQ7P0vmcCfMuns5hCMIf05mIRY7Sm9Vz8Eqs+PFhvb2ivEan
 QBAh3aRdGq4q8cQpmscQAcct4GgS1Z4hvQOd8lvkz5UCUvAGR3i9m7bxVOsCMKMO2qj/
 Jn6bPIWEvLwR/3hpgxmXOS7B45jj3DxfQSpSgsJttjxDPNf/pk1fcx5vw1kEoVDVfBy9
 k15x+oAcV0vVGe/j0VFFn8+B2kIm/9zKqXyaWihldH9fgXXuhfsqZAYpfAKSHfyTDnXL
 IG9uffy3Sy7fFjhFIkTlSCi9fHH4+4cDswjuboH3jB9DxGNKebup+QmEd0p26kAg7o/r
 OZtw==
X-Gm-Message-State: AOAM5307RGAmBJp9yxzGWe0oRvSULV6PElWAxBIk12QYrM2OQ39ZZgTK
 dr+MdaS9LTuU/XWTrA5/ldl3dHmYQbwYVcTaB4E=
X-Google-Smtp-Source: ABdhPJymK1xdsLkxEtTPpZB71r4iz/KZRVzy1Ka3iFAc3/BADGQVCm+UTv2Ahw5fuoWYwajQ50/16A==
X-Received: by 2002:a17:906:5e55:: with SMTP id
 b21mr6550849eju.121.1628194819503; 
 Thu, 05 Aug 2021 13:20:19 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id o5sm2743661edc.16.2021.08.05.13.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 13:20:18 -0700 (PDT)
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20210804215652.14775-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b3378435-0a61-4ce2-e543-f50f6c71b7e2@mind.be>
Date: Thu, 5 Aug 2021 22:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804215652.14775-1-nolange79@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v5 1/2] package/zstd: rework build and
 install
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 04/08/2021 23:56, Norbert Lange wrote:
> Move PREFIX=/usr to ZSTD_OPTS, even though it is only used by
> libzstd.pc for now it should be available in every step.
> 
> Create libzstd.pc in the build step instead of triggering a
> lazy build during installation when it is missing.
> 
> Attach '-release' to the targets, since the default is to
> build lib-release and zstd-release.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> 
> ---
> v4->v5:
> *   rebase, remove the parts that are already upstream
> *   improve commit message
> *   try to keep changes minimal
> v3->v4:
> *   revert to previous scheme of BR2_TOOLCHAIN_HAS_THREADS
>     fixing build options for both static and shared libs.
> v2->v3:
> *   use normal = for assignment
> v1->v2:
> *   rebased against upstream/master
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/zstd/zstd.mk | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 5a96c11309..d7a0320df4 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -12,6 +12,7 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
>  ZSTD_CPE_ID_VENDOR = facebook
>  ZSTD_CPE_ID_PRODUCT = zstandard
>  
> +ZSTD_OPTS += PREFIX=/usr
>  ZSTD_OPTS += ZSTD_LEGACY_SUPPORT=0
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  ZSTD_DEPENDENCIES += zlib
> @@ -60,12 +61,13 @@ else
>  ZSTD_OPTS += HAVE_THREAD=0
>  ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
>  endif
> +ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))

 check-package complained about this override of the variable, so I added a
check-package disable comment above.

 I also improved the commit message a little (though it was already good - I
just strive for perfection :-) and committed both to next, thanks! This series
can finally be put to rest :-)


 Regards,
 Arnout

>  
>  define ZSTD_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
> +		-C $(@D)/lib $(ZSTD_BUILD_LIBS) libzstd.pc
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		-C $(@D) zstd
> +		-C $(@D) zstd-release
>  endef
>  
>  define ZSTD_INSTALL_STAGING_CMDS
> @@ -76,9 +78,9 @@ endef
>  
>  define ZSTD_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
> +		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
> +		DESTDIR=$(TARGET_DIR) -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
>  endef
>  
>  HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
