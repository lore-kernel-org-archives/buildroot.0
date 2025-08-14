Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFB6CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E39A8607B4;
	Thu, 14 Aug 2025 20:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMAQgAYis2xd; Thu, 14 Aug 2025 20:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E297960785
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E297960785;
	Thu, 14 Aug 2025 20:32:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB70C1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0C8D4034C
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TY0wqtucDPV for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3F484031E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3F484031E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3F484031E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:58 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b0cd668so6869245e9.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203517; x=1755808317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aktVMaaEYl1tcrekwM87+cmlKxSjEjsGx/43FNTF5Ac=;
 b=hhj4XapbwsSAxnbOCuDJQ/igQaxGnWlt/yjeMaeHZdY18ull38wErbzS+W3j9r1PbW
 8HpdC7lSi4PpE0ou9FCc9Um626InOBaZAlXgiRtv1CRLH+AympNUTkbnXpUJyq9xM6B4
 9JDtspTgfTcUTVc4fDAg72zIjxbZ5JNOKmDn3Tn0H4sXRUe2wbpo6N25C3WRuLygxQXl
 JsSElxH87JbRS7V59vwHR3MC78okl8i6cETCmP76yNowc3poLa0w+nWfyfkwWjv7Fg3k
 T36UkeNiu6Z/SksnCmSUwMxUefVNZTnijYB8QtrXPSQexSkXCnuP/spEbeccJNV6p6Cg
 2HXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/EESFhsd9twR/OSSKxpKnoADtIGJ+DOiX3HkkprKzUJXUjlewqtFmBCb40x+lvGNZ2ckcNmnwp9M=@buildroot.org
X-Gm-Message-State: AOJu0YwtKLnIk4d2j2W8I/YJRS1qVY5HkfQh4s11PkAHGgav/01XrEnS
 ijTl3MKbgaj1ZutNKZw/JCGBcIyaGvutksvPQCCmbn9jBbA7DtRlTbJsH5nL6SoLxwEdVLW5n1l
 rPghtrio=
X-Gm-Gg: ASbGncu3TgekeEKM3eREVZRHKoQRRJPp1JpImMomcldmUhFKxfZ9R+cmzx6jeC5HRXU
 Brjs8/BAaPhk4xOCWjZucPjDc1r100cSglgkJxSg6Sb6pPCT35yKxwHkuYz4QuG3odng37/fEVm
 DxnPrczmPyOjRwsU7YZZ+GqyPDjLcNc/g57iRv5Lb7ZlTTu+hUSANxne8MEMbraDXLhfjOsMqcS
 3W/a2LxJmo0cJb/Lhh8QAnf0+zTj0u3Szv9KE80UVFfuXp7X/zMIn2rk6NDRscea084RY91rfU3
 28DD/WSjM+nCq5nyWcXClYCE0zcGntXSm+Z9rupO5Xt1cN3L3YEFb7zdMDSjOxhLnBYwihYUcAZ
 p1rYmFAUpsANKVg==
X-Google-Smtp-Source: AGHT+IGVN5r5Vj1Mz9xWToAY0+c29uedjdlWN6ZnAgYvCAQmt30GIA6zKjiR0cR7KWQ3i6PN3mDzmw==
X-Received: by 2002:a05:600c:8b25:b0:458:affe:a5c1 with SMTP id
 5b1f17b1804b1-45a1b947356mr37479715e9.5.1755203516573; 
 Thu, 14 Aug 2025 13:31:56 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8fc28a830sm28201850f8f.16.2025.08.14.13.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:56 -0700 (PDT)
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:55 +0200
Message-ID: <20250814203155.2815991-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250802-fix_ngrep-v1-1-03dbe4c6b0ce@bootlin.com>
References: <20250802-fix_ngrep-v1-1-03dbe4c6b0ce@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203517; x=1755808317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aktVMaaEYl1tcrekwM87+cmlKxSjEjsGx/43FNTF5Ac=;
 b=DdLqNNYSHfGIrQOudKPvXHQE151bQgiEnZK+CaTpC07stliKoDfg0p41s/YIVKfdph
 eizNQxiGXc4udw3czgxl7n+Mrzn4LB/YIgh8RwnG9fO8jWxMUKW6RH6HJQVP4oO9aULm
 6m0/dMooxlOvtlxTLPwkf6lvB7X54jdSzDec48mcifHRlL8VH/fVwMSAflLh85YlkQpx
 CGu8PeB3EC6GeTrLbnPdPyLz8w+pciUNrQS+HcjIEl5a4PM5IjbKIE8J8ravdfaX4/0m
 V/PCK+ze8jyob++T6GzZzsSY+XuPZtj1qUdwPKxUZMqK6DRL9+V7z4Zs5Z0T3ZRrzDNc
 cboQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DdLqNNYS
Subject: Re: [Buildroot] [PATCH] package/ngrep: fix implicit function
 declaration
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
> Fixes: https://autobuild.buildroot.org/results/20b/20b924c5c96b3f43e381d87e59fb160ba8d3dcd0//
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> This patch can be backported to 2025.02.x as this issue is reproducible
> on the current version of the LTS.
> ---
>  ....h-and-tcpkill.h-to-avoid-implicit-functi.patch | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch b/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..6d596bfe3791a33994179494e8c08ec7a9439975
> --- /dev/null
> +++ b/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch
> @@ -0,0 +1,44 @@
> +From 52515bae377f221b5473d9040f5f43ab1c672672 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 19 Dec 2022 11:49:06 +0100
> +Subject: [PATCH] Include <err.h> and "tcpkill.h" to avoid implicit function
> + declarations
> +
> +Implicit function declarations are a historic language feature that
> +were removed from C in 1999.
> +
> +Upstream: https://github.com/jpr5/ngrep/pull/28
> +
> +Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> +---
> + ngrep.c   | 1 +
> + tcpkill.c | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/ngrep.c b/ngrep.c
> +index 3df9389..b2fcceb 100644
> +--- a/ngrep.c
> ++++ b/ngrep.c
> +@@ -98,6 +98,7 @@
> + #endif
> + 
> + #include "ngrep.h"
> ++#include "tcpkill.h"
> + 
> + 
> + /*
> +diff --git a/tcpkill.c b/tcpkill.c
> +index 5388ec5..ac8fd2e 100644
> +--- a/tcpkill.c
> ++++ b/tcpkill.c
> +@@ -14,6 +14,7 @@
> + #include <stdlib.h>
> + #include <unistd.h>
> + #include <string.h>
> ++#include <err.h>
> + #include <libnet.h>
> + #include <pcap.h>
> + 
> +-- 
> +2.50.1
> +
> 
> ---
> base-commit: f5101638b9f917dc4c569828ff3fee0c486ba8f8
> change-id: 20250802-fix_ngrep-59ab75bf5919
> 
> Best regards,
> -- 
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
