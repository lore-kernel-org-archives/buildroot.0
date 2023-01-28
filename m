Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED24C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 17:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6073541675;
	Sat, 28 Jan 2023 17:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6073541675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G79ALhejudwQ; Sat, 28 Jan 2023 17:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C5C741702;
	Sat, 28 Jan 2023 17:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C5C741702
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4E71BF215
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 17:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3976041675
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 17:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3976041675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TqeXKZM39LW for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 17:47:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0678A41635
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0678A41635
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 17:47:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m7so7647588wru.8
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 09:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8cMWn5kP35RgBfz7/Q8bFbsPpWpDCUphfqtiWVMR5og=;
 b=o8n30B3j2ieKKUnh7z3J9Ybe1Yy1w+BUiWssrmXvJUmpRPHxf9ipMOuAaqsxYgc3uo
 jUEDq6582ePU4VZgouyV3KVAgd/vBtFvBvHPMchDzsga2KOZ4YPHHXZ0Lm5799zesiQl
 9ho4wEbYXFrqTUix0Im71GvMjYHR37XhXmUb5W+5fW8CDMWJ5NUaVSy9V54oHgc8ZLgI
 mDEvX6FpplvWhidLX8i2AcQhYgv/4fokUFtgFeIaiZbdlV9j0HTtLnmRXvstSdSnb0+D
 ikfwS8VIg5ocqrCiWTaU4N0fL+ynd/XoDlfFOlHBY8xRYUL9FwO5FVLcENkFfNgKHJ23
 6TQA==
X-Gm-Message-State: AO0yUKVy3AQ9TW5u5t9nK/+NCQxMcm3iv+GSOZXp80QLqU265hEGZT+o
 BZon1mQW0QFlairFnta9ItIVTj4PbOjrVGIH
X-Google-Smtp-Source: AK7set98PmMW2J1m/2toCPmIquEX4jkl0wviG64UZz3w5kAXcnTq2olWngPXUEmMAIJ6QJNT5w4/Hg==
X-Received: by 2002:a5d:638c:0:b0:2bf:e61c:9b4 with SMTP id
 p12-20020a5d638c000000b002bfe61c09b4mr510137wru.4.1674928069845; 
 Sat, 28 Jan 2023 09:47:49 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 y8-20020adfdf08000000b002bfb31bda06sm7614644wrl.76.2023.01.28.09.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 09:47:49 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 18:47:31 +0100
Message-Id: <20230128174731.3816982-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128174731.3816982-1-thomas.devoogdt@barco.com>
References: <20230128174731.3816982-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8cMWn5kP35RgBfz7/Q8bFbsPpWpDCUphfqtiWVMR5og=;
 b=j5akqIcb9L0Slv0cp5zEAQupMTmbYBUmpX2GH24UgFNtV+me9MfMJsmo1h6jUgraVI
 kkCgCoZe/uo2NU+vmm07Bse/uXyQF72hMcXM4BrlhKLl2gFTrtuvsuf2NdiIK54y3bKr
 OebFUYaj5tMo2mrYvc9l7MJ6VyuUy233jwhyO8byLvpWJIWKPz9MnlFbw80NTTZUeaDz
 LD4xDefUpXrvRAhHacQeMyNyknDD5juM5wdmEyc6SUSaiAGJ2CIjKrK0fvbXV7B3beJh
 JMbnsmYn5917pedc1RJOUxW0B7DCrJwYejwHO97Wocsz2YoF46RyV0JQjhn62cyo3y9s
 oUyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j5akqIcb
Subject: [Buildroot] [PATCH] fluent-bit: needs arch support for wasm
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

See:
https://github.com/fluent/fluent-bit/tree/master/lib/wasm-micro-runtime-WAMR-1.1.1#supported-architectures-and-platforms

MIPS & RISCV32 are mentioned in the supported list,
but that seems to be wrong, so excluded those.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 package/fluent-bit/Config.in     | 11 +++++++++++
 package/fluent-bit/fluent-bit.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index bd89c05faa..0ed69e09ce 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -11,3 +11,14 @@ config BR2_PACKAGE_FLUENT_BIT
 
 comment "fluent-bit needs a glibc toolchain w/ C++"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
+
+if BR2_PACKAGE_FLUENT_BIT
+
+config BR2_PACKAGE_FLUENT_BIT_WASM
+	bool "Build with WASM runtime support"
+	default y
+	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be || \
+		(BR2_riscv && BR2_RISCV_64) || BR2_xtensa || BR2_arc
+
+endif
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index c84042a0fa..6e9a33e02e 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -17,6 +17,12 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_CHUNK_TRACE=No \
 	-DFLB_BACKTRACE=No
 
+ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes
+else
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=No
+endif
+
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=Yes
 FLUENT_BIT_DEPENDENCIES += luajit
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
