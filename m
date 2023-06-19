Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23176EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86BF7401F3;
	Mon, 19 Jun 2023 19:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86BF7401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8_4yOpvYj65; Mon, 19 Jun 2023 19:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8486F41558;
	Mon, 19 Jun 2023 19:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8486F41558
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BACF81BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1B5040586
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1B5040586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EzCKper6P5RO for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:34:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 519A3401F3
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 519A3401F3
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:34:20 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51a2661614cso5160793a12.2
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687203258; x=1689795258;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uh0dXxiJc5bpAUJUidC9rN29vKronY4YKkX88Ty1H/I=;
 b=SJKK8zD7YiF0gzOByWv54kQJ6qzrGZI+s+y5DBdN84eP8r5Bg2rJERHKadkN7WHIXI
 s9JXR+S95Md7ed14jPlVxuMnOoKvY2N4A60Ntow9WEIt+HRZtVQ2pHK34IvOa9p0MXdi
 rYexcTjhsm135Rm80wQRPNu4ZOT26Tj2ef9z2vrrCaLG2WlpWyI2c7U/iQarEYEtiska
 Q5ZkNRIPGXzvD/OSRa7UHR+wclZNGDM23D3uESTXmrI8LlgNxTNZakGIBJd2D7y17zdJ
 Y2MSKWdFSSH9OZfRk3vo9AgfWk5rMYMks26qfBBa1FMHF1vgV9NhX03/mu6J4n6xB4OZ
 kHxA==
X-Gm-Message-State: AC+VfDw07+h/wgkA629ysZdkUdYFh/480EiLc2WiMkeSKVd6BDvR+Kg9
 kIHYU3Y70SbGqBolsdHmnqDCPJRJFTQO47ze3ak=
X-Google-Smtp-Source: ACHHUZ6KIzar+PlYCERyRmSIxfFKDBNT7HONXppejX1jTDnAfi3A4zmX996GMTcjCfUP66I+xzxopg==
X-Received: by 2002:aa7:ca4a:0:b0:51a:5ce2:eb99 with SMTP id
 j10-20020aa7ca4a000000b0051a5ce2eb99mr2188929edt.34.1687203258166; 
 Mon, 19 Jun 2023 12:34:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 m18-20020aa7c492000000b005166663b8dcsm103201edq.16.2023.06.19.12.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 12:34:17 -0700 (PDT)
Message-ID: <e884c392-d70d-2220-aabc-747149fab1ee@mind.be>
Date: Mon, 19 Jun 2023 21:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20230619143618.250093-1-peter@korsgaard.com>
In-Reply-To: <20230619143618.250093-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687203258; x=1689795258;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uh0dXxiJc5bpAUJUidC9rN29vKronY4YKkX88Ty1H/I=;
 b=YIGuyPerPWK7XbVRNfp8lRVWLaeuMKdunRYDgnnAli7GeR8GawUZi80F43SGM1GgPl
 GaVCLKWBJ242UCEct8JfvuIBu/HRAQcFgNVLYINngD1Wnvl9QxpM+q0eU9SfX1IqIeNt
 //v69PBc0SLCWxprGCjd7M90LDJj0LnLmbJT+mrCKjKPcXJb6ha2QiXHyZjskGbbQsL9
 p/wT5ZTzebE8QEM4X44f2+Ht+nts5FKed5GgZPZvhliqwqUMJOWXyVkAILLnDKeeSQoV
 Znd4KR/h4LqqHVg3mpVh41zqqLcia60Ie/nDoz94uEXCF8zG+NdiOq+lwh+fMiIn90zY
 84sQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YIGuyPer
Subject: Re: [Buildroot] [PATCH] package/c-ares: security bump to version
 1.19.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/06/2023 16:36, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2023-32067: High.  0-byte UDP payload causes Denial of Service
> - CVE-2023-31147 Moderate.  Insufficient randomness in generation of DNS
>    query IDs
> - CVE-2023-31130.  Moderate.  Buffer Underwrite in ares_inet_net_pton()
> - CVE-2023-31124.  Low.  AutoTools does not set CARES_RANDOM_FILE during
>    cross compilation
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/c-ares/c-ares.hash | 2 +-
>   package/c-ares/c-ares.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
> index edf891674b..3e1573f2cf 100644
> --- a/package/c-ares/c-ares.hash
> +++ b/package/c-ares/c-ares.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  bfceba37e23fd531293829002cac0401ef49a6dc55923f7f92236585b7ad1dd3  c-ares-1.19.0.tar.gz
> +sha256  321700399b72ed0e037d0074c629e7741f6b2ec2dda92956abe3e9671d3e268e  c-ares-1.19.1.tar.gz
>   
>   # Hash for license file
>   sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index 4332fc6919..46b8acd673 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -C_ARES_VERSION = 1.19.0
> +C_ARES_VERSION = 1.19.1
>   C_ARES_SITE = http://c-ares.haxx.se/download
>   C_ARES_INSTALL_STAGING = YES
>   C_ARES_CONF_OPTS = --with-random=/dev/urandom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
