Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A24EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44DBC61288;
	Fri,  6 Feb 2026 08:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNqX_fFFUVEH; Fri,  6 Feb 2026 08:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 545786126D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365538;
	bh=0c8dIaDyvcBUEjxMUPALJsp4ox2sPPDI4hKXoXvtzmo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gMtkc4n/X3cQSCv1Yu3Hat6Z2GJlg9Xr4qYMh1Fbsswswk+0mr6jJKfrClO6ESd7V
	 iM5fjS4pwJ7PGaibAWOY1rK3MOaCJxVT4HfwVSo4xN7UYEH7Em867eCPRp2SMQGVfV
	 CC6Ga8RRzdkYdWIdC0pwsAOrTIjF5ywx2r4wUUzL+0+WqkJgTf+P5ZyhMy07j4rsJJ
	 BbhO8vwFWu5C3RVP4kVgng2SeuVCVdawbNVLijwHGuoY/dHZWP4cLGbBYRC3y1Ch3i
	 0RgsZvvsbXAupzlE6TOa2R964j7BPiiqH+L7p9Cx2qxjKKl7y/7eeqyboGPJ62LHQA
	 wP7HRlmkXwK+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 545786126D;
	Fri,  6 Feb 2026 08:12:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B59DA219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A139B61202
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnp2zYisikuv for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15E8A611FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15E8A611FC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15E8A611FC
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so13410095e9.3
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365522; x=1770970322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kRedvEiEPoyrKCvpYQELsBZVwoz9SBJPDZ/Ys8oNsv0=;
 b=ZYTlSdBIE893ZGqY3yi61lc8yHY3doopHt9GLNIxYUJGFU/0BOKO4vl4AnLYK2FQHg
 GDfpnd5+/RxK8kJ84c462OiNqodx27KFSLrNgjgIYIbYSrQTcx4CU0UhhQp0wiZMGsO+
 KVzyys1P4DoEbVizOveLx1zHgoZBOdhKGq8rpDEfpLMS1QV21ozSx+Gaga7Lfk9oOzxB
 Nzuv5Zo9mcOOFpOjnHBtlCLAGIfsEvVl+huzr9FsYQu9yPCFLXHMy0iS8p022IhGKb/p
 OO+vi/PW++jCy8Ex51znFdwf4VN6dHDJi9gohJrbIfP1j2Ro01jYQNdRKPlGUoJ3Nv1W
 2qsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU81mCdb91cl7qH0AGSkaysJeN+9wHCqIEOLE1N6VKIGE76TEMoefePxBIjFUzWz+K8eT25Oi2ms0=@buildroot.org
X-Gm-Message-State: AOJu0YyMYeOAGtMCxOKQYryZ/fz5gL9MchSzzeQGTyKSgL+AYt6iDtcJ
 e4Yv8VjwXQB5C6A4lTyA160sv68In7vCsGoc+Ia81U66fui1UNaZV61f4kQVN34eu10=
X-Gm-Gg: AZuq6aJSXgyxMAa0oNxpp2DC3cyVFZvoEr3JzGJ8JsZfbqjed66mZ64kD1yYOzbTfZ/
 wntrTqHH9QbNvnroGRXTbA0/YEmAheyxeJG7h1z+9qlYz8WNYeihP4FuD3NH1hTfYqw/E0aw2cq
 +s1rGMOXW++12raZJ4/d63JucRMI7sxmFKHzuz1Pj5wKZotscwR5xyRZW6+fevZeKZivSikqme7
 I/EPduSrEemo67ZpAJF9Thff/eq2OhROSQWM0Dk7L9eY15DjfdY4Up7M36nJPjB1KKSmLz/Vuaq
 xs/kx3FVtE7xZTQxasa8Bs2nUmAgoLc7iaSMdPjryL8AaAPJgu7mJq3mqzmbM6vJrRvoa5TyZPE
 jRgd2wVyD8KNAWtt/Lk71agV0VHrKafRU9irz6EfMSX93fZicZ6+27gx4zu4cdFLlRrgjILiU9v
 bLayw=
X-Received: by 2002:a05:600c:3e16:b0:480:4b59:9327 with SMTP id
 5b1f17b1804b1-483201d6007mr27254275e9.1.1770365521861; 
 Fri, 06 Feb 2026 00:12:01 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483228ed4f8sm20541405e9.0.2026.02.06.00.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:01 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:01 +0100
Message-ID: <20260206081201.32793-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124152311.680810-1-dario.binacchi@amarulasolutions.com>
References: <20260124152311.680810-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365522; x=1770970322; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kRedvEiEPoyrKCvpYQELsBZVwoz9SBJPDZ/Ys8oNsv0=;
 b=CgBIL6xAPgdDzPFuATra6lIY+3S0IkHZtxTnaczylnr00STepHNUxgXCsh5MSCpuaS
 QvwcZu3inqY5Hhowmrl586UHRPproei3RZBN+TQZnd1mTCuCtiFrPO4DWSc9Yg9A3yto
 +V3BtNRgI1z/j7KHwWxaO52p3EumiTjUp0amHUasQZYBvfVL/a3PsPsN5Pj7cWRV0cSM
 4A85vzEYBAgpawEPI2v2vaEGYUZj099TMYw5pFzCj5e6FPUFOq8UkH7VboNz9BtMo5K2
 Ze7Mf4MrubBXtrurWob8R5lbAKKg1lR2GyQZKA3nUk7OhIO4870MidCwJx8md+Gkehqq
 N0pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CgBIL6xA
Subject: Re: [Buildroot] [PATCH 1/1] board/stmicroelectronics/stm32f4xx:
 exit post-build.sh on error
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
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
> index 4fcce6150071..2c5b6be098ac 100755
> --- a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
> +++ b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
> @@ -1,4 +1,5 @@
>  #!/bin/sh
> +set -eu
>  
>  # Busybox is built without network support
>  sed -i '/hostname/d' ${TARGET_DIR}/etc/inittab
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
