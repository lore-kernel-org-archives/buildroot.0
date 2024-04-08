Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6FBCD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 19:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D52E9407BA;
	Mon,  8 Apr 2024 19:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjBIvTnoYXqC; Mon,  8 Apr 2024 19:30:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4085407C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4085407C0;
	Mon,  8 Apr 2024 19:30:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7561BF2E5
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 19:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16DE0407C0
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 19:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbdJeanmIK89 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 19:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4416407BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4416407BA
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4416407BA
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 19:30:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4169d794358so1267695e9.1
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 12:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712604646; x=1713209446;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PdZYfUF4ToCDkCjVbusVbwNrL0dlES5ckFIDtxEmVcI=;
 b=RMNwEWxb1QHwFaGGoAmWm1JdjigAhfiMS3iC1AdcbvITeHsInOI/MgEphsmaXrRIdj
 wREdJQ036eQfYMdO6TLi9Pjl3oHx5TkbPDX1XO1zuchYc9e6I0V475sX1hNEIB/Knn2z
 QQa6/izPFmJt+ECja5Jcf9rVSpD91jP+NV/3te+BOhoWa/1hz7ViaPOt9zldHakkzKc4
 /EK3gfSjtduwuRyWGnIwP8G9P4AU9+cWOvhEhb1kT4BgfGXO8MZJEjp7leity0yxbji5
 csmMlICYqj3tK1vDytC0zCcxTpRPGrt+KkubwIwEcsrwLI603zOtEA/CaIx2wvWfCgqG
 md1w==
X-Gm-Message-State: AOJu0Yy4lv5iH09RTMl++aY+7JAxASpP0GMZuY0jneZJUe94jiavydLN
 rrPGxlSlJYROavk0WHheuD78PNKujlT2uK7zyAibf9tvSjAEewHwUenfEbxy
X-Google-Smtp-Source: AGHT+IHoWbdgM/T1VxXAV1APb1cM5Z/5IU+PLABcmqyZle/CKMVq73PA8e1/X9+KH2sUZbDTRsqZ7A==
X-Received: by 2002:adf:cc87:0:b0:343:7e98:e73e with SMTP id
 p7-20020adfcc87000000b003437e98e73emr6007591wrj.40.1712604645406; 
 Mon, 08 Apr 2024 12:30:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r18-20020adfce92000000b00343d1d09550sm9708913wrn.60.2024.04.08.12.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 12:30:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 21:29:53 +0200
Message-ID: <20240408192953.194898-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712604646; x=1713209446; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PdZYfUF4ToCDkCjVbusVbwNrL0dlES5ckFIDtxEmVcI=;
 b=DC245McjQBctyD7LfAMle7Ffqsc5CWAiFyhXuQHJ5h12afA1csCi8btNz+wpiP5/mx
 ydw0Z4m4QXI59Loo7DoDHr4fqTChlpY6n8EY8TeslKzqhM5Zfdcbn4riaeCHWiFNny/g
 uZ2ZrMaXwNXt+Vlu2eBRiq91yj3GCnjIyheE106Gkf0F6p5v5OrCCHEsDpJNNy/iYgw3
 B/N/tu0s47fNeikJLjyJ+U01HI4w7J2SiYoqcl8EQ/V8H7UPVevA2Q+TzJxU1D2XAi3v
 xXFO0LpG92ek3hXjIgiUu+7CX/nOGS3FbrbgyN/d0oenAwsRAfuZbrAgc6DxZIJgKQCk
 wOaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DC245Mcj
Subject: [Buildroot] [PATCH 1/1] package/libnetconf2: add libxcrypt optional
 dependency
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc64-buildroot-linux-gnu/12.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/c84e27815cc607ad78a1901cb2be591df2686ac7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnetconf2/Config.in      | 1 +
 package/libnetconf2/libnetconf2.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
index 7865f9e487..34934325fa 100644
--- a/package/libnetconf2/Config.in
+++ b/package/libnetconf2/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBNETCONF2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBYANG
 	help
 	  libnetconf2 is a NETCONF library in C intended for building
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index e349c1bce4..88163926c0 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -30,6 +30,10 @@ else
 LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+LIBNETCONF2_DEPENDENCIES += libxcrypt
+endif
+
 HOST_LIBNETCONF2_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
