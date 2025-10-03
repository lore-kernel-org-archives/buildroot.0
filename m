Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548D9CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1151D40BE0;
	Fri,  3 Oct 2025 20:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vBT_xhp6est; Fri,  3 Oct 2025 20:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DEF840CB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DEF840CB3;
	Fri,  3 Oct 2025 20:11:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5023226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 969F940E91
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FA4wpWfrDH71 for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49A1E400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49A1E400E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49A1E400E2
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:11:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7AE7EA4C5BC6;
 Fri,  3 Oct 2025 22:11:32 +0200 (CEST)
Received: from [192.168.1.144] (port=44132 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4m7n-0000000075r-3B6c;
 Fri, 03 Oct 2025 20:11:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Oct 2025 22:11:31 +0200
Message-ID: <20251003201131.2430122-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759522292;
 bh=fNMsvQvQTbcNvnRAvgaJDPRsSYN+zbSHGRZ3kQRZFbM=;
 h=From:To:Cc:Subject:Date:From;
 b=OVCMmbJBXjpz+kN/39fzMkcz/AD9B0CpG4zwyySAoNfQDAlE3GkAzjfg8/h23ayXB
 ENzPF1NizGXQfcAjBlQjDPxyg8gXe8X52QOmKIYVhbwS2fZ8/bZSFyjNHkIBMU1HQ+
 peoulisz7t5+Br1/QcTQA75eVbxAG5/xqDweNnA3PPsDfl1616XVx1P39aTGAcMPOY
 D5XbHfEwmyJ/ROdemFH40UnXjjrDmFSvJPft5qI0fYazMQy7D7gPPyVmq7aLJ/xiM/
 UDNINRhewPGkQsffFRx6wz1ibO4JjO5J9vtYEnS56ZlWuX9aOZUoukbH6R+PB/KJiO
 9Xv+elZXrXMtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=OVCMmbJB
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to 25.9.23
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
https://github.com/google/flatbuffers/releases/tag/v25.9.23

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/flatbuffers/flatbuffers.hash | 2 +-
 package/flatbuffers/flatbuffers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index e7174e326e..81fafc878e 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b9c2df49707c57a48fc0923d52b8c73beb72d675f9d44b2211e4569be40a7421  flatbuffers-25.2.10.tar.gz
+sha256  9102253214dea6ae10c2ac966ea1ed2155d22202390b532d1dea64935c518ada  flatbuffers-25.9.23.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index d49d01161d..61e6af0768 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 25.2.10
+FLATBUFFERS_VERSION = 25.9.23
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
