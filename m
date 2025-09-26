Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7579BCAC5BE
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 10:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3787861BE8;
	Fri, 26 Sep 2025 10:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvR6SC3l7PQP; Fri, 26 Sep 2025 10:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C9861BFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C9861BFB;
	Fri, 26 Sep 2025 10:06:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFEB3231
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B061D84AFA
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHXjhKRoXJv3 for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 10:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDB5F84315
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB5F84315
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDB5F84315
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:20 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46cb53c5900so21583105e9.3
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758881178; x=1759485978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/tBe75lQ7BOmqxcb+dQEUlcVHAI6SfBAQcTV4fyoeNQ=;
 b=vpuwznZZhQPX401jm1yWmVgQpkxx5KyyFgLa+nNPr9XZMzcwymhH2XtyZvWzc6+3gY
 xsTHXS5081kOt6msc57geZq4SK41opxry4ZEINsPtAMykHsIgyGOSf0ShYS/8PbJ13Zc
 SzZ/orduh8Qhp5YWWBRLDXBDLusLaFsxW0U3XLZtF0D1GhrMJk0zPeqBnupjYukOf9kf
 +V98SW0LVGvVBwegl9TmHs8ASRWE2CAyFz+Ft97yFRspE3KHVt3GlJvzwpTAZnXW4zZY
 OJyr9pIte7U0XhLBVzmj9Rj7MF3449jiUV9H53I3hO8YkcdkM2dcRqo+YQPbdgCivykc
 gjWg==
X-Gm-Message-State: AOJu0YxxBWWH071mNCd+dlBGoLS/pMqmPpKGdrMUGhOZwVCcDP9sjFLg
 FYwKx2+huO/+UvzXjw55a3M6omwMpmMic36t5O4u7AbPA2TG1AsWdNson7f7vkWWGvoGohdZkz4
 /CKSl/ek=
X-Gm-Gg: ASbGncuGRTUeZeWEn+t0OmGJfVXMybBsyaKZvpybAQiP8Yj15uORQyGZMUSdA0PqgsW
 1Id+LG/z5UEGBdy/EKnxv0TvcBlkz7mHKAQcE9Z+8NHPm95ni0HGgt5hUlrSWaSsY8jLo6HLqat
 2Lym+sPTLB2OleZpC2HR8EtgVxdawMav+q3AMsrdv/yRn88HwLJYDhmiW5+taLlrfzx6zoQuQom
 ToAJXWaaeEO6rJ96Jp5uVs1ED8bw8O9ctSUrnVaIyGeeHJPNddGHZWskF/VqJi+AlHsCd5qfLGy
 M6ma/IHC6lgTu/CT32LFv6C3EFTawI3Wtwb5SQsXtx7fyCLhIRjh3y84n0SrXjkJKXOPA0jxpTP
 b9pxaRCixLK0zVGJNjehT9pTe27C00BGp1NA4eTbcBJyFgS4YIUVryqS1rYDZ+OuU9fnbmEePg+
 0bVvPeBjqC
X-Google-Smtp-Source: AGHT+IF2THB79rNNAXhI+zbZD4PZUDAFZP7Cgu6TJT0lN+9ytTtlXsi8etqh3raufrVZ5KgpiZfS8Q==
X-Received: by 2002:a05:600c:687:b0:46e:2e93:589f with SMTP id
 5b1f17b1804b1-46e329be8c1mr40208675e9.14.1758881178527; 
 Fri, 26 Sep 2025 03:06:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab62233sm112622825e9.21.2025.09.26.03.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 03:06:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Christian Stewart <christian@aperture.us>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Sep 2025 12:06:09 +0200
Message-ID: <20250926100609.4158676-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
References: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758881178; x=1759485978;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/tBe75lQ7BOmqxcb+dQEUlcVHAI6SfBAQcTV4fyoeNQ=;
 b=PjHmmuka4I2JLfKXBSO/KoQiDMP/Elr+waSTvOYeokHKMYKvSpCN/Ae92vQLSdGG/h
 LgGDEL5bZOkLd95dpscpFJLlrystgkcF0z+kylvJLgNL5/3tX2r3Io3hSJuyCbFllknL
 Hck7cplD21hzGY9yNPtKu9ad803gyxu9Dh8Mw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PjHmmuka
Subject: [Buildroot] [PATCH 6/6] package/spirv-llvm-translator: fix
 SPIRV_LLVM_TRANSLATOR_VERSION
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

Make SPIRV_LLVM_TRANSLATOR_VERSION compliant with release-monitoring.org.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 6cd47762f7a7..4eda95129874 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  ca89c35cbc55cfe69ab9fa1a2f3ee585d30cb285e01e2cae309fe0e1f1dfd79e  spirv-llvm-translator-v20.1.2-7-g834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b.tar.gz
+sha256  ca89c35cbc55cfe69ab9fa1a2f3ee585d30cb285e01e2cae309fe0e1f1dfd79e  spirv-llvm-translator-20.1.2-7-g834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 6ba58c392f63..d13b40a40bd2 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -6,8 +6,8 @@
 
 # Generate version string using:
 #   git describe --tags --match 'v20*' --abbrev=40 origin/llvm_release_200
-SPIRV_LLVM_TRANSLATOR_VERSION = v20.1.2-7-g834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b
-SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
+SPIRV_LLVM_TRANSLATOR_VERSION = 20.1.2-7-g834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b
+SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
 HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
