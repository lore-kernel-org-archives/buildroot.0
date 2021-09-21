Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF71C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:04:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4D9C61186
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4D9C61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 882476067B;
	Tue, 21 Sep 2021 19:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FAeeSVkmGMsU; Tue, 21 Sep 2021 19:04:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C71A96006A;
	Tue, 21 Sep 2021 19:04:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AB291BF3A6
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A9016006A
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZ9DF5EdbOTt for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:04:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A3056001B
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:04:08 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id eg28so436307edb.1
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HR/qPFmp/XH/2yDWxDJ9+clVk7SLy14h5i4kWJSfH0M=;
 b=aGqcYQJRDYHegWaUxZSmCYqgUe5Ku7CbWOjb0eJAamZyml3JfpG2GSPPWPTNwkNJzL
 uWMQ0eCDUzTQtFP0G/qDBr5ECk8ekLStkXReAG4cV//NXaiFOYWHluA8fbgpFDwkO4+O
 yE9PB/yM6NjmFa5HOlb7A4rpzUa5wiPUAuOgjVlgkPJvgtT4+xLWTe9AE/wWjNkVCHtv
 de9tcPIl7qCQySePfq83s8/CitTkdF7cLV4CKNaDOKOrGSCs+Wb3fIe1cYWGLqR268in
 q2r28q/DmboLPVsGGYkG/8QcGMgfOhkZRexMeuPrrWysz201ntc5YE9pgwPdK5RBOsht
 +saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HR/qPFmp/XH/2yDWxDJ9+clVk7SLy14h5i4kWJSfH0M=;
 b=S79OpgAZYiYrRQT65CLg+V83gK+R9QuRJ4qJ3fKG4HzY1To8ApzgdEeCIXeg75f+M0
 XgjgnOmtXDflVSkWmJ3QsfHJYoDt3A3JQTqTkRKrz5X9FO+/PfoI86d9Kn76bMKDR/jd
 S4qDKVNqqVdKF+e4HXttzhogLXxq0FkJxGcf8yqIvlR1oL2BTisPlEx95Nj8W54+OqRn
 hAdGniKmdhNTM5J8fQxDwOrMVKxt52FiCEfKS5YIfZHwTxJD0Ueb+oxIOJXpOoGES/ww
 XZ9v8vrwEVYhfPkYXbw+5goyQBsYK/hhs1U6XtgCAm9BN2yfOP4AeVbBOSI7TfOnx+NZ
 BOUg==
X-Gm-Message-State: AOAM5301kFe46o8hd4C9mAI/ReNgPsmZs3ezVDW7PRcZTnjTeAxxEXVp
 FtgxSEIJx1W8XrznaKiQyGyO7A==
X-Google-Smtp-Source: ABdhPJyIukF/8MXp3EMrHHxqZmivaDhZG4vBKrAzu9zfC22nmBU3vrtHR8PjWCA3GlvjrcE5W0qasw==
X-Received: by 2002:a17:907:11c2:: with SMTP id
 va2mr15969834ejb.160.1632251045710; 
 Tue, 21 Sep 2021 12:04:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d16sm7855247ejk.39.2021.09.21.12.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:04:05 -0700 (PDT)
Message-ID: <e305bdc0-088b-47c0-687a-4a3632089d2e@mind.be>
Date: Tue, 21 Sep 2021 21:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Illia Bitkov <illia.bitkov@mind.be>, buildroot@buildroot.org
References: <20210909151740.1097665-1-illia.bitkov@mind.be>
 <20210909151740.1097665-2-illia.bitkov@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210909151740.1097665-2-illia.bitkov@mind.be>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/alsa-lib: add smixer-python
 module for alsa-lib python config
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Adam Dusketta <aduskett@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 09/09/2021 17:17, Illia Bitkov wrote:
> Add simple mixer python bindings to build when "Python support for alsa-lib" is active.
> smixer-python is the only one python module which exists in alsa-lib.

  Please wrap the commit message at 72 columns.

  I've changed the subject line to "package/alsa-lib: smixer-python module 
supports python3" because IMHO adding python3 is the most important feature of 
this patch.


  Applied to master, thanks.

  Regards,
  Arnout


> 
> Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
> ---
>   package/alsa-lib/Config.in   |  2 +-
>   package/alsa-lib/alsa-lib.mk | 10 ++++++++++
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
> index f334b66bff..4168d1f220 100644
> --- a/package/alsa-lib/Config.in
> +++ b/package/alsa-lib/Config.in
> @@ -22,7 +22,7 @@ if BR2_PACKAGE_ALSA_LIB
>   
>   config BR2_PACKAGE_ALSA_LIB_PYTHON
>   	bool "Python support for alsa-lib"
> -	depends on BR2_PACKAGE_PYTHON
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>   	help
>   	  Add python support for alsa-lib.
>   	  Python will be built and libpython will be installed
> diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
> index c71ad5dd58..99c53f9408 100644
> --- a/package/alsa-lib/alsa-lib.mk
> +++ b/package/alsa-lib/alsa-lib.mk
> @@ -57,12 +57,22 @@ ALSA_LIB_CONF_OPTS += --disable-old-symbols
>   endif
>   
>   ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
> +ALSA_LIB_CONF_OPTS += \
> +	--enable-mixer-pymods
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
>   ALSA_LIB_CONF_OPTS += \
>   	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
>   	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
>   ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
>   ALSA_LIB_DEPENDENCIES = python
>   else
> +ALSA_LIB_CONF_OPTS += \
> +	--with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
> +	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
> +ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
> +ALSA_LIB_DEPENDENCIES = python3
> +endif
> +else
>   ALSA_LIB_CONF_OPTS += --disable-python
>   endif
>   
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
