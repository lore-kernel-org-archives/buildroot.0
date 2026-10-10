Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9A6CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 233536067C;
	Sat, 10 Oct 2026 09:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OJXkmMFoUkr; Sat, 10 Oct 2026 09:23:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C19060AED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624212;
	b=cpqyVswHQuUbZsZhUKtUTidnf75rtNL8eFfmz0h47wp7DiEEKEqWjZUiZHwVG8noan3Z
	 /kI7PrlMYufdo4EQDDczTa+v4wq4vZCGk4JU2yZthMhBTEggiwAMdraMB9SYgTTUL35Oz
	 4AOG/p3drDEwE2MoaebIjPFbOGKs8KsVpnSTz6i+0KtuEG4RAfcO9ufCl5wbFghsR8Z6A
	 KzM+wNGRLh8MgLtdV45bQikyyFF5veMrBcpdlVNVBi5rV2J+cXbWf5KNaKdAT1Oq/MNRe
	 OADyBiQ+eDVquC1nOYXCUlAVE+hMgEnpP8f6Wk7p0x+e5UldpMkkbYsuzbOYY+3dHuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624212;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=O5yJK8ycyTuqUYNk9zNmD9HpbPFTzYksY4RYN12fE0w=;
	b=b+jXuB6Yu3y1Fw02ndJ9O2wQX9ubzDHHPJ8ThY06FsJmJ+BX65+293+amW5J1aVpRJ9I
	 rJv1CLLhZRoOLX0oul0eSud3hBBWHg9dsFlwQqzEutpiYBwCD7sBJQPZ/w9TIvXMWgd0m
	 msdFqu2YrUkUvvkf8hXPi4odwx9LyzS5arT5Rn6GLfh9HwF14eEN58zX/v9QYeLN7Z7eE
	 yPEH8t5uRC3Rf3DDB/MUSbYasICHVW8RJyBK4RSSuu4a60rvz127huw9GsIhwYoDjmvgV
	 8hDE6paCcOBtFSWXknOPn3CjU3nMq7hXUujhT/7wTbH7gluH25OG0/3Kv9t8xZunZcw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624212;
	bh=O5yJK8ycyTuqUYNk9zNmD9HpbPFTzYksY4RYN12fE0w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hdzGCIuT1HQYB9pPdgFQRM+QNd99Bbftvujo3cDQIDhBaP2M2Q7ZsSzsKW07iG7Iv
	 jKovvPHM3xDdqZonuerai4nTFlntwdwG2n0NHverHaZbwfWV8B3ByIYdr/IxB53f1E
	 9Jue50FXDdoVol2mdjGz0yQ4MAdlLKBXVFVs1OwQiP6SWEwCQXZIZxbPvTStscnTgb
	 IKBfdqfnWZ3SbodVm/djL/6z2WeWkLON916Sm2l/NdHRCLo+toKFhF2Cp7H3fKdpHX
	 n0EtuLp/33xSiqbEQ2gvpLDh/E05a1+M/Q/+IrzMKQp5NskBstW26kNZYeNzpukaQ4
	 yGVICd6t3U91A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C19060AED;
	Sat, 10 Oct 2026 09:23:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAA9A75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 905D640949
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qFTjREMxmpJ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 483E5409B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624206;
 b=W2P0nRy0z+ZxwN8QXrl/Y8tzQ8+NKeG77Z1oVX2v8xDvQRGvVDpokAQndthViwCHFwIc
 ScYkl9i7xEn6bJmP2EoE3JGxPxwq5lKEQ6P5/ayilYJKM5gH4BVHeAI+LXjuv6ACSh4vS
 jpT+MQrS3MTruulniM9E8Jl93NpLNWXrxnS6Oo8MHlYmKjmHNY+A8u6z0rTB9RUYFOP8l
 TPES3Kw/pLTEzsjIm8dKxfepK98SKDnGWgppzpIub/kpZIUWPA95VjgyG2Mj4NBUifsZs
 SlhxdME+PR2A+LlsABwGPFtdKHFcdq8zu4H3oneR5eqs/gybNKkg98DJSzqFxktcs5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624206;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=SVxdlBNooDJ1VZZwfOIKDHtZv7hqJWdHwiMk4+gO4rY=;
 b=GHRbNkGk11XSycclAUxDEmbJT7eUo/+0YNwfIf1FcCKvvnSMIuZuLfwKHXp9Yzlcby5P
 UD4XElyhtItRGf73dAXEhHQbQGeDTqSDzSmUYXvZy8UXIa2rcaCF8tzPgnipZVKKUF2oV
 XyGmH8hrO8AGGk/5X2LHAIwkoPYZOB2JHO/m35CIYsNdOyWJ6bOSYD8sJ3Vyay6/0gXt+
 IvgryZ/6e9gPZ9eoNLTLi5byPEWg4qbmbYzc29V/QJb8f0oMObVAbwwU3tSg/6Gdvn5yH
 s3mlVWuZNMHXcr6Sco3iDErMX088+0Dp6Mw7xm3C4glVqTq29Fke/EmPgl6x2xpSx0Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KvDaO1C8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 483E5409B1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so453093f8f.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624204; x=1792229004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SVxdlBNooDJ1VZZwfOIKDHtZv7hqJWdHwiMk4+gO4rY=;
 b=YZO9Xb3q76mXnBbiNJyWJUi2XYK+5gmBsfS0jm+oAnbUcFCbUQDxKvIeW/ICO/AEUe
 OTSmyZ98WoMdLvKVYjqsDmRTaRoZeB3rhaZto99FuQZ5FI/RbuUfgjqz8/IerQ+RsNmh
 N4ozHOzEwjZ6MJESqvCt/ekXGFm5nwY7A4FJ91J3b4dnF5KtZUhFP3ECcX+jgPolfBku
 THDAIpKxOipn8uISFOtZ+x8Ai8IIKQ/N0cyWSLTql8FbSHJ5y9RBSXmbo/GOxuvdP34e
 q2UCedyAy4UD5crwmr5J+kReC1irpcxkwoLeges+c7nNAgoRXBbghbpuzPHq8fL8Gw2q
 WdTw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwwlwemy6Zsf1It1KZGlgjmGyPsxZ9BbWQSnVl79NAMTNgenn2lpaFHcgGlpUdZWthmuEss2xhNp5k=@buildroot.org
