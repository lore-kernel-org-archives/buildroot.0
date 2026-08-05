Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ABCC55174
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 12:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6259D80A96;
	Wed,  5 Aug 2026 12:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZ2EHRcbpk4f; Wed,  5 Aug 2026 12:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7871580BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785933788;
	bh=nCbegtNMD0ZXNWIiE4A7gkm6CuYzmq+aW0Qozal3meY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GEClpE3aaGo/k8Us1tL/GMxAzAMvLWHPEmEr5XXz/CaOuPgU63BH3Ww7AkCl25leI
	 oAeyLisLd5qiFX5Q/i+SDunOWJ6axNcjCjTVNbyA+qPIIoxC0VChp4cR6/b7zv1c5h
	 OFleLz8HWLVoBsFt6zX3iCxE0CObhVVLKjE1jqvlMUCQOMD/VqgIyH7XJSJI+bKvgk
	 8gER+t6ItXkn69JTjopQmL4CBvBWlyKfGdvIHd8Ovx/kY+TtIiG9sW+8iKKVTML24c
	 gynGS3JcRvD4cNv7y4U1lw9TB/m8BJt58uMPgkbbhsldyRcrRXI24ddGqpmN+R36EG
	 WEm/R5N+D+lPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7871580BEC;
	Wed,  5 Aug 2026 12:43:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AE61218
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 12:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CD7D40606
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 12:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTtHjxJEZG8X for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 12:43:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 684D3404C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 684D3404C8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 684D3404C8
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 12:43:06 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so9766335e9.3
 for <buildroot@buildroot.org>; Wed, 05 Aug 2026 05:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785933784; x=1786538584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0VVEioqLFvxpFhVphLWnKAPqD0p8H30cYVYbcwVGgvg=;
 b=oUv9bw2qkwKIjGbtqNiMdJFyd5XkOxRC473T2kHD1q9nlIG44eTX5JLXjv147cRRvF
 DOWUsDNuW0MTmK2ZmH/aVtmcoodj16kTbI0H7fOTWT/VgZJoQsCFtPzWQWdCsn0XzNqs
 xue3+chrJg8M5S9yeOWB2EKmbxBT05PXJmJJwvk0TOVSvEgJgecIOPdI/nC2JW7r8FwK
 fOcHGK23iwEQuJl+Qw3SmVqGHGc+lPjsavUERNBA+9dl0Bkw1XQ2xwrUxUUarFYX/OjT
 SKt/aw6JZICtvaeNQkF1tuSorJwx+GarcB0PTf6pF7m0lOdUK2txsfCMB/IgoiRYeKT2
 0vuw==
X-Gm-Message-State: AOJu0YyVv3NbjI4JsEqKtYEKxXjNCYkA8a9EZkyHVxXA/9ZS1Is7a0EL
 glLHH6gGK99KddxmeZNuBdLgqoZ11KKcU2h4owjXA4fV5GFb88+KlLA6BC2XtSS0jclkJd5OkO3
 mWMqj
X-Gm-Gg: AR+sD12egAgyHAAK4fq9TcREvGUdLS39Z+RAKVNQ8d7OzNSiudLXIC677Ex3gDKtx8G
 quiG0YBTN6Zgae/jKnBvUSKHu0Wj1SAL4EjNQVFWEZjcm3T+jsfqZmZXg+i9TtcdXUS11d7xM/L
 UwF/UTzjPELdY6s9Hbb5hogSKt0qrkWwU2H2tpUTh6o8WVlNrZ3/2Uk81ENiblhizKHqBm9ebcT
 aLyEPW2Aj56h3iXMHcznnTYLGGJHv6tTpv6BmTp4qScHytp+C2Jv7f2W8QdFk5uI3Tmr6bN5ADn
 M/ibbvA4w5sTnC7M/FIqVQWRXO4DDoUvUQfx2ccoKbfZPxuEptz8c6Q7Oyb+BLhFjVE7lvtJAqs
 k81dL2oWuJf/W/7+E0yaPpZcPzxZWsNjN3qRpZbodQdqu1VDwkqD5spTledE4RWy0mGr73b3Dox
 0etUu/5ZVg7wjixJSBPnZFUKL7zQCVYuqSR7HRtJ/QsrVLHLsK7T3765PD2jtQk4lSxKEJwdvzx
 MbdOja4ZaXD48HtHGouMriFxCeWGxDNVD2Buf0fqE8gFoAQMaTBeplseeNvv6hkymysBChQelXo
 SEyWSwnzCBz7/PsS6QH5u5GRRdy+gzPTdWdWkNLQtt7BhFUaJKoFEOdBl5Y=
X-Received: by 2002:a05:600c:1c25:b0:499:4e47:eaf2 with SMTP id
 5b1f17b1804b1-4994e79dbf0mr87063865e9.6.1785933784217; 
 Wed, 05 Aug 2026 05:43:04 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994e5192c5sm59685985e9.1.2026.08.05.05.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 05:43:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Wed,  5 Aug 2026 14:42:58 +0200
Message-ID: <20260805124300.1485387-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785933784; x=1786538584;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0VVEioqLFvxpFhVphLWnKAPqD0p8H30cYVYbcwVGgvg=;
 b=aSaQDHA37QZlx25xESF2ZNeE3qjX3udwD3DDvdgPdse9V9c+L1Tl5fwzkW98glnLSw
 4JPTbhz4W1wQblrAA8luwD85pk6WsuFoRmJYF8+d9e/fHz1fuqGhBPIutPGQHQmAVWmw
 q7hqtegCB42OwbioN0Q/gaHHkJSmbpfmKUTfk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=aSaQDHA3
Subject: [Buildroot] [PATCH 1/3] Revert "configs/stm32f769_disco_sd: fix
 boot failure after uClibc bump"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit dd67de1bd3374a75ab1845ef29e3ad3c3bed2aac.

The MALLOC_SIMPLE workaround is no longer needed: the root cause, a
zero _dl_pagesize on noMMU/FLAT targets, is fixed by commit
35d3927e8564 ("package/uclibc: fix for noMMU targets using FLAT
binaries").

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config | 2 --
 configs/stm32f769_disco_sd_defconfig                            | 1 -
 2 files changed, 3 deletions(-)
 delete mode 100644 board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config

diff --git a/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config b/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
deleted file mode 100644
index fb8fa9ee01c3..000000000000
--- a/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
+++ /dev/null
@@ -1,2 +0,0 @@
-# MALLOC is not set
-MALLOC_SIMPLE=y
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 602d3e8018ae..a025bd780270 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_m7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config"
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f769-disco/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-build.sh"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
