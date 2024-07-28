Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F99C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 11:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E8B26072E;
	Sun, 28 Jul 2024 11:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1fu7UGLReNE; Sun, 28 Jul 2024 11:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45B1060750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B1060750;
	Sun, 28 Jul 2024 11:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2682C1BF5F6
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14E7C60750
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUid1xFWRcri for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 11:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 950606072E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 950606072E
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 950606072E
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 11:55:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52efbdc9ebaso233293e87.2
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 04:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722167749; x=1722772549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=20hm251E22CuHpxf+nDGo48Ckex1BN9su1qwUSjdELg=;
 b=iXCgcQZrO9wM/dCqoBeaZ8cA5gnKPtoX5PNRByEUwJfTZKNCP3nTkmkYH2XG39niXs
 MoOuP0WVGfuqc0APJyhyacju4j2IvBiYIqy13+oIYsH1XJTsI9dSmPA4FFlc1htD1pZ3
 7YAfmVsuRL3nvvttgaxWUHzLfigpyaRAdjFGb6FZgEKHNghaNxrTUeQ5B2esNpB+/7QQ
 mt6k7hfu/xC6esqjCTUfHoT0LRIKKtZxGE0YfA6WqUkBsI3eSaOL3zfE6Dv/iZi07Tgw
 jnv7Il+Q4m/JFZNuc0xRQviJqt1/pBWMboL6ECF7iSNcWJyBGhDDs8JEi3o+dbUoqHll
 skrg==
X-Gm-Message-State: AOJu0YyDIaTJwXz2QLfgfjrF1DXjh9zplOUMYlXmzYAPMkTuP9jZYvh3
 JYpoCUST81gPUTciHMmRvEmrQg+aTOUcuZgOjRsy+kkqYygY0772KeqTPA==
X-Google-Smtp-Source: AGHT+IGcX+ETJKsc8kiwHjWL+16Xm5XQMkInoTQakBFif6KFUkkQScjFHD94Z+baOP6bNUe8rvLuYg==
X-Received: by 2002:a05:6512:3d05:b0:52e:fc88:a585 with SMTP id
 2adb3069b0e04-52fd522a85emr3964171e87.0.1722167749147; 
 Sun, 28 Jul 2024 04:55:49 -0700 (PDT)
Received: from localhost.localdomain
 ([2a00:1370:817a:3109:e854:f5d2:a4fd:2ef5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bd0c90sm1112047e87.73.2024.07.28.04.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 04:55:48 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 14:58:17 +0300
Message-ID: <20240728115817.743185-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722167749; x=1722772549; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=20hm251E22CuHpxf+nDGo48Ckex1BN9su1qwUSjdELg=;
 b=luX+lm4mmZuMkoVQG1TI6ejZZkekVi80gDIDlsEhtAYvDC/KfMQy65rpAYRJFK4wGQ
 ZWOzyk2x1x4ELD5FPt4XRSbYEffbUFeSYK7HyUkSqzuKrPX4JCQ86Y8LMqrMK2hLK1tC
 hWJSm+My44fWmSMmMiNLz+AoVddZkAhDTxGEWX6JDY3Qrw9wO1U+OlZDyit4nAm3XvRH
 FwdFKJ2hv0x7gfSDqWt03xUAxIlE9t5KwBlk8j0yKW/qROdUDCHGaUOZHMQgsP9CneNO
 twyRkkG4T9iApP5+eQHYfqLYULp/aMDGzpTAJRNAjYR3Kmd3uUxcDIKJIYUY6N1kinEf
 +K3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=luX+lm4m
Subject: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x kernel
 headers
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provide correct grouping for preprocessor
conditions to avoid building ld.so with
undefined macroses which are in use

Fixes
  package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch
Upstream:
  https://patchwork.ozlabs.org/project/uclibc-ng/patch/20240728115224.725666-1-dm.chestnykh@gmail.com/

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
 ...ix-arc-build-with-4.x-kernel-headers.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch

diff --git a/package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch b/package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch
new file mode 100644
index 0000000000..359d1e98c6
--- /dev/null
+++ b/package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch
@@ -0,0 +1,34 @@
+From 1afc19eb6a7948afbcf3dd19091ce127a355ebcb Mon Sep 17 00:00:00 2001
+From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Date: Sun, 28 Jul 2024 14:12:39 +0300
+Subject: [PATCH] [ldso] Group conditions after `&&`
+
+If the conditions are not grouped we can reach
+this block even if `__NR_stat` is not defined.
+
+`defined __NR_stat && ((!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__))`
+gives us false but `LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))`
+may give us true. So if linux headers version is below 5.1.0 and
+__NR_stat is not defined we can have compilation error
+
+Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+---
+ ldso/include/dl-syscall.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
+index 9ec0eac60..180d03012 100644
+--- a/ldso/include/dl-syscall.h
++++ b/ldso/include/dl-syscall.h
+@@ -141,7 +141,7 @@ static __always_inline int _dl_stat(const char *file_name,
+ {
+ 	return _dl_newfstatat(AT_FDCWD, file_name, buf, 0);
+ }
+-#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__)) || (LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))
++#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__) || (LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0)))
+ # define __NR__dl_stat __NR_stat
+ static __always_inline _syscall2(int, _dl_stat, const char *, file_name,
+                         struct stat *, buf)
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
