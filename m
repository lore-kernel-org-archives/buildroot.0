Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E5CCA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3754D61AE9;
	Thu, 21 Aug 2025 19:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c36PrF6mM1yQ; Thu, 21 Aug 2025 19:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B96A61BD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B96A61BD5;
	Thu, 21 Aug 2025 19:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F97C25B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F14084679
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNmz7qKW9S3z for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41C2684683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41C2684683
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41C2684683
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:43 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3c5e043c85bso17211f8f.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804042; x=1756408842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6a1b6DpDoB2DLCZJg+Q1KoM2wX+sJwlxCWvbPYjhucA=;
 b=wfOMGVErHabMM9eYH9/kEE8mv8hY85xnXBZhlGQPoeDLEHyXqcb/DQNMgNIX1kyEON
 z9oz4XDm0n55fM84JQ+LN/nGhU79JuatGl1odOWxL/Hn+r0b0HYa1w7ST7qQxNv/NnQI
 7uAC9x8V7rXaOKlPqp+ZdfvW7L+qgj35HmCYCHKjSfQAdmZIJII7wPKw2R0JDkxtNnb8
 lodc9ZZzm+68MZtPjpN5nSsTdkWkYZ/g1kxgnQCVRgsPXw4JE9U45kOsiJiHw5HGKHiq
 4up0sry5+pNtO7qgKYiR6m3vg9zHDcSDhWSpQvTNJiZGrzld0wKlV58jx65Q2ZKAg7Up
 sBfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdOTO9YwVz6KA+4a/OJlb29qjabCz+Ww3LABxruyWxzyq8/tH9zIbTlpyd9BefPIG17uoK2AhhYKE=@buildroot.org
X-Gm-Message-State: AOJu0YzrkpKivX1TQkc1DP6deo3vuc9SMGni3BJSpIHFXM95xkpwazG3
 NqnoYvwhV1Z0Y6NALRv5yDVQTlzSNUHCUY1PwVOCSqHt6DTgNC0pEZm0BxCsq+HVt2I=
X-Gm-Gg: ASbGnctedSl8qxD3lbk/RUjPINNGSNO0gJcZjE8F7Y5WjasJii3lzsM80QETPuHtDvg
 qbSQq8RAgudskTJNf59aaD7ZUWC52/2IYxYU3sMowRFChOeHVZFkbsrzZ9JwG2IoYf9jHDIbQPM
 +iuqTrWRZogg/ODlypOetWUYSZPRmEuwIikWkmnA6M1tYRsm+XYn0vPHmEUPLI8QA1gjFULTbwx
 8iDMoMQC+zQT7RZF8GnXa1BDwYPv66GaajBcAniCDnd0pkwgRGUzdOoXL6zTNWYz/S3K3Om4jkm
 4B4PCob7u1u4oGj5AGaBDT/39cRTdY2NKaxKWIP7Pv4hTaZEhJ0lLTFLQY6SUnypdULOo1R5E27
 IjT0DXUCPAF3rBAy4O4X4tEQY
X-Google-Smtp-Source: AGHT+IEXiE/1i9UnARpcYoW7Mww/52zsB1+KE1OOn1GHgh93JQqNOZUPDbyV71wUOReK23d/lePXAQ==
X-Received: by 2002:a5d:5c84:0:b0:3a4:f7ae:77c9 with SMTP id
 ffacd0b85a97d-3c5d25d6679mr179151f8f.5.1755804041996; 
 Thu, 21 Aug 2025 12:20:41 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c52121313asm2412056f8f.57.2025.08.21.12.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:41 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:41 +0200
Message-ID: <20250821192041.23347-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
References: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804042; x=1756408842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6a1b6DpDoB2DLCZJg+Q1KoM2wX+sJwlxCWvbPYjhucA=;
 b=ZsXZu+wktdE0w1Ix9Io1gsqa7qKOcL5XccEV6pi2x+GUtTBLvtVib+a4tq+6FVTaoi
 VTvssptXcTRNloHpT4hpzhMkaXONe+O3DEWC6SSGXK5NfvImA9pSQjHowhB/3igSIUhP
 G9ZTbTQIhhTCMJ8Ox43TLSbznzdD49JROyLKLm5eX5mkpQKiIaMwhIQ65gWjD4+mviTD
 BOXOzOQFOMQrcR3sa5P0s9mCMR98Ly1KNOCicZlHnnCQ7H2vZZDYXo703Ctopf++JKc3
 Ieud4JbzeATkafqOric89Wk5uFlYP3VSe0coKPespOSp4KDcWZNbuRv4uj3ZkdccLi7H
 8hww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZsXZu+wk
Subject: Re: [Buildroot] [PATCH 0/4] package/setserial: patch with _PATCH
 content and fix build on newer toolchains
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
> The patching logic is broken for a while (only 13 years :) ) since
> commit 64ac7199525f ("apply-patches.sh: add recursivity when scanning
> patchdir") where support for patch files whose file extension is .dpatch
> got dropped, therefore the patch were simply and silently not applied
> anymore.
> 
> This series fixes that but is a bit more complex because we have patches
> inside Buildroot tree that conflict with the patches we get from the
> package's upstream.
> 
> Finally, setserial currently doesn't build on the Aarch64 external
> toolchain, so this fixes that by running ./configure (via _AUTORECONF =
> YES) to fix a configure-time compiler warning that fails the compiler
> check in the configure step, and also update to latest version available
> in Debian tree which includes necessary patches to fix other warnings
> returned by the compiler.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> Quentin Schulz (4):
>       package/setserial: apply patches from setserial_2.17-45.3.diff.gz
>       package/setserial: autoreconfigure for compatibility with newer toolchains
>       package/setserial: update to 2.17-57 for compatibility with newer toolchains
>       package/setserial: simplify patching
> 
>  package/setserial/0001-build-system-fix.patch      | 33 +++++++++++++++++++---
>  .../setserial/0002-tiocghayesesp-build-fix.patch   |  7 +++--
>  package/setserial/setserial.hash                   |  4 +--
>  package/setserial/setserial.mk                     | 23 +++++++++++----
>  4 files changed, 53 insertions(+), 14 deletions(-)
> ---
> base-commit: 17134726213a2188946a07b73ff2e2d0363ad636
> change-id: 20250307-setserial-fix-1d908277767a
> 
> Best regards,
> -- 
> Quentin Schulz <quentin.schulz@cherry.de>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
