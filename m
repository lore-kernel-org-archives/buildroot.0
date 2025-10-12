Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04891CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 16:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB20607B3;
	Sun, 12 Oct 2025 16:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMLH6o9bdoVM; Sun, 12 Oct 2025 16:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0442160634
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0442160634;
	Sun, 12 Oct 2025 16:49:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E722A8
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBDAA40067
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Pg1XT7TSUWi for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 16:49:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C33C140063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C33C140063
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C33C140063
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:49:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC70FA4C63B2
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:49:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37926)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7zG5-00000000218-4BD7
 for buildroot@buildroot.org; Sun, 12 Oct 2025 16:49:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 18:49:22 +0200
Message-ID: <20251012164922.3447879-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760287762;
 bh=jxni+VbwB0x+1rPpq9ytzUtlvguEwW2+caa1Z0AnxW0=;
 h=From:To:Subject:Date:From;
 b=R8962hqDHw9yyUQ9kvrTLEfQzzvtnai4RY3/Qmc8bJw0afOBQ3QiK3zoXnoGdjWsi
 PutEo50IE3UU2plgq5xKY8+B4Anmh3bQcpyL5Ad/EK1dWL+dWp2dtmianPxqMagk4d
 8z1UC0MlCNnwt8cBSHL9YAa+4D1HYtOaak+PUuPt7OLL02QHnr2ZTtLGCNsk4U51ji
 d/4yAmcMG84yu3VR/Bex50QwLt79XH8wuyR5zDzLt9GWP2qykpTmWylKg3BO0Y2Pz4
 bhC4bh3Vqo0nTVAQcy6OrTy2hvcNGP9rX6hH4vMbdgh2Mr2bbajf8bq0EJV2smI7LI
 dLzl3Ce45knCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=R8962hqD
Subject: [Buildroot] [PATCH 1/1] package/coreutils: bump version to 9.8
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

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...001-coreutils-mcel-port-to-uClibc-ng.patch | 35 -------------------
 package/coreutils/coreutils.hash              |  2 +-
 package/coreutils/coreutils.mk                |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch

diff --git a/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch b/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
deleted file mode 100644
index 7639509ff2..0000000000
--- a/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c4e923a98f34fe5f5ec3b49543e90716ec2a45fc Mon Sep 17 00:00:00 2001
-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
-Date: Tue, 24 Sep 2024 18:08:31 +0200
-Subject: [PATCH] coreutils: mcel: port to uClibc-ng
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Waldemar Brodkorb in:
-https://lists.gnu.org/r/bug-gnulib/2024-08/msg00130.html
-* lib/mcel.h (mcel_scan): Don't treat uClibc-ng like glibc.
-
-Upstream: https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=9765bc796b3e6ceaa7a10ba07c9c2f1e272a4249
-Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
----
- lib/mcel.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/mcel.h b/lib/mcel.h
-index f6f006c..dca4d08 100644
---- a/lib/mcel.h
-+++ b/lib/mcel.h
-@@ -221,7 +221,8 @@ mcel_scan (char const *p, char const *lim)
- 
-   /* An initial mbstate_t; initialization optimized for some platforms.
-      For details about these and other platforms, see wchar.in.h.  */
--#if defined __GLIBC__ && 2 < __GLIBC__ + (2 <= __GLIBC_MINOR__)
-+#if (defined __GLIBC__ && 2 < __GLIBC__ + (2 <= __GLIBC_MINOR__) \
-+	&& !defined __UCLIBC__)
-   /* Although only a trivial optimization, it's worth it for GNU.  */
-   mbstate_t mbs; mbs.__count = 0;
- #elif (defined __FreeBSD__ || defined __DragonFly__ || defined __OpenBSD__ \
--- 
-2.39.2
-
diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 3455c95c58..2c353f0f6d 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a  coreutils-9.5.tar.xz
+sha256  e6d4fd2d852c9141a1c2a18a13d146a0cd7e45195f72293a4e4c044ec6ccca15  coreutils-9.8.tar.xz
 # Locally computed
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index a6d193b49e..be7569ed99 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.5
+COREUTILS_VERSION = 9.8
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
