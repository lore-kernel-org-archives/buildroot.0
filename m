Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A082C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377ED8179D;
	Tue,  2 Jul 2024 07:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etdcGrAhM0_D; Tue,  2 Jul 2024 07:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF40813F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DF40813F9;
	Tue,  2 Jul 2024 07:44:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11DE41BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97D91813F9
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DB_SjMYK4r6b for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:44:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59A698179D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59A698179D
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59A698179D
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:44:46 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7527afa23cso218168466b.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906284; x=1720511084;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sy5lZdK2A/2ezsOZt7RR4fUCRYbVquzRthiyzsPdi0k=;
 b=G48vUDsfyNtIu9Ij6XhDg0JPMIYaIR3cH4XEplcrr89fw2Zt9R/N/4uxmI/POMeN7v
 KDGGYnpRwSIaPL1Z/MImO2hf8ktKEMxK5a8rUqlCyA4gymWBdBTDJQEXs62suUp16ArF
 75JBRZrY2K5vYNnOEalLE/MgnaSaJ3CiFOWWZQJkfh93oE04h0HOxf4EDy/zUfQoyUVP
 70vWBG8ohIsTVBa9oIzDfQY+aZ96qMyIfI6IfzFRLozCAQRBRZyeyMHvxpUjvDKq4Z96
 4ls2c+ycDjdOsDUVj0PDNu7LG60bI7YmJCBRuXUkSm+WDdxz0Bm9NBp2C7gT2rFtkTW/
 UJLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuNYoJa6m10wmAkNP2n9WBslILgoFpfswdcBNxu7V79vVHSH3nJRYMJXafIc66yO1+JydRdgCEj/RPLW6fol/jri1f77X9Zw==
X-Gm-Message-State: AOJu0YyE0LJPUFEMCqK3ybn3hDs0xKUtD4hcCyVd92H6q2PZFgayt2py
 rmMJHdyCw28dy1WOMSb6rWDArxQYJZrvIKzYlVa6Q3WXBsdFSQMcfSf223YcnzY=
X-Google-Smtp-Source: AGHT+IGESYCJznEr72VrtKr5jmCXph5qQb1kiLAqy1U70QH8pfcKgBMXbh9CwNGJ5Rv4JV+g4+sjoQ==
X-Received: by 2002:a17:906:e0d9:b0:a72:b2a4:e207 with SMTP id
 a640c23a62f3a-a751449fc3bmr587044066b.45.1719906283233; 
 Tue, 02 Jul 2024 00:44:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf638f3sm396879666b.89.2024.07.02.00.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:44:42 -0700 (PDT)
Message-ID: <8184ca08-c17f-4b87-91bc-90e0bea05fbb@mind.be>
Date: Tue, 2 Jul 2024 09:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701190336.1761683-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701190336.1761683-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906284; x=1720511084; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sy5lZdK2A/2ezsOZt7RR4fUCRYbVquzRthiyzsPdi0k=;
 b=O994R/LyXJtxJBK2H87Z7viTiRNVXR7e4iuKj8hoFGqKtM7bChdC8owpX2gUeKyqLT
 8dReqqhjnAde/EEBnNoCglLN9eVWrgoFCZZnGpyBHh8lYTgO/Zn/pdIEM/UhWQKQnJWc
 Cx84Xprc8kAkNEA96glofhcH675yl6rvm9Rn4VtinH2NjU6D5wAWsQH3pIfkF8ZAHfMz
 YgaWBz2c5decvh65hG2MIjC6gl1EJCsQZPzZ5WkZW9kJR3R0kXt+CFT9Urkeqsc36alw
 buTTOiay8k6vaFf9HadCgSUYPAnncpAm4rpzyfOnQvPP+uM/2lcMj4rOjUTiQgXd+6LR
 5rMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O994R/Ly
Subject: Re: [Buildroot] [PATCH 1/1] package/python-multipart: bump to
 version 0.0.9
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



On 01/07/2024 21:03, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-multipart/python-multipart.hash | 4 ++--
>   package/python-multipart/python-multipart.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
> index 9b2b6d3d82..29f7f2bc88 100644
> --- a/package/python-multipart/python-multipart.hash
> +++ b/package/python-multipart/python-multipart.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/python-multipart/json
> -md5  a61a045b7f5e64d44dc53c73522ac4d2  python_multipart-0.0.6.tar.gz
> -sha256  e9925a80bb668529f1b67c7fdb0a5dacdd7cbfc6fb0bff3ea443fe22bdd62132  python_multipart-0.0.6.tar.gz
> +md5  0339000d92e78abbaac815954da6b826  python_multipart-0.0.9.tar.gz
> +sha256  03f54688c663f1b7977105f021043b0793151e4cb1c1a9d4a11fc13d622c4026  python_multipart-0.0.9.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
> diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
> index 7ffb05fa92..62ae37d749 100644
> --- a/package/python-multipart/python-multipart.mk
> +++ b/package/python-multipart/python-multipart.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_MULTIPART_VERSION = 0.0.6
> +PYTHON_MULTIPART_VERSION = 0.0.9
>   PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
> -PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/2d/23/abcfad10c3348cb6358400f8adbc21b523bbc6c954494fd0974428068672
> +PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/5c/0f/9c55ac6c84c0336e22a26fa84ca6c51d58d7ac3a2d78b0dfa8748826c883
>   PYTHON_MULTIPART_SETUP_TYPE = pep517
>   PYTHON_MULTIPART_LICENSE = Apache-2.0
>   PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
