Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9264DC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 07:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 009BA80DC2;
	Mon, 15 Jul 2024 07:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXHEj52OHqlJ; Mon, 15 Jul 2024 07:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8F0C80E07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8F0C80E07;
	Mon, 15 Jul 2024 07:44:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE1B41BF2B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAFC3404C5
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcSWAngx3Z6t for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 07:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55FA840195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55FA840195
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55FA840195
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:44:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4266f535e82so26426605e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 00:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721029468; x=1721634268;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OsshIPzGMR/mSEariq99Qc8N+nHLsuQjaCGkgnsRPYI=;
 b=CyPo+/PXqz1wOdEJAwerAilxzvZ9WXFA6UoNq66GVYFCayNKG7dk1njQvJ+biYaCKZ
 e9LbfymByrRhvXFOfc/MmvtfRudQENslt/40XTkiFrRgeV7j7NtyY7j+XArjWPb2Hibh
 zpyiPxoFymh0eSCRq34HPOchxUPRWu9gRzJTf2ZW5TCaTOxN2W1ugUcTZknGv4dgTmmQ
 iiIr+LhBxmZOyQHHuy1ZSi9KY8mB7+ACGA4vs8DE+tCUSE18g6gyy8OK3lJx43lBhwcq
 Thgp25ZoXVs3pGWVGvB+Ky0GxAqkeH1BhwXlG0U+dERbVNNW8iUoisTEmq2oW5RpbxXD
 w2ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5Sv4+uQD2+yzsu5UwcbzdVXudKm284+uTDFE4ve1XSbF12h/w/mkviV26bzih9UsPphbsblA6Jr8+aJQFA2p5s5cgtqANEQ==
X-Gm-Message-State: AOJu0Yyk5bmjRzo6U76ibaBHzeVAVhQMDSKQ3/H8D5lo4z+xO5ZPUtP3
 oPJsE+yBPi5o2aFx3ciT1Gn0tEX4t9wmPjT7EtE5cLqllKHwxfBBaO0m5KQrTQE=
X-Google-Smtp-Source: AGHT+IF6HjkrlqSHo64DtFhLJTntUH62um5JcgZo+OwpJ2VwhkjpajuSFS42u4KpKpNVrK8RVWnTGw==
X-Received: by 2002:a05:600c:6c59:b0:425:7c5f:1bac with SMTP id
 5b1f17b1804b1-426707e3295mr128373965e9.21.1721029468018; 
 Mon, 15 Jul 2024 00:44:28 -0700 (PDT)
Received: from [10.3.160.38]
 (laubervilliers-656-1-158-76.w82-127.abo.wanadoo.fr. [82.127.106.76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm75899585e9.3.2024.07.15.00.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:44:27 -0700 (PDT)
Message-ID: <c51e7954-cae8-4e7e-953e-66576768fb97@mind.be>
Date: Sun, 14 Jul 2024 22:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20240711192719.1161600-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20240711192719.1161600-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721029468; x=1721634268; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OsshIPzGMR/mSEariq99Qc8N+nHLsuQjaCGkgnsRPYI=;
 b=f54BsRfwmFswIzvNB0Tr/1nqwksLhfdt4UbqR9xHclXkxpcm8OrFod7kTmH356h3g8
 yaKfkt3Sh93CUmfIUOtPYjSAZyw401rktT10fGGk1mrS4V3zjLZIVJrfUATR1wtPUjNt
 jtGGpiRixeIe19+lZJYSbZ4mg3iHpPpkRqHHwMa/OgGwTJ0tW4fi7Zj2jbRpYTI4++58
 ccrSHHfZmVw3uzYtHzn/+Hvs+zUwg1Ng6xZQilS36vu3govON67/zDJb8rbZcKQRrb7K
 9TrRjzqWtQYD0G2JISSKQLhf2TrPrepwlYyC4mjhKwNYytffO58QpmhV7p2Hzyf9vrX3
 Z/CA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f54BsRfw
Subject: Re: [Buildroot] [PATCH] package/ncftp: use correct SPDX license code
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



On 11/07/2024 21:27, Thomas Petazzoni via buildroot wrote:
> According to https://spdx.org/licenses/, the correct license code for
> the "Clarified Artistic License" is ClArtistic.
> 
> The only other package in Buildroot containing code under this license
> is google-breakpad, and it is already using the ClArtistic SPDX code.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ncftp/ncftp.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
> index a3aa3fb194..57c3a5d08b 100644
> --- a/package/ncftp/ncftp.mk
> +++ b/package/ncftp/ncftp.mk
> @@ -8,7 +8,7 @@ NCFTP_VERSION = 3.2.7
>   NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.xz
>   NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
>   NCFTP_TARGET_BINS = ncftp
> -NCFTP_LICENSE = Clarified Artistic License
> +NCFTP_LICENSE = ClArtistic
>   NCFTP_LICENSE_FILES = doc/LICENSE.txt
>   
>   NCFTP_DEPENDENCIES = host-autoconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
