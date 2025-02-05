Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A644CC02199
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 21:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70AA66060C;
	Wed,  5 Feb 2025 21:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFbuhbpKg9ij; Wed,  5 Feb 2025 21:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE0B60690
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FE0B60690;
	Wed,  5 Feb 2025 21:55:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75D9BE1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A18560690
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6zK9JSWu9m7 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 21:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9380F6060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9380F6060C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9380F6060C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:55:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so2291545e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 13:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738792540; x=1739397340;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8JsDyCbvyrDFcxA7IXBd9m2p2FY7FeFPYIgJvLCot0=;
 b=vsAhauXSBjgImJaCAoGucg1gRciFlWCj02Y5YcQkGKsUvewz6Wxh376anMF3EymqKc
 7QTsnkvXca7/HNcYjaZqHiu6kLPLodBgSfY9CY7Pvi7Rb/5iDz38UDrKKoxWn5NcY83l
 jg/aJwNki8pcMyuNg4g6ILwj2OiMJjnS8Mq9AUJQjXU14VJe9RP/EF0WBBqEkabTT8co
 VhHdNvaDSh0GfailuoeDNzGutvT9Wb8ymt2at2mTfQPpGoAWRb1rUCPohVo4T7BB6MMH
 lBvRmBklQrWAVSR5Zu5E/1Yk8VBNlcc7h9oB/E3CwaPrKAxuB5M3w4rTR0LFxWQBEvyd
 j+dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwzNGN62ifOIpTZGMCzk8SWgOV0XyvFsOjd7zAOCPLvwELBE8tWvIlcSYERGakjYL+CR9yx4+C8X8=@buildroot.org
X-Gm-Message-State: AOJu0YzGnLCYjYN4sJsISVDSYndtUqx2qSEdyvKuT8CM5AwPvQ9f70Qj
 0/DkcsG3TulGG3SgY5e8CbHYOaj5oX5tIGkCIfSDhl/41oRTdkEVPy8VgsBlips=
X-Gm-Gg: ASbGnctVoMAFBLDCQMKeMQXloG6t4Ld6TzMZxFQr+gF2p23xmFOj6HW56g3IgFlvBpB
 opnbvWsdMeZNYUf0SWmYAkxjifmM6FM6jK17ndjw9usQFJy7Yi2RKdOnjxKxzMZ1S8vkl5UWZk8
 PjMiVooepL3qvyG6EYWV34Cf7ZkStdjQ3LD/E51ZInkVR/52Q1qEbv5I64L6N2WNu9hpXgW8o3r
 9PjcpwlNfL31hCanK+OsxBdZmBhnX/uifrSbzrZK8Gl0X44EW58h56I06MaGiuMxoyHmsxLXKCM
 z3lbMqt5WkDNUfJQXbW2yTgabfcKLB+YdwFWrTHyUJDS22oDneTLbR0/fkstfzFgF7JeBu1O11w
 a1PyletufWCjRh7CHbTSl+nl3KmctsYTlV6F8VYNkwAtHsA==
X-Google-Smtp-Source: AGHT+IFCkoaU96m8u+Mp2lDW3diNReL2H9Uh9Ht+x0DOuANpp5NHNUj7eSEaTaRxXNP2tBuaAghbXA==
X-Received: by 2002:a05:600c:468b:b0:431:58cd:b259 with SMTP id
 5b1f17b1804b1-4390d575783mr38574055e9.31.1738792539969; 
 Wed, 05 Feb 2025 13:55:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390db11264sm33012815e9.35.2025.02.05.13.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 13:55:39 -0800 (PST)
Message-ID: <74da0c67-aee3-496b-89ba-4834b4fdc2aa@mind.be>
Date: Wed, 5 Feb 2025 22:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250205193711.3373936-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250205193711.3373936-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738792540; x=1739397340; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S8JsDyCbvyrDFcxA7IXBd9m2p2FY7FeFPYIgJvLCot0=;
 b=XTJ4vBSJJ/aVovrbTbDVNRKIHDXO9/5fOFIWm6B35OrPQBMHlyBpPP3mCXyTR22Xal
 hiLDmZMihXAllr6ijuTn1crlwK6HAYTWqD2TO9ZxpXdbaaRsYNqhqg7cetF2HoZqPGUa
 5PAq+lKeBhGAPQ4H69kKdYyCYMMGsoGc26LCGpDcDXmdkoNxdCb8K47D5Qg6u/v+AdVl
 n8fzYqDFKaVX7CAQYbuqhP3XQCK7dIprlJthft2g9SGF6E7vDsLvfy6kbCk8eJdmIZe1
 H3hNUe1XIpl/1ukubD623yrrzDqMOIa044nHbmGEjSMoDoUVNjJH4S2ogy5y7guFeB64
 a8sA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XTJ4vBSJ
Subject: Re: [Buildroot] [PATCH 1/1] package/libabseil-cpp: bump to version
 20250127.0
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



On 05/02/2025 20:37, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libabseil-cpp/libabseil-cpp.hash | 2 +-
>   package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
> index 76f1bd0f32..701801a7c4 100644
> --- a/package/libabseil-cpp/libabseil-cpp.hash
> +++ b/package/libabseil-cpp/libabseil-cpp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  f50e5ac311a81382da7fa75b97310e4b9006474f9560ac46f54a9967f07d4ae3  libabseil-cpp-20240722.0.tar.gz
> +sha256  16242f394245627e508ec6bb296b433c90f8d914f73b9c026fddb905e27276e8  libabseil-cpp-20250127.0.tar.gz
>   sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
> diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
> index a27d013476..34d62c4dd1 100644
> --- a/package/libabseil-cpp/libabseil-cpp.mk
> +++ b/package/libabseil-cpp/libabseil-cpp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBABSEIL_CPP_VERSION = 20240722.0
> +LIBABSEIL_CPP_VERSION = 20250127.0
>   LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
>   LIBABSEIL_CPP_LICENSE = Apache-2.0
>   LIBABSEIL_CPP_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
