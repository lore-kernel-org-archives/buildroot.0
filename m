Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB330C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E39A60612;
	Sat, 23 Mar 2024 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKgOjC8UsZQN; Sat, 23 Mar 2024 20:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B381F6063C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B381F6063C;
	Sat, 23 Mar 2024 20:22:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E53531BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2D156063C
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lD0RG_Z4_5gS for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:22:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 691FE60612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 691FE60612
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 691FE60612
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:22:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4148581945fso1601315e9.2
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711225353; x=1711830153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H39+uXZD5mHDGKTMR/UgK0gK4jtQgNwiLDQflO+znLQ=;
 b=ZVbzMvMFFbv48vgbZ7+gg+Odf7aui2OhOU2OHDAGkRbVIONtoNop3uo9SW/ELt+dKZ
 65kOxj4+HMcEHAD9CvnwOcRhaj9Xy9TU2s7NzQtwYQ/+fH+cdfqCqp+Lvz9jpl/dKOkJ
 CdijZSaV4ufSVTRq+bBbLTX7Q5oi1lZ/+iuTVgpj/lW6/+m1vx/r4QkIua++7EE+UTAl
 4IutkyqKgg3nlGbWEEyvN8erNTBoMeuiEYaiy84em/bqJpxEMWd9yCKdURXBngoiz3PQ
 Y4mR5alEzZkUlW/yRZWf+X3/XbQm9n17+9L0ghybZXtdtYrqDsnM8Ls+tB3tEDHty3Mt
 1hXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxq7Qwds+giDTg+Ww0qziBrm44glOQm56C41x8y7/UvxehS/hSEIPa3A1XjSJw+kQxa2o++250VO9a4735c+V65zT32O/JEQ==
X-Gm-Message-State: AOJu0YwhsNqDb91U3ueiWvCJzfKE/d7G+OfVArvDvttWYlp5LrYALBmr
 TTrRvJEevvWkk9sjcPEXMSu2Y2qeBPfaVekRRx1uHaatbe99pxUiqF5eqA+7wOQ=
X-Google-Smtp-Source: AGHT+IEiUGa5bbswzms/3pO+cE2YTzJFpk6k+jwi/20ec3g0B9Qw/s8sENHYdlulCe0MKbkF/eRADQ==
X-Received: by 2002:a05:600c:154d:b0:414:842:a548 with SMTP id
 f13-20020a05600c154d00b004140842a548mr1994728wmg.13.1711225352445; 
 Sat, 23 Mar 2024 13:22:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b0041409db0349sm3342493wmb.48.2024.03.23.13.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Mar 2024 13:22:31 -0700 (PDT)
Message-ID: <8f04fa2e-4c65-4de6-8507-14dea3bb9649@mind.be>
Date: Sat, 23 Mar 2024 21:22:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20240323160120.1276293-1-fancp2007@gmail.com>
In-Reply-To: <20240323160120.1276293-1-fancp2007@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711225353; x=1711830153; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H39+uXZD5mHDGKTMR/UgK0gK4jtQgNwiLDQflO+znLQ=;
 b=anuB4ahrN7MOMg8uFHhs5V8htxPq5YVgiGSPttsPCH/TXrldTC2p7ak969KEg4MByp
 qau5VOtMoUVNNv28WQKd2bW1B5yCMQWoD2E8le/a9LnTM9qSDJlukgarGWEYaam4bVIL
 biM7it6Gm5TIM1dQg38Rj4TcC/tnUwta93IDEoa4vT8NUsGgAPKtYeMZ72auRg8yirYJ
 VFaxTlrxBsNThY4a8SPdCFUu+peerVtQy1j0k9Ztl8rXa+s07szEToedoP6JC5XUZZdq
 ge67O0HltAsb2W3lBjWjCrabqZivp4LL8iu3LNgTF6pMn4+CQNEvOxzMw6AoIGLtdlUc
 9i/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=anuB4ahr
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-generic: remove trailing
 slash in the package-specific PKGDIR variable
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Scott,

On 23/03/2024 17:01, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>   package/pkg-generic.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 577a148c1e..f9cb8722b8 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -489,7 +489,7 @@ PACKAGES_ALL += $(1)
>   $(2)_TYPE                       =  $(4)
>   $(2)_NAME			=  $(1)
>   $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
> -$(2)_PKGDIR			=  $(pkgdir)
> +$(2)_PKGDIR			=  $$(patsubst %/,%,$(pkgdir))

  Can you explain why you want to do this? Perhaps it makes the PKGDIR contents 
a little bit more "pure", but is that really so useful?

  Regards,
  Arnout

>   
>   # Keep the package version that may contain forward slashes in the _DL_VERSION
>   # variable, then replace all forward slashes ('/') by underscores ('_') to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
