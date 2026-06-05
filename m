Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A70DCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A8682076;
	Fri,  5 Jun 2026 12:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkK5-8T-qV05; Fri,  5 Jun 2026 12:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64A768246F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663767;
	bh=I4yTrh5TsDmU3xpaPONxhnwu4jeRg6Glm1mgExL/5bA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CijlZY3UWDRZS/uHqlDgEie7yEQ5cSZVH4EV6+75ObRbjT7+eaVw/jqYgBXlSJYiL
	 wqCOXny6UpzRi0KAc+lXRp7/mxUk/8T8QTi81MVPQdyfuuJjksvd4c1Djmb5NWQasV
	 /BZtgJyWICoGQvq/+xlQb70Ik2Hk64hC+1iR8/2MxTJsOq3ijEe+hwZH/QvDCJM5F2
	 4vA0mAK0scY5lo9p1FkQvX9ACGmgZDzjKUAHPVcINIWO5CyJY1LAaaHqMFqtne20RL
	 PvZV4/I82Ijbil4KDnXHo3EeFWLWl712AA101NLuPMMuNX8Fi+1KX1hECLdYM6b46E
	 p3b3OKzB431eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64A768246F;
	Fri,  5 Jun 2026 12:49:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 151F73B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1F5F60C03
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NA0lzbFd8rJ3 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F06C60F40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F06C60F40
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F06C60F40
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:22 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490b09e4cccso14164395e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663760; x=1781268560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aJbmO6PhbVcrujyWBC7Xfk6WUgw/UPr759Id+XxasXY=;
 b=oyP3m7o86Es3ul1YbKrQ6ajE2pH1syJd65Nr/i9AWotFz23sNSn9Q9bVCctRGh8muF
 BUNFtOkPAdw2+7eiWHJUWZyhyS/+bDFPvKHdxL3NqZ2jXkSluBvYrpSm5GZuf8cbT3NW
 DcLaA+KcF2FE/B4TgsD8Ky6g3AgaEMwiXj1rRk5RXcliUyDsCegguqzTIay83GB6vjcp
 8Fe/aARQgVnPQr8wxL6UR/FUzLFZKuHrOyhU/QDjR3ta2Z+EDH6v8f/E4MjT8AKXArBw
 RcSsoQz62wqkNPHUY6dHBMZnsdDUSW8jcHhiuyyU/VEcLHNs58ZbyYzVJOyvfdfBK6SW
 a0KQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+bodyE8ois6wko1m99kgedn+Tb5K8D9Rcnntm4ueXpLdx70ULREYajPDa+HKVfOZIPen0UYbsHge4=@buildroot.org
X-Gm-Message-State: AOJu0YzKehFg+yOLmWUpq8ZKLbOwQ1AOjQmQV2LZOV6gilryTkYerout
 7YtzFxABmxoRGGJ0NFifVFuwtTSdEYDflqkJd0Jo0X73zRncNVs8mfhBKbasDrZ/w7L3igajK1o
 Qe2M8
X-Gm-Gg: Acq92OGs4GvwVD6O+ODKATYmKo9Dh7AApYzZ9rbeJKvda74am9VcZvay6OV9PeyVzMH
 bqZpvo+WhRUefv1+Z4A/cQJwc6G9ZI7Y0wHc7P/xS18FdzX69PN278Yi0Anol3ezpjC+uAHIAy9
 ZnCYVxqEWe12w4wIMm9u0HwyXZ4HNYX5mBcnOItBF9Bu3HTIfApKd35wX5GYTasRt3t2G/IVMeS
 4ai1wBJGcA3CTstT5ui2dYtnw42y1x44WpBlfFpLc1Ut2EYapAi2OYWD2l8zaaXoYoUn2k0TjdM
 +bbiE5rXAMLHizUBTYvjGnXjzMxrUj50W7nHdL37L+aUHYp82Rab/dwdfANfe2GB9k9ZCeLtdlp
 /CTWJ3rPfKq0OYOcDRicPP58nM6NF+ExEBGxEsk8mdosSiHgGFWr3vADFJ00bMbDX0J0r6jjIrz
 zwgnS+hDeWrBXbHy4yZ3e9D3qPYw==
X-Received: by 2002:a05:600c:628c:b0:48f:e26a:1744 with SMTP id
 5b1f17b1804b1-490c25a87f5mr49187455e9.9.1780663760253; 
 Fri, 05 Jun 2026 05:49:20 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcb13sm25008463f8f.2.2026.06.05.05.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:19 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:19 +0200
Message-ID: <20260605124919.270886-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425211641.479665-2-bernd@kuhls.net>
References: <20260425211641.479665-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663760; x=1781268560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aJbmO6PhbVcrujyWBC7Xfk6WUgw/UPr759Id+XxasXY=;
 b=LTvOEWTfBU8D5HbDyvjostBbA2YwyTVJGDEGz/dkJhax+gRFmVqLS7Zz2yT7YiOZ8C
 nSzA2yElArYagfMWIIquDj792Hwa9MXAcSAXK7f3Qgk/apNhuKCK0sGqAJUkWVynzHmY
 phipWh+EximimLWkDs/Wv7R3LBnGPuItDHr1v39SOqVZjRfAoyd8feL3df7BXadPPsWE
 UeQvSMy0v2CcYEUxO+kXK03gbganm8qnNCHqrcEUqZSvSDK7s1xoCxyfQ9NomLSBYcDt
 JS47eQeLha9G+zpTViOjTM4F9cEhO0W5Ml5aBLe24HOYhSQo6eN9wcIKAcckmBSNbBqY
 kijQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LTvOEWTf
Subject: Re: [Buildroot] [PATCH 2/8] package/bpftrace: remove configure
 option INSTALL_TOOL_DOCS
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
> Buildroot commit 97e2f63bdf4cc992787c570b17b099c41c5535d2 bumped the
> package to 0.24.2 but forgot to remove the configure option
> INSTALL_TOOL_DOCS which was removed upstream in version 0.24.0:
> https://github.com/bpftrace/bpftrace/commit/579e0e9dfe613502d14b6091ed35b0dee7e90f22
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/bpftrace/bpftrace.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
> index 94f7c6b4f9..35c8dec29c 100644
> --- a/package/bpftrace/bpftrace.mk
> +++ b/package/bpftrace/bpftrace.mk
> @@ -28,7 +28,6 @@ endif
>  BPFTRACE_CONF_OPTS += \
>  	-DBUILD_SHARED_LIBS:BOOL=OFF \
>  	-DBUILD_TESTING:BOOL=OFF \
> -	-DENABLE_MAN:BOOL=OFF \
> -	-DINSTALL_TOOL_DOCS:BOOL=OFF
> +	-DENABLE_MAN:BOOL=OFF
>  
>  $(eval $(cmake-package))
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
