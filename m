Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5525CFD34E
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 19:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FCD460EED;
	Mon, 24 Nov 2025 19:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHYmnBe1_hRC; Mon, 24 Nov 2025 19:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B05260DD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B05260DD1;
	Mon, 24 Nov 2025 19:00:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18D2E34E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13084405C3
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBtbiHaZ-uKi for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 19:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52C2D403C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52C2D403C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52C2D403C3
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:00:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b1a8.dip0.t-ipconnect.de [84.161.177.168])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63136A4C7634
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:00:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44276)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vNbnL-000000002v9-1CiG
 for buildroot@buildroot.org; Mon, 24 Nov 2025 19:00:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 20:00:14 +0100
Message-ID: <20251124190015.2058689-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764010815;
 bh=SI2Nzg3pB9WZenxCybSdgxeP9DTWAlxKCPNBq4Adc9w=;
 h=From:To:Subject:Date:From;
 b=zuFi4F0WycPAuX9HF8P/btK2Q+UXJAw+AqFZs5O2hzuhP4LcQOiA6o2D7mDr15Ndg
 janoRofNsYAw/2/BqlvpgZdV2Zv1dmzdVBzFxCHn6lTMan5gZAobMSNQdC9VzH72RT
 3YZr+GMP743i2DBy8wQEO/QLJtnjPmY8q+ENPd7FOULtwA/uG8ek2v7L6n4JqxXShd
 yGbGIDeIfDvffETJi61z+xOdh4ZRJh5SPiT24fn8PbieCxn9TSZQKqKGJUk5KphiCh
 TrEGbBHKJHLHNBG1+tmVrQQYrI7GAcYUV3P9opWt/fqn/OUO8Cph3GXaFPyEhmTQzv
 luoMzu2kaUQCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=zuFi4F0W
Subject: [Buildroot] [PATCH 1/1] boot/syslinux: add -std=gnu17 only for gcc
 >= 8
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

Buildroot commit f5101638b9f917dc4c569828ff3fee0c486ba8f8 unconditionally
added -std=gnu17 breaking the build with older gcc versions:
https://lists.buildroot.org/pipermail/buildroot/2025-August/784453.html

Reported-by: "Thomas Petazzoni <thomas.petazzoni@bootlin.com>"
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 boot/syslinux/syslinux.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index b8f022b189..f938634c35 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -56,6 +56,9 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # syslinux build system has no convenient way to pass CFLAGS,
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
 # Install in a temporary location that eases final install into
 # images/ (see corresponding command, below).
 # Repeat the target, otherwise syslinux will try to build everything
@@ -65,7 +68,7 @@ define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		ASCIIDOC_OK=-1 \
 		A2X_XML_OK=-1 \
-		CC="$(TARGET_CC) -std=gnu17" \
+		CC="$(TARGET_CC) $(if $(BR2_TOOLCHAIN_GCC_AT_LEAST_8),-std=gnu17)" \
 		LD="$(TARGET_LD)" \
 		OBJCOPY="$(TARGET_OBJCOPY)" \
 		AS="$(TARGET_AS)" \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
