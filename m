Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5448CEFC38
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 17:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F7A1608A9;
	Tue,  8 Oct 2024 17:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvYjgeaTowNw; Tue,  8 Oct 2024 17:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7D28608A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7D28608A7;
	Tue,  8 Oct 2024 17:50:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23EED1BF344
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 17:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 209A180CC7
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 17:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYDHrkyniVWK for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 17:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D43CE80CAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D43CE80CAE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D43CE80CAE
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 17:50:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a86.dip0.t-ipconnect.de [91.58.10.134])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8517A4C042A
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 19:50:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50360)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1syELT-000000005KN-0V52
 for buildroot@buildroot.org; Tue, 08 Oct 2024 17:50:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 19:50:03 +0200
Message-Id: <20241008175003.3626016-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1728409803;
 bh=IVkhsY9HiiNxkLQRkoHcEGdCwnKIeuuOQvRgLw92VjM=;
 h=From:To:Subject:Date:From;
 b=hey+x7nDlpEtM4IsYFehMDffsGUX0EHLXzgB8xW2Oe6AWchD4o41XrkLNJrcVyZfd
 dut0jkZ+jG8aHWATBz+7eH3n3RrBSgQbJB8P1sz+4vs7V00bKmep03ecJcjlzmewEY
 66h5XZc4tyl+EYXb5LWnl6yC1vupqDS+vhS/kg4ZBO7+XEQFtWIf+mRKL7ekhhtbtN
 IgrXvg3y6dKnJxJdkJvcj9VGt1NyqNxUVqM1dye3Qc0AlQI1R/z41ietAOL5w1hgS2
 0G+FIe46iPaL0CVJuqUSrNEN3LIliNcFTBI+btJvV2m4sNhA9YG03M9eIW9ytV2YLO
 qGhZUxwTW/TCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=hey+x7nD
Subject: [Buildroot] [PATCH 1/1] package/wget: bump version to 1.24.5
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

Release notes:
https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00008.html

No versions between > 1.21.4 and < 1.24.5 were released:
https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00012.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wget/wget.hash | 8 ++++----
 package/wget/wget.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 75c3a913dc..9a79b1bb3e 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,8 +1,8 @@
-# From https://lists.gnu.org/archive/html/bug-wget/2023-05/msg00004.html
-sha1  42384273c1937458c9db3766a5509afa636a2f00  wget-1.21.4.tar.lz
+# From https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00008.html
+sha1  01659f427c2e90c7c943805db69ea00f5da79b07  wget-1.24.5.tar.lz
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  3683619a5f50edcbccb1720a79006fa37bf9b9a255a8c5b48048bc3c7a874bd9  wget-1.21.4.tar.lz
+sha256  57a107151e4ef94fdf94affecfac598963f372f13293ed9c74032105390b36ee  wget-1.24.5.tar.lz
 # Locally calculated
 sha256  f7dc7522e7e1be9227f3dc8de8b39a4d1d2471968c893af15f00c1a2076a0eec  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index d2d3087961..d2a3a38e50 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.4
+WGET_VERSION = 1.24.5
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
