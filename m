Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFE2C30658
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 16:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F112D40BB7;
	Fri, 28 Jun 2024 16:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fn0ONrjd7Y6u; Fri, 28 Jun 2024 16:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1CC241E1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1CC241E1E;
	Fri, 28 Jun 2024 16:48:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD1C1BF39D
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AF7D41A86
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKkJNQPdnReH for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 16:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6A02401D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6A02401D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6A02401D8
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 16:48:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cda5.dip0.t-ipconnect.de [79.214.205.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F1E2A4C0CE6
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 18:48:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51390)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNElX-000000000EJ-2luW
 for buildroot@buildroot.org; Fri, 28 Jun 2024 16:48:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 18:48:02 +0200
Message-Id: <20240628164803.11217-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719593284;
 bh=W+IsjuLtPZQNs7/8dSbYjId8/oAq5HEpjVTQzCZfUOM=;
 h=From:To:Subject:Date:From;
 b=P4KgcahlNMsQ2AsqxYcCEUywJr00OR9/ze3oQ6kEc+A6kMBGb54t2WYnxkWL16hIi
 lI36mqCBKkvGRtPb8CgSJjUFOb59j2JJMwy6a7HlK/3Ckm5AkaQG1McW2V9fKoCQ8v
 16iV6tpBFcj7jd6gj7bzLV6BmjREejDAGy56tcAl8z1WfMiKcxJnmRAkEiYwGU3LH2
 b7QmbYBNUdndRJmoJX8jwxkUQtbcU+70KndfDGdSLuCtv8cFSl8jlnwjbQPZyL1XAl
 V88O2+gb4PY9wTMsCQHU5p0NJmBcXrpZz39JTYUNhfqb2VxhMQhI3GE9sZv6OR0nQS
 iGKzwI42ToIqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=P4Kgcahl
Subject: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.12
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

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.11_v1.2.12#alsa-lib

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 830643dea8..9c993c05ae 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d  alsa-lib-1.2.11.tar.bz2
+sha256  4868cd908627279da5a634f468701625be8cc251d84262c7e5b6a218391ad0d2  alsa-lib-1.2.12.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 246761d4e6..1dc25ea4a8 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.11
+ALSA_LIB_VERSION = 1.2.12
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
