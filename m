Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0797010854AA
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 23:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3E4822E7;
	Sat, 14 Mar 2026 23:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WTOJ_4XM8CZ; Sat, 14 Mar 2026 23:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 336C781E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773529523;
	bh=dKFLdszrvsnqTlYtTL4gofXnaaLe61uH3TQb7tI/3ks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=JwNv1zNAdhCrSS9BjvGHbgZIDRysfQFDyLYduoAgPCmOLAjpZCG082URbqvmztx1Z
	 q8Yzmci1qG8LU1R/rhBqR7KuGD9/KlSjnktYllQSf1W6Y7tfmiWqPF/MBcd7bOyJVn
	 AALUXWDLOMrsPVhMBYmmvLfx42sfk4NYbvRj6UobtFsqM921Vkw27ERAw0THuAxGpQ
	 N/Uh4Ilm16VY/yV0PC6qI5IIIQEwcyidlPoqytdpWrcYO5NZnnUGIZZ4zKDY34WLD7
	 rUD2ykNnYhwaZuqrd+Hdx6eEBM2Ahbrzb+5DDHznrQ6LfirGOq0Tn6nsojZ8NDPL10
	 cHplX2HcAgWCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 336C781E7B;
	Sat, 14 Mar 2026 23:05:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4307D1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 347BE4055D
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZjCNsWfCj6ln for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 23:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 526B040547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 526B040547
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 526B040547
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:05:21 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-823c56765fdso1894274b3a.1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 16:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773529520; x=1774134320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b5KXXlmNm/rT+nIrVmWz3oaOCIH09Qoc43fC25AkdpA=;
 b=ZcErfAgPCf30NXTZYR5gvh2gHPW7st6YSkuBiW2DCYx0S8QKWhTOcWKROrfeYIIexZ
 TGUZ0i+nVPB/lnBsRInBBwFyJJ6fMxTiKlhuwgsMWIra8WMkGzkekF8L14IwFDWi5lfT
 xa7WShJPWGChEGN65MljNiz7Z7xMhRNu95XPnOsJvlX5naNctiGyBizjEQ5hQ7yx/8IC
 Dau2zebq44wkhLhth9gKpdG2/EiwQBRjtLN2aVKA+g3mEkTNxhdMSx/ZCod2SJTqbUVR
 D7ORrFYTkqyNGgFOGGbdS6/8F548ToJ0OXqT037fnIFa34bpG3Rn/mG6wqneE8dqbk+5
 UULQ==
X-Gm-Message-State: AOJu0YwAHpvyYuNPyOZpcAbLgziqbyWDittef+agE0wwpQvyb1L/0RHa
 d1szMazj494Nl5/yymrK3WaufJz/hHnnR7PL5EEICGbYmLs1yvYzVfCuL5dmz3eWNiWE8CKuXhD
 3ZywT4y9rsg==
X-Gm-Gg: ATEYQzzjGaFlt4fTTgW+3ky/tpcad6LDJJuk2rHVh4FgctATEsyXZpoqqa4L7DGqK1R
 tOeLv1P8E8kdiIW28pzQfvyYWMJ6Q+9XF1QQDT4FMTlnOAHGR6NdSvZLyuB5Np3Gj41/5Rh7qMX
 VWm7f5H6uDgpVpUgMsCrCAWkvIxqsUVyewPOJMaDFVKghTQ2gSeUOSkgCSevb3VlYmv7YqWdA6S
 SQ4VS6gFdb36dl6el+/JuIZFTsPyr3f/FZ3iVUo/vh88EogcQUGQtJDUL/dm1zeBy7YwrqrlC0Q
 kgJppd4PLKHoLNO+0Qg8QmXAFssJAH5fFSn4FEEylDw8JrBwwIUSR3O+aVRcY6lmfNtKt8YmFx0
 n39Yqs5AtnQm93Ww66t9nFf+35Q4XGs/8d31a9lS42eDDlAJlX2vwhOujk0Ft4EYrYluOa//GRQ
 RGT+2Xjvoq3DF/+Vy7+7TsWB39gc9PfZ1PzBUwi3SsTlZL2zHb
X-Received: by 2002:a05:6a00:754f:b0:81a:b602:daf6 with SMTP id
 d2e1a72fcca58-82a19910d05mr5311597b3a.48.1773529520303; 
 Sat, 14 Mar 2026 16:05:20 -0700 (PDT)
Received: from localhost.localdomain ([185.216.231.84])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a0738422esm9575472b3a.55.2026.03.14.16.05.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Mar 2026 16:05:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 16:05:17 -0700
Message-ID: <20260314230517.4160-1-christian@aperture.us>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1773529520; x=1774134320; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b5KXXlmNm/rT+nIrVmWz3oaOCIH09Qoc43fC25AkdpA=;
 b=TU69Dh4tcW6LlpJ6SWa2F7E5Qg+TDAImeTfZcmgXZbigSJQr74/qytY7rmVCrA+c3R
 YrZZ7ZLttFdqi8SueY270ZCQJjPEKv0tciNaB6fbebUy56yaZ63cH8RwIntcvZBI15Hj
 98KeUDAhXM9jxC70mU8AgRalLWxQujPgUrhNQePUbDVVxVfJO2op3pRDgtgTgQ8o0Bwi
 kc1MzA++LVlFfrInKPO9QnL7GCbjKImvaNciFSRnn/yEhWw08NeIFZ/T+j+8G+uRzwuK
 CQahrOtVcnh36ETVA6/TA0obgO2fgaU5LF4osCByqgYQUDtIECBB6ztEw+9VJz9oNe4/
 V6UA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=TU69Dh4t
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8812au-aircrack-ng: fix build
 with Linux 6.19
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix build failure with Linux 6.19.

Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1254

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 .../0004-fix-build-for-kernel-6.19.patch      | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch

diff --git a/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch b/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
new file mode 100644
index 0000000000..64101a5709
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
@@ -0,0 +1,37 @@
+From f17facc866cb36bc889f873beb36e7991fa5e71c Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@aperture.us>
+Date: Sat, 14 Mar 2026 14:53:48 -0700
+Subject: [PATCH] Fix build for kernel 6.19
+
+With kernel 6.19 and CONFIG_X86_KERNEL_IBT or CONFIG_KLP_BUILD enabled,
+objtool runs on the linked module object (delayed objtool via --link).
+The module Makefile passes --strip-all to ld -r, which strips local
+function symbols. Without these symbols, objtool cannot determine
+function boundaries and reports errors like:
+
+  88XXau.o: warning: objtool: rtw_mp_cmd+0xf8: unannotated intra-function call
+
+Replace --strip-all with --strip-debug to preserve function symbols
+while still stripping debug information, allowing objtool to properly
+validate the linked module object.
+
+Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1254
+Signed-off-by: Christian Stewart <christian@aperture.us>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -22,7 +22,7 @@
+
+ ccflags-y += -I$(src)/include -I$(srctree)/$(src)/include
+ ccflags-y += -I$(src)/hal/phydm -I$(srctree)/$(src)/hal/phydm
+-ldflags-y += --strip-all -O3
++ldflags-y += --strip-debug -O3
+
+ ########################## WIFI IC ############################
+ CONFIG_RTL8812A = y
+--
+2.50.1 (Apple Git-155)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
