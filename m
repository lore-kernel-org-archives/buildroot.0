Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6188EC3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E8CC81E7D;
	Tue,  2 Jul 2024 07:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rp2vQ9R18mC3; Tue,  2 Jul 2024 07:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E2C81E81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E2C81E81;
	Tue,  2 Jul 2024 07:43:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87B4E1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73A1260670
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcXpSV4uc8-E for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F199608A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F199608A5
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F199608A5
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:43:21 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-79c06169e9cso270696885a.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906201; x=1720511001;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HyaEIGkEP6g93prYOec8cxcPGNJxu+uVWVvfBYppdKA=;
 b=c0D6tR35T2Jxji/E4nb0ku2OS9BRx9taAEZ6pCCZFlA9DNZPpkrWMxra1EZkbVvFTP
 HHgV7Zkh4FWrUrQtGDK8T5mdQe+rx+LqIPmWA3Yf3L4znkLmvYMRz3Wa33wyLrBiyxih
 i0Flcgl0qIModWVqJ9B4GK1D9/lVjzU56tA6/nDqEiXfH/kNg6NJGize6MpEdegBbE5z
 hjqHdfVCqxibrxgjQkDtn51nlzlk5OlinZO24hGd5ovh+z2zv+bLoYFTSelhN056h03K
 vZakLDiMA1W05kKbNvji9BNe9B19Nex6p22pR/wMWVMkMf0OvWJ8BgFlC97W+uTwSv3w
 lCZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdMcglcLkzp05iSwhPefewCkSqQR0Q4pTjZyV05uXgj0sJHf9ubaQTXc9R5dnjWYHJeU+v4xrPX7MtfO40gcB3Z+6JgZumjw==
X-Gm-Message-State: AOJu0YzMrKZmufUDnqrh9bHy887a6moyR8vXqfWGVzJuZabouSwF7bVJ
 Yyg3tvaNsTNjkyMIZ/As3yYexiVq1BxPE4lK8pEx7EvyZma43ngZXw9ten8Ory0=
X-Google-Smtp-Source: AGHT+IF4+kjcEteP49mHj+PEit04qUVFiWE3ANszICivAbbTsE4lwpKVZM0umAbK+78nK5XoiuwFdA==
X-Received: by 2002:a05:620a:4101:b0:79d:7416:da80 with SMTP id
 af79cd13be357-79d7ba770e8mr1091723385a.53.1719906200720; 
 Tue, 02 Jul 2024 00:43:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d692edd54sm429804485a.97.2024.07.02.00.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:43:20 -0700 (PDT)
Message-ID: <4f0adcbd-9e30-4e58-8fa1-3e1f4d6d7037@mind.be>
Date: Tue, 2 Jul 2024 09:43:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701184714.1751575-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701184714.1751575-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906201; x=1720511001; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HyaEIGkEP6g93prYOec8cxcPGNJxu+uVWVvfBYppdKA=;
 b=hX2DbwWfrglV0393eElUcjIpNgHz1TGjkUSN/ZB6gYzgWymOuqWViCwskOc33Ftfu5
 pS1IcyD3uBupM6CfgvjVUqaEle13q0QN5SDR+kx3/EqAwAzQyrUm0gcDlMvuAQ/vojTW
 2K7JshnscuYxLdtjyyFfFVqtCV1XST+q13HlSHwoou+17oD1B7ud9JX1oG92cgH92g71
 j1YZTdAMqM/fDaU/QkMgaXMOILTUxSwX8tmR1WV+KPINLO+VgvDCPS6Wp0mzkCKoeRC9
 XfdnktpwQQBu1Or7c/hkw44wgLnU+mczH9PHdzgHdB5JbcjABpZhrAXXEoZ3e6FaCyHD
 YIuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hX2DbwWf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-itsdangerous: bump to
 version 2.2.0
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



On 01/07/2024 20:47, James Hilliard wrote:
> License hash changed due to include format change:
> https://github.com/pallets/itsdangerous/commit/9a25d989cd65c4991c2c8ac46ef55e0e8dfe49ab
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-itsdangerous/python-itsdangerous.hash | 8 ++++----
>   package/python-itsdangerous/python-itsdangerous.mk   | 8 ++++----
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-itsdangerous/python-itsdangerous.hash b/package/python-itsdangerous/python-itsdangerous.hash
> index 071544e5bd..1cac9a5607 100644
> --- a/package/python-itsdangerous/python-itsdangerous.hash
> +++ b/package/python-itsdangerous/python-itsdangerous.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/itsdangerous/json
> -md5  c1bc730ddf53b8374eaa823f24eb6438  itsdangerous-2.1.2.tar.gz
> -sha256  5dbbc68b317e5e42f327f9021763545dc3fc3bfe22e6deb96aaf1fc38874156a  itsdangerous-2.1.2.tar.gz
> +md5  a901babde35694c3577f7655010cd380  itsdangerous-2.2.0.tar.gz
> +sha256  e0050c0b7da1eea53ffaf149c0cfbb5c6e2e2b69c4bef22c81fa6eb73e5f6173  itsdangerous-2.2.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256  63af09891b6be8ad1a4252ed43af0f4efba7fc948e228367bed7f3c5ae0b09d7  LICENSE.rst
> -sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
> +sha256  63af09891b6be8ad1a4252ed43af0f4efba7fc948e228367bed7f3c5ae0b09d7  LICENSE.txt
> +sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
> diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
> index d7a1344e0a..5fb2919c97 100644
> --- a/package/python-itsdangerous/python-itsdangerous.mk
> +++ b/package/python-itsdangerous/python-itsdangerous.mk
> @@ -4,11 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_ITSDANGEROUS_VERSION = 2.1.2
> +PYTHON_ITSDANGEROUS_VERSION = 2.2.0
>   PYTHON_ITSDANGEROUS_SOURCE = itsdangerous-$(PYTHON_ITSDANGEROUS_VERSION).tar.gz
> -PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/7f/a1/d3fb83e7a61fa0c0d3d08ad0a94ddbeff3731c05212617dff3a94e097f08
> -PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
> +PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/9c/cb/8ac0172223afbccb63986cc25049b154ecfb5e85932587206f42317be31d
> +PYTHON_ITSDANGEROUS_SETUP_TYPE = flit
>   PYTHON_ITSDANGEROUS_LICENSE = BSD-3-Clause
> -PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.rst docs/license.rst
> +PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.txt docs/license.rst
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
