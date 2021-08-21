Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03522C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 16:05:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A4626121F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 16:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A4626121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62D1C401FA;
	Sat, 21 Aug 2021 16:05:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpRgo0MAbHm1; Sat, 21 Aug 2021 16:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9FAF40278;
	Sat, 21 Aug 2021 16:05:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B19C1BF418
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 16:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 773EA60597
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 16:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNd-78iqeR8V for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 16:05:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EEA460596
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 16:05:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r7so18871138wrs.0
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RMNLh6Vzc0+xmZq/dTqAWCPg8LaT+Mny5n1CeugEyYw=;
 b=mpo54uWCWXdALlQTvVDFTedC7sd7RX4DcaJxQwPeUtaR0EPq80ukv2PHW66mWa/m2r
 +SPGqR9En49dTFh7aoKDU1gQMugV/CTwjQbftlaDpt9XopgWSNaqE4BGabjlbpC+crGP
 sPSRpiZdQ3AlyBDeboqI1oKZb4k3MsX1D/7j5URneDA/yOjdrKoeZP8mIQMv8qrBDxR/
 NBcmQk/JsgLvcxCd8ALynroQgQM1n2LCNVxAjJTu1sF+UGBcUi4eV8NG2u3mjx3iekR0
 vFaJAk0L58WNGbAVLuKIOQJDfN0Mcb6Jatc+purNuqBPWNH33gXV7S5eCS0qeefHhNNZ
 s9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RMNLh6Vzc0+xmZq/dTqAWCPg8LaT+Mny5n1CeugEyYw=;
 b=mGTVRwoByC4NKharya5nHM5Hdw7I581etd0SBWc6tw5tEiwcgnh/b6RDISSQK2Jc9B
 Oidju4LvcS65og6uYmR1RnOy+cOYnvDuVtpegPzVxCO707reUNWHiEKb5OrGrLq5ehH4
 60QhJN58Z4urGXSsGLvt1o5/iK1rxgIEWux5j+qGPOQGrRIp1ngt5CX0X6289L/HHxKq
 a+pmPrzZ9Q2/ow01N80ZTDl/TzdPm8LPNBZOsQ88MBOo+Gxr9jl2QoGdxMVrNgQ5xnOB
 l9OG1PX/jX5VDX3EK7RPYjboaufKUq/k7O8NyuiRbWKrxBSTL1WKXuz9uA3CvmZC9ubt
 aggg==
X-Gm-Message-State: AOAM532+JY1Lu7HOmoA+9F6aoOe9WLC7OIv3De1zA6FTQL9+Up14Pbfn
 f8OKnrLNVDgL4PWLN/XBMKOX88QtDJfbjA==
X-Google-Smtp-Source: ABdhPJyMCmc/tPtyC7FabFOmgG6bAxRkfcQKIKqG2mK/ZWGgDgvQcuOBGTySEoQ1UfLTMr+NAMVAuw==
X-Received: by 2002:adf:ee0d:: with SMTP id y13mr4500269wrn.317.1629561931653; 
 Sat, 21 Aug 2021 09:05:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id x6sm1836708wrp.49.2021.08.21.09.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 09:05:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Aug 2021 18:05:09 +0200
Message-Id: <20210821160509.1514047-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix build on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure on riscv32:

../src/util/futex.h: In function 'sys_futex':
../src/util/futex.h:39:19: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
   39 |    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
      |                   ^~~~~~~~~
      |                   sys_futex

Fixes:
 - http://autobuild.buildroot.org/results/692700a5f967760a0b8cd358b1712f1d5a7b681e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-fix-build-on-32-bit-architectures-u.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch

diff --git a/package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch b/package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch
new file mode 100644
index 0000000000..b01db8a4b4
--- /dev/null
+++ b/package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch
@@ -0,0 +1,43 @@
+From e501b7c17ada9c694d3f8302622b78d733485b38 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 21 Aug 2021 17:55:33 +0200
+Subject: [PATCH] src/util/futex.h: fix build on 32-bit architectures using
+ 64-bit time_t
+
+Fix the following build failure on 32-bit architectures using 64-bit
+time_t (e.g. riscv32):
+
+../src/util/futex.h: In function 'sys_futex':
+../src/util/futex.h:39:19: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
+   39 |    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
+      |                   ^~~~~~~~~
+      |                   sys_futex
+
+Fixes:
+ - http://autobuild.buildroot.org/results/692700a5f967760a0b8cd358b1712f1d5a7b681e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12496]
+---
+ src/util/futex.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/util/futex.h b/src/util/futex.h
+index 43097f4cd5b..221eda9db0c 100644
+--- a/src/util/futex.h
++++ b/src/util/futex.h
+@@ -34,6 +34,10 @@
+ #include <sys/syscall.h>
+ #include <sys/time.h>
+ 
++#ifndef SYS_futex
++#define SYS_futex SYS_futex_time64
++#endif
++
+ static inline long sys_futex(void *addr1, int op, int val1, const struct timespec *timeout, void *addr2, int val3)
+ {
+    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
+-- 
+2.32.0
+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
