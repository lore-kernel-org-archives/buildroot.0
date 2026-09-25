Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA02C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 123E9813C9;
	Fri, 25 Sep 2026 14:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeK6CTiTdFrR; Fri, 25 Sep 2026 14:46:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 34D0D8136A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347573;
	b=EPxcTWYs1kx2Z/ck/wW0s6Zo7RTIePaIjGCNYy/thBdALz+uSY3xANGYnbUjw7g5T9UE
	 eGNQ0LMZPSmJlQEBycMlnsZrtP6IXzMHnD6WM6iGHy87peCunk4ZWc9iaBTKsaP0GF6Cr
	 +1M8qnv0RlZ2CvHQ7LExQs2hl6sx5CmJkYoNg75hhvLk7iEb0BOMUkmhhFfNyWa9wcHVs
	 +dhurGtdOcJs7suudUssJvwYzFUl6IE0rJKPwyGUxyKRBRmyFV70i9CF78w5nVE0Cew5W
	 RxQp6QkWK5LHmlIIeZV/sFh+0pcK8bVAtY6Bdgc94HCFGUDAu4yk+qaVuUZFqS6J2nA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347573;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xxqlXeLpapIY4jG4hF1ICZkKdkNF5r46apbgEUuhyPM=;
	b=QOd5CkrHkwG5h5kGcmOI/SwRrplwXxeJ+6XGcm/uHG4omwljP1kMffOmFFUQ+bYgCJDk
	 1r7ZVqiiMOqakJuDqQV/07qWrqgn/pKko9pY2xC2gR46CW13tLEAN6ayNGL5m4s203rxT
	 xdQ1Zig/8ZyV/f3qXDbGntNdhx0E/0WZdMGNfzhbsXQhWW4wOBxIWr0uglvGQNB6YiDTv
	 6r8DrAtHQin3uZBh9M+g7J55KV1wJk2CniCcbIYFU7g8OGQ5kFkqVSACAMIuto9n+s6vk
	 tdcEIewswKT4GIdC4GZIAaEYsxcdBnnjlXoMkU6pGiUAUPicaFOG9Be2cBrlVxdUjuw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347573;
	bh=xxqlXeLpapIY4jG4hF1ICZkKdkNF5r46apbgEUuhyPM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dbt22AM6h017aa4Gu4ZYkM2VGsu2P/+ZWha7s87JyaK0JQMCdcJUyl3RixlkQCjSY
	 LN4RnpWCNCi6G0R3VeO5XIUUmbrI6XhWisWna+w7+uNGxrI3wLH6rnDUvp1ap4rj8k
	 Tirh+hmmSnYiFvaZ6//Qu7p2QVE9hEPoF3TXMlWP1I82UwoIU4ffFvRpS0lK2ttoAB
	 lz3jOb9hT2EOjTzR+pZrjewJWYhRn2THSKbECLsuJ3j5DI1FFKeZ7IS2N93vS88vO0
	 +cU8Rh3kktcyyumgd55Thot5CRhOtEBtYEw00/gcEdZwZi2qh2zGfxAi+QIoRw1BPE
	 iLgsUCw6xO/dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34D0D8136A;
	Fri, 25 Sep 2026 14:46:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29C40332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FDB660DBF
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPKlsmjBqH7K for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1F33560D7A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347568;
 b=figw03Cv2t/9ovDHOXmumn3lKBc7dH6XR1gl7dw+qatuP2oYPYAHuNp4AyE2eB+LJwS5
 LosKaED+HKWOcOa1DfNcwsJngIe9Bh9ymb0CYcfDXNLeFLXGu02l08XGGrpwHiCiJbHW9
 E1ODb6NoEtAjPDYVzCGlhLi63uBZX/h7aAMjlL/I7YSl/VDi/oPxO4pgmL4dZF0SvL1Dt
 3gw/TbThF6D5vyly6vrw5Wfprf3XFXGoMWMsTvuwZg8FOZHUhigUPqSa1qGSzTsIdxuY4
 T6EbveA9JOTiyI0u/LPIEF8lr+wYJn4RxTVaJ3Cj4DOJc93yDbU8oiPN9Wz4BG9u90w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347568;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=FOyRYsw1wKV+AL01xzB4J78wYUPo+xqhO0UOCJJQxLc=;
 b=f84u1dMEQ2Pov+dn3NxOaDzkjZRAR3HbPvfySGEcbuux5dnr4e8hbIIZXVYGfesRq1mC
 h5QsUO8eVxa8iXzrHygPRr6oQRH1KXKf0V48/erOvK3AY0kKfUETT2lgOWP7q3zb9zvfz
 vy75QOg8Jiq0TRHizBwM+N6bqjYEyk9DJKOHvfp0ZFrhyJ/Js+YwmINQs9ZqrvTOqB6c6
 0pQx7LYgOi7fRed+Pr6ZdLDAjemN8kOL41LICiYPLHmXhbxm1IlOeH+Lbf4wfEqfz3blh
 iSlWbTmY6e4Agp3BygJCAHpGThqC9oBgyGuxU1fhr/mJKhcuBRucAN+ZUFM7jZXFP/w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HdJy8xih; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::13"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::13; helo=mail-wr2-x13.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x13.google.com (mail-wr2-x13.google.com
 [IPv6:2a00:1450:4864:30::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F33560D7A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:07 +0000 (UTC)
Received: by mail-wr2-x13.google.com with SMTP id
 ffacd0b85a97d-482f6350f89so628119f8f.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347566; x=1790952366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FOyRYsw1wKV+AL01xzB4J78wYUPo+xqhO0UOCJJQxLc=;
 b=EKsb/6QCvZoOjRPZJDxaUSh7avYPzb+pA2BsaqSrOENf/Qo2QG8icw2w+XA//ILHAR
 M7H/1IuS0tTCoH2SaVBBhcSs64BsTJyDt17YQymoQcAw01BnVJz9e4bPqxtsW5gckNFd
 1cgz8QScEVSas/C5pMPF7wW6PdRswbAI+ToKoSmguBAyGHjUx7JDI0zhvEHh7P88UMur
 Yi6c4CD0Q6wNNJ4tc3K2rtLSugdaw0t1dUXPW0xN6zTA5dqXOeqmkiRWljx/yAh0nTN5
 /ScvSe9ole5BnJaCe4czPC09SQp0edTF2B1Nt0ou+LPfJU9BkGLa/KBFe9rfjt2vdPXs
 rgCw==
X-Gm-Message-State: AFuF++nVkrsgY5q264UZuF7mUQcfEAVA0R3iG9xqkMuxT0/ioVKS3KjG
 ZFrr/hGJH8xxc8cEPYI3WsXRaO6awhYsKhp0nXExzT7Is1PMq6OZusnvbTI8PbzxoCodX+sEawK
 vS/IcUqZw3Q==
X-Gm-Gg: AYBFou113uO/HvP6g2Z0YNE4D9VwGXNbj+3BzDhf0BhtpoGml/Ke0nREb/GT2y5Sq8D
 j8JD4LNOO/BYKGvZ8MtTWjobPSLMBDjk1pGQKfCLGFnqxqvvgSVT2IsKccVr/5rhZUV7xLv+UCU
 t1wBR3wNSoE51mAX3j0G5FZSbBYTfgXr2Yys592PsVcenmeONYFLYyHMx+JvAPj5VZblxWOEiRx
 nnsB8dkp0FvRonEL72doLi0XHNrVmvgGvduVq2TZkFu367v8EkKWGl0LuTkUxf1b3Aha1NklIPP
 vFG/E+31V5lymALPbMY5L8faXlI9QDrGe7HLFZiqOhgAQnx2IH8cf++ZKTKdH09n04+c3zSpd8J
 SH7b0m/e997UIPGm67lpLipw54qQoI7k8yL/q1y/rwwF8tubgV9m+/WyppqgyFAsCMn5g/QAk9f
 lZQQtqTtncLHZQoT6li8ZDVUbBx+D7iNGfuMoFHc/E4ydLLfP+nvkzZ8rMpou6kBnlmYtKkZVJ0
 CykDxuF/tnxztkZFiB83Zi3WtsFQ+UEw7bUUsa3wg==
X-Received: by 2002:a05:6000:4607:b0:487:1646:8740 with SMTP id
 ffacd0b85a97d-4887db2d06dmr4163286f8f.29.1790347565975; 
 Fri, 25 Sep 2026 07:46:05 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a354d57sm7245390f8f.14.2026.09.25.07.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:05 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:03 +0200
Message-ID: <20260925144604.4098805-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916194222.1478392-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/bind: fix Config.in comment
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
> The commit should be shown when !BR2_INSTALL_LIBSTDCPP is true, also
> treat BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS as arch dependency.
> 
> Fixes: 54f96add94901511862df18e527e456982005b8e ("package/bind: security
>  bump version to 9.20.24")
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/bind/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bind/Config.in b/package/bind/Config.in
> index ab8ddcd0a2..4eb024b260 100644
> --- a/package/bind/Config.in
> +++ b/package/bind/Config.in
> @@ -51,6 +51,6 @@ endif
>  comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
> -		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
> -		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> +		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
