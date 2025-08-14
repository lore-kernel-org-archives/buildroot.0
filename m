Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF96DCA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96C96607B4;
	Thu, 14 Aug 2025 20:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6FCLsRmmKbl; Thu, 14 Aug 2025 20:32:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07F3B607FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F3B607FA;
	Thu, 14 Aug 2025 20:32:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A85228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31917607D0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEwNqlzHfEAP for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A4E9B607CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4E9B607CE
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4E9B607CE
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:14 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b9d41d2a5cso1064305f8f.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203533; x=1755808333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Jpgui9FC/nMa5UAvE8bBOfxF1Ss97WZVPFAvTQ+X2E=;
 b=qRk966OJvxxuGinSozVqMuMNWgL7+C9jHoi9Pstu7nhFQCxp5F3Dp43gEW3WxwSMhp
 a8m8b82Fli110ClRHFiJJC4BfqowB2PtU+M7uIME8j1Q3vs75Ev/OOTnZGiANsUOf+tS
 tvwOKKA+RddurtcxjelDUoeMZP31Cqlut+S0WNv1L0vs8bz6JwF3g7mvq7I0h+HTWYSH
 iuwr7AkwqJaHpxVorTbU1mGrSrlre9SyBZBWaaM1n5ns+GaL8BFBbaWlL5SHj/TH9qod
 8Wmf/ICXwX9xCNqQRm/CLtNHCVKRFCJXJjnK4UX7yS+gYpcOqo2qXoxnNgY+KtoOgsas
 9O7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCyFqZiFrZu60pqL0OAkjOs9v6O8AwVKyJJyGb0MFH+2wLV7U/eRJrJwRIgbPuvmrpAP5/Ee1s6S0=@buildroot.org
X-Gm-Message-State: AOJu0YzEA+lmAeAiyhIv4KShJolu18E370pUr0HGGhMYLNlDX5z6IRxN
 zggcEkNQXsrp2oex5BVRalfNDVNLBj8BthFP6lstpIfvdWHjU0/s7sdBdOBhtrCWV10=
X-Gm-Gg: ASbGncsi6BKDhdTYNzrXVVNJKyyZOtb2neKGNKupzhdTwg3Wc3ltsyWawlDvD0YM9Yv
 29OwMS9cS2shOikiR/TRNMxoZoC4qCtR9/lmCFsamY0+d1stB+CLWSugFYMyvflEf4GifGKy9L+
 7NhXskwAu1mgBgWxo++ySfl/Kgcnl1yFLwJvzP0+fRyydEeeQzTI/wtHI9zguVspVIYADBalAHX
 Uj/lOXUo0F4pTltkeabl4eLbnYBhiZYooxtH3MaK0+OgbdiCfkYVli+S8EyAzKb/5ilFK/MVXzn
 twy5z9idlQNV24ihDn9l8yl4Oxkk+iHEEFd2sJgQeEJ3WPxwLvBqXeKYUvCeHinDV7mNynz66kE
 oOCimVfoF7xnCQw==
X-Google-Smtp-Source: AGHT+IEAXvrR+3FYvh6NZblQuoFFwppvTRZj6p3eq/a2jdTDjsyOqFtYIz+bQl9dvzZ5f4/DYdzxtA==
X-Received: by 2002:a05:6000:310d:b0:3b9:1635:c13 with SMTP id
 ffacd0b85a97d-3b9edf2cc32mr3866187f8f.16.1755203532669; 
 Thu, 14 Aug 2025 13:32:12 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c475067sm51259774f8f.58.2025.08.14.13.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:12 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:12 +0200
Message-ID: <20250814203212.2816702-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807100710.587721-1-peter@korsgaard.com>
References: <20250807100710.587721-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203533; x=1755808333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Jpgui9FC/nMa5UAvE8bBOfxF1Ss97WZVPFAvTQ+X2E=;
 b=QOvputv8xU7q4Dzkm84KiHFMX0XQsUk5PtwqaXi4VnpV5tC1GaPKXowXrmVeT4ilyT
 O8M3zL6VXV5NLftopJp7Dmp0maHYhnOk0th2N9dn4UegHqq4ot4ytPKVA2J5xesziAbJ
 R5p03lqXAWOszZNnlqU8PMd+S0nd5MRgs7eFblsYPJu2rwDF9m35DJzV50vFlZGw1RyA
 Dn9DOxTa5TQvvIQM159/Ngim5KuJKTSoPaNmj4GbzesQ8hB9hoc5+GwX7UylhVSOTqzT
 OdMyybMOMKWzxXhJX4zcCPHo02cgeOGGlj9vaKw2dYoJH/qNqgDKHYl8YblMSI1l4yq1
 skrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QOvputv8
Subject: Re: [Buildroot] [PATCH] support/testing: test_gstreamer1: raise
 tesseract-ocr timeout to 15s
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
> On my laptop (i5-8365U), running cross-tesseract-ocr in QEMU takes
> longer than the default timeout (5s), causing the test to fail:
> 
>  # time tesseract frame10.png output
>  Error in pixReadMemTiff: function not present
>  Error in pixReadMem: tiff: no pix returned
>  Error in pixaGenerateFontFromString: pix not made
>  Error in bmfCreate: font pixa not made
>  Estimating resolution as 157
>  real    0m 8.17s
>  user    0m 5.36s
>  sys     0m 2.79s
> 
> So extend the assertRunOk() timeout with ~2x that similar to how it is done
> for the gst-launch-1.0 pipeline.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/package/test_gstreamer1.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_gstreamer1.py b/support/testing/tests/package/test_gstreamer1.py
> index ff0302a8a6..82829dab98 100644
> --- a/support/testing/tests/package/test_gstreamer1.py
> +++ b/support/testing/tests/package/test_gstreamer1.py
> @@ -75,7 +75,7 @@ class TestGstreamer1(infra.basetest.BRTest):
>          # We extract the text from our last image.
>          img_file = f"frame{num_frames}.png"
>          cmd = f"tesseract {img_file} output"
> -        self.assertRunOk(cmd)
> +        self.assertRunOk(cmd, timeout=15)
>  
>          # We check we have our initial message.
>          out, ret = self.emulator.run("cat output.txt")
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
