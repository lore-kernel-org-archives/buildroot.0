Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA444C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:55:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A2761AED
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39A2761AED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8D02400D0;
	Wed, 17 Nov 2021 20:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kkCLrFDEplAP; Wed, 17 Nov 2021 20:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3020C400EB;
	Wed, 17 Nov 2021 20:55:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 907451BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BC43400EB
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y5C2tlbZjl6f for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 20:55:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 545A8400D0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 20:55:36 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b15so16866018edd.7
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 12:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yq5UHsW4WCnSaQ+kgWw11HTrXw/1WDzFo3Nz3+McJwk=;
 b=DCW+rsMTSnSpu2ul6mjhVMd9sHo7E8nwhzn7meWFlIhB45B9v0WpTJqEUrkab/y4TZ
 uK7qD+ZxPX/yKnMOJprN8vvvbBu+xue26b1iR1pTdDlDnUfXk/xo4WhE9W0H3YYo14y1
 CAHG9tULNrWoJaDFv9WcXQAvQHD349RJ2i6ap1MS1foU7zegqzWnFATMWA2j6O6iMBHs
 aRo+xXbHKoMGleVPiezvltRdMZNgBaXrZx+/YTu+obzyNcz5tTMU8A3JXUGCR/n/4a+R
 i1Y7SvirAh8Dki4Con+0g6vq+nK4KkuCDJo7glZfwjcmA5TesDD1asVnzO/FivwFzc5F
 u+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yq5UHsW4WCnSaQ+kgWw11HTrXw/1WDzFo3Nz3+McJwk=;
 b=b5um6i+GexQ13xutYpUwG7VWEPQ4uJV5g/QHaS27Fd+1eYF9e/dyDyEVKRRostIfNu
 Ccx2/tcspogja/zdyKcFB8rvjBEXVP/L/AKIbQMqVcnfDgn8d/NQL03yIH0ckHW59+Rb
 kAd4tPKuI3YYVfEdA4rTYmLIq2/g7ORRCdQBMJcE3fxU5JQ+mjrzjpYrpjbNBkIZUMls
 qTxmMcwZ2mdT9mjva0saIo1DanJQ8Wkv/psVJgAZg5jE1QFplerBPhpt1CLg/ETKgbsb
 1zZ919VktYtEJVmprLsKueFmLvauQYzYq6fd/HCCkboE5jz89EBCciClDr0Qtttma6NY
 A+Tg==
X-Gm-Message-State: AOAM532GES+w+SLUkqpJXVQ2Y6+IPWUzlmK7h9LbkSkE+ly7L5sIdJ41
 lHsQMWog5ZoQWqZsXVrmOhMYEA==
X-Google-Smtp-Source: ABdhPJxaQSPGYC48zYg8LEYeMRHiD7oBxJG6i49R+hw9sEpOa8Q/cxi5OmUWAaELxslWT8ni7TIrbg==
X-Received: by 2002:a17:907:b17:: with SMTP id
 h23mr26806326ejl.80.1637182534531; 
 Wed, 17 Nov 2021 12:55:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id em21sm424833ejc.103.2021.11.17.12.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 12:55:34 -0800 (PST)
Message-ID: <50b4a2e3-fb9f-aaec-534c-3a18cfee50bc@mind.be>
Date: Wed, 17 Nov 2021 21:55:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211025215520.3712974-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025215520.3712974-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,1/1] package/p7zip: add 7za support
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
Cc: =?UTF-8?Q?Andr=c3=a9_Zwing?= <nerv@dawncrow.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/10/2021 23:55, Fabrice Fontaine wrote:
> Add 7za stand-alone executable as 7zr is a "light-version" of 7za that
> only handles 7z archives and cannot handle encrypted archives.
> 
> Fixes:
>   - https://bugs.buildroot.org/show_bug.cgi?id=14266
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>   - Add a dedicated option
> 
>   package/p7zip/Config.in | 22 ++++++++++++++++++++++
>   package/p7zip/p7zip.mk  | 11 +++++++++--
>   2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
> index badfb9b9e8..3b30fd71cc 100644
> --- a/package/p7zip/Config.in
> +++ b/package/p7zip/Config.in
> @@ -12,6 +12,28 @@ config BR2_PACKAGE_P7ZIP
>   
>   	  http://sourceforge.net/projects/p7zip
>   
> +if BR2_PACKAGE_P7ZIP
> +
> +choice
> +	prompt "p7zip binary"
> +	default BR2_PACKAGE_P7ZIP_7ZR

  Unfortunately, this means 7za will never be built in the autobuilders, because 
they don't randomize choices. Oh well, tough luck.

  Applied to master, thanks.

  Regards,
  Arnout


> +
> +config BR2_PACKAGE_P7ZIP_7ZA
> +	bool "7za"
> +	help
> +	  Stand-alone executable that handles fewer archive formats
> +	  than 7z
> +
> +config BR2_PACKAGE_P7ZIP_7ZR
> +	bool "7zr"
> +	help
> +	  Stand-alone executable which is a "light-version" of 7za that
> +	  only handles 7z archives and cannot handle encrypted archives
> +
> +endchoice
> +
> +endif
> +
>   comment "p7zip needs a toolchain w/ threads, wchar, C++"
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
> index f94b55ecd2..b6c5adae26 100644
> --- a/package/p7zip/p7zip.mk
> +++ b/package/p7zip/p7zip.mk
> @@ -10,6 +10,12 @@ P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
>   P7ZIP_LICENSE_FILES = DOC/License.txt
>   P7ZIP_CPE_ID_VENDOR = 7-zip
>   
> +ifeq ($(BR2_PACKAGE_P7ZIP_7ZA),y)
> +P7ZIP_TARGET = 7za
> +else
> +P7ZIP_TARGET = 7zr
> +endif
> +
>   # p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
>   # CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
>   # and ALLFLAGS_CPP as variables to pass the CFLAGS and CXXFLAGS.
> @@ -17,11 +23,12 @@ define P7ZIP_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
>   		CXX="$(TARGET_CXX)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
>   		LDFLAGS="$(TARGET_LDFLAGS)" \
> -		-C $(@D) 7zr
> +		-C $(@D) $(P7ZIP_TARGET)
>   endef
>   
>   define P7ZIP_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/bin/7zr $(TARGET_DIR)/usr/bin/7zr
> +	$(INSTALL) -D -m 0755 $(@D)/bin/$(P7ZIP_TARGET) \
> +		$(TARGET_DIR)/usr/bin/$(P7ZIP_TARGET)
>   endef
>   
>   $(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
