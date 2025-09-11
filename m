Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C04CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E8C4422C7;
	Thu, 11 Sep 2025 19:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89Yadjb2EsAz; Thu, 11 Sep 2025 19:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83D75422B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83D75422B3;
	Thu, 11 Sep 2025 19:23:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72F5AE20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64D6F60E37
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqTPjAtIe94I for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BEF361B40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BEF361B40
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BEF361B40
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:23:34 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6188b72b7caso1219664a12.2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618612; x=1758223412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=77DUkittQ1wKkaqTbfAdQoJMq3ZPrkq5EbvNVOBsG34=;
 b=vUJOfQQWa02++dNieMeJPZHdM6EIUtN6kc6SHtTWHyQZkB3wN7Ms2EaEnLY73DzS1G
 QpsJJrE392mswbBop9y0SZA8WJ6nb6IydlWmx4c1DPCJKk5yywxoIV0SZ0SmZqKr0Nhw
 QX7Mgvu/alGhKsHRRoAa7EiE+bm/u4onXljM/JXAtr2c0pUcoib137batSgqOuYbMEJ+
 +R7k1VHYMWIDVdo80NZ+OJ7ckCanXojpaOVD47VkfB+SDDu4MBLZY81xNHBdEMMAikXq
 eDwzLy1i9j2WKN3dbQgLCbEgdrjM8fdfi4bkrdx41FiIWkggCEplHZVjk+LE0BqpoKjb
 gMPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFQd5dPfyMB9cmAVR9eQnye15nNofzZDJSsl1Ngb6IHEKP/CWjo39uIXr2X/Xg7cjCZjAhQyVEOfM=@buildroot.org
X-Gm-Message-State: AOJu0Yzz+3AwMDm31gvlm+ucB+R2sRFrK2zD8IHZj+oW+ibulFIRtJll
 bCw2Vw2tovf7YGoZPPd7DZDKhNyeNlgmMsydN4auHkwJMPqcdMrq3YpBGG0Zc1oiLK1RykOClYs
 uzykJ2lI=
X-Gm-Gg: ASbGncvo8oUisiFcqsAUKcIPZOzLTytZwJ/CPot76zaoM8GvDBCkHPeYCk4EgcUj9qt
 XkTMPsh6xEb7TA8VSzKqdKzH70CEU2IO1OCcaTmXUj2eVXK4GP3s08BFV3D9RIOgUnFMSuG9bfU
 Xo55pHMPmxbBhJTaXAWyK7DJoSpQe9q6pKVCJUFLsBI6wGlWVJh8e+vGQHOF/n5iC08+s26YYyO
 SNB+mk44A2SJdTFcV5MkJLyIwQFHGUOJhMF+M/6sq253CbpV+/s5WktCuALQWBZqGEo8JHo7JVf
 AnuFhabD6/OFre1yCN8nveSssw+eJtAts763AZDL71Rzc2YXXFnlm8vKJjK/mQUwE13bwtXSeom
 /I7a3NsgphhCiZLA4yy51xeSwAJNLjoDKBm7TfJY3Dzzio8U=
X-Google-Smtp-Source: AGHT+IFBOHbiMrcIjxGuRrdE/Qm7y19cwIYj9bJXrYtPEVOhQG6VQiEaT3VR1oueBs/b9PIG7epBWg==
X-Received: by 2002:a05:6402:4413:b0:625:fc4c:567f with SMTP id
 4fb4d7f45d1cf-62ed8301f70mr598357a12.18.1757618612242; 
 Thu, 11 Sep 2025 12:23:32 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33a521esm1772046a12.2.2025.09.11.12.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:23:32 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:23:09 +0200
Message-Id: <20250911192309.2672095-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250901202846.811867-1-giulio.benetti@benettiengineering.com>
References: <20250901202846.811867-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618612; x=1758223412; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77DUkittQ1wKkaqTbfAdQoJMq3ZPrkq5EbvNVOBsG34=;
 b=FEgj4oC23Wxu9NJmsGC936mD3grE2lzv9L0Lv92YESMi6pN7tirLIR95qV6Orig95F
 ODQM7yx/sR9bsjUWjvg/EeIqSaee/SgGrrWj8jzaA/L9NgjZgNcaOjRX0u40k9AEDlyc
 0noioRMA/MTmu6Zug9xSAeatE8LJ6pqXGEgkuGWUiDMDx9lFEjIHCWAvjru5ySvgzUu9
 vTGKS64aNEeTZwOrF2gAGZmtr4q/ci7LZeRVOp7xrCIE+2W+Bc4GcU+85e/j2YFnx9we
 Y+gmFgndiV1pLZCFa1Pe84vEUTFo6XDsSygIoL7KCOjEnsx1LU9AKF/TM4OZAVfxySc9
 S48g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FEgj4oC2
Subject: Re: [Buildroot] [PATCH] package/udisks: security bump to version
 2.10.2
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
> This fixes this security bug:
> https://github.com/storaged-project/udisks/security/advisories/GHSA-742q-gggc-473g
> 
> Release notes:
> https://github.com/storaged-project/udisks/releases/tag/udisks-2.10.2
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/udisks/udisks.hash | 2 +-
>  package/udisks/udisks.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
> index 66f4be5e1f..8803bedb21 100644
> --- a/package/udisks/udisks.hash
> +++ b/package/udisks/udisks.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  b75734ccf602540dedb4068bec206adcb508a4c003725e117ae8f994d92d8ece  udisks-2.10.1.tar.bz2
> +sha256  6401c715d287ec84fe605e0cb90579e8da6c395bce5f42e419f205dd297e261f  udisks-2.10.2.tar.bz2
>  sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
> diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
> index 0d63532d8a..515797f39a 100644
> --- a/package/udisks/udisks.mk
> +++ b/package/udisks/udisks.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UDISKS_VERSION = 2.10.1
> +UDISKS_VERSION = 2.10.2
>  UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
>  UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
>  UDISKS_LICENSE = GPL-2.0+
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
