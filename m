Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C143C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AF38415F5;
	Fri, 13 May 2022 21:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Y-61opso43A; Fri, 13 May 2022 21:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B0EF41484;
	Fri, 13 May 2022 21:56:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A49741BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92CCA60806
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HVeCl3AtFpT for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:56:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B99C60681
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:56:03 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g23so11377725edy.13
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bcun/kmn0T7RQqoJE7lBiM/QJwy1ZnfigfxRCuA2hPQ=;
 b=SYIFFD4903zOlZQyuxmhGq609OYAxnmCfpJTKUJDpI8xazMwiJrkvaNekllNJsXpNC
 WjfoHkoMAMKk54SEMLsiUTn9M1IuakEgwEjaVD7wkqp8oV8M+HjhBoNJ9rI9o7spVdXh
 juI+iheTEX5ismAz41DProIZdzPv34LkqnKayDBWgvYeC6YHHIgOV+ErW64nWXE71xFb
 7pSAAt96BDxqM8bmHozkPYUYCR/2bQ6VpRRaTcKqXwFrqPyBygwi1SKlY+shIRAwTBt2
 FUv6W8YQhlstlT/WIzCcktv9vz8BNRq2nkSzL+r6ri8KFL2sdj06u02jlP58vcAbGVmr
 h9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bcun/kmn0T7RQqoJE7lBiM/QJwy1ZnfigfxRCuA2hPQ=;
 b=g+2wDyHXPMVEpcp7vXiUXPKwGzd8hxM/E8+zF7rpcXaF+syOqml/7HOkOgu2YPv+D6
 Zz0hvJvJXf0CTIHqHob7n+xGqqfR6JNeY0dG5gLfZj0LutigyX0o/e3rXQXMDgKtl3Kw
 YKUUnaiVBMDyJbyUidNNtWGSouTDAqtnv+N/Az8JtvfpwAF6XETibaGaFYDKjVnjvwhq
 6PoSgG3an+3ABEjRYtxngYeSI7SphzlfJ794gZhy94l15rTGO3NSoH+13n6Qu3ufyYP2
 Ll1hK4dLV/SLzS6jnLJp/IlCiP76ChjZXIz8dokb3H7PYVRFZ5vZIlt8TJENhVq/i8e9
 HnYQ==
X-Gm-Message-State: AOAM530PMUtAvDYbGsCZAgO8puM7FaUS/FhovfIF9MmtCaAxTeO8eaRe
 u9Ed5L1Muu+mA9o4cD8ySx7vOA==
X-Google-Smtp-Source: ABdhPJwY+ZWoJAmJ1n9nbQq7mq6uYDEXcpKF2TWuF09Xw5uURIOm4qeoYID9h0+33AdxF6fx2dG3lQ==
X-Received: by 2002:a50:f69b:0:b0:425:e693:5d1f with SMTP id
 d27-20020a50f69b000000b00425e6935d1fmr746899edn.272.1652478961661; 
 Fri, 13 May 2022 14:56:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a17090651cc00b006f3ef214e17sm1163059ejk.125.2022.05.13.14.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:56:01 -0700 (PDT)
Message-ID: <499beaa9-aa4b-6582-8a48-45fc1ecb31cf@mind.be>
Date: Fri, 13 May 2022 23:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220510044636.3061290-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220510044636.3061290-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/git: fix build with iconv
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/05/2022 06:46, James Hilliard wrote:
> Our libiconv shouldn't need the ICONV_OMITS_BOM workaround.
> 
> We also need to correctly set the iconv path so that we don't use the
> host iconv path.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/027/027602a750fd0989f9861773a2c4672667590acc
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Weird that this only comes up now - the incorrect --with-iconv has been there 
since 9 years ago...

  Regards,
  Arnout

> ---
>   package/git/git.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/git/git.mk b/package/git/git.mk
> index 0127ba5129..981a238acb 100644
> --- a/package/git/git.mk
> +++ b/package/git/git.mk
> @@ -49,7 +49,8 @@ endif
>   ifeq ($(BR2_PACKAGE_LIBICONV),y)
>   GIT_DEPENDENCIES += libiconv
>   GIT_CONF_ENV_LIBS += -liconv
> -GIT_CONF_OPTS += --with-iconv=/usr/lib
> +GIT_CONF_OPTS += --with-iconv=$(STAGING_DIR)/usr
> +GIT_CONF_ENV += ac_cv_iconv_omits_bom=no
>   else
>   GIT_CONF_OPTS += --without-iconv
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
