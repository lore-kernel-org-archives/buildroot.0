Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675B2CAC587
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 20:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04EE641754;
	Sun, 14 Sep 2025 20:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIubc0aeYF2s; Sun, 14 Sep 2025 20:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 182A641781
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 182A641781;
	Sun, 14 Sep 2025 20:27:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F836255
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25CEC6F667
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-dID7YS6PGN for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 20:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2217A6F66E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2217A6F66E
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:27:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C99E83CDB; Sun, 14 Sep 2025 20:27:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 22:25:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a5cba5b9dfab20b7068bd7b8557a067c64ebbed
X-Git-Newrev: 9fd06f212a9488484b93be511b7c6fa42b2f8adb
X-Patchwork-Hint: ignore
Message-Id: <20250914202713.1C99E83CDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre2: security bump to version
 10.46
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9fd06f212a9488484b93be511b7c6fa42b2f8adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2025-58050: PCRE2: heap-buffer-overflow read in match_ref due to
  missing boundary restoration in SCS

Compared to 10.45, this release has only a minimal code change to prevent a
read-past-the-end memory error, of arbitrary length.  An attacker-controlled
regex pattern is required, and it cannot be triggered by providing crafted
subject (match) text.  The (*ACCEPT) and (*scs:) pattern features must be
used together.

Release 10.44 and earlier are not affected.

https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-c2gv-xgf5-5cc2
https://www.cve.org/CVERecord?id=CVE-2025-58050

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add link to CVE in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 35b87ad854..bd2422d991 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.45/pcre2-10.45.tar.bz2.sig
-sha256  21547f3516120c75597e5b30a992e27a592a31950b5140e7b8bfde3f192033c4  pcre2-10.45.tar.bz2
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.46/pcre2-10.46.tar.bz2.sig
+sha256  15fbc5aba6beee0b17aecb04602ae39432393aba1ebd8e39b7cabf7db883299f  pcre2-10.46.tar.bz2
 # Locally computed
 sha256  9cf7ac6976099a1d856826d3ef1b093bd6b84489dc6100628ac79e740cf9885a  LICENCE.md
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 6d2b729dfe..1d0a3b845f 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.45
+PCRE2_VERSION = 10.46
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
