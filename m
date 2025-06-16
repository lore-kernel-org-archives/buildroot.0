Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C66C71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 042F6808BA;
	Mon, 16 Jun 2025 19:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TBn5rVmQqaT; Mon, 16 Jun 2025 19:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43C2D810AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43C2D810AA;
	Mon, 16 Jun 2025 19:14:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B61AD79
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5160360899
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkzpptJRmwKl for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 777FE605A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 777FE605A7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 777FE605A7
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:14:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4AD80A4C059A
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:14:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51548)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRFHf-000000004uI-2x35
 for buildroot@buildroot.org; Mon, 16 Jun 2025 19:14:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 16 Jun 2025 21:14:19 +0200
Message-Id: <20250616191419.3479584-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750101260;
 bh=Xup02Aj479S5iw4kmCQTurG73caULXkYz9XXmnNVlH4=;
 h=From:To:Subject:Date:From;
 b=GYzOHXKrKSOvSjKyqNob3A25vq5kUNsQkv8+insAfERdf0F5VvrAtBp4CLnpGb7In
 lV4fYY3YLlvbCdW0xlWG2QCrHSk3RRrKnvsZMuTMIal8tKHm61lVHpu+T3w5NxflxI
 OIRb3A+60TCQWczBDbxG6Uz3ifHA/ppPmNkY5vHLVioiVpvDFErNIr8TaVGfC4IOuO
 FFz6fyxXEuou80X6tVUYAF/lsYcOKUPIvgEJ8xr3kpqNmK0/0yo8DN3CL5dlayCw8C
 lD/Bvq1V65KjLZ0CEov8sXF9mSLuKjLYi10AT6f5+tDa2a3BgsdQDdYTgyEvaisZaa
 6F6BzM42rcIow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=GYzOHXKr
Subject: [Buildroot] [PATCH 1/1] package/libass: bump version to 0.17.4
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

Release notes: https://github.com/libass/libass/releases/tag/0.17.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 2f6b554e3d..2f4f718813 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eae425da50f0015c21f7b3a9c7262a910f0218af469e22e2931462fed3c50959  libass-0.17.3.tar.xz
+sha256  78f1179b838d025e9c26e8fef33f8092f65611444ffa1bfc0cfac6a33511a05a  libass-0.17.4.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index f198ee89f0..ff42c6d621 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.17.3
+LIBASS_VERSION = 0.17.4
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
