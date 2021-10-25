Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED00C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:59:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC67560FE8
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC67560FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BDD180896;
	Mon, 25 Oct 2021 18:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eR0T3Tn-Bpd; Mon, 25 Oct 2021 18:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C61EA80F02;
	Mon, 25 Oct 2021 18:59:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8981BF20D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EFAB40159
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUchCiB4z8Ba for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFBEB400FA
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:59:05 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w15so3247420edc.9
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2FB1Ztw06Qo0VVMWY2VvKK3YQEHOelm0uCpKrdG98h8=;
 b=BHNHEVOMxBMz0yTvG2snA53/mxTtzRKIXQ48PYdfHFocOPZObPt3FxzCiK2V4Eby95
 1w5v8nKHzdV805j3uP3SzYHQr79OrYhb1VWmuCfmvwM3SDotOBVFKHAlM6LjWCJY6cue
 4DGaXkZ2aDD8usf6YllrpmTRAAahUgn8AErkOwDzNjN3+6wMqTnsjqw26iKel6NO1NgJ
 f+VWZ3VSZ2vtbwDfUnoML5NrKBh8VaI/XkUNWcDl4d44co+5Lc9Nw2l17ng1C00fBaND
 geR2jrI3awJtGqkF4aY+6WEPhycZx2m7VT5RdxHRwfoG3O6T1W6Rzn98fJUIjESc/mHO
 Xrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2FB1Ztw06Qo0VVMWY2VvKK3YQEHOelm0uCpKrdG98h8=;
 b=padCaW+cZfE3spDhUXfjHKMYMJnRZZ6YwJ4rjpMezwUW8A3JtWYVZByMrNa/nnbgYp
 5sj7q7FahutTf9XPZluy8TRkesuj/oA6iKDx+xzFJSHKlpa9Kbf4ts1todnhdy7wW/r1
 Ad+pBhOJ+HocYD6+Vn3Fqx0D7B6DseyAhsFAaeAeEgOf9lz0LKIwGfn0SFjNAMWLx/ZZ
 yUU4ojXO7IXJT9vdeZNAnIA4xoEKHVuGBgLpVjNchz5siobZwVLmCtZ58PZZC9KfQ3eA
 ET229C9X6+AWIUsqxMu99NqCg+o1Uypiq+W/Ydh6d0MPkDR3kSaVMohB1IlVR/SRFdH0
 kAHg==
X-Gm-Message-State: AOAM530NNM+g8WAjK5O/AsVf8dM1SFqoqXb/XFlPgVgGGZecagnuZ7uh
 /WlJ7Iu2RVvGZ6wuuNb3z/6FFQ==
X-Google-Smtp-Source: ABdhPJxtSb3rtpuTQPtAF9Yi0/Ow3Qe4X3GNDHHQpEE+Bi/DWqhiYB4TpKmtqZmlQGCBQGCdIeN50g==
X-Received: by 2002:a17:907:971e:: with SMTP id
 jg30mr24330207ejc.169.1635188344162; 
 Mon, 25 Oct 2021 11:59:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f17sm1710889ejd.18.2021.10.25.11.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:59:03 -0700 (PDT)
Message-ID: <776a3180-efc0-78af-b4f4-29fb185a7e26@mind.be>
Date: Mon, 25 Oct 2021 20:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211014204627.2433655-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211014204627.2433655-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to
 erlang-jiffy package
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



On 14/10/2021 22:46, Giulio Benetti wrote:
> Add Giulio Benetti to erlang-jiffy package.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b1439391ca..9950dd5d8c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1056,6 +1056,7 @@ F:	package/xapian/
>   N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
>   F:	package/at/
>   F:	package/binutils/
> +F:	package/erlang-jiffy/
>   F:	package/gcc/
>   F:	package/harfbuzz/
>   F:	package/libfuse3/
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
