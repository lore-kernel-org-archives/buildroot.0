Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6E8E7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D8B608EB;
	Fri,  3 Apr 2026 10:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuLWQzz0v516; Fri,  3 Apr 2026 10:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEB38610D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212077;
	bh=T/3lkwl1/BQvpo2qndeUUvWaXp5cn25rO4gf9AwN74M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PMgpgk7G06ilZuLgBqWjo/Y7+Rtwm33XM/+2vNPGIAFnrgm/RF5EE4QRin6nN42GQ
	 D/4H9Gcxcw3ALxJXweD+L1XehYBL7gJzAqn2AOyJXSt0ShYyCf/KC4u00Qdvwnh6l8
	 ur+vKxs476YSiI91c33LuW83LlSWbd73ETVln/IuVjk3fu1XtTjVnEISgwsUQ3vMbW
	 om/IFG9diNrAhhR76knI4uHdVL8YQOY7heH/gc+cC7ymcmC9EYqoKTxMZ/wS1JQpql
	 zzsP78RmBIzIFkSVNo0xChV3jeWv6KyL4X+o3g6UI8fc469DeYsJxpRUssA/legp4r
	 BfKBmezvk7PhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB38610D9;
	Fri,  3 Apr 2026 10:27:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C41D1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D35040E55
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58bVs8oKUVbZ for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:27:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4102040E46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4102040E46
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4102040E46
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-486fe36cfabso18056745e9.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212072; x=1775816872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SSNmMeEcV8gUDZlHLgvtIMxEVsyUDRwEgYlwOOV8/4s=;
 b=dF09snoj54UEkGgrEyFF8IwK6K6ndBd/pbYRaNTfI1/OPERV6P/h3VfYFNwoUN7AR6
 pf0MlL5wAFVArTCOjWcskAZcH763ofVYibS75MwvTI3KnCIRiml/RCoaf4VtHC5oM4zt
 BDIqYONvAZAqnL19PrZ0F76CcpsaFF9eVuOayGmuARP/hO1L42z9Q0yXzNcnbV8+W1O+
 KBs9g+CZwvQRkxj4hFni+0NuSku/8RhNZRzrtF5RHbdZZqXFYPY6p1w/D6Ts3SDuFGP6
 NpuhuTYjnZoFc1SZ6iuINdichw10l4uwaijXr5evWUrr3smc08BYlEQd2y7ncxTTlOQ5
 yLvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt7IWpM5LHN3PPK5x63RPb9/fLyKloM3PtiRAOamlbQzN6JxHdCXFMsbz+EF2pQadsELPNSJBrz/c=@buildroot.org
X-Gm-Message-State: AOJu0YzarHROWEDls7hj5+iIxzlrL83EWlaBmfO8pI5WI+an422d09zK
 KhPod05ECPfUWy5WKBnPI8dQVN2kVWYizKKI+AqUy1JQ7ub3ftQd2wQDlvL/W33oB6y/jhaj2V8
 xSVHtyjA=
X-Gm-Gg: ATEYQzyiCkkVxb4FVsIuV4xayn4+YVyBWWg0oPIjSwqPKjCFyWYahgOnqC2wwENG/bU
 LSWZab3FGEKFgA0Tbm7zNERG6KuBeG7CcRd9phKtOyPTr28/TTC+4myLUszVFdFgyUb0GTsQ38X
 6hyzFs6Y7XsswWm7YFjAMJoFyAvMPtp3TXzuJQVR6oLsK83JZgP2bcu+u7k5vDOeRsJb977yAKG
 OmpHrPBKhDFhzYoutiaXqhC7dEP1WiAvaZvIhZR3rNYX7CP+Nr3ctLOvyW57qR51yjxUfYlwIl2
 wR+RjgC9dvNg7CkAQHnrgBo7gDugp08O2F3V8TqtmEjHRI3NxHBIPBkAaCa7XaI6EikglADlikv
 qpR+Z6fJAWy8xWyTxxN0Cu44i14jN7UPwKs+85gt4xXwgu4jzP6TliP5D2dsWAPYK54XErkVAfj
 LnGZDblvE7jTfZKssx
X-Received: by 2002:a05:600c:4e42:b0:486:f893:56c6 with SMTP id
 5b1f17b1804b1-4889949c0f1mr37863775e9.10.1775212071941; 
 Fri, 03 Apr 2026 03:27:51 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488980df5afsm21355415e9.6.2026.04.03.03.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:27:51 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:27:51 +0200
