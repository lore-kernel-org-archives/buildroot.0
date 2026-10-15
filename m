Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7FECCF2C3
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C595961166;
	Fri, 16 Oct 2026 13:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyu83_P397NQ; Fri, 16 Oct 2026 13:11:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C5D260B0D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156283;
	b=a+0+0oMcbJBpjWB666sduPe0UwpFDw6SQMDCYL9SelkBRLKZ0DDq59JjOi8mvKWuYNKK
	 oxnn9gaK6FLoZtyyjqV7jMKo5QHlYuArymu0PYNCFlelltoQtAu4YKTVUbqGKWHCmdVtP
	 JQjR9Dwb/YMBio4eKs40rUGo7fg2F37LxeadbVliOSrwBYrr4Er2JGhSUB6cu/TSyJtT9
	 ENa9W788CswW/zf6A2vimnKe4y9IKVrWSh+Pyut/rPBDJYaVSU2IXXcicCKHY2WvxSkHf
	 Tkgu/tXcWnZWnptKoP+kJnlrMrfkLmkz6CYX1Cc8NCdlwHq5LLpmfDEQYiB7vYnyLxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156283;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=xcT3tcAiCh4/1ouuTjrHmdrKmlj2H7bND09QD7NgBTo=;
	b=As8iEX7yfbGpLM8MTQY9beT9uxkCUKCKEBXcyC1VhUsojmyryg059sQ2W3CdzqsYfUEm
	 JhhnnC1doEb2UKO+50mFApXGJCPuN4cKh2fpPqqeI2nQvqrRqyWAfKP7JSp6b2WZSUNd9
	 JdG4CBJTVzYCNRrPbU1ng1qgpzrtrrw6WEZhRawsguoYcjjKwwZccfvxBNpA3U2i7ilIN
	 IQhWaBtdPIh2hamynN79NFinoM8qKYSig2GEwR3YJvnFtApfiIqePIyHI66OgXkLG7dUV
	 J1vUbgpnWuHzT9OKIgF86y1nlYJjSxRlIqsLEDaHB2mOggMaqJ8ExYKdYp76zk0uElw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156283;
	bh=xcT3tcAiCh4/1ouuTjrHmdrKmlj2H7bND09QD7NgBTo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FC/wwvP6wvIQitL9QLGPXCBG8Z/2oH1aEH9x9bPgF655H1uAsBP1hZ1BFtzvrm256
	 PsT4orH+2E1VLexnfQjfmFZXNyoeHlyXvXzeUtmbDr02nO+0/CWci2i+d8NUzRJYZi
	 AaMzq9hyDh7NVNnMvOdPCD6HKHPzRVLTfdyRsN1rWGc1kTz03ri6TYA3fY6qSKy30a
	 1ob+/TEbHTDDtRKnSP0vd0DjmgPMqSGJC5WE/aybW029wgxhvC0Es/UFWJm548FzfN
	 FDG6xuqgmjvA+UwIIQfrSTi+6r4FWpjmQwbtyH9v7NSDXkzKdcpEN5B6I2wL2z/e+V
	 gpJ0fHcnjq2Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C5D260B0D;
	Fri, 16 Oct 2026 13:11:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D821EE3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 476FC40489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOsJoNTIbpjn for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 02CF740490
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=K1iIE6+92jQZnwLUwjappliFal/Iz1XHQVcTGgQQeilvZH2afGX4s0qbo0CMKKp/Bw/E
 9PFGbgCM+RXsM5nhnAdkcSkPtuhKDn+KJBdrf3qbHOdHlAxSPg72wJcmGmmvS6ZcaFFrh
 AOm7+zeTA3SyxKcJfWu2/oHA2f4EROV4smweOewiZN4lKHrsK2bKb6r8UzhJ6WmqvZ5wF
 Vyc7ZVdmGsSf+ZXSgK3aPGck5QT01qOrXnkrsOYeJWBaBnLxtlDg0PYaaxjB7/YAjOTD0
 VtKZxcDmi5Cz4cejO8IUAd0dohDHfjdwJduf2rvEIHO/9cG9obyPsapsJZe+jAktLMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pPSr9P3So2HSUVlVSR0Vo3xdwAnJshNC7Wzb3RXpzrI=;
 b=funVhzshsnbDK5jivPya5HcflxRaTFY8Y+x6PNcpctZh3K3MNjSJz3Q+p+ukJB/ixvST
 wuu7cfEIHKMra8iL2FjBPN9wftTtQ8BGtVFgIybE7I0JLJdvcZlTpDys+CwPrzBV2+CJo
 yTC+p8OMv4fH7b3ujidwpYGAYW++IQXQ50N7v3WD/nf+Q4i8ATEMNI0Kb1fz2+sppSoS+
 QJdRtmF4UsSIrXhUA7LOaW4BVXk7uPpWtq07YE70oO3/ByKktWP+WhIkI7JHpNFwCYKAJ
 c96eNeEbaMR9XtIbb4Aq1d54Fcd1CPgD/ewZcxqCqQIp9HCBc7HoUW57J+E9noPl2sQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02CF740490
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB497960DB; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:20:11 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: cd1b2818a8f2a3c0845c180fde1712273cc510bd
X-Git-Newrev: e1f54e6c7325ce2a665d6b3bd943813e0c2e2304
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.DB497960DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python3: remove
 2to3
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0991835554960731374=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0991835554960731374==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e1f54e6c7325ce2a665d6b3bd943813e0c2e2304
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Upstream release 3.13.0 first included commit
https://github.com/python/cpython/commit/ae00b810d1d3ad7f1f7e226b02ece37c986330e7
which removed the 2to3 program and the lib2to3 module.

