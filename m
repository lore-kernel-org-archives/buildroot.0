Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65149CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3006C80B9D;
	Mon, 28 Sep 2026 21:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5j6lMUa7GSr; Mon, 28 Sep 2026 21:06:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2EC4580B12
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790629565;
	b=JImly5/5yMeYtwBiMhQD6KdL4Z69AuB7rHfSfd1ogEJk1/x33M6kmo06Wzr1fAKFm29f
	 ezbdGR4a/uYOnmTD0qxV3xGg8OHvphFZuL/+8CL37+YwnZCwqAw9QjqaqhKxP5vXIAjdY
	 IUKTDK77OTAwdgiwpDpsFTI87DmPpOFJl+8kSXCUhXk62dplcoeyAaAHMeMQx7X6WXQC7
	 cQGJNZwfg4PRwTGMnX3GqezIOztTldl/JSkVMZ+Mi0uzGFG6gvwPEt0bNOE/iFy0fKeyB
	 M4Xfz4p0eiOsVYpZtCOOX7FhmjrxrVa+CjLC3U29zmiqM9FtE7xmiZREBwMc3OdlXEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790629565;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t1Cua9qUl32VY5MW55KSTDNqUrhtYCti3Wf7etAaFkE=;
	b=MKS5Fxb6DfEJHXdxKMGLIwoviXjl3vQfdk3eLvoSRsZweAYJ+VWLCE4HQnnKy56Dxuu0
	 XC1sYg0ktnQGbeWB7Fs/lXV9/RRUvaK92esaE08HI7DB0UfhuiWKGxuEl4byhzkoC6OrZ
	 LJICeGTId/LtNomVGdIvAp5pqjuOSv4sTTVTqe5Cd/7mJG4XPh+lsZsYxJBoWZdlaYozD
	 UBlEyHszmTp0ErKNCYVH/hM6T2NZe/WBH2I8FxFARbwk3gEiPw6tfw8E7Xb7ZBsvm9LFr
	 34lE5yAXOVhrDnDjiwD23uk2zbV8oW2ACd//Tg+7ejOSEoZabIHlCan0ztOZynwAIeA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790629565;
	bh=t1Cua9qUl32VY5MW55KSTDNqUrhtYCti3Wf7etAaFkE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z1BzD6xL9XJ1UcoV+dbYw8lt3if5QgQRshEg1umMadXY6s7zFYqemFofVk1caNtxE
	 OBzt3Z12mmvPpshXpj7JXUmau03F3yNaoG8o9KvkKWqHZE69SZPkRwr30kxryLdyHh
	 ETA/XWJfGROzi/OSTYw+tVhZuB1qUW0ElVLlNDqaFPvtLWW4kIvtv+WFaedgEEZ9UV
	 5SnRc4UZsDz6d5+xMGJAbU0SmV3I3K5AiFzjv0H8bjHKdj6KSB4MOcA4gN/JMln5Z/
	 0peG8S8YxmVh50xxUTVfmHwao72IAl7VoWKtR+sHc1Bbw2KgFPuALrZwXC5t08qpHR
	 pBWmJGDUN6tXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC4580B12;
	Mon, 28 Sep 2026 21:06:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 119353D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A85114018B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cv1oKeuVbSX2 for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:06:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C6EBF401C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790629562;
 b=XbbRteGAHN6vVAa2/9HWZIacqyUPD2JOspx9o0o4wGp50wtBT+hKIkgGvdSyqegYkqIs
 wbU597692zRekOTRFyAXsvmwbMJ75DDb5ZopZHD/72fMC/G9O44df+y/l5VbjzwHjGr87
 +aswuN39JhJtOoI7V7wGV6/0TiYsYkGpsvdwd5cLsc7Rb1imGBOJ+h+RM0+JhkJmfv+tC
 93ZedlNFi5Untdn2Hrtjeq4JKXCke448NJw57Ih7pXPFfSVS/4Is0e8SWRx/RX33pNNcD
 jOTt1lufdRjCm2GqgUnG4zm6injc4JUaUd5YmYU8v29YeGuUg0WCm3zAJ1/CzoeMhew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790629562;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=scp9ssMNWqdPAm+fQKn7rhEQNPQRJxXtwu6Z4EOvrEA=;
 b=jLtPv6rUgDrR0j4bdUe4I6u/T5UD2ffk4z8Gcf6C7asqCgRrCOVBtQpFqXjL7n+BEzBz
 XjZaPTpE/D5A7hqfP4h+xyHm4aDvZNMjU/AMZviMzNdTdsojovse+wpp7FkHAc76CKSYD
 jvueZXP0zZxWnP1GufGajw0s9CJ8MLCT/MfWFUw+uCHqmlEZJudCGNQO5UJwaoiDtdb05
 6uzbzMNkDAhdXUQ2dKrdjs7rHJezCkyoX1O2e55mLwJZmWQlMy5zW8Pd8HJ+gyTubVQIO
 tMlm6N/aTgL+MXW984P/2yrUNbvFh1jYnj9PczyopB7EnWyRl+sqhzi5u5SeqXHjaew==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6EBF401C8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B8EA983DE; Mon, 28 Sep 2026 21:04:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:04:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4c6ad81bfa4dd5b12c230c450dbf798c5a1542d
