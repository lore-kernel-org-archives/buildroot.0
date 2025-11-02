Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33622CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 08:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 884A885287;
	Sun,  2 Nov 2025 08:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dl6hSwhacGy; Sun,  2 Nov 2025 08:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 063E685283
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 063E685283;
	Sun,  2 Nov 2025 08:28:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3893222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D589E85283
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEOY6_2b1TJe for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 08:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D84C985281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D84C985281
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D84C985281
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:28:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5FC45A4C488A
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 09:28:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46064)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFTS8-000000007Om-1dqj
 for buildroot@buildroot.org; Sun, 02 Nov 2025 08:28:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Nov 2025 09:28:43 +0100
Message-ID: <20251102082843.4443-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762072124;
 bh=FYNpGNSa2ZmAIMy1Y9+ro464PoReh09V3OfYoGrlugA=;
 h=From:To:Subject:Date:From;
 b=rVUt3pvPR1UuHMHZf6OkC/vlwMlXcOOh4dY0Bka120snX1TaQUGY0/Rs6tQ5Iajsf
 4eyI0ijkRQA3OfcweR5xboLAraAY1w83hLWK+s7Gq5+9SyAjtsPQgMFJiRfiucr88x
 9EUma0dbv/7fgNE3ZwyVR1mBXU0oWMjLqKU988GQAUJISXlhSIUKwIIrguO7QL7npg
 XWvkRpp1MDY0ial6W20DK+dmhLRyBGkZWzEnbpfbqAyLLMHwWjNVZVPag5xewL30GS
 prfYpPiGNFP6IcoSC7/y4NOL8DcBvC6fCnqSr0hGzC7fmx5cFpzqBYA16cMhSPbrJK
 k3NoX59wlV/6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=rVUt3pvP
Subject: [Buildroot] [PATCH 1/1] package/kodi-peripheral-joystick: bump
 version to 21.1.23-Omega
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
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 7249bc6136..3be4eef39b 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  deb7fb41408ff06989b8fa2db7bd5bea210756a1f2f8a9037cc12f6518fddd94  kodi-peripheral-joystick-21.1.22-Omega.tar.gz
+sha256  7392c30a9e49b0cd219cdca14f5b20ffce9f4a52c349c2cdf37cb603dd21f516  kodi-peripheral-joystick-21.1.23-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index c6af2280f2..698b918266 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.22-Omega
+KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.23-Omega
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
