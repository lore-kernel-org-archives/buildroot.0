Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A617BC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 22:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 389F9613C1;
	Wed,  7 May 2025 22:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlozUiDroNzz; Wed,  7 May 2025 22:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74333613C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74333613C2;
	Wed,  7 May 2025 22:51:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F4B815A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 22:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4515D40DBD
 for <buildroot@buildroot.org>; Wed,  7 May 2025 22:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLma5NZ6296y for <buildroot@buildroot.org>;
 Wed,  7 May 2025 22:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15DB040DBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15DB040DBF
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15DB040DBF
 for <buildroot@buildroot.org>; Wed,  7 May 2025 22:51:12 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-22e4db05fe8so4849895ad.0
 for <buildroot@buildroot.org>; Wed, 07 May 2025 15:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746658272; x=1747263072;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xzxePxeSzUkETgi2rcpUt3kquZEM3gfGOeGCULNRIJc=;
 b=qTVxqJ8ijsnY40whswJw2BDOBErMUJdwDtBzxfFN+p6MjgvcwMw2pfEBCWjuf/V47b
 CckfwxWCGBCP66BD9W2SA5u+cDvbdwS9WmmGlbXty0qQ3z0AjPwb5Oejla5pleY6kJzQ
 dLjid41PTTfHqw/6oD1c0GaimRpzhHO5gUovRmtR8ThOVUxzT6XTNiAuB3TNfj9jwUQe
 mLaA8Kl2tMDL5zOUxdKjhy0pFy3R0DuZ5fOxYYfpouoBBgABwfQAOk9rhqvbKNioCF/i
 0V7fmEqOEYAM54pZsRG7FdWxFNDWqFf41eTLYJRpI/pVWynN9+lL/lNNp7I18MPYFWDa
 pfHw==
X-Gm-Message-State: AOJu0YxgiGRkPJi5+U4txqeX9n/f/cnk32L831tmENQVo4Wfu/tYRV61
 C4RH7MkMTU7lnyBjNhUschH017CZMRP9FfXHzSH9djMofWIksIWTlfU/gulXTLF6Rvpp2k44WDF
 t
X-Gm-Gg: ASbGncssS1peaMslT6WnsKpsp7/Y3t5MxGCJuKisXxp5AChYiGE58JiyXxUn9Egg1ln
 8FAymac98q3nBxeQWmD9rbK13tl/tgfkHDbzIfTndq3uTYSHTkHJgXbYkcpvofWMnNYn4HTMOvS
 58z7ZiVfCw0b+wsGmQ+zYC0Glkk4szAlIGC4DZLlxH+FoKigRo2+ML3z0P3Pumil1PhWd7RRttI
 O72k7M65QH+lpg1KCzhHYQIDw8uFJi6qd8YbqkXEc6bYn+/GZ6jPP6CP4MF/ys8HIgyJLVhMAu3
 sGL9ZYN41l790BG2M7CasNlS4THVtp0/oKV5wFInee4+PEf1uXNT3EK1
X-Google-Smtp-Source: AGHT+IGWRZxHaruwoZdSMXDC3tDm8ZFCIrcedE0V8KVNZFytApRC4BrqQQEfYxefMsxFXwF0Ar9V8w==
X-Received: by 2002:a17:903:166b:b0:223:53fb:e1dd with SMTP id
 d9443c01a7336-22e5ea27eacmr72330625ad.9.1746658272275; 
 Wed, 07 May 2025 15:51:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e15232655sm99773825ad.259.2025.05.07.15.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 15:51:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 07 May 2025 15:50:53 -0700
MIME-Version: 1.0
Message-Id: <20250507-riscv_isa_extra-v1-1-2cad4c15d2ca@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAMzjG2gC/x3MMQqAMAxA0auUzBaqolWvIlKCRs2ikkgRine3O
 L7h/wRKwqQwmARCkZXPI6MsDMw7HhtZXrKhclXjGuetsM4xsGKg5xa0vu2xdb7DGhfI1SW08vM
 fx+l9P489mrZhAAAA
X-Change-ID: 20250507-riscv_isa_extra-769a6078a3ad
To: buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=JKb9+pWN/qeo2YTeIeQ5isjyQRM27OpSm1lz6ACRTWs=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ4b04xvLZHfNX5y3yd/22t53SjsXFClyP9VvzltwQuGVR
 acgZ9TbjlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACZSuY3hr9h8f6EXrZ+4EmaI
 3DMuqDbh8n8coiTRtOcKz6XGqSlxIYwMEyLd7dKVN11151m7NfNC/ebKm//9vAo4r+58ufv2g//
 Z/AA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746658272; x=1747263072;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xzxePxeSzUkETgi2rcpUt3kquZEM3gfGOeGCULNRIJc=;
 b=BX7NGjaG0vaVnW2sFQz9dx/7iEHZa90kpqwIjWUx0R1Go/f8AWZlZtEIf0qk6/RQL8
 TGkSEKpXXWc1R1P29FnnkNkAhjQYKuuhZn6rhx5cjlIYUz27NIJMHveIDLo0YzciNAZc
 HUdRkUtHzE5NekjIFFDSbDfCK4YO7t1gps0rYvueqprwHCM5vIRVVT4KZj4GGIaXbUV7
 7qi5RQ7Rmgkg3QemF/1kw4uUCssksZdToITgXZGlT/IVIMZ1fMUetVwYOKWkzbf/0VFx
 i3SttuVdtTkbzY8gyKv6mn8utxzmjxrPN2Pd/3YoXEM6e4z4ica6rjttsok4nsNwkdW1
 qL8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BX7NGjaG
Subject: [Buildroot] [PATCH] arch: riscv: Add RISCV_ISA_EXTRA config string
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

Adds a new user-configurable string to arch/Config.in.riscv, and in
arch/arch.mk.riscv appends it to GCC_TARGET_ARCH.

This enables custom extensions/combinations to be easily configured.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/Config.in.riscv | 7 +++++++
 arch/arch.mk.riscv   | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 23d095d1a6626d6bfe4a717b1837aec72e67b8db..4f48b6f3cac7ed182c045ded864aaf190144b54e 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -45,6 +45,13 @@ config BR2_RISCV_ISA_RVV
 	bool "Vector Instructions (V)"
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 
+config BR2_RISCV_ISA_EXTRA
+        string "Append extra RISC-V ISA extensions"
+        default ""
+	help
+	  Extra ISA extensions to append to the ISA extensions string.  They are
+	  underscore-separated.  For example, "zba_zbb_zvl256b".
+
 choice
 	prompt "Target Architecture Size"
 	default BR2_RISCV_64
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index ee5c434b97115eb0106b87203dc909c0705690eb..3e258b78afb0f4bdb2a456d644489b1673e2df59 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -39,4 +39,7 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_12),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_zicsr_zifencei
 endif
 
+ifneq ($(BR2_RISCV_ISA_EXTRA), "")
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_$(call qstrip, $(BR2_RISCV_ISA_EXTRA))
+endif
 endif

---
base-commit: dd2d62a36e091ad745fbacbef810709b2f597396
change-id: 20250507-riscv_isa_extra-769a6078a3ad
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
