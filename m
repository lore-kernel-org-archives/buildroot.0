Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DAFCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 357E56F5FB;
	Sat, 30 May 2026 21:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4brUBCmWagN; Sat, 30 May 2026 21:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5475861C37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176878;
	bh=7dt+sqhOPu52htegihQAGfVnTujwtzM1umfPdbK375s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G7BdgUOS9RXzxDKxd+s6Mom2KJ5Y1lTQH0hZOa+6HaP0pjhy0gDKiDLAiESQcuhNy
	 cHEVXPv9pAr5z9v60lSAx00sPwI5MHVWD6h/LEN4K2WEvDLI7AUOE/AULE64udTyKW
	 XOH+6c9kmC6fszMXoQdivVNbbUyBk0mb9J4mVrxbiiGo8I3o0FNi8IC3kgjcRIqegC
	 nTTzrJP8MJYvhHIXQRVynlkIa5uXycUEzUDKQNTCYAh96Hw5EUrSL3jlGIwAiikAyD
	 wv8jvDfPRoRhknPnxdR76TagEB60SKkGFloQvWJaWxr2WJ9mbMnUxH4maMgXtZaShk
	 cbYX26bsnY4zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5475861C37;
	Sat, 30 May 2026 21:34:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E67B12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B843812AB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnA3S-DetD8q for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E8DC8129A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E8DC8129A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FD5587624; Sat, 30 May 2026 21:34:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:34:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eec319cda6a8032372435ef43ca7e55c58c1c0d7
X-Git-Newrev: 88e600efb60979d2ed69819446add87bbde2bdb9
X-Patchwork-Hint: ignore
Message-Id: <20260530213422.6FD5587624@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: fix build failure with
 linux 7.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88e600efb60979d2ed69819446add87bbde2bdb9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump to version 2026-05-19 on branch v5.2.2.4 to fix build failure with
Linux 7.1.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 74f12fef29..2e21e45224 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bed53ce2ce2b947795f795538d823a8ecdf3845f2f7571d54ba351ddf4ddb243  rtl8188eu-2ef2819d2d3ef7701a739c66525bca4731c6abbf.tar.gz
+sha256  8ec126dc722b4e0837c866ec3f73eea9f0835d518fef38b880e2c37fd2fac55a  rtl8188eu-cca7c28087db740d7d745e81e4096c9eb9084f9a.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5efa5aefec..5f378e0b6e 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 2ef2819d2d3ef7701a739c66525bca4731c6abbf
+RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
