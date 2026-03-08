Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE93F55102
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 10:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39E061030;
	Sun,  8 Mar 2026 10:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwsQnWMrnKgb; Sun,  8 Mar 2026 10:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE86561032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772966003;
	bh=OAtDdv15ax8+tjxBNe8hMgP7Y1i2odgKHvoRNRVWYoI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kFwwwZ/rh1H1mIJFEuNkV9Yb191bWHZOev1t4A8xXSY3+dJjkJldWo7WRyHyVzhO4
	 HfIjhjPWYnIDowg9qUFAxdIPf9so4JcqQgPuaCtbJ/4K6iFC4i/j5VzpjL6Y8+ucZv
	 Bb7TPyI+4FDjj0Wd2C7O+YDG25G/mJ6bMp65HrIeEzEcJhWkJw17XI63EBiu6T1Tq3
	 LqGS+6UiakaBTwZTzJc3QQldaBmvauF9WJXUSU+htOrSA+WXHsvPzxZoqPhPaG0PQJ
	 Iao7XMGfcjJHkZU/VbCw0p57/djfvbT0DLRy2Rcp1ZXS3xfLLQN9Xm/mxQ2v2dVM49
	 m1Vxnx1kT8DIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE86561032;
	Sun,  8 Mar 2026 10:33:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41843223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2740282285
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x74KkkPL7qvF for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 10:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F1C2382265
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C2382265
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1C2382265
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:33:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ED836A4C3228;
 Sun,  8 Mar 2026 11:33:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzBRn-000000002ed-1YHd;
 Sun, 08 Mar 2026 10:33:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>
Date: Sun,  8 Mar 2026 11:33:19 +0100
Message-ID: <20260308103319.1720050-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772966000;
 bh=TftQ+E0PP4f5iGTjo3KBSIHl8ehsl7ygPX0W01ebxww=;
 h=From:To:Cc:Subject:Date:From;
 b=Am4heols0URk7XBM7n7ZNBmoLjFDAEFcBi2Jo23qe3NBQeHyvKsI+CYO0kq6cs6z+
 WEYwoiD+kiG4sVXDHanSlsWMqP490Fvbp4ZQrFk4MNtCt3WVp0ceCWDzbPsBrDEg2O
 KLRV/Ic/Cy6/aJkOU4P7ehbM0BRQ0Dl7BN7WoxGzeesn97h6y/zlryBdAAFOEc079P
 mXcKamGhZ6qGx3oLs/+vlzFSrItA/KI4UOxalhLd6t97PvSnwCAthRvJKlRtMf3RAL
 4O0NlwEmfqGnQZIpsj1BEGUDzjDMwbJzuH5VOQLgJn09AGqw2v25ymYYsI0HhG3Y0R
 EV03JO9YDKMSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Am4heols
Subject: [Buildroot] [PATCH v2 1/1] package/gettext-gnu: bump version to 1.0
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

Release notes:
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=blob;f=NEWS;h=565fc8ec95e591a810be2cef179acd130ba8f9c4;hb=53bcae93fbd26e0e816f0e8e6dd3524ebdc67618

Updated license hash due to upstream commit
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=f58d3e697ecd8e5d73e9fbc558627870308856aa

Disabled unneeded selinux support for host builds to avoid build errors
on selinux-enabled hosts.

Updated sed filter to include "install-tests" which was added with
upstream commit:
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=04f810d72742259c1c198d2505fe03fa330e9d7d

Since upstream version 0.25 installed m4 files were moved from
/usr/share/aclocal/ to /usr/share/gettext/m4/:
https://lists.gnu.org/archive/html/bug-gettext/2025-05/msg00041.html
https://bugzilla.redhat.com/show_bug.cgi?id=2366708#c10
Added corresponding _AUTORECONF_OPTS to dovecot.

Updated GETTEXT_TINY_EXTRA_GETTEXT_FILES due to various rename commits:

- gettext-tools/misc/gettextize.in:
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=21a3caa8011d5bbe595f00451ba3b0264f3cea4b

- gettext-tools/po/Makevars.template:
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=8c716a85ec676bbc3eaba21f973d83e846a62f0c

- gettext-runtime/po/insert-header.sin &
  gettext-runtime/po/remove-potcdate.sin :
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=fe3b543701e51c9cfd66b96c0e9100b1a9f36e1a
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=9a4589466bb18cb018ea6588e6836f034ee37a44

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: rebased in connection with the bump of e2fsprogs to 1.47.4
    This bump now depends on the bump of e2fsprogs to 1.47.4:
    https://patchwork.ozlabs.org/project/buildroot/patch/20260308103044.1719833-1-bernd@kuhls.net/

 package/dovecot/dovecot.mk             |  1 +
 package/gettext-gnu/gettext-gnu.hash   |  4 ++--
 package/gettext-gnu/gettext-gnu.mk     |  7 ++++---
 package/gettext-tiny/gettext-tiny.hash |  2 +-
 package/gettext-tiny/gettext-tiny.mk   | 14 +++++++-------
 5 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a4c799221c..c6ec7cd8c5 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -13,6 +13,7 @@ DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
 DOVECOT_CPE_ID_VENDOR = dovecot
 DOVECOT_SELINUX_MODULES = dovecot
 DOVECOT_AUTORECONF = YES
