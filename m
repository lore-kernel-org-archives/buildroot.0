Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3570CAC5BB
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB94A6152F;
	Thu, 25 Sep 2025 20:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Yt6wbhUo2ZO; Thu, 25 Sep 2025 20:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927F861587
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 927F861587;
	Thu, 25 Sep 2025 20:17:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA8C612D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCFDD61555
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlNeoW_wDz1M for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 636FA6152A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 636FA6152A
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 636FA6152A
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e37d10ed2so10424855e9.2
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831409; x=1759436209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ax3m5tyLVChhTvK0xm0ihR0FNhNVakYxWTCZRD/zvs=;
 b=DMbwewk7uBm45TP8ohe9NUyhDtgAe92eU+u1VQmnPCsKi5x+IfuWY945hfLIheAU8l
 qu0RnWHYjMiKxjC6l7oeCDOJUNIcTpFFKRyVqPAsbtncs/MTrke7K7boyqpxzJoaqH2V
 EH5hh1/RGyxXSzyJJwPkiH/IbcShHMCunj9YwY+N6rzZiIDWikABTOpJhBIacyCKazLM
 HOkB2EHuc68h+siofI0eXy/lLDafcI690kvDt7CeUNqhVi8z8of/LmsFR7n5glUbj0Wf
 ghnmaBQyudoKkFek7fs8hBvMAPJqCYXBDQUlHSoYZEvzUQJsPepzlPjK5PHgXgK4Q60r
 tyZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/xMLuVyfYgjkROuabL+QkL5ErO6CPRWD6PvJLM06AN+29BscPXFycRzCWAeiD4+pRBgVsN8CkC70=@buildroot.org
X-Gm-Message-State: AOJu0YzpyOAgQetHnw3aBPahStCrcoOGoLme4OsXkzB0UnoBrjPBpPd9
 TUnI9znD8sp+mnL+JBUUNgMss0jpxUeITUR6xXbhNL0fs2daRfL46CqM88eHmai5w6FFgzGCTjl
 Lxph9KNo=
X-Gm-Gg: ASbGncv+sI7ypzqpwD+K7txG/l8zzsVqpaG8w2oOOkNYDfa4hRijpaG73CGdiX/YXpK
 Iu8wSLLPsCTdW+rgVjunnFjb38AQi/SNnogmZ3Q6ugWVUh4VIXChASjVRC/vUIc3oTAz1IH+p3F
 AL5EH8bEreOrC8LUGw9AsrOw7s1wKC+gef8ZPCmCAweRU+w19nSRyDoPuhhiZz+oTl+SlvJPmPh
 GfrLOV1BmtZMYbg735Z/aq5G23sffDAWINw3WqcYCRLg5e/a0GirTd2zwd8lpM0bxYgQVZsxlcC
 XsjvalEu4kU5wHK/VKg93tw2zAiADF1sjumjgWmHLXAizteWEBzxCNXnhwtHZuatFeTCR7Ed9cG
 za+LOHpgQ2G8oTvg=
X-Google-Smtp-Source: AGHT+IHMbH9YwL+SGR2Z4+AMZabRzHL4lDw90mYC0bJeIg9BuEX9v5wdfb/nfJazwJ0S4q5IvCqA1A==
X-Received: by 2002:a05:600d:15a:20b0:46e:1e31:8d06 with SMTP id
 5b1f17b1804b1-46e329f62b4mr51443025e9.16.1758831409398; 
 Thu, 25 Sep 2025 13:16:49 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9af27dsm92036385e9.8.2025.09.25.13.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:49 -0700 (PDT)
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:48 +0200
Message-ID: <20250925201648.43657-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916122005.30652-1-thomas@devoogdt.com>
References: <20250916122005.30652-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831409; x=1759436209; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Ax3m5tyLVChhTvK0xm0ihR0FNhNVakYxWTCZRD/zvs=;
 b=iA66fqtDOJzS2NsEdpb2U+i2fLvgb6G7FDR2EYN2rZAZN7++htPTZxkiyDZ7XlA7x6
 hfJcRsmbBFIDo7N8uNGYCCnDOcBYk4HcN8mbr2G8R7eQ9uGRCNo34aEFphucw6cFdd8D
 vkUXufZUJinekpPLZlnz0TFBZJP8eofoHBA7xKeyyP7LYLCSt9D0j8t4vBwYuy0Rt0oK
 hRkGdmAllt1XltjDqcOUNURAkEKDAgu4ArNdavNttCm/I2BPUG8juUt4i1e36AG55aPD
 NsevzWRoxA7JeGus3cKotTvVhs6WiFJI8tJNR9EiwoRaOYDknKRA9/QAqrIc2XCg5GmJ
 p1sQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iA66fqtD
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to version 2.48.6
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
> Fixes a number of crashes. Release notes:
> 
>  - https://webkitgtk.org/2025/07/30/webkitgtk2.48.4-released.html
>  - https://webkitgtk.org/2025/08/01/webkitgtk2.48.5-released.html
>  - https://webkitgtk.org/2025/09/03/webkitgtk2.48.6-released.html
> 
> And brings some security fixes. Security advisory:
> 
>  - https://webkitgtk.org/security/WSA-2025-0005.html
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/webkitgtk/webkitgtk.hash | 6 +++---
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 6c2beb7d1d..fde2439dd5 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.48.3.tar.xz.sums
> -sha1  36faf2c30967db57175caf88cefd3d25781ae6d7  webkitgtk-2.48.3.tar.xz
> -sha256  d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e9279640b3217a782c3  webkitgtk-2.48.3.tar.xz
> +# From https://www.webkitgtk.org/releases/webkitgtk-2.48.6.tar.xz.sums
> +sha1  8f8e27722b29be5aba84322cf7252fe14afcec60  webkitgtk-2.48.6.tar.xz
> +sha256  d9ac3034b7a39c2aaa567e6112b3124b158e591a74439e46974a031dd0e44e24  webkitgtk-2.48.6.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 419bef9d8e..cb66641e3d 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.48.3
> +WEBKITGTK_VERSION = 2.48.6
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
