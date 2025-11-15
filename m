Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A66CEBF86
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 21:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D2D4081F;
	Sat, 15 Nov 2025 21:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6ZcAafofcI3; Sat, 15 Nov 2025 21:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A488140820
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A488140820;
	Sat, 15 Nov 2025 21:06:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5777AD5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3616440568
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcgDZdTVBd-H for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 21:06:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86180403FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86180403FF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86180403FF
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:06:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A18FA4C6AA3
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 22:06:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48836)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKNTt-000000006CQ-33ph
 for buildroot@buildroot.org; Sat, 15 Nov 2025 21:06:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 22:06:49 +0100
Message-ID: <20251115210649.505346-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763240810;
 bh=DV+rpMRdXLC4YCjoUfW+tKMZ/kzteaM1cAQ0KyLqOPw=;
 h=From:To:Subject:Date:From;
 b=QPtUtGBtWb/4W4shFA9ieZK7cYna/dybHq7HeAefTvrIGe1DqMLRcuQIMZvO9+zdR
 uj/hgImzLGqvagdhCf54YpdvJzNhLxDDYPhsrOJfI9hWZ/OC7xFVjQCUmxeso8NdT9
 8+dCwvTcGo2qVaZJ1hICtr6VG6VekCMkD4+h7XAASdsfrpNn5HLwmyR43zwhzThN0E
 HRmzUYgbmpxFAW+oE8W1mQM3LH/8nnwDfLqIgbQkvsx001tu4bukfyNFeOQP1J0kpr
 xKtnhPR4qAczEgIMbvqUquegAjhf1hPPvCH3PMUNvRSHCH6cOhAW6DaX/0lL5y5c+F
 cjgQzFFIrWPAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=QPtUtGBt
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index abe1ac11d9..9dc5dd8b6a 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44765f50b16325721e4e6938aa32bdd368d516c94e6985ea3ca1ef6c6bfe75c6  tvheadend-5fd594910abbff1091e11b606124905a1cc92bb6.tar.gz
+sha256  8ad851b39afaa1bab121c00a1fcaff641e3640d2c4743a1ca7800d2f403fcf52  tvheadend-0b23983f5dafff006ee83908915193c49deacca5.tar.gz
 sha256  0420f5d2e0df002e31320d9f58fc5454cbb8f53fa0ab1fc85afb8821c6b103e3  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index dd3e20c2be..7d83c31e5f 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 5fd594910abbff1091e11b606124905a1cc92bb6
+TVHEADEND_VERSION = 0b23983f5dafff006ee83908915193c49deacca5
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
