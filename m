Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B284EC83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B1360FA0;
	Tue, 22 Jul 2025 17:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsB4zaGv_sgt; Tue, 22 Jul 2025 17:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7CCD60BAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7CCD60BAA;
	Tue, 22 Jul 2025 17:40:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B955CD
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FA9460BAA
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_dmShQJf3za for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:40:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com;
 envelope-from=jesse@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA22C60B72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA22C60B72
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA22C60B72
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:40:35 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6fafdd322d3so51743106d6.3
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 10:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753206034; x=1753810834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M4W9ruJ3wvdvKOQxzFCl1M2C1jwXxX5tCOz8W6Gjo10=;
 b=ZqGT3YMg6wX3liJrlhB29RD9SiF+4oAUC/Xdu17Q2jHZpHpU+l8kGbxR/dVMZTPEXB
 NJUjUqbDNUTDqF2Nkv/c/o+BvOWHWkXqbdrua5VtNeRtBRBFDxFZYMTFl8TgzmCV2OhF
 AXsIBuvpiEa5V6rcmN5DjR2ku1m46R44bRmHGsTqJE2wdbw4V2OQEOLI/2B6Kp95L1jj
 NoZdeUoFcy9sxIbIYi18wkJY5bwKGif6JlwZEMtuOY0W87qLQIc5zdCYE3CXZg9BxJ9e
 CVXgiLMPesP0HNh/vzINgeI8QYSCVqgxKlyuCUCUkFGmx+hKV8mIHTbDPqL2F4HYSztp
 8zTQ==
X-Gm-Message-State: AOJu0YzUWNCBZy9GNBI5wIdzwMwbcOEI/rqvBsuVgsLSOFL5tYd7pWSo
 AO0ihgyZXUOLzp7Kk7EZ0dR2T8iX65afC3Y+kyHfDZRiSSAkGNke1moMU91GDgkfrcGwM1i1WOL
 0Ul73
X-Gm-Gg: ASbGncs/dx4IvreGwZ4NQsVUmp3qihC/rSfds4Efb5UGDAlcsOT8pyqIlRz8kzN46Lp
 SAUV5dcpQGaXqH1D2dKhmpWMROmVTt+HD4JgNoWRQvPHvfQPI53whScxgz9dNcX7MyaSByuNDiY
 c6zdxSz+FWZKKimpHaRTt5Uooo0qpu0pcwV4f2wosSHoQBl8tAwAIVek5lVhjKHmwdzNURD9zJL
 axPF/m7r7JzohMUazB/5egdsfybx1KU0FRQ0M3FsQrpsDdzUXkYIt9BD4+DX3UIdTXOpqZPbsbh
 mbROQXqhxc1spJZl2UMQRGWX3+Fc/cDF4XLMltD0Va458ewynrDOZb49KMym+R7tJyVnvxBPJSJ
 ZexpOFPvRtOsbQvmMdQPCkwJyXT9Vd17POZ/EkJQkipsVwOT41nfNXTTJJ4jaX9wdhMwiAwSJJV
 DZ1rqHxn38uBI=
X-Google-Smtp-Source: AGHT+IEvQXP4ZAV2488S/QuBc2UHN41DLLZMknczLUl+uq79XIocN9eXo4hE4XCt7JnLk7wi4Cbz+A==
X-Received: by 2002:a05:6214:300f:b0:704:761c:d021 with SMTP id
 6a1803df08f44-7070055bbbdmr315226d6.12.1753206033779; 
 Tue, 22 Jul 2025 10:40:33 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com
 (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7051b907a96sm53608816d6.40.2025.07.22.10.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 10:40:33 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: buildroot@buildroot.org
Cc: Cyril Bur <cyrilbur@gmail.com>, Thomas Huth <huth@tuxfamily.org>,
 Jesse Taube <jesse@rivosinc.com>
Date: Tue, 22 Jul 2025 10:40:32 -0700
Message-ID: <20250722174032.984258-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753206034; x=1753810834;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M4W9ruJ3wvdvKOQxzFCl1M2C1jwXxX5tCOz8W6Gjo10=;
 b=eHIQQAiZ1Js10Kp1+pykK1CGX7lu2tMLzXAC1UrH40d/SXADyHqKEfW4ujo8TZtZ3N
 e4R97Wq97kGttLYgmjQF5z+T410a8p/zziaK+zqHE5hgmrLVPJuJIe89SVsbUY3J6jjJ
 5UfuW8MePzpfq2g1ArqNsCde5PNzj3Jef/e4hNIfhsdAU2DSIEMLZiI1Wd9IrFVPVDVT
 VDUOAH8gTkJimwAqQg/fXY/Yjd/LjlYaRp3nBG5vnRdjeEi9nm2hkNaLSQgJ/TuXNom9
 A5753fiWCfqIA/kNjeeWUirlvqLP+eETA2teaJBmQYYfrDvzTUUJLIZSoW0rwQgl3Hn3
 ogpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=eHIQQAiZ
Subject: [Buildroot] [PATCH RESEND] package/kvm-unit-tests: Add RISC-V,
 bump to version 2025-06-05
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

A new kvm-unit-tests version has recently been tagged, so let's
update to that version.
This version also add suport for RISC-V, add RISC-V to Config.in

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
---
 package/kvm-unit-tests/Config.in           | 1 +
 package/kvm-unit-tests/kvm-unit-tests.hash | 2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk   | 6 +++++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 02ea8dd58c..0d66a08dd7 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 		BR2_cortex_a55 || BR2_cortex_a75 || \
 		BR2_cortex_a75_a55 || BR2_cortex_a76 || \
 		BR2_cortex_a76_a55)
+	default y if BR2_riscv
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_s390x
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index d4db9f2b75..ad0922df59 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  8636994e10240705f10a9150ef688ae6832d0ea0dcc8860c826c645ecfc1169f  kvm-unit-tests-v2024-01-08.tar.bz2
+sha256  60015b023f34261c134d714f4670926ac81483e286a16475eb4a5cedab00eefa  kvm-unit-tests-v2025-06-05.tar.bz2
 sha256  b3c9ca9e257f2eaae070cf0ccdf8770764f05a947a39a835e633413750a5777b  COPYRIGHT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 73d20d6b2e..c40324a9f3 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 2024-01-08
+KVM_UNIT_TESTS_VERSION = 2025-06-05
 KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
 KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
 KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
@@ -18,6 +18,10 @@ else ifeq ($(BR2_i386),y)
 KVM_UNIT_TESTS_ARCH = i386
 else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 KVM_UNIT_TESTS_ARCH = ppc64
+else ifeq ($(BR2_RISCV_64),y)
+KVM_UNIT_TESTS_ARCH = riscv64
+else ifeq ($(BR2_RISCV_32),y)
+KVM_UNIT_TESTS_ARCH = riscv32
 else ifeq ($(BR2_s390x),y)
 KVM_UNIT_TESTS_ARCH = s390x
 else ifeq ($(BR2_x86_64),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
