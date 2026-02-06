Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0EFEB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9A4061206;
	Fri,  6 Feb 2026 08:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNd6-StQ0PzE; Fri,  6 Feb 2026 08:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F6796120C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365524;
	bh=TMnA3fPGUZATv6a552Jjxnk3bKtkQfY064B8A9b8DxE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AA5YA6eucFtRaUSTBJ3y1nWEa5rew8i6+CqDNLWqL3gAxtbNiJVonjtG2yhS8ltLP
	 SDJI2JunWT/xzaGLh5GvVgSas+KOCF5skDo8+hLe9Wo77NOgaq0vK3zc2rXqApGs+8
	 +SQr9aNF5bdRvuSmD0yAoEZQtdp5IAhtnRPz+B9nJUo6tF3r6zliRKLL7HivPBU/Vk
	 l1t0M7C478e7rczJh0zKg4mr06KcKnNg+AfaQ4wwdcVt/cguIE72nlGWeOSarfiaAp
	 YEN4TykisAkZ/Ub1sqGv/nNTiekipr7JmmOKz1V3Jrfpt6mp3VCK0XNaIHRJc9HiSj
	 tYuvyp7L64C6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F6796120C;
	Fri,  6 Feb 2026 08:12:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F13CF219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E272940A2A
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9unZeF8par5 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B96FD409F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B96FD409F9
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B96FD409F9
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-480142406b3so14435955e9.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365514; x=1770970314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ED+mJdiCm/Y35/hxlHOaCsBBlymYmOegsawPpwCKtgQ=;
 b=sFSD7qvkWf5+eHc2YzgWS2rN6tbyuYID52qPFSCBL1aLsrmxy74XFaPsJKIymlTbmQ
 BO2sJOFFm/9Finu4SxTd+FFchrc7KPJ8PigwaJM8eC6DZu03XgLx0f81TxnocVre5h4S
 z0u401C7zGTsVKA1inXQmAX0jLLd/IKFsNtbgXhUD5pUTD+kjlAFoUzFxNvswlkHk40H
 6Vmh8kE661+3R1jTzpcoOTBh8x/p7kWoy6jUMyjT9vYbKwYWjq7ddrn2l0fU6JM8E4lM
 YdHHDEpR7kcw3sPH+j2jej9ooieqvcQ0tdfdUhWaDkbS86OcKdzycFO5dR97+a/d9UtS
 cvCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU4XuoKUxDlazO/7MGCb0+e74SfqC/3JRQFdVKVAEgmI0iuubihlQtqvt/NAaxEyPi+npHWFmRm28=@buildroot.org
X-Gm-Message-State: AOJu0Yxk8GF4F2I3HJrQEufHMRkJaunSp42PWSMN/O73HYcc0Nf+3NsW
 +PylKutOQhuhe8iHRR68niUnxqMT6+YHNjQI53iL3Yu+LSbMweHVMTYbii4FZ+vP0TOZdc0FowM
 CDJgJ
X-Gm-Gg: AZuq6aLaq8qWSf/PcCg+6f5QFj9msrmfoHM6KXrDCMbqQuslfVQn69oLnmiIY1zGbL0
 0EjTJMz1f4xKwN1YjEA1IfTmsExXBVk3M51URWvQdmR0SgrXa4TBU8f9awCC2xj60l4e4jpzvQU
 a0ZsQ56fjUX+SV0OHcUNPvNPpl+m2mP7qxHDKLwXowpEWLDBRt3MlEYPQP0BayFP7BCzn3bdafF
 OffNL/PJQaEGtZrisZ7yfbqihgb+evh7LL3xE1wcixxEpPi1V8uci8kmVhaKNrMc+rorG3rSccx
 SVp/WxbwCfdXmBMDF7/7Cozbf8GghgvcfYlXa/tp81gW/Q1DKv6RgwvVaM1PMEElZ2xvWkPQbw/
 Vy+V9rnI6S5QVmHBEu5r5Bz2N09sKzBajAHLP1pupWZei6jeQdbhOVGDnoRZJ7hc54vAXH+e+Lk
 /G7tc=
X-Received: by 2002:a05:600c:4fc1:b0:483:ea6:8767 with SMTP id
 5b1f17b1804b1-48320228160mr29535575e9.36.1770365514542; 
 Fri, 06 Feb 2026 00:11:54 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483203f529bsm14872195e9.4.2026.02.06.00.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:54 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:53 +0100
Message-ID: <20260206081153.32351-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121110208.3355429-1-peter@korsgaard.com>
References: <20260121110208.3355429-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365514; x=1770970314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ED+mJdiCm/Y35/hxlHOaCsBBlymYmOegsawPpwCKtgQ=;
 b=e8qSt6BrpP4jfVa35Srd07nEOCIk2Iv2IySFXXdZ0fGz9RsORh9+SM06alRNJeSVic
 n8xei7EsdM6bwG/FrImS5+aKqEgTJCb4fMMq/NNQ6ngXVZg4Xi2oRj7lZluHcqgEyd41
 m5qicagl6ciz/+gSjHRQ6GinlL1Y7xQjmefNgvwgWBf6ZsnfNP8EBss86ZEyuo90fNAf
 8ng6tkeVTzgqu9mlBd5PTJ2hvXRxLlXmJM47Y/LVUjo90qnVvifEK4zBxoLb7WyOkaVD
 yU2oJ1e9bHKvNd/XNIMZEwxzoS80jYY2ZCw+5MFA0nyl7YFIE6XCkECApPfWjMXE/s15
 Jbgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e8qSt6Br
Subject: Re: [Buildroot] [PATCH 1/4] linux: fix 'architectures' typo
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
> Found by codespell.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  linux/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 96efbe5678..3a1852c7e9 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -473,7 +473,7 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
>  	  match the vendor subdirectory used by the board in the kernel
>  	  (e.g. arch/arm64/boot/dts/rockchip/).
>  
> -	  While most architechtures make use of vendor subdirectories,
> +	  While most architectures make use of vendor subdirectories,
>  	  like arm, arm64 and riscv, some architectures like powerpc
>  	  and xtensa do not.
>  	  In this case, BR2_LINUX_KERNEL_CUSTOM_DTS_DIR should point to
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
