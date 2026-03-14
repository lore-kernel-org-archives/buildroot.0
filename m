Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8401610706E2
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 16:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85CD3822F7;
	Sat, 14 Mar 2026 16:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FiQrFeubQuXe; Sat, 14 Mar 2026 16:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1B318227A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773507587;
	bh=xM1X+tZh0YFrsRYT8/FOAtOpgpUnQz8f4vSoBXz2gps=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NviKwdTZWc0pnfeEEodGESILlB+xWkxCngmM67cmzBK1BSHfd4l42GOvBOV9vJuWb
	 mOXp9oHU2YInLAdeJEnpU3WXbOP4Ps0wHBbQC2qEF6CKdGrChMncs3Dl1tnrnJ54KV
	 CigaJ3f3RooSbVjxibgXkw+MBfkZTMJj/mtSSxvrUBufxWsuHVgYp1H+p68NhdwE7S
	 QF3gVpRzYEnHbQXu4NPqdkgZ73d4lJLm2JESMBjwee62JGs8HELZRtgdeuLDnxmJsM
	 Gv4zxoLMTk6V0aFkbG5ZzOFNgOYiT/tzDWBjZTV97sCXDqEi0k+f732nw9MKWW27dW
	 If7G01Rwu+ybQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1B318227A;
	Sat, 14 Mar 2026 16:59:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D70DC1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 16:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC8DE60845
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 16:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtPqoNPvzTJB for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 16:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65D9E6081C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65D9E6081C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65D9E6081C
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 16:59:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E8D0FA4C0891;
 Sat, 14 Mar 2026 17:59:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60764)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1SL0-000000000uN-2UWD;
 Sat, 14 Mar 2026 16:59:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Tzu-Jung Lee <roylee17@gmail.com>
Date: Sat, 14 Mar 2026 17:59:42 +0100
Message-ID: <20260314165942.3057310-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773507582;
 bh=YT1I1GhhmyRSKrpJptvTKXjgpdduYJT6nzQl2LUgGzk=;
 h=From:To:Cc:Subject:Date:From;
 b=TNff6SQOjA8g2WAGF848R7v5c+SfoGdyq1LQ0s0i57vUdYgxqFeoxMcu46qX/Rfdz
 7xTUXgPnUXLNZJCGZC+sns6nWs2LvmJ2sTfX4H8XHHA1UTJqSdHte9BqJYa9JyrpW9
 Vyd17GtaEQ9Cg47cO2AatTnRor32Jue0LzZoMIC2ciWEALAf7D+qhbvfw7MOBm3n3F
 G7ZN7rb2Z/k94jhdyQCtA8at5UZlnWPZ999fcQ5QAoS7W5sQ21QeDcrlxYPFfAgZ0j
 Z2zAfqKewlozuHho4pvIyUxAHwgdG/Ng7XtutBEGMI2xyDNxZS7IN4kAW8+Y1DRrXa
 g4Kli1lK6B6cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=TNff6SQO
Subject: [Buildroot] [PATCH 1/1] package/dropwatch: bump version to 1.5.5
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

https://github.com/nhorman/dropwatch/releases/tag/v1.5.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dropwatch/dropwatch.hash | 2 +-
 package/dropwatch/dropwatch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropwatch/dropwatch.hash b/package/dropwatch/dropwatch.hash
index 24fc03097b..c4b85d9354 100644
--- a/package/dropwatch/dropwatch.hash
+++ b/package/dropwatch/dropwatch.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8c43d0c15d0cb9ce179fa1fb0610611723689a6f551b23c70a7ddc1cf068e8d2  dropwatch-1.5.4.tar.gz
+sha256  73d4bcbbb056b3bd514b7d88ef927ece8aca32c2d50724b37c7d0a0d4d133009  dropwatch-1.5.5.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 33775f6c02..e7b796a837 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPWATCH_VERSION = 1.5.4
+DROPWATCH_VERSION = 1.5.5
 DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
 DROPWATCH_DEPENDENCIES = libnl readline libpcap host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DROPWATCH_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
