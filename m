Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147D5CD4F4B
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A046155E;
	Fri, 15 May 2026 13:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHC6AUQjfAtT; Fri, 15 May 2026 13:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA83261545
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852003;
	bh=ps43YVuPEhgvDxeEafDLHh4VH13uTqN9t7qYEdQobNQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gynYmsAABN84XrlTHtR2T34HWZk1TXZvp7WRoyNdiKbNODwwsc6Of1/Hy0EXTYIJg
	 N+Zqqk3q1lmkIMyqYlpuLSP/i3m+yRu6Q0sI3EH7B6oxq5BsoxFacaeahqSHnp7EdQ
	 r54utKMUw+PkxcJ5OPbY4GuuNJNuObjs5EESmUR6SI+nCCbPSzBJ76QF/WO4lZm14w
	 w7yv/OPnJKtWC58brx3m9RlPdcdlru/wEKhNCts27XFA6ZvfCce9XwVlMUo2azgQWT
	 BW3g9IUgJZZIlpcfVU8camskuYnZvbZnk13WMARRD/ZONBpNe7KJmrC+ssJ2mZEEDT
	 +zxS+DrSuwtZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA83261545;
	Fri, 15 May 2026 13:33:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5BB436E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBB1261547
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqbv4wl4hnzC for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9AA261545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9AA261545
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9AA261545
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4526a8170ceso5163686f8f.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778851997; x=1779456797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LzkIsSc4d1ZgsU7UD2XYzB45H6nSNYI2goggDWci4ME=;
 b=XdQREh50V9Ys/W+1SZFdd78cvtp1Cwc2YwQDQukbTBiS7jZB7hkZh33K6E2udjSYgg
 4W8DCQJ2X0c4Pez6dyF+spwL2H25afUTqu1DHwl+qQgQSo6cYB1uvaBU17OV/Cah+YjH
 QbmhJK/58nPfwoVYeOImfVo0avS+f9BzWARl4E2dU+O4Uth9wYHAZXcDD66V2Z+khPfy
 3W6luFkOjWacIXLepHrMtqty76NvjONNq8a/Kccsjki2yS/q0Wt0bD54pWDn2rlGQEur
 wJ8NWx+161UrnQFms9Hw/PNJJomFmObVmhFjZv30g7fm7W5mpPZivontctHe4IepGdO+
 9pWg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8HFLjrE3+aBAAham7YuTt4mLaMdDo1h4dvYQZaIPsSkdSdKRbRCox4FCBr2OTe34cKNTvsnhmyVS8=@buildroot.org
X-Gm-Message-State: AOJu0YwkXXyeiISTy64t0w47RVNRXM2plCzgatNquzZ7tEpmuEbN1qm4
 hzp6d6wI/Y/lVbXW0ykXv7zF9IDMTzJhdbDWG7T4k+W7mxswB+hu6OGB2rkcoDntC84=
X-Gm-Gg: Acq92OEwoY8iCRFk8ncnmCggiHu2wV+lxV7HziISfdFyeEwnOy7C/VrpK+v7aJU+iQj
 3LUsF0QTV79h5CIeCXg7GKgyEq9f7jd0GsRmbjPPcjppedmjC5LW1EwC+Hl2RGtOIc4XyUP81Bx
 HSqKnNfKZ/ndHbj0xK69yfGsj5Lc3UaNWniXesiFT2+sroCd3t6+8Km+Pt6PMPTQbSDMWHnFzKq
 0pRnEgcTiuO8lX5GTRbY353qgO8vM0/e6DUTd2/A2m7GatnUAAvtFiQojN0sDy7UXSXPQ43atUD
 MxYPgbpal0qKMBQrdFFO5HPc6gU1ZJ9V4/ooTbXIWCz7OSibZswmdQWvE8jj4ycoQdbL9VFPM8X
 c6RA3Fux2wnpC82LHbjRa5zdjwU28mmkki8PCUwEKYAIg+ZYdWA5wfol7IyWwdTrTfwfElwErdk
 eaW7Wvb4z8M+9ssMgIpA1t/3p+YQmBJUSQVuK+9YExjRS1d0gd3+9lBq0=
X-Received: by 2002:a5d:5c84:0:b0:44a:fe14:3738 with SMTP id
 ffacd0b85a97d-45e5c5be136mr5189473f8f.10.1778851997511; 
 Fri, 15 May 2026 06:33:17 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe0fecsm13879900f8f.26.2026.05.15.06.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:17 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:16 +0200
Message-ID: <20260515133316.314843-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251014211145.120019-1-bernd@kuhls.net>
References: <20251014211145.120019-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778851997; x=1779456797; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LzkIsSc4d1ZgsU7UD2XYzB45H6nSNYI2goggDWci4ME=;
 b=Ys7MFoM+HbPFpuZRcXi+G6dCDdx7tAT+8jqBcBEHIcLpUKDp7yahWJikSkWi+Tde8D
 9eAblPwJ9fykGe+yfLgCkvRWuQDyl5aEIaBhAc3FfOLa2qHu5uj6jjoXR/Ya2gC635Rj
 ktQp0b/C8iILeFytp72mHObFJWntj8ZUY963mF21c5Lb1BbQWVmVzy/ZWKlN6zeYQzpo
 VIB+osMXs/T7v0axpIImD65ay+qAcNm23ENGfy8aw7TLp8z/1sUb7EmCBVCcK7ZLiWEj
 s1SCfjc9MTTHdRisCwpQd8bpAhJThC9j1sSayW+wMq9h3F2sPB2ziEBsKGsB9hfQHdc6
 U5sA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ys7MFoM+
Subject: Re: [Buildroot] [PATCH 1/1] package/libsodium: bump version to
 1.0.20
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
> Release notes:
> https://github.com/jedisct1/libsodium/releases/tag/1.0.19-RELEASE
> https://github.com/jedisct1/libsodium/releases/tag/1.0.20-RELEASE
> 
> Updated license hash due to copyright year bumps:
> https://github.com/jedisct1/libsodium/commits/1.0.20-RELEASE/LICENSE
> (1.0.18 was released in 2019.)
> 
> Needed to fix build error with python-pynacl 1.6.0, currently under
> review: https://patchwork.ozlabs.org/project/buildroot/patch/20251013175513.86276-17-bernd@kuhls.net/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/libsodium/libsodium.hash | 6 +++---
>  package/libsodium/libsodium.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
> index 37c1a620b6..ae4765a2ab 100644
> --- a/package/libsodium/libsodium.hash
> +++ b/package/libsodium/libsodium.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking Minisign signature
> -# https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz.minisig
> -sha256  6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1  libsodium-1.0.18.tar.gz
> -sha256  dea1855c9809f3faf22aa4a1fba20ec8af5a5587f23115012e5b98279cedc4af  LICENSE
> +# https://download.libsodium.org/libsodium/releases/libsodium-1.0.20.tar.gz.minisig
> +sha256  ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19  libsodium-1.0.20.tar.gz
> +sha256  43964d976a6db3fb986af689d05f8ca0e9971878bccae709750dac8fdc4a99cf  LICENSE
> diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
> index a8e0f79149..7dd763e145 100644
> --- a/package/libsodium/libsodium.mk
> +++ b/package/libsodium/libsodium.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSODIUM_VERSION = 1.0.18
> +LIBSODIUM_VERSION = 1.0.20
>  LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
>  LIBSODIUM_LICENSE = ISC
>  LIBSODIUM_LICENSE_FILES = LICENSE
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
