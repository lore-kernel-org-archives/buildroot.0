Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4677AD1BDF0
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0302F81011;
	Mon,  4 Nov 2024 20:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsXtYJ2rrTFl; Mon,  4 Nov 2024 20:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A4BC8101B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A4BC8101B;
	Mon,  4 Nov 2024 20:39:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BE063B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49E1E81011
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0isi9SYgsO1 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:39:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2385A8100C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2385A8100C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2385A8100C
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:39:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43169902057so36317985e9.0
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 12:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730752742; x=1731357542;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4VXivFlRpsFqUUTwcnBtEwQB5H3KGpenaNjbKr1QUHQ=;
 b=KzwDb9emDGlakvhwrk3CbtQ1XXi1IGo4A6Imf8Qv4O8HRwI5B6WMf+cW5Svzo4Ta8A
 1te32YYxiNuD77t/kQ7AkhQubejxuAEDxxB5wLm2sq+K+hsNwQ3+tad8TzP7kQ2CoP9d
 xB+OpKxMCYrpqW0LESxJYVhOhBYT/8P+0eOq+5RJ6Pxpcy4eVtO4hLT4f+Tb6y/shlW9
 4jc5JFkbbsSJ+kRrepfXXvwAuCuDnWlx3C3IIxf0VbtX9E+/zyr7TOvelHhDvjYrkuCl
 LUfRPcSdRUyS6pX2nw7EhtC+79WTeC86G+0MSsJTBTXj/qxuttn1429tQdf/5IhRQny+
 1+sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnxV0lCD39MqytURgiDKahenOrt3OwpF8qTNiQR48Dg09T2drAi9u6XxQUaT2hB4doe7Bl89LkOXY=@buildroot.org
X-Gm-Message-State: AOJu0Yz+sHCiWSgmxr8QqgLNmRgjJo30ROO7fE/JZBUjKK7e9AfSlE5Y
 HsDJrSW+6D+6ucyCqg7sHtdG3XQh15hikwiV1Z/bvP9jt2xLzoXLPg8dmojFw1c+Wq/8HObUZ2f
 f
X-Google-Smtp-Source: AGHT+IFBCyeiBzKsw5uI0VVOIl+I+pi5SdJ6RriCD6PbzM8064lrAHnrJx0fwtprncDZZskDA41ePw==
X-Received: by 2002:a05:600c:4215:b0:431:55af:a230 with SMTP id
 5b1f17b1804b1-431bb9e6031mr181855315e9.33.1730752742035; 
 Mon, 04 Nov 2024 12:39:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d6852c3sm163856815e9.38.2024.11.04.12.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 12:39:01 -0800 (PST)
Message-ID: <a85af86f-e7ba-4f56-b33d-df10e1781694@mind.be>
Date: Mon, 4 Nov 2024 21:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Asaf Kahlon <asafka7@gmail.com>
References: <20241101154326.366638-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241101154326.366638-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1730752742; x=1731357542; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4VXivFlRpsFqUUTwcnBtEwQB5H3KGpenaNjbKr1QUHQ=;
 b=UGalCqSk40CxmtfPpYQZXMEzwFYrM7eNvGHdyecaXMrnkTQt71oFpyVHN7SKlF6f0/
 vYgh3kaVCIM+KQ3vTMDXyRrhVnuVUssYf+B+awepxDbXfoj4HrO+ugAzLGXK2Gf3i6qh
 SsoARMm9nkUBfTAn50LmjKMLewfWkwk0EqQXHR5ij3CwnvyqxvGKfL1HAx5ebFbzz8lG
 EVHlyfJMqpP2W8IGnY4BuL6uwqaTAr0yC3FbUofrpmK+Mpgz4x+1vyoQJ5xOuzjPUNCm
 AoCBp8qbmZJAk2TdRaVOYz27ZLJPewAS8uJwtjxnRf7ETCkO3fjKEv1nB62vHdgWeSin
 EWGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UGalCqSk
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-settings: bump
 to version 2.6.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/11/2024 16:43, James Hilliard wrote:
> Migrate from pep517 to hatch setup type.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks. Same for the 20 other python package bumps 
(aioconsole to yarl).

  Regards,
  Arnout

> ---
>   .../python-pydantic-settings/python-pydantic-settings.hash | 4 ++--
>   .../python-pydantic-settings/python-pydantic-settings.mk   | 7 +++----
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
> index 1a45f34cea..c1acb00dc2 100644
> --- a/package/python-pydantic-settings/python-pydantic-settings.hash
> +++ b/package/python-pydantic-settings/python-pydantic-settings.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
> -md5  38eecfeda26d332803c540fd86105509  pydantic_settings-2.5.2.tar.gz
> -sha256  f90b139682bee4d2065273d5185d71d37ea46cfe57e1b5ae184fc6a0b2484ca0  pydantic_settings-2.5.2.tar.gz
> +md5  eb50e2f88dfb5229d7319be57dcc4ed0  pydantic_settings-2.6.1.tar.gz
> +sha256  e0f92546d8a9923cb8941689abf85d6601a8c19a23e97a34b2964a2e3f813ca0  pydantic_settings-2.6.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
> diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
> index 36add45527..90e982b3ff 100644
> --- a/package/python-pydantic-settings/python-pydantic-settings.mk
> +++ b/package/python-pydantic-settings/python-pydantic-settings.mk
> @@ -4,12 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDANTIC_SETTINGS_VERSION = 2.5.2
> +PYTHON_PYDANTIC_SETTINGS_VERSION = 2.6.1
>   PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
> -PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/68/27/0bed9dd26b93328b60a1402febc780e7be72b42847fa8b5c94b7d0aeb6d1
> -PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = pep517
> +PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/b5/d4/9dfbe238f45ad8b168f5c96ee49a3df0598ce18a0795a983b419949ce65b
> +PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
>   PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
>   PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
> -PYTHON_PYDANTIC_SETTINGS_DEPENDENCIES = host-python-hatchling
>   
>   $(eval $(python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
