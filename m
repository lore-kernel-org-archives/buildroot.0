Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BF1CAC5BB
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 11:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EEA6608C3;
	Sat,  4 Oct 2025 11:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSF9E6u44EKk; Sat,  4 Oct 2025 11:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20C3060A83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20C3060A83;
	Sat,  4 Oct 2025 11:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D39C9909
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 11:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C22018274F
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 11:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-OpXh0cnTbs for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 11:21:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E367C802EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E367C802EE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E367C802EE
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 11:21:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06D07A4C5D47
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 13:21:45 +0200 (CEST)
Received: from [192.168.1.144] (port=46702 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v50Ke-0000000013O-2sEb
 for buildroot@buildroot.org; Sat, 04 Oct 2025 11:21:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 13:21:44 +0200
Message-ID: <20251004112144.939391-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759576905;
 bh=TbO1U7GLCfWE9eBwXj8Qsntb8erAwK0gU4mv01V7WNs=;
 h=From:To:Subject:Date:From;
 b=eEG1VquVvN8kthTta8HSaimseWwNBBbG+se2UJJyYTS1g0xNyVbFW9sD3lhuXC0xj
 PF/5WL7xzX4vrxqTHamcCa830BxSda1Tzoq98P9aJdpCGawplysXW9d1E/bH1M6wzU
 i0Iv2SMxnGdJBOoTVHrwF/cymB7Ivfb/T2QnK302SHrBesCHf2gijYXj/Agz3RNFao
 7Z8KiIjtlxmtL/13YsDTk+dL9p7c8iSqcB+xBA6AZB+nGdlY5xqzro7l385gSkfido
 eXXSzY/tr9dMcTlTj4R46VuGrVJn/vVzwshjUe0+nVfps6ls0My+KMV9vCjaL3n695
 Mv/0fQJEPFO7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=eEG1VquV
Subject: [Buildroot] [PATCH 1/1] package/libdecor: bump version to 0.2.3
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

Added optional support for gtk3 which was added upstream:
https://gitlab.freedesktop.org/libdecor/libdecor/-/commit/e87dcfdaf83f332fa83b43c804fcf93c151ff0f5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdecor/libdecor.hash | 2 +-
 package/libdecor/libdecor.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/libdecor/libdecor.hash b/package/libdecor/libdecor.hash
index 9e51e90593..7572663466 100644
--- a/package/libdecor/libdecor.hash
+++ b/package/libdecor/libdecor.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  82adece5baeb6194292b0d1a91b4b3d10da41115f352a5e6c5844b20b88a0512  libdecor-0.1.1.tar.gz
+sha256  21a471e3f48088d3fd8ecc5999c45258a32198782c0157482f7ebe82de42f79c  libdecor-0.2.3.tar.gz
 sha256  508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1  LICENSE
diff --git a/package/libdecor/libdecor.mk b/package/libdecor/libdecor.mk
index b965726292..d064c9e9ef 100644
--- a/package/libdecor/libdecor.mk
+++ b/package/libdecor/libdecor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDECOR_VERSION = 0.1.1
+LIBDECOR_VERSION = 0.2.3
 LIBDECOR_SITE = https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/$(LIBDECOR_VERSION)
 LIBDECOR_LICENSE = MIT
 LIBDECOR_LICENSE_FILES = LICENSE
@@ -19,4 +19,11 @@ else
 LIBDECOR_CONF_OPTS += -Ddbus=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+LIBDECOR_CONF_OPTS += -Dgtk=enabled
+LIBDECOR_DEPENDENCIES += libgtk3
+else
+LIBDECOR_CONF_OPTS += -Dgtk=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