Message-ID: <20260403102751.209979-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401203524.595554-1-titouan.christophe@mind.be>
References: <20260401203524.595554-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212072; x=1775816872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSNmMeEcV8gUDZlHLgvtIMxEVsyUDRwEgYlwOOV8/4s=;
 b=Kb2pUV+mlwn7JupeaH5Ak2Q8AKZaL2HAg0Kcyg2T1tIw3jk1/MxNVcXiC2ticJGDd4
 68X8qYRqCQpCoFbCNCs5+UV7UpIWaLw5j7me5KADGZMnj513FCXOdHemATd45yCVZClR
 gMAhCpLuIlkAki7ERn4F2xp7jJvljrikdiuB/woZJumSi4A+H5cA5qivYi1V5pAueuVE
 GqBYqW+Ef93gB3j+izZNkF/ai+QSLAv0WdDMrwlb3mjf2ffGzo+uqmuAqTscRgbqRMVz
 NmRhi+jTRxsXURgbvQj6Sv2O78ZWlhvfWL+VprqzBVGmjSZ0FykC7++CHvVOUiD5MRTd
 9EiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Kb2pUV+m
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/ruby: security bump
 to v3.4.9
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
> Read the announcements:
> 
> - https://www.ruby-lang.org/en/news/2025/10/07/ruby-3-4-7-released/
> - https://www.ruby-lang.org/en/news/2025/12/17/ruby-3-4-8-released/
> - https://www.ruby-lang.org/en/news/2026/03/11/ruby-3-4-9-released/
> 
> This fixes a few vulnerabilities in bundled gems (ruby libraires):
> 
> - CVE-2025-27221:
>     In the URI gem before 1.0.3 for Ruby, the URI handling methods
>     (URI.join, URI#merge, URI#+) have an inadvertent leakage of
>     authentication credentials because userinfo is retained even after
>     changing the host.
>     https://www.cve.org/CVERecord?id=CVE-2025-27221
> 
> - CVE-2025-58767:
>     REXML is an XML toolkit for Ruby. The REXML gems from 3.3.3 to 3.4.1
>     has a DoS vulnerability when parsing XML containing multiple XML
>     declarations. If you need to parse untrusted XMLs, you may be impacted
>     to these vulnerabilities. The REXML gem 3.4.2 or later include the
>     patches to fix these vulnerabilities.
>     https://www.cve.org/CVERecord?id=CVE-2025-58767
> 
> - CVE-2025-61594:
>     URI is a module providing classes to handle Uniform Resource
>     Identifiers. In versions prior to 0.12.5, 0.13.3, and 1.0.4, a bypass
>     exists for the fix to CVE-2025-27221 that can expose user credentials.
>     When using the `+` operator to combine URIs, sensitive information
>     like passwords from the original URI can be leaked, violating RFC3986
>     and making applications vulnerable to credential exposure. Versions
>     0.12.5, 0.13.3, and 1.0.4 fix the issue.
>     https://www.cve.org/CVERecord?id=CVE-2025-61594
> 
> - CVE-2026-27820:
> 	The zstream_buffer_ungets function prepends caller-provided bytes
> 	ahead of previously produced output but fails to guarantee the backing
> 	Ruby string has enough capacity before the memmove shifts the existing
> 	data. This can lead to memory corruption when the buffer length exceeds
> 	capacity.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/ruby/ruby.hash | 4 ++--
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> index 90faed4c32..e8bf51ea43 100644
> --- a/package/ruby/ruby.hash
> +++ b/package/ruby/ruby.hash
> @@ -1,5 +1,5 @@
> -# https://www.ruby-lang.org/en/news/2025/09/16/ruby-3-4-6-released/
> -sha512  29000b3396ab95fc2dc13d2d78441ff5c34258e5421115181c54b1b4d55d5c0d4f3d0c3cec6b32b9a1bb8de5c51b383fcad4369ec3fb244fd0ce182afbe79ba4  ruby-3.4.6.tar.xz
> +# https://www.ruby-lang.org/en/news/2026/03/11/ruby-3-4-9-released/
> +sha512  356fb47cc56f2d25198cb95253fc20ff7d9a6fd1fa53bc475e5c440012aebe27562537c399d271357235114ade263fd625029b66cb0f9b526f9c04f169fb9580  ruby-3.4.9.tar.xz
>  
>  # License files, Locally calculated
>  sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index ffe42968b5..c56d2510be 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RUBY_VERSION_MAJOR = 3.4
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).9
>  RUBY_VERSION_EXT = 3.4.0
>  RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
>  RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
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
