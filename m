Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6BCC7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 13:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B7AC407E8;
	Thu, 19 Jun 2025 13:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxnXNyholvEa; Thu, 19 Jun 2025 13:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576634086A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 576634086A;
	Thu, 19 Jun 2025 13:53:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E6DF16B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34B018154D
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goFfy80QsubO for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 13:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54AE2811DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54AE2811DE
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54AE2811DE
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:10 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-453634d8609so1380615e9.3
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 06:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750341188; x=1750945988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/t1SdHdG9+4/fIEZv4ypXnEtIk3sLSEhn3OUMLRrW9s=;
 b=tygtp9KvxuxOHaWcAnoMFrNlikSHFiDCXeFFzEsBynK5ch2h3vY75qHWe3AuU9RJcN
 9dRxlmWbndO4w6s7WNOZWkeKgXBISJ9sHLf3ubBvjN6r0tSk1pe5LQTlsv0vjy403lvN
 hnmKBsSRXkbp02QIjiYT3O+/mWq+Sq5O3TTrLWUShQyWBe8jK4iUz7NpvHrtcUglrE0L
 YjN3uM16u6O1cX6d4E4Ln6Eanr6w5e/wrCkbuwIZOMrktHGPbgrNjFt3a6RHuTxl1yoQ
 UURaVbc3VVG9PceaYO2184hTh9UsG3X7lzkLiI0vetcVFZTdUtChHMq8j43yVDJ62Py6
 Reew==
X-Gm-Message-State: AOJu0YzEzw2QE5WYvbAC6WdaBjPFRpzXQrQ4/Q6xMdFAbA3+zdZ3s0Eq
 AW3KFJXHtqrS+eESzA+ug2Nsud5pdvYQF25Tv+B0uq99qvp+1QLPi599mlRGhVCf7NYUYx9+SUX
 pvn+x
X-Gm-Gg: ASbGnct9tONLt5vTp8d47MI1uwk5PYE8Ms+WLbU5nLlqZXgsCoTVe96qeZw6KN+F9Kt
 Mn8lO8/en7spLG4FPbnGZGGeDJdrM1wsc+6YufxQEJuz7QmcPTjg6FrficAU0cV6axbNSyC84Nt
 hjkbSBLOBDdwaqBUOZMLlqeEqVojIJhvuyVSwe/n3Z7AlGX/BZ409bGLw74tRQBDZQ7f+GsRbSA
 sqGM2aqNm9xWFLyKFWiNgsUjogMIwC1BA3x23TzHLV4ZLCoLQ66nJPRVASnQhmPoMFfsmJQOXpm
 be4AQ4fDFKx3ASezfHJFmjKT27ka8WFxdjMFEwV9GJOdDKStTErtubf7a42YXDb8ID3sSwJgyvu
 6
X-Google-Smtp-Source: AGHT+IEtaRSqwU6CSpUg4EXQu7p8ENE4ZdLsktW3moJIXWqJyli/x+rz8gxp0cA68FnuRDQCchgccg==
X-Received: by 2002:a05:600c:1f10:b0:442:e0f9:394d with SMTP id
 5b1f17b1804b1-453560d2fe9mr85465545e9.24.1750341188109; 
 Thu, 19 Jun 2025 06:53:08 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b08a2bsm19905436f8f.62.2025.06.19.06.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 06:53:07 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 19 Jun 2025 15:52:59 +0200
Message-ID: <20250619135259.405906-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750341188; x=1750945988; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/t1SdHdG9+4/fIEZv4ypXnEtIk3sLSEhn3OUMLRrW9s=;
 b=P4n4YOq3zdbn1fahxlJ6qPLzpuCFZ3ZbNeprjaFTa7PXApiusuMk3El5uYW9DAhKrO
 7q050wUk03LR3fCkYsw1ydMaeYzftKmocc2SBxHfhJLZOsqz92aC/dpUvTU2JflWlGB5
 RuHL6uNjdYx7y/30lpXYmgTNq0zRvvTeGtGosao0WDEe/Gvu9KQGlHx3dLdv6bbOZVKg
 o/7O0/1w20pMu5GJU1pWXDmVr/mPkgf/cLvT4/fUr7i+00HowiIIw63wjR7qZGLw9uMY
 mADARV90R7vuI+YVIN+uRx7K3mngZTcmXU9zJJaffVICTNUBPPCtMh+EngNqjOnjbf71
 UtIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P4n4YOq3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-glslang: fix host-python3
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
> python-glslang is a host-only package and the host-python3 dependency
> was wrongly added as target dependency with buildroot commit
> f9fe0cf8f64f8ea48f3ee4af28053d7bea52b61f.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/python-glslang/python-glslang.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
> index 94f480e30a..c3e87da94a 100644
> --- a/package/python-glslang/python-glslang.mk
> +++ b/package/python-glslang/python-glslang.mk
> @@ -8,6 +8,6 @@ PYTHON_GLSLANG_VERSION = 11.13.0
>  PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
>  PYTHON_GLSLANG_LICENSE = BSD-3-Clause
>  PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
> -PYTHON_GLSLANG_DEPENDENCIES = host-python3
> +HOST_PYTHON_GLSLANG_DEPENDENCIES = host-python3
>  
>  $(eval $(host-cmake-package))
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
