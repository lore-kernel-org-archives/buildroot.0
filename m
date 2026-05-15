Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3036DCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCF5984552;
	Fri, 15 May 2026 17:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuXg9ScaClwq; Fri, 15 May 2026 17:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 737D984538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867192;
	bh=CxgVOJidpRAEBhd5TnvGVdtWySQ7bTPiYfW+4vfJceA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xt8tHYkXRSp54Y6MKqcuXod4OBnkFV2EwXJg3melvf/voOBIIFvG+nzQbmHZ7iC6p
	 tjAVhf4fnBmW4T+NuuCRCb8mNn95EPUaQuj5N6jqEpHFVIj+dK/38UVlX7o4X9Ai4/
	 v7vBfoluAu3xH5tFXIs6RGNxLdiiEt0WPUYFMxj5xxYYBIQ1vSrhC6unr2Wqf22oIk
	 tYkAq+Ml1OIa2MZetWtygfrl3OxFZSqyRQjAiTvvJCp2otUox4zQ0cD2Dz2AA5zUvu
	 wUhGfb3mhrO67sQH2Ty/n1OYik3e5GDw+yWXDrGdzP4aVAxu+nyFei10V06vnnnV9F
	 5AqbuDhzz3mTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 737D984538;
	Fri, 15 May 2026 17:46:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7231F45B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63F2941D27
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id To-IbRHKfY1y for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D59841D26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D59841D26
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D59841D26
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48d102471a4so616945e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867188; x=1779471988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hXp7RJM0QL2syCSH+lt1VlvRpFgutkCVhoslMG3eVe8=;
 b=K3vctUC9oZsZkPOvGHdFaC+qgl1ZNbFOl/pMLAOg+OFseHkdl8wCr77OnU2vr3v+9x
 /aTrK+QHqx2Fc9EqgL0WmYLuyBEOiGvRBU8ud60tqRoeAWKsTXhSmwRdFUNuySoM7pMF
 MJaKTr3KyGpUVmyMGJqAVD4rkTjd5iWgasF5glKGTTay4aWH72PPOQAnozqV1FDsrOkO
 COp5qB6Qd555ZA5CLz2UqcHCj2QKh/Px3StJDRmSyYa7a1N9IzpNtXexWsxYuDCC1fxc
 aMqmUgg5Ud+IRXrbsYFj/+t/M9gSbANitAl2y5uJ+2SxYhGWUFwE66zHVL8wiaqQ53Dl
 9Efg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+m7md/3HmsdEdWhDCfLq/KUXd2Sn7eaWHZDdLx8ux+Q87DpXtMjYwNVF6HyLY4GvA+IhGMP6gmp7g=@buildroot.org
X-Gm-Message-State: AOJu0YyzUIgLAjLh5dtYoFCYqyPjV6ABRNYdWPb4cJe3ND1zC2obFmRK
 alYDrKaHV+qnEgo5hGSE7u3PzziiMGqc9Me1vWGY8jixSmvhMa9PiJFk5V5wb9RkS64b4sZh7lO
 99vlo
X-Gm-Gg: Acq92OFWrOz4MvT69oA+DLwQUcnHayWQDDtagRzx9npmI1/bIgWe2oCmCOXPWHHJE1D
 RCF6fenMHkfm2SE1v7+PQ8IkEhLEVwb53Z4cv2iHjqAl/8CkqQlD37ALZc5NhFkB/EM3RUGnl4c
 VpgYvnRxtDvH8UFwx8Y5EB69FQYROwusX4AoV11jl1homgnoBKek2aqPY++QIp1Q2iY9BmBvSW9
 FCqd0OycOX6lLNLmYkAOMW7AxG87xLsfO7rlByF0W4QkfaKxU9gFQuNMNyPbOLSwqaeFrDFJkKC
 WFpSjQLuzeQxtmYxQlI0+4PQ4x7DfsBpSO636Z0oI8XMSGV2OI5CTfYtXURXtnT1jpkzoaagVR7
 E84ywkqatwz4F+8pIIz5TUg8fBBT5h0dRJeKYfIFNnl1QGTfU4zw10kzjslpNNE4EiLQVo3fAXr
 U+9SQmjuinD25yrpixs6nhumcZ+9Fhxy2Nra/g2dQ2KowP
X-Received: by 2002:a05:600c:a406:b0:48a:6798:52e9 with SMTP id
 5b1f17b1804b1-48fe59b06acmr66882715e9.0.1778867188224; 
 Fri, 15 May 2026 10:46:28 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4dac000sm75803485e9.0.2026.05.15.10.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:28 -0700 (PDT)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:27 +0200
Message-ID: <20260515174627.529736-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417084010.1414193-1-aperez@igalia.com>
References: <20260417084010.1414193-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867188; x=1779471988; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXp7RJM0QL2syCSH+lt1VlvRpFgutkCVhoslMG3eVe8=;
 b=K6OEVr8BQvsgg7/I9WeWBhtVEq3wIVqFsd1PeccAo5Lng5ygxRDd1imfmEW6+3TPN2
 p7tVq7e9wiSKV2xuZry8kFf0K3l1EPj//OKrx9z9FZB5dAojyuuGm1iANILj92BcFS+H
 ONb1FsXdlG2PiTUXdweDILXbEaQ0AtzpyBNnHS1hI+MpXTHbA8VraeloTVo04STv0wTa
 JOeJeUJjLpCxfmmNyhl+fuKBOHdcRgwTAS4jvmu58TyAzpiz4BliMDznWlDXoJsRGLSd
 UYIvkZWHjponeCsaFU3Q/JV2qTb9fmXMKdEznEDavQMe4gdvsRin4TboDyVdU4CbjQ/5
 Crlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K6OEVr8B
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: bump version to 0.11.1
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
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.11.1
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/bubblewrap/bubblewrap.hash | 4 ++--
>  package/bubblewrap/bubblewrap.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
> index b2b88ffe92..696c20ee07 100644
> --- a/package/bubblewrap/bubblewrap.hash
> +++ b/package/bubblewrap/bubblewrap.hash
> @@ -1,6 +1,6 @@
>  # Also checked GPG signature from
> -# https://github.com/containers/bubblewrap/releases/tag/v0.11.0
> -sha256  988fd6b232dafa04b8b8198723efeaccdb3c6aa9c1c7936219d5791a8b7a8646  bubblewrap-0.11.0.tar.xz
> +# https://github.com/containers/bubblewrap/releases/tag/v0.11.1
> +sha256  c1b7455a1283b1295879a46d5f001dfd088c0bb0f238abb5e128b3583a246f71  bubblewrap-0.11.1.tar.xz
>  
>  # Hash for license files:
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
> index ea46d7a127..afbb29eab9 100644
> --- a/package/bubblewrap/bubblewrap.mk
> +++ b/package/bubblewrap/bubblewrap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BUBBLEWRAP_VERSION = 0.11.0
> +BUBBLEWRAP_VERSION = 0.11.1
>  BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
>  BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
>  BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
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
