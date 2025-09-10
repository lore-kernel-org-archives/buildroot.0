Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF12CAC583
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75197418D5;
	Wed, 10 Sep 2025 21:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJThOvG24PAU; Wed, 10 Sep 2025 21:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5792C418E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5792C418E6;
	Wed, 10 Sep 2025 21:33:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0439234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7343610CB
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaKMWUkCbBzj for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E438B615AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E438B615AA
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E438B615AA
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3C2A3C6B3BE
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 12B13606D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 795E0102F28AA; 
 Wed, 10 Sep 2025 23:33:41 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 23:32:28 +0200
Message-ID: <20250910213241.1529448-21-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540021; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=+x3ImQKzcpqL/dkAZn1BuyS5JBlvnvzR1jRm8GA4cu4=;
 b=RcNDrmh61qoscHG0imuyLShcfmbiIeEkZ6F561stwtuVJbVCJjNVQ25YWldYNl1kwlV65m
 mWz+/ra4aZAtSJ68UxTVITaUnRs7VwaCyPVvTtS6HEtHK1WeuI45vXzrPRkK0OMEzRtvoK
 rxGe1v8+ZykMbBxvPme5cCV4uwFsamtfFOkJU9gNfSorSUSDALWXays689ifzAV7D8ts38
 3dwL6dClhlMZ/EmO0S57ReTOYeTKTxDuuxpS8+sS0qotQmIYRclQ1vUScF8hvXirS3t8bv
 7hURC5DY9se8xK6tXBEDhHYdAQuFmAW8zM/XuoWjhrtP+tbQ9KI1AcVXc1/FaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=RcNDrmh6
Subject: [Buildroot] [PATCH 20/23] package/sylpheed: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the libgtk2 package, we must first remove
sylpheed which requires libgtk2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  7 ++++
 package/Config.in                             |  1 -
 ...-link-checker-before-accepting-click.patch | 39 -------------------
 package/sylpheed/Config.in                    |  7 ----
 package/sylpheed/sylpheed.hash                |  4 --
 package/sylpheed/sylpheed.mk                  | 37 ------------------
 7 files changed, 7 insertions(+), 89 deletions(-)
 delete mode 100644 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
 delete mode 100644 package/sylpheed/Config.in
 delete mode 100644 package/sylpheed/sylpheed.hash
 delete mode 100644 package/sylpheed/sylpheed.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 9b75d4da14..10c3810c41 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1056,7 +1056,6 @@ package/supervisor/S99supervisord lib_sysv.Variables
 package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch lib_patch.Upstream
 package/suricata/S99suricata Shellcheck
 package/swupdate/swupdate.sh Shellcheck
-package/sylpheed/0001-harden-link-checker-before-accepting-click.patch lib_patch.Upstream
 package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch lib_patch.Upstream
 package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/targetcli-fb/S50target Shellcheck lib_sysv.Variables
diff --git a/Config.in.legacy b/Config.in.legacy
index a1b321578b..35363b6782 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_SYLPHEED
+	bool "sylpheed has been removed"
+	select BR2_LEGACY
+	help
+	  Due to the removal of libgtk2, the sylpheed package has been
+	  removed.
+
 config BR2_PACKAGE_PINENTRY_GTK2
 	bool "gtk2 backend of pinentry has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 9746fd954b..6f7c9b613e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2389,7 +2389,6 @@ menu "Mail"
 	source "package/libesmtp/Config.in"
 	source "package/msmtp/Config.in"
 	source "package/mutt/Config.in"
-	source "package/sylpheed/Config.in"
 endmenu
 
 menu "Miscellaneous"
diff --git a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
deleted file mode 100644
index 46b4505837..0000000000
--- a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 876c54b2927e48ab6900e5e6b9395742f75e840e Mon Sep 17 00:00:00 2001
-From: Paul <paul@claws-mail.org>
-Date: Sun, 23 May 2021 12:16:40 +0100
-Subject: [PATCH] harden link checker before accepting click
-
-[Retrieved from:
-https://git.claws-mail.org/?p=claws.git;a=commit;h=ac286a71ed78429e16c612161251b9ea90ccd431]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Julien: rebased patch on version 3.7.0]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- src/textview.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/textview.c b/src/textview.c
-index e55eea9..6fbb8a1 100644
---- a/src/textview.c
-+++ b/src/textview.c
-@@ -2689,7 +2689,7 @@ static gboolean textview_uri_security_check(TextView *textview, RemoteURI *uri)
- 	gboolean retval = TRUE;
- 
- 	if (is_uri_string(uri->uri) == FALSE)
--		return TRUE;
-+		return FALSE;
- 
- 	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(textview->text));
- 	gtk_text_buffer_get_iter_at_offset(buffer, &start_iter, uri->start);
-@@ -2725,6 +2725,8 @@ static gboolean textview_uri_security_check(TextView *textview, RemoteURI *uri)
- 		if (aval == G_ALERTDEFAULT)
- 			retval = TRUE;
- 	}
-+	if (strlen(uri->uri) > get_uri_len(uri->uri))
-+		retval = FALSE;
- 
- 	g_free(visible_str);
- 
--- 
-2.45.2
-
diff --git a/package/sylpheed/Config.in b/package/sylpheed/Config.in
deleted file mode 100644
index f03ae87706..0000000000
--- a/package/sylpheed/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_SYLPHEED
-	bool "sylpheed"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  lightweight and user-friendly e-mail client.
-
-	  http://sylpheed.sraoss.jp/en/
diff --git a/package/sylpheed/sylpheed.hash b/package/sylpheed/sylpheed.hash
deleted file mode 100644
index 39fa76612d..0000000000
--- a/package/sylpheed/sylpheed.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  0d6bc5eb46f5d0a463757c62bc80b00d219b294b3c3662840e4540f6db2e3e49  sylpheed-3.7.0.tar.xz
-sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
deleted file mode 100644
index fc419e2867..0000000000
--- a/package/sylpheed/sylpheed.mk
+++ /dev/null
@@ -1,37 +0,0 @@
-################################################################################
-#
-# sylpheed
-#
-################################################################################
-
-SYLPHEED_VERSION_MAJOR = 3.7
-SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).0
-SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.xz
-SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
-SYLPHEED_LICENSE = GPL-2.0+ (executables), LGPL-2.1+ (library, attachment plugin)
-SYLPHEED_LICENSE_FILES = COPYING COPYING.LIB
-SYLPHEED_CPE_ID_VALID = YES
-SYLPHEED_CONF_OPTS = --disable-gtkspell --disable-gpgme
-SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
-
-# 0001-harden-link-checker-before-accepting-click.patch
-SYLPHEED_IGNORE_CVES += CVE-2021-37746
-
-# Remove the -I$(includedir) from the Makefiles
-# because it refers to the host /usr/include.
-define SYLPHEED_PRECONFIGURE
-	for i in $$(find $(@D) -name "Makefile*"); do \
-		sed -i 's:-I$$(includedir)::g' $$i; \
-	done
-endef
-
-SYLPHEED_PRE_CONFIGURE_HOOKS += SYLPHEED_PRECONFIGURE
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SYLPHEED_DEPENDENCIES += openssl
-SYLPHEED_CONF_OPTS += --enable-ssl
-else
-SYLPHEED_CONF_OPTS += --disable-ssl
-endif
-
-$(eval $(autotools-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
