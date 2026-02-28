Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B029FEE4F8
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 19:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B66D041974;
	Sat, 28 Feb 2026 19:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPwbXF4-b24j; Sat, 28 Feb 2026 19:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 182E34196A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772307855;
	bh=qYAKP6VZkhH8O+PUPoRMrIxhL6014OCjfy2lD+36ivM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sTvVLpAIAg8xRJIFIr8S7uMS4foNbcxLfdOhgOYIyxSAume9qURIeQANc0SsjGmqm
	 qA7QdAzCXnLdnbYFvcqRU1qsW6dpsK42RDCYD4ZBhpUPEtp6XkE4SOw+UzDFxuRyD9
	 f9jMYPMApUaJ+m+bvKq+FUa5RLxFAPrx73hnl3VXvPSTugtnUABc2B6zy/2JzzV5xm
	 PxhLlrrOUhsTepprq6c27DDiW9ItRbxkR16wHnvA7Np2bFMQE5LtySLK+9i/cTF+/l
	 sQ+8B+lYNNMvgboflv/V3nFGgETG9uXpqGus4MV5aC+FN80n66+dXEc3iJrcYpEzoX
	 vGClRSwOW4/HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 182E34196A;
	Sat, 28 Feb 2026 19:44:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A267924E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 881A483E29
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsikkqptcgPW for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 19:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D099183E28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D099183E28
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D099183E28
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:44:10 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vwQER-007K18-LF; Sat, 28 Feb 2026 20:44:07 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id ec97eb60;
 Sat, 28 Feb 2026 19:44:06 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 28 Feb 2026 21:44:04 +0200
Message-ID: <20260228194406.1906845-1-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3HhYCTdtFHmQPDrElz4ojuykGZeQ7A4eHOycXhoN2qU=; b=g2BDajc6LpJjqyt/b38NPluRPM
 dj0/DoRM62WcUVTpcSFiAInPCUfGrRHdAvp+a22EnAa0arVooKPcICJPSszczq532xzGUbdMtG/W4
 8/pK8tPkejW5wC7RuyvjO/Nx+o/YmIRgCdIuKtkDTc2KXnOCqU3xpQjIPqqd+3W5W+2CiTGckAenH
 V0d07YEoAFXHPE0kU8BVCUfuIgLoLpDLzUVWhu0km3o8zeyBbDZXNzIETIBlEQWDApI1JAIZWsUoc
 3DDfLmT4C9dcUxp5ogZfItXxJMPtajQOj+MlQ57MMT9qgxcB8FUFKhv6O1n4N9135WdUpj/m59F0w
 d+u6o4tQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=g2BDajc6
Subject: [Buildroot] [PATCH] package/webkitgtk: disable JIT for all MIPS CPUs
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

Change the mips32r6 into a blanket BR2_mips[el] check to disable the
JSC JIT. Upstream removed JIT support for all MIPS processors in
January 2024 [0], and the change trickled down to stable releases
starting on version 2.44.0 [1].

While at it, change the upstream bug links to point to a more
appropriate bug report.

[0] https://commits.webkit.org/272866@main
[1] https://lists.webkit.org/archives/list/webkit-wpe@lists.webkit.org/thread/JM7GLPPKGAB6DIQ2YDHPEIWNOYSUHBC7/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index d9aa48f024..161807bc5a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -173,18 +173,16 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
 endif
 
-# JIT is not supported for MIPS r6, but the WebKit build system does not
-# have a check for these processors. The same goes for ARMv5 and ARMv6.
+# JIT is not supported for MIPS, ARMv5, and ARMv6, but the WebKit build
+# system does not have a check for some of these target processors.
+#
 # Disable JIT forcibly here and use the CLoop interpreter instead.
+# Also, we have to disable the sampling profiler and WebAssembly, which
+# do NOT work with ENABLE_C_LOOP.
 #
-# Also, we have to disable the sampling profiler and webassembly,
-# which does NOT work with ENABLE_C_LOOP.
+# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=278559
 #
-# Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
-#                https://bugs.webkit.org/show_bug.cgi?id=172765
-#                https://bugs.webkit.org/show_bug.cgi?id=265218
-#
-ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_mips)$(BR2_mipsel),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON \
 	-DENABLE_SAMPLING_PROFILER=OFF \
 	-DENABLE_WEBASSEMBLY=OFF
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
