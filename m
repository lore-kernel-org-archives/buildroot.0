Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0599EF436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF2B060EA0;
	Fri, 17 Apr 2026 15:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4alxsU2ytZd; Fri, 17 Apr 2026 15:25:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E743160E63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439513;
	bh=RceCry5zn820MDoh/PAukedgZvcIKZoddmcGDkHSEM8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HzAZY0ItaAZx/oa74LpWN3Kb7whYsQXGb1rvtKk8tXUZShZm8talkyWHCB67gLXtX
	 JLoVIr2NcbF3QRrwq1EpiO08stWEoOKx6BipNZYeUzXzJwqrJ4Rr8cvEb+BKFEsGpT
	 YgdAl+NZp+mDBLnLidluKRR+IS7PSZSt375uuW/FrJTUw5/X+aanps6hazM4u2QyIB
	 QBkP11czIIuhbRRtuDgLGyXX7wxdVsPsOqat+ey9f6EefVnPjBLa1Zm3Q2uY3ORwxx
	 veX8nH51EjG6gd30QOKGQTLJHYSiA3kkFyE+YLuyHXfVzJp8oD4f7bOJwPe9N0IksG
	 OSc8pkk4rjapA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E743160E63;
	Fri, 17 Apr 2026 15:25:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71A3F259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57E8C40606
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWsfYVqnHx2x for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34A0D405DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34A0D405DC
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34A0D405DC
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so12406275e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439503; x=1777044303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GlLq9pl/tQHNCMrLquD3+GaT+7RdGEtwlK6Dc223Dbo=;
 b=Va+0PqE7dU9T3i/PLinGa8Wpfrje9N4RJ05cmYlrSkMJSvHQr0muBu9TM7DrRSM9er
 s0waG44CkczOpCLs/aLOsJirVemVYFQZjXoQr7JvuNTkm9527/8YV+iWtyLIjxS8FNbX
 rC7RZ7vBwHOp5X3ntfhkT/CF4zATXNLODTwLAfLbEu6/zxXm1cZc0A8lA9hvHHg/oApx
 L/LstdNHAW/qmJrETbEjonGfuLHXl344j0wHKnSdLaH25D+SgZPHDd0+2ptKBsxALJRX
 KAnlKJtNTMwWg94OzONNARy61fsb8nlefeCqtey0bK9nlMy1y0/PgfbfCg8EIPCY8EAs
 YJhg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9g2lYabA00/xu1Wf5s2o685l/Q0nx5jln2OJ2CeaNwG7RnJP7VdEDxEoBtPszPfvzFhmdsg+4t5JA=@buildroot.org
X-Gm-Message-State: AOJu0YwHPT3XgpEbdflnV7Pp9HQQHGwiqFbtKoTwRGDPeYz8Q/T7+7K7
 2qfJlt6xDDRNIUXc1naRIpbyH20Fuc3cwTzqttC01NqxfGZPRJ4N6Kr60gNpofeDJgU=
X-Gm-Gg: AeBDies46R6QoIYQ0Pj0ZDHjcNqI6lRUWdkXqmHEkRHAc8GYYZ79d3cnDuDW0cOYA/c
 AJ3offQhLCCWWI4LeYyaHhmryHISAl+PkugdKdJIx84Qk35hVuVAHXBNpykyi8PwhPhU0/JAUdY
 95ynQOQj4IjBb5M4MXE44CLOdBfqjJ/1AXYj49xTbJEQhOL3f6uWrl97YhJdVbzUfbUILn67nDu
 QAYxCDP8asmcu4Ps2NzJn6g+DxUDOThqx5XKDqCXpmQhVx0Bj7QZ3kCpGBoNW66fhDc1u5Hyu4L
 bzGhntnlJG1rbxgBKvPSQ1f6AaVEDQbOYzIFSY7RcB4xtRqvbYlLdpKJbGtnhNHQ9d+RugQuWLB
 3ODfNiYWvS+X5l2Z3wIMr59lVoYihBpx/5fhRjTAOaRSHeLCxYLLLlr8/ed3zno1DiCWXr/XTPp
 b8exEiwNLh9TL7tklPo7F0Zk7g+s4=
X-Received: by 2002:a05:600c:8183:b0:488:ab26:8fe0 with SMTP id
 5b1f17b1804b1-488fb765b1dmr43503125e9.15.1776439503074; 
 Fri, 17 Apr 2026 08:25:03 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4dc26a3sm5643061f8f.15.2026.04.17.08.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:02 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:25:02 +0200
Message-ID: <20260417152502.313804-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410061924.1759312-2-titouan.christophe@mind.be>
References: <20260410061924.1759312-2-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439503; x=1777044303; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GlLq9pl/tQHNCMrLquD3+GaT+7RdGEtwlK6Dc223Dbo=;
 b=ideqkRrtf1q65AkwyqOwU9lQocrxN9rpsl0rjTbMjCWyxdIxunCa0jvAoJjxsbaM4R
 17/Ct3gDLYbeew7Sy7x0V6jS1Cd5gYejTkoXJdRehiW/CVm+vrjvlsev58sJ3cMfOVOq
 HasZajeVv2Y4NIPBQJGR7lFWrGOlMha5F4nmpGJklr5aDPqjVyKHKeSqGu73Q2Ulv07E
 24TxswlK0vhycFeg+6RJtuGwZ6237LXyipZp5CT70ba64chp3cEfiba/ZBL7D8+egMsW
 p9OIVbGa62AdvgZOtcbC0zHKAu1axMpj0tR7A8NVtKdIQaZDdXqU/rwbyMXJq1kQuhPb
 itDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ideqkRrt
Subject: Re: [Buildroot] [PATCH 2/2] package/redis: bump to v8.6.2
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
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.02.x. Thanks

> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index e690dd1eaa..5e67e1a28c 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  0e7c150919e10c630d6e806fa7e65ce12aa90ddd0805e459b7da64ee65892805  redis-8.4.2.tar.gz
> +sha256  cea46526594fe05f05b9ff733179eb1263deccf4269059cf081fdef222634c88  redis-8.6.2.tar.gz
>  
>  # Locally calculated
>  sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index fb166b6f49..6ce9933029 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -REDIS_VERSION = 8.4.2
> +REDIS_VERSION = 8.6.2
>  REDIS_SITE = http://download.redis.io/releases
>  REDIS_LICENSE = \
>  	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
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
