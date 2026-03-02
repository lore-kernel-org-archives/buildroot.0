Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAE4E9B34B
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 09:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DD0D418C6;
	Mon,  2 Mar 2026 09:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPRxS0cxZoa8; Mon,  2 Mar 2026 09:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E0F418BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772445518;
	bh=bSajD4P09aGjz/0RcxVY0oVMn2fcD3/eKodpeqGKe3Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=inODO6bCF7UG9NTtMNYSfuyr0oJDKCvtuhho0JmGpiOjsY4dZqoXKLB0a4KWga7mL
	 MeD6L8V4ZlS7Nn/0CZKO7RTRs09QvvoLZyEDCGwuhcHNQEvji3EuuSdcJORjF52s1Z
	 YL5ZPRWj0cYqenAgYb6SzVRAU//viHO1+ACaq+t5t9d1wVs2ZD9oDTW+PAFvsmsbNL
	 7VFEXdjEwrfVal9tigJ9CPAX4t3aDTwP0TK4nasfuYJqBUlDiYgC4NHoJwsOq4qxgZ
	 Hpjsz2tVmwDBD87F1JggM2Hep+l/6+ZJkFNk14tyvSNkxPSQapSqFR2m4WXY8bnayG
	 1LlJGINOzyj5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18E0F418BE;
	Mon,  2 Mar 2026 09:58:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55CF325B
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BBE740F22
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IA16Qe6oSKm for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 09:58:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F253440EFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F253440EFE
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F253440EFE
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:58:31 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vx02m-007pna-Sv; Mon, 02 Mar 2026 10:58:29 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 05c3ca10;
 Mon, 2 Mar 2026 09:58:27 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon,  2 Mar 2026 11:58:26 +0200
Message-ID: <20260302095827.3021239-1-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gEMnKCeEUO50ON8/m62U3lh31kktM1B4p15zzqKiSHU=; b=KBO1JLp3oDjR4SNj+1atbGA37n
 RLsAd6zcsowr7NZ1FuiqzeXOHqexmIJJ1+ja21mTS2m5jI2uxBzLKAaEY41A420GpO1UsVfC5PBWK
 FrjJbQ97qIpr2hk/jvJqiB4oeL2UjHztTCwzPiXf+H91Pu2IOl6+MjwM/8ZKqY5a3SeGBMBH6fYUj
 CnMdVIfP5aP4t0rAd8MlFjcmSHG7sxZBXTTpfLGF/3DYpRQeId87Gd1hdLD7Yo7AwaUJLjfTT5YDw
 BTDOhV8p62z559MQKIjm53xkifU4QsiaugArg+QOzFa51TORxKpdPCJgtF24MfOUwe1umnPatogW2
 gnbPPTcg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=KBO1JLp3
Subject: [Buildroot] [PATCH] package/webkitgtk: use Skia on little-endian
 targets
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

WebKitGTK has included a bundled copy of Skia since version 2.46.0, and
it has been the default for little-endian targets. Moreover, upstream
development focus is on the Skia renderer and Cairo will be eventually
abandoned. In preparation for that, introduce a switch to enable Skia
usage in little-endian targets.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in    |  2 ++
 package/webkitgtk/webkitgtk.mk | 11 ++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 3a4c3ed792..eadc5663b3 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -41,6 +41,8 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
+	select BR2_PACKAGE_FONTCONFIG if BR2_ENDIAN = "LITTLE" # libgtk3, libgtk4
+	select BR2_PACKAGE_FREETYPE if BR2_ENDIAN = "LITTLE" # libgtk3, libgtk4
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_JPEG
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 26c70ae6c8..48a934f5a8 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -33,10 +33,19 @@ WEBKITGTK_CONF_OPTS = \
 	-DPORT=GTK \
 	-DUSE_AVIF=OFF \
 	-DUSE_LIBHYPHEN=OFF \
-	-DUSE_SKIA=OFF \
 	-DUSE_SYSTEM_SYSPROF_CAPTURE=OFF \
 	-DUSE_WOFF2=ON
 
+# WebKitGTK uses a bundled copy of Skia since 2.46.0 for
+# little-endian targets, and Cairo for big-endian ones.
+# Using Skia needs freetype+fontconfig as dependencies,
+# but those are already pulled in by libgtk{3,4}
+ifeq ($(BR2_ENDIAN),"BIG")
+WEBKITGTK_CONF_OPTS += -DUSE_SKIA=OFF
+else
+WEBKITGTK_CONF_OPTS += -DUSE_SKIA=ON
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK4),y)
 WEBKITGTK_CONF_OPTS += -DUSE_GTK4=ON
 WEBKITGTK_DEPENDENCIES += libgtk4
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
