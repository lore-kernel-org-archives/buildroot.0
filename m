Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA251C8303D
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 06:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 861B840D34;
	Sat,  5 Jul 2025 06:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YaKnhMwKpkx; Sat,  5 Jul 2025 06:18:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A080240D20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A080240D20;
	Sat,  5 Jul 2025 06:18:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4487AB
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 06:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD15240D34
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 06:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-22C9hMfsZm for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 06:18:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7DBA40D13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7DBA40D13
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7DBA40D13
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 06:18:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F0CC6A4C3950
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 08:18:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36266)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXwED-000000007gD-3Vl1
 for buildroot@buildroot.org; Sat, 05 Jul 2025 06:18:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Jul 2025 08:18:25 +0200
Message-Id: <20250705061825.753443-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250705061825.753443-1-bernd@kuhls.net>
References: <20250705061825.753443-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751696306;
 bh=OmtfME09cBuvExdBbIVZtCC04FPSfTo4JlXi3xcmCW0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HtQNCwKck3SaDy0QCbFWsr5a/StsW9ceXEah12ukkDB8BYEjQlEnzhcNhEHvbQkjT
 Y1Aj3Epfqegbl23uz/tvUSX/cW0Bph240DzdhxcNgg/I7wGKb4ozswkw+XnUhRuaSz
 nqpuRUZ0YtEp4J/weXmI03aS76dXG7llZQnAYpIeZjSgdTlonYVE7lPRCMUkgSxrMz
 9VJlsMVqjvM1qaPPpT5jHlvqYu6blRHrJT7GhsBz2OX81ZdDVClG0NgRcxlNi3EG3l
 ELzi+wXBuaGxDPNxPanlzNwpLMogxrNDE7j9XHmZO10rOOWfIYgaE9itC1vHt/Oc2/
 7lGAVtf8IwzLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=HtQNCwKc
Subject: [Buildroot] [PATCH 2/2] package/readline: Use configure options to
 link with ncurses
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

Use configure options to link with ncurses available since version 8.2:
https://cgit.git.savannah.gnu.org/cgit/readline.git/tree/NEWS?h=readline-8.3#n100

Removed a 14 year-old patch added with buildroot commit
b864790383b1cb8d51e5202bb750c0a6601b21ab.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                     |  1 -
 package/readline/0001-curses-link.patch | 18 ------------------
 package/readline/readline.mk            |  5 ++++-
 3 files changed, 4 insertions(+), 20 deletions(-)
 delete mode 100644 package/readline/0001-curses-link.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index f5b158c450..298d080475 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1014,7 +1014,6 @@ package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch
 package/read-edid/0001-Fix-install-file-list.patch lib_patch.Upstream
 package/read-edid/0002-Fix-compiler-check.patch lib_patch.Upstream
 package/read-edid/0003-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/readline/0001-curses-link.patch lib_patch.Upstream
 package/redis/0001-uclibc.patch lib_patch.Upstream
 package/redis/0002-largefile-conditional-define.patch lib_patch.Upstream
 package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch lib_patch.Upstream
diff --git a/package/readline/0001-curses-link.patch b/package/readline/0001-curses-link.patch
deleted file mode 100644
index 6afc5ba078..0000000000
--- a/package/readline/0001-curses-link.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-link readline directly to ncurses since it needs symbols from it
-
-upstream readline does this on purpose (no direct linking), but
-it doesn't make much sense in a Linux world
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/support/shobj-conf
-+++ b/support/shobj-conf
-@@ -42,7 +42,7 @@
- SHOBJ_LIBS=
- 
- SHLIB_XLDFLAGS=
--SHLIB_LIBS=
-+SHLIB_LIBS=-lncurses
- 
- SHLIB_DOT='.'
- SHLIB_LIBPREF='lib'
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index f46d6783f1..f69cbe45e2 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -11,7 +11,10 @@ READLINE_DEPENDENCIES = ncurses host-autoconf
 HOST_READLINE_DEPENDENCIES = host-ncurses host-autoconf
 READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
 	bash_cv_wcwidth_broken=no
-READLINE_CONF_OPTS = --disable-install-examples
+READLINE_CONF_OPTS = \
+	--disable-install-examples \
+	--with-curses \
+	--with-shared-termcap-library
 READLINE_LICENSE = GPL-3.0+
 READLINE_LICENSE_FILES = COPYING
 READLINE_CPE_ID_VENDOR = gnu
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
