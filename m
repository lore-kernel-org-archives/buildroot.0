Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB98C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0074381167;
	Fri, 10 Jul 2026 13:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXqWIDqrM7Za; Fri, 10 Jul 2026 13:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31A8F8113B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691516;
	bh=Bavq6XXkGDUIFd9Eh/z7Mxaea1WVveztjpH7vU3APbM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SSbmonOkm0OoegRFBgSRJs/ia2a2L23YCc7Pd4pIAN1+LtODNL6wtJFa4AfzsI+o+
	 1W975y2etMkk70UfAGziQVhq0EGdrljNrfG/7x8vtysr6G68sokJ6UQO/js3PuFPRd
	 oXza9I6bFZR4KZaRFszhAUZyNf+PIO7bVQAFeo1NKKqMbfbh7FVOgSOgd+H8IZeaf1
	 lxCP0Hi4mOUiNdhpmBy7VwqnCpq4j2MPfnsrod2hFqJXvvunpgQHaRXehfNhrlrz8G
	 Jmbr29iojc3zN86BfAK1pri6uqdgRgJL0YK2Cvb7kadbQb1mXsLJrFbFFFRGuZnc15
	 1bRDWD4Zzwwvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A8F8113B;
	Fri, 10 Jul 2026 13:51:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC8252FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA35F40C9A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0xcv1JT7agg for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9AF940C94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9AF940C94
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9AF940C94
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-493e8d4f4dcso8035145e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691510; x=1784296310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xIkMjKPS1L2q0T4jQKTizDtjh+77HOr72+DeBeovrJ0=;
 b=f+o5TNE9OI1WoEIfLtpcpqhjXICp4h72/AGrdsAJ4j3WHIK1Bh7zDsYnnNH9iLdjlD
 sXX1F1fL8E4uda9ofpydCUo/GHLwwxaCQxXh6EDFQ0P93zDv9HIJG+iMP316TScVxD+n
 VaMhSZwGzFMsnixKVTGZ4fTYpqBcvBxMpIsjVfaXZ+FKJp0GvdlxU6xP6CR2Wnl04mBd
 zKXSqvYF+LL5iMUQxi0fEK+43dQ1VYmTWmvAxubJ7Ce7eVARe06gfkSCC+iMzpNTisrH
 KwIRfgz+Ov447yU4XjK1JAdTH85xnpX4bt9NIxA/Tv97H1QtR5AiUlt6FI5C6Kk2s5pN
 6iYA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqD5tU93eCarTF1dEFGB9GekC5N9X/tFrpkibFoW5UbjjAXuiuo5d1D1PGFboUGSjT89o3H4xR7HSc=@buildroot.org
X-Gm-Message-State: AOJu0YwSKUJcajgMOtdz8lwfsKGfb6O8MruQ0sc8dZ6+oUnKhSkgdDKk
 Xy7PxuZdQUcD5gNVcH1qUZD5+WmmC4Ef8kgJl7xfDJjk5kGANLlFO9zKT+yZt5Qd4jM=
X-Gm-Gg: AfdE7cllGfLIP/NC3AeDhEiP3RR0c2H2uZ0bqXQm4cQTtfK/erR+o2UB6NKRIlaXVIY
 4dD9KY4me/L5PHUjBnFk/2Oosw/6uqqgSC8p7mk4FdL/n06hFoko/jdkG0Z/hc5h1+SUqvD23r1
 r85h/uEAWuTI1Rsqxxidk3WjlztDvnuooEaUqxEfIu0l86WomtOv3yg3DXkYqM4wpS2hvGxx3eK
 zNuLc5yDLWWs/I7pT+CVEH6hg/UncUwam6JUFLuyg8QIu8H186o0lMeutiaLA3MZ8gzFr7bIssZ
 ccuWzTbvf25jrrCTvNKFD/aezPDmw2FkMIsfEUlx/o1E1fjNb6UEXDQ75Rdw3V71f8hcdbhPy6F
 RzmvHrPPjgLfW4duNZMSKMHBzAbqP8uePtxlIj1al8k7fTwM4oTqnXVSzsTED8Syh/xAGDvbCWX
 cHp2ldCQ==
X-Received: by 2002:a05:600c:83c6:b0:493:b8cd:2555 with SMTP id
 5b1f17b1804b1-493e690497emr118937895e9.3.1783691510581; 
 Fri, 10 Jul 2026 06:51:50 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f273195d9sm4184879f8f.3.2026.07.10.06.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:50 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:49 +0200
Message-ID: <20260710135149.759513-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260626210949.741890-1-bernd@kuhls.net>
References: <20260626210949.741890-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691510; x=1784296310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xIkMjKPS1L2q0T4jQKTizDtjh+77HOr72+DeBeovrJ0=;
 b=HZ6NHurfKQDDbRU0HAwt60MZl61d5yksE+NaVah4cdlHf6L5naXCyNRXAqGolD8mOd
 EYnZPJj7/S+oQHPD5E8r+gNeWUuAlOYptClQEj8b6ESCJuStfnMqDKPf3T59Xb0YbcYX
 H4T379f4Ax6imw5NQDUm41+rRQ4GwNgFi+IJPvWs7ylp/t47a334ZoPPLQiGtxLu5zgp
 KzVR0OIefImgtjI7gcaGV++UNsIJUjMflA/xYa50MNfTkt96HnGef+z1u5/Gnz/kJvCa
 NYRlL7SA5+bBX0BG0jb5mULZAnklgkKahiwnSgPvXU+zEVGtEuBon6FtyZVpcfXWpPyZ
 xLwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HZ6NHurf
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.11
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
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.11/ReleaseNotes
> 
> Fixes TROVE-2026-025 & TROVE-2026-026.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/6a475e9b6283e763f8af481dbe43a9f86d389ed2
> 
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index a6771b1fa1..b888270f14 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.9.9.tar.gz.sha256sum
> -sha256  bd75ba7fd68f607c7806fcf70156a300aa926e9ad69a5e56a8e6414f5227e833  tor-0.4.9.9.tar.gz
> +# From https://dist.torproject.org/tor-0.4.9.11.tar.gz.sha256sum
> +sha256  2e6c1720118c812acf0079fd47cf91b6bfaba5d766c321c4d3d2a28d6a11a8ed  tor-0.4.9.11.tar.gz
>  # Locally computed
>  sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index ca5a4d026c..3e63fbacac 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.9.9
> +TOR_VERSION = 0.4.9.11
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
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
