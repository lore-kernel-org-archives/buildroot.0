Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB5DCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7602960BE6;
	Fri,  5 Jun 2026 12:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSNIKQHx0Umk; Fri,  5 Jun 2026 12:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 089E16130E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663873;
	bh=VABXSir3c3HhGDAUcdUWd+wTohEmccREnUSTZNOlBA0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FUOoVu4TXJDwbqGrPCXXvAc07Lz+M9nlLlTIVk6Y/hkp+jqDC2492i+eHdKaXtRet
	 bZTHb+2k2wehOGU/bR5/HQMAl0v9FWyJQFupJ31IdcRgyNjEMcbO7iAmShy09xuV3k
	 94Ej8CCyM63ID4XSW9lYztfPRrxaur9Kv+BpXC+UdpJ2mtYnDy4L5/VSzFeogxn8Za
	 4d6Jx0AXkxGO6SeXyhERl3vPvHkv3rQH5QEaKDjX+yemqbRNYYr/l9wP6+vzcuDzhs
	 4Kaq1Sje40e/6dzLqZ5IATpHx27LMI5Q0NQ2py+zJuJXlHAWgUaDEzNR6bAKQAMw4O
	 QBH7sYLxyF+ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 089E16130E;
	Fri,  5 Jun 2026 12:51:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F47A388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 419A24098C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGWigk2Z7MHV for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 430C840985
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 430C840985
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 430C840985
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso15207165e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663866; x=1781268666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m7d4uD9c39dZG/UwE9jjYwnW147WDadA5PokIg2mfkc=;
 b=c9nmN2A3IDJ7ZlEi2NIC6VRS0f4dHjN3j4BU9H+dFG67zyle0aG3tz/9eigXEa/04B
 dpp6hV521dRQt2qoyctyTesf2fSJFEF338Wv5NguvraCYcqMGK0zYL6hsPnUSOzs84EV
 sQIL3MGuF+bg0RDVh0c2gJiXXWSwk5fiXHJy/rV3FJDq3eNBPvk0Tsf8HRIegZEiM1/M
 bLxO/MqQdOaUd0hjERJJmAwMWaqtSFieQRqLvhgTvSracF+IQLrqvQoceWmpZ5B5BUie
 qhdZ6qerrsGvs0H5ZRnH04HpRAaq0NZIgo9FBWoC3vFB9p3mLiRnl9YNMJ0qzA5pzRUg
 1jOg==
X-Gm-Message-State: AOJu0YzD2mEH2bCiSJsvAs1163W+GBU/3ZvEGY7wwkc0jdbc9mcQGtME
 admVTo2YG98Copfu3FLJgyw+DRU0tqoD6acM4lYwwFDC0DptMy6TV88nBRIpuvzHLAYK2zLD1zb
 xeoew
X-Gm-Gg: Acq92OHyQKAmfFRs1mEtqABfrtKd3noa6EnfhwR/o7zPPPh7MUJ++Om5F8XzeISaY2i
 OZcrFDClnx4PgB+CLYtlBGuvj6Nu4YjymWofizS9lDYeaVZAGAhIy+bqRu7QN7qan5y3w9sFGvw
 Jo5hJFZEhDeCj4Up9Jit3aZKI1TVC2zWGwNWgIs8ox42IRjGmSqB46F4mSOge+37Xfiaw0IScqh
 fqkMKOziE2XMRVAPnCblhk92xKCbUqugqagRJO2U+VR+CbG7lJnk46hx+r9KNSx8luCkYIynOlQ
 q+tWzgugjJ1omrs8E/9JqVUA9kZcdV3PCMLdD7l7NSq6oX0E0xBEzwZ2Nss8cd4sG80u1kUAGsk
 Y3SW+1oZPEvbzqhxBhg5DG57zU+3W07aNI0mwPRUSM9Ag52m8D6b8FemRijAyICrxsp/sYhuout
 +ovfvlYYoy99z+wgP5LVnqROG8SA==
X-Received: by 2002:a05:600c:4506:b0:490:4973:91a0 with SMTP id
 5b1f17b1804b1-490c25c0bd7mr56104575e9.10.1780663866130; 
 Fri, 05 Jun 2026 05:51:06 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c4f73f62sm5450935e9.0.2026.06.05.05.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:51:05 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:51:05 +0200
Message-ID: <20260605125105.275252-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-3-thomas.perale@mind.be>
References: <20260529094514.178266-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663866; x=1781268666; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7d4uD9c39dZG/UwE9jjYwnW147WDadA5PokIg2mfkc=;
 b=WefE3+M50RtX/I0OoZMXok3Hlv9LU8CmB5VH+WyoQuaumpfAK5HpJyqvTQOD72zEEY
 jaNGJ2jBK3RJ8LCN4D8p+GwxZQaOctytiLgKJQtCERDa3Zy04U7SWdnAucJixdn86GJd
 Cow/zS/iqJmM/Z9OTRgNAaf2al5uRn7aRbLh3YDoEz+vbaD1c7AgO95TB2dPJav99UJL
 lzqcOotnMFXgUUaL++hZW3HMdHfJJZRgI8N1pXr8qF3GhycgAB+eN+a3fTDpP4VGGq6X
 2OrNqRiLNOZGkc7HJFgTcXbGAfYt4agGUgWvaPHwKzbBqpWK88yqvP8P3zNB4SWSuD2n
 pZVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WefE3+M5
Subject: Re: [Buildroot] [PATCH] package/redis: update CPE vendor
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
> The CPE "cpe:2.3:a:redis:redis:*:*:*:*:*:*:*:*" is valid for this
> package.
> 
> See the GHSA [1] and the associated CVE [2].
> 
> [1] https://github.com/redis/redis/security/advisories/GHSA-c8h9-259x-jff4
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-25243
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/redis/redis.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 6ce9933029..9db7226675 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -10,7 +10,7 @@ REDIS_LICENSE = \
>  	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
>  	MIT and BSD family licenses (Bundled components)
>  REDIS_LICENSE_FILES = LICENSE.txt
> -REDIS_CPE_ID_VENDOR = redislabs
> +REDIS_CPE_ID_VENDOR = redis
>  REDIS_SELINUX_MODULES = redis
>  
>  define REDIS_USERS
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