X-Gm-Message-State: AFq9FYLufH/KrhMycI5bHho9Pau1Qg9KqUZjKWZygUDdCgpOxD6JyZQ8
 upWX7R/bacnOAXj99SGn9fM63Yvt06iTsb/T7ghoZzaFwbZipdp76x5IgMEesE0u6G4=
X-Gm-Gg: AYBFou3aD/lmcmyfjEWZ/y/IAgcjwenF43TzRcKc7nPMyRYTHAElJGhZOaJ7t6wJzum
 8nKnfVKU0hg8RjAPMX8FeqHEXJFde1rnEWusC2Q6U4lKGLJJBQRk0juotSZFdRtuThnGimxsYqM
 9kRXWkriLrkBkHs31TPPD5PtKQCAhfs24VUsSNjYaKZiSYCMRqIJ068xX3dHjEgdiU/c15i/VF3
 A9//FFTshXJ8zMVC8ugRXdS/grd7emj6qr0duoniVRiQQxoXk6wczc04BbChjH23P7W1RHSIiCA
 HRn8lRGlaXGmCMnDjK0gcWYBKA9vCqjPj0cmwU9IVPICJ8vhuQfIkyvF9u99EnJ+VVuSAMqXN2E
 1gfizw4DldPzGyiszF5LjAJZnsl9zA/3U0b+OyPSLy5wSBr2l/FLX6fHu/+sU31sJSEREMBkd5G
 734WGeHNLTFX1N05grBe9eSwrX880LQAySNM3i9PyVjNJlPbnmwfkGO5P/bFTACfJ/LHzrF+lhC
 WGvlyFLZ0QJ89BrR7yqrsozdjItNAXL/bt6PGmz6TsnyoW0yUFO6KrK
X-Received: by 2002:a05:6000:4281:b0:48c:67d9:ffe6 with SMTP id
 ffacd0b85a97d-48dbace4447mr6917188f8f.46.1791624203788; 
 Sat, 10 Oct 2026 02:23:23 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db94e33c7sm8662383f8f.10.2026.10.10.02.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:23 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:22 +0200
Message-ID: <20261010092322.139643-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929182124.1843719-1-bernd@kuhls.net>
References: <20260929182124.1843719-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: security bump to version
 10.49
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
> https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49
> 
> This is a security-only release, to address GHSA-r9hj-j2rw-4q3m:
> https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-r9hj-j2rw-4q3m
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/7f6b00c6fc3e1b174f043dccea4e226f93f85adb
> 
>  package/pcre2/pcre2.hash | 5 ++---
>  package/pcre2/pcre2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
> index 90991322a2..3d75858727 100644
> --- a/package/pcre2/pcre2.hash
> +++ b/package/pcre2/pcre2.hash
> @@ -1,6 +1,5 @@
> -# Locally calculated after checking pgp signature:
> -# https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2.sig
> -sha256  b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed  pcre2-10.48.tar.bz2
> +# From https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49
> +sha256  53c156e1ba416a20da8e65395daa132da0d80e76910424caca3fcdae7831d384  pcre2-10.49.tar.bz2
>  # Locally computed
>  sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
>  sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
> diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
> index ea841f482e..a3e74e32b1 100644
> --- a/package/pcre2/pcre2.mk
> +++ b/package/pcre2/pcre2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PCRE2_VERSION = 10.48
> +PCRE2_VERSION = 10.49
>  PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
>  PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
>  PCRE2_LICENSE = BSD-3-Clause
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
