Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3E7C54756
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 07:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56B3D613B9;
	Thu, 22 May 2025 07:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ektPC3KSE8Ae; Thu, 22 May 2025 07:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD18613BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD18613BA;
	Thu, 22 May 2025 07:18:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BA30106
 for <buildroot@buildroot.org>; Thu, 22 May 2025 07:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 721FF83CA7
 for <buildroot@buildroot.org>; Thu, 22 May 2025 07:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OU6VduT_CIx for <buildroot@buildroot.org>;
 Thu, 22 May 2025 07:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DB3F83CFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DB3F83CFB
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DB3F83CFB
 for <buildroot@buildroot.org>; Thu, 22 May 2025 07:18:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so83991185e9.3
 for <buildroot@buildroot.org>; Thu, 22 May 2025 00:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747898325; x=1748503125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kxmOwZIWfcDiouNBJ636WhZNGLprQvmvnluaO5T9Baw=;
 b=hllfPZNKvBefL5mb0C5RozTUFbqp2IuoSsbewA5MNvJF4bshxMcekv0CQLckRifbXd
 GbSPQWAlAww7SM8chQ6eotE1sMXWOWZUhlBcTtOTBl3f8wbsucjB8K7i7e9iXhruiR7x
 3C9agvZj/5rx7T7u5ITWVswyyQiXABtGf0WQVuzc3ZQERXHylzAONHA6nG1Pwa7ymOtM
 1xvI2DTs5SYkvvy35E92Itmpl1qHNxvSzIJUu5iWvoXd6DZsEgVxp2lmSC54kuDo1Zu9
 3CJpumb4oCysX0MoQ17PI0TS8PfOtHfLdsnw+bSBR+1hlLBRRsPA3xyg3X+Ce0lFuMEY
 iwmQ==
X-Gm-Message-State: AOJu0YwBuhnQBs0PCSXvSUUzYj8nP9F9SYWr8yorGZtakxMoVH4OYbrW
 5XQjjbO7CwJ+MwfQ5e7+kG+H/k1Ahl1obn3HnYWkV7og5FvnqKTG3EfpOPVfK9aupSTefbT/hV/
 z4QqE
X-Gm-Gg: ASbGnct1o15hC/JPGWHTmFhTGR3F6L7/IDOjNHPilVYrzGrnZCoy3Y1ihe5cf6Q2YUQ
 uhtjWUdzhJof7ao89rxdQr0UdQdgGIuRfbhaJTyLKng/skQELuwjI7tfDXCexJj7jYOljxvrves
 2DmL3CYYMXfRw74LaNlsZJD2U5pb5yKlBZS//9I8rQS8rWYwigobTw13XATrLVYdSZSKWSTMNDr
 mnSb/Nb7XnBe9XAXfWidnyX8R55PNGU6FRux2wbhIgUvTW/9hJSpvoUcPDL6oS6HYZ/zNyhbomG
 g5QG/oahApiaKqLLU+3Sf3uDJyiC6QN+KlKDhzXiOUhtmzauodZmxOxDI9ihaG+5h3Mz5JQTbiT
 kCVoAFFXV7O5QVSVaSPPPb8RhRLd/cQNup/ri6c91etVmok/xnjkMF6jA
X-Google-Smtp-Source: AGHT+IEgZXgnJ3U+uET/SkY0YOwrhlsiOzfOAr/CkmrKD5PcSSoPHEYHzbqFCsHn+3rhKUwfgEYteg==
X-Received: by 2002:a05:600c:1d8c:b0:442:e109:3032 with SMTP id
 5b1f17b1804b1-445917d2a0amr139928995e9.24.1747898324991; 
 Thu, 22 May 2025 00:18:44 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f38142f1sm93835655e9.31.2025.05.22.00.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 00:18:44 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu, 22 May 2025 09:18:13 +0200
Message-ID: <20250522071816.1948188-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522071816.1948188-1-elmehdi.younes@smile.fr>
References: <20250522071816.1948188-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747898325; x=1748503125; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxmOwZIWfcDiouNBJ636WhZNGLprQvmvnluaO5T9Baw=;
 b=PWqfOUCCzORRgZ3GqvITT4nGK+bCXvqjgJmxMZKa797sW5Fp9kmtH/klppj4el2OR+
 oVrbq1rPc4QHbSAQjZYonOUc1EPlAMWeREWQL9B1Iv5gjm2S5YUMBEfRhZdPeeQd+YrS
 hdScMtqITuwI6vEo2TPW4ijPLHv/SkGtjInHE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=PWqfOUCC
Subject: [Buildroot] [PATCH v3 1/4] support/testing: TestClangCompilerRT:
 Add a kernel fragment for 48 bits virtual adress
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a kernel fragment to enable
CONFIG_ARM64_VA_BITS_48 for the AARCH64 QEMU platform in the
clang compiler -rt runtime test.

Without this setting, this sanitize-based test fails with clang-20
due to insufficient virtual adress space.

"This might potentially affect ARM platforms with 39-bit address space." from [1]

[1] https://github.com/llvm/llvm-project/commit/a588cfe37ea36ec4fae35a233a13d3557fba86e9

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 support/testing/tests/package/test_clang.py                  | 5 ++++-
 .../tests/package/test_clang/linux-arm64-va48.fragment       | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 support/testing/tests/package/test_clang/linux-arm64-va48.fragment

diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
index f36faa059a..a9794a49fa 100644
--- a/support/testing/tests/package/test_clang.py
+++ b/support/testing/tests/package/test_clang.py
@@ -7,8 +7,10 @@ FUZZ_TIMEOUT = 120
 
 class TestClangCompilerRT(infra.basetest.BRTest):
     br2_external = [infra.filepath("tests/package/br2-external/clang-compiler-rt")]
+    # Without this option the test fails due to insufficient address space for 64-bit allocator
+    va48_fragment = infra.filepath("tests/package/test_clang/linux-arm64-va48.fragment")
     config = \
-        """
+        f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -17,6 +19,7 @@ class TestClangCompilerRT(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.283"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{va48_fragment}"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_COMPILER_RT=y
         BR2_PACKAGE_LLVM=y
diff --git a/support/testing/tests/package/test_clang/linux-arm64-va48.fragment b/support/testing/tests/package/test_clang/linux-arm64-va48.fragment
new file mode 100644
index 0000000000..1bafe6e581
--- /dev/null
+++ b/support/testing/tests/package/test_clang/linux-arm64-va48.fragment
@@ -0,0 +1 @@
+CONFIG_ARM64_VA_BITS_48=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
