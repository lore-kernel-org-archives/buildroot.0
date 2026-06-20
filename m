Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F63CD98E4
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F5DB6FB07;
	Sat, 20 Jun 2026 09:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lz1nmLTxHW8H; Sat, 20 Jun 2026 09:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4B5E6FADD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946650;
	bh=5Hy+Hh6+z2uQ1DBn9OVMkniQVLVXbrJEqoPrcoVJuWo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HJI9KABfmw/PRdO5c8RownciEqKsDmczQBzDXs0TxWpFikSyDpswvSh+gkMzea9SP
	 nieqrgsc4jD5W4hJku3+sErE9MfiYresEhm4mi79ya2sOx6ljbnx/MJ+uyCIKwQNxZ
	 cw41ui9EF2F8HD0StihagD51Vg0dqD1HStVOBpJ6J5mRv5YfTojn+Y99xg6Unaly8i
	 TtLuB23owHABPRl8cZ5SY5bmrxkq7AmOYbSvmpPDrEH7hWCxJ004xBNcIN6hmrlKfs
	 fYxYUEvcPSYPyvB5YN3CA7x8uXOramD214ulkpgN5M4c65Ok563g7Sjwc4OOQsgU65
	 4bhH1U9oae82A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4B5E6FADD;
	Sat, 20 Jun 2026 09:10:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18C2F367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2DA4401EF
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgleSIYH94gV for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60C094019A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60C094019A
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60C094019A
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4624a44e152so2328477f8f.2
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781946646; x=1782551446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6pxilf6pVVnR60yoJiVKEYaINHo9wMfNHGCqHcQhFfs=;
 b=Stdqf+k0AVZF4PoSCUOOhPq6AHDNw5FC7+1iJgD4xSWXj+Pi0I3W9jQif+Pk88pu/Z
 3tlb2OwG6h18UlbT+QH3K23DJo04mrVkatYJ1p6cxxlsfrorwyUMNE83F1TVzUXc145f
 ARVgyFF76RpjZfaYqDZLe6KPHZthN1xe3UJtCb6KR75pMuTQ4hdF63GC975+LBclnkJ5
 j0W2ze7yaCsCXEpEc2P+g8eZcArEQFZZ3tWv5XboiA1qvSQur3Pqy4c3PF7ayYwYhQru
 A6eT1Wd82brIWsYJGdel1zxPfuGU66rMlFW1VpkDwfiRKPDKQ5R1hUVGzC9Chg4Ai4tp
 sOwA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/vdEkm6KQwRe6OUouRAMnSewMbMLD0ifyfhDxH2wFnIgH22qnnaVXq+NkZW0UxNfwqH3e7pa8eth0=@buildroot.org
X-Gm-Message-State: AOJu0YyATQ3RxnvLI+3KGY+HDvd3Qqh65cUxb5V/WpR2qtXcA2ocn0ir
 MXS8Kours85KD9mYATWRU8R49QWySL73ORwuzwBdBocgshPhqAiC/SUtlspnAij+xx4=
X-Gm-Gg: AfdE7cnnr4LA5anJFu+Ap/ed0ddVF3RE8Is0L5hj8a2Hk14aFIwfKFhxvI3o6grtwUM
 GQqiAxHwL3GXeaqfNSaIfikSwnpWI3Nt9WtnXaYCyzG0cZIMpJNrsuFHE52thKs312294CiGPGP
 klixMJBs7qU7c9ohUNtnMjh9RWiF8/yv2qFlsrjnc6oLK0ysx3DCD150zFJh5hamKK2TE7VKEJv
 Ax0ZerR4bj9omesQiNpPN1CCLqHDIXs+r9HK+3esSQJoOHesIqXOSCASeEYd/Jo0kBDl7fDpeiV
 4Cr2dNv70ZlGqiwfwbx2EGsHyEgZJCTd4/mp9sObA/eXVx/6LL9Qla9fJIs/S8GfbG35jLH5yke
 4FjZVKDgqIJs+HIP7XfFv9n3bftZv7ScJjLxSQUHdBuFqpe18bODYRBwCy7ikChvukfkfNUXacT
 jiRshF
X-Received: by 2002:a5d:51c6:0:b0:460:3234:293f with SMTP id
 ffacd0b85a97d-465097863f5mr9279044f8f.42.1781946646334; 
 Sat, 20 Jun 2026 02:10:46 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c53fdsm6670799f8f.10.2026.06.20.02.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:10:46 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 20 Jun 2026 11:10:45 +0200
Message-ID: <20260620091045.22302-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608223458.950479-1-titouan.christophe@mind.be>
References: <20260608223458.950479-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781946646; x=1782551446; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6pxilf6pVVnR60yoJiVKEYaINHo9wMfNHGCqHcQhFfs=;
 b=F7k5kYnSmdmWUMEnlMFxta8ZBTQJyVIXXuFzrHcg1f4ut0sqbpKp1oRzOBD4GryReD
 kU+JFLgod9K78qylM65asVo2HnTClnsO1v4Zrrgt/qNvu2kBSYwSqCkS7OLg+U1dGBnX
 3Yg3hJLFEz6a3d3Chcmy97amHxZhUGsUlLLqXeazLbUm5jwZdywzGqZOLDyJLczHvc6+
 q4R3B6U+n0f7huVElv8Fg4qJ6ZFLOcC0MiTgFoN+qviUaH3h2sgj0+1OznLIr4Duuchy
 fMMAfgOIKQM46PDiXMzKCvEM4I1WPdXwTsUuW4KOPHbdqlVDJyonUfHVnqgwyXeBZP/E
 +ALA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F7k5kYnS
Subject: Re: [Buildroot] [PATCH] package/redis: bump to v8.8.0
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
> This is a new feature release of Redis Open Source. See the release notes:
> https://github.com/redis/redis/blob/8.8.0/00-RELEASENOTES
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.05.x. Thanks

> ---
> NB: This patch is based on the previous security bump to Redis 8.6.4,
>     but I had already sent the former before making this one
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index 2bbbc9e2a7..00aa3e4497 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  559c2e50c496b2d4afcfb491af27763a1b170037317789ecf309025d0caece24  redis-8.6.4.tar.gz
> +sha256  88422181efb0c9c0abba332e3e391d409e1e13714b838931669235e5796f704b  redis-8.8.0.tar.gz
>  
>  # Locally calculated
>  sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index ba41b3f922..a876c56f08 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -REDIS_VERSION = 8.6.4
> +REDIS_VERSION = 8.8.0
>  REDIS_SITE = http://download.redis.io/releases
>  REDIS_LICENSE = \
>  	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
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
