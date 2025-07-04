Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F13C83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D9B860E1A;
	Fri,  4 Jul 2025 06:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ait3g7uxCRBt; Fri,  4 Jul 2025 06:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFA696162C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFA696162C;
	Fri,  4 Jul 2025 06:48:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E7E7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75C7840510
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfhEmfLjwvnt for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99153404E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99153404E4
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99153404E4
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so222513f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611682; x=1752216482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2FJozMgqzsnaVm8QMZI8/Dkqk136uXP1DhVZBw49144=;
 b=LWAeFOuw58kMUpSnNYV6darZPYB+KAEy126Xs7w2Gg9mORUkCu4Tg3sAfWLYSRtaWP
 eyDW8bt0ZerWZKg0OjViMrpR1okzAW4sCcMCk91q+s4D2Dr00sItEy1Q/dpfV6mg0IYf
 X+Pq59RLAndDaCa5FFI+eCqBu/XuHRpQhYv19Y6878ZI1XgpCtJCn+BkVYWbmtptob/K
 OyJ26lBqxW1KrQEAzt9nihWOvgZfXdTakVdM9COm9vSJHJXj0N3/CHrOj8x+Hfgw1PLF
 wzDShGtVTUbC9SRPlsPq0tqIbDqKah02rfaCLB8Gd8WmAUsa29IXvVhYCHIoyHsn0XdK
 zWNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/0LxV1D4l+U7xDj9NUsQrBIFyjAx+XtZbv4ppYpGpW330Q1xZ9U1J6hiGEGRcv0G4pXOJKUNnl7k=@buildroot.org
X-Gm-Message-State: AOJu0YxnpfFzRddKjW7WYRZjpxlSZ4sjGccD+BzWwwi3sWJKbrquBMwj
 V7jZxOJ7e2M+efFyuA9C+D9EtjctyT6Y6FYKhPSbpXJUQxcTkIvDN3bvqXSdlqSvlL8=
X-Gm-Gg: ASbGncvkggjX9oEz3J82c++yOuj/LC2KnCCK8kh6ru3rCM8Xgudxitp3Er8ppVdAwJH
 ttHyQ9By3R2dkg2MHAL83Idkwn1GvWoWNjLBln9B77STluNje5OZjo27NdUZ/nYeFt07PRXkUWx
 dfP07olWpVbDBsCG1AxJ55E3yMvB7zM1RM8m8WhxPV9pDfE8Q9wZa/nqg+hXABlKzEI8mqSFUc/
 QMVmfQgNg7PvLqkjyT7SyQaamIFu4ZASdF7eOwX3omGG2GapzUGxoKNQHnc40DN0RNwkGrMNVMJ
 tZq9KXWcO05646VwEafJc17DLGCZbOrBf+f3XaRrDy0tAnPdjgOvFKaSUerB4CqRb0fQ0mRBhlQ
 zeGgG45NHEg==
X-Google-Smtp-Source: AGHT+IEQlcI/KXSvGbIxFfIl+zNTzF74HGvNWPks/9GfkZYlLaAYNVw1vQjvkQFRT/4H05kvYIJlPg==
X-Received: by 2002:a05:6000:310d:b0:3b3:bd27:f2b0 with SMTP id
 ffacd0b85a97d-3b4964e57eamr975619f8f.43.1751611681556; 
 Thu, 03 Jul 2025 23:48:01 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b168673asm17409385e9.26.2025.07.03.23.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:48:00 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:59 +0200
Message-ID: <20250704064759.4065367-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624170834.2819257-1-peter@korsgaard.com>
References: <20250624170834.2819257-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611682; x=1752216482; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FJozMgqzsnaVm8QMZI8/Dkqk136uXP1DhVZBw49144=;
 b=X+7iUZRD7PKMjXCV5HWNmEUqs/ZbtYlNo0bk7AcNsf3Bq3p2thBbsKXWZ29TkFCV2C
 r2sE/NXq6MPimEZ5StIcXXzUI63pj2fguFSvXHNqh4K3iJ1ag2T0oAWi6GA5Trv9xROG
 v8mWTFVuKEaP4VPS089o80OnLvpdQYpW3XXPe3kqIVqiAzN8IinMndzjjPY23R5cnM+4
 goRylycw1dliuIW87odrnd6OgvyyiDFevvy0BFU43908F76OQUUZEw6JXkBNrSe4hVhE
 92ZOKzZCImR1LV02yY5B9WEjKUOdHW338vYlto0AWosPv6AbSU8q8Fa3HIsqzZxRD23u
 OXXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X+7iUZRD
Subject: Re: [Buildroot] [PATCH 1/2] Makefile: sort unexport lines
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
> The list of environment variables to unexport has grown organically over the
> years and is no longer sorted. Sort it alphabetically for clarity.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.05.x. Thanks

> ---
>  Makefile | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 26db176674..a052628ac7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -407,27 +407,27 @@ ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  # Hide troublesome environment variables from sub processes
>  #
>  ################################################################################
> -unexport CROSS_COMPILE
> +unexport AR
>  unexport ARCH
>  unexport CC
> -unexport LD
> -unexport AR
> -unexport CXX
> -unexport CPP
> -unexport RANLIB
>  unexport CFLAGS
> -unexport CXXFLAGS
> -unexport GREP_OPTIONS
> -unexport TAR_OPTIONS
>  unexport CONFIG_SITE
> -unexport QMAKESPEC
> -unexport TERMINFO
> +unexport CPP
> +unexport CROSS_COMPILE
> +unexport CXX
> +unexport CXXFLAGS
> +unexport DEVICE_TREE
> +unexport GCC_COLORS
> +unexport GREP_OPTIONS
> +unexport LD
>  unexport MACHINE
>  unexport O
> -unexport GCC_COLORS
> -unexport PLATFORM
>  unexport OS
> -unexport DEVICE_TREE
> +unexport PLATFORM
> +unexport QMAKESPEC
> +unexport RANLIB
> +unexport TAR_OPTIONS
> +unexport TERMINFO
>  
>  GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>  
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
