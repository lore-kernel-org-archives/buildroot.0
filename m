Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B450C61DFB
	for <buildroot@archiver.kernel.org>; Sat, 21 Feb 2026 20:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0A3483E13;
	Sat, 21 Feb 2026 20:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubxx_69__hph; Sat, 21 Feb 2026 20:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E968683E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771705570;
	bh=+PCK4ZOWw91VP10mI1M3x6L8CejdZdGb9KsdAipfyok=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GAlvnyg+sd4ICPfwFuFOla3l+mbITOCctkrEdayWAe+c5ul9I4ZKyKt80ra7jMTTh
	 FHRBNDyprolkjqUs2oGLCcOKcM6V7rbzZpX7ft4GlIzLXji3HtwuoGlWNOIMaXUv1D
	 Nlh+d9DnMHp/s0hMmk0mtSMTeqTs3ZQig/In4uscPMennCu0viGF51fmwFxepM0nAf
	 fXLORqg0Vk6uyTkRWxxD46CUwUWp5XSnnV4HAYe6NjAMN+PZdNXOiB7C0OKJVF2LEf
	 at4ZujwEvaLAX1rdP5MnxBqqLtB3MGj4969Fnzlg2fkm4qDZj1cYp/OK02dPzPTVT0
	 pj3rImFuAwTJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E968683E91;
	Sat, 21 Feb 2026 20:26:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 406C81CE
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 20:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 321984057A
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 20:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyfnFusA2sPg for <buildroot@buildroot.org>;
 Sat, 21 Feb 2026 20:26:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4E2440511
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4E2440511
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4E2440511
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 20:26:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6DC0A4C20D9;
 Sat, 21 Feb 2026 21:26:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50824)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vttYB-000000002eg-2ko4;
 Sat, 21 Feb 2026 20:26:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Feb 2026 21:26:03 +0100
Message-ID: <20260221202603.467160-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771705563;
 bh=S5ZQSv6csvKrBavNpP5kIP+ex1L4lcW86P9MZz3KVEc=;
 h=From:To:Cc:Subject:Date:From;
 b=CJWYt9HQgdU1Yo3LQrsRxPkKH4ZbbgHQq5I0WklJ0ol0n8oNY17MCZZhNoMdBcNZZ
 HYUE6u6/f2I3oAqe5OVGHnG6oQRttExYKlk67Su3dHhPt8K0im1QmSrqUANmdHH+R6
 zqwW9E19I7ofIXcuwPuDAXmsHKEZKVsvRvWhmwCG0BDU0f/7DsRZnXb7Y5jC+gldok
 NVaus8ByTdE6BFI9Kqgyqo4wHn/4+VhYWpqRDyi12b6kO2dafeXq7RDFaW8I6MuXXW
 NUxni1LBpqHGyEY90PNHUY0PPqLVK9SLm9Q7bgCKaTuhCQzdKI0oDFMZxaUgB2Ii6c
 675Fo1AxemlNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CJWYt9HQ
Subject: [Buildroot] [PATCH 1/1] package/qemu: Remove CRIS support
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

Buildroot commmit edfc67fb1a5f0fe67ba9de91e90b06a44902c231 bumped the
package from 9.1.0 to 9.2.0 without removing support for CRIS which was
removed upstream in version 9.2.0:
https://gitlab.com/qemu-project/qemu/-/commit/01d01edc9fc4623e93118bc8cb8c69a46d707026

https://wiki.qemu.org/ChangeLog/9.2
"The CRIS target has been removed without replacement"

Fixes:
https://autobuild.buildroot.net/results/376/376ea96ddfc0f220bca8bd241614303747f61bd4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy       | 6 ++++++
 package/qemu/Config.in | 5 -----
 package/qemu/qemu.mk   | 2 --
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4539b19bbe..a2a7b06a6d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_QEMU_TARGET_CRIS
+	bool "qemu cris support has been removed"
+	select BR2_LEGACY
+	help
+	  CRIS support has been removed since Qemu 9.2.0.
+
 config BR2_PACKAGE_DVDRW_TOOLS
 	bool "dvdrw-tools removed"
 	select BR2_LEGACY
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e16eafe446..0b16c8c284 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -189,11 +189,6 @@ config BR2_PACKAGE_QEMU_TARGET_AVR
 	help
 	  AVR 8-bit microcontroller architecture.
 
-config BR2_PACKAGE_QEMU_TARGET_CRIS
-	bool "cris"
-	help
-	  ETRAX CRIS microcontroller architecture.
-
 config BR2_PACKAGE_QEMU_TARGET_HEXAGON
 	bool "hexagon (linux-user, only)"
 	depends on BR2_PACKAGE_QEMU_LINUX_USER
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 97f8e22091..b7007e3b98 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -65,7 +65,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64) += aarch64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARM) += arm-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AVR) += avr-softmmu
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_CRIS) += cris-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HPPA) += hppa-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_LOONGARCH64) += loongarch64-softmmu
@@ -102,7 +101,6 @@ QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64_BE) += aarch64_be-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARM) += arm-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARMEB) += armeb-linux-user
-QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_CRIS) += cris-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HEXAGON) += hexagon-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_HPPA) += hppa-linux-user
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_I386) += i386-linux-user
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
