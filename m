Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406B9C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEBED812A0;
	Tue,  2 Jul 2024 07:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLPN7fK2mUtB; Tue,  2 Jul 2024 07:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDF5181E7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDF5181E7B;
	Tue,  2 Jul 2024 07:43:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FD7D1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3912E404D7
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqn0OZfWbRFJ for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA6E840460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA6E840460
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA6E840460
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:43:10 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-425809eef0eso13574855e9.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906189; x=1720510989;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hfFJdsWljw07mPJaxtgMIGbjVsYSfQJbcbbgOUZq+14=;
 b=veVPZlLmRkFA/mwykVhqi59prWlc4PPTQuAHyUKtVbtButosTy8kd3WbxrBKS2H1S6
 BvJD3C6Cczogme80bG+hKg2E1IBzJtjsVy6b+NyVhfaEPeekl7jXPorXwKqUYelQNpcP
 0rcFf7tnujp6XJUn0TnRdnt2o22IxuwrF9PUgm7yQEVOYidyJHEM9KMCyqH3K+jYjp0w
 PIjsudDGwi6hbkoPviXJwMxtG3K2ezi5uruvhVMAV8CLkYvDFwasAqqpu6HPwRjNpBu3
 nI27JVjn9245898ABrJcD6mN6Hb6t5diBjtbUfYtjCuMKF0s1u0VrLJe6OKj5mA1fTQP
 MTBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4CdgKyUgP6Mt6jnK5YHBgkn/vRQ4lSDQPUSQadIE9QfDCKN1iyDtKgJeZpIMey1cCluWjUKvMw8rqTmzSweUs9YK1LaTMUw==
X-Gm-Message-State: AOJu0YxiVlURQZ0FSzt5QzwVTlY782Sez9umvCXsMLlakxnIe3LLZCw5
 Fk3/h71xYwnmomFxcK6l1s0d4y2EnqxOFHFY9oee42h7P/KGtjG31x/+XRpS9BM=
X-Google-Smtp-Source: AGHT+IGt+0EddAtsHshavsD8r+MiuvB4G4uYd2s5tcbWt4y00CPhu+hnopkOdPV0CoxlmsBME8Mf7w==
X-Received: by 2002:a5d:540f:0:b0:362:5a6e:2649 with SMTP id
 ffacd0b85a97d-3677571b850mr4470102f8f.56.1719906188706; 
 Tue, 02 Jul 2024 00:43:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb92fsm12480064f8f.88.2024.07.02.00.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:43:08 -0700 (PDT)
Message-ID: <3dfc0145-9a70-43ce-aeda-358faaf88a13@mind.be>
Date: Tue, 2 Jul 2024 09:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701183958.1748687-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701183958.1748687-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906189; x=1720510989; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hfFJdsWljw07mPJaxtgMIGbjVsYSfQJbcbbgOUZq+14=;
 b=T9S4LKGQZic/XVlVlu5Vsnuy8yRU919WQalHKzgvkduNhYgjuVYZtdyNIfFeJv0Wct
 ButUmAhEMmq3R3kNCOTILKww4/1wtSSusb/0+jWKFvo3pDjHgk/NjF/AMHfUu1JyEXF7
 8ikWOeK7KQYri1D4f0wvw2l4hJKL7fTG2inSYUPp6Gg1mNnNgGK3YvPuTkRbSghWo79G
 qNB9meBqd0QXwy5yoj/5BpBMLRJXFLBR7/nHaTC8KNx6loT+X7cUtX+V5IqB+jHrNzX1
 NegbPyV30ybGNNUup9TMQVRejVqZp1vm3wVhVA5vPRHSEr3CTNXDHHNJLtG43S57HJow
 +dbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T9S4LKGQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-idna: bump to version 3.7
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 20:39, James Hilliard wrote:
> License hash changed due to date update:
> https://github.com/kjd/idna/commit/1d365e17e10d72d0b7876316fc7b9ca0eebdd38d
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-idna/python-idna.hash | 6 +++---
>   package/python-idna/python-idna.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
> index 5e6ac716a2..7b22841d88 100644
> --- a/package/python-idna/python-idna.hash
> +++ b/package/python-idna/python-idna.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/idna/json
> -md5  70f4beef4feb196ac64b75a93271f53c  idna-3.6.tar.gz
> -sha256  9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca  idna-3.6.tar.gz
> +md5  31cc572cb7a6519159c927c998c64c79  idna-3.7.tar.gz
> +sha256  028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc  idna-3.7.tar.gz
>   # Locally computed sha256 checksums
> -sha256  cb2faf0ca18c6d387ec7cb66f321939fba6e67e9dac09d31477cb9d8d3fe6899  LICENSE.md
> +sha256  a59f0b0ef3635874109a4461ca44ff7a70d50696e814767bfaf721d4c9b0db0f  LICENSE.md
> diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
> index eb92432bd3..b3c012ed0d 100644
> --- a/package/python-idna/python-idna.mk
> +++ b/package/python-idna/python-idna.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_IDNA_VERSION = 3.6
> +PYTHON_IDNA_VERSION = 3.7
>   PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
> -PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/bf/3f/ea4b9117521a1e9c50344b909be7886dd00a519552724809bb1f486986c2
> +PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/21/ed/f86a79a07470cb07819390452f178b3bef1d375f2ec021ecfc709fc7cf07
>   PYTHON_IDNA_LICENSE = BSD-3-Clause
>   PYTHON_IDNA_LICENSE_FILES = LICENSE.md
>   PYTHON_IDNA_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
