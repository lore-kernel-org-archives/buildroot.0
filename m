Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EDDE8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 08:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 940D2406F6;
	Mon, 29 Dec 2025 08:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcLl4k4Cp4uF; Mon, 29 Dec 2025 08:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E386407A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766996298;
	bh=x9a9D7KSvLPL6IwU1T7DM8D2IFE1MY5cmQIt4BB8suo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tqldo9F0CCPVJcNcQIuNcGiYEz1xm5J+7xRBbLVyNR7ARA68jQjMP1pi7f28xWWhH
	 gl5WiBECIdhshsWY/INm8r7HjIKKAjAWhcbstw3T/9tO3zyFO44S25LlY9is+/DMct
	 +dds0ynnjAGgF1caU0SRkRM/JgIPnnLlktsktlvbkYZJ8tZWnppC5IUz7mHhJ9KQU9
	 VTlc/ZVHoNkpwf7PT7tklN83UW1Ltts2mFJYzh9wh4ACaoFl4WveU3dm6anqouxrYh
	 C7b3WvJsBKt1Q3JMhQhQBrqjZTw/gFlP3kShjGZUpLd5/m2MSq/cUUAcpsrlnDc/5y
	 W4K+TNlvZT3SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E386407A4;
	Mon, 29 Dec 2025 08:18:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61D311E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53EF9407A6
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKYfs9OdTJ3S for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 08:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45B6B40785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B6B40785
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45B6B40785
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:18:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60A62A4C10E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:18:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33460)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1va8SD-00000000664-3KHW
 for buildroot@buildroot.org; Mon, 29 Dec 2025 08:18:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 09:18:13 +0100
Message-ID: <20251229081813.633547-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766996294;
 bh=dq5fmKhEHYjTbti0/nskyVlqWlRatP+OOEU4aaB2BKk=;
 h=From:To:Subject:Date:From;
 b=Zjk/Br2T4mHkqggqncijNC21kSMlDxFwobvw5WyMaJ3HFsTKHr8p7y51a9Is/C9KY
 txjtBA7jBYuN7Av5lgHtF5adW7NRzfeqVaG+e8NM3DtsiUFecFSHbSvLPnjeES9Okp
 OLqxIaOoQPF+qAuawqmwhq1VuWw3kRUWe8SV0CLKHI4jXGvYhaI51JEFiAD1RV43xJ
 gpfDkwgpMPtxW16maSCbtZ41d0KKOkmgjkkdsXvZ2b3qpC7msqCgaxviBDbyWH6KSY
 YZFvwUVcBGWY8D0v0nYsi4xw6GWQoMS+rNJFpId8WwOpUzbjWvGLTI9x7FSdUnEhlT
 4vYFog0dpLV5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Zjk/Br2T
Subject: [Buildroot] [PATCH 1/1] package/libcdio: bump version to 2.3.0
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

Release notes: https://github.com/libcdio/libcdio/releases/tag/2.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcdio/libcdio.hash | 4 ++--
 package/libcdio/libcdio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index 52d923a3d0..4c15b53e38 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,5 +1,5 @@
-# Locally calculated after checking signature
-sha256  6f8fbdf4d189cf63f2a7a1549c516cd720c7b222c7aaadbc924a26e745a48539  libcdio-2.2.0.tar.bz2
+# From https://github.com/libcdio/libcdio/releases/tag/2.3.0
+sha256  53e83d284667535a767fd2d31edad1a6701591960459df373a10f1f21e80a7ed  libcdio-2.3.0.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index d4b277a15b..d5238e3aca 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 2.2.0
+LIBCDIO_VERSION = 2.3.0
 LIBCDIO_SOURCE = libcdio-$(LIBCDIO_VERSION).tar.bz2
 LIBCDIO_SITE = https://github.com/libcdio/libcdio/releases/download/$(LIBCDIO_VERSION)
 LIBCDIO_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
