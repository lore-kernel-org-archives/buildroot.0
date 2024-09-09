Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033D3ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 19:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B63B380F32;
	Mon,  9 Sep 2024 19:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUv1QKFBhGxs; Mon,  9 Sep 2024 19:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B159080F37
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B159080F37;
	Mon,  9 Sep 2024 19:10:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0A21BF313
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 19:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4958B4032E
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 19:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knB_VIoZwzNH for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 19:10:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAEE74038E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAEE74038E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAEE74038E
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 19:10:31 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42cba6cdf32so8141345e9.1
 for <buildroot@buildroot.org>; Mon, 09 Sep 2024 12:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725909030; x=1726513830;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4KFw5iWzLZ8Aoo+TLBx9T6sF4Ac3/IxPRUczHIW/Mg0=;
 b=bTOHChmL9B52ConOtSxEZ4lBhzmmSBDSmLKwfsavLNGdEyj5o+KfY51XNnWCAeEyDx
 Hro0xEx9h6ZtcO92ROCIMm2eCqMLwqrw7ynQIwxN9PV4EIigvjNOMilSvHmnEIr3CsIv
 ntwdZkSP97MngDzVry72A6hLkmozcFPGHaFx8J0cRKmiBK0RdthTON6jDPjgiUhE2a2T
 U8H8S5N8ivuNQlOHO24Ao0Bp9me68ddH9yntGjFdl3pVSxpChH+tjuSXvrUzZRNyU+S4
 3fWuQa6kCYbJFwmd25WyMX53NwB0lRFW2HIlzx4zULzpPaJPnjdRfZgt+2VQXJiDlk1/
 gE1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4/Z5SySbJmVpj91nOxdAQENuNOT/N8Xisnuyj/jTTQaYrU2/6iPud0yKAuyOtcMnlUzFFVJgA8cA=@buildroot.org
X-Gm-Message-State: AOJu0YyeczGwtJDneuP1Nf4Qt6QwKHYixv2mo9RyUCmDrWhrKJ3JpaS9
 CqYgGche+qLKySgYbQ0JXW+h96QlTq0/yFxIaHRxwwpRZrchQ5uDmE3kxkLmvbY=
X-Google-Smtp-Source: AGHT+IF2xmOvoPT3nrn+TLvdeMHIGTmHh09WozIlKV3iT0wbTzBLtqmDLPgIGqglA5cE3/lS0w1aPg==
X-Received: by 2002:a05:600c:34ce:b0:42c:aeaa:6aff with SMTP id
 5b1f17b1804b1-42caeaa6c74mr68668165e9.10.1725909029490; 
 Mon, 09 Sep 2024 12:10:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca05cc3dbsm116099125e9.20.2024.09.09.12.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 12:10:29 -0700 (PDT)
Message-ID: <d5f43a0c-9f29-4777-88f2-30bacbd49fd3@mind.be>
Date: Mon, 9 Sep 2024 21:10:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240907210540.486702-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240907210540.486702-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1725909030; x=1726513830; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4KFw5iWzLZ8Aoo+TLBx9T6sF4Ac3/IxPRUczHIW/Mg0=;
 b=S1LlfWf53OphekRdF+KZuNE0isVXaoe6VLPYYi7Z+QgAoUH2fUopJdPtOUnTL8Vgx1
 NZlTTOLf2KJEdUflYjvMFua47EeFUfAD1kTRu1PdILRL/QXmXhPRuLRWgW4eIMpbXEVI
 4AZqmkZ/9lZZ+1YWrWNtWPlGz5j9eQAnF0Hm/PiZR5b23AUoeFYAAZJ5RCzTkNj1y7cR
 FJgUzgt02VUv+YMdoWI8XSngGIQM+F5lbj4rfqAJMJgLkIm0p+IsL1bVJy2P639K3U0z
 05fbMsmNK+iQ64yOZaNYQBdzYKZTQkst5xr0lQOwT9r/Jua5qdGh1Kg7ZGuhyl8fn3mp
 R8bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S1LlfWf5
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-pydantic-core: bump
 to version 2.23.2
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



On 07/09/2024 23:05, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  I added an explanation to the commit message why the _SOURCE workaround is needed.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - restore cargo2 archive suffix format
> ---
>   package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>   package/python-pydantic-core/python-pydantic-core.mk   | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
> index 3554d0c0f6..39f64e760f 100644
> --- a/package/python-pydantic-core/python-pydantic-core.hash
> +++ b/package/python-pydantic-core/python-pydantic-core.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  87cee9e796c31e3470dd13675286f13d58084e4362dae9288a9fa45b1264c084  pydantic_core-2.20.1.tar.gz
> +sha256  4d2ad4888a80e06641bfe6a950fa2390ac59a6b0cf0f4e03574122b4b5bcc6a4  python-pydantic-core-2.23.2-cargo2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
> diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
> index 4332c4f6a6..aad7988fff 100644
> --- a/package/python-pydantic-core/python-pydantic-core.mk
> +++ b/package/python-pydantic-core/python-pydantic-core.mk
> @@ -4,9 +4,10 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDANTIC_CORE_VERSION = 2.20.1
> -PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
> -PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/12/e3/0d5ad91211dba310f7ded335f4dad871172b9cc9ce204f5a56d76ccd6247
> +PYTHON_PYDANTIC_CORE_VERSION = 2.23.2
> +PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
> +PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/5f/03/54e4961dfaed4804fea0ad73e94d337f4ef88a635e73990d6e150b469594
> +PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
>   PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
>   PYTHON_PYDANTIC_CORE_LICENSE = MIT
>   PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