+DOVECOT_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/gettext/m4
 
 # add host-gettext for AM_ICONV macro needed for autoreconf
 DOVECOT_DEPENDENCIES = \
diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index 7c649843f4..83f5e54dce 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,5 +1,5 @@
 # Please keep in sync with package/gettext-tiny/gettext-tiny.hash
 # Locally calculated
-sha256  29217f1816ee2e777fa9a01f9956a14139c0c23cc1b20368f06b2888e8a34116  gettext-0.22.4.tar.xz
+sha256  71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7  gettext-1.0.tar.xz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
-sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index b7d0cf213c..680c1ab7e8 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -6,7 +6,7 @@
 
 # Please keep in sync with GETTEXT_TINY_ARCHIVE_VERSION in
 # gettext-tiny/gettext-tiny.mk
-GETTEXT_GNU_VERSION = 0.22.4
+GETTEXT_GNU_VERSION = 1.0
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
@@ -40,7 +40,8 @@ HOST_GETTEXT_GNU_CONF_OPTS = \
 	--disable-native-java \
 	--disable-csharp \
 	--disable-relocatable \
-	--without-emacs
+	--without-emacs \
+	--without-selinux
 
 # Force the build of libintl, even if the C library provides a stub
 # gettext implementation
@@ -62,7 +63,7 @@ HOST_GETTEXT_GNU_SUBDIR = .
 # and the build of documentation and tests of gettext-runtime.
 define HOST_GETTEXT_GNU_DISABLE_UNNEEDED
 	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/examples$$//' $(@D)/gettext-tools/Makefile.in
-	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/tests$$//' $(@D)/gettext-runtime/Makefile.in
+	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/tests install-tests$$//' $(@D)/gettext-runtime/Makefile.in
 endef
 
 GETTEXT_GNU_POST_PATCH_HOOKS += HOST_GETTEXT_GNU_DISABLE_UNNEEDED
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index f7ed50b49f..fd18b28c22 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -3,4 +3,4 @@ sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettex
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
 # Locally Computed:
-sha256  29217f1816ee2e777fa9a01f9956a14139c0c23cc1b20368f06b2888e8a34116  gettext-0.22.4.tar.xz
+sha256  71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7  gettext-1.0.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 3fe8a781d9..1a6dd940b2 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -15,17 +15,17 @@ GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
 # Please keep in sync with package/gettext-gnu/gettext-gnu.mk
-GETTEXT_TINY_ARCHIVE_VERSION = 0.22.4
+GETTEXT_TINY_ARCHIVE_VERSION = 1.0
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
-	gettext-tools/misc/gettextize.in \
-	gettext-tools/po/Makevars.template \
+	gettext-tools/wizard/gettextize.in \
+	gettext-tools/wizard/po-templates/traditional/Makevars.template \
 	gettext-runtime/po/boldquot.sed \
 	gettext-runtime/po/en@boldquot.header \
 	gettext-runtime/po/en@quot.header \
-	gettext-runtime/po/insert-header.sin \
+	gettext-runtime/po/insert-header.sed \
 	gettext-runtime/po/quot.sed \
-	gettext-runtime/po/remove-potcdate.sin \
+	gettext-runtime/po/remove-potcdate.sed \
 	gettext-runtime/po/Rules-quot \
 	gettext-runtime/po/Makefile.in.in \
 	COPYING
@@ -87,9 +87,9 @@ define HOST_GETTEXT_TINY_INSTALL_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/extra/boldquot.sed $(HOST_DIR)/share/gettext-tiny/po/boldquot.sed
 	$(INSTALL) -m 0644 -D $(@D)/extra/en@boldquot.header $(HOST_DIR)/share/gettext-tiny/po/en@boldquot.header
 	$(INSTALL) -m 0644 -D $(@D)/extra/en@quot.header $(HOST_DIR)/share/gettext-tiny/po/en@quot.header
-	$(INSTALL) -m 0644 -D $(@D)/extra/insert-header.sin $(HOST_DIR)/share/gettext-tiny/po/insert-header.sin
+	$(INSTALL) -m 0644 -D $(@D)/extra/insert-header.sed $(HOST_DIR)/share/gettext-tiny/po/insert-header.sed
 	$(INSTALL) -m 0644 -D $(@D)/extra/quot.sed $(HOST_DIR)/share/gettext-tiny/po/quot.sed
-	$(INSTALL) -m 0644 -D $(@D)/extra/remove-potcdate.sin $(HOST_DIR)/share/gettext-tiny/po/remove-potcdate.sin
+	$(INSTALL) -m 0644 -D $(@D)/extra/remove-potcdate.sed $(HOST_DIR)/share/gettext-tiny/po/remove-potcdate.sed
 	$(INSTALL) -m 0644 -D $(@D)/extra/Rules-quot $(HOST_DIR)/share/gettext-tiny/po/Rules-quot
 	$(INSTALL) -m 0644 -D $(@D)/extra/Makevars.template $(HOST_DIR)/share/gettext-tiny/po/Makevars.template
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
