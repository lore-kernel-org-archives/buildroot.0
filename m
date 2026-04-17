Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BD8F436BA
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B197A80B32;
	Fri, 17 Apr 2026 15:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxWl4Eg-qBEH; Fri, 17 Apr 2026 15:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5E680E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439491;
	bh=pordixncYC9DBR8p62srFeylE77rP0XyEuB+qzq46Ec=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W0LYCjTDqWG/M8RdHUo+9/FvD9F4ENfnsadwgmK0rWl1VCQvcB0ijZ2zQpbi2HGJc
	 qkZYjfNnRDBqwJuojZj7dQ8VDvABHCLS/AJWT3QwCLdHeVjFzYpgKSeuvsVITaFix3
	 G51iVR9eV8+acgQ0nUMvBEI+Qq5lB7hRVzQtA+oa4XHWDfLA8ZKeeGRDlEjZo9yiXr
	 5R+M3NlY0iH+vgh9BOMp+RLTYvQJ4LHLayIOGwXVmRsb12LaC3bJa6Ytp4QuGBuhli
	 cxKCtslf5dQbYPWMBoD1nyHXHDdj9wechxiqWBoxmq0AzcqjrKH1KSfvK+oTQe7sE9
	 3Fc//F8m9C4jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5E680E77;
	Fri, 17 Apr 2026 15:24:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C51F259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D21180E9D
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LwEnnwdUjj7 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C2E681518
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C2E681518
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C2E681518
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488b8efed61so8900985e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439484; x=1777044284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J9k/huRfEU2h32hR+SXGsgaNhh+0j4dJbKmD7IhQf0s=;
 b=AGt+QTMlslHcYA/L5B9pELB48Rd2Z3BxeOmHboYL36W/FvRlKeua6c7sjZDCnMlJd5
 PxoMHETLhzgqMvf/+60hhXH0RNB1XmGUjgNtXa3m05KGfkgUBVEsa2JpZ/37PDNzloXm
 ub2Vg89bwp8bKenFj1Ofm5kPU1//snYsCS02ow/gGHf8o+CsiXMkf+ercvv0S6gHEE82
 UrI9vDv8oQaXjRTW+mjXfmhmg6xhFJSgdwm+j6dr9Spo2InRoZgeJtCqsBvj+Vk112hc
 PpIYVdB1OkIgy8o+k+My3BzrKQpqNGsz+6v9bv2lv2vK3uHFJqsQkw5ZUFSKIqszXGgf
 m6/g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+2DDkI8xJnMY+0+J/0djDSBFJmZW9+Dk/DIZcUsjYOh8ttyGeT0xlo1Gfnhl3zo6+w4dbpOZZ4z1c=@buildroot.org
X-Gm-Message-State: AOJu0YwOvDsJuDX/TzV9BRkj7YVz72DO4YZyr0IKJk1RhJxgp++Gn2eY
 9WuaROr6+ZUK/XL+TH+6mwgE9aH/N845lIi5d0UjyYkCpaWX8T9oq6MFaPj/Jh2zvvnMOPdrzYc
 rczSC
X-Gm-Gg: AeBDievxa7mpn0ZNEa7WVyT0z2LDrZD1TeW332JNNsdYRUd7fXtaQ1PFcTZFgLd9EWC
 nXN29tu0dzIojaYMUtI9mD4yQWrW8c61jLZ3owR+BqlkBMxJQkUo51vN3hpx4VruwiMKeMVUxa1
 Wttg6kBqizYXlFzlG6ISSDkpq52YEzHdXBhZ1x+dSKZBb5QIwnzrsymIWjeTGxp3l+KLBZYH6gR
 IQKfUELgNczinLjeNVw+r6qyu3spanI6ESzgcd/MZp2StiEtpa8RzhUxkRNPlLCCZhvHRJbNgqF
 SqRk6yYQqv/cRY+NFJUQXOPDuYevldPsdVviUmrYHqhrptsRoZN3DOIjqCXUATs+0rlFjOx4QwE
 XIVe0EWvtVP1mw4FbtWcK38xD/RfAsW77fQN634q4MXD2fKLxNPY63PwX+HJkfYrL7SF/dL2JCN
 iSyz93AkST911lkGL2D2NXKoJ3wPU=
X-Received: by 2002:a05:600c:321a:b0:488:fbf6:ea59 with SMTP id
 5b1f17b1804b1-488fbf6ed4amr27468725e9.12.1776439484585; 
 Fri, 17 Apr 2026 08:24:44 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1249sm4643675f8f.5.2026.04.17.08.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:43 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:43 +0200
Message-ID: <20260417152443.313105-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410062405.1762326-1-titouan.christophe@mind.be>
References: <20260410062405.1762326-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439484; x=1777044284; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9k/huRfEU2h32hR+SXGsgaNhh+0j4dJbKmD7IhQf0s=;
 b=YK1Yb/geyRM3eY73H0x1cPXXJEvq+k7LZydVB3Gqq5/hNKg5PTu3rw5W3wOVprCwA9
 rso6afCzhER3u8tDwSHrjGoxXc0kUP1iBvaue4j/KFLGc12YFT+gV9NYGFYleD4Pd0g6
 vn488mf9bF7hw1zbIeJ4HOmTobFvFD/RcseUvkxGolh9DkQ3hyFYZwx9lAxQNzVzoZ8S
 Ik4zORXhTgK1B/vZrjdDF2sp36ePBdQ8PKiUNdejnq3e60o66j8EePwnA5zRMJ836RgB
 tXgxvOxUHdeqFz7eA1yJO4YETaLEmFH7JSCqo/0cvwDff2UU3Hg73jF/fy0a17sdpS0y
 tZMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YK1Yb/ge
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump
 to v7.2.13
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> From the release notes:
> https://github.com/redis/redis/blob/7.2.13/00-RELEASENOTES
> 
> ================================================================================
> Redis 7.2.13    Released Mon 23 Feb 2026 10:00:00 IST
> ================================================================================
> 
> SECURITY: There is a security fix in the release
> 
> * A user can manipulate data read by a connection by injecting \r\n sequences
>   into a Redis error reply
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index 7677642ed1..9e5be53969 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  97c60478a7c777ac914ca9d87a7e88ba265926456107e758c62d8f971d0196bc  redis-7.2.12.tar.gz
> +sha256  b3eeef15ea90a41c568f1f97a78d3370400baad55566869bbbf1af9f9106d85c  redis-7.2.13.tar.gz
>  
>  # Locally calculated
>  sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index e6175b69b5..ce39305176 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -REDIS_VERSION = 7.2.12
> +REDIS_VERSION = 7.2.13
>  REDIS_SITE = http://download.redis.io/releases
>  REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
>  REDIS_LICENSE_FILES = COPYING
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
