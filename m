Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B37CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 17:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B5E40DB9;
	Tue, 12 May 2026 17:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zP1mouoGXY0n; Tue, 12 May 2026 17:21:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E45840DBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778606504;
	bh=M8c+5r/K0uXs1JXX6MrL2v9yFD5iReCLdWC4eZMTd+8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kcZypXuG/0mihALsJ1mSNXjaAy5ExeDbfkEQsl15SwiVPoJywh5w+bO6DjK/NzzbJ
	 cq9zQ+R4vI/5sq94IOB3CJkSMh8tyLLIFCHGr7JrDIu/vQyvFiwin4ENs2oeH+P4B3
	 n7BvqxD0xc3lqZBVPp0dk+KonYbWiKwYYWW2FnfeMh/tVPJsXlJmNznCg9+IewdZD1
	 8spRho/eKtBn8Goc3BzIicggpyXXrRIUZmSAwpFWzhYJUQzmNqPIGS4kXyreu0ianI
	 xUvrmoRPdBKZRJ4ay4whVuDJeKlaMk4okKOLjHqJ+oC43QKQI1I36S6lG0S/XxX6YA
	 VxPoLe+X6x+IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E45840DBA;
	Tue, 12 May 2026 17:21:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B093219
 for <buildroot@buildroot.org>; Tue, 12 May 2026 17:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 012DB60DC3
 for <buildroot@buildroot.org>; Tue, 12 May 2026 17:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruemy2FzpeKj for <buildroot@buildroot.org>;
 Tue, 12 May 2026 17:21:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1511D60DAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1511D60DAA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1511D60DAA
 for <buildroot@buildroot.org>; Tue, 12 May 2026 17:21:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D96C4A4C00AA
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:21:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38988)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMqna-0000000058x-2Fm1
 for buildroot@buildroot.org; Tue, 12 May 2026 17:21:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 19:21:38 +0200
Message-ID: <20260512172138.2595183-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778606498;
 bh=T92uVmtZf8EBPlJ9k8spA7yunZ8UuPKRFcp3ZEPWt9U=;
 h=From:To:Subject:Date:From;
 b=MveFHhb0wx0RkAwdr2zcIqMBvv9uV50tMW40FiCO2cNAwrz/bSXntbRFWzV8Kx9Jx
 qK22oFIJjZCZ1X0oMAuOZ7lNbyHcd6oHn1ESQB/E2g1a7Mv5oe/gry76yChEEhtixM
 HXD0fPmXplCce36AD4FiVNR3I0zSAHXCCrKL2xpxqufYSlzZzRKCHcW7+14xGdtTW7
 1glP6FJbq7GCYy1jVPIBr74UrIU/L/k5n7GwinK1xfVQ8P2hJdapxec7Qov17yWrj6
 +BB89VsmGUv0C8/arB82q6YvcABfBf+YtPv+Z1nDOvQL7jjqoFFOUi60c7ZAFJCl2D
 Gx0eMc7eErCSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=MveFHhb0
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.24.2
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

https://www.samba.org/samba/history/samba-4.24.2.html

Fixes CVE-2026-40170.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index a8edb75297..765ccdad55 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.1.tar.asc
-sha256  217151ca318a5576f8e0de72ba0acdf08157ecf12adac42d1af86db0b09a5f5a  samba-4.24.1.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.2.tar.asc
+sha256  ac24583f271a82ac324f7c6fad7327f65b591ad3492e1dccfee988e2c1c81dd1  samba-4.24.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 295571ccf2..2a151f4f61 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.1
+SAMBA4_VERSION = 4.24.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
