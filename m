Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B0EFED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD4284E9A;
	Fri, 24 Apr 2026 16:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQ0Ci6CnRlNd; Fri, 24 Apr 2026 16:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FB084ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048060;
	bh=EGhOawzEMFYYJHn62pQnmJq71zPavKS/seQYCD17S1M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YvraX+vHLsPljjpzwqZwn+ctTLC/ySELJs4Wi3voe5mTK/7vDf+aXl7v3WulfSbr0
	 DmotgfkCxNChDdo55ntqryb6bTJxAXnEzFkLuygWZBKpDjIOXkiHhJwzLfx0eWL7VZ
	 kYR+E3Xu5H58qc+EZgFzp/UB1D5uvljxzeV0kViWANonPuZk9IssWyXRCUrcJ+UZrL
	 stEvKBmblfbtBQTZiAVSOg3j/8ReK5AZtTX34RTvkw2ngAq/sr30X8xeQQzc7D+ELL
	 hpgPKhWHqvXY7TPuWUX6k/XtM1xDJHBN2Bj626HBLyGQxNglgkuPIEYkAMsAOpOnUw
	 f9XXHK4sfLh9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85FB084ED5;
	Fri, 24 Apr 2026 16:27:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CAE7194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23048423CF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMugtyDT7-Je for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0EB042389
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0EB042389
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0EB042389
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:30 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4891cd41959so61812615e9.3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048049; x=1777652849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+aS2iZAc4ZzIAvTwnBANjHInZyR3J4CkvOZPMeawaYs=;
 b=jq6RqOSUPRQamZ2ikeW18Y6Yv1OlGuEAv2zqHxOZPz+ulM0NYGLu5skyL+qhHlZ6EX
 Y2BzpS1GIJYf91EfyLviHLU7UYVbburOjFmIOYiWnfaUKgIwRTnUGAsEZG61msJ/5jWH
 67MpU/a3HpjSLtH5H6xjreEVQC1aTXu40Xy7GdmqbSDVXngR6xt7U+n61PmYrSy9ysqm
 TbQOST0Sd0+cYKmLbvSN7cTISSaRVHNnSZhF3RHIL3VCWxDjAPKNHxwBmuYuFtjP3KR6
 EBJAvEmpGyqQLa1QfhQyrqjwfGeWcnjn00mOzdg7CFklF6MIQaNW6VK5UbBLjGl0yjKE
 jzCQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ94CCTdWFuekii/xJvukbpZP2XC5jK+0VRNVDM1S6TlpV03WKXlbLRULD9jUQiQVwpSCUSWwIZ2hQE=@buildroot.org
X-Gm-Message-State: AOJu0Yw6usYx0Y19P8EOOcnwlIuJzymNB4BOpswgUT3g0eH04hHHVDjS
 GI3lXIUrjXpxJG1Kq5olfHv4N7d/fNYhdC7L1tHVTrOC86+AENyNVYsJtyCkLsne4/c=
X-Gm-Gg: AeBDieusTTz0v9wjEudPI6KRbkK5tq92dSt0c5eMeBv7VQRQFSz7IGe/FhFgtoDkFVC
 bcMFqpdc9Yj7JEIv/bp4bQuO92qlRYrtRwIsMA/I0HE4Iigi+fS7tWICuWnZp2OVQMF+DUqZYy8
 GB5X2SJA+68wi8/3espHQX+HFBFhYcJ65VauQr8Eden/F181myl61SbccMAJeZhBzHtaUX/5MZ5
 /IVEV8K/mEMAW2kKjSA/0HTi372a7vqAaBm+zskwwRUDom1vjXSwBvkgWrgdDu9YmkoYWFM/uC/
 zxUmQeQqDbZFoFYxQGQMa8LytFIEW40aJGBN9jgJijDgW+3lg08/ohAGAekmFij6ikAwb8x4HZn
 y42032hQp8AUEHTwNv6HmLu8EULnd7axnIwwANy9s9NnxzQvONvD7VmQtzOzCXCtmAGbeDhwjUz
 UM7lJyIDVsoZ7mK+KTe9YriML2hw==
X-Received: by 2002:a05:600c:1e09:b0:48a:592c:e655 with SMTP id
 5b1f17b1804b1-48a592ce7c2mr206984715e9.17.1777048048960; 
 Fri, 24 Apr 2026 09:27:28 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm1025658985e9.3.2026.04.24.09.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:28 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:28 +0200
Message-ID: <20260424162728.162339-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417075824.3538852-1-bernd@kuhls.net>
References: <20260417075824.3538852-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048049; x=1777652849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+aS2iZAc4ZzIAvTwnBANjHInZyR3J4CkvOZPMeawaYs=;
 b=C9kzc9BttGT7bzFW1O+VyM1aXrffVglxD2ap8mcJpXePLnfjljHKemrfuxq26BY2eC
 gBLm/m/iQTvNCgDXiUvzIXMN1j5N4rvsLEo3emQ0PkcXzbgHDnybDQVuu73wv0n3ULnF
 zfrNCwSO8XWl0RF1fInb/PwmzhmrGJQZNLBCDSQwY2Wo3Gd5TzDWJB/iCOKOq87u7rj7
 TdZ/Sbw7r55PELncdp//7cpigJXlnxNARR+142Aqa8w/AcixDmr1xVUoP7wtik+TK4gT
 76Gr0i0owUjCWhjiFchL2S7otxK4B2MLqjrUqI4eq8wCa5jAYi5rDntTZWKoasFOOhYW
 y7fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C9kzc9Bt
Subject: Re: [Buildroot] [PATCH 1/1] package/libmicrohttpd: security bump
 version to 1.0.5
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
> https://lists.gnu.org/archive/html/libmicrohttpd/2026-04/msg00003.html
> 
> Fixes CWE-444: https://cwe.mitre.org/data/definitions/444.html
> 
> Version 1.0.4 contains a bug and was never officially announced:
> https://lists.gnu.org/archive/html/libmicrohttpd/2026-04/msg00002.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libmicrohttpd/libmicrohttpd.hash | 2 +-
>  package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
> index bd5d0b3e8b..4dfe62deeb 100644
> --- a/package/libmicrohttpd/libmicrohttpd.hash
> +++ b/package/libmicrohttpd/libmicrohttpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7816b57aae199cf5c3645e8770e1be5f0a4dfafbcb24b3772173dc4ee634126a  libmicrohttpd-1.0.3.tar.gz
> +sha256  b46d00f58efa6f497b97d2e782c4ee66301d412ddd855dd3068518b3a2cd3ea2  libmicrohttpd-1.0.5.tar.gz
>  sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
> index b74a7a1338..7a243b42cf 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBMICROHTTPD_VERSION = 1.0.3
> +LIBMICROHTTPD_VERSION = 1.0.5
>  LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
>  LIBMICROHTTPD_LICENSE_FILES = COPYING
>  LIBMICROHTTPD_CPE_ID_VENDOR = gnu
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
