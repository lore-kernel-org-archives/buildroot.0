Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31745C5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E70C606C6;
	Sun, 25 Aug 2024 13:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Swn3png_BZf8; Sun, 25 Aug 2024 13:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF8EF605D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF8EF605D4;
	Sun, 25 Aug 2024 13:42:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99DAC1BF2CC
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88DEC605D4
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWdzPyDvfXQm for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:42:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A86760596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A86760596
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A86760596
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:42:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cce6.dip0.t-ipconnect.de [79.214.204.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D721FA4C05B6
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 15:42:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36108)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1siDVk-000000004FS-3TPv
 for buildroot@buildroot.org; Sun, 25 Aug 2024 13:42:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 15:42:29 +0200
Message-Id: <20240825134229.1323250-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724593349;
 bh=WGKlYVA9Nl1dbgjgBj5qPL7C8o+vBY/dA8gByx2ZZhY=;
 h=From:To:Subject:Date:From;
 b=h2sk0jrrPZ8Qdsq8WBgXNwApzrkXakWyWKz1xaHLwTglAm2aXaa8lhoMuLttg+T/2
 NBvcMKDdeBs04/mIzvSSVJOm2ik7idDyt7BNOwHF3e8l5zvNB3wr7CS/h2+MRhyydr
 JtLxx59Ywrbtg6ZkGXJkoshw/45yXgp8OSNVycXQ4aa/P3QaLf+1GtRinqSwIirKeW
 ZS1pxX8mtiUIf6AKa5TMiVMkkJo9W7t8qLKwglZxOsE0o6dKl/Z9epnML2DWQN7/9X
 OCZqY6FScSDVYy/Nt3oDF7GhAlldlWMccfzStsAABr3kJIivl9BI1y1EYbaBFPokOH
 GddRSQU997p6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=h2sk0jrr
Subject: [Buildroot] [PATCH/next 1/1] package/xmrig: bump version to 6.22.0
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

Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index d7fdbe0d0b..b7d201a1db 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5d76fb19190956c564b405119315bc93db4ed8062b251d5e96bed70c5fa8033c  xmrig-6.21.3.tar.gz
+sha256  8a5b047cbbb67e508fd5c2cfb75e138d36b1eb19aaadcbe59a5034ca9af0ebb0  xmrig-6.22.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index d01b001817..b83ed7dae8 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.21.3
+XMRIG_VERSION = 6.22.0
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
