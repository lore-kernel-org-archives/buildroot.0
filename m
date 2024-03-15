Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B2DC54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 20:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5298960F03;
	Fri, 15 Mar 2024 20:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COoVxdE0BagM; Fri, 15 Mar 2024 20:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6506760F20
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6506760F20;
	Fri, 15 Mar 2024 20:31:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F7E11BF30A
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 20:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5942141939
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 20:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzAMY5GjnYxC for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 20:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 891CD40283
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 891CD40283
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 891CD40283
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 20:31:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33e672e10cfso1329805f8f.0
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 13:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710534673; x=1711139473;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CTKhCom78J94JX10cRxirXH/lEzseOyboQITXMGSLVU=;
 b=BTcAB7Lk+T6v3e+NazpmdLQa6hF8CmChiJPRHW8G+hdryEY3UAzfiayiGDsomrPGMw
 e+Z/RiMiZJA2Or8DxdYZCMOhJZEoGodCucD/Qx/hd7EFxvcNAlw9ojrhhn3s0DD4VjBQ
 HMLU/R/O62RjU3TmarJiGDRxIQ32yS6gZgKocO5AFsmyP44yjc1UtcUgE9cjWUrlV9GF
 6DogEhZYsQgr9q8ALl0YgqmKxCLJF+9Y4Oc/pK6WtTStz48dCE14WAzcgjODev71Y1RV
 +AiLpW0R+8MkggpyulVnOlhTzeQ+EWqYA6+zphGBfDyHwNQTbIcnXkAU1VxH1Scf9Fpi
 0P6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqnMdwWNDEEAbLXrbDeTbZXnjiBuzrEL/SPlTyzknw62PIY09m36DWsvOztk+Pj/4oubZq4Ae5rBlXUBZEG8fqusWYjTiYCA==
X-Gm-Message-State: AOJu0Ywk37fHpaFvjvChSkGxYvk4ThdQ32cnB1U6IHqKytyLHkO6YucP
 3zwsyDilZQjb38J5marfuxDWwhGHv9h2IpZSzS5FzBxDZeDhE7l81tJAyaqf3Sc=
X-Google-Smtp-Source: AGHT+IGP5e4XAPfMsFUEdHzWAJLrlm7hL4LuvZby0kDgRTxYTAZygPIurC1Wg3gU7+S7kfrFgKJPnQ==
X-Received: by 2002:adf:e3c3:0:b0:33d:c572:7641 with SMTP id
 k3-20020adfe3c3000000b0033dc5727641mr4615184wrm.14.1710534673238; 
 Fri, 15 Mar 2024 13:31:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a5d58d7000000b0033ec5ca5665sm3908777wrf.95.2024.03.15.13.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 13:31:12 -0700 (PDT)
Message-ID: <5f96ce54-27f0-4657-9e20-3dd6606d7fe2@mind.be>
Date: Fri, 15 Mar 2024 21:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Jeremy J. Peper" <jeremy@jeremypeper.com>, buildroot@buildroot.org
References: <20240312193528.664465-1-jeremy@jeremypeper.com>
In-Reply-To: <20240312193528.664465-1-jeremy@jeremypeper.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710534673; x=1711139473; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CTKhCom78J94JX10cRxirXH/lEzseOyboQITXMGSLVU=;
 b=ffCdFg3zkKs3NFHI+oa5+LQqcggJEEtFtzahbw70aDP119T0eYoPNRqh2wcaDrNvsr
 /lO2lj2lgm88W575axucZ49F3HJ9MCk4N3Q+c8SYtYNGUljmazWRP5tMK7kgWmHZcvCr
 wo4yDmsrP6ST9IXx9TFU/hzz7pflRokxBB8zy13Oat1XonFd9i3ykAMdLXlu/5YDbYIs
 KKGw5Pl24yrFigNvkhwc7MMR+YZTs4d1wNXmJMTGLBzI16UrsseAmzS9ZOgr5031dadP
 Jx5IwixQu7Y0KtK7Bs/7r9knZL21GCmDIwgrIHy6+1AeiV1tPISNDIgdXS6S1YnrW+o3
 0MwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ffCdFg3z
Subject: Re: [Buildroot] [PATCH v2 1/3] package/targetcli-fb: bump version
 to 2.1.58
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Jeremy,

On 12/03/2024 20:35, Jeremy J. Peper wrote:
> bump to latest version because previous version did not work with python 3.11
> corrected version mismatch with my first submission

  I unfortunately already pushed before I noticed: you shouldn't include 
"personal comments" or references to the patch history in the commit message 
itself - that belongs under the --- line. So it should have been:

package/targetcli-fb: bump version to 2.1.58

Bump to latest version because previous version did not work with python 3.11

Signed-off-by: ...
---
v2: correct version mismatch




  And another thing: we've had Python 3.11 for more than a year, so this has 
been broken for quite some time. To make sure we notice in the future, it would 
be good to have a runtime test that detects the situation.

  Regards,
  Arnout

> 
> Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
> ---
>   package/targetcli-fb/targetcli-fb.hash | 2 +-
>   package/targetcli-fb/targetcli-fb.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/targetcli-fb/targetcli-fb.hash b/package/targetcli-fb/targetcli-fb.hash
> index 64f68a66..1732fa99 100644
> --- a/package/targetcli-fb/targetcli-fb.hash
> +++ b/package/targetcli-fb/targetcli-fb.hash
> @@ -1,3 +1,3 @@
>   # locally computed
> -sha256  7ae4120a54f24b13263b4b85c43952a03546f8b9fc9bd15fe87678f68245a33f  targetcli-fb-2.1.54.tar.gz
> +sha256  605f4e4e4e7189d6a03f11a4f55e7ddb4671002d542c2f684f87dd68391dcdc2  targetcli-fb-2.1.58.tar.gz
>   sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
> diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
> index 2d375417..8cdcc6f6 100644
> --- a/package/targetcli-fb/targetcli-fb.mk
> +++ b/package/targetcli-fb/targetcli-fb.mk
> @@ -6,7 +6,7 @@
>   
>   # When upgrading the version, be sure to also upgrade python-rtslib-fb
>   # and python-configshell-fb at the same time.
> -TARGETCLI_FB_VERSION = 2.1.54
> +TARGETCLI_FB_VERSION = 2.1.58
>   TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
>   TARGETCLI_FB_LICENSE = Apache-2.0
>   TARGETCLI_FB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
