Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F615C4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 06:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15AA160651;
	Sun, 19 Jul 2026 06:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-CmeHuMEIWG; Sun, 19 Jul 2026 06:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 145186064C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784443725;
	bh=K7CI0AsZjE87lkoOmm1fS0BPhY6HtWZAP8j2TNxCbVs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eGBtVHjRtCoSCt14+OL2+G95ZI671+B+uPjpkSydyaCeeT8DaP81bctlB5ZVymFbt
	 LoFq6fj9ppAMyVs4Ared079kbAmHHdKgskIZhyNOQaEeOpJIj01YfIE81jv7W64zpf
	 BQKRfQ15iZF/pA8K8VOn/00tA/3+0ZCM8i++DCt1ca+tgYmeuFDyDICgBJpPWtacNA
	 gZovxfUDR4uxXMETdJMZh+cjmX++/dB5BAnBprCxr8YHNaDJR69HmSb3ug1R0BIyYU
	 ViO3DFJ60YszDb3emWnd+nqYiZWIh2qm/qVU/t5hvropoBz39KjlInxD0rt32i7UZw
	 B/Q9Fq6ceUpaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 145186064C;
	Sun, 19 Jul 2026 06:48:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B99C51F6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 06:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB3E7400A0
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 06:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZBEuEaWqurE for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 06:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85C5B4005D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85C5B4005D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85C5B4005D
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 06:48:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b33e.dip0.t-ipconnect.de [84.161.179.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D583A4C341C;
 Sun, 19 Jul 2026 08:48:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58496)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wlLKK-000000000c4-0pIP;
 Sun, 19 Jul 2026 06:48:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sun, 19 Jul 2026 08:48:39 +0200
Message-ID: <20260719064839.3859632-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784443720;
 bh=qb8zxY4ZdUngP8MyDtG45Y+hJGeyxry27bE0l9sThDU=;
 h=From:To:Cc:Subject:Date:From;
 b=hu877Gt1xlyKQBIyH3XR/ray4y7PxqY7C6OSQY4+8hZjyt+yAUxzVWyRDy8VCiahR
 nkUsmsWFY6U7djcPArVCBqaXWIghb4TDKGxyxQfTLY55KNZTRLLJej1TAVyBzwWFzR
 VZMQ3HdC4unAEeFpD33YE5LBoY2X2z8H1e7dfQlloQxC+CJy7sIraOFmuUd86TDYXg
 hNRLmlmUD7YlP/zNlet2SXM5c5sxnWTRwL72/XJBpr8aszNiMVKRHHfZ+K1CNuLU8A
 EyUPhermI0NBrsvuaUfr9wIa+vF/ZH5KxiLU3y6QeeN5/3H2pNHgwmN+9V9hOBQK+C
 kFGqfmSH0fRkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hu877Gt1
Subject: [Buildroot] [PATCH 1/1] package/exim: disable valgrind when
 building with thumb1
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

src/valgrind.h contains inline asm not compatible with thumb1 so we
disable valgrind support for thumb1.

Fixes:
https://autobuild.buildroot.org/results/720bfa00ca926a398e901366e7ab20d08cfa9a81/

Inspired by buildroot commit 26013972ce568e55a121c21a55afce45bc0675e9.

The oldest build error of this kind dates back to 2022
https://autobuild.buildroot.net/results/85d/85d8e725a31bc1a3c41b2e388a17ff439274d437/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c9fcae45354c205dc58c8edf1826b8f69d8cdc4d

 package/exim/exim.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 60870474c4..2edece5dfa 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -104,6 +104,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 	$(call exim-config-add,EXTRALIBS,$(EXIM_EXTRALIBS))
 	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
+	$(EXIM_DISABLE_VALGRIND)
 endef
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE)),)
@@ -154,6 +155,13 @@ else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 EXIM_CFLAGS = -DNO_EXECINFO
 endif
 
+# src/valgrind.h contains inline asm not compatible with thumb1
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+define EXIM_DISABLE_VALGRIND
+	$(call exim-config-change,NVALGRIND,1)
+endef
+endif
+
 # We need the host version of macro_predef during the build, before
 # building it we need to prepare the makefile.
 define EXIM_BUILD_CMDS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
