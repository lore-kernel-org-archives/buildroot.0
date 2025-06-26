Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0773C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C912261210;
	Thu, 26 Jun 2025 19:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0XfGkZ3KNeE; Thu, 26 Jun 2025 19:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD13A6123F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD13A6123F;
	Thu, 26 Jun 2025 19:29:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0391810A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCC4581DAB
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9Nz1EGd5VXf for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 037F081CA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037F081CA3
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 037F081CA3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:28 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so11033935e9.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750966167; x=1751570967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ubGW5YkN1BCAxtNWLyGmEdztcRxUJoNr9h9wQbTN0g=;
 b=ds5B3nJxvZvjCkd/6OJQXkT1sYFHrYw0TkJWuhUYj683a4fMOSrhObNIVxZuMAVabX
 HwBW/PwThM2k3hhyfVtsrVbwm/H5Yi9Xj3i9p+FlOCcDTJT0qqzHcYgXgTIGeTXjUb2R
 yPN5jRdHJWuPYwm8GIB68dTt6XOcf8IdODCwkfdNlmkluE56p3Sta5nWXnleubYJ64kw
 KR6FPyBqheeHTZFxhPB+42w1Jl79Zlkf6XjU4Hhu4iTWljkiqFZ8u3lEXxh3iQDibwAq
 WpoMa7Xfi9/5AyyPDmR2ZryURJR3AlTtRf/ppbICL9wMzVyBFsFQFHJrLr3V5nWSjhUr
 nysA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqDCbLGfSvKv+eWGGxV3YqgU15YF/XlrFFT0ZksM0AevAwv6NDYv0sdacy1kda/Uj60zjJtmYnw9s=@buildroot.org
X-Gm-Message-State: AOJu0YygzjNZsbgpDQ2byM1vWIhvuzZiH41PxtO63tCVP2UX3ShO5Nro
 EEwNchwlFd+gkMPZ91e+Eh4l72MU+JNpZ+15VYMtWrFsjozvjxBxVjDNu4r3mj926R0=
X-Gm-Gg: ASbGncuYWDxxyOyie72gQs3l3s9/jQPrMy4JnoEi8QJQvG3xFAA9EAEj4Dv91e17Rqi
 PWEo1fjX8WePEhY5F2LymvEffjKoTeFJsrzID+awG605tZAyXEzEt26rrE0IQ0Uus514acFREFI
 eg2EX8YWWnlWVyVmg7Y1M6L3aSA9ckl0o4R1vgzBCvsMIF9vJsiiewKnYCCCGbDb8X2h7x6GPhE
 48vxdXNZVvTTaA5xtv5+ejNCjJiIAToS9gvWTeHxtH/nN2Bv3KpRsnPTrglWL6N8zMl6WoKbD+D
 bFMusXHkeWQuAgzpKo2IB7qHH0xS1yPvY/PzhNAgijtAeDoJcLvC6Ii5FEbz4n/j2FreSWmolja
 ZWzqRSszZqt31QQ5FgsPwp5JOFACKEvgEyjkVrdEK+YM=
X-Google-Smtp-Source: AGHT+IE3PN6t15rGrubS8N+2SUVIDTmk7h66w9hFJE7nIPJjLhcfPNvSGvG2n1KmIylZYENB4MbcbA==
X-Received: by 2002:a05:600c:1c01:b0:43c:f6c6:578c with SMTP id
 5b1f17b1804b1-4538ee41ef3mr6441455e9.15.1750966167014; 
 Thu, 26 Jun 2025 12:29:27 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52ad2sm666627f8f.48.2025.06.26.12.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:29:26 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:29:18 +0200
Message-ID: <20250626192918.11933-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623083941.724176-1-titouan.christophe@mind.be>
References: <20250623083941.724176-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750966167; x=1751570967; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ubGW5YkN1BCAxtNWLyGmEdztcRxUJoNr9h9wQbTN0g=;
 b=KXjqOw4/4gl7JMgHRvkppxNOcGinYzLyQJnZYZ5l8nysdaRY3voXIOiPZi1++gBAUr
 5dN3/HhSwwWU679F1BD2Va+cO/NQ7xVl1oBiLPXs27GaA68PWDKB5PuqZseWOhHwUDuL
 mEn6xLSE/kobp52w4R1S9UCL8Gs+8Hy+Th8lKMqSGzkoqVLPJEO4Wg4PbQsNZ/zYGvwH
 6njqDpMO3VvX+kTzCtJ+RBC9R6dOEomV94YwPXMOQbatjctBEgb2Ohws2eV+9Xa414vT
 86M7ctjyhVOYAtwrNz2caM6s++3gSFt4PUFTDVD33QD+Nz9bAyZSNe/1WVQkcMfopj/w
 ZA8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KXjqOw4/
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python3: security
 bump to v3.12.11
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
> This fixes the following CVEs affecting tarfile extraction filters:
> 
> - CVE-2024-12718:
>     Bypass extraction filter to modify file metadata outside
>     extraction directory
> 
> - CVE-2025-4138:
>     Bypassing extraction filter to create symlinks to arbitrary targets
>     outside extraction directory
> 
> - CVE-2025-4330:
>     Extraction filter bypass for linking outside extraction directory
> 
> - CVE-2025-4435:
>     Tarfile extracts filtered members when errorlevel=0
> 
> - CVE-2025-4517:
>     Arbitrary writes via tarfile realpath overflow
> 
> See https://www.python.org/downloads/release/python-31211/
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/python3/python3.hash | 6 +++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index 2772e33109..923a632165 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,5 @@
> -# From https://www.python.org/downloads/release/python-31210/
> -md5  0c0a6cce86d7611aed691d61e0599de0  Python-3.12.10.tar.xz
> +# From https://www.python.org/downloads/release/python-31211/
> +md5  9613d56b90d0d0cfd19980c7e2956a06  Python-3.12.11.tar.xz
>  # Locally computed
> -sha256  07ab697474595e06f06647417d3c7fa97ded07afc1a7e4454c5639919b46eaea  Python-3.12.10.tar.xz
> +sha256  c30bb24b7f1e9a19b11b55a546434f74e739bb4c271a3e3a80ff4380d49f7adb  Python-3.12.11.tar.xz
>  sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 6b3a3e81f3..8bbff066ab 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.12
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
