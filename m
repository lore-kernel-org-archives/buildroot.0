Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E0ECC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E26181706;
	Fri, 16 Oct 2026 15:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INqNzAvS3uhi; Fri, 16 Oct 2026 15:05:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F4D3816FF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163135;
	b=dMJjaBjjdddJAPum+SHdAFutccUilMIHsE0cBLl9tSlXgMCLG/dqZGjULBJquMYgIiM2
	 XNi4obExMUQEefs74D4NZI3LYXJPTiIX8gQK5nXhzO70y01Xww6kiFcVPsZwW0T2aOgWP
	 6pefcoJq+TIWbnNl6FueaEAHDYUog88CEwUrtWH20DoIFQjbAqi7wKoWeOyGSnbQJ6ow1
	 IURntUcvCJAXqthipfld2m/lKsPY7quGemo7SYpjuETMH8BT30T3P41a+thZSI9hBTbXG
	 osznJVD0NXniPqSGVMqOJj+0tJ3PDidnFH4uXV2gwN0sI6VIe1e/10fv6+CCF3Yuq8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eYjrLoBxx3XFJ+UWL6Xefc+3xqEtBKaFrnZX2tXnJqs=;
	b=GIDCvvXZ8EwwiOyYbb1Y/j9JhHiNI1+ugoTiV5Fi2rrIKEGRQb8kLaNo0yjpPNe5WtmD
	 q6tEoPHpziBze/Vj8upmBZ39MvkYcFIhy+F7kmRNjN0k2r6xgNz6vQGCOkMgBR2fujhTT
	 TP0Wfz8GC115OaKaPB/gQwL1dtIosSVHXC3R5l5eAUfj6QEql4Vt8q2L5RqaXS6LhXh0V
	 szDllhJeqEqWUFpFLO7oeueUobSLz8sxkklHp/MQWxgMIQpwkJmJ3wyTrH/7SkhNIEa9e
	 1JxT84/jJBbZOwE5gWG3ApP5hIturoMkcsaFVx8JlywCqXRFwPfuAWIFHLQiexI33UQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163135;
	bh=eYjrLoBxx3XFJ+UWL6Xefc+3xqEtBKaFrnZX2tXnJqs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JgbC6Gv5sHeLW1zrzD8fgRXaLHlwd5LIGvgReDO7wdV0WorgyjuxFc909EqrlV0Bz
	 6wJARcN71QilWjEaOLgDVFi04R020z0Oduj5AG3YRo8HBChPobVrk5Lz8neQDE/f85
	 LsI+ra5YFAChMrf/ogPxTR7WGoZjC/QuJ3Gcp6xUjwWNjZft3IDuoqzj1CqVGZcIZJ
	 eHINMZJCH7ZqHAXr8jaZZXBLX6SrOh7t75qvzhnDC/2d1i3MOQ/Tx8tO+bsEAfdNJ0
	 qI0Xp2jHUBdxYhIaBBPbm1YHWylVHluT6DF20Qiu5qLXmDoXTqPi134/POKYxZn+m8
	 xzcEJ/5ah1Leg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F4D3816FF;
	Fri, 16 Oct 2026 15:05:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1E507AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7FF5606CB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OsD5v4_KdnP for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8941660671
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163131;
 b=jBIjN7HBVNZQZFenmpj3hT782D+q1/8l0MgcRWfe+QjcXhCi4u/k8fV/etfzggPAfYGd
 4Glu9vRqYKXZ4QGjXavg8aj69Lgs8sEWI0k42MuhBY/G1sil7iZCymrcn9faHEZzoRb58
 WQnYovhwyG2Xk39L0zNYeiNBMHURv6BMsK6X6FS1aYgG+8YendMECoh5TG3KcoLRdPmGS
 CH+9mxNSYE4bwpp/zc307bR8aYANu1qX2tHyjdFWbXMtR4ZMDNkdX+ajz/duvAtEhb7NA
 PWfgMTroUruZ5vx5+lBnq955MGa7d1hCltPiC3jpGZBau+37wKz84bHBxK5xYvK5/wQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163131;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ikTUVqCwZlLXAleiTz3eJ7SXTqOz/C0iVUj+nWZf8qI=;
 b=AFrpC/bQBE1zjOafl+woB0XvFEtBuzGb9YJM9laVBm2LPg0rqjGEjUNjWq+bQiuHtz80
 zBBzZRNg5c7jLNUjitTtwZkfNzMKVOv+N6szV9VlTc5Qr6fZZm0dDFtzBnm03Nlre9Uom
 FYLn/EtIY9EV4/INA2LpiQVud1bXHq10IZYRegvyCw4z+tQFiyaPN2txB3thN+cI55qJX
 pPo5XNKce95ga5H6a65Uuo6fbsOXr/0CosA2v1P25KZMh9U5xaP3f9AQAVxCRlQbiWAeY
 20vWcUBwIR1AjOdovPjDhnNORVUmlnRDW9qaQg9/Et/bE/ZQ82SoIEPhqeDGafjgP3w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M1Jrrzl0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8941660671
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-486e8faff03so2876403f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163128; x=1792767928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ikTUVqCwZlLXAleiTz3eJ7SXTqOz/C0iVUj+nWZf8qI=;
 b=ii0b35uwaueGTIfsQydKnq5n0MdISMdLzj/vMdGPKC8LJHWrrjn6QP7qxMefUC8eOz
 EsLRlT412U3A7+WeEQDylfPx4hhKngwM2s4Oy+70Hdygxl9Kn3TD0eGjqMHtYicmq4ZW
 IHOqufyVfcatQvyL+gWdk4yu1fT4tjus78bn5SvifcwofCYW48QblZ3KtLoWzeIJCv4P
 P4hzyAu7tD04qx/PVBeKiZAKOLPADHDitHZ1NHm8nqM7OLbYsFnsmse2cMIGniaD8uWE
 H3AnptOIUjzW2irzlWGKt6zD5s3GkpE6RkCMmqEkPR6D1mXvtdUjcvqQTKxzwIWDIQik
 zTwg==
