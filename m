Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29241C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EACDF81340;
	Fri, 31 Jul 2026 12:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByQEExpy3qVd; Fri, 31 Jul 2026 12:05:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A8C8133B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499541;
	bh=d5iKesms298ypS/9X7rJlVhE2lEksg2r5v2Mqruuefc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W1frf46qTLPxQ+tvVZJnxFXbX7NvT580HBTSSp9aghK9UfwJttcTZGkRDyvbP2JQd
	 7MikIgs3dhb0TrBLZotsd+t+ioSnjSUtZGbGjd8ZKu3glhwM3Zj16QLYf+wk7GZP5z
	 QlqqgSm0koKfXyyjVz3etrkqSjtJvrNf+yuVNHB4kIAFLVUI6mX5tRLYzIC8PVZSPu
	 EyB5wFjLnao7V04MnAcE3WwXPlSWXm+E9RhOhd8ckHwcECgJiwg0BR7JLidsd3OCb/
	 otjPbkF5twGfS4hVlujeQGN8pxYEp3K0x9HJawWT81BBKSz4eX2LrKGYCnFSwyiJFO
	 gj4zkk6rTP2HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21A8C8133B;
	Fri, 31 Jul 2026 12:05:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D36A27B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F0038133B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Me-S5egl4JwF for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21D348131D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D348131D
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21D348131D
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so645381f8f.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499536; x=1786104336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dH34JFz8ETBv6SyTln/mlVyeJBlUlZCkhkcZb3WoNAQ=;
 b=MBKQDwP4KfIaOZyAOHOr63PO/gEBsVvtoPgy/EzS5038V0AfYJV604PVqIVGzUWgcI
 hLB1bn0VzkTgfNAMTfaG46tCbAa8UFF7ocbQSpZ3ys2tTPRK9eqjqe54Svxx6hviXotU
 vnArd96eQpwM7E+D4Z1RYldVpxPgzGA/NmkCyU0yd7qONaFNt5i5J47N2MP5cS0htt7T
 aaJbi+XEQsjgjV0M2rzR3vadk+gYjOZV97U51n0a8/3+w5wT8C5g1NzT1R5ESNHmDTXX
 Wwl4jD8fDTKbeGbeFGWtJzGWIDzHmkKr1R0zFMdVpHheVUUZyQV23ZRlpefAUI9ZajQu
 /v6A==
X-Forwarded-Encrypted: i=1;
 AHgh+RphrUklKBkkRTvpX6D6LNMrF7d0y5FES9XfcXabd56BXcajutzBdq6MHN+DlXaLy48suXWMASXDwFk=@buildroot.org
X-Gm-Message-State: AOJu0YykH0Eevg2Xw/INDIOzCOaZvjOxZnMEYubz/ouXRb8LIfjGmd6L
 RKQdBzpLFd4f3VupW2+GL8nqgZQx9C63RqQtnn8AjYdHuYdyrxAVhMCMXPx4MMCiwDtjZPoMOeL
 Pi7jw
X-Gm-Gg: AR+sD11ua9yC0uXWQO7kWSDJXiA81O3Ga3wQUUsTkjAFb2jlEkRC2MQfFsq44ZvMKao
 a6ZdAwQLKIcY0/XEm4ITPq52uYBTNx8AbAIiYCD8P6gSxNDDKkmVtAbaJCbVuy63tGhuyaL1Gs7
 yqfDkIjOJiQNDgli1e70oxlPNssu7K+exSBK9WzNb79TBaa9eJAh0KoUT6CLJI399olRuIsFcUb
 YYOnahKPbBC/vctjAxZdOM03nJixs9hth7WDWbdJzwrRoORfeUdc5pODTXR+29oIfwKpYDz4r0Y
 So2d6pJ0Fs00VBKU5MrXnpssMCnAgWSCEh7AZ6arqYsuYp78wnXUig7GrI5Ao/RPbtW547A3vyE
 P3t/YuxzO69kCcs1hAY8eXLGxk9qxCVUawqBpDEFCzbvDmIxATQZPJNIS4KrgOjePbi41f5hVtp
 veNATDzX+LiuvmoPCOBwS6FPkGdw6DX+arZBRKRxsHVtekHJPuZoOiHNU79cVg1FTscZmSMMy/0
 QlH/xMGCRqgUr9yhjnGlLjypMQ=
X-Received: by 2002:a05:6000:98b:b0:47f:80e5:b9b3 with SMTP id
 ffacd0b85a97d-47fd2b42168mr4273128f8f.33.1785499534680; 
 Fri, 31 Jul 2026 05:05:34 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456a6d7sm4254884f8f.19.2026.07.31.05.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:33 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:32 +0200
Message-ID: <20260731120532.3747-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722153224.624762-7-fiona.klute@gmx.de>
References: <20260722153224.624762-7-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499536; x=1786104336; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dH34JFz8ETBv6SyTln/mlVyeJBlUlZCkhkcZb3WoNAQ=;
 b=Bd6dn1djZ1C4MaqTToXFVlM3XnAVSuaYfwP/197OlxoGqeD+sSE2JRlC1W01cOa9aj
 3qC+0ICxoRkYNB/NFSGBVZ6+v9irP+ayb0JJr8/8KTczIhc2gUh3KiIHefZhPwK1uu5Y
 W4BY+fr+GpYdTMToojBWFP0vnsYI7SnGeJadMoh59KdwY44NHbJmtiDHCe5SGi5xFJId
 3S9gdN8HYWcm3yghusAf4GvV1oMwfOSbUWmQ/01KMknEJECd3a9Eue9NNst9QVSeEgrY
 eh4hpuRH80b6xSsMYQWeMu7UVb00Xe0cjLTk0v3KUPWJjlFpxIVs8fXNSEfZ+QUv+9dS
 pfaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bd6dn1dj
Subject: Re: [Buildroot] [PATCH 7/7] package/binutils: fix license
 information
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
> A few headers outside libiberty use LGPL-2.1+, too, and other headers
> and some scripts use GPL-2.0+.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/binutils/binutils.hash | 1 +
>  package/binutils/binutils.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
> index 14fd65d4a9..9ba6689d46 100644
> --- a/package/binutils/binutils.hash
> +++ b/package/binutils/binutils.hash
> @@ -7,5 +7,6 @@ sha512  a5c65e56e400ed3fb8906a995dbb93eb5bea54b16344244653d7f44ef29ceb60270da263
>  sha512  46c336a16bde7b73dc4ceac0986887d47d542a1452e1936ef871b5e76afdb6cad4b18ccb4d93341358e7bb92c2ef74781e1fb72935d527d15251ac9f9daa8305  binutils-gdb-arc-2024.12-release.tar.gz
>  
>  # locally computed
> +sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
>  sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index f772c9cf9a..f39d24e986 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -27,8 +27,8 @@ BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTION
>  BINUTILS_INSTALL_STAGING = YES
>  BINUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
>  BINUTILS_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
> -BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
> -BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
> +BINUTILS_LICENSE = GPL-3.0+, GPL-2.0+, LGPL-2.1+
> +BINUTILS_LICENSE_FILES = COPYING COPYING3 COPYING.LIB
>  BINUTILS_CPE_ID_VENDOR = gnu
>  
>  # 0003-objdump-memleak.patch
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
