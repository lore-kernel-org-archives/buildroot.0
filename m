Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3D6CCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 13:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B26341159;
	Fri, 10 Oct 2025 13:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWs9I5nF0qDp; Fri, 10 Oct 2025 13:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 726A1411B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 726A1411B3;
	Fri, 10 Oct 2025 13:23:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A340C119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 13:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 951A440CB0
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 13:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2tGqcAM-GLb for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 13:23:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D814040A3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D814040A3B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D814040A3B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 13:23:22 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e29d65728so12586675e9.3
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760102600; x=1760707400;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6wGtPcSjSzcBkFC14y0Dl0ZljkIGzOf4CYVPlZA5uig=;
 b=n4b6VkiT+19ZfLGKEm7Uy9bW6/wN68uCFHnRKIX8TZrE8kqC6t9NX+s3y9ywSIkDIs
 YrM84cYO9QXFaUVG5+qQ/5DnNknQ3LmZXiEXgJSpP53Zb6H9Nv69q4umm6ZW1j+iweqk
 rG7xeMZ21irnpUe98fMUClUorWVy9EZLcWCCLjlT0RVQ0rFzoJd3SHLljf5HUKQg0PiQ
 A4UGET7fc73390wMOvUkI2NmwhCNjgTxVsPn70mWmFjh7cNnHepuvgcYOdvJ/CTaiePW
 e3AnczkoWuJ2Welstxt7VzaqG73AHKQIzPizqajzR0WrklfJaoDxAqvQcNsnlGtIe7mI
 NB5w==
X-Gm-Message-State: AOJu0Yw7L2r9bGqD78KX3lmJ6gt1PNfUp13MhtxsJmJn2ROQMJLNBqQ4
 Td7dvkujy4KkluW+6LdcdE4IUfQnGyurH4giybEi8E9UqE0eZ+OzTIyYC4QgfJKyE378YLE/SdO
 HPYSb
X-Gm-Gg: ASbGnct0hb0bOC+R35/6L8Q9yi9pB4WPjhHE2CfCtwSCHSwi7qVjZoMZngaYJSjjSx4
 WW2CY1OC5NJrdzgNdNH/e/yknCJvfttsU30Az3ZdhsR71lx2/hf2ZYjtF4+UpzD2wa6h5JXT4sU
 aNLQgIcebVRaGbuidNX2c6+7cx8scGwzybGFj2zmPjxWc8/uWlvDe2Qwvak8ONYiDrSBVBHdi7/
 5ufy5NrxyH0H/tdGqhJhiwO/CqK2sLZaT2WPt0JLu2f3sRHWJxTwje5ZrSj1cZtmf4DAZaiBcO0
 WF7bZmowvxOt5OJoU3ozngSNDPYWJVvUciTIFm4FW6VL9kKsjM9m4x39HO5kottptQiQFjBLnO8
 sfD7qbV3V6l4l0dcfcHK5ORR/2alYo+oVJ4gtkJyAn6mIdWDX4FVgKaQkAyepUPR5xmjn9+4Ae2
 /rpsx9UfZzAUydnAUU1n83Os819NKOZ2UgwBph
X-Google-Smtp-Source: AGHT+IHJu26pGS4D/+WQ0wcIGr93O48aBovtXlRkl7UIkKspEWguJEdeQB0dIEM60mRN4Jnkfo7Zyw==
X-Received: by 2002:a05:6000:4014:b0:3ec:e152:e2ce with SMTP id
 ffacd0b85a97d-4266e7e0149mr7633987f8f.32.1760102600007; 
 Fri, 10 Oct 2025 06:23:20 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5d0011sm4176249f8f.31.2025.10.10.06.23.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 06:23:19 -0700 (PDT)
Message-ID: <6ee817c5-ced6-4b1c-840f-15d6e367c7a0@mind.be>
Date: Fri, 10 Oct 2025 15:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20251003135530.371676-1-bernd@kuhls.net>
 <20251003135530.371676-3-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20251003135530.371676-3-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760102600; x=1760707400; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6wGtPcSjSzcBkFC14y0Dl0ZljkIGzOf4CYVPlZA5uig=;
 b=Tm/oFMqFHpDKU28S/88lwRZULT9a+RT/ARS6DqUVJxCHwhJkMCM3FltHQu4bvMBwf+
 IZSvB72uYrFuKa/4NTd7owLfDM6EKd4hiR83X59N/esEKR4hzdIpnfiu2EI23aX2beqW
 3nrClznVP438PQ0sW1tnHKpmajBd39Neu86CUecjxSRTaZFPD6yuuGSaTg0onFgDNXNQ
 OpavHZAxpqS7JCU2C5D9xRAdEWDyhLmBJavGb3IYq7zha/+84Iegq+Iko6z3Km05opCr
 oGdiLKDjL4iraoDYqrLwOxrnPmxSFtTAUI8h9hbuN6LKPIYJlcHib4e4Z7W6xPDASRzr
 xM9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Tm/oFMqF
Subject: Re: [Buildroot] [PATCH 3/3] package/asterisk: bump version to 22.5.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd and all,

Please also note that this is a security bump for CVE-2025-1131, see 
https://github.com/asterisk/asterisk/security/advisories/GHSA-v9q8-9j8m-5xwp

On 3/10/25 15:55, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Acked-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   package/asterisk/asterisk.hash | 2 +-
>   package/asterisk/asterisk.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index f11ed08ef4..26175667c3 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  4cc403c8885d4aed3956dfb75d315d3e5bcc129eb9cd47c156d3b12ecceed1ba  asterisk-22.3.0.tar.gz
> +sha256  8a94650b6f348af1f1c9cce7ed3585d280f3a31b0d3820084a42b03712df95d5  asterisk-22.5.2.tar.gz
>   
>   # Locally computed
>   sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index e7e802aa45..9a071fb8e0 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ASTERISK_VERSION = 22.3.0
> +ASTERISK_VERSION = 22.5.2
>   # Use the github mirror: it's an official mirror maintained by Digium, and
>   # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>   ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
Regards,
Titouan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
