Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BF5D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECD6C407E7;
	Wed,  3 Dec 2025 22:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAqoseNlCGiC; Wed,  3 Dec 2025 22:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9759405B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799439;
	bh=qYwbvd8UKb1nhXEk7tPZh58GpkROB/ISTrq0sB0OT4M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qG5lN+h+mLSWlZTxWkNYmuoJIRMAJsTWo5BhSsNSQINanqJGo/+niuyuMkfoZEoEA
	 4eGm5HlDyfNQMdCpVzQZ5Duf2a4WABD1FRVgxwfVjfR1PUZO3GVkD8QBD4bB5rPxOF
	 LgG6+TZw45qY9l5njniIVmdS0PpwXtQlC8JYxhm7Cu7vK2JddUkeVvdW2IFbuIcQfH
	 8OPOEUCRgSLDmExHrGx++o4GA4gGJZWe4jPe9viYa9JwDfdmLKRzTsn/sGwTZfJT7x
	 7I9WlWCrJI3lqx8wexZpUMZEN2VRj9HtTMg2y6g8nMiBfARkW+gghmdYM3JdKV8M7j
	 FMSAAPRsTClpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9759405B5;
	Wed,  3 Dec 2025 22:03:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37D90D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EA31401D4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFRNRXFlGmCc for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:03:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0787B4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0787B4004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0787B4004E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F39AFA4C79D0;
 Wed,  3 Dec 2025 22:59:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqh-000000002OS-2DZL;
 Wed, 03 Dec 2025 21:57:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:14 +0100
Message-ID: <20251203215723.2323032-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799146;
 bh=+CMxDPfkTyoGEwYIKAAridDI7YbaH3UbeVVVvv9jULw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=t1OdcjKi+OwhsSpJwoNTq2zG5UtM0biNt0YpDDr7BTpYoBLBoMgF4jv6MGN63iDjN
 gXm6gKTi9SgTY0BZWJ/WKTf6FWdIqq0YS8ZGKwg1O2drE11jyz1d+DTZPFeLXfJ97J
 sveAHsOnhVn6DqrKDHbBLpf9VRegOU9jgxBZULXaSy7hub+U8YOL9yADMjdGaQns3w
 NTfLAj0vLF016gntBhlSxSckyBfjSydMltiyCzFhoHxGAQ4b7VfzAngfitAh85DYW2
 TFMX4Khys6SpttnkPGB8mUJHK2zqtCFZtCKae6CA43ABdAH4CqfwNmjbbSBsBFOQke
 2lxYcNZ9/10Zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=t1OdcjKi
Subject: [Buildroot] [PATCH/next 07/16] package/gtksourceview: bump version
 to 5.18.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes of the major releases:
https://download.gnome.org/sources/gtksourceview/4.0/gtksourceview-4.0.0.news

https://download.gnome.org/sources/gtksourceview/4.3/gtksourceview-4.3.1.news
"Ported to meson build system, autotools will be phased out by next release."

https://download.gnome.org/sources/gtksourceview/5.0/gtksourceview-5.0.0.news
"GtkSourceView 5.0 is the first stable release of GtkSourceView targeting the
 GTK 4 toolkit. It is the culmination of about a year of development."

https://download.gnome.org/sources/gtksourceview/5.18/gtksourceview-5.18.0.news

Switched to gtk4 and meson build system.
Disabled the build of the testsuite.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gtksourceview/Config.in          | 2 +-
 package/gtksourceview/gtksourceview.hash | 4 ++--
 package/gtksourceview/gtksourceview.mk   | 9 +++++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/gtksourceview/Config.in b/package/gtksourceview/Config.in
index e87969b15d..8f1f35c018 100644
--- a/package/gtksourceview/Config.in
+++ b/package/gtksourceview/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GTKSOURCEVIEW
 	bool "gtksourceview"
-	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_LIBGTK4
 	select BR2_PACKAGE_LIBXML2
 	help
 	  GtkSourceView is a portable C library that extends the
diff --git a/package/gtksourceview/gtksourceview.hash b/package/gtksourceview/gtksourceview.hash
index 7a9cf00655..9d74d2810b 100644
--- a/package/gtksourceview/gtksourceview.hash
+++ b/package/gtksourceview/gtksourceview.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gtksourceview/3.24/gtksourceview-3.24.7.sha256sum:
-sha256  a5c20d3a6347533689358f3ea52486409f6dd41d5a69c65eab7570cfaffee8e6  gtksourceview-3.24.7.tar.xz
+# Hash from: https://download.gnome.org/sources/gtksourceview/5.18/gtksourceview-5.18.0.sha256sum
+sha256  051a78fe38f793328047e5bcd6d855c6425c0b480c20d9432179e356742c6ac0  gtksourceview-5.18.0.tar.xz
 
 # Locally computed:
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/gtksourceview/gtksourceview.mk b/package/gtksourceview/gtksourceview.mk
index 3f5aaea4ae..052904cca0 100644
--- a/package/gtksourceview/gtksourceview.mk
+++ b/package/gtksourceview/gtksourceview.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-GTKSOURCEVIEW_VERSION_MAJOR = 3.24
-GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).7
+GTKSOURCEVIEW_VERSION_MAJOR = 5.18
+GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).0
 GTKSOURCEVIEW_SOURCE = gtksourceview-$(GTKSOURCEVIEW_VERSION).tar.xz
 GTKSOURCEVIEW_SITE = \
 	https://download.gnome.org/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
 GTKSOURCEVIEW_LICENSE = LGPL-2.1+
 GTKSOURCEVIEW_LICENSE_FILES = COPYING
 GTKSOURCEVIEW_INSTALL_STAGING = YES
-GTKSOURCEVIEW_DEPENDENCIES = host-pkgconf libglib2 libxml2 libgtk3
+GTKSOURCEVIEW_DEPENDENCIES = host-pkgconf libglib2 libxml2 libgtk4
+GTKSOURCEVIEW_CONF_OPTS = -Dbuild-testsuite=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
