Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C70C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 08:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B48A40B3F;
	Sun, 11 Aug 2024 08:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6Nh39kKbSVO; Sun, 11 Aug 2024 08:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13C3840B5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13C3840B5F;
	Sun, 11 Aug 2024 08:44:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0351BF383
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 08:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 575A140B5F
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 08:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHHbHNeXPG_b for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 08:44:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EAA1440B3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAA1440B3F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAA1440B3F
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 08:44:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c78c.dip0.t-ipconnect.de [79.214.199.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E7BAA4C0E41
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 10:44:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32936)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sd4Bc-000000004mB-42MI
 for buildroot@buildroot.org; Sun, 11 Aug 2024 08:44:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Aug 2024 10:44:24 +0200
Message-Id: <20240811084424.754299-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1723365865;
 bh=a+O+lfJFkmqhW0vmtJEjsNyDX+4K0uRP1v6vaBQ67Wc=;
 h=From:To:Subject:Date:From;
 b=WcsQmoLG18hvIfBnirhRsOXZvzRbbJvorurw7WooJFYRKyM+9wJMKqMg+xlp9cRBh
 qzlyGDT3Bzzz4+VaKpvv++19lIqCK51sKtFqypqhY7y0Twrey3sa+THgggmeOM+A7V
 iBThBLKvNdhmYUTCPHB6C9D/+9zV0GfHak7gwbBAwtOHZ7W2rANx5FKP1qWKD8on2T
 OWVTSR3r7Xa1LjxKgQrD+HmU5Ikkct616ZvoG/ycBshrZmFKEimmu1LAClCXbrCQQ8
 thO3/ERraqgG3jSVVIMkPUY9uxOPXrTYZNqsmo+OqkO0apLitUseHWJ/69f90wQPh1
 SvbPm6ICuD0RQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=WcsQmoLG
Subject: [Buildroot] [PATCH 1/1] package/libdrm: link with libatomic
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Link with libatomic if available.

Fixes:
http://autobuild.buildroot.net/results/7ab/7ab583edb135b4b6948fb47e598d1f74e81fea7d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index ea956de15b..58d9c34617 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -26,6 +26,10 @@ LIBDRM_CFLAGS = $(TARGET_CFLAGS) -DAO_NO_SPARC_V9
 endif
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBDRM_LDFLAGS = $(TARGET_LDFLAGS) -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
 LIBDRM_CONF_OPTS += -Dintel=enabled
 LIBDRM_DEPENDENCIES += libpciaccess
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
