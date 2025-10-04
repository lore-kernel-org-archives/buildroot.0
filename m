Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79318CAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 12:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4214F60AB7;
	Sat,  4 Oct 2025 12:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYtyofp7jzfK; Sat,  4 Oct 2025 12:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6166760AB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6166760AB9;
	Sat,  4 Oct 2025 12:21:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98716118
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AFD28270B
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjUHzOStf9nD for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 12:21:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8AC818277E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC818277E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AC818277E
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:21:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83429A4C5D68;
 Sat,  4 Oct 2025 14:21:14 +0200 (CEST)
Received: from [192.168.1.144] (port=43328 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v51GE-000000002yn-0Z3c;
 Sat, 04 Oct 2025 12:21:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat,  4 Oct 2025 14:21:13 +0200
Message-ID: <20251004122113.2161276-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251004122113.2161276-1-bernd@kuhls.net>
References: <20251004122113.2161276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759580474;
 bh=JI/I1z+l81cLDLKjcxQrpTcnhZBjBdJzzRF9ksvLSrM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Q+wOuIVm24kk74kQrfG4jvhb4B3zWWqGX1CvYODRVptBwB20INS1C25S7K/yulWaK
 uzVtB/Td/GlGZoxcNDUHBear9UmfKSZ/nvPFO60GKEV3azfxer4pg31VGdOqjIyCF3
 h8YGkQyk5IjnGPnp6KQzaKvHK2rA1WFw+jBahdmxDLFXqGOqaQM+kXZkIeDouXHWGN
 LAngLNxUiG6QF57hU2N+ImuxpLnCiiN9RHip2U5WquCPOygwfonhSUgzSC6qGieUnn
 0ELsAD+F23z4AnU203Y/F0aJJFaFOHhayYbUkPQVCblYMnUyGfpR7+M8XPjhSQSbu8
 uegwXf7QYgR9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Q+wOuIVm
Subject: [Buildroot] [PATCH 3/3] package/gnupg2: bump to version 2.4.8
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

Release notes:
https://lists.gnupg.org/pipermail/gnupg-announce/2025q3/000496.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 6a34f2a1ce..01060f897b 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  2d510a1a7294f2f9ef3f2e280c93c3ad9b0cdb68  gnupg-2.4.7.tar.bz2
-sha256  7b24706e4da7e0e3b06ca068231027401f238102c41c909631349dcc3b85eb46  gnupg-2.4.7.tar.bz2
+sha1  c704085aa7cc131a67edd0b7c0c90e5c35ee4adb  gnupg-2.4.8.tar.bz2
+sha256  b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616  gnupg-2.4.8.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index d98829ca80..debf15ef63 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.7
+GNUPG2_VERSION = 2.4.8
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
