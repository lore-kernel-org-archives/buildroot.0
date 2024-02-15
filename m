Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC901C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 07:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F26E41BB7;
	Thu, 15 Feb 2024 07:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXddqhL9_uQW; Thu, 15 Feb 2024 07:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AE5441BBA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE5441BBA;
	Thu, 15 Feb 2024 07:53:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 475061BF2A6
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 07:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F90541BBA
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 07:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m13i7nGkF45c for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 07:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5217641BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5217641BB7
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5217641BB7
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 07:53:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56399fb02b3so691285a12.1
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 23:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707983616; x=1708588416;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BBOISW3miOZm06sMCcq3FkR1E1h9hvH+vBIaHeALoF0=;
 b=HXA1WRE6H8CNMbKazysCbA2ra637LaliemGM0bOQ9EIiEg36ohWBkvxre7j5yJ8TI9
 fahJ4eFhW1pvxvcHkGS+DOSvNLSfOmo0I/pf4H+vHvOV0tnQGqN57H/cEZuo/RGgk0Hd
 8BQ8CBjavpDyLEoX5Me4gUpmypEPwTShZeAj9U5vpQODVesAOZFdYOC/7K+8UVCKq3jp
 v6I7NzdUtEbxwpXsteN0xTjqtNCQ9bT8hdMBKAPTcUkb6RvadfZHrqwvKwgObSlu0RgM
 MTlTZqlTkFyxm6k8fk88qd9BQ8C2xjLUm9YeyNrvzFe6k0SIKzjcP0yXGsAtw7VdT0iM
 /v8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXe7Gb7DFWLS0fb07EHpkDE691AqO6rdLE0Pt1kQnXdY4R2ISKd8MBUmqRX2HszTt6nZ4yl1Z9Ihb5gLrxtlZ8VDPqlTh5pw==
X-Gm-Message-State: AOJu0YyB5/ZEJS0CyEMXJbq/0PG0s/hD5fQuL1RoqHmO23Y+vdLL+rqv
 Ci365OTDy4MsGu6T5dbqplrLSmJsjBI/vKOY8F7nurAAMGV9Y21EV6LnGFmhDEU=
X-Google-Smtp-Source: AGHT+IFJ8RLgl9H5oMC56eaTY7wbkTW+OL76ALCmo/Y29X6P+04Obhvo9T9XvZSr5x2rpcmAOYoCKQ==
X-Received: by 2002:aa7:cf98:0:b0:561:eae8:8e51 with SMTP id
 z24-20020aa7cf98000000b00561eae88e51mr893730edx.12.1707983616027; 
 Wed, 14 Feb 2024 23:53:36 -0800 (PST)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 y2-20020a50eb02000000b00561a443a393sm298069edp.92.2024.02.14.23.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 23:53:35 -0800 (PST)
Message-ID: <2111ebed-d6b8-46d1-b109-9cd468be5ca0@mind.be>
Date: Thu, 15 Feb 2024 08:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Vineet Gupta <vineetg@rivosinc.com>, buildroot@buildroot.org
References: <20240214224355.551010-1-vineetg@rivosinc.com>
 <20240214230114.551779-1-vineetg@rivosinc.com>
In-Reply-To: <20240214230114.551779-1-vineetg@rivosinc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707983616; x=1708588416; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BBOISW3miOZm06sMCcq3FkR1E1h9hvH+vBIaHeALoF0=;
 b=QhHfxX7g6hHQYux6hZsyaUsJF472GnNQUfTftFdoQhdLhs1WmDfBR/HVSFeAiiMwHO
 xhHYmGlfSprueQTxOEJTrtZOpeSPfAkCWqPtSEYWlH13kgqswg4MqVakD9JKEDX7Lb1u
 WoVFoSaBgoz5JxpAD/pdUZpI13LCu2HByCxYUypcl0pnEk8AY3Et4hkDjXFngCWoN52/
 MPkqXQMDwEAfObi7Bx8fmcnV8Li/cyuL5wuNj/8Vd9DMPL22fi+rfNjyB07+zLsP6rs4
 OJYBO6E0CmKKDsJ9+gizCrOtfo8W8HLV6eZ0y0t3hjfQ8ny2DEl1C/Cm+wM5OGm36k7m
 TF+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QhHfxX7g
Subject: Re: [Buildroot] [PATCH v2] glibc: build: honor toplevel
 BR2_TARGET_OPTIMIZATION
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
Cc: Charlie Jenkins <charlie@rivosinc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/02/2024 00:01, Vineet Gupta wrote:
> glibc though part of toolchain is technically target binary and thus
> needs to be built with BR2_TARGET_OPTIMIZATION in case users want to
> force a certain build toogle from top level.

  BR2_TARGET_OPTIMIZATION is encoded in the toolchain wrapper, and as far as I 
can see glibc is built with the toolchain wrapper... I haven't (re)tested it, 
but it should be the case...

  BR2_TARGET_OPTIMIZATION was added to the wrapper in commit 
b95e436ee0c9e4638dc79766da0d17927c6641ce in 2011.

  The wrapper was added to host-gcc-initial (which is used in the glibc build) 
in commit 919c06c28295f19ca49459b98d8954148b381360 in 2015.

  Regards,
  Arnout

> 
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> ---
> Changes since v1:
>    - Add to exisiting GLIBC_EXTRA_CFLAGS if any
> ---
>   package/glibc/glibc.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index d198d6f04cb2..ebcd7b2bdb21 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -80,6 +80,9 @@ GLIBC_INSTALL_STAGING = YES
>   
>   GLIBC_INSTALL_STAGING_OPTS = install_root=$(STAGING_DIR) install
>   
> +# Seed with any special toggles user may have setup in config
> +GLIBC_EXTRA_CFLAGS += $(BR2_TARGET_OPTIMIZATION)
> +
>   # Thumb build is broken, build in ARM mode
>   ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>   GLIBC_EXTRA_CFLAGS += -marm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
