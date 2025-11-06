Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1ADCCFA13
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 18:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A80D606C4;
	Thu,  6 Nov 2025 18:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVuOwLd4yY2H; Thu,  6 Nov 2025 18:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D6A606A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D6A606A5;
	Thu,  6 Nov 2025 18:31:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AD47462
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 18:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4036683F71
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 18:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IoBWlv0UQ4eV for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 18:31:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3463783F55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3463783F55
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3463783F55
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 18:31:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5746CA4C3229;
 Thu,  6 Nov 2025 19:31:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37362)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vH4lB-000000001qT-2Wio;
 Thu, 06 Nov 2025 18:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  6 Nov 2025 19:31:01 +0100
Message-ID: <20251106183101.2197897-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762453862;
 bh=g3eiqmqWCR3iakVXPN3jDIARXon37qQTpNdBnB13C00=;
 h=From:To:Cc:Subject:Date:From;
 b=ZuDeKfAnsIZS6dz34zCm3J+vUI+9ECCVk2uCHgIHuUdG0yeZKZ4Dhm3qlwGdLtLps
 Fl4cHHwLLKAom/um9CNsrcNe53ZaSnIC/jwmsTQeVuGm2+39joq+QATe5575MlevpV
 D61Ns0BraKRRAjTrjb4N0dzd/3S/MrYwo7gLwolo9bSxbd+kJGlI53ilfQUf68dYIU
 zrQBHLnFtkh/EcCChNV+0QAceh5eEPr+WqVb4gaoolyLYBVf0/aHuHMKD/f5XTBazF
 537W8fbqrKF6253zWSxQkMytE0dzS/s6YK70QcaT98ySEXCXYljbh6+ENCpPQC43fG
 EwLXAG+amqD/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ZuDeKfAn
Subject: [Buildroot] [PATCH 1/1] package/libnvme: fix build error
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

Added upstream patch to fix build error caused by version bump to 1.16
by buildroot commit 12500fb060997a0c76daa72521615038c8514d25.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ng-cross-builds-with-OpenSSL-enabled.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch

diff --git a/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch b/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch
new file mode 100644
index 0000000000..7cf91fd98e
--- /dev/null
+++ b/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch
@@ -0,0 +1,31 @@
+From 82066e5f46d743e7a7cf396be7f95e577084b93e Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@kernel.org>
+Date: Thu, 6 Nov 2025 08:10:27 +0100
+Subject: [PATCH] build: avoid breaking cross builds with OpenSSL enabled
+
+The OpenSSL sanity check wants to be executed, thus we should only try
+this if it's possible. Since this is just a warning, we can just skip it
+if it is not possible.
+
+Signed-off-by: Daniel Wagner <wagi@kernel.org>
+
+Upstream: https://github.com/linux-nvme/libnvme/pull/1090
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index dce5c68e..6d1f5204 100644
+--- a/meson.build
++++ b/meson.build
+@@ -252,7 +252,7 @@ else
+   conf.set('fallthrough', 'do {} while (0) /* fallthrough */')
+ endif
+ 
+-if openssl_dep.found()
++if openssl_dep.found() and meson.can_run_host_binaries()
+   if openssl_dep.type_name() != 'internal'
+     # Check for a bug in the EVP_PKEY_CTX_add1_hkdf_info implementation
+     res = cc.run(
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
