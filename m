Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECC9C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B978060632;
	Fri, 15 Mar 2024 19:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCsT6e6C-bYe; Fri, 15 Mar 2024 19:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4B2F60F8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4B2F60F8F;
	Fri, 15 Mar 2024 19:22:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7691BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 345DB4192F
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U22yvZ9ADPdr for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0984340399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0984340399
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0984340399
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:22:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33ed7ba1a42so206917f8f.2
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710530552; x=1711135352;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E/X35k9DajAnR389tPk7owbraXIwNiKVZ2oIQpo0xB0=;
 b=n0euAs0RAtEaE3m8LQEHCJkLpT8jpYL0XukBuEZsO8OnZbbH8H7gU78Z6Y+ow3Rhj3
 OwN8GlNdN7khTipi2CQ6RPzmOZKi+7PRl9SA/OVHzQ6CY83Vxv5BaG4S3IqylpPsnpni
 NpCRZy3kBFYpzhCT6GjeOZTwMrE0hIZEQHeu6FTr5/ab4FllMQBygN5OefhbqaoixVg5
 C+WzEoDWLPqahOXbEFgHL6rtGx4UHZImVLP2uU5xoIDi0/v4McmsRRopBLw6ZayHnPsM
 lvRO9i/R8KO+I5pSL9Ec83dcaKpnxcpTq7eQrgMZhE/C7CgDGtImAvxH6aaq1+I0B805
 pGjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4IGkbTQpWpzMzIlFo7+PuO9KXL3yUujfr9WsJCc/qLr2feZd/Jl7nVuvv9D0PnC5t6zC8+IBW2kEAGSGwin/JexCVQBvQWA==
X-Gm-Message-State: AOJu0YwtiE7/FWqfkGg8WR+dEhfkGFBZpTj99KdwFzjL045euyJrYNWk
 NV31HqgwNlS1OPn+GRnj2hQ+h4na/WMgA1OUXND1QRwCFpDnqNRcXTR0V+2Vr94=
X-Google-Smtp-Source: AGHT+IG7thzsuZM5bNp7D9+TTdZiGBvczryteHncR723h1wyjAmz7OcRZqby9RNcTrZLs2vH6C5fyA==
X-Received: by 2002:a05:6000:110:b0:33d:82a1:626d with SMTP id
 o16-20020a056000011000b0033d82a1626dmr3743233wrx.38.1710530552337; 
 Fri, 15 Mar 2024 12:22:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bq22-20020a5d5a16000000b0033ebf702e17sm1863302wrb.21.2024.03.15.12.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:22:31 -0700 (PDT)
Message-ID: <64441d32-2de2-45f1-ab32-4050cb4255f0@mind.be>
Date: Fri, 15 Mar 2024 20:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240314214225.398600-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240314214225.398600-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710530552; x=1711135352; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E/X35k9DajAnR389tPk7owbraXIwNiKVZ2oIQpo0xB0=;
 b=hRT8ZHxwxN15PmqChOZz4xI8ehJpOHnSykipYO4wE38Jrto7j7Wb15XMzmBc25EMFN
 CADLaSG15t6A1TZ0bgXnSU+8FezrnutRruJXV/cWF8UQuZh1nUwUUgIVBM0NVzn9m8XC
 WoqMfvhJU/k1mU5hWz82kxCp+qLOZcEHWta+jj/xEv+QSKKLx9RxehUDn7cJZA6Mt9Sf
 SeFf9qUKI8V6EvXKnTeAlNuVdjTzDgf/79ZhQmNYr2oTeT8/5YNGI6qe5f1YRfQXtB6c
 5YNv6XtfRGofjac7VdPvD+ZFq/sD8/v7EVckrwXUl8JuS/dRp5xz9et8XTNSFcRBWEK5
 gWrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hRT8ZHxw
Subject: Re: [Buildroot] [PATCH 1/1] package/libnfs: bump to version 5.0.3
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



On 14/03/2024 22:42, Fabrice Fontaine wrote:
> https://github.com/sahlberg/libnfs/blob/libnfs-5.0.3/CHANGELOG
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnfs/libnfs.hash | 2 +-
>   package/libnfs/libnfs.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
> index b67a5d2eda..c5e5197c13 100644
> --- a/package/libnfs/libnfs.hash
> +++ b/package/libnfs/libnfs.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  637e56643b19da9fba98f06847788c4dad308b723156a64748041035dcdf9bd3  libnfs-5.0.2.tar.gz
> +sha256  d945cb4f4c8f82ee1f3640893a168810f794a28e1010bb007ec5add345e9df3e  libnfs-5.0.3.tar.gz
>   sha256  edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
>   sha256  d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
> diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
> index 19044527e0..e5e302a4f8 100644
> --- a/package/libnfs/libnfs.mk
> +++ b/package/libnfs/libnfs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNFS_VERSION = 5.0.2
> +LIBNFS_VERSION = 5.0.3
>   LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))
>   LIBNFS_INSTALL_STAGING = YES
>   LIBNFS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
