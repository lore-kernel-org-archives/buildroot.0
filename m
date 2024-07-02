Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228EAC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E413481F52;
	Tue,  2 Jul 2024 06:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_YGvogPwlko; Tue,  2 Jul 2024 06:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E839281F53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E839281F53;
	Tue,  2 Jul 2024 06:56:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 829221BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F74881F53
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJWlsKF_vy8g for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4FFDB81F52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FFDB81F52
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FFDB81F52
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:56:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-425809eef0eso13302215e9.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903361; x=1720508161;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bdSUh0UskoSoHk+cMJTlGK8B5s2aV/9Ty7lV3Rf3JPM=;
 b=XfyJChgVTuK56BCiYDrXvpFZsFxUBSWUcZ//aZCl4XuYTZjS70I9xA0PWz23L1vNOi
 dZrmPSvWP98UZywATyc+p4RV2JE9oapj0v3JkTOEeVj/RXx/c7OGqexKg+qBbVwpqO9C
 kIJbpwrlPrQHBwnV45kF/kmdNSZgRWYLmJWvb3Fr4U+s7EoBpaorpW9BYd9f2u+7zvVk
 okwMxb9eHoWlgMdTNEs9zwS6uZbpjR+ZNkgtiC8TU5957bngGz1N8zos7Ym9tioHvO5p
 zEf7XNJ7czsdLWBpZrMliH48bEmtL3JnL2I8pZEPuBV37qcTiWPnbLKoaPNuZsha//ks
 L7sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV00Vsnn+koeHDn6Knd0DTX9vqI28NruHai7jSTaJ/pdw+wTpDOnAL9Y1yHSDQlJd62Zoh2w8PSZefC0WTEx9mmrYy9Sm5ZjQ==
X-Gm-Message-State: AOJu0Yycbba7vlGLpau6AX/65vfAPwXAaivKB1vld/vIcfoRjMRqJQJ0
 1fP/GkW6VW09Zk86H2/OuXnQIfQlh4gQWrJJ8GtND+O8ZLIALDPtqdM+hO71oLM=
X-Google-Smtp-Source: AGHT+IHS+jjjq2shgl8PDDPprWA7omrRMInSBl+NTvOvGLEVucwdxvP/yxksiKGNAdyj0pRbeaGLfA==
X-Received: by 2002:a05:600c:181b:b0:421:7bed:5274 with SMTP id
 5b1f17b1804b1-4257a02f7f0mr55729065e9.10.1719903361366; 
 Mon, 01 Jul 2024 23:56:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b06377dsm185134635e9.28.2024.07.01.23.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:56:00 -0700 (PDT)
Message-ID: <db534df1-f40a-4a65-95dc-4220674b94fe@mind.be>
Date: Tue, 2 Jul 2024 08:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701170030.1634175-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701170030.1634175-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903361; x=1720508161; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bdSUh0UskoSoHk+cMJTlGK8B5s2aV/9Ty7lV3Rf3JPM=;
 b=btwquI3v1CGpylVnuISYBUgrmRlLR091fBgSSSQgvamTv92hv9hACCUeKGFRAT+63D
 SYT+0hQg/MpYgpRJqDWfGKJJLKFaY9jE9dYDUHR41sDjXp0x8lZgNKVx9ou85qLEA+r8
 xvJ3egzuueXgEGqjvvAdJL5ySUXekCmBM4MQuZiEpIH3qWS+obT4HSD1lSXTP4bspzZO
 behSnVVSXQl5riC+fJn4KgBrlCAEaziKEsR7quSTdD8MtomZYEXeGZuhIgW+HsBhrSdE
 858gklEdtamw4n6HUuFfx6OfRwlt0DBNiaNHy/dkyi4JvpZ8i4KXxw5JudEk/rD5PSlL
 W41Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=btwquI3v
Subject: Re: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2024.6.2
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



On 01/07/2024 19:00, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-certifi/python-certifi.hash | 4 ++--
>   package/python-certifi/python-certifi.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index 48e25119e5..0bb4a4fbc4 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  5a41f94d681748e76675f3cb4a7d517e  certifi-2023.11.17.tar.gz
> -sha256  9b469f3a900bf28dc19b8cfbf8019bf47f7fdd1a65a1d4ffb98fc14166beb4d1  certifi-2023.11.17.tar.gz
> +md5  d138c6217784e19cda28770b003ab23b  certifi-2024.6.2.tar.gz
> +sha256  3cd43f1c6fa7dedc5899d69d3ad0398fd018ad1a17fba83ddaf78aa46c747516  certifi-2024.6.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index 90aabaa1ac..1c5d4d262d 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_CERTIFI_VERSION = 2023.11.17
> +PYTHON_CERTIFI_VERSION = 2024.6.2
>   PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/d4/91/c89518dd4fe1f3a4e3f6ab7ff23cb00ef2e8c9adf99dacc618ad5e068e28
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/07/b3/e02f4f397c81077ffc52a538e0aec464016f1860c472ed33bd2a1d220cc5
>   PYTHON_CERTIFI_SETUP_TYPE = setuptools
>   PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>   PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
