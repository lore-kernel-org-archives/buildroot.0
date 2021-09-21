Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14A4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:22:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AFD060F4C
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AFD060F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F1DB61383;
	Tue, 21 Sep 2021 19:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zIlzz53pJy1; Tue, 21 Sep 2021 19:22:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CBE5610D8;
	Tue, 21 Sep 2021 19:22:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 187A21BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0846B8330B
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBtDpS2r7Z6i for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:22:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 556B4832D4
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:22:05 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id bx4so532682edb.4
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JIfNkFR1AJDcuSIK8TjcKGu62zUzp7Y6XyZJzQYEgOs=;
 b=WtpIX2BmZKgQe6nh2vd6ApiY3gd2Nj/zi4RYZP7P88XmuEFgLawXivGoSZyAnnVA8m
 jwdYuf9Ij144qr6xKQOQCWJlYSS1pFy5BoayF8MRt9zdLlozP+nndNgcu5T4UcoSdUGD
 GQqL/RZzsoEsmqk+3Si/N0BI2T8AvZDsCi8fT+SNeq5oF5MmUg4hG9bYMqUozJ3y6LeM
 Z9z0wu7rT4G+1y1VdOeNnvGPt6SBiO4qXXlWWz3p7WatMQ1dJGKUzDqcC+3o82mLSDWj
 od4VhxbE5U0wnuiloHRX/S8P3weSXT4xWw2bYk3Rck5isFE1ZWN/fk66QhpvwJXrbDmU
 7KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JIfNkFR1AJDcuSIK8TjcKGu62zUzp7Y6XyZJzQYEgOs=;
 b=s3Ak/o2S1ruePmkPcbcy+nazP6NjE8UOVP1P/W44p8cO7X0TkTMWmrCJC7refwAohk
 rM4agPEOYyU2MpNPtCT5Suvj2bfZ0zJG+dBHPEgQOm0AJX4v18/cDWlwEaBChTIcozG4
 FJ5hlSQB/zSgYvUwB/P9ZmNndR7Ea1Jsd3e0TCHpmyQ0mMb0kvrE1Ifets+rNbnMomRd
 hZWU9yh7etgBnIYnZSqUjdaJpot+ql7z3rqny3diHCcMso1m25m8A+HZVyew7/TC/psS
 Hh3m6I/cMh96VqLvj9poeEkC8HlKTNE7KvXtfAeTjf46e69vB7K4PFzjhUaGQ/F27kDj
 VGRg==
X-Gm-Message-State: AOAM532MQTCMZ5mb/mB/resUmh5tGL9yePe/ilYhEACMgXaw1bTYya7Q
 AgoskCCCtJmCE67+d3JyBpMaWQ==
X-Google-Smtp-Source: ABdhPJwvg6VvOloZbWKcLKUU9UfpGDMl8vOJ26l/A9q0Ricz3PsT4jY/Z0WzJCYjjJJ9Z+W2ldjzYA==
X-Received: by 2002:a17:906:c1c9:: with SMTP id
 bw9mr36772426ejb.3.1632252123496; 
 Tue, 21 Sep 2021 12:22:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u19sm6333756edv.40.2021.09.21.12.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:22:03 -0700 (PDT)
Message-ID: <4304bab6-f963-30ea-4ab9-18f64d7ae3e3@mind.be>
Date: Tue, 21 Sep 2021 21:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210910214022.640034-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210910214022.640034-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/liblinear: bump to version 2.43
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 23:40, Fabrice Fontaine wrote:
> - Update hash of COPYRIGHT (update in year:
>    https://github.com/cjlin1/liblinear/commit/65115f742683b21ed10582c1664829e0146fcaec
>    https://github.com/cjlin1/liblinear/commit/acf2f9caf166574a23912fe0e57e16187f74f5a6)
> - Refresh second patch
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/liblinear/0002-build-static-lib.patch | 12 +++++++-----
>   package/liblinear/liblinear.hash              |  4 ++--
>   package/liblinear/liblinear.mk                |  2 +-
>   3 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/package/liblinear/0002-build-static-lib.patch b/package/liblinear/0002-build-static-lib.patch
> index 98657d3c82..f3497b767e 100644
> --- a/package/liblinear/0002-build-static-lib.patch
> +++ b/package/liblinear/0002-build-static-lib.patch
> @@ -1,18 +1,20 @@
>   Makefile: add a rule to build a static library
>   
>   Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +[Fabrice: update for 2.43]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   diff -durN liblinear-1.96.orig/Makefile liblinear-1.96/Makefile
>   --- liblinear-1.96.orig/Makefile	2014-11-15 07:50:23.000000000 +0100
>   +++ liblinear-1.96/Makefile	2014-12-14 00:23:00.135893956 +0100
>   @@ -16,6 +16,11 @@
>    	fi; \
> - 	$(CXX) $${SHARED_LIB_FLAG} linear.o tron.o blas/blas.a -o liblinear.so.$(SHVER)
> + 	$(CXX) $${SHARED_LIB_FLAG} linear.o newton.o blas/blas.a -o liblinear.so.$(SHVER)
>    
>   +# Keeping blas/blas.a as a pre-requisite, to ensure all .o files are built
> -+static-lib: linear.o tron.o blas/blas.a
> -+	$(AR) rcv liblinear.a linear.o tron.o blas/*.o
> ++static-lib: linear.o newton.o blas/blas.a
> ++	$(AR) rcv liblinear.a linear.o newton.o blas/*.o
>   +	$(RANLIB) liblinear.a
>   +
> - train: tron.o linear.o train.c blas/blas.a
> - 	$(CXX) $(CFLAGS) -o train train.c tron.o linear.o $(LIBS)
> + train: newton.o linear.o train.c blas/blas.a
> + 	$(CXX) $(CFLAGS) -o train train.c newton.o linear.o $(LIBS)
>    
> diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
> index 4430d29989..a714b8bc4e 100644
> --- a/package/liblinear/liblinear.hash
> +++ b/package/liblinear/liblinear.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 881c7039c6cf93119c781fb56263de91617b3eca8c3951f2c19a3797de95c6ac liblinear-2.30.tar.gz
> -sha256 c366abf1cb3a003d8c6e6d9c111a23c432db1d001294f88d479b70b60d7c0af2 COPYRIGHT
> +sha256  02bad43d745e2796f39a08ac9d117770e71939ef06b1ee7afc6ab7909e304807  liblinear-2.43.tar.gz
> +sha256  c5c91211a0edaa4c77e352f6b27a8f9c6768afe27d48176d6094905c534eacb3  COPYRIGHT
> diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
> index 2d0fd0013c..3b137ed518 100644
> --- a/package/liblinear/liblinear.mk
> +++ b/package/liblinear/liblinear.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBLINEAR_VERSION = 2.30
> +LIBLINEAR_VERSION = 2.43
>   LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
>   LIBLINEAR_LICENSE = BSD-3-Clause
>   LIBLINEAR_LICENSE_FILES = COPYRIGHT
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
