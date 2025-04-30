Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4546EC3ABAC
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 19:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D31CC40CBD;
	Wed, 30 Apr 2025 19:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qg2Jpf3TMjIb; Wed, 30 Apr 2025 19:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA03C40C38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA03C40C38;
	Wed, 30 Apr 2025 19:11:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B60BE4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 19:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FCA360B94
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 19:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1SwlDOQGjna for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 19:10:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 115AD60905
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 115AD60905
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 115AD60905
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 19:10:56 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b0da25f5216so154737a12.1
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 12:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746040256; x=1746645056;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=upWW+yYUzH6lpHRJ4FMK/cr2TBvWGV/X72D0Hcvxq1Y=;
 b=nwKxgrjQOsKg+1pVzCGYVbTf/o+e/SaA3aVMgYn6ZbLgoILO/vqeNBDNe6IsOayDsF
 f+LlUu+OqxApeDxa/7Qt9O8bo+iPik7yHDCpfQVhLPWK0ba5rpELPPkDe1UV+VxH7K6G
 R4ZykH8xRd+kzcvYUUWU2hl31EY0SsxWHZ+0GaUm0P0Ftv0RQzUlcsfixQmLqEOlfU7C
 csZGxIjhFUDc7kA55G3tftex9MWSB0FjTqB711W0X7IlvvCvVun2/NcO6OP+1c0LBoY4
 6Nxau96aNcpm/guO3dRC0bpkEYVasFuG3jrMcjmQyhlnf2UlzukDaUOQeIAbd/kxbaFQ
 Md2A==
X-Gm-Message-State: AOJu0YyEOowGFsO0spZx2eHHUHIFDVHkE83XQ2V3pEHuVNNowaZcBRs/
 /tFPnRyYLV3qSfbj3DneOMYrEFvEjzskTLX0PIpIiV9rfzSRYLe58EYoC/zQA+s=
X-Gm-Gg: ASbGncvZ9DYWCvXq0hT8+jgYtgC2vcI9SCIyvAF79GT46S3y8ZXndkURppz1L++g9b6
 ZELHOS++iQ3DaTwj2N0GHRNz+rhNeOkY5rOJWbrO8+yhidqz4EgjoMS3E1ENnFGAPHg6RKSgG4B
 quAj9XFjH7h4JVc7hjD1c9sQJasGFUu88xVAXwprT2KH69Hmh1kEEaq35ZKF+8E/dSCylChPe8W
 xGO3lYqMqxLJfTI+JEXphN6Bz+cnZLLCOgl1jQ2Rml877w3bUWdspgW3XR+6y140kd3B1JbLJSa
 3SI0JHppt2aF9L8RORPlLYw+oLw5tOwWw/cLx7n7/gQmOsOnq78hgX/6
X-Google-Smtp-Source: AGHT+IFKd2OqWQndwz97kjIPqCvoaQ3Q8UsIK9kyocrn4Yum50uJ3yddGv7xNrV9TowqAIqOVOIDEg==
X-Received: by 2002:a05:6a20:a114:b0:1f5:55b7:1bb2 with SMTP id
 adf61e73a8af0-20ba6a20238mr579780637.6.1746040256470; 
 Wed, 30 Apr 2025 12:10:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f76f42a8sm11111304a12.3.2025.04.30.12.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 12:10:55 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 30 Apr 2025 12:10:36 -0700
MIME-Version: 1.0
Message-Id: <20250430-uprev_pixman_46-v1-2-c1608b4d4bd7@rivosinc.com>
References: <20250430-uprev_pixman_46-v1-0-c1608b4d4bd7@rivosinc.com>
In-Reply-To: <20250430-uprev_pixman_46-v1-0-c1608b4d4bd7@rivosinc.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3714; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=j+d5wdtWdcRostOaLZs60oX+OZvxcg35A6uI7iGn0ws=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ4ZQ6Z7Xr7tLH0166dk52Z1h756P26UOekxcc6Hx9YFi4
 QUVBbfPd5SyMIhxMciKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjARP1eGf5Z75ylJz8zfvsXo
 7rMU9bmrd057FLqqXMw2UrKa+yBbQScjw4oJIXfCw/82lXxbvSd4B5OlCaue0oNDdrN0jG+8Xn+
 uhQUA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746040256; x=1746645056;
 darn=buildroot.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=upWW+yYUzH6lpHRJ4FMK/cr2TBvWGV/X72D0Hcvxq1Y=;
 b=LRDSlZuPks3mLUnByY+sFzyh2dbeOc6X/eb1C15guypz7e0jtehaiRazPPkGP6svGk
 ywxeqaIWwpDEMkAG3iCV2ENaeU9reifGtZoUgQq+9VWlR/gspJ+lYCKCKNlv6QX7BOHH
 Xd3kIW0qPhc6tOzDDmiY79KAtXnXMiyEYV5OEedfbxU5wS26hedQp6GIUJn0cODAjFzm
 XnG4fPj20t3HSOHbY8d+WCOVn4qMdrCxdEq9V1ypKl1O5ndHBkYTNF2A0iFoLKHmNgYM
 +gMsZSOs1cmHHGPcg7U5pNghROxjivux1j7YR2O9JiLF0PYxs6f4fOjJe46EsRnegxU0
 V2qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=LRDSlZuP
