Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C20ECD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14F9361090;
	Fri, 12 Jun 2026 11:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUE2Q6ix9G-j; Fri, 12 Jun 2026 11:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A849560D56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264232;
	bh=uwa+Zb0J0WGg0yDOo3SAyCGoHJbVKrY29eiVub2QjYY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J+qbFHfhBmMdLLGrMBVnF4Q6g6h1n8WJDwiATt9G3nsJh5G7BNbt1Tr2gOJ121hfy
	 wJAUOkFwmbie79npf9Q3Tv4kjjYax5ny7Cymd1urUGPL1tNLvDKHesry2DNTVJbEHM
	 9sDdGJ2VxXNljOekhHALfy1leH/DQx2ZS8ASb6tT+w+OL1g7qx6rOBI2DNzuj8P21y
	 erjVVvyDFJyRswzZ2phARGIC0yEH2xwnPbkoswZncF4a6MUkr+9/inkYpSNJ9lgg38
	 lXG1JyNty3tUwRm5jMJgoV8CNDHKWmyTsfOwfYZOnE6xUsCs3DzyQE4M9jDWWqqqd7
	 67nGp9YpGsN3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A849560D56;
	Fri, 12 Jun 2026 11:37:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D235212F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8FEF60F88
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emVWsndr6xI1 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 688DD61047
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 688DD61047
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 688DD61047
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-491b390f9e9so1926495e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264226; x=1781869026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l71XvU8NWoBRZo2VpqlTnu/nodRVHSklkG+qsgR1OeA=;
 b=mD52uX/Psaf2zhjSLqdUD3+yaGKLQZtcQjm+le//B6VdnmTcLOsHpBeoMOKH0RDLz4
 N0NsRO5bMbducidmUswO2OPuJ47hEIurCOY18UL2Z62ctB23q3pyuzrmXbvYoBNiF5hV
 gZJbaFoMuPrVYWOrlTRdBfldgkLhpuHVXMFhkZnEA3uZ9JB9fSu/iNnQoSagiObftqdB
 7tD9Ak+QCHxkSbydOweo6eL5MZLt3A0MIjxogqbxBtdZQfPQIWMk7HTPKXsf9tPGhEgG
 24P5o1WuLRVUvCgjJXEu9WoxZljKLsyBiusokEYiLYO2pUfDxLU0SkFJMiv+34+oLkYf
 OGAw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8oJHHTEIifB6Pk39ZelgYH8HFivsh/bcbwWtpwnIJD4TLV48fMcQIrxHBQwHaXD9N4OLQ9HzHvhyQ=@buildroot.org
X-Gm-Message-State: AOJu0Yzqndxhbhwl7PsnlaXPPNnl9PUJGD1yEUzc123BJ1Pv5NITqk+s
 +X44DcA0CVYY7GcxMoxsNcz4N5Nn/ps8WDUp2OjTD0KaT1Rc8fCtOdoAKhI7Fo5TBKo=
X-Gm-Gg: Acq92OH4L27g8W/oaXoBUIYfRwZc8woVQkbReh7CCVyfbNBrBgin+fcJcpbhZNEP/gh
 eAne2w77ONJPCdoB4E0iZe381ks1Azvt+heP1sA2BSOC550uQCExTeqq4gr1i8bo3633WWo27zy
 c4H56Pgcqo2aYSf2Nr0oKljZZTmynVkgUxfEVfCY4kdOgpB0ykz0vZCNKlB9zyLFXC4F3nbJzKM
 avoO4JLEUytH8kD78WWTPj4VQx+SFmlcnp8gkzlX64uzI0V6/1ys6dYlEF8OKaY928crYRGye7b
 o+H3axK6mSpA1asThkWUkWDYTEp37C8IpruANGmnp31abnUhZOmOlUNc8BJYu44GRvausVopkgB
 r7dKW/lYEZMhTPFMjKqiU1AaiHbQsNp/EP6woOnLbpHWvNqdcKP1celSzbRwY39Qqn+4twKwFnk
 RrDwj9XBdKD06zfp4=
X-Received: by 2002:a05:600c:4745:b0:490:ae52:499c with SMTP id
 5b1f17b1804b1-490ec4f80famr32822685e9.21.1781264226313; 
 Fri, 12 Jun 2026 04:37:06 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c7ea21sm147702925e9.1.2026.06.12.04.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:06 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:05 +0200
Message-ID: <20260612113705.251243-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602214908.1292981-1-bernd@kuhls.net>
References: <20260602214908.1292981-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264226; x=1781869026; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l71XvU8NWoBRZo2VpqlTnu/nodRVHSklkG+qsgR1OeA=;
 b=EOG/WZ5ERCO4OvigMVycxkCfgV3WP7p6za4W4Dye5GcM0UdrzR8HF9oaYX98oRKP0U
 EJeBlGKfHROdBrMGYFK6iOibpBxiAi0QwhJvEVAP5s3r0W9cW/tDFwEoJBOV9XGFG38N
 XkowIJByMxTZ1UCLFWkAIKam2TWHKtwL/x+ozUGaYJ0rZZiky2NwXC2y7b8Ro1LEVFPJ
 lVlDhCXIaE7HaHQUxDnNzUItj7t7wIccbUwWSodsy5U19GkCuX8hRm2hMqSKe7S2dCqb
 N+ycFAS+vprqvcFUWPcUr2IoWGOpHLXkaQMhFM0/LZX3b1pNpR6FzclO56yOd1X8oivv
 IANw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EOG/WZ5E
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: security bump version
 to 4.2.0
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
> https://www.privoxy.org/gitweb/?p=privoxy.git;a=blob;f=ChangeLog;h=d62aa6bf0b2cb26100e4ba8e528638259502711d;hb=0c5225b6844dd1a838b80d09d715a6c4ccbda2c6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/57576281f13331dfc2e60673a30098448d05e75d
> 
>  package/privoxy/privoxy.hash | 6 +++---
>  package/privoxy/privoxy.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
> index cfb6f5a5c8..2678a4ec25 100644
> --- a/package/privoxy/privoxy.hash
> +++ b/package/privoxy/privoxy.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceforge.net/projects/ijbswa/files/Sources/4.1.0%20%28stable%29/
> -sha1  6afc12dc38781a37670c7e4bb69700900123084f  privoxy-4.1.0-stable-src.tar.gz
> +# From https://sourceforge.net/projects/ijbswa/files/Sources/4.2.0%20%28stable%29/
> +sha1  deb927b172a3b473bcf246ea848ba6ed931274bf  privoxy-4.2.0-stable-src.tar.gz
>  # Locally computed
> -sha256  23e4686e5848c74cb680c09c2811f0357739ecfe641f9c4072ee42399092c97b  privoxy-4.1.0-stable-src.tar.gz
> +sha256  6f91267f81f626c416994db89ab62f4d09246eebf4754b81186e13a18ee9028f  privoxy-4.2.0-stable-src.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
> index bfd4996292..9bafc1385d 100644
> --- a/package/privoxy/privoxy.mk
> +++ b/package/privoxy/privoxy.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PRIVOXY_VERSION = 4.1.0
> +PRIVOXY_VERSION = 4.2.0
>  PRIVOXY_SITE = https://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
>  PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
>  # configure not shipped
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
