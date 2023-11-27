Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0060FC07D5A
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 21:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F0B3819BE;
	Mon, 27 Nov 2023 21:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F0B3819BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWEm0fFEifyp; Mon, 27 Nov 2023 21:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13695819B4;
	Mon, 27 Nov 2023 21:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13695819B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F29CF1BF37B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 21:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAF16606F2
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 21:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAF16606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTHc-wla4hCL for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 21:28:28 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D552B60669
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 21:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D552B60669
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40b4746ae3bso8235655e9.0
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 13:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701120505; x=1701725305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j1pjQV6bb/lLTF3xfM0nrPoAoTr8qfwuo5PQzJyehd8=;
 b=vAmkqTXRa1evJkBFtTgQ+Ycy3T6PylF/NKFqM+ejop2royxy1K6PY/FjdhbNdGOFCy
 W9hI28S+ZOZW86ESgW+P6Exv9H3waBzAhJ5TJtFRkniqtmop/243+DpydUDB9wtp8tTG
 cwZz7S560ZbtAiLCN6Xn0D7jt1Wo+J9X2davx3Ta6ZMuTuyMqKCzZBSF85pq2HtVTMsY
 KtRe+U4yAlO1ZjOy/FbyrDkFFezbuUy2tR3Qx6XT5TaRSZZN0y5Dw4SaLlaOLQvXltV2
 DBgcRJyJvBrXSL+YcC8FhkoJWFSa3KrWvE+mByk0ardwIvhx/qXhAMjBnKE5ekZP9lDk
 3fwA==
X-Gm-Message-State: AOJu0YxZwPeBzhIBjVoptu1dmbAJ9l4ivRhEt8AJNjlCCkQ6aSJ6lprX
 KmKaCUBpnIVpZ2BbhmRq9utJsPllnD8=
X-Google-Smtp-Source: AGHT+IEiXrd+KoTaeM3MUtXjdm8/sN5N1JDaR/3DmaAY3w56B7aVGwjGfJWjW5MPGDFx4g2kXlpwFA==
X-Received: by 2002:a5d:4d90:0:b0:332:c7cf:b473 with SMTP id
 b16-20020a5d4d90000000b00332c7cfb473mr10852117wru.1.1701120504727; 
 Mon, 27 Nov 2023 13:28:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l12-20020a5d4bcc000000b00332fbc183ebsm5587675wrt.76.2023.11.27.13.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 13:28:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 22:28:22 +0100
Message-ID: <20231127212822.1060094-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701120505; x=1701725305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j1pjQV6bb/lLTF3xfM0nrPoAoTr8qfwuo5PQzJyehd8=;
 b=h+bPD6hG5IAzOpuXBQ6vq+6BpIlohSNwIwUozOW/d9Xgf8g0yGxmYtFz2Cb3Tszo3i
 6fKhVnB7q1iLO25WFZYmXoaUMP60EqSfknuIt5lGq3xWcZJrlhBKmyC3yeHvZGVdcHT1
 NrqNU2rQkN1P78x4UsU6CxxVwyXPrqsJVC3IidVQ3Zyj5tnA3Fiipkvenr8O7FRrUduo
 QAlutbdJKoBuZV6Pc+urfzAGOjaxtgF+IKPzN+0sp1R6bajUOtrMGugP7zHRggeaofZS
 xxb1PcuBwfAVG871bVrWixVygKlBCI3wPiZmdKLtbGIm45Y+KlCG9hApxxQY/om+PSmW
 qIsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h+bPD6hG
Subject: [Buildroot] [PATCH 1/1] package/janet: needs MMU
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

janet unconditionally uses fork since version 1.32.0 and
https://github.com/janet-lang/janet/commit/4b8c1ac2d2d5c13d7c8592fd6d94b34a6a8b3549
resulting in the following build failure since bump to version 1.32.1 in
commit c87abf01a9153a2b2fe6c046fa83c86db92d79a7:

janet.c:(.text+0x19bbc): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/f0771fc6c9905d3a6d60ce245df585b3c6096f7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/janet/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/janet/Config.in b/package/janet/Config.in
index 7b78c14bf4..bb4bf462aa 100644
--- a/package/janet/Config.in
+++ b/package/janet/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JANET
 	bool "janet"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	help
 	  Janet is a functional and imperative programming language.
@@ -11,4 +12,5 @@ config BR2_PACKAGE_JANET
 	  https://janet-lang.org/
 
 comment "janet needs a toolchain w/ gcc >= 4.9"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