X-Gm-Message-State: AFq9FYKyNEFWxEDBlOGuRbpYZZ5QlNyn3VidTmLMD7S9/xoZ/m6J6Z5W
 if7Kba9zHiNDKEr5gj0bgejcHOUrosBKF2ygGskC4VryUkUZYsBcNoBtDNJgAznfL7iYoM+NLLn
 80c6WrL4=
X-Gm-Gg: AYBFou1RhQvy26BrcHOf9dM+4Rc4Uy0BU9apMVnbHjnq5pHuhvPIag5qke4w/feynl1
 XiJO+/oqZN1+bsigDhTWG5uvtj9wwWJxGdj3uq1GBtppQece/LGDhHuAceqCExebMwg8O+H8fJZ
 6vCHOtTnhBBM3NpldiuSg2eiyIsId52GYcrBlrBcLWBTnD4yo+lWWQjXtmgihPKQcS26ysz2TK3
 OaACKkVaXoHcX5rwVey2r7WOad3oBxtfVPp3vDlX423Zz0tX7pCB1vk8yiOX/eKdsZpv4Aq/3Et
 VlkLstwakU8nDh7B5NpT7Zb5LfLJODJcfdObmGZScPvwJkz1lzZTBxn9AAdz7TDwDoJ+pwx3Ol0
 edExbsxLt1EtnVlzxNbepYFAoWouiK2unWZ3ZMg18BbdagVWrSd+rjwZ3jP1Nyw4mS5HX567dRT
 1L5nonoclmVti02pdh77RunEMuMlWnl7eXMJd8lQ9OFV1qB4sbb8VchzT1reeShjuopqH8vmCDv
 X3tjV1mCl0mzHEVQCVC0Y8ciQ4xMX7yvwlovL1aIQ==
X-Received: by 2002:a05:600c:3b17:b0:49f:dd9f:6038 with SMTP id
 5b1f17b1804b1-4a1d7612c55mr1487355e9.25.1792163128555; 
 Fri, 16 Oct 2026 08:05:28 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8a81587sm127797675e9.1.2026.10.16.08.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:27 -0700 (PDT)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:25 +0200
Message-ID: <20261016150527.74124-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006185240.408314-1-titouan.christophe@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/redis: security bump to v8.10.2
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> See the release notes:
> https://github.com/redis/redis/blob/8.10.2/00-RELEASENOTES
> 
> No CVE number are mentioned in these notes, however it states:
> "Update urgency: `SECURITY`: There are security fixes in the release"
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.08.x. Thanks

> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index c3239337d6..e0dc5fc521 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  60166c95ab7aedaa9dfe516de685be0a4dd87be95ded59ba429df14c13f1b663  redis-8.10.1.tar.gz
> +sha256  b9ffee226b5eecdba98a679260dad764b2a4ebd90dce4ad5ac9e9f3eef9c02b3  redis-8.10.2.tar.gz
>  
>  # Locally calculated
>  sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 30142bc0e5..8b03f79cd9 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -REDIS_VERSION = 8.10.1
> +REDIS_VERSION = 8.10.2
>  REDIS_SITE = https://download.redis.io/releases
>  REDIS_LICENSE = \
>  	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
