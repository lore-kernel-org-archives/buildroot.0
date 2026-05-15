Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C120CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA33461545;
	Fri, 15 May 2026 13:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cv4pjLZ4DT0M; Fri, 15 May 2026 13:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF2C61549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852008;
	bh=Qucqirc54TKiSv8BUrtDAj1Dlsz4kOz/CqY+RajtmAs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PU5O/oPRzI/c1QDNEi01YvL3yXHLuP9dAyrEb79aO8/subDcv1ONogoUw4uKnlfXN
	 hsJi7kvRISCUds1YDfaKmJsJCIqXf/Y2xNAbxySE3yZHlbJRh6fXEXU8V05M+3vsOz
	 j4Iuuwyu2RjyD9imHWku8/rEjvEw7UDc6W2TaO5D53UVOIgpepfJv6+jgpBlz6Sbf4
	 7trYBJbsAP+bRHsB2O247nbI/uOHLEChvPcvmQ6ij16TdP0ElUI6G6T652+m0YA2WC
	 ZGmqCgIXpdvFevxqacIOc4c/tFNlwg0Q9XqSENVKh5FVC8bIqofFCRkbstQgTQHZ/B
	 rtLKx6sTw4vdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF2C61549;
	Fri, 15 May 2026 13:33:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE68C36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF33983DEB
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAl0qGH-aQfd for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C78BC840D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C78BC840D4
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C78BC840D4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so151918125e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852001; x=1779456801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O0EPYcXfzogs9OAUEVEWYoIOkzMj2Uuy0Rc4f4HExG0=;
 b=qrjNZSrmA6zHH/0AoIafoh2piEawyZRA79OAgrCAqHnrfVXyCc76GHxoEbW/OZpsrx
 xI5PpMZECS0ujIRF4Ddt/Wwog9Qlv3vXjl1uYwNmvb/9VSPr5V533b8FYd3iiyezTqW2
 2/WeePAIyVDAWJ9afKiaMnfcVjI6raqXHNDlmbUv0vsSZFRutQlDBPIO6a41OOO3YxuK
 XCXip0hFb2gQmaQ8Vne1xTlDtDqvwCsqncsq2CdRsmi1plgolDs6xKN3DO8EIYxR6f0y
 9IjuaAPI6Exgzmc8om0B3yA+3A8EHxx4SurXyM/1XTk/r6kIbSpotd+3B2Pveh/jDO8S
 nvGg==
X-Gm-Message-State: AOJu0Yz6fnKo4go1Ke/x3+GtwqMQjeXztmpq8JjpQsjkMgm8yY/G7p4V
 V7NA95G4FxmAVGm+/OkLlwwgfFDfPpe5HQ+zO0ru1R8g9N7t+5mMNGjbOFJF9E1JExyQk8POMxw
 V79Js
X-Gm-Gg: Acq92OGl9agGlNuwxwGojJuHTXhDf7tE6moxDrlhq8egolPfJeaUTexezmRzZqnh8+e
 lPmEbcHNNdLSwiYVipiP88CTA9tEcF1RCSmSGMFaRnlYRoJ5tm2n+3DKJC769ec52kJQMt5KYxa
 HNYv0tax6YC2I8gQFWfKitX2/3JtUxGqDUbkZ70T+TBv2iQJ0C/gLxNTnn8S9I8qAww9kCZL3fB
 YnWCXal0gzJbhtU2FeFKQgF/ukFTa+3PopjAcSZajG6hzRL+WrXOvjzIF6FjcUSNrEk98jGekG7
 s89w3IeXGLVdI1wRnidGkuv7kDWXMVEO5oKtWywgTmOvKWC8+LX6P8o5HxDqg2E7JIr3EP69UGL
 H4g1vW3pBoQe/pfTsim20Dc4Y1EF6b/uVtEy0xwnajRCOq0CxzHxrEM762uSwJWFm3/Ql6kMvMg
 kxkhwiXC+s2EqxJVeMYKVqicEFELoSWxapFyLcgbvhtaq5
X-Received: by 2002:a05:600c:8b18:b0:485:3b9e:caa7 with SMTP id
 5b1f17b1804b1-48fe6515983mr60617305e9.23.1778852000714; 
 Fri, 15 May 2026 06:33:20 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3acf7sm14926472f8f.12.2026.05.15.06.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:20 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:19 +0200
Message-ID: <20260515133319.315021-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512094646.161784-1-thomas.perale@mind.be>
References: <20260512094646.161784-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852001; x=1779456801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O0EPYcXfzogs9OAUEVEWYoIOkzMj2Uuy0Rc4f4HExG0=;
 b=ie99sTdD+todM1cH1UZCXLlp/oGKR6BhCoEjQZRDBz03h30bozbcuSH/8GDKoj0t17
 iq9Hn0y7wCpMj2PV9QVMDKWHenQNFXHZO/jBrzXIKALpsMUYzQCOIXj3GWbu32JJqz5n
 u+sgBIdXnxDv1tR6qxiizaRaQA8O2YgfpBgr0F4KkWal6KQyY6xju6cdxhna+zN/NHDC
 mO/5Q7Z7ou2skwybKy2T6zS3Si0UBpi6PdGfN/uCubE6Rtn0cfXxxC/vebKqB9XUNz9d
 BgL+ydRg6e41dF8jPiWb02Rc9ONptXVe7xFNM0RIEq1gJ3LXTVtdjSK6tDvS0NokBI8g
 Of8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ie99sTdD
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/cmake: bump to v3.31.12
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
> See the release notes:
> 
> - https://cmake.org/cmake/help/latest/release/3.31.html#id2
> - https://cmake.org/cmake/help/latest/release/3.31.html#id3
> 
> This notably include fix for host w/ host-gcc16 [1].
> 
> [1] https://gitlab.kitware.com/cmake/cmake/-/commit/ea04e19daf7010781d0df980b9683a642093e381
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index cbca2fc355..058b900199 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v3.31/cmake-3.31.9-SHA-256.txt
> -sha256  5d4fdec04247ca8a8e8f63692f0d0f1e9d6d082a2bdd008dff8ab3ba7215aa83  cmake-3.31.9.tar.gz
> +# From https://cmake.org/files/v3.31/cmake-3.31.12-SHA-256.txt
> +sha256  5f3fd5a54dfa65602bdbed64f981a72673cc19f2d304cc2955cf0dfa0cfd8272  cmake-3.31.12.tar.gz
>  
>  # Locally calculated
>  sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 304dc3755a..249e65700d 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
>  CMAKE_VERSION_MAJOR = 3.31
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).12
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = Copyright.txt
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
