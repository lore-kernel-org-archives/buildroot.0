Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65713CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F0F40FDE;
	Fri,  5 Jun 2026 12:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMtqiU0b_0ME; Fri,  5 Jun 2026 12:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 391D541256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663760;
	bh=7W3ZeAeteU+u2cXUc6XIRvD4u3y0V9uK9JaRBa4M5xE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g10y2i4Tqv0U1wlwMiGr9o9Zs8t6/SIPh0whpAWBgOP6bwRK2weKwcgbFci+1pbKn
	 tytHrkkbFwLVOfTRtqQv7QJK0gv+DeC1Gk4Pwqx6Wqh32KXK0JTXwMdgClFZv/a+PJ
	 MEqx3iKc5VhHBd0ILKCnwoLXsdOksG1IOv9yL1kWxMmEzYCOKXvc7G2QewG4f46qOi
	 frvlCSYsaQ423zJNbKBQvQThAZoKkd8ymu7cc0pLFzsmPSWVGcj+n2YmxxSOSrb3iM
	 9pGMixXNTP2Em8GRhDwXDrFGY3Ab3irLsiqcoZgKw7qx8rp3/EfP2+iGyEPiPYyzo2
	 Yf0OcgfvSnYlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 391D541256;
	Fri,  5 Jun 2026 12:49:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8632F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E05340381
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BFs73NVr8xs for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7039C4037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7039C4037E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7039C4037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:17 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso20488965e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663755; x=1781268555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=abIdslBcL+DVPuam84o/qngLIPqs7eRV8Fw531GHEOs=;
 b=lYGGB3cJHpRVpat+V4hbptKTK4j+kBkoHLg2jWsoFsXyHpqwW9UtBsYtGQ5aR+2Em4
 h10f16IlmJiqKVsP0tpi9Wg0NFzRHC/dPBf39UXCqsolpSmdsXQJ9yNy6lDtWSHQZuzO
 jSSxq+IR/hdNUt2vGUqyQrYSA6uLydlnmtcrdnjlXAVzEYrWC40ateVOs6B5+fjNDfMe
 cp52m0w8iSEU8ZWtcfhrDFPlq3Ermo0O2xUZzL4mDxQNfwwPEo43S+f5wBy6psOzM2eh
 klTypaFmLvYOyKvd8qoA80MIhfDBFDs+uXLxv9669jm1cnhNcy45AYT813wW+mjdMc4t
 +p0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rBZ0sBOQzrGEd8Y4+Nw3u8zyLW382ijY44fmDsrUJDs1QmxP6myrP3Sp2B9t2XUFVguqvIE9EP4I=@buildroot.org
X-Gm-Message-State: AOJu0YzkCea5wkDeAEqa1Ywd6UvbeJZPtYshSbJQBiSdN71Id93LfosC
 oBhTVjzoU/OabICnWCbvFVa4HkzcDiLOPoXLna8og7JmzRNbPu3Eaw5nFCvqanSq87s=
X-Gm-Gg: Acq92OG3Ktqymw0AUaAMzif6ZEV98omvhNmcGG+qmdqC00sV//5xmiW/iK/ogqdI54E
 Kw/NmmZwuKtk4gwY3Go+1oEh8/mmttfwTa/tgesSmJJ71A3smnXWxZ0iaKjGKDg1zX9mTEeCkWv
 oriV2XZurAxqCPrcmDLdrZfo2kPZ1ddhKet2Jles4mLibSmYNsRQUXvNkAzevnDPv1U6wsMDcwd
 GkUjIZVXtLEHaX/dOMa3hzvhAZajxpXCar8daQnkOOoshwdDrPnTVDkk686ZZUvdYDpPMKBtlX3
 ZBixFcafMPTbEiysZ/gij3ys4MCaKRXSAJOuwN7+wR6Gj6+IUegfgfQsR3AbgQDOAC/yHvsGQNT
 u/OO57zT42O1gKz6WvHXSzzlbh/+WLvIxUFwzSuVNkVZK12iFmNJNy2J6Pq7nAfoi8wIp7UpjH7
 yoBJAToTvmLSRwVYneY0eNfpbnzw==
X-Received: by 2002:a05:600c:c491:b0:490:b9d3:a9ce with SMTP id
 5b1f17b1804b1-490c2606a1fmr55693295e9.30.1780663755218; 
 Fri, 05 Jun 2026 05:49:15 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc39eb04sm154957805e9.6.2026.06.05.05.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:15 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:14 +0200
Message-ID: <20260605124914.270585-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260118140107.2331715-1-bernd@kuhls.net>
References: <20260118140107.2331715-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663755; x=1781268555; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=abIdslBcL+DVPuam84o/qngLIPqs7eRV8Fw531GHEOs=;
 b=KyubcxBH5u90Zcyzam1qJRXdSjtZU3Nw42fUgxR5zwcdcg5YoEDXTvGqXLYtHfE9D3
 o5MZ36pwYiaJbnVIiSwAtdDGAdDx1kedzicf2zY2lrL8qMwUaaHda2hiDujnrjHlBRzH
 tw57+Shdk9TZ+4p+2QnbFt3iDhe9zdDi5eIQf01HsrF4deGpwcoKgO3A5G3+EYNtLhS3
 pogdxmRb7QOjP07ecIZuyS1D6/R9sm+hb7BFKHrqSTjZ1/7JPpvNcogYwdbtg1OUixdC
 xRSWfx3tRtOoqh/FgOVEQGb13fOO3WhNJiCsJ9QJa9+84DMGQQGs22YyL7cWJcJEKu2G
 Xx7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KyubcxBH
Subject: Re: [Buildroot] [PATCH 1/1] package/lua-sdl2: fix cmake 4
 compatibility
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
> Fixes:
> https://autobuild.buildroot.net/results/f75/f75d1d0b83c90c0cb5dc7781ea8ce7ff1d67512a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  ...-better-FindSDL2-based-on-components.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch
> 
> diff --git a/package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch b/package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch
> new file mode 100644
> index 0000000000..ce3a96e5a3
> --- /dev/null
> +++ b/package/lua-sdl2/0003-cmake-use-a-better-FindSDL2-based-on-components.patch
> @@ -0,0 +1,29 @@
> +From 8bb1cbb2b346502d6285a40e25e52d3e41551afb Mon Sep 17 00:00:00 2001
> +From: David Demelier <markand@malikania.fr>
> +Date: Sun, 24 Jan 2021 14:28:15 +0100
> +Subject: [PATCH] cmake: use a better FindSDL2 based on components
> +
> +Upstream: https://github.com/Tangent128/luasdl2/commit/feb49bb1eea77aa953313f2a641576e515f0ec3b
> +
> +[Bernd: Partially backported to fix build error with cmake 4]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index f5b59de..cc28bdf 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -17,7 +17,7 @@
> + # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> + #
> + 
> +-cmake_minimum_required(VERSION 2.8)
> ++cmake_minimum_required(VERSION 3.10)
> + project(Lua-SDL2 C)
> + 
> + # Project information
> +-- 
> +2.47.3
> +
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
