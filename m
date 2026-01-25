Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427C4E63C9C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 12:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3786407F8;
	Sun, 25 Jan 2026 12:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3m_7x_g7Ahu; Sun, 25 Jan 2026 12:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E7FA407FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769343681;
	bh=0HkmBgJs7WeRcvUJz8WlLvBuOeF2MgLO8waH+zoYZg8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QE24H0fSH3sfUA0BIPEQ2Dj+v5FF5HXZQmwgE0lZp5E08OaNw9kxt30pODQjtTyge
	 H0CSp6DQkkqacGhJMxhWZzWMAzSxe1n1IYjNmy99AsYfJqv+5CZPF7K4qC1+bzh+J6
	 MVx0+i5fviD3iOe5qAMUxTR1TSRpD/z3fJ7PcoNj7cxkTMyVXJihxm+j9Gu3pZieu2
	 XlF33oOod3tsqQN6ooUfvXWPQziwkQE4xq3YAHEhmmiUJEFrF0s9CNIbjWmh8RvYmW
	 nEMIfOgaHK7TSLe2GbWagDfpUnozA4LFiw4/5WBF0SztARei98jYQm7SJ36EvIWaNR
	 wuy350qdIE8QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E7FA407FC;
	Sun, 25 Jan 2026 12:21:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 018F31CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAF5E606E8
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAC3OuL6tQAB for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 12:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E90A3606CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E90A3606CB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E90A3606CB
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:21:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6d1.dip0.t-ipconnect.de [79.214.198.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9342CA4C4854;
 Sun, 25 Jan 2026 13:21:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34882)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vjz7B-000000008QP-1bdr;
 Sun, 25 Jan 2026 12:21:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>
Date: Sun, 25 Jan 2026 13:21:13 +0100
Message-ID: <20260125122113.2531851-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769343673;
 bh=tS+Zx7nypJ3JPCMeGq4VVu6zGzUQozXPRYyF/Vf0/AI=;
 h=From:To:Cc:Subject:Date:From;
 b=VYlgv4UnJHQP9sCr8gzBw5p63e7m9e89K/Y0ams2eYvVeTV9MFQbavg6Ow/2Kn8+B
 xet9fypmqqhV0apLNSTzMnpSPXwDr8aKN5TRWkAA565EeapVbWiJTt+v1SG9MSdJpo
 XzhPRvVAy6Kz/3EvlB0hPJpA2OF1RFza7OFsgf7fbwGWDk/8JD7fMFboZdkWoDjMaT
 tIFpqlggUupfHefCotSHFWRPDN6zE+HX0swaYaxhosKyQfBDCy4WK3YqWx57aagt/8
 0TYYYZ0O+oM0l8uOBsYFHchvKPTbZYHoNqvgBz9gppZWS16dROXUWoYk8TYZkg3aXU
 zCHpa+D6kMxWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=VYlgv4Un
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: fix non-c++ build
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

Buildroot commit 18630db8e822120d0d4b9f37fa7c0d901f55d8e9 bumped the
package from 4.7.1 to 4.8.1. Upstream version 4.8.0 includes commit
https://github.com/syslog-ng/syslog-ng/commit/163c894563c9f5536c5e91222c9efda64031b08c
which causes build errors with non-c++ toolchains:
https://github.com/syslog-ng/syslog-ng/issues/5040

Fixes:
https://autobuild.buildroot.net/results/70c/70ca3364da15383a8270d180cd2bf67977d9cb56/

The earliest build error recorded by the autobuilders dates back to
2025-04-23 so a backport should be considered:
https://autobuild.buildroot.net/results/dd2/dd2b1dedbd92280dac01ae4d6454ef7eb08cc539/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...vert-grpc-fix-C-standard-lib-linkage.patch | 30 +++++++++++++++++++
 package/syslog-ng/syslog-ng.mk                |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch

diff --git a/package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch b/package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch
new file mode 100644
index 0000000000..9acb7f9f5f
--- /dev/null
+++ b/package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch
@@ -0,0 +1,30 @@
+From 1b93cb5890d502ab3fd7623306a7feaa09c4d8ff Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 25 Jan 2026 13:07:29 +0100
+Subject: [PATCH] Revert "grpc: fix C++ standard lib linkage"
+
+This partially reverts commit 163c894563c9f5536c5e91222c9efda64031b08c.
+
+Upstream: https://github.com/syslog-ng/syslog-ng/issues/5040#issuecomment-3796535385
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/examples/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/examples/Makefile.am b/modules/examples/Makefile.am
+index fe1a08feb..5914e5273 100644
+--- a/modules/examples/Makefile.am
++++ b/modules/examples/Makefile.am
+@@ -35,7 +35,7 @@ EXTRA_modules_examples_libexamples_la_DEPENDENCIES = $(MODULE_DEPS_LIBS) $(EXAMP
+ modules_examples_libexamples_la_LDFLAGS = $(MODULE_LDFLAGS)
+ 
+ if ENABLE_CPP
+-nodist_EXTRA_modules_examples_libexamples_la_SOURCES = force-cpp-linker-with-default-stdlib.cpp
++modules_examples_libexamples_la_LIBADD += -lstdc++
+ endif
+ 
+ EXTRA_DIST += modules/examples/CMakeLists.txt
+-- 
+2.47.3
+
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index fa405ca5cb..7bf77da205 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -11,6 +11,8 @@ SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-n
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
 SYSLOG_NG_CPE_ID_VENDOR = oneidentity
+# 0001-Revert-grpc-fix-C-standard-lib-linkage.patch
+SYSLOG_NG_AUTORECONF = YES
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	json-c libglib2 openssl pcre2
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
