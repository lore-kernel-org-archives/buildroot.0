Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD607FF886F
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 04:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 604F3849F5;
	Thu, 30 Apr 2026 04:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2X-pVkWhTMaZ; Thu, 30 Apr 2026 04:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21120849EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777524083;
	bh=kmjVYaTUX4FGfOrxvIwqpZjHfzc3RSCC5BtWjcpsmjA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M/FTNE15hREQP+RQK5T7qy86Bw4dm+p+FKiwx/nWzQgyyFPDR8LRhKoDvDzPnkzQC
	 tMhx43BmbG6f59M+dV+XIYGTz5J6Gp24lX4ea6IiG17I3KaQ5IzGjlbNmqP7ozHQ5s
	 0DucKNvyQ2iAdfUkI5M0/o/mLHNioqDec/k67FxiMA8sDxws1CqFZi0k9Tx53LGkfe
	 G9P2VSsyGiCy39ljGomywLhmA7hdANE0YQ0S9ATjThWojqhggDk/+n6Ka0HBpbnqfL
	 1vwVn2vDg8zXpPItL7qKs/DsvMX+hbH/O/yfdpU2U24inzy7QHpDD4x0Oq6Wdbwa+H
	 ocQDQPnUTWJNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21120849EE;
	Thu, 30 Apr 2026 04:41:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BFE718E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F15EE61B41
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgycFNiJ7BAv for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 04:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF92161B10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF92161B10
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF92161B10
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:41:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb47.dip0.t-ipconnect.de [84.161.187.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5DA14A4C1429
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 06:41:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58048)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIJD7-000000006ya-2hCJ
 for buildroot@buildroot.org; Thu, 30 Apr 2026 04:41:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 06:41:13 +0200
Message-ID: <20260430044114.7686-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777524074;
 bh=+HjbkYBq6VfHoYNa/5+OHemNaP9DeWrcIIJv5NVTIt0=;
 h=From:To:Subject:Date:From;
 b=BgyI6WqPa/rv7ATtGbefw3gIBkQV1uxAc9JnxUngBod3ey31k4gIFF48gbfobbnIo
 CnMZXhpVbsLvs4ZBhZCDNhAxa2S7fxN6AufPF3wPaeUT4mBjqAWxjDExzfLx3UiLK6
 BHT+4bFb3jfZCqZMx+lRd98/ThzQPAtdncIEndpKlxgNsov3JzfBPhEqg0rs8OgEbl
 xhvVAYcSAcw4SkEB73622nlIiGS9zM9VFawaUIP4DwaSd+30vZwT8N6baNyFYvjxeA
 YOoG/7UcEGYCus4F1luyL34kN25XWzOZu2byHyZJSC0QuMsYr/n2jEyQ0vpgb2EfYG
 fUyAwXwug6aAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=BgyI6WqP
Subject: [Buildroot] [PATCH 1/1] package/rsync: security bump version to
 3.4.2
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

https://download.samba.org/pub/rsync/NEWS#3.4.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 5feacd0663..933d330323 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.1.tar.gz.asc
-sha256  2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52  rsync-3.4.1.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.2.tar.gz.asc
+sha256  ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315  rsync-3.4.2.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e4c02a756f..3282a759c6 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.1
+RSYNC_VERSION = 3.4.2
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
