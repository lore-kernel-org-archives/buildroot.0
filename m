Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70364C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 19:48:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9C3D60E96
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 19:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9C3D60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79D5560636;
	Sat, 24 Jul 2021 19:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDRagSMbwQN0; Sat, 24 Jul 2021 19:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B505B6064A;
	Sat, 24 Jul 2021 19:48:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CEA01BF286
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 19:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01E18400FD
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 19:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdNAiaXkKWgY for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 19:48:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35F8D400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 19:48:25 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id o5so9063743ejy.2
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 12:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WpZU/7s5stIP/0/lNtDGcoyfP8xuAHBXzUR7vlunfFQ=;
 b=JaszXhE3gGX619X0BoYwsj82RM9N8eFiH6fprvoT+LrfbYnvxCAVXXr1JwL3qF+sJk
 mML4TKZyuX1Rwt5IFFUUjiIjRRFDbSL75NIGhkxZQMJCXAsFwFSti/uxAnMxs16EjSig
 0DGKxQ6dyGqsczXaG/XVUumeDNLx85utyLo2F3kFt5oPZuKMsIAOUsAjOtGzNjLntqKt
 Po9/74mJW5IiDnKveCuc61CC0ckYA0ybpDuRskiJGb+exDV+PMeOVPRY2nOhz2XoBsgU
 i07YW+HNI5tlcyj/9qVzzKwxolJF7S97fa0b1SgcAt/wY0KkiWhYM+7Q1TssLx9N3E/k
 U7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WpZU/7s5stIP/0/lNtDGcoyfP8xuAHBXzUR7vlunfFQ=;
 b=sg4G31KGxhr0e9t4yj/lVjAppVIalfiJEZpBbXR15ZberMbyrquL9xjYyX2Zqk80Mm
 5+2oyB+axDJly5g+nvByloG24egtZpybTdik35Pgp8VWxnwSgw4agonDqt8M6PGXtaC7
 4KNZv3+sywpiTuh5vf4szaTiyDOFCDYU5XgJnP8rjaORtl6YU2ZG5obSJKVYapbo2zSS
 Gn+u3pJSbHdpZIyk/1j3A6jxSIhxzLRN/WIWof0GgeR+u4CSVeOizbQTBrmGsU+hvoLm
 gPMF/R+eSjTUJaS42opC2NFWPbiaTz8kySR1rfn5cEfmaKMHqcrmTIIB9qZr63ikJSZz
 EVYw==
X-Gm-Message-State: AOAM532AQqfB+MyFPFe9nTcctALNJn+9OLTfm/fMqFNv6JSV1Vk9XTxX
 mKFwqsJcZZBb2Mmxp3L8ojIEaA==
X-Google-Smtp-Source: ABdhPJznf6z188OknyUzzYZqefALbN5ZhJzo530L6AdHZfsXvwyqUjq0kmmgRK0Mwwvo4EVFcgyvlw==
X-Received: by 2002:a17:906:40a:: with SMTP id
 d10mr9980503eja.491.1627156104246; 
 Sat, 24 Jul 2021 12:48:24 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c5sm10111270edk.26.2021.07.24.12.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jul 2021 12:48:23 -0700 (PDT)
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20210708103050.2021668-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <d6423e01-c5fe-5b55-267c-eab8351ea82e@mind.be>
Date: Sat, 24 Jul 2021 21:48:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708103050.2021668-1-fido_max@inbox.ru>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/glibc: bump to version
 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
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
Cc: romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 08/07/2021 12:30, Maxim Kochetkov via buildroot wrote:
> See:
> https://sourceware.org/pipermail/libc-announce/2021/000030.html
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  .../glibc.hash                                                  | 2 +-
>  package/glibc/glibc.mk                                          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/glibc/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f}/glibc.hash (70%)
> 
> diff --git a/package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash b/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
> similarity index 70%
> rename from package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
> rename to package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
> index b1d5243fcc..4b8d8297ec 100644
> --- a/package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
> +++ b/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4  glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
> +sha256  3e2004b16ec6b79a19a88ed4736719ef9e419f9d8e7013faced654c0339e23dc  glibc-2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index f84f670fc0..1c8c409878 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -16,7 +16,7 @@ ifeq ($(BR2_RISCV_32),y)
>  # Until 2.33 is released, just use master
>  GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
>  else
> -GLIBC_VERSION = 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
> +GLIBC_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
>  endif
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
