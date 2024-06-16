Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C31C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 14:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B45C40347;
	Sun, 16 Jun 2024 14:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sboGADEyQ-FT; Sun, 16 Jun 2024 14:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35517404AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35517404AE;
	Sun, 16 Jun 2024 14:10:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD9821BF2C1
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 14:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08E9F401F3
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 14:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hks8i2EE-yHi for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 14:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB4754033F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB4754033F
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB4754033F
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 14:10:47 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52c8ddc2b29so3923174e87.3
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 07:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718547045; x=1719151845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H3g/OqtN7yHFyo2ysPj5df5eK8ljOFqL4Ej5/F11lQA=;
 b=LaeIPIezx+2Wa0oaVpeTDbbBpvlqfE5kzoYe2jsTfSipUzHYg5udjLCGQSL2ne22Zp
 wKUP+CF4dJot9FOTk3neBtc3ohhmN5RmxZ4LewEc7oDckp9BXLhELCQNiCVmak21FiY+
 eL/xgKFYcN3D1S+QndX0nBWzFg7Z/xCO9Aa/DKUhz73ii681/HHxZffPSo6zcTo5e5gg
 REiTS1xGvoPn3OzYoSoKk3S5cqHWxjYvEAd2ial8wRcsn/3Hp5FZY5WRQgAqlg4vaTBP
 doJulAkdeH6KzbrGD56tb1fjM86gtR1hBYbCLbyxJOb/S1FJjcypiY8BTSnLpf81S0Xf
 ocVg==
X-Gm-Message-State: AOJu0YwjOucfkREPXT5a5bHZrg0TnuJMSN2KPtugIy9A3y96dYsKMNbt
 sBOglFG4DClUhlZCAjqGMOA+SWz1hcWOTyLooJezNcf8A+lgZsjPEZcz9A==
X-Google-Smtp-Source: AGHT+IGU5qcMSr5+aDP1M5E3g7qbVxpCKci2HpjEdexvov+MqPyeCVDSuWwBAot9w31kQK6XOOIfjg==
X-Received: by 2002:ac2:4c36:0:b0:52c:966c:92e7 with SMTP id
 2adb3069b0e04-52ca6e91812mr6514683e87.43.1718547045398; 
 Sun, 16 Jun 2024 07:10:45 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4246a2db4fbsm4421575e9.5.2024.06.16.07.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jun 2024 07:10:45 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 16:10:43 +0200
Message-ID: <20240616141043.2775083-3-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240616141043.2775083-1-yann.morin.1998@free.fr>
References: <20240616141043.2775083-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718547045; x=1719151845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H3g/OqtN7yHFyo2ysPj5df5eK8ljOFqL4Ej5/F11lQA=;
 b=O4s3gNUHx+BCQB//2XriooLoTbvS6bGXE8px4KRoH4TLI32LuAkvMraQ6FMxlvMUIM
 La1Y/6MjT9KCIMS9W5xrwjUPNxIV+O3Ms8ycel1GEq5SpWgb+snZHgE6ujWGvIixsaCN
 SYsr8NlmIuibGjz57R8uOjz6BkifnEfP0FNzg9Kw8b5jzelrCkg9JPSzPtHy7nd5tQ2O
 Nky7iFwBJ+vIxjrqIbFqARAPy3fwlV7wskfpvpTYamt6OEoqd9QnKYx616XaqdeGMQT3
 7CmUKKPfAdT8YJZepoxYlV2kPI5AoMboVV9H750qTyd2jAZ+0A0rmIP9EhEE6na+Hlat
 O75Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O4s3gNUH
Subject: [Buildroot] [PATCH 3/3] boards/chromebook-elm: force checking hashes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bilal Wasim <bilalwasim676@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bilal Wasim <bilalwasim676@gmail.com>
---
 board/chromebook/elm/patches/linux-headers/linux-headers.hash | 1 +
 board/chromebook/elm/patches/linux/linux.hash                 | 2 ++
 configs/chromebook_elm_defconfig                              | 4 ++++
 3 files changed, 7 insertions(+)
 create mode 120000 board/chromebook/elm/patches/linux-headers/linux-headers.hash
 create mode 100644 board/chromebook/elm/patches/linux/linux.hash

diff --git a/board/chromebook/elm/patches/linux-headers/linux-headers.hash b/board/chromebook/elm/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/chromebook/elm/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/chromebook/elm/patches/linux/linux.hash b/board/chromebook/elm/patches/linux/linux.hash
new file mode 100644
index 0000000000..88aa603ac5
--- /dev/null
+++ b/board/chromebook/elm/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43  linux-5.10.tar.xz
diff --git a/configs/chromebook_elm_defconfig b/configs/chromebook_elm_defconfig
index 827d929631..0e8b6287c3 100644
--- a/configs/chromebook_elm_defconfig
+++ b/configs/chromebook_elm_defconfig
@@ -35,3 +35,7 @@ BR2_PACKAGE_HOST_PARTED=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_PACKAGE_HOST_VBOOT_UTILS=y
+
+# Misc
+BR2_GLOBAL_PATCH_DIR="board/chromebook/elm/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
