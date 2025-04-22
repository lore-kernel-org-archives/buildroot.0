Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8BAC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 08:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7957E60D52;
	Tue, 22 Apr 2025 08:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EafZXNdkeibN; Tue, 22 Apr 2025 08:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A29EC60D66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A29EC60D66;
	Tue, 22 Apr 2025 08:53:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39FBE1BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F43B401CC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QR1fXjo_7xTq for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 08:53:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 473A840FA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 473A840FA0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 473A840FA0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:53:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso31232855e9.0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 01:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745312032; x=1745916832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yqnb/Ue5lUkmnTOZniHzgEyg+cmzrrok3/ExkmkzkZ0=;
 b=SAbMzDGODPGwWUDcwfVJIxbVQuK168JzUjJq3U8Kpt7rJq9zuMBLAZzYnOY/FlL8I0
 RPsLsecJMJGzVJJLXFmm5ftL66eI4b0eO79TX1g83tP2i2nXwtJ89KYdTjAtKlvjdc55
 ClcsfsKnWgH9BTbQEMkRQnuX5kC0fl0DLRw++Ku0EMeWoMOjsCmfZ7VJeRQUrDMjVOao
 v4TPv0ThDv6EiSDdMpZS/w0TrfoBg/pTUlDvVcr0cJ421rckcSu7cnc/+oxOfxvoqVOj
 F/QeQRqbcNRS96YN39zG2uqaRUYASgjwvcPl8OsP3fhjSZY6/DGvrvhl8h3/c0NBZz22
 iKfg==
X-Gm-Message-State: AOJu0YxTlDWC3AvZ4vGslUCI/Ez4h19OX+nJ6vTxTCGddAKyCXsQqUle
 ovuUVktctZpXEqZtQYmdGEuDEiYf8iDi3C/G5i6Zi4fpZsZFeHul1Oc3jxGtYl1ghxdoDVr5X/A
 f9MA=
X-Gm-Gg: ASbGncvRqyRoA21GzF5SZ2qX0SBAsQ2+P/Qd3ZrHHEekzkJVyFXVqwn8q0LHhAm/GVq
 jRZ4o0aqpHjFMpBLJMG7lLESiiLCooRxJX3TSiRasej3PZcExrj8DSV36xLYQ0F898M4fgxqMai
 bwOOUDcXkIX4QyfFgGFhuZ9jjr/Xcmor/BR2oyogjl9aVKKppz10CTa5ngS8jJdAcK6JdRHhjQn
 pZ3sk6rP915SFXsnx/drjhp1Ih4qHYm9cgrWUDHLJGpiHqOrMdu5pFB3g985xmM61VJ/LXV5aP8
 Z3eF/Qa8JY2yHgXkssjRaRwSe8PJjXYH+S/p98fxQ06uOGNoTZfCCqf7GSzv4eruS4EIT9uRPTG
 82o0n0qso4qRGQH8eFDg5WMxQ1HYzn+aTFmE=
X-Google-Smtp-Source: AGHT+IHYwBZA0QlHhdt9vdqztHG2U28SYAwiNK3CYAqmF7mBQl2P1ZW7iqKRSMwCIUVaQxIfrQS9SQ==
X-Received: by 2002:a05:600c:46c5:b0:43b:ca8c:fca3 with SMTP id
 5b1f17b1804b1-4406b28e9e5mr109220655e9.11.1745312031846; 
 Tue, 22 Apr 2025 01:53:51 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa3a1685sm14451238f8f.0.2025.04.22.01.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 01:53:51 -0700 (PDT)
To: buildroot@buildroot.org
Cc: David Pierret <david.pierret@smile.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Tue, 22 Apr 2025 10:53:37 +0200
Message-ID: <20250422085337.901025-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422085337.901025-1-elmehdi.younes@smile.fr>
References: <20250422085337.901025-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745312032; x=1745916832; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yqnb/Ue5lUkmnTOZniHzgEyg+cmzrrok3/ExkmkzkZ0=;
 b=bzTuI0GRoGWPY3+QmD4AVtjgUa6+H3o2F2G3/04mmZYoiyhl0kBTWeHFeN248Vh9BY
 ugxWaKjhj6Iy3sHSFJPYzsxa6yNoSTlwy5oXSMJD/IRGnAxVARubnqLn2kLY/fYqcv38
 UiGck62xBYTAId56L1mJxlx4bHZfjx/DU0aIg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=bzTuI0GR
Subject: [Buildroot] [PATCH 2/2] support/test: new bat runtime test
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

Add a runtime test for the 'bat' package to verify that the binary executes
correctly in a minimal Buildroot rootfs.The test cheks that:
- 'bat --version' runs without error
- 'bat' can read and display a text file
- the displayed content matches the expected string

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 support/testing/tests/package/test_bat.py | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 support/testing/tests/package/test_bat.py

diff --git a/support/testing/tests/package/test_bat.py b/support/testing/tests/package/test_bat.py
new file mode 100644
index 0000000000..749fb38e85
--- /dev/null
+++ b/support/testing/tests/package/test_bat.py
@@ -0,0 +1,26 @@
+import os
+import infra.basetest
+
+
+class TestBat(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+            """
+            BR2_PACKAGE_BAT=y
+            BR2_TARGET_ROOTFS_CPIO=y
+            # BR2_TARGET_ROOTFS_TAR is not set
+            """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the programs can execute
+        self.assertRunOk("bat --version")
+        self.assertRunOk("echo 'hello test' > test.txt")
+
+        # Run bat and capture output
+        output = self.emulator.run("bat test.txt", timeout=10)
+        self.assertIn("hello test", ' '.join(output[0]))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