X-Git-Newrev: f20b1b166b2d7af64850d5ca19eed806602fd543
X-Patchwork-Hint: ignore
Message-Id: <20260928210450.5B8EA983DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: bump to the latest
 upstream v4.6.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f20b1b166b2d7af64850d5ca19eed806602fd543
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Wireshark 4.6 is the current Stable version, while 4.4 is the Old Stable,
see https://www.wireshark.org/download.html

See the major changes from Wireshark 4.4 to 4.6 in these release notes:
https://www.wireshark.org/docs/relnotes/wireshark-4.6.0.html. Of notable
interest, libxml2 is now a required dependency.

This is not considered a security update because all important security fixes
that landed in Wireshark 4.6 patch releases are also available in
Wireshark 4.4.19 (currently in Buildroot).

Side discussion: Wireshark 4.2 is now EOL, see
https://www.wireshark.org/docs/wsug_html/#ChIntroEndOfSupportPlanning
As of today, Buildroot LTS 2025.02.x distributes Wireshark 4.2, and
therefore we should consider bumping it to 4.4.19, or even apply this
patch to bump to Wireshark 4.6.9 which will be supported for longer.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/Config.in      |  1 +
 package/wireshark/wireshark.hash |  6 +++---
 package/wireshark/wireshark.mk   | 10 ++--------
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 8b05599ecb..894e629b1a 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_WIRESHARK
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_SPEEXDSP
 	help
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index b17f4bcf17..63a3226c19 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.19.txt
-sha1  46c2805407197048d90dc7eac9f0a4a19d13815a  wireshark-4.4.19.tar.xz
-sha256  0499dddc0aeea500bc65196714e1e01097742efbc479a2d67a9a8b5dd57d6d04  wireshark-4.4.19.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.6.9.txt
+sha1  8287d01d50fa1269dcfd4e01c5dfd8d00ef652f4  wireshark-4.6.9.tar.xz
+sha256  d062d416a1ab3a49975aafe3a671c882dde0562ccd71b078808ceb59d465fc0f  wireshark-4.6.9.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c394f85beb..44f7595610 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.19
+WIRESHARK_VERSION = 4.6.9
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
@@ -18,6 +18,7 @@ WIRESHARK_DEPENDENCIES = \
 	libgcrypt \
 	libglib2 \
 	libpcap \
+	libxml2 \
 	pcre2 \
 	speexdsp
 
@@ -102,13 +103,6 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_LIBSSH=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBXML2),y)
-WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=ON
-WIRESHARK_DEPENDENCIES += libxml2
-else
-WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 WIRESHARK_CONF_OPTS += -DENABLE_LUA=ON
 WIRESHARK_DEPENDENCIES += lua
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
