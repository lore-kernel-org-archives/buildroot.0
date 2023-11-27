Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92300C07D5A
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 21:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47507819BE;
	Mon, 27 Nov 2023 21:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47507819BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hKGV4ULHs49; Mon, 27 Nov 2023 21:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B73B819B4;
	Mon, 27 Nov 2023 21:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B73B819B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5C01BF37B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 21:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16C9281992
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 21:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C9281992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21R8Ac-u_fjz for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 21:27:18 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 206078188A
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 21:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206078188A
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-332eeb16e39so1783142f8f.1
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 13:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701120435; x=1701725235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V1PQepLab4Z1SqzcxmAOItM0GANiHoQvBjMPERq4pkU=;
 b=OleJ9+0MXfr2k0qAm7xDKBh16gJVXJSKyWzuVr20792mscZ3WIeMdAZWv6j+lCIn7F
 1kD0wDfxLwYdryP6ww/GvJQiAUmFu1oh3QQNySHEecyt5O945rZmXyqAmj1752hrq3b1
 mpQsgGBb+iQm0NfX9qsvKPDJxdUt4uATm6WP986yZ5jZbZF6BfxmM8vgbOfxbeJ4wjBq
 UxoLqewSYw2dyA61q2xNL8nPd2nhfaUgOOIb6AaE9Xajz2mmDQ7t7u7dfekKKP9iUi0m
 E6idi38gCXz82WnUQcETlwVfakPvfeweT01HUz0CCuH5N7mXXIeHYCWHufBpHh9kVgaa
 0W5w==
X-Gm-Message-State: AOJu0Yyx01rdpIfFZf1Prn9OwVZ4GY58eGVbOHUTzgSx+hgXEElDFIjI
 s8F1FTzOOKo3i7DXDz/JC9UPamGenCo=
X-Google-Smtp-Source: AGHT+IENSe7J177k9zo+QUDKsuPYxbU0UyflnC4t4woM21KRisT3uRos//K0WZvKU4Rf49rDf553ow==
X-Received: by 2002:adf:eacd:0:b0:332:d607:a0dd with SMTP id
 o13-20020adfeacd000000b00332d607a0ddmr11041648wrn.47.1701120435096; 
 Mon, 27 Nov 2023 13:27:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j12-20020a5d464c000000b003330aede2besm291961wrs.93.2023.11.27.13.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 13:27:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 22:27:12 +0100
Message-ID: <20231127212712.1059242-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701120435; x=1701725235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V1PQepLab4Z1SqzcxmAOItM0GANiHoQvBjMPERq4pkU=;
 b=Ip7zDOgTJrwsgEQWW+1qbtYChNVwP+TawjNCWFeevRS9VQ/nPO27ohHpw/iPSR5C5F
 7DGExlw5JcNdNq1bnEVjNreSKgxl+CdYfajRAnS43Iel6XBXE7VX89RC+JxjP7eVk5dw
 mL1DJco+Dlov/BnBeGBdNvnnbH6G89Y/oH7wG9RBJG/ZVgNNaHvs+RW7ECHKS/3sZm2b
 J7xYF/vdAEVt1Sz+6yaJY+81KOtxidmKNKH+B2dfnGV/ZXSLfZnN8d3mIJdIki1MG9Qt
 bGiqk1qNFyYqbkE7TKL2ww4tYAfyi+BBw7L92tWAUMw6PGjyHp8UYX3zQphICCx6hixk
 hDfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ip7zDOgT
Subject: [Buildroot] [PATCH 1/1] package/motion: fix webp build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of webp to version
1.3.2 in commit c88c1d3319dd24fa833455a2e7d96bc4585bab7f:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/13.2.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: picture.o: undefined reference to symbol 'WebPMemoryWriterClear'
/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/13.2.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-9/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib64/libwebp.so.7: error adding symbols: DSO missing from command line

Fixes:
 - http://autobuild.buildroot.org/results/9b859a701debeaddf1f9909e16adc6811a620576

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Include-libwebp-when-WEBP-is-enabled.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch

diff --git a/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch b/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch
new file mode 100644
index 0000000000..a1536a7d2f
--- /dev/null
+++ b/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch
@@ -0,0 +1,26 @@
+From 40ecd71ff361442f1579089481619dd7cae90ffd Mon Sep 17 00:00:00 2001
+From: Piotr Mionskowski <piotr.mionskowski@gmail.com>
+Date: Sun, 9 Jul 2023 01:44:49 +0200
+Subject: [PATCH] Include libwebp when WEBP is enabled
+
+Upstream: https://github.com/Motion-Project/motion/commit/40ecd71ff361442f1579089481619dd7cae90ffd
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ce588f65..ee45ac37 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -191,8 +191,8 @@ AS_IF([test "${WEBP}" = "yes" ], [
+     AS_IF([pkg-config libwebpmux ], [
+         AC_MSG_RESULT(yes)
+         AC_DEFINE([HAVE_WEBP], [1], [Define to 1 if WEBP is around])
+-        TEMP_CFLAGS="$TEMP_CFLAGS "`pkg-config --cflags libwebpmux`
+-        TEMP_LIBS="$TEMP_LIBS "`pkg-config --libs libwebpmux`
++        TEMP_CFLAGS="$TEMP_CFLAGS "`pkg-config --cflags libwebpmux libwebp`
++        TEMP_LIBS="$TEMP_LIBS "`pkg-config --libs libwebpmux libwebp`
+       ],[
+         AC_MSG_RESULT(no)
+       ]
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
