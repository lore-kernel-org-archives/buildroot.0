Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F289C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:31:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02CC36109F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02CC36109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC702400E8;
	Sat, 11 Sep 2021 14:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mf_6f7KdX7UG; Sat, 11 Sep 2021 14:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5D1640227;
	Sat, 11 Sep 2021 14:31:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30CCF1BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 200FF83E4A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omEaPpJBOrd3 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:31:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDB3E83E3A
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:31:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id kt8so10408528ejb.13
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lkPprNbxCvIZBoaEY308yM+LeCsXRPmoDwL6iZRNZmo=;
 b=Qjb0pP+B20WFJTn3LzJb9rnF4BjkuFBYv32MgK+Zdps2TarEX2lJsdN/cssDk6nEnt
 ztwzB4LTMc/BMHZ1Zf2Up0+HWNSQUpI1dalhH47c4Ak5B187jwTv36dUK6hPao9vKOZG
 R7lWbCQd2rpK6JvU6vYdKhjB26Z86SSwddq3P1jKC/fxtc9jirXHCxYQzUJNG8lTdITb
 9tM2Z7wNUFUWESq06Rqz/+pcCNmtI1zcsmZyNhlgMUo+0mJvJUCP1qDXgJKjJ+jvGyig
 Lh8YcmxkpUV78plAyE/kJGm9hcsUhfAfkl0MGpJlzrLEP0O0mihLcXqT/Q7HRO0zblmO
 TehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lkPprNbxCvIZBoaEY308yM+LeCsXRPmoDwL6iZRNZmo=;
 b=XTj91BQkAmsao7tYNjD2cwnyGE6jF6cl/YG9OS8HrvG8YnQBaSQEaQmXitdU7yugL+
 KIUzBQwLdcgFaqqa5duIOUnjrk0fiJjr+OyhAB0Bs/MykkGMdWu6K0tY0T6KSfZbfeEC
 NpxsCkBmssfmL/hnRlEkCE4M/w7/VQHYxlZwdZ9hnyN+GVwuEBHFMnoqD74ODXbBp8Vs
 vdwCS6GwFiaYC8D3Bcrr+sCFPaZSveHOGgCiF2fUWvWrrfNGS+wOwGq6AyylbLt5KlEh
 +mC+TYgp78WdtMQF2z5mRl4p9aoca2Toff0y5h/3bGlmkX9DzyTwk4iO1V+YJZlO/NIB
 fgjQ==
X-Gm-Message-State: AOAM533zhRxqPAVAv6OXGkJV/gqrYJCR6ZctT99dEqUaV9vzUmMB7rw6
 tpIBaZ5ppt66ff1NlpcH1+VtenugVUB3lA==
X-Google-Smtp-Source: ABdhPJzdstZqBejzM30eSCUEaztuKzuZFb8KzxhKiGTiupqbtz+DqZYSNIp4EaeOuxDYFgQrDj7aHQ==
X-Received: by 2002:a17:906:3fc1:: with SMTP id
 k1mr3196516ejj.44.1631370676181; 
 Sat, 11 Sep 2021 07:31:16 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a15sm1054519edr.2.2021.09.11.07.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:31:15 -0700 (PDT)
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20210830153056.3176678-1-troglobit@gmail.com>
 <20210830153056.3176678-2-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b1f7ff80-0164-2178-d11e-1cff5f0c37b8@mind.be>
Date: Sat, 11 Sep 2021 16:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830153056.3176678-2-troglobit@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/3] package/smcroute: bump version to
 v2.5.2
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 30/08/2021 17:30, Joachim Wiberg wrote:
>  - Upstream has changed to tar.gz
>  - Drop _SOURCE, fixes check-package warning
>  - setpgrp not used anymore, no need to override configure cache
>  - Makefile no longer uses CC?=, drop comment
>  - Enable MRDISC build option, must be activated per phyint in
>    smcroute.conf, so safe to enable as a default build option
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

 All three applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/smcroute/smcroute.hash | 7 ++++---
>  package/smcroute/smcroute.mk   | 7 ++-----
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
> index f79ce167ed..62b72239cc 100644
> --- a/package/smcroute/smcroute.hash
> +++ b/package/smcroute/smcroute.hash
> @@ -1,5 +1,6 @@
> +# Upstream .md5 and .sha256 from GitHub
> +sha256	7eca88389cc08cbfe75f787e02ab32a390ef806555069a08abe8d7fa925ed094  smcroute-2.5.2.tar.gz
> +md5	dc29e6bd3024a1ad3dd0f2d8c2aed16e  smcroute-2.5.2.tar.gz
> +
>  # Locally generated
> -sha256	431be94c46646767f69c85fee445277b7e765a55177d3ee29522416cfe2cc067  smcroute-2.4.4.tar.xz
>  sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> -# From https://github.com/troglobit/smcroute/releases/download/2.4.4/smcroute-2.4.4.tar.xz.md5
> -md5	a1dc8c54c684e8c8de139444f73a0ba3  smcroute-2.4.4.tar.xz
> diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
> index 0db0e084f6..e4ee81db6f 100644
> --- a/package/smcroute/smcroute.mk
> +++ b/package/smcroute/smcroute.mk
> @@ -4,16 +4,13 @@
>  #
>  ################################################################################
>  
> -SMCROUTE_VERSION = 2.4.4
> -SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
> +SMCROUTE_VERSION = 2.5.2
>  SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
>  SMCROUTE_LICENSE = GPL-2.0+
>  SMCROUTE_LICENSE_FILES = COPYING
>  SMCROUTE_CPE_ID_VENDOR = troglobit
>  
> -SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
> -#BUG:The package Makefile uses CC?= even though the package is autotools based
> -SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
> +SMCROUTE_CONF_OPTS = --enable-mrdisc
>  
>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  SMCROUTE_DEPENDENCIES = libcap
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
