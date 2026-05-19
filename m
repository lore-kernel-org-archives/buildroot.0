Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A578CD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 21:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3660060BFC;
	Tue, 19 May 2026 21:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWzA33buJytb; Tue, 19 May 2026 21:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CD5860BFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779224403;
	bh=WkyHPkQqsstTYTaTZPkjRzRPTZ8azuQ/DuhsIw5pkRA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ejAZJih6iVbbwz69FXDi039rUKQEgmETwxzg3btWuBllaHP14gReYmXdKEx/dDGYP
	 jhGZ3uXXq14h6Sq0tLPK1p7K5CtIRM+Tk/lE5/oADhTiyWo+NgHkKI18RXxr8XRiWc
	 k7kFE9kk/NuAg6Lgs+2FosCJiKmtL/z2r8aUe7ygsm39DKDS47v+1+xIvmi9YKCb3+
	 YYnW4kJUI034jc6lOAiE/K80LKBfGExCIagL/TcWvZB4auKLcfzmRG6/Vwnq9qNWtt
	 u68NRkKW3VeOQ8U1stiXiVUXrK2bKaRBxN7BXDV/rxk8ESeHYI5jo1ZE4mDKSP7LSJ
	 i7RaEY4oEtMSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CD5860BFD;
	Tue, 19 May 2026 21:00:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A44265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 21:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7C79405A5
 for <buildroot@buildroot.org>; Tue, 19 May 2026 21:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDAtZXWQgSLV for <buildroot@buildroot.org>;
 Tue, 19 May 2026 21:00:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 70C11405A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70C11405A2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70C11405A2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 21:00:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0431.dip0.t-ipconnect.de [91.58.4.49])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E2ECA4C0B8B;
 Tue, 19 May 2026 22:59:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47878)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPRXi-000000007r6-1XXC;
 Tue, 19 May 2026 20:59:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 May 2026 22:59:58 +0200
Message-ID: <20260519205958.1155754-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779224398;
 bh=xhiuwOEukPbFpz/Qx2wCchNa1r7XTAKtZA6BbSSt5vw=;
 h=From:To:Cc:Subject:Date:From;
 b=YJ1Mox0rY12wk+9B5PMXs5Eqx6HllY8kWkLafGSP57sW8qP6T9sBesVaBl7almC9n
 vFGC/K7SrPCNt3EOKPhAI82vaQEGyzNWrIEKBefYe2VvBxxYDUtjoLWBome1cZhuK2
 AM9ynKVFQfOOzqfew2oav0Q8pSzlfTSb+fcJPuSao3qG3Fkf7hHZSxPJXZbg9woVTT
 kZONpZjKqI3WSuyd4dtu0Vuotae1FycVPwZQnQFwopuLYSCgx5sYQZCS3lLm7rQM52
 j8SZMlIByh/gJJ64piR6mINa+d2GFaKmPr4lDZWMGs9bfGYy9HwY38YiAEirvI3pyq
 QVTSL7COqgxaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=YJ1Mox0r
Subject: [Buildroot] [PATCH/next 1/1] package/libffi: bump version to 3.5.2
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

https://github.com/libffi/libffi/releases/tag/v3.5.0
https://github.com/libffi/libffi/releases/tag/v3.5.1
https://github.com/libffi/libffi/releases/tag/v3.5.2

Switched to sha256 tarball hash provided by upstream.

Updated license hash due to copyright year bump:
https://github.com/libffi/libffi/commit/8b0eab28cb45c6862b30f5cadfc1a7fe996b072c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libffi/libffi.hash | 6 +++---
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 75be5bbcef..11e30e0e44 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
-# Locally calculated
-sha256  bc9842a18898bfacb0ed1252c4febcc7e78fa139fd27fdc7a3e30d9d9356119b  libffi-3.4.8.tar.gz
+# From https://github.com/libffi/libffi/releases/tag/v3.5.2
+sha256  f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc  libffi-3.5.2.tar.gz
 # License files, locally calculated
-sha256  67894089811f93fca47a76f85e017da6f8582d4ba0905963c6e0f1ad6df7a195  LICENSE
+sha256  d5699fa516968e3a1550e6c902b7441c78856f2603d61bedd0b0662a26655366  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 7ea61dac1e..2f3208333c 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.4.8
+LIBFFI_VERSION = 3.5.2
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
