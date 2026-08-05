Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCCAC55174
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 12:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32411607C5;
	Wed,  5 Aug 2026 12:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xR_oXD0PcP3; Wed,  5 Aug 2026 12:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70477605D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785933790;
	bh=rA55TMpoSNjyzzZ5Bql6vTTlvaGrGwq6Zkp+AooDq/E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3vW72kE9wOvEnw7ocivJ13qgQmW43SaZwFLUHwWZTYcqWoND6+f4yKOWMPLpXYYY
	 JvxI/gyXxr4YdoZxTnVu4eotEMu2e3egG700OnkeI8ye42JldUqmSlNlF3xf3HRs3H
	 0eBqqQWps0+AIAiqkkjgACeC02PwHWZpzdoVUyXN1BQgHACAsKbOiaNl1KmidQ3fkd
	 vCVm+7jeXClBOV7Wdhfeqj3ddaD6UnEhNuS+0y+oJYyOBWNzjs9GF2LrHPb1F/R71x
	 OXnqUh5aoBmiC6uZjep6HLq24Cg3QT8qBpu0LXjHyZC7rEp6VK1N39n6WAA57V233D
	 V2KubWP2v/YhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70477605D9;
	Wed,  5 Aug 2026 12:43:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 649FD218
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 12:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56B25404C8
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 12:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFLM2M_0tNZi for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 12:43:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68D2C4056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68D2C4056C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68D2C4056C
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 12:43:07 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-495590dde14so9846015e9.0
 for <buildroot@buildroot.org>; Wed, 05 Aug 2026 05:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785933785; x=1786538585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uMWP7InTQVpVe2EfZm7GZSq8nSmSUbcuVyIVKqcWVz4=;
 b=MAsACA/NVPrBd7fQcgCGDgwfPBtKZ0OSY+jNwGimGggYVRjuYz1/gbdbYNrgIEHRiI
 dGPyLkmsj/PQam6IwDhKc3LXJYu706d173G3NfMm8pDnv9JtPTEHNpcKp1OPkft5KVI/
 d+1Dn494+hcfFNa9xt9kBb1RZj9qO0SjcLeMtcQNaCzQZmM4oBSl/g1CY/tymoI1SAQ1
 aNPIKZ4zhvCoIlw1hAgH2HMhhud1HLxdp7cdHL0Ypi4HJdfJtgLIPYzLqY3tAYUfIBkJ
 FT05wpdXLPDuzFdNjsYFKa9Wj3E/StQQvd78b+BdYTyeeRU13qf7P3NqkepBWJjkN+0a
 1eFg==
X-Gm-Message-State: AOJu0Yz55rQu4HMe/x11G42oKNYOOABUpWUMYxuqQ3l1aJikTBTBdp8q
 nVE/UvCrcdzIVZ4gYQhwJ+CRcHJ7YPBrrUzVJm+0QBEQ8tBrE1F3Ge/FDatb1+eM2TpYxz47bHL
 1lXqS
X-Gm-Gg: AR+sD12utF3ierxJiinR5jNaDoeou3PXOVmeHm688FxZ8ufxd2UtsynxujDwQYqLC0h
 2JfJu5UoqL4P5EjlxbKgaS7cW7kk/P4vz5VzHDq5VgErXdAyn7tx6QOknKkNv19fibXfnj7BxmE
 9q4cfptYtbVTkwqqnbnWlT81AZb7D4DXnj5AYGlxEm8FEwr3kpvwcP/VDILYG92kQZmlSH+LFr6
 jsO9Ib+ssD8AKftGM7PBZ60dqh3AMT27erxc2mGFYvRO3jfLUrnNRfjnxa9XjJJePrA2I9RwEYv
 Qof6H3MCdTyBPwA3bjEJvZ6L3diO/+lfOEeN1EYb/I2PVLElkwjcTck5WGciwIEuPVqMEtjtcJW
 sy0SzGh8USYP+TZpHT6kax8dpxxcAQnkeISbN1ylo8wB7CXyie++qpbB5foLJCnb7UEkym6cSde
 WOMpTMDnKpSzNyUjinGfrMocl//+V9GXwcxrPTcMgOHNSyB3kgbFf+QMs/yL2W3LW9VJy4+sycq
 aqzLgoNIROE3ktKqoxRprOuOMjhZx2hksylKk8/7JJj7zKqDk7/47uINrzBsk6nN1E+yOpXHJCx
 0cg7EUTgSW2/5UC+Ni4OHnu9b8Fxg2rj9uzhUXGwBasi2guQsaViHQgUNIk=
X-Received: by 2002:a05:600c:474a:b0:496:c361:fb96 with SMTP id
 5b1f17b1804b1-4994e6db5aemr74734315e9.0.1785933785204; 
 Wed, 05 Aug 2026 05:43:05 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994e5192c5sm59685985e9.1.2026.08.05.05.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 05:43:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Wed,  5 Aug 2026 14:42:59 +0200
Message-ID: <20260805124300.1485387-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805124300.1485387-1-dario.binacchi@amarulasolutions.com>
References: <20260805124300.1485387-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785933785; x=1786538585;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uMWP7InTQVpVe2EfZm7GZSq8nSmSUbcuVyIVKqcWVz4=;
 b=ZE8iiRV+VoA7/tj9LJF8k8/BcmfW5D+rHjLto0ekfegmn2P/bcPdCdPejYYYRgc/iu
 DkM8aRIrFrKOuxOJ96GTAfgEZ639HEQsm1hEtWcfRfOFAlNmIBpxALXKQ1JspwKEt3X3
 xikfPdui0F9KIdec2kR5GIP8oCu/p9FF+zXHI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZE8iiRV+
Subject: [Buildroot] [PATCH 2/3] Revert "configs/stm32f469_disco_{sd,
 xip}: fix boot failure after uClibc bump"
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

This reverts commit 832ff692ab26e7ab10d86625f13ac9beda7461a2.

The MALLOC_SIMPLE workaround is no longer needed: the root cause, a
zero _dl_pagesize on noMMU/FLAT targets, is fixed by commit
35d3927e8564 ("package/uclibc: fix for noMMU targets using FLAT
binaries").

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/stm32f469_disco_sd_defconfig  | 1 -
 configs/stm32f469_disco_xip_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index c9c385e0711e..70a214a10825 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 1d113da08ccd..578cecadbe50 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