Buildroot commit d63e207eb869063f82c867658676c2903beb08cb bumped the
package from 3.12.9 to 3.13.2 but forgot to remove its handling.

Current versions of Kodi do not need lib2to3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix typo in commit log version "3.13.9" -> "3.12.9"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 96bac75585733129044f7d9153d205f5eef93a3c)
[raphael: resolve conflicts in Config.in.legacy]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 Config.in.legacy           | 6 ++++++
 package/kodi/Config.in     | 1 -
 package/python3/Config.in  | 5 -----
 package/python3/python3.mk | 6 ------
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index aeb9b9676e..6386a4147b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_PYTHON3_2TO3
+	bool "python module 2to3 has been removed"
+	select BR2_LEGACY
+	help
+	  The python module 2to3 has been removed upstream
+
 config BR2_PACKAGE_FLUIDSYNTH_SDL2
 	bool "fluidsynth sdl2 audio support removed"
 	select BR2_LEGACY
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index d64a6fee7e..16b86f3fe5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -95,7 +95,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE2
-	select BR2_PACKAGE_PYTHON3_2TO3
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_PYTHON3_SQLITE
 	select BR2_PACKAGE_PYTHON3_SSL
diff --git a/package/python3/Config.in b/package/python3/Config.in
index f9d3d3aaa2..c362c52ab3 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -41,11 +41,6 @@ menu "core python3 modules"
 
 comment "The following modules are unusual or require extra libraries"
 
-config BR2_PACKAGE_PYTHON3_2TO3
-	bool "2to3 module"
-	help
-	  code translation from python 2 to 3
-
 config BR2_PACKAGE_PYTHON3_BERKELEYDB
 	bool "berkeleydb"
 	select BR2_PACKAGE_BERKELEYDB
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 67fee2d6c2..b86453f145 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -75,12 +75,6 @@ endif
 
 PYTHON3_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_PYTHON3_2TO3),y)
-PYTHON3_CONF_OPTS += --enable-lib2to3
-else
-PYTHON3_CONF_OPTS += --disable-lib2to3
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
 PYTHON3_DEPENDENCIES += berkeleydb
 else

--===============0991835554960731374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0991835554960731374==--
