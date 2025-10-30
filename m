Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE217CCF9FA
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 938C141159;
	Thu, 30 Oct 2025 08:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1i07rr-EDHnk; Thu, 30 Oct 2025 08:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B14DB411A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B14DB411A8;
	Thu, 30 Oct 2025 08:24:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C78D2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 833A28108E
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IS1unUQTz9R3 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7445A80D13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7445A80D13
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7445A80D13
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:52 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-475ca9237c2so4207225e9.3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812630; x=1762417430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2ESk455kPZi7V7UMu/zinnG7/xej3oUxZKWxLbrLps=;
 b=R0VprvBYs603p604NKLs8VeVu+qn2gwnjC2oz6y6Tk8yHBqwytwYxPWJkf2tHZZcYD
 kpXVTWE4/tqn+nj8tAecmNrN3yaYqCPjBn2APjnRNlBgh7gyh+CIlL00bVb7AhGwvLqf
 iJt8Kf9+vGHC1JYkqq5dj/SSaJ1cAqn+bBuBen8e7YRZgCu7EmCmcCuYFpDvtULfLSQl
 Q1Yg524ikqsIAprEvnY0bCVrD5VAVmbi1mq85pCdHwMdbb0x/KgNTkRUk77UkGUVvTxL
 /QFriTIf+HQOZh9AaTI2AkQsFkf60K94ArNTwz7TWp21P6abXBAWfr4dYjrsscv6cYFv
 oqpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV9P25me3jbf4OF9TzZ8H0whlCcMYe+taYQKKECJMlCZaRqV8/clJXRbbAYPLZfWfgEtrc3oxCtqY=@buildroot.org
X-Gm-Message-State: AOJu0YyU++3rVRXCww+aIDIenM+T/D52obn0gfd0kTMOaDGV8/BNPgid
 cW0pCS6rzJrJQpRiNjzzxeAaR6cPsSiNwCWy0E9rni4pt0ncPlmSZ3KT+c+Au6zGhYM=
X-Gm-Gg: ASbGnctRmTVifY4tRRo8ilmHPuiFJZKmhEGQYt/7yBhNEnfVuk0mwh6OJAWDe8Smcc8
 aGZ4FwDrb3hLvzqg+5cteUOlfrTcON326ziSdq1n6VR7NQfOTXwNC5iKecN6S33QhZHuJOyBTst
 P45hyTuWeDdlfYt4vqy8HO9RTZ8p2onWR0MlKdfgYCf6PEuZiRxjPHX80vOCChr7q1nEwTHM9+n
 1fl5hz+w/W/u5tX/qbcgDlFHy6Adv46JTtXG5m90xse2lUtEq948kBJunx5xCNZQswVWIbnD0je
 gEGarAHqcg2my0hdFrbQ+ct0AA/M3JRoJVzF0CkLaKHksGucpwFd1BzOwZmS/1JQTYwsPzUILuy
 exd7XiC/5pNR91vPeOdf+xScoGV3mNowc3gIl4HidrvoUcUDMXqTzkWBD/UGqzEp1OS0YaX0HTD
 ZBalQLFqnO3ID4PDEkwQnZQxYVIQ==
X-Google-Smtp-Source: AGHT+IGcK6fcms0yCUedVPDMcHgRLCCQET43IUN6qZG+p2/bZ5jAsfYFwb4Vs4LSVfvVAaGifXWlXw==
X-Received: by 2002:a05:600c:46cc:b0:477:bb0:751b with SMTP id
 5b1f17b1804b1-4771e1e0589mr45806865e9.27.1761812630452; 
 Thu, 30 Oct 2025 01:23:50 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429ba92da9esm546610f8f.25.2025.10.30.01.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:50 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:49 +0100
