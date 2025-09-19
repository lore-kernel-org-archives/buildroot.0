Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54346CAC5A8
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2681D80EE1;
	Fri, 19 Sep 2025 12:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qvf76dokZ_62; Fri, 19 Sep 2025 12:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4758980F7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4758980F7B;
	Fri, 19 Sep 2025 12:58:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFC15E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9608580F65
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkIwFmFpqNsH for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81BFF80E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81BFF80E60
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81BFF80E60
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso22413755e9.2
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286673; x=1758891473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bX8w9eekXYcjsef/7Q+OK5rvdtBiCvspvnKikADJHDQ=;
 b=LXb09/Ug26PE7BQlWnOR40nbGiLFiEulbWGYLTGh/j+KTEyvW9YbV4izJhn5Ol65wF
 nQdz0WBGFGABOaeOya1y1OX8uN0Iv6q0v3MrpqO3um78yOSaIHFmW9vyVOg74MeNYvUz
 bkQBpyHtPj3rHZ5NbiTP7lhF7dPDj6ziSVBMPT4iTp8ddUr1+9n+PLdoXN2ZmQUBA/TZ
 aq9V5rukdtORYQNjbihiJEEV7wp7YLL1h74bgpEO81LesU67aMrq5eHA+TS22zd+WxdV
 c+8quyfmFs5NBVM17Lkj5es0rDsDHYGCQnm8kI3xDLNa1PcSMH5Iirs+FjU+eGsJfrIz
 Ov2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUenVAUJUNkzkRcaEmGPRfHcIkEvJe42+VAZ7mLy4pyKtU90d8kEfGLNn33bxlVz/rl8xI1RCUFcpY=@buildroot.org
X-Gm-Message-State: AOJu0YzcHs1W7Qw6ZD6QQ1zakbDmiAVI+TMz7gRPi8JDRrinGgDxrx7d
 5eu2E4j4UlOpuSSD8vlQSsPry6xhPg3W/MgNKdaJ9eTkrnVuBd5tfWrtoIyIBf8XCZQt25Gy62U
 E0YI0S7U=
X-Gm-Gg: ASbGncvTrCVnUuErHuA5FkoKX/VpXcv7vEABDkIOjtGrjAsFulRb7xDN/uTsyIavD3p
 q5M940a6YhiF7YZmrdnksnqGrcW0mW1f/VIeeCI6KbNqPIW4TN7eJSIDYrOM8WjE2eIfwUtU07k
 bYlyhrM0cxyC8vmVMIqZ/fJ49FVlqYYHHd5W3jsNfyXcD5VlLhIQkVyMFSpjg8IljQtyo6+VzCz
 So15k6iCiY5OkKqSVIjAY4AXN4wnN9JcSc65sJgH3LAQiZ7QZBj79BMKQuhai/rh+ZvLH3Tsl0D
 620pc7zpMqEuY3Ziocl73I3B7Zrd2WWbyBt84xnDAewiTSIcGbGvRwjmg1AT0oy+5QXKtqLWFZu
 Q33sxRuEud+AM5Hw=
X-Google-Smtp-Source: AGHT+IExgf96S4DoqDPU8RE5lHthXJviI7+6ae+/z6dNeOVgfAFIUp2t7dd2qindLwdTubg3iEnMNA==
X-Received: by 2002:a05:600c:450b:b0:45d:e28c:8741 with SMTP id
 5b1f17b1804b1-467eaa8821emr26396605e9.29.1758286673462; 
 Fri, 19 Sep 2025 05:57:53 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f0d8a2bfsm87722785e9.2.2025.09.19.05.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:57:52 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:57:52 +0200
Message-ID: <20250919125752.137468-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908192435.214306-4-giulio.benetti@benettiengineering.com>
References: <20250908192435.214306-4-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286673; x=1758891473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bX8w9eekXYcjsef/7Q+OK5rvdtBiCvspvnKikADJHDQ=;
 b=MIVQndw7X3AAGdJKEqssNt0YwjLZZaXwIod4OOppcYXQlx8uCQFdOJ1aCuohrVkrxn
 /sjyvJ5xK73ly2gCVRJCXB7nA52xIWHKturMb5jNybXgcHlciCQi1lmgWhfjj85HyEbB
 yNyjd7ZZAlAtlQg1LQqGyb9onAb6z2suR7CoXOqnWVWAcYjWbBiIQuTyveN2ih+xRqvg
 8BeIg1Uz45OB7iId0jqCrNEB0Py87fLar7vyaS9NZmO22rqKDmf2vKL3JrIH6FH78bSx
 ISOZ9RTYWA3RiE8Z6Cd84jKvygD3ga4iW4LnWBG8qGLSZmoik3X5R/x31A4s4f5ZMcnH
 VGSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MIVQndw7
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: fix build failure with
 Linux 6.16
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
> Add local patch pending upstream to fix build failure with Linux 6.16
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.08.x. Thanks

> ---
>  .../0001-Fix-build-for-kernel-6.16.patch      | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
> 
> diff --git a/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch b/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
> new file mode 100644
> index 0000000000..311d4fcd4c
> --- /dev/null
> +++ b/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
> @@ -0,0 +1,34 @@
> +From 13f85e370c265b782a801cd22f86cea6f6cda876 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Mon, 8 Sep 2025 21:04:30 +0200
> +Subject: [PATCH] Fix build for kernel 6.16
> +
> +With commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
> +from_timer() has been renamed to timer_container_of() so let's rename
> +according to linux version >= 6.16.
> +
> +Upstream: https://github.com/morrownr/8821cu-20210916/pull/187
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + include/osdep_service_linux.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/include/osdep_service_linux.h b/include/osdep_service_linux.h
> +index ed1e19b..c25f6a2 100644
> +--- a/include/osdep_service_linux.h
> ++++ b/include/osdep_service_linux.h
> +@@ -210,6 +210,10 @@ typedef void	*thread_context;
> + typedef void timer_hdl_return;
> + typedef void *timer_hdl_context;
> + 
> ++#if (LINUX_VERSION_CODE > KERNEL_VERSION(6, 16, 0))
> ++#define from_timer     timer_container_of
> ++#endif
> ++
> + #if (LINUX_VERSION_CODE > KERNEL_VERSION(2, 5, 41))
> + 	typedef struct work_struct _workitem;
> + #else
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
