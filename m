Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED0CEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DD40818BE;
	Fri, 13 Feb 2026 19:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDcRh3HJrVWG; Fri, 13 Feb 2026 19:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7186E81959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011579;
	bh=z38HjaSZ20ufsBBKSxjVQbyYzbCeuihR0Ltvcmspdws=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FAU38PUN7l6gMVyH1Yy76dmQWra117DmdDmSxkSwYp4kEOIuql/r43JcpQ9GKMoFh
	 UcEeWG+RUtL2yJyM91APY6z4rLd7L9F0vnVEeZpCy+4EInzN5KeYzHELtEB3F3fLGv
	 nHr6prm8FqSKJDLx7cGo0TI9dVjDefKM14O92LZXQ2rLf3URjDT2Az+hpaWdTnLACN
	 7HsFHaT4pyfsYUTh51DAApHWXrccawHFvcAEuWbZVnfpm0MM2YyiuS2u9GxFd8xhhy
	 kcwKmyDf5jt0HF0MGI3wimUD7vl7HF9L1w2IvCKIJPI/HoKwmlqZNKLYyYnCKxqa6U
	 25+lX4kOFEcmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7186E81959;
	Fri, 13 Feb 2026 19:39:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0755169
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 022FE6163C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2-56ZrVUgfO for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8127615C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8127615C6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8127615C6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43638a3330dso1064036f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011496; x=1771616296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mjf2vL6NSZEBxiM6gSIOP8Z0AgEDnutGouR1nStrgko=;
 b=LkTZzkJhelZ+u42bND4LU3In2UIxe3UaOtjFWTA1Ju8sONXqYi0emZF4STIL87L7te
 IJyImy6taAeBsM/B6pX70aMGZXiHC89T5Uu/iCAwyoKu5Ca8wRG+PNAqOh8sW4KukdHS
 IBnxhN4uZBzWF4oZfDQPl20yrQs9XexowmFIW1klYq4yLDZ5T7rMotlcKFQOifqrKQg1
 McEMiYdFjUhgjyacGnCBgxxVO08twdNwI2EV1K8HBkb0wdn/1iMMP4eExcqqHCUA5fhY
 +B5vR/hvgLNtzI/N8ZvuX/xWK8yLznil6usNh5WYBURREziuNMXxg90b4D6TOuJHBD2d
 8sHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOlUs/uNxsSaDIoKJVssFoE/q06lDTWsxxZULq3GtP+TwBwV/FsWuGU6WWt3UPcEGXicivKE0l8DU=@buildroot.org
X-Gm-Message-State: AOJu0YxZU0u8Ik3zjI4w6HFzedlVjtbW+GGSBgtkvILIGI7DY0faWKLz
 LOjXujUAJtwn8BiW4Ghvkwtc24Gk6FXzzn/UMpLi1C/hfOuwLLr+rvvOGe1zLEc6E8U=
X-Gm-Gg: AZuq6aIzUK936YwIiQ6WvSVruWMpDTxfiG0SCeEEjYV4ucilE7fPn+FWdINyJau4eyB
 Rd27bvNy2idP/+D+SpRawQp5dwPOqsu1FDhIMJKlKpFtXs47w5anThb3Syw7cmVzvX1wkA+DmCo
 jhZnpE+hXCmAB1qNTnmjPsTZcS6T+7xfZgz/KkEmnvAGhh2CEbBZFIh2icIOrxVJyK+tW2gTgd7
 j35PWl/2HASn5nIYG75hV2piPvjrK8Jk3NvAxIXqnMOYdKqEUsxyRwATxHke3d3S1CTXIThrYn/
 C1WvUkH2ogRJawRgEi9wlMYjttLDMq6gqGr0NkHqjJKTXXMOaKQOr3QNxVgE2O469NoowBe7srC
 0f6CwuUKCQnSicNpe63RkJdZZuQJqPraHUNSdTqW0ClPRfBXp3U7EZCa5GVgcEgwTMvzKBHTXgN
 mmkmdOZodNDqOzAA8=
X-Received: by 2002:a05:6000:2906:b0:435:9d3f:92eb with SMTP id
 ffacd0b85a97d-4379db31ac3mr1086755f8f.1.1771011495732; 
 Fri, 13 Feb 2026 11:38:15 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5ac92sm7802698f8f.1.2026.02.13.11.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:15 -0800 (PST)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:38:14 +0100
Message-ID: <20260213193814.41872-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202084741.1557662-1-buildroot@bubu1.eu>
References: <20260202084741.1557662-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011496; x=1771616296; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjf2vL6NSZEBxiM6gSIOP8Z0AgEDnutGouR1nStrgko=;
 b=e1BzSl3kXJ9r6m1gPMpE4cLXikp+bvag6YZRYjQ4DNofC7AjrTOCzZ3gNYc68y+WNI
 DaHR4LZIDi4tH6g3HC0ZTJWwoYvwxA+HpW8En/IWKq5vXWOUUH/uHh1sA3Gmtw7SYysU
 EmL8F1bIjqE3OFYf+Gtg2OCd9jFhIWMIL+Bx4FDYnaF9Eum4Za3BzIR+5aRa0sjzOzwF
 dLH33hYp0ZGsDL2tbAXa2rygB7zgIf43jNX4ura0tvUxrjr0GF5bxucEhzm5p6fyYVPy
 +nEQr6ZGdh5+I3HV6MF4N1B2tnmkaqCmvbjPeu3k0prNoMrKDyzlZbFzaZ3YpMJ6pe/O
 z+yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e1BzSl3k
Subject: Re: [Buildroot] [PATCH v2] package/libgpiod2: enable gpioset
 interactive when libedit is available
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
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> v1 -> v2: Remove explicit option and always enable when libedit is
>           selected.
> ---
>  package/libgpiod2/libgpiod2.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
> index c5b53f631b..ae3bcfa207 100644
> --- a/package/libgpiod2/libgpiod2.mk
> +++ b/package/libgpiod2/libgpiod2.mk
> @@ -24,6 +24,13 @@ else
>  LIBGPIOD2_CONF_OPTS += --disable-tools
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> +LIBGPIOD2_DEPENDENCIES += libedit
> +LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
> +else
> +LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
> +endif
> +
>  ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>  LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
>  else
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
