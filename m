Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DB5D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A0060755;
	Sun,  7 Dec 2025 14:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NElyiRLUROVX; Sun,  7 Dec 2025 14:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66083608F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117706;
	bh=rOYMvZbkGm3vmuAAWq/qBMrtPowhe5emxPIUtKfAFIs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mHWtHuzs8rDC79nQlw0aDB6xC7mFlAXKB4PkIKGF8dwSzxaeuZbgHsgKVQkTpDJyX
	 ZbS4CC+cW10cn3iDelcxVfxQNo2SA8mdjqeTJz9nYfPg5QfieNpAf7Fy1ezybqAha4
	 pDZHKhxGnjhg0xf6Ll3oFL/91Moie8oFAzqdRphWpCyZUkHo6Gx6R/7MdVYtoC2/nl
	 jgB/yRjcO9WxiDqzP+87ZF9/tdo3as+nH7W8t7JaJdliaidQwXQLXgT0Qw5jXZ6med
	 vUIUxSwJZ2p4l/0+DkjnppnxrKtNtvROkeQ+0mNMedPtUThKVoFnZRsuy90Dkf6UY/
	 DhSzkPawh6HEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66083608F6;
	Sun,  7 Dec 2025 14:28:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E49E42CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1D7340259
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYjnuzwP_5zC for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:28:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D146D40166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D146D40166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D146D40166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EB0EBA4C097F;
 Sun,  7 Dec 2025 15:26:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFit-000000001Fk-2ZoT;
 Sun, 07 Dec 2025 14:26:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:45 +0100
Message-ID: <20251207142651.3695074-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117619;
 bh=fGJlgYtPD+DYRIdd4ME4faSvd9Wrd3yCXmk7NEH+Nx0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Coz0JrXfQxSN2jdyENfJy63oPyfkwCKPtfGu5ZTS/74Z0nIeX+zBXgnW2jkggyk0H
 e7doqRTM0jEEe2OcaMPPNoobuKgjk7/BrMklATFHLsg1tTPOHhatp7xst6nI0xMjiT
 t3icfGMlroc/LiKMS+aAxtUilFl8IdJgnG1xOZBOwW4gyFt1uYGM9UzAx7N/k05Ue0
 CnchHPSJgRDmoYfuDwXaaw8FTTxZ1mqay75p/he+KlGzwyfbmSTK/xy0zAz2j3obOs
 sm3tmD+dRX4nZwiyK6y4a6Py24SE2PQxGdWm9FF9PAtv0jd+iOFm5f/BixrWXdycRv
 VOc6+1OIVR58Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Coz0JrXf
Subject: [Buildroot] [PATCH/next 08/14] package/lugaru: fix cmake 4
 compatibility
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...003-Revert-Set-CMP0004-policy-to-OLD.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/lugaru/0003-Revert-Set-CMP0004-policy-to-OLD.patch

diff --git a/package/lugaru/0003-Revert-Set-CMP0004-policy-to-OLD.patch b/package/lugaru/0003-Revert-Set-CMP0004-policy-to-OLD.patch
new file mode 100644
index 0000000000..a8359f9e69
--- /dev/null
+++ b/package/lugaru/0003-Revert-Set-CMP0004-policy-to-OLD.patch
@@ -0,0 +1,31 @@
+From 165a34a5ca8a712be405fefffcccdb5845f230e3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Verschelde?= <rverschelde@gmail.com>
+Date: Sat, 7 Jul 2018 11:52:28 +0200
+Subject: [PATCH] Revert "Set CMP0004 policy to OLD"
+
+This reverts commit b461f4a69c17073d5c576d24e48b1b59c0d3c932.
+The workaround is no longer needed with SDL 2.0.5+, which is shipped
+in all distros we support (including Debian Stable and RHEL 7).
+
+Fixes #99.
+
+Upstream: https://github.com/osslugaru/lugaru/commit/165a34a5ca8a712be405fefffcccdb5845f230e3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 29141271..3973d362 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,6 @@
+ project(lugaru)
+ 
+-cmake_minimum_required(VERSION 3.0)
+-cmake_policy(SET CMP0004 OLD)
++cmake_minimum_required(VERSION 3.5)
+ 
+ include(FindPkgConfig)
+ include(GNUInstallDirs)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
