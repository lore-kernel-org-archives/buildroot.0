Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91714C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 20:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60738400E2;
	Tue, 14 May 2024 20:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVDPyM3e4yvG; Tue, 14 May 2024 20:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F16540127
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F16540127;
	Tue, 14 May 2024 20:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9720E1BF232
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 20:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61D1B801DA
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 20:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nq6DblfDN0HA for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 20:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.54;
 helo=mail-wm1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D54988232D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D54988232D
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D54988232D
 for <buildroot@buildroot.org>; Tue, 14 May 2024 20:23:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-420160f8f52so17382835e9.0
 for <buildroot@buildroot.org>; Tue, 14 May 2024 13:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715718220; x=1716323020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lSbY4gZ6XlNWsKWvySUNnSoHL3erEJj+osOwH/ms2aM=;
 b=GdwinoPugPBeIhR2ShtYD0AIEmy56heNRYyEYEGU09LZJ2HYirVPvQucDxHvlGqt52
 ZfF6f5eW+imE705jTq91k5OZD+ue/s5nUKfCqtqeF+C/t22yekYoPFNdxH+BxpRnybb2
 UliR9m2I5MfZNlNii7jqL6hqFP0KDPbSzwcAn2drg+fm0646D4W2Yne+ojl9wGzb7awp
 tCeBiWERLJqKLS1Yd0ZmYTKh7FzX1vbDzKIDwrMiUVKfMiCmO9aSsDUBmJMnY2Bv0vox
 dBsR57+vJQ2XQSglMHdqFc5L9iQ9Kp5gpiEnUcl/rW+1UOYuGErSrrU1as/B73koeeTm
 A/YA==
X-Gm-Message-State: AOJu0YyjMvE+TpBbOoA1u33NxOvw9mq9195qcv7pLJ0sHVBO1yyLNpcZ
 Yx7NqBUQFUNfZaThf9mIpSvElG77rBRZe5E0+K4Pd1+5Ji5JNL5sgne4LbHG
X-Google-Smtp-Source: AGHT+IG3ED//BG0/eeU6byK0V1j3VJKAPMlAORa46quI/NoHuEagwxqKFugMyVu3pRjZeC3MpclyvQ==
X-Received: by 2002:a05:600c:1c9a:b0:41c:13f6:206d with SMTP id
 5b1f17b1804b1-41feac59d99mr101458695e9.25.1715718220100; 
 Tue, 14 May 2024 13:23:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:a5d4:851e:63d3:a5f0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41ff6cbe992sm167927865e9.6.2024.05.14.13.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:23:39 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 22:23:37 +0200
Message-Id: <20240514202337.3934490-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libopenssl: fix build for the
 bootlin-riscv32-glibc toolchain
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Seen while using the ./utils/test-pkg utility.

/home/thomas/br-test-pkg/bootlin-riscv32-glibc/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/13.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: crypto/legacy-dso-riscvcap.o: in function `OPENSSL_cpuid_setup':
riscvcap.c:(.text.startup+0x190): undefined reference to `riscv_vlen_asm'

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...Implement-riscv_vlen_asm-for-riscv32.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/libopenssl/0004-Implement-riscv_vlen_asm-for-riscv32.patch

diff --git a/package/libopenssl/0004-Implement-riscv_vlen_asm-for-riscv32.patch b/package/libopenssl/0004-Implement-riscv_vlen_asm-for-riscv32.patch
new file mode 100644
index 0000000000..5de3221172
--- /dev/null
+++ b/package/libopenssl/0004-Implement-riscv_vlen_asm-for-riscv32.patch
@@ -0,0 +1,50 @@
+From 84f1acab51e159366b8cf97635ed97f8f0b6564a Mon Sep 17 00:00:00 2001
+From: Hongren Zheng <i@zenithal.me>
+Date: Fri, 26 Apr 2024 06:03:43 +0000
+Subject: [PATCH] Implement riscv_vlen_asm for riscv32
+
+riscvcap.c: undefined reference to 'riscv_vlen_asm'
+
+Reviewed-by: Paul Dale <ppzgs1@gmail.com>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/24270)
+
+/home/thomas/br-test-pkg/bootlin-riscv32-glibc/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/13.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: crypto/legacy-dso-riscvcap.o: in function `OPENSSL_cpuid_setup':
+riscvcap.c:(.text.startup+0x190): undefined reference to `riscv_vlen_asm'
+
+Upstream: https://github.com/openssl/openssl/commit/87314d24c4f025df1ebf47dc527cc8a96bef354a
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ crypto/riscv32cpuid.pl | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/crypto/riscv32cpuid.pl b/crypto/riscv32cpuid.pl
+index 20694e7de7..ac1c043ec9 100644
+--- a/crypto/riscv32cpuid.pl
++++ b/crypto/riscv32cpuid.pl
+@@ -84,5 +84,22 @@ OPENSSL_cleanse:
+ ___
+ }
+ 
++{
++my ($ret) = ('a0');
++$code .= <<___;
++################################################################################
++# size_t riscv_vlen_asm(void)
++# Return VLEN (i.e. the length of a vector register in bits).
++.p2align 3
++.globl riscv_vlen_asm
++.type riscv_vlen_asm,\@function
++riscv_vlen_asm:
++    csrr $ret, vlenb
++    slli $ret, $ret, 3
++    ret
++.size riscv_vlen_asm,.-riscv_vlen_asm
++___
++}
++
+ print $code;
+ close STDOUT or die "error closing STDOUT: $!";
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
