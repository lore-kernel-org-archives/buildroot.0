Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F7ED0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43D4B8128A;
	Sat, 26 Oct 2024 21:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDgoXb_QGvGd; Sat, 26 Oct 2024 21:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA9E81272
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA9E81272;
	Sat, 26 Oct 2024 21:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60AF05C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EBD66062C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PputyJoOQK6T for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:03:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39167605C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39167605C6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39167605C6
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:03:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 50A78A4C0C85
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 23:03:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35458)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4nwq-000000005Fe-2NW4
 for buildroot@buildroot.org; Sat, 26 Oct 2024 21:03:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 23:03:48 +0200
Message-Id: <20241026210348.2668466-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976629;
 bh=fRS1xi0VTQLwCqPBSrWb3ouqdGSExl2P10uC3KXtUBM=;
 h=From:To:Subject:Date:From;
 b=tkaYd6fvyauPKapYu7ihxG3Sv+Q5AsjUuUWx8BwSp2TDgPirOtXeRO43gcdnm7t1+
 xnPpJuFg5TNAUxxiEr/dKw/4u6hImaXdrY54v+W5ylyvGcKkukesslsjgGph0lLVWE
 4gtB9hvG8LRp31ecYLvo5H4CDZEuflkeEjAesZUlogcKoe7y5PT8kIdh9W9r+dXh+I
 OX+deqEKNJddmLXYZuMy3GhTtCbjHi/KFxWITf2x2QVyKv3QphImMrlPo4daGFZ6LU
 K76g1ZoOi7r2chw1e/ZM/8zRxPNe7jMCWTw7UtAyH26gVeb5psIdoBaqgUYvJv7uT6
 axPK6oVqqfQAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=tkaYd6fv
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.5.0
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
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index e0ca8f1e88..a32f2ae716 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.4.3/dav1d-1.4.3.tar.xz.sha256
-sha256  42fe524bcc82ea3a830057178faace22923a79bad3d819a4962d8cfc54c36f19  dav1d-1.4.3.tar.xz
+# From http://download.videolan.org/pub/videolan/dav1d/1.5.0/dav1d-1.5.0.tar.xz.sha256
+sha256  14bd6f5157808ed9aedcafbe50df689d304fd4810ac20be6eec1ab037436afd6  dav1d-1.5.0.tar.xz
 # Locally computed
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 4e3e8fe1cf..7358690b62 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.4.3
+DAV1D_VERSION = 1.5.0
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
