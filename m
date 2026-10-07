Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471EECA6002
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 22:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA09160BEF;
	Wed,  7 Oct 2026 22:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCS9vFItHCaA; Wed,  7 Oct 2026 22:17:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8016060BD7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791411420;
	b=ZMefl4hty9S5gb1WBPE3cFyAumYyZTA+8pR+JPm8veHvxZxKHJ3xOFxdv6yHAGSTRshM
	 fZXGJT3SAICeLkSO1FtkJCdGn7gl3KVOnUHNwlNEsql4g/MSPL+/kebodFSgm6pz1wGtX
	 GSYZYwjw2CYV1IvSr6EZcSb225Bdbz01ihUIpVeIZGl38gNr9vYSiT1+QZ83VMVPXE5qF
	 GUeo5U6u5FE0SriP2/LyIUGQ2a4HnVERg2wZnSOs5YhZ4F3apmukWaqr3pOA/VsjGVPVi
	 bSTFEZvS3TmVIarQxCOCah1VRiY76+Ts8Is8Nes9iggbTaq+vpU4vWTVG/phrf1hM7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791411420;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=yZgyCrGvvues1hfsipmHL8B1rZP5ynGRS8gB9cb/69o=;
	b=iCuZNkGqhcT2ZVNv1yadzJEa+hhekZvPkVa9/A7CDPx+BuwV8iTcicpsCtYwW/i7tiGv
	 b4L5pjYJ1LZs/8xVQSoB9o1IvirIsNAirR6pEXVG4wEGGeatr8Pcf4mmbRfFaChyegsb+
	 ynxg5pVvn6U9vt6wcdvJliVxI5qKobDrGcXyDgyx2xXsUc6FZZxiR10MnV3KZ3CyVuxB1
	 L4YLVNUEG5EAURfRorPmvx3e3sXtyeR/NSPGv/OBhm49+WYtoFHgJMMaqBchhlGQjJdju
	 9RVQ+n/JrmHPvIZ0A6bTz/J4nyrIOxzVF+bHQrU0jnZ14guGe2MMD6SAWF4M6ISgJAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791411420;
	bh=yZgyCrGvvues1hfsipmHL8B1rZP5ynGRS8gB9cb/69o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cdg8oLSli6iC8Z5ekC24vP5oom/WyVE2+jL7XU7u/s/Wowi8YBYmPrQ5oxCZ3nqyH
	 4kQShphHKswU8vUeZY6nfW5yxtWY8bbp3U3hduHyrfh6HlpF0eDOScPoq3iQ+Sh2+q
	 b0qLEQOsMfsDY78mGerko8aIsifD6IJ7ogc9U8znv9f9FH012bXgofxFg7aQtpAmfi
	 PmwqFEwIo3equ6JB+1NqjBhqn5SDAX4MQFBzNCr3uDHxusktc4ghjhcL4ELxdU2ufu
	 +jbb9jA/9+bR+pRg3lJKz7WfsoFIaroAdy7dHlG15vW1+x4pRuNTfY6J+vtjc4Hlt1
	 qg5qoh/j5q13g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8016060BD7;
	Wed,  7 Oct 2026 22:17:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2408A70E
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A9C440A73
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYyhZ8cZ-F0I for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 22:11:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 631CE40A76
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791411101;
 b=G5TlgT1nSLeKr60e8RGJA0ANLnSYtc/v3r1jrI/BcuIT0FDb13IV3L3yqguNCWiTuJnQ
 pkcrWbu8WPxRPULZ/mfw4v/5FVWN5XFFyp7cb70OjscQ2QVySj/iqHD0ApuKkcTvNk8E5
 H9n2IxoJSE3tW3qFxTJlwrrZAWS8myGIwrGtZLAa2ppI5cTLL3wAKzbYLs9yCTYxn+ain
 sjyUn21YJ6PI86LU8KSXV82Pnd0LpIgLgfjTv4sxnwtrF+evlf1p2T9actt7KbV09m5zQ
 6fPERVyJLAY+aLNreawrF/svvlcGgkxyRvMbEIw1BbT87qsaEwvdWwV9VCHX4wKGQYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791411101;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F1z1ARw2vesRv8FCvQqU3iRYCMRZTe+0kCBBYGyOkjk=;
 b=PHcRwr8BfhRrygbj/gMchbxXDkB4BIVMTYfMruUPqTI1knq74nELqWgFGudVqpZYon7q
 j+ni+ElWx9CGKVdYYoTiT6fUpaZztYJfE/OCEEy8pZRpDEMYuS9BzP+bYOMSTJ/80+iCR
 jwcAR+4Gdk0iwqXeKohLvJJYs5sWLyT9Nph3e3BxPSpjsm2ITRcK2ge94HpTVBCP1Umr4
 a6GTiWFs132tKV13ETO0I2xwso7JnucqNKHAeeI0QM0XcNfQ4pS9xQzwNvE7eXb51vNSM
 wQ2HKW51eDOQ8wkX4tBQip1roEzlHZTBnRXjrL6bzEEvCGMlkcF7KmOBzhW7x1CcJcQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 631CE40A76
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:11:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51D358DB6F; Wed,  7 Oct 2026 22:10:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 00:10:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43d55a6d9ccd9cbf62b0aca9fb179bd07758b99b
X-Git-Newrev: b6525e9cf89394d45e1c74085d0d1d039bd890d0
X-Patchwork-Hint: ignore
Message-Id: <20261007221024.51D358DB6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump version to
 2.9.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6525e9cf89394d45e1c74085d0d1d039bd890d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libexpat/libexpat/blob/R_2_9_0/expat/Changes
https://blog.hartwork.org/posts/expat-2-9-0-released/

Fixes CVE-2026-77214 & CVE-2026-102633.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 262ad4bf0d..41778fc536 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_5
-sha256  1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182  expat-2.8.5.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_9_0
+sha256  1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051  expat-2.9.0.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index be4180992f..be5d8ae0b8 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.5
+EXPAT_VERSION = 2.9.0
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
