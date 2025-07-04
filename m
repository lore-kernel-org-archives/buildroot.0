Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB41C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA7186162C;
	Fri,  4 Jul 2025 16:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-k9az63Nqec; Fri,  4 Jul 2025 16:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F07D460BCB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F07D460BCB;
	Fri,  4 Jul 2025 16:53:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69C8812E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 508A140EBC
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dawrUt3TDvh for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:53:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59ABD40E7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59ABD40E7D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59ABD40E7D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:53:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74F6EA4C37A0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:53:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40078)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjf2-000000005jN-1YJs
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:53:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:53:14 +0200
Message-Id: <20250704165315.3641074-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751647996;
 bh=XiD9SYJol/w+0510hi2QnKoxsF1ne3qELM2a8iRsUXU=;
 h=From:To:Subject:Date:From;
 b=ZMtYv08f++ZKWd5y9d+Q+X+IugPDg+/Fh0jvFTUtYc+X5PrGsaNhqPiF7KRhujfCl
 1HoMXf1JI5EemWgYckQmlScwn7ZpATjO4k6kLJyRL1tN5tmnBavUBREHDLlX6t7ejW
 oUYy7Az9XdefKjXHkYvTg6wbGGplhf0nPnfoBbcTi2TiMOyVEN2fF6CYjO0Z6ORvmK
 aJhQlu6xF1FEy8E1tUdwT+7vAdmMcnTUjwwQ+VxQZqyTxsvUlnWnU+6xim8AVZytka
 WUSjRHGfZqPLl9vMcK1d/c+xmZDOsq7ZhKrzIAbWu+bnQB7Sr1ivLz1XJM5EliBlRz
 EpurAwAEUMIdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ZMtYv08f
Subject: [Buildroot] [PATCH 1/2] package/readline: bump version to 8.3
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

Changelog:
https://cgit.git.savannah.gnu.org/cgit/readline.git/tree/NEWS?h=readline-8.3

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ch-1-fix-crash-when-readline-is-star.patch | 41 -------------------
 package/readline/readline.hash                |  4 +-
 package/readline/readline.mk                  |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch

diff --git a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
deleted file mode 100644
index c2c2d81260..0000000000
--- a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b8d91eab12603fa88e095248855f5f772d182d05 Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Wed, 5 Oct 2022 10:41:16 -0400
-Subject: [PATCH] Readline-8.2 patch 1: fix crash when readline is started with
- an invalid locale specification
-
-Upstream: https://git.savannah.gnu.org/cgit/readline.git/patch/?id=7274faabe97ce53d6b464272d7e6ab6c1392837b
-[peter: stripped unrelated ._.gitignore change]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- nls.c      | 4 ++++
- patchlevel | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/nls.c b/nls.c
-index 5c6a13b..8c027d6 100644
---- a/nls.c
-+++ b/nls.c
-@@ -141,6 +141,10 @@ _rl_init_locale (void)
-   if (lspec == 0)
-     lspec = "";
-   ret = setlocale (LC_CTYPE, lspec);	/* ok, since it does not change locale */
-+  if (ret == 0 || *ret == 0)
-+    ret = setlocale (LC_CTYPE, (char *)NULL);
-+  if (ret == 0 || *ret == 0)
-+    ret = RL_DEFAULT_LOCALE;
- #else
-   ret = (lspec == 0 || *lspec == 0) ? RL_DEFAULT_LOCALE : lspec;
- #endif
-diff --git a/patchlevel b/patchlevel
-index d8c9df7..fdf4740 100644
---- a/patchlevel
-+++ b/patchlevel
-@@ -1,3 +1,3 @@
- # Do not edit -- exists only for use by patch
- 
--0
-+1
--- 
-2.39.2
-
diff --git a/package/readline/readline.hash b/package/readline/readline.hash
index 627746d821..961ef77a0d 100644
--- a/package/readline/readline.hash
+++ b/package/readline/readline.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature from
-# https://ftp.gnu.org/gnu/readline/readline-8.2.tar.gz.sig
-sha256  3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35  readline-8.2.tar.gz
+# https://ftp.gnu.org/gnu/readline/readline-8.3.tar.gz.sig
+sha256  fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc  readline-8.3.tar.gz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 66812dee77..f46d6783f1 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-READLINE_VERSION = 8.2
+READLINE_VERSION = 8.3
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses host-autoconf
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
