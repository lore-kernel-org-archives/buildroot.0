Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF34C54756
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC8D3612EF;
	Fri, 16 May 2025 17:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuC8Gb_OUcle; Fri, 16 May 2025 17:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA64608FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEA64608FA;
	Fri, 16 May 2025 17:12:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2733213D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 158E1832D4
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96fpR4-iQGTv for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:12:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2ADC832AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2ADC832AA
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2ADC832AA
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:25 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so17808025e9.0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747415543; x=1748020343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L7/BK8f6AveLHVvuxCeq5JOaPXABLXufp5wNbotwj8s=;
 b=WL813m8586+qIT/ZZWmtu4TewihCK5kOk/EmnizVr2Mm3j0THkPiFBFljJs6zi2T0p
 2Dj9QsBNDsXYqJXV2DhrMlzQdnOQRZxiezqFcPNTOijCjpXQrlj5iygN4yMwz2S1jZxj
 hZHxcRX46ibEwgq0mOmv5E+2mc0kaxppiW02ldno1IEQDN6q8TiqqwUGQS/OkQaxBrOd
 1kCCl3l5J5rHtQdAB8nimUZtronDwayZFbVvZTO8fJ86BwLg1IlDSSUppnnLZoSictu4
 JlYGDYCPcEJv+zHgjzF/iRG6mNjShiokClRatUBeAN3psba9R0IkCFuQlurLx+7sV144
 y4Qw==
X-Gm-Message-State: AOJu0YwuV5+WBiiBGkeoPlu8KxTwbS8BCPng9GcwM+73AJjKVKReNG1f
 4jHZz7E1TDvcSUzZbCjUOHTl5dq5rMwza7+kr5m+1S2tdHLsYx7f7SDT0L9DYCu7whK+/g5Ec34
 oR8ZU
X-Gm-Gg: ASbGncvfoqNkfpdOF8VglkQGJXfmWPvpFEH+mQ9eE/bwhMz/vibJ7QSjLOpokiRC9uy
 d1GgeVAipY9ZIN+QyJngI8RJFtz6MnpsrR/2Tu1Nn50WDqDKy0mPn9yUXco22DUpl5MDz1VfvEd
 oF64VGPoq67/UU8D/bXxV3pJp94764EADWZFTW04JcBOmUCKVBvALKVBxqm3pX0LeuXg7SWuIPk
 wP020nBSChh+x+iLblLCzQpu3y6hfwjGHHTKCZYcLaBk1N1UXiImXcZJwHgL8A977ITAsU1qkcz
 MdGQjTU0FtyN4wjOJibnbmgGKB/jDXPXRomW1ZdbAvIPsKLZT5O8H0au7xl8tm/ek1wnOL8sxUM
 EXLhZFpuC5acIGHEUdM9evgx3S+dO+MhZAgQuTpQ=
X-Google-Smtp-Source: AGHT+IHeFgSNp0mORLwBqMt9kPXqaGVf0+kTkOz3wz++myY2sTwlImjWOuptyhuUwm5ldKhMOGAJMg==
X-Received: by 2002:a05:600c:5006:b0:442:f956:53f9 with SMTP id
 5b1f17b1804b1-442fd64e4d3mr47366935e9.18.1747415543454; 
 Fri, 16 May 2025 10:12:23 -0700 (PDT)
Received: from P-NAN-ABRICOT.numericable.fr (185.137.153.77.rev.sfr.net.
 [77.153.137.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f482f1d6sm105479675e9.14.2025.05.16.10.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 10:12:23 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 16 May 2025 19:11:30 +0200
Message-ID: <20250516171134.1687054-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516171134.1687054-1-elmehdi.younes@smile.fr>
References: <20250516171134.1687054-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747415543; x=1748020343; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L7/BK8f6AveLHVvuxCeq5JOaPXABLXufp5wNbotwj8s=;
 b=qP7bk5QWzDy2RGlQESOE9Fb8CX8fjWTt+KrPbplPkydXQ7dyZfd2BZ1ToVzBLNhO2j
 jXwTjaeK5W0XT86KBrz9sxMWk/N9cWKZqe8bEeRh9oNb4fd4pSvDKYEMABHd7JEsvRsV
 t1dYc7OKm0j0LWy5ClAM/Y9Ry+yYhGKwZTtcU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=qP7bk5QW
Subject: [Buildroot] [PATCH 1/5] support/testing: TestClangCompilerRT: Add a
 kernel fragment for 48 bits virtual adress
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
