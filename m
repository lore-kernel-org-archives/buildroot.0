Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D7FCAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BEB9822BB;
	Fri, 19 Sep 2025 12:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4E6-Z-VM6kb; Fri, 19 Sep 2025 12:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A88082470
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A88082470;
	Fri, 19 Sep 2025 12:58:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97230D7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 880A381EA9
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qa4iHYsJqxQG for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:57:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71DFA80E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71DFA80E60
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71DFA80E60
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so852283f8f.3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286676; x=1758891476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DgoetXgr+cd7uyq8JLwU2AK3Hpf8ak2ZhHt77zzl5AQ=;
 b=qvXDvRUBwYpSpKOLRAjuJp7v3CucXMaCFVgzR4slY81UfwF5xg9Hz+MF8A3QfluRTN
 wTUKOIEQ5vhP2g6mzd/DTYLHrq+at2YcxKRVSKmKjVahcwAkhiEmMJ/M+1K5rzDBM2d2
 hcO1+fXciBWW9KZWORrMF64lt9RzQKcAVuFFDqaG7aTyWeuj0zXijhdKt+AzmeTtEFgb
 gCs3zR5qUFLqWQlBg5QfOGAP2y+YL0Y8jt8XoKnXJaAlpZ0iMx9aIz84b5ZU2FAn1kYR
 +su1egSxvFUsiR2HN8pQIcYNTpbDJDbMmJM7rRnPHQLijRybfxSqyyiC/IeGxBkaLR8K
 G17w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/9wCSjEjppeA9B6d/Wpz51ckJyTTLnHX3bVdeD3fMxGZgRfP6VtvuUwj+wK3KBbeivErdp/TgU9Q=@buildroot.org
X-Gm-Message-State: AOJu0YxJTXq2EJbXxCMcoYHTyRUOjhCQpab35ypyOkc/P7KAD9W8CKAu
 dGvh4moEyQByOSYYCFN4vmzRUI9QCnyB4NCENQUhGkr2YoauuirjNS01X9PHxK8+MYI=
X-Gm-Gg: ASbGncuT6tfYApCpT5rSytbA2n5RTC96ydPNhh4NZ4GPsuyKiRBjgOb9cRd3oicb4WX
 0CYDt3Sz9q471m+sG464I7vbHDTCXxqqUP61uoPfK5IZ50nNSdVEMDnTcfHZFJvLlwmG6Qlmu6D
 vXQfjmRJxKSxA2pOpuDBiPNr95izOxkQ6O/O6qwMTIMgyuEAGEfl+J+0Jv0TmfZxnlqKsKPwhZr
 bNcTo3MFW57qun11AJtcyLPMrRaKQwZvuzi0ABf0qyyJTLYBQ3oOk7YwnOoKl7kaepUpkd+YVFg
 mavAii6PmSDUn9dcRvTUkifnveP8H9txWRg5Cvc459doTo9bCN852l8nZPDAqOIMaO1Kd99f0NC
 y4uBlR5Ex7WHH3ds=
X-Google-Smtp-Source: AGHT+IHgfbnIFxgb0qt/EBC/qexBDvy4hsTTfH6wAfZkPKTkDJ/dTKpvMZ0hujGhW/a6eke9/ZA8bA==
X-Received: by 2002:a05:6000:2002:b0:3eb:2d8a:4fca with SMTP id
 ffacd0b85a97d-3ee8a5bf2cfmr2211110f8f.63.1758286676309; 
 Fri, 19 Sep 2025 05:57:56 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613d33633bsm127977145e9.11.2025.09.19.05.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:57:55 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:57:54 +0200
Message-ID: <20250919125754.137576-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908192435.214306-6-giulio.benetti@benettiengineering.com>
References: <20250908192435.214306-6-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286676; x=1758891476; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgoetXgr+cd7uyq8JLwU2AK3Hpf8ak2ZhHt77zzl5AQ=;
 b=G/7YRvDPSwWSi9Iz9fP9/alVx6l9XK1SCEZ8xK76rCeHE5YztH6bTehwb/twW5Qesi
 IUVIDqZpZdrFFFsUINnAFjWVojasraag1+cUkdDcmyzzTuW8QPHuye65sA2gE5vNoPov
 Rdso99s8c3Wu2EJZKGg7g3xHLIXPwHOrXIn9f+0hI2gbq1Dg3TZ1alB25g8xZWEoWrpo
 zEQp/i/AOWqwGfgpGoy+w8EI0InrVdTY6eEVKHsyLC+6Z7Xapqb5Q8Dc5s+XIyeYoGn+
 U5unrcy40KpFg+IkeYNHfq5MBMRuVFXTqDt/+AF1rSc9G2Z6BBlk1lgJ/EOhD9Bytmyk
 oxMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G/7YRvDP
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: bump to version
 2025-08-08
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
> With this patch package builds with Linux up to version 6.16
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.08.x. Thanks

> ---
>  package/xr819-xradio/xr819-xradio.hash | 2 +-
>  package/xr819-xradio/xr819-xradio.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
> index 3189b3b7f1..fe91d856ec 100644
> --- a/package/xr819-xradio/xr819-xradio.hash
> +++ b/package/xr819-xradio/xr819-xradio.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  049849b0821e5a41a3f7ce291caf216775f8fa2060de6d49351165cc4e6aa7f3  xr819-xradio-506fbc323f1c675d037eaf7ee928939394761aee.tar.gz
> +sha256  c06dd87948b4a4c1bee070bbc3ce07b8711ec027e78ab9b83ea1c7350472105d  xr819-xradio-d766844ce8307e5902b3ab461f06bf8ad06891dd.tar.gz
>  # Locally computed
>  sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
> diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
> index 5315ab0ef0..93fbdacb38 100644
> --- a/package/xr819-xradio/xr819-xradio.mk
> +++ b/package/xr819-xradio/xr819-xradio.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XR819_XRADIO_VERSION = 506fbc323f1c675d037eaf7ee928939394761aee
> +XR819_XRADIO_VERSION = d766844ce8307e5902b3ab461f06bf8ad06891dd
>  XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
>  XR819_XRADIO_LICENSE = GPL-2.0
>  XR819_XRADIO_LICENSE_FILES = LICENSE
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
