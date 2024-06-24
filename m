Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD618C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 19:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A8E36076C;
	Mon, 24 Jun 2024 19:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcOcnek_OXIw; Mon, 24 Jun 2024 19:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EEBE60A6D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EEBE60A6D;
	Mon, 24 Jun 2024 19:27:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BAD01BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 19:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 754A9408D5
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 19:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-zHS7bvGF-g for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 19:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C79F408A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C79F408A2
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C79F408A2
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 19:27:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42108856c33so33971895e9.1
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 12:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719257248; x=1719862048;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UtDyqUtaQBgHcVsI1yCM8wYOPXFfRQuoR3XvDcoDs48=;
 b=qBizOoCqoRXRFbBhmGCL1aCg9y5vAxzrCVmwnAPL6XBWeVqJjM1MU0mKoEYZ+3zvpW
 iOpmEy6J04Fze1eWHA0BPV24swakRZembBs8h6Ke8o0tyIRtPoIKCIu6JMtXA02tjxbs
 o0juv2vLvmrKLYG7hO10qUPkaP5+m0L7T/Q7We5d+N0/9r/C6i+phWAkig/JN85e0HIi
 yB8YS3Z0LQEoM9fEORp6f2gyoc+zqMLTWZgUWzrz/OAapu9lG/MF+OlMf2yN/i4cpWVA
 sXmXl7Kpq9hlIBFtQWGkCSHMxvQ2E2xsTnCiL86+hXj2VYpIYRMfG7TlQ0KPPSZm7dj8
 QNAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHOPQMIeh1dq4FVvXgMeplZLIH4Lq/zn6CAWsJxahqJ4VrFp/ZuVQ16j5VeaNsLSeVC+a0vLvW+yekC0kZRfA5ruHzKdlPXA==
X-Gm-Message-State: AOJu0YxN4pkEqepYaFx2SYOvkdBjAq/U7C8LutAOA16/SuYgZ4s6IWYd
 qdd8BxA6tmh9bVdSYUWcgCFVj7768G9FeZ7+NJCRuOxl/Zff/9Ttmt/5KYzPv79lEalMwMfOWRH
 s
X-Google-Smtp-Source: AGHT+IFBDd3O7uboYe5MhnNhw36aUKC+fwn4vMSUTyeJmQOj4KfF4WLEN0lJKMqyheWCVxlen+p40Q==
X-Received: by 2002:a05:600c:4746:b0:421:392b:7e13 with SMTP id
 5b1f17b1804b1-424893e036dmr60784745e9.4.1719257248228; 
 Mon, 24 Jun 2024 12:27:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248e63a897sm66783865e9.44.2024.06.24.12.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 12:27:27 -0700 (PDT)
Message-ID: <e903faf0-f289-476b-9ba2-3342cde9e9af@mind.be>
Date: Mon, 24 Jun 2024 21:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20240521143615.5157-1-thomas@devoogdt.com>
Content-Language: en-GB
In-Reply-To: <20240521143615.5157-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719257248; x=1719862048; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UtDyqUtaQBgHcVsI1yCM8wYOPXFfRQuoR3XvDcoDs48=;
 b=NHmaKZk3Z0wTdDjjqeRF016O+pu3yNrSlFU0ChuDbRy9AkK61ssYpu4c9NXyGsHzJd
 gRHHmAwKEp3O41SLCAaCiLOj04kvN7fKY/af8MhA4bPjW5nASbqySO3UnPO2bfMH4rXq
 JI6f8FhBkjbhFjWEwwzuDHyI8jV9iHvpXBq176D5aupIGDR9NrD9KsM/cqiyHXwGDbLI
 Qz7uRZviqCR8r/hrgZXlel9oD0ae5SaYY9lwSIc1E0h0Ap6C/rBetQ7LYMAG7e1pBtr4
 vfAfoeTO8sI3QTXKeN1eMGuHdWC8d4aYEgyTx3LnR1c/+F7zz6jinw1FdE32OY97pant
 a8Vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NHmaKZk3
Subject: Re: [Buildroot] [PATCH v1] package/fluent-bit: bump to v3.0.4
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



On 21/05/2024 16:36, Thomas Devoogdt wrote:
> Release Notes:
> - https://fluentbit.io/announcements/v3.0.4
> 
> Fixes:
> - CVE-2024-4323 (https://www.tenable.com/security/research/tra-2024-17)
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/fluent-bit/fluent-bit.hash | 2 +-
>   package/fluent-bit/fluent-bit.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
> index a53f6dba51..6fcf4fac3e 100644
> --- a/package/fluent-bit/fluent-bit.hash
> +++ b/package/fluent-bit/fluent-bit.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  2f3b82e8b7802fe92625009531592f12d500ff61a02ecf4cd27e0f138a6dc566  fluent-bit-3.0.3.tar.gz
> +sha256  b439f89e879e538849e9106fe450bcf58da5034dfc316af4d2a837423786ed11  fluent-bit-3.0.4.tar.gz
>   sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> index b235c3abf4..13bd4ddecb 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FLUENT_BIT_VERSION = 3.0.3
> +FLUENT_BIT_VERSION = 3.0.4
>   FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
>   FLUENT_BIT_LICENSE = Apache-2.0
>   FLUENT_BIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
