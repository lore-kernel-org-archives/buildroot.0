Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5908C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8776981EF9;
	Tue,  2 Jul 2024 06:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQ5VgVhoEU2o; Tue,  2 Jul 2024 06:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83CE181EFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83CE181EFC;
	Tue,  2 Jul 2024 06:55:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCA921BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6C0040743
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QJDQwQjiM0S for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69E124061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69E124061E
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69E124061E
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:55:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42563a9fa58so27045375e9.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903334; x=1720508134;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=45jOuJyeTakPQOZLh325dhh0eatbdUlkKFU5fvjmcoA=;
 b=Lx4umxt7v++j+Jw7/cG8V0PWjThuNl3p2Cy/xiQISNjrH7WNHt7AOgMJDWwwQxQoli
 0h45HrwRQ00Eb4vipG7kfBen+A3UgeVwQ3+bccCNCqC8RGJy748BZdiKCwLpL/2yHrI5
 AvTmP4Vqkk3j3teAlk+yxLQ2tQBbueH04UY6xpKfSafGoYEh1WcQkJ7UL0rTi5p2AfUt
 yrB7CDd3P60HUOBpR6C0fDoaNge5KxGDGDX3uvQYG36qz5B2KcfqwfZ0889kU8I/zO+r
 VSWcwTIxeSg6kdhhID3U9MJd9h+ryqMDRQoZ1G/xuWBLj74bQ+QBCT+zLueArai9luPk
 y9/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvWccXGMvoHaF589e3LDk7IAryMZZCfVhnFF0skPKl+XLKRcemLrrvRFVKNRbCfmb6PEiOoH3z+wdJyGF0l5b4D4bod3sCtA==
X-Gm-Message-State: AOJu0YzA0apsPbBMMwS9K+WFPBjh0VwAUfy/jbeEzC6rDxhUkmJaJBMD
 YfUZF4eHMWK418sUJ3uda/ufawpXTSYJ5g0GVwFuCP8u+FIITI9lrBqYElUV7fA=
X-Google-Smtp-Source: AGHT+IFP7yEMmpAXmeAqRCVHpJxKhKEvGhvmuC/ABWK7UeCRF+50l/yUYs+KV8MKKseMuwUy2eZfAw==
X-Received: by 2002:a05:600c:5251:b0:424:a3d7:2a7b with SMTP id
 5b1f17b1804b1-4257a00ac8dmr47232675e9.5.1719903333897; 
 Mon, 01 Jul 2024 23:55:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b063569sm185792805e9.21.2024.07.01.23.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:55:33 -0700 (PDT)
Message-ID: <99187f86-72ad-4184-b9ba-035c84b1d761@mind.be>
Date: Tue, 2 Jul 2024 08:55:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701200705.1801155-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701200705.1801155-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903334; x=1720508134; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=45jOuJyeTakPQOZLh325dhh0eatbdUlkKFU5fvjmcoA=;
 b=cZrZRz6VrdtSWD4qDoTwbU814i+ZR+mariptE5EjzZZkb1wINUQ4XxbDZOFSKquNnU
 pEryyp6egeqyoQEkDD6D3hQg4iOvTkEHnNrQqj5Jln7EC5Md3HSJ4Kh5KTjVWKKWlJCV
 hBUoi2csGcvDHQzScb05seE5KFggTpI130Vp8gJTjlHKXdg3xkNYdiofm6CkmqWMru4U
 5/4TolZMuo/SvN/Ungv1JJ5rP6k71KpMfOStS3R7hLROtot8Z0g1yladZwIDaGjsx6i1
 NHHP7G7gGwAm3vIEdIuNVkY+3H5m1+XvjReSC8ZP//HaV6aOshpaYhp5lyg6xQNPV60g
 ppNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cZrZRz6V
Subject: Re: [Buildroot] [PATCH 1/1] package/python-websockets: bump to
 version 12.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 22:07, James Hilliard wrote:
> License hash changed due to formatting changes:
> https://github.com/python-websockets/websockets/commit/9c1430379bcb42120e45ee0e9f9dca142b1d7560
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-websockets/python-websockets.hash | 6 +++---
>   package/python-websockets/python-websockets.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
> index 62c7cb8467..8d0bda501c 100644
> --- a/package/python-websockets/python-websockets.hash
> +++ b/package/python-websockets/python-websockets.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/websockets/json
> -md5  d6b1a2cb5e194ae43f849c125b71c8db  websockets-10.4.tar.gz
> -sha256  eef610b23933c54d5d921c92578ae5f89813438fded840c2e9809d378dc765d3  websockets-10.4.tar.gz
> +md5  49d033c8236aa56ba2524f65570a27c5  websockets-12.0.tar.gz
> +sha256  81df9cbcbb6c260de1e007e58c011bfebe2dafc8435107b0537f393dd38c8b1b  websockets-12.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256  daeca11bf3608da35e546ea0c32be18958a8be1441fa3de9cbd20e4c8bc718e6  LICENSE
> +sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
> diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
> index 7f721220a5..2b8761c029 100644
> --- a/package/python-websockets/python-websockets.mk
> +++ b/package/python-websockets/python-websockets.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_WEBSOCKETS_VERSION = 10.4
> +PYTHON_WEBSOCKETS_VERSION = 12.0
>   PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
> -PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/85/dc/549a807a53c13fd4a8dac286f117a7a71260defea9ec0c05d6027f2ae273
> +PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/2e/62/7a7874b7285413c954a4cca3c11fd851f11b2fe5b4ae2d9bee4f6d9bdb10
>   PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
>   PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
>   PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
