Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C62D10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA2A66061F;
	Sat, 26 Oct 2024 21:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgZDP30o4bVJ; Sat, 26 Oct 2024 21:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76C5F605DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C5F605DC;
	Sat, 26 Oct 2024 21:01:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D1ED5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E3EC402AC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OlK00vj_OVa for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:01:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB71940216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB71940216
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB71940216
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:01:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF0C2A4C0CE0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 23:01:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46036)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4nu9-000000004qA-1ChR
 for buildroot@buildroot.org; Sat, 26 Oct 2024 21:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 23:01:01 +0200
Message-Id: <20241026210101.2667166-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976461;
 bh=yJzPVHAgeecp6Q+F1ugaH0WdigqTWbUHaobAjOXu7HY=;
 h=From:To:Subject:Date:From;
 b=IW2aEhe9sAh2CPcnj4LDcn/luwp1nBpcGslEiBYXvFr2F+iXC/osFhXP4asprFMvZ
 NHSGiU5hX3Z5sxIqJWcHRPsAfdaxumdGUy8FbkyaY2kPsmG5bhwGVBpn5DAL7GMoRm
 Vr8kUUgyEQbTGPk2ew9apC8BFzkqfoPK64clWKeGpefcYFjvXF3qvuIdfhxa4Nik42
 inJ7O4aRrFiprdQf3YtjgevxtdLg/sxXzN92Teu9cMr6Sk9Ig8ToPh75D6FciZ4bI7
 3PaPcpYLunuwE6yJy4ecnAcw9OkEqdJIojA8snadsFf/JEllHAaro4nwGioNE0vPas
 if505Jkk5j+FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=IW2aEhe9
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.44
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
https://sourceforge.net/p/png-mng/mailman/message/58815959/
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.44/ANNOUNCE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 4 ++--
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 356c0e3e5d..3fd4033f83 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/png-mng/mailman/message/58741099/
-sha256  6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c  libpng-1.6.43.tar.xz
+# From https://sourceforge.net/p/png-mng/mailman/message/58815959/
+sha256  60c4da1d5b7f0aa8d158da48e8f8afa9773c1c8baa5d21974df61f1886b8ce8e  libpng-1.6.44.tar.xz
 # Locally computed:
 sha256  7317e078e2d3b5d7ba5a6159e650945153262b44b76f6700f8e9edb261c5143e  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index af38afde47..3e7fc42d82 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.43
+LIBPNG_VERSION = 1.6.44
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
