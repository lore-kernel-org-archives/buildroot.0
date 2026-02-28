Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041F9FEE4EE
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 19:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B917A41975;
	Sat, 28 Feb 2026 19:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4M_SNK9yz7i; Sat, 28 Feb 2026 19:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE76441978
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772308149;
	bh=+5+W+sSSFpd4B645tZ60on/XbxWLFevK1MlKQISgwEs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FNtA8491DtW46pRv4zOG9D7s6L9TVLL7v28oJe1njVGh4c+F7qc8V/tCU5OPjOnRG
	 /iovIlcBRy7W15YT/R492lbN/45N7rJfOPmYdqtEPp6oTi+W09wXT7DDJQrwtHMvty
	 b5c8a41W6D/IDw0HTx3tt59H65pW3X3Ls4LxdWTehKke1hzhsD3bb/0TVep48CA4xQ
	 Z8KR02rm0KmlJquNu/CqREfzuVMBEhlacoCIe3jHcoBMZBWHlC+CkyJCZ2y/Q+myK1
	 0YE9fgceHQIugmE3kEvp1YT2NiIlDRe2FNktakRcrJIanMlHECiCFE/P/f9zwjuU/0
	 U3xb4oBxBrWGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE76441978;
	Sat, 28 Feb 2026 19:49:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B29FB24E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97FD241978
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FVjlUiQbgbX for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 19:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 338AE41975
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 338AE41975
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 338AE41975
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:49:07 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vwQJE-007K53-DO; Sat, 28 Feb 2026 20:49:04 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id c96d60a7;
 Sat, 28 Feb 2026 19:49:03 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 28 Feb 2026 21:49:02 +0200
Message-ID: <20260228194903.1908686-1-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X6JfOqWhCZQ0NZoxoa2tm7rFHlnW0IfUL78YmwKh8Ik=; b=YdnD2Exr1J3EhaKWFpXdAyxC4l
 LrEujWkn1S4zIN2mVETjK5pgVcJU54lCPyuJhkOabYLH2NxRX3Z1pO2DZYFNbTN76fcn28D3NoCQd
 PFSWyOKaEBhkLGbvpcFxWeYWJeIpmZd7GWRDW572lIIEzfX3p7f8hmFmAtx/xEj+iUZOU4VDvHu31
 14W/Nbdr8onk+XbAzICPt/jD+Vuxddxz7JvfJJnc2XiDi6waHF5Do8bRr/M6xcA2ifgfQqSg/OtBZ
 woa7ayWFwi6+pXVlpR4lXtWbp5+422nl0pjIqTPy3Ki9L0L0JvkY5DMvtb4mu5hzz+Ek01MAtAdlV
 wugUy3LA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=YdnD2Exr
Subject: [Buildroot] [PATCH] package/wpewebkit: disable JIT for all MIPS CPUs
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
 package/wpewebkit/wpewebkit.mk | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 78c919e309..40708baa33 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -163,18 +163,16 @@ else
 WPEWEBKIT_CONF_OPTS += -DUSE_GBM=OFF
 endif
 
-# JIT is not supported for MIPS r6, but the WebKit build system does not
-# have a check for these processors. The same goes for ARMv5 and ARMv6.
-# Disable JIT forcibly here and use the CLoop interpreter instead.
+# JIT is not supported for MIPS, ARMv5, and ARMv6, but the WebKit build
+# system does not have a check for some of these target processors.
 #
+# Disable JIT forcibly here and use the CLoop interpreter instead.
 # Also, we have to disable the sampling profiler and WebAssembly, which
 # do NOT work with ENABLE_C_LOOP.
 #
-# Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
-#                https://bugs.webkit.org/show_bug.cgi?id=172765
-#                https://bugs.webkit.org/show_bug.cgi?id=265218
+# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=278559
 #
-ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_mips)$(BR2_mipsel),y)
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_JIT=OFF \
 	-DENABLE_C_LOOP=ON \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
