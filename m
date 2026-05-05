Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA70FFF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 760EF40B9C;
	Tue,  5 May 2026 19:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhgeTzUSfUi1; Tue,  5 May 2026 19:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB3D540B97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778009702;
	bh=vPDFvdmlJqtZFa87/4xvPfo8rkK3mI0/Z/f5eRqIHOM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jqggaFMcJPLU2bvzVG1u3Umm+Hh3BH5g/9ZB8Fqr4MKetbjmGzUe7giMjB7vEp9RG
	 SdmJmEyopZ1wD/mI1wJc7zApQ3j00X+0AuWuiS56WxK56wXbDzk17Bj44pJCQQ1C47
	 1rfwxvNAyNx0KNsFaxr/XeG9XIqH0Wl+gy1DK43uWneTTHXfparjFkhFlhntdrn9Yp
	 73pPndwZoJN032Qanoeo3hQmOLeJAXsW7OzoQBjM7i6Fb5FmAL+XeuK//+gtR1m7pT
	 d64Q13KS3YlxYgdlh9gQnz1D/TYsnAdd+CZUEtye8DvlnimKd68yOTY+bOvg+f/+nT
	 2KZFvy3WyBstw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3D540B97;
	Tue,  5 May 2026 19:35:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AD22315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C7F86087A
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeKNAVWirnmC for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 441C1607B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 441C1607B5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 441C1607B5
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:34:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18FB7A4C1345
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:34:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57222)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKLXi-000000005jV-3rFA
 for buildroot@buildroot.org; Tue, 05 May 2026 19:34:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  5 May 2026 21:34:54 +0200
Message-ID: <20260505193454.2386709-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778009695;
 bh=u0KDrUkvoYuBc52WOKIJr3HzLy6QA857f9NWuYE/is4=;
 h=From:To:Subject:Date:From;
 b=o96neNu80wYsOXXEG8Q+7Ds+Z+AinfWwCTl9fZ9rrrmB+76HW1Qn/ryCTw+2CJtp5
 iBNlK4NxXkyVTD5t1xtPjqqy357rgPGBBdA/B1IlcXyd6CMLLafrSjJ2NJK0heBm6v
 6VX35bJk4GnGrc1SP7S4DMm0rqW+pA5Y92H6/NYBXt4EGbEHi6wADTJJhuctzbEekb
 hWtwKyQr8FSRocIM+SHCukQu/0dmKPiafpnCDliaz2ZlhifAjzW17kLzFwWyZjPAZR
 KzZJbdwR109pmAcIQrOE27JLpYyVdr1ZLiCmE9oPFuNNW0+1UHB+iRfif9GlNglql7
 oQds0ve6B/N4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=o96neNu8
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.53.1
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

https://sqlite.org/releaselog/3_53_1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 49d0012ded..d520096a3b 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  851e9b38192fe2ceaa65e0baa665e7fa06230c3d9bd1a6a9662d02380d73365a  sqlite-autoconf-3530000.tar.gz
+sha256  83e6b2020a034e9a7ad4a72feea59e1ad52f162e09cbd26735a3ffb98359fc4f  sqlite-autoconf-3530100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 721af0d840..e2f1a426e7 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.53.0
-SQLITE_TAR_VERSION = 3530000
+SQLITE_VERSION = 3.53.1
+SQLITE_TAR_VERSION = 3530100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
