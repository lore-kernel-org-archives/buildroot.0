Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DF0CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F404614E5;
	Fri,  3 Oct 2025 20:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVEk9VNgCXSa; Fri,  3 Oct 2025 20:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65C1E6150B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65C1E6150B;
	Fri,  3 Oct 2025 20:13:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A478118
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50DA0400E2
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJXXoCinb6Mg for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:13:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 372B840F0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 372B840F0C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 372B840F0C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:13:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42965A4C5BC6
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 22:13:02 +0200 (CEST)
Received: from [192.168.1.144] (port=46556 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4m9F-000000007Qb-3cxs
 for buildroot@buildroot.org; Fri, 03 Oct 2025 20:13:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 22:13:01 +0200
Message-ID: <20251003201301.2430282-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759522382;
 bh=+3xs6pcOEovidgFYBhp/bducmWE/lCJ7Ucfu/O1Qta0=;
 h=From:To:Subject:Date:From;
 b=iX/szPUd59hVS8O06n90QfJHs4U+42COce7jzNxCY4IkOq7psB80L9ByENTkQwB/H
 heLibOXFKrkLO4OBqOs6/p6se7OOXSN0y3G8GSPqaH5GwApPggV8TagmVzRVhCXgHp
 mXqQdWClWo9R8T61qvZcFa036rQB41RjOcUJLhqqj8/ikVGZUFSrjDZWUJ0LA6keWm
 5FLA/1CCgemHG7c/+/WbIbIzsE4o/BbY43840HCb7/VT/qE4RP7lLEXLZkVmwJxZkC
 RypatPfvWT+NyJ7Hp6SqukPUQQRRq8ENWpeoS6FBOwA6XLHteBnWvBwpASeu1Ggvsq
 V0RdRNurAUAHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=iX/szPUd
Subject: [Buildroot] [PATCH 1/1] package/libdisplay-info: bump version to
 0.3.0
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
https://lore.freedesktop.org/wayland-devel/47m6wyRq0q-sgX6zWXuZfexFdml2vTqsHKkdCBXBWywBql7gG9F9or9JsCm690MBXEmnnUEML0JnCIbUNma_a7tFKUPZ6bHPYa86b0gjYB0=@emersion.fr/

Added sha512 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdisplay-info/libdisplay-info.hash | 6 ++++--
 package/libdisplay-info/libdisplay-info.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libdisplay-info/libdisplay-info.hash b/package/libdisplay-info/libdisplay-info.hash
index cc93a0cf32..8c6f077679 100644
--- a/package/libdisplay-info/libdisplay-info.hash
+++ b/package/libdisplay-info/libdisplay-info.hash
@@ -1,4 +1,6 @@
-# From https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.2.0/downloads/libdisplay-info-0.2.0.tar.xz.sha256sum
-sha256  5a2f002a16f42dd3540c8846f80a90b8f4bdcd067a94b9d2087bc2feae974176  libdisplay-info-0.2.0.tar.xz
+# From https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.3.0/downloads/libdisplay-info-0.3.0.tar.xz.sha256sum
+sha256  6ae77cd937f9cf7d1321d35c116062c4911e8447010a6a713ac4286f7a9d5987  libdisplay-info-0.3.0.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/47m6wyRq0q-sgX6zWXuZfexFdml2vTqsHKkdCBXBWywBql7gG9F9or9JsCm690MBXEmnnUEML0JnCIbUNma_a7tFKUPZ6bHPYa86b0gjYB0=@emersion.fr/
+sha512  3266633d75ccd345dda5a8aad75f310e55a77654b48f17a247b35e18060b6db1047a69083cd286b43ec893125a36c4c43659af8f74a04da3278eea9fdd91efe9  libdisplay-info-0.3.0.tar.xz
 # Locally computed
 sha256  15b396244e58830c5614b9394f4deccfe684970cd507f299383ab57ad339eedd  LICENSE
diff --git a/package/libdisplay-info/libdisplay-info.mk b/package/libdisplay-info/libdisplay-info.mk
index b88463849e..ea5cf1af2d 100644
--- a/package/libdisplay-info/libdisplay-info.mk
+++ b/package/libdisplay-info/libdisplay-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDISPLAY_INFO_VERSION = 0.2.0
+LIBDISPLAY_INFO_VERSION = 0.3.0
 LIBDISPLAY_INFO_SOURCE = libdisplay-info-$(LIBDISPLAY_INFO_VERSION).tar.xz
 LIBDISPLAY_INFO_SITE = https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/$(LIBDISPLAY_INFO_VERSION)/downloads
 LIBDISPLAY_INFO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