Message-ID: <20251030082349.35142-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022163104.17325-1-dario.binacchi@amarulasolutions.com>
References: <20251022163104.17325-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812630; x=1762417430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2ESk455kPZi7V7UMu/zinnG7/xej3oUxZKWxLbrLps=;
 b=eKNXgom+YkLiFW2An4HKDn7CR+/1IhdZok1A3NesXsP4z+RgO8xd0+ChYwJOgiSOMO
 ZGWJnvSkaYHcRIEPo5u9WMVQUipyWx6lGUWytjr2Sd4nDyPkFqrLQvRQlhOSkPhv95gx
 NGoZAgu9c4emsuvIVMNBjpxnsBncyS3uJqo4Wd6SCpkfOoovAsdFB3ElA4rQlHNDD/DT
 B2iX6Rmohf1NRJ2Tj4s789yQWUCMoUeglgVZ75xG+nEpEuSXqMi5KVXQhGJG5rhBU/CT
 2Nux29pDlM/279jaKaEZukMyI3vVWXRAA1API+7idePo+HhGON6P4TN8/zudVNCdAiQt
 oexg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eKNXgom+
Subject: Re: [Buildroot] [PATCH 1/3] package/libgphoto2: fix build with gcc
 >= 14
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
> The commit adds a backported upstream patch to fix the following build
> failure:
> 
> ptp2/ptp-pack.c:3168:31: note: earlier argument should specify number of elements, later size of each element
> ptp2/chdk.c: In function 'yuv_live_to_jpeg':
> ptp2/chdk.c:1203:41: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]
>  1203 |         jpeg_mem_dest (&cinfo, &outbuf, &outlen);
>       |                                         ^~~~~~~
>       |                                         |
>       |                                         uint64_t * {aka long long unsigned int *}
> In file included from ptp2/chdk.c:31:
> /home/autobuild/autobuild/instance-0/output-1/per-package/libgphoto2/host/armeb-buildroot-linux-gnueabi/sysroot/usr/include/jpeglib.h:989:43: note: expected 'long unsigned int *' but argument is of type 'uint64_t *' {aka 'long long unsigned int *'}
>   989 |                            unsigned long *outsize);
> 
> Fixes:
> - https://autobuild.buildroot.org/results/db742e301a401c9f4bdf3c7e8cfde9f0ba1c4558
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  ...gth-with-jpeg-jeaders.-fixes-https-g.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
> 
> diff --git a/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch b/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
> new file mode 100644
> index 000000000000..910c9b125add
> --- /dev/null
> +++ b/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
> @@ -0,0 +1,39 @@
> +From 721f7f8c3ec8058d504607873e4c317aac0c99c5 Mon Sep 17 00:00:00 2001
> +From: Marcus Meissner <marcus@jet.franken.de>
> +Date: Mon, 4 Dec 2023 13:26:08 +0100
> +Subject: [PATCH] align outlen length with jpeg jeaders. fixes
> + https://github.com/gphoto/libgphoto2/issues/941
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://github.com/gphoto/libgphoto2/commit/721f7f8c3ec8058d504607873e4c317aac0c99c5
> +---
> + camlibs/ptp2/chdk.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
> +index e1d898f37811..e775ea1d4bbb 100644
> +--- a/camlibs/ptp2/chdk.c
> ++++ b/camlibs/ptp2/chdk.c
> +@@ -1150,7 +1150,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
> + 	struct		jpeg_error_mgr jerr;
> + 	JSAMPROW	row_ptr[1];
> + 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
> +-	uint64_t	outlen = 0;
> ++	unsigned long	outlen = 0;
> + 	unsigned int	row_inc;
> + 	int		sshift, dshift, xshift, skip;
> + 
> +@@ -1161,8 +1161,8 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
> + 		sshift = 6;
> + 		dshift = (width/height > 2) ? 6 : 12;
> + 		xshift = 4;
> +-	/* Digic 6 cameras: 8 bit per element UYVY,
> +-	 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
> ++		/* Digic 6 cameras: 8 bit per element UYVY,
> ++		 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
> + 	} else {
> + 		row_inc = buf_width*2;
> + 		sshift = 4;
> +-- 
> +2.43.0
> +
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
