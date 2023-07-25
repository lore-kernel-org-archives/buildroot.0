Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21B5C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D824610F1;
	Tue, 25 Jul 2023 17:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D824610F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oaL4NOSOhpGu; Tue, 25 Jul 2023 17:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C36A4610F0;
	Tue, 25 Jul 2023 17:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C36A4610F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECA851BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C65658138A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C65658138A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6a12_TFZ5_h for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:33:52 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58BBE81384
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58BBE81384
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3163eb69487so62435f8f.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306430; x=1690911230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IE0e1ewsdNvQKaSl1Oc6b4kNMBOhRAvdeUJlR5K1Z6M=;
 b=LBmliTe4LE6L7SZSSOmojP9CZJQtksFEUMfCk4LEi3ZUN+O3AXK0ZNE40nuaT5Glm9
 p5EZtv0ng/IQ5xezCtzky9BKKziUTX+Or/6kbs8l2Uu8HMamhgyKhnTdIFSZcBPTMxad
 O1/ZrdkPuPyyXaFv/il45bJZDvKjzA38jyTLkHVAedprDB5wcyaYsjBT/FmjdCAeV9DB
 19E1BTyg3rucYjqwJpfPQG9vKvP5eopozC+M1LcckjHIgslQr3RZaHAYm/+GxRDMkWe0
 rUEi6BTCCUSuStDp2t0r9cTB3zLd4hccaPxmTOP8gO7fxLw+LIYedinlbFQ+itj+l1+a
 tAfQ==
X-Gm-Message-State: ABy/qLZXhs1XSulhCI1xaiNFgcbVZTnZgb+XZaNZ0jTdeqhTLWSnoDGK
 47WAn0jgaY3gDXZuesZ9ruNO4ukdalhOmVRHUcw=
X-Google-Smtp-Source: APBJJlEXvIwCK2MvwvvXvoJ6Z/nPZdTdpMDonhyg0Cb1vnvJSgnvTRy/2JR0l5D3lWxXmj43D461JQ==
X-Received: by 2002:a5d:5547:0:b0:30a:c681:fd2e with SMTP id
 g7-20020a5d5547000000b0030ac681fd2emr2589303wrw.22.1690306429754; 
 Tue, 25 Jul 2023 10:33:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00316eb7770b8sm11721541wrv.5.2023.07.25.10.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:32:38 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 19:30:54 +0200
Message-Id: <20230725173102.543874-3-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725173102.543874-1-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690306430; x=1690911230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IE0e1ewsdNvQKaSl1Oc6b4kNMBOhRAvdeUJlR5K1Z6M=;
 b=x1yXwcgjsWJAVbJpgF7gkxN3gZlVqdZqa40vvpPnwmbidQ4qwLGm2AynpCQ2bto0iA
 TGDiq2NSxJzKQVj4CY/18hxhCIeOXj2HrqeCpasZpkbQmIusVV70Dr8z6hp3ow8YaAax
 1VDDaNVdLO7crTTV1xGqvuDTJnyaP2bAdBoJnxXDOsNfd+4y/haai6rzJyOqrM4G+Aey
 9fCpiEtnpFD3v3Al1B2+tRpheJyWpptvLcwEIRVdPyBTJUagwk05W28HwWRvDGRumAvC
 ZNJJZma5SiKe5TbCE2ejnLDTBT+Q0QnU20Mc4sZtnngpwIB7PanEnkUxnR6IgADc0kU9
 GLRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=x1yXwcgj
Subject: [Buildroot] [PATCH v2 2/9] package/llvm-project/llvm: add llvm dump
 support
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Daniel Lang <dalang@gmx.at>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

LLVM_ENABLE_DUMP required by mesa3d rusticl:

https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/llvm-project/llvm/Config.in | 6 ++++++
 package/llvm-project/llvm/llvm.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/llvm-project/llvm/Config.in b/package/llvm-project/llvm/Config.in
index ebb0fca66a..4ee84b3bcc 100644
--- a/package/llvm-project/llvm/Config.in
+++ b/package/llvm-project/llvm/Config.in
@@ -57,6 +57,12 @@ config BR2_PACKAGE_LLVM_BPF
 	  Build BPF target. Select this option if you are going
 	  to install bcc on the target.
 
+config BR2_PACKAGE_LLVM_DUMP
+	bool "enable dump"
+	help
+	  Build LLVM with dump functions even when assertions are
+	  disabled.
+
 endif
 
 comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 556a2f8c35..6598d8b6c1 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -228,6 +228,13 @@ HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=OFF
 LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=OFF
 endif
 
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=OFF
+ifeq ($(BR2_PACKAGE_LLVM_DUMP),y)
+LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=ON
+else
+LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=OFF
+endif
+
 # Compiler-rt not in the source tree.
 # llvm runtime libraries are not in the source tree.
 # Polly is not in the source tree.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
