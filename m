Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26344C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:04:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EE560F13
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80EE560F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DEF64036F;
	Mon, 20 Sep 2021 19:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3Tokb_ang4Z; Mon, 20 Sep 2021 19:04:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A63314039C;
	Mon, 20 Sep 2021 19:04:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEB331BF844
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE43F4032A
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nar9lAgrNtWp for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:04:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 206884031B
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:04:36 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g8so65339693edt.7
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=uTNc9dv9uEzVtkb2CYd1b02bGAdUDHeQNpDCt8GPdQo=;
 b=GmXAVqOYOg4RR82x7Eox4btEM4GjGfIvYCF2VYKAoXkswPl2FBAPhMIz4h3Sl10lnD
 seTe47L/rOp3HMH6nH4dGvgCiFW1f6kSrVEnvxnrwV+NskrSiCB78rZGaGyE/JV3QOsH
 GfSzISbeklt6ehX/g1fmTKaGy5zVdT4YSL5dncvWV1ZFIOSPpy8bfq/Jdu0CRAWpaO+3
 i1fPSEfY6vDeLTawIi+ejNqTUuXtNrOyrvAgeEJQfKYOqsvRWvxgm0mC2e+QX3THO5ow
 7oAdPdLSBnKzxUkDuwydzScEwztKex7qKhkvyNnbSeM9SnM99G8DhaMID0aea6qkjJ7c
 iqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uTNc9dv9uEzVtkb2CYd1b02bGAdUDHeQNpDCt8GPdQo=;
 b=0G+OUYoqNmFmohpy66++RwQvgOKK3Sn/1D9lCTzJPQu54gISdfS0SAfb2SwJKMWvRU
 wWaMkNcn6iMqhAod87pXwlfK1tSk1eNVA86fhXiLn0OehMIMgT+w6ibWfZ9qRJkNpSVr
 BIuVSrqCZgil3Do5adKBGfLt2SGEtlPML+lWrSj7JKx/3Xs1Z5Nm/SYgFpa4+E+r9gwV
 GrQu/jKeYxYpgv9WTgN1w6XZElZtdmIs5tG/Ni9r7acgh8H5tqPjJdVXNzi1OF38wend
 aaExIlg64jiGujdTgeSAhxqQrmo7SsGVTZ9QkiYyqRIqXWn8SIwBtD8jOZMhxTX+wY6Q
 8Dnw==
X-Gm-Message-State: AOAM531QQwQqLY3BtlW//NBJPqFpcVzUrH7tdmvaO5XmVtVcsesHA9DN
 iZZVRK3r6heOpl5Q6OFlWR6FxUsfGCIgag==
X-Google-Smtp-Source: ABdhPJzGbYV4D3EHfT6hyVCcQWta8C2afmZuUkVvub9+6IXcZBnkKr7VhO5Bv/0AOOVEXgd1evAalg==
X-Received: by 2002:a17:906:3b53:: with SMTP id
 h19mr17256824ejf.109.1632164675168; 
 Mon, 20 Sep 2021 12:04:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a7sm285959eda.70.2021.09.20.12.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:04:34 -0700 (PDT)
Message-ID: <839434e8-7205-ad8f-dae8-71923ba4d228@mind.be>
Date: Mon, 20 Sep 2021 21:04:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 buildroot@buildroot.org
References: <20210908133010.31005-1-nicolas.cavallari@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908133010.31005-1-nicolas.cavallari@green-communications.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump to version 1.2.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 08/09/2021 15:30, Nicolas Cavallari wrote:
> COPYING was updated with a copy of the openssl licence since libgit2 now
> include openssl headers so it can dlopen it:
> 
>      openssl: dynamically load libssl and symbols (optionally)
> 
>      Provide an interface around OpenSSL to dynamically load the
>      libraries and symbols, so that users can distribute a libgit2
>      library that is not linked directly against OpenSSL.  This enables
>      users to target multiple distributions with a single binary.
> 
>      This mechanism is optional and disabled by default.  Configure cmake
>      with -DUSE_HTTPS=OpenSSL-Dynamic to use it.
> 
> We do not use that option so the headers are not even used, plus the
> headers are not installed on the target anyway, so this patch includes
> no license changes.

  Thank you for the *excellent* explanation!

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Upstream also stopped providing release tarballs, relying on
> github-generated tarballs instead.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>   package/libgit2/libgit2.hash | 4 ++--
>   package/libgit2/libgit2.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
> index 367ade3afe..5522f5fe45 100644
> --- a/package/libgit2/libgit2.hash
> +++ b/package/libgit2/libgit2.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  ad73f845965cfd528e70f654e428073121a3fa0dc23caac81a1b1300277d4dba  libgit2-1.1.0.tar.gz
> -sha256  afc8bde99ba630012107c25d3c42dde628ec5f0cd3f428131f7e3a0f7d58ff42  COPYING
> +sha256  701a5086a968a46f25e631941b99fc23e4755ca2c56f59371ce1d94b9a0cc643  libgit2-1.2.0.tar.gz
> +sha256  8b7e4f54f8bf210c8fe010a49571a1ee57463ef020cc43f051d4d3fbb74942af  COPYING
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index 668fa758f8..4c715302d1 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LIBGIT2_VERSION = 1.1.0
> -LIBGIT2_SITE = https://github.com/libgit2/libgit2/releases/download/v$(LIBGIT2_VERSION)
> +LIBGIT2_VERSION = 1.2.0
> +LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
>   LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
>   LIBGIT2_LICENSE_FILES = COPYING
>   LIBGIT2_CPE_ID_VENDOR = libgit2_project
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
