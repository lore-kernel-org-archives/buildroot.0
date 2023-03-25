Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDDAC6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40E7A81D65;
	Sat, 25 Mar 2023 20:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40E7A81D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6I2XljwpuL5I; Sat, 25 Mar 2023 20:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7885B81B52;
	Sat, 25 Mar 2023 20:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7885B81B52
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DB941BF2C0
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4434A4019E
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4434A4019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fQ_S3Q_92bCf for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 20:59:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E70440141
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E70440141
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 20:59:51 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id ek18so21130052edb.6
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 13:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679777990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tTFgPfKO7PCUXnL0KZ1fq5VhmreUOQup9oC51N4vEgg=;
 b=YLzIMf3Em7Zl2WzUDcUdlemvLxOkLjokm/YviS+rRnc/BzuTgY/AReuvDFaNaVVx5L
 ghe3wnyM5fRDZF2vAWYRjJPAtvTcxHNmRki/sCaTNx6Ji0DVAG50CLELOqLKPkEgIOBT
 m5QvFjh7eebpjV9MKyu1Pj+IVhttmvQJj7SffiDUH+PZSLLlJ9lzqkk9V2nyMGreRZ0U
 xmd0CfAG6XptP2nYNc8D71B3PONqgKNXZJtAJfPO3189MNAfErFy6o9YkkAKrSTVgKcK
 cPimHsF7QXtYY20qQMskWdaNcICSd6h0gTcVCzpK4+clkTkcUDc3o6R4P7B3bxE5+F14
 Q56w==
X-Gm-Message-State: AAQBX9eq33691ZoXIdCAxkOd0CMEzi2zxacmxZVU1Ou9fIfdSof+ZiUr
 6qPduVBc5ueaLJoM/sGRsmlpUg==
X-Google-Smtp-Source: AKy350YEwPT8BUxH3YJZX3ZmFN62MXWcgmbP0wpYCI7pGzFiWpJJvBxpKW83PrmMZLstsIqHnGgB1A==
X-Received: by 2002:a17:906:5589:b0:88a:2e57:9813 with SMTP id
 y9-20020a170906558900b0088a2e579813mr7983783ejp.33.1679777989752; 
 Sat, 25 Mar 2023 13:59:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18?
 (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
 by smtp.gmail.com with ESMTPSA id
 xo20-20020a170907bb9400b0093f0fbebfc2sm1652820ejc.144.2023.03.25.13.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 13:59:49 -0700 (PDT)
Message-ID: <db8a122c-2fd1-5b98-06e2-db3c1529f22b@mind.be>
Date: Sat, 25 Mar 2023 21:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
 <20230221172205.2450111-13-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221172205.2450111-13-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1679777990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tTFgPfKO7PCUXnL0KZ1fq5VhmreUOQup9oC51N4vEgg=;
 b=EQC+hMe82xfSCVeJDWMTNkjblpAsQ5VStqtOpLjpdE+lad49qNQ5G5L+LAvUEuFz4C
 ZP3bqAHwKf8Yb+Z53+eqS8oqiKjCrgPJ3V3BNZ3VQ393srFz7HFQpZdFZ8TcEbG4hwZT
 BY/t9HsJ+Xd/zoacZsM+7V2HWXOQ6MSqw0iQvqh/L8jb1VsYtt2wMwr0RnC2+uzLaskT
 mUzeUB7brqrTXwhNA79kEpndUKWaOJsRM+Nph6eevxed1OXJA7IgFR5kp9YhfFltU9xr
 ryt3IvaNZxhH8wL8X9/gac5BBzaw3cramPLJ0++xCvIQzkOMAw9mCQ2DL9htDvDczrvo
 j1qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EQC+hMe8
Subject: Re: [Buildroot] [PATCH 13/15] package/pkg-autotools: drop support
 for FOO_GETTEXTIZE
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2023 18:22, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Remove all support for FOO_GETTEXTIZE and alert users to FOO_AUTOPOINT
> as the recommended solution in its stead.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>   package/pkg-autotools.mk | 23 +----------------------
>   package/pkg-generic.mk   |  3 +++
>   2 files changed, 4 insertions(+), 22 deletions(-)
[snip]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a6ef5efb5f..6be28db623 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1215,6 +1215,9 @@ endif
>   ifneq ($$($(2)_GETTEXTIZE_OPTS),)
>   $$(error "$(2)_GETTEXTIZE_OPTS is no longer supported. Please fix your .mk file.")
>   endif

  The warnings about GETTEXTIZE_OPTS are no longer relevant. Indeed, 
GETTEXTIZE_OPTS was only used when GETTEXTIZE was set, so the warning below 
already covers it.

> +ifneq ($$($(2)_GETTEXTIZE),)
> +$$(error "$(2)_GETTEXTIZE is no longer supported in favor of $(2)_AUTOPOINT. Please update your package.")

  Since from a user perspective, they just need to replace GETTEXTIZE with 
AUTOPOINT, I changed this to use the standard check-deprecated-variable call. I 
know that it's not _completely_ equivalent, but it's not as if this custom text 
is giving the user any more information than the standard "use AUTOPOINT instead 
of GETTEXTIZE".


  Regards,
  Arnout

> +endif
>   
>   PACKAGES += $(1)
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
