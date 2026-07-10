Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075A8C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CECFB40CB0;
	Fri, 10 Jul 2026 13:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJzDrBKp9MIa; Fri, 10 Jul 2026 13:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA0EF40D25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691532;
	bh=gLei/L4W/gYnqthMyi0ZWe8UvYFWW1qkqu+m+tl899o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DyRJ2gjfWXfWvznd7JCB6Jxsyn0HI6ISsq6YBXigZLdWldLfNxb8iIRkOOEO0lcsC
	 xKeX0MAamGyiellqs9BJN9LhlT4+ouJOof3Jp0BN+rK8/sLGkLCLh/5BSXuKpN79A2
	 Q+77tkedQn+NuxcAjXgnfM6QGKtnGr7jj9oL6wWUvsvDp5fgmJMGJq16atva+7rS7X
	 kaVe3/mXdQugOxe5SwRWsiI3NMmFXNEwKL8FlH/uaDWEmM1ni7pVzstnVH7VvJeeyf
	 9pBJk0dtDv9RyFLox6QH8GisZpDiHwVo9hiDijZyfQVdCkTnIl9f+G1zRU4iBNOqUp
	 ajbISJUORtk6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA0EF40D25;
	Fri, 10 Jul 2026 13:52:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6E59A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD75D606F2
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75O5YA8ucJFN for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA4F8606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA4F8606B4
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA4F8606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-493bf73ec2aso6135125e9.2
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691526; x=1784296326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=itA5W9vRoK1Xh2Zw9Bf4uVdESlIfFLo83dTPV1GO+v0=;
 b=OHeBb6EFOLSS6YNRdUktngmw0PC+LiJnb+arjT5Xb8l02IQfZV/Ny/0jcEL/toA9Po
 eCXRr80IGCXEdVCEojxwQ1kCdhFwCdWWebOYxLGSJtvlKJAgKMeMDSJelwMJUS8dZi68
 gWBshkuZF/d5T9zkpuJSjOz1+bM2lUoSBasO8cqX8NBGHSe+Q7pDeje5DiN91yu3WADK
 TfoZ7GXn6Zgadm9RH4vXA/72hEWUq1tJDRG4y+tN23/PBcm8t9CxFUx2EQdsC19f8O8H
 WoxuRCrQHeis85HUMhMlSDS3qlZzesVxNc04C1IkvSo9WV8DbZWzPQneuy7NaT2orK4r
 ChCw==
X-Gm-Message-State: AOJu0YzBqr9V6BCIDqekOGHNJ7/g027dsg/ImpF1oq6gCNxILZmJ+YMp
 O/jwJ0JH1YoISjQJ8TFpaUMRxIWE3mu+uVo+Vvexsm9LSiBtOZynJKUqeNRCc2A8OfU=
X-Gm-Gg: AfdE7ckfrvdiR7EA73c77Xz4YhLnz1sEr9WVaQZCQvLU0VmzAQqRHJWoze/Lj1iqH1/
 m7+/ZrAHoFSfz77bS+gJ7WApGd36Tspz4QsNJveFaO4ZDsXOCjun5zwX0XfGtCTZrYmO/c3cXgN
 3VqqGCP7QKQ8jKfnOYi9d3URusCdRif+aT/MaDpGvu5SQu2YEAorQ9iH/pGuuP8DqGuM1GGl5Xy
 ZAtFzx6Nz+hF1NaGI6EN5+FAlgn3LG6pEk+cYfRrTBwhKOqmaimypInNhDFuU0PL8Nqn4xCTl10
 jC9jWBy8HMKjCBSq1OfluGgLZVrIEimeV2f2zFyXwTihtlkJTK7I61+Zz3QBVvHbub7BbrTC12e
 XZIZzBx03vdSY7HIo6yJRPctpX3UfZQtkINMi1xblNA6mYb7unvdz+E9+CKEIhim4Z0U1SoAwyr
 mK9ugEpQ==
X-Received: by 2002:a05:600c:4f90:b0:493:e404:3727 with SMTP id
 5b1f17b1804b1-493e68c6da4mr130769025e9.23.1783691525533; 
 Fri, 10 Jul 2026 06:52:05 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6e0e5asm143450395e9.9.2026.07.10.06.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:05 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:04 +0200
Message-ID: <20260710135204.760164-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260630212717.604030-1-thomas.perale@mind.be>
References: <20260630212717.604030-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691526; x=1784296326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=itA5W9vRoK1Xh2Zw9Bf4uVdESlIfFLo83dTPV1GO+v0=;
 b=UXoeq9+UWZxZaBA7dlOjlSvEZryja8PIgoC1v7C9nittXosZPKPE7Aqw5Njiltwd3/
 CfTGoAq6J2u1OSOwhTLKbD/T5v4uVrIavfi4y29NjM3Cpu6RfyvKWjKZSeA0RWWZ0kqq
 3qkj5ncMg/ZFiFIno/tpL/kxqifzE/rTIS9+8vbEWGwiNAi7kUlz8lC17eE+cgww4zjU
 DLMAez/WfYmsz8Vh0msd5LZscT40CbVJmwmCbZRe5r3CrPVlkgWtVXC4KTyGME+QxXc9
 r+DgMB5CzqvI9L2vCTXX2WgUxLZvw67z0esjeyAiaGCZkPGKkE7RSNjcvqV4prtu6oxN
 hObA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UXoeq9+U
Subject: Re: [Buildroot] [PATCH 1/2] package/strongswan: fix build w/
 wolfssl 5.9.2
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
> The 'mlkem.h' header is no longer present in wolfssl v5.9.2 [1] and the
> content was merged in the 'wc_mlkem.h' header.
> 
> [1] https://github.com/wolfSSL/wolfssl/commit/7a2cf5b655541013ed8c93ecc9f598146abf2916
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  ...lfssl-Adapt-to-removed-ML-KEM-header.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch
> 
> diff --git a/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch b/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch
> new file mode 100644
> index 0000000000..a2eba92612
> --- /dev/null
> +++ b/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch
> @@ -0,0 +1,29 @@
> +From 98b133c54c5e3f66f46a5bb11c9b09d06fdc8469 Mon Sep 17 00:00:00 2001
> +From: Tobias Brunner <tobias@strongswan.org>
> +Date: Fri, 26 Jun 2026 08:10:16 +0200
> +Subject: [PATCH] wolfssl: Adapt to removed ML-KEM header
> +
> +The mlkem.h header that mainly defined aliases for the old wc_Kyber* API
> +has been removed and its contents moved to the wc_mlkem.h header.
> +
> +Upstream: https://github.com/strongswan/strongswan/commit/98b133c54c5e3f66f46a5bb11c9b09d06fdc8469.patch
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/libstrongswan/plugins/wolfssl/wolfssl_kem.c | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c b/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
> +index 042a7e70616..786aecab4cd 100644
> +--- a/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
> ++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
> +@@ -25,10 +25,7 @@
> + 
> + #ifdef WOLFSSL_HAVE_MLKEM
> + 
> +-#include <wolfssl/wolfcrypt/mlkem.h>
> +-#ifdef WOLFSSL_WC_MLKEM
> + #include <wolfssl/wolfcrypt/wc_mlkem.h>
> +-#endif
> + 
> + typedef struct private_key_exchange_t private_key_exchange_t;
> + 
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
