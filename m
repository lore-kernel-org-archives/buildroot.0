Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D610CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 444E861C78;
	Thu, 21 Aug 2025 19:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uj7T2aXGmkbq; Thu, 21 Aug 2025 19:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DB2F61B31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DB2F61B31;
	Thu, 21 Aug 2025 19:22:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 577AE1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B59E61C45
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQStsjOvqe2l for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B73F461BAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B73F461BAB
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B73F461BAB
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45a1b001f55so7288345e9.0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804090; x=1756408890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrwLVnccfojZQnzBo85awrRGRa8z0L7BvF2ZdadKVE8=;
 b=mvXA+Xo0T87wMrs8Au3vMLe/7h9tjKrPEOSnQKwR5irFlSl7msVe4Pe60mmCu9KXta
 I/BfyLTJyKUibRnyfECNDFsw8OOEEVpjhbBrH6H2jPRV0TBKwT9D9q0WIROr+T0N9zz4
 Wf3JTBVED8+HBd4yDYZ0Ns89jlO2vanrQJBYaMwjE/ZgxaLLA+hhF+BSDLBygdoOqe24
 FCCChQZZ2zVKLdcqBdJ3Mt14t0wWHXn9e0tOSFThpehjdNDv1iV40gnqcyzVHQA05rNM
 0S8MlsUUBnXmuUsbcdLF/GImM7qpmOcxIEagl2eNMbahI89nkdnhxVcIv/BQCdVaxAz/
 RKsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+hVU62s+KWYeDtpiy5bGkgDjblPWw0mYgXrt9NRgwuutlDT8anGpPitAcDgsM511i4LppMeDEL08=@buildroot.org
X-Gm-Message-State: AOJu0Yw9Wok2Gn3Pa4b412ACvGxaW3sVABpwwUVzXp6w6IOg18UKhN/W
 mue2mzm/gxsSI7D3mG4llngxXzzOhDJ1MMuzYHoCq9SraySxmpdIVFpW9KmZLqi17HzHPc3SsBD
 a8oWg5g4=
X-Gm-Gg: ASbGncv495x7iALa3J0bc1F+kQUht8DTWkRRW/kMb9gbRFLMm2KHQ/n9D/y1DE76QKQ
 9GuOaeesI259QA1T5LTTtY5g5Op6Egy26oB/jaQ1Hj1N8OKU+TAxgT249kvTAM0nzWmKMiRkorh
 yxKo31j9YA9O09IDPNV1Szq8euImQTUB5W4Rk2h6ic01um26/Q5gmxqqgJ0OLOeUaxoEzYt3IA6
 tiACk/89GA6KJGHhErOwGZe6zKUWPKzj2HgGvIa2FhfMHk+z2hUkfwwSrFWmuYKENCApz/f61l8
 K9t7Rt2AtTN1Q/4BJFrez9W03Zb3dRqLr9ajHabmk3ArK/S3aiyuHIDTjYHTCQv+mYEvlaJuLBS
 0lQoxGVoY19uI0V/7usfuJ537
X-Google-Smtp-Source: AGHT+IH7U2zGb8h+Mvjx8UUBgkiQT4FZY8hg39pLSLPZkvYnZVrceM96Bxl8nSoHwvnNzwoSgROAeg==
X-Received: by 2002:a05:6000:258a:b0:3c3:e0d5:b59f with SMTP id
 ffacd0b85a97d-3c5dcdf9b7emr92150f8f.43.1755804089735; 
 Thu, 21 Aug 2025 12:21:29 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50e3a323sm7364125e9.17.2025.08.21.12.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:29 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:29 +0200
Message-ID: <20250821192129.24871-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819204443.3155790-1-peter@korsgaard.com>
References: <20250819204443.3155790-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804090; x=1756408890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrwLVnccfojZQnzBo85awrRGRa8z0L7BvF2ZdadKVE8=;
 b=R9kv0jOwyblmrB/19Fdx0e5bj08ZWq3s6ugGXWfTa1utuLfBS1lJcrBGBKXi8SGfqE
 93xFKkIRBN7Yi/YjpDwIo3TgSb39K5a+/jWF3xmTHxZvDa1eprlB2npBf9IXkIq6t0ia
 9KDf825QIjagCQvRAzQWj+TW+S77z3E9ygwjl+6k4StIqUBWuJQvacImaXwB2sMpVQLd
 DZix4gpOArQjDG5BFiJDM+LZq6h2ZQ5BH/B4Vs1SMFiobZlQ9urHfGum9zPlTj6IPH0+
 7x7D1rmiHl9edTkWF2yKeuBN/k6P/DaXhcmklLRijOyCxEB/rBx1NKItsARt5zDXN9ft
 UnBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R9kv0jOw
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.23.12
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
> go1.23.11 (released 2025-07-08) includes security fixes to the go command,
> as well as bug fixes to the compiler, the linker, and the runtime.
> 
> go1.23.12 (released 2025-08-06) includes security fixes to the database/sql
> and os/exec packages, as well as bug fixes to the runtime.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 62e0772e2e..dc88e9beab 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  800a7ae1bff179a227b653a2f644517c800443b8b4abf3273af5e1cb7113de59  go1.23.10.src.tar.gz
> -sha256  ded3c0a8d6d2a0ea5e7599c49678efa05cda139d31baaaf7d8d536a9e4cc19b2  go1.23.10.linux-386.tar.gz
> -sha256  535f9f81802499f2a7dbfa70abb8fda3793725fcc29460f719815f6e10b5fd60  go1.23.10.linux-amd64.tar.gz
> -sha256  bfb1f1df7173f44648ee070a39ab0481068632f595305a699d89cd56a33b8081  go1.23.10.linux-arm64.tar.gz
> -sha256  b6e00c9a72406d394b9f167e74670e28b72ed559cca8115b21be1cb9d5316cb4  go1.23.10.linux-armv6l.tar.gz
> -sha256  8fb94455cfa5e9a5e8af2bfbc7323a6fed2dabaffda1a69dae5dd41b669bbb57  go1.23.10.linux-ppc64le.tar.gz
> -sha256  7d0e8651eb54fce5cfe2d4b412ddfa50144ce21907f72192a6549ffe03db4e1f  go1.23.10.linux-s390x.tar.gz
> +sha256  e1cce9379a24e895714a412c7ddd157d2614d9edbe83a84449b6e1840b4f1226  go1.23.12.src.tar.gz
> +sha256  3b2fd446e26642555d1446a38ccbefb2a30bba3179d3ef132ed64d3c63b0c42a  go1.23.12.linux-386.tar.gz
> +sha256  d3847fef834e9db11bf64e3fb34db9c04db14e068eeb064f49af747010454f90  go1.23.12.linux-amd64.tar.gz
> +sha256  52ce172f96e21da53b1ae9079808560d49b02ac86cecfa457217597f9bc28ab3  go1.23.12.linux-arm64.tar.gz
> +sha256  9704eba01401a3793f54fac162164b9c5d8cc6f3cab5cee72684bb72294d9f41  go1.23.12.linux-armv6l.tar.gz
> +sha256  1a7cc5f7baeaf39125dce5d660a39438e7f0e04d13d3498590d240aae976b565  go1.23.12.linux-ppc64le.tar.gz
> +sha256  2f43708aa0922d692da0a1fc775475c343907610bec77002de1bbe37601ea338  go1.23.12.linux-s390x.tar.gz
>  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 744bb0d3ba..69ca746783 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.23.10
> +GO_VERSION = 1.23.12
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
