Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B144C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 11:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0520240506;
	Fri, 12 Jul 2024 11:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L42Nto5AzUME; Fri, 12 Jul 2024 11:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B0E54052D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B0E54052D;
	Fri, 12 Jul 2024 11:33:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 257681BF3F4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F0C740158
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6oluOF_M9Z1 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 11:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1533400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1533400E4
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1533400E4
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 11:33:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C5E11814B9; Fri, 12 Jul 2024 13:33:47 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 13:33:06 +0200
Message-Id: <20240712113306.829994-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1720784028; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=HmKfu6B0mD5OjaBvWTaX9Sr5ZpbVGMHVxf/xW6MqiMo=;
 b=hUQvpcWAl1cpj5c7YtR+gwOBppft1XfQL7A+y74W48A9+OpRP8H23WEeX1BEOqr6FlKhZ+
 tgntpL6vGejBoQqtEwMY4hFbMvQiDOUbm2FdsnWSEjACUVMOwYt04oJNuUq5wwg0JqNJJt
 w11p31lFNAv7bC3lqUjyt49PVYeVvEc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=hUQvpcWA
Subject: [Buildroot] [PATCH] package/boost: cleanup HOST_BOOST_FLAGS
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- fix alphabetical ordering
- align to 80 char width
- add comment explaining why options are enabled

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/boost/boost.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 9b1baec5bf..84c95ef993 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -13,12 +13,13 @@ BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = boost
 
 # keep host variant as minimal as possible
+# regex & system are needed by host-riscv-isa-sim
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
-	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
-	contract container coroutine date_time exception fiber filesystem graph \
+	--without-libraries=$(subst $(space),$(comma),atomic chrono container \
+	context contract coroutine date_time exception fiber filesystem graph \
 	graph_parallel iostreams json locale log math mpi nowide program_options \
-	python random serialization stacktrace test thread timer \
-	type_erasure url wave)
+	python random serialization stacktrace test thread timer type_erasure url \
+	wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
