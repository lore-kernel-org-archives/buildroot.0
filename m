Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811DDCEFC39
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 17:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C297608A8;
	Tue,  8 Oct 2024 17:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lp30s-VXIdtd; Tue,  8 Oct 2024 17:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EA35608A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EA35608A7;
	Tue,  8 Oct 2024 17:49:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4EAD1BF344
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 17:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A75DE40AFC
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 17:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6bG7rFZgcLh for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 17:49:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AEEE4024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AEEE4024E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AEEE4024E
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 17:49:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a86.dip0.t-ipconnect.de [91.58.10.134])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46675A4C01D0
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 19:49:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34070)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1syEKR-00000000594-2c1A
 for buildroot@buildroot.org; Tue, 08 Oct 2024 17:49:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 19:48:59 +0200
Message-Id: <20241008174859.3625956-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1728409740;
 bh=3w57hnvfMwDSXoN0K8khCzltpu4pBjcBIFZzh8bBoXU=;
 h=From:To:Subject:Date:From;
 b=qn3R7GrvihAWE8a/R0O/U5F/Ru10eqanmKP3wkDj+YfnJrsr+4SKgy+fEpHgriVgr
 ejf2y64R3VGdUbj0TI4ntpex4ys9KtrGLKGz3AztK8MWtNm5F8Q25tPHFxePGU65nb
 bLx8Sbr3abSuW3OfssRFI1hMryv4e0W3637R2LLDl0N5EjNh4yMS/WC4Nl/DK7A4zi
 niJimE0LA13F4RB9A0cIGmsKhSKjknArhh4Hq4w5fAmiOGho6ANPSwfNN5pZwggXOS
 5gCIelSTf8iqbQZ2K4oddYQt6TCZwySwHzn3KwZ9Z4vLrP8wmBrJiCT9Oa1BnzM71x
 pQ8DsJcwysBJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=qn3R7Grv
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.46.1
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

Release notes: https://sqlite.org/releaselog/3_46_1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 5eae86f159..e9017c4855 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6f8e6a7b335273748816f9b3b62bbdc372a889de8782d7f048c653a447417a7d  sqlite-autoconf-3460000.tar.gz
+sha256  67d3fe6d268e6eaddcae3727fce58fcc8e9c53869bdd07a0c61e38ddf2965071  sqlite-autoconf-3460100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 8bd0a5cb4d..614b4b8ed2 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.46.0
-SQLITE_TAR_VERSION = 3460000
+SQLITE_VERSION = 3.46.1
+SQLITE_TAR_VERSION = 3460100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2024
 SQLITE_LICENSE = blessing
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
