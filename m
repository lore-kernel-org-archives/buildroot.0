Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164C9C54E67
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F176074E;
	Sat, 23 Mar 2024 20:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCcojJhSkElQ; Sat, 23 Mar 2024 20:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C754260777
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C754260777;
	Sat, 23 Mar 2024 20:35:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FEE11BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C6B582061
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_OcKL7u9l45 for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08AC482068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08AC482068
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08AC482068
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:35:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso1732696f8f.0
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711226129; x=1711830929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/R8cxirygiLmFzPNxuYfLYOfKzX2mgsmyeKK02uxujs=;
 b=E/8FJObHCBndJaGegjN6E4uUovZHjwu8nXQiwXFjuLdXmECvB+CDWeojypX2205ODN
 UgWxV4Op+AdVdcdDCv+tEZ0GDiW8dzFV2jsdOxmoE/M2fdtb6VePmHWHkk2VzNLX8RGO
 4LTyDRPdf3CsNj+hN3yzgGZ3SHYCiBDn1mCziAn2Zp73plxByD0R+WxZXCSz6ZNmcRmV
 zI6jE8cK8q7guCLdR+R++HNdvR6dVANMKHD0sZ1oMQ+x6z2esC9rBzkx67me2mcGX3V3
 VuqSuGfFy3Tn24Ue1vZ+Kl00QQqy8yOk0SdIKH34mn0GsXYZLJu/nvHExdc9tIri9Dyj
 a16A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB7O6Wdm5oLuNfgMnV3QqfUaX/mRvgLYAnVW5eQhxcZpXo4d6xNlGOm5RADNjGbjFsK4joXpd35bbUOnV3czJTtBL2++LkyQ==
X-Gm-Message-State: AOJu0YxrnF6IHcGmcxAA4p7OFuuk/gGU0UlqD8bT07eKXVtGTfn7ZpuF
 CN9tWTkQQznR+zHhpxliSHEreTEiUY6R1viARFdMQprv62KlI0CDyltwn9Oc5UU=
X-Google-Smtp-Source: AGHT+IFMglQyRhfYHOUpPddxZ2fLxb5hhNiByCqA8oZUe6Q9ynQq7FnLubtCo8bDsBLecFG+cQd0sw==
X-Received: by 2002:adf:e505:0:b0:33e:cbec:e98 with SMTP id
 j5-20020adfe505000000b0033ecbec0e98mr2232266wrm.13.1711226129059; 
 Sat, 23 Mar 2024 13:35:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 cr1-20020a05600004e100b0033b48190e5esm5164949wrb.67.2024.03.23.13.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Mar 2024 13:35:28 -0700 (PDT)
Message-ID: <330fa2f7-b405-4a47-ba8a-c3dd5ce45521@mind.be>
Date: Sat, 23 Mar 2024 21:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240321211612.511240-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240321211612.511240-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711226129; x=1711830929; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/R8cxirygiLmFzPNxuYfLYOfKzX2mgsmyeKK02uxujs=;
 b=Cvul6RwBLQLua8R25TflvAO4T3KLPW5qv2CxRsDUwm3ok4eqqE8Y57hoF9XHEv6Avr
 rGn6T3H51ckzMkEw8GwAuefJwbzqvr7fdMxTMmUbTjh6iQuDHhSmlHCbG+WU7Z04Yt63
 dOj0DkvksLULy1Y7ZuJl0rqm9rrYwCLstFoVn8CugNPPyPFPDYq09R46o3Z8f1pe5fjC
 zPF5TzaARdpHTBh2SFrm1Ek+jX4FY8Hq9cnoIckUWWbrIrrugXQ4u0fngQYgNbXbJGzw
 Xb07I56cPAFf2BIR9MFPXtjLWA+lrHdNOdyI7piUqigZUpVfVQJclrhfyLsdLGKTnOzT
 yMgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Cvul6RwB
Subject: Re: [Buildroot] [PATCH 1/1] package/cctz: bump to version 2.4
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/03/2024 22:16, Fabrice Fontaine wrote:
> https://github.com/google/cctz/releases/tag/v2.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cctz/cctz.hash | 2 +-
>   package/cctz/cctz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cctz/cctz.hash b/package/cctz/cctz.hash
> index b3a8320790..ac78cd611b 100644
> --- a/package/cctz/cctz.hash
> +++ b/package/cctz/cctz.hash
> @@ -1,3 +1,3 @@
>   # locally computed
> -sha256  8615b20d4e33e02a271c3b93a3b208e3d7d5d66880f5f6208b03426e448f32db  cctz-2.3.tar.gz
> +sha256  e1a00957d472044808a24a26f1ba020f36dc26949a69c214562d96b74093adb3  cctz-2.4.tar.gz
>   sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE.txt
> diff --git a/package/cctz/cctz.mk b/package/cctz/cctz.mk
> index bcc80bad47..7f5d960a42 100644
> --- a/package/cctz/cctz.mk
> +++ b/package/cctz/cctz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CCTZ_VERSION = 2.3
> +CCTZ_VERSION = 2.4
>   CCTZ_SITE = $(call github,google,cctz,v$(CCTZ_VERSION))
>   CCTZ_LICENSE = Apache-2.0
>   CCTZ_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