Subject: [Buildroot] [PATCH 2/2] package/pixman: Uprev to 0.46.0
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

Version 0.46.0 includes the patch to fix building on riscv without
vector support so drop the patch from the tree.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 ...-enable-RVV-on-linux-if-hwcap-headers-are.patch | 44 ----------------------
 package/pixman/pixman.hash                         |  4 +-
 package/pixman/pixman.mk                           |  2 +-
 3 files changed, 3 insertions(+), 47 deletions(-)

diff --git a/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch b/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch
deleted file mode 100644
index ad1a0902e2aad712a2a6fc73650401ee8ad31f1a..0000000000000000000000000000000000000000
--- a/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d0045f1fc32635d9629ea9e361631b07d9ca4140 Mon Sep 17 00:00:00 2001
-From: Charlie Jenkins <charlie@rivosinc.com>
-Date: Mon, 21 Apr 2025 13:08:50 -0700
-Subject: [PATCH] RISC-V: Only enable RVV on linux if hwcap headers are
- available
-
-Linux 6.4 introduced COMPAT_HWCAP_ISA_V. When trying to compile pixman
-against linux headers older than this, pixman will fail to compile
-because it assumes COMPAT_HWCAP_ISA_V exists.
-
-During meson configuration, do not enable have_rvv if the platform is
-Linux and COMPAT_HWCAP_ISA_V doesn't exist.
-
-Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
-Fixes: 0e424031bda2 ("RISC-V floating point operations")
-Upstream: https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/149
----
- meson.build | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index fdea28f..cb10931 100644
---- a/meson.build
-+++ b/meson.build
-@@ -379,7 +379,15 @@ if not use_rvv.disabled()
-         }
-       ''',
-       args : rvv_flags,
--      name : 'RISC-V Vector Intrinsic Support')
-+      name : 'RISC-V Vector Intrinsic Support') and cc.compiles('''
-+      #if defined(__linux__)
-+      #include <asm/hwcap.h>
-+      #include <sys/auxv.h>
-+      COMPAT_HWCAP_ISA_V
-+      #endif
-+      ''',
-+      args : rvv_flags,
-+      name: 'RISC-V Vector Linux HWCAP Support')
-       have_rvv = true
-     endif
-   endif
--- 
-2.43.0
-
diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index c49b9c9e76aa6ea2b38c94717f934a1c3fe051b7..b74f8cc64891a92c98ddd60b05478fd8be117988 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,5 +1,5 @@
-# From https://lists.cairographics.org/archives/cairo/2024-December/029586.html
-sha512  b24907f9a0bf6a9aa3278d31986c562c5f2d68f8c178021497c8648aca9f91e4c6f1ecfacf93eb01ba4f03ce4cfc5970fc40bb0fe6724bac9210fc57da09cba4  pixman-0.44.2.tar.xz
+# From https://lists.cairographics.org/archives/cairo/2025-April/029612.html
+sha512  c7ef987b7db89c58278c537f862bc9eb17c19f8288a3b7e88f8501a0486662f1e2cb6a2c0b81d4bf0464310475192428d6e29d05a6ae3cfc1d2c0941fbb0b9a3  pixman-0.46.0.tar.xz
 
 # Locally computed
 sha256  fac9270f0987b96ff4533fca3548c633e02083cbba4a0172a3b149b2e4019793  COPYING
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 78ab20da5915f2b7b9d5710b46b5ca8011e32240..0611a0b732fabe00ea5fb454875e28d27a58eaa2 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.44.2
+PIXMAN_VERSION = 0.46.0
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
 PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
