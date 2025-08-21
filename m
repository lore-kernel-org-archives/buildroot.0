Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EC4CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8824161BAB;
	Thu, 21 Aug 2025 19:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kCXnea9ihyV; Thu, 21 Aug 2025 19:21:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FA0E61C09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA0E61C09;
	Thu, 21 Aug 2025 19:21:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 376741C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1925761B4B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptEl9fmcFV7h for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C22BE61B2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C22BE61B2D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C22BE61B2D
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:51 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a1b05d252so10142025e9.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804050; x=1756408850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P4Py0ynFjJn9oWWUwfJ4vbB5U8jOTsoS6aa9prIpaE4=;
 b=V5YUoEyS4Nl4/f4ezqhtcLVfE7uG8cADAkT+1G/XmYxHb3piokbmIVttXrDDsP5FnV
 N+6WdsNKtr64dyipv1u/cqx6Lh4/DQSeySHHhFOgbf904cWvDlqq1krp5a3vugfitJm4
 vlhbZUsgKQ+V0GJwIq5+HnR6j5buI+QcqvHXP20tV0EdIgecmwfVqdzkCo2SW1H2Vj8Y
 8T3Fx1qb0QwGFK4jJAr995kKJrQKOTffKKdYEBV0Zed4GEccNTkRl7poaqGEkGmfuunr
 Kod8Vs1CyQw5wqDY0cktww/a4ulzyRitx52xFdldw1A31gXZ72SA/eS8em78DOg7T4mM
 1KRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj7smCBqvEAmDEt2p1ONvjIXC0lm/T4hvPXeQ7n7saWHQu7+zH5Oy/DOcPyvrMPxfDl3eutgxwMAE=@buildroot.org
X-Gm-Message-State: AOJu0YwkO0ezyYnyJENcm8qVjqaI/t+ESL4sBesGLmKZRVnZVASjiZfw
 gmkLpXeNoOLkexpMykjIo1wJZSHylRasZm1AxCljSgNLNRc4fQn68fmn8XD/bV3vUkSlTysHcbL
 cRWZZeO0=
X-Gm-Gg: ASbGncsqXMatfEPNexSgw4fbovZm51FUvnr3D6ZL0kP0/oPFgd19TKR3W92IfhV1oKu
 gzLL4eN6cTW6sa1MlmFo5+x6g8+nBu7QzmngquVDHHnM0urOghl3d8QgHfa5ZObbrUHkFg8XyPD
 6S3RzzUkiKeotRkO42ZDQB58O6RVnwl+nXudpyGwteptSsq3vp03K6c8oiXx3MI1SaeeFqIMO+F
 C/XRQfZwFRqXW9qkYE035VWOuKtKqQGqOWylEFDhTq8dRhO+nceixcukeG/i7qXGNFyicovYAtf
 rWu+pL44h+YCf1/8+x4BMkv1IbcxUoKrT5hXZSUbxMKkuNMLsoBgKHQXy+PcGteHpPPM6mQRGA/
 tn9Wi79dqub68sQ==
X-Google-Smtp-Source: AGHT+IEVtEHn+S/kU/KdQrBEUK7Nw14B8jalBKQ+/riwbN8ffZ0/I3Dby845ZOy2JloFrBgEWazpGw==
X-Received: by 2002:a05:600c:1d01:b0:458:bfe1:4a81 with SMTP id
 5b1f17b1804b1-45b517d3b07mr2298415e9.17.1755804049833; 
 Thu, 21 Aug 2025 12:20:49 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50dcea8esm8642015e9.8.2025.08.21.12.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:49 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:49 +0200
Message-ID: <20250821192049.23657-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811120851.543585-1-titouan.christophe@mind.be>
References: <20250811120851.543585-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804050; x=1756408850; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P4Py0ynFjJn9oWWUwfJ4vbB5U8jOTsoS6aa9prIpaE4=;
 b=b5W5SHe7OYCD+w/YSNh0Y/a68t91C/d3CiHwd8Rb69LlTE9S+GIW6DwMs4ftSSTwE4
 DJLCKjWg2IgywW3yN48NTChXVV70o1C+FGAyz6q0sKnlGfa8ntDRIz5QMjnjiI8FVxV/
 7onaRFJv11q0IUEogumwh01SFVBA64ImyDWay8XT9FbWI1wgiz05/rYni8e7tZgFYyTy
 h6RWSX5o0m3oROGmd8/oVBgm6SGoL67Sd8N/nL75L5XtDguERhgXekyNz8mXukcq92vM
 JzHzsXtmHtxGWmMqq1z+KYBeMdyqw9S7gvyfXQSk3TFx07zT7En2OvYNYWijU9KcJ4AI
 IrMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b5W5SHe7
Subject: Re: [Buildroot] [PATCH 1/2] package/ofono: mark CPE as valid
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
> The default ofono_project:ofono is a valid CPE, see
> https://nvd.nist.gov/products/cpe/detail/734A0A32-DA21-49B8-86BD-1A60C7CDF864
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/ofono/ofono.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
> index 1ff43092c4..ba0846e823 100644
> --- a/package/ofono/ofono.mk
> +++ b/package/ofono/ofono.mk
> @@ -9,6 +9,7 @@ OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
>  OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
>  OFONO_LICENSE = GPL-2.0
>  OFONO_LICENSE_FILES = COPYING
> +OFONO_CPE_ID_VALID = YES
>  OFONO_DEPENDENCIES = \
>  	host-pkgconf \
>  	dbus \
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
