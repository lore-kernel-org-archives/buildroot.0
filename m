Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE445CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 18:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5416C42D48;
	Sat, 30 May 2026 18:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFjvIN6e60NS; Sat, 30 May 2026 18:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 800FC42E44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780165633;
	bh=Cdv7dHEUvGZgmHIXwdL/59o5MWK6csk8Z3SpmvYBqVI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PzmjgLPgeT8Ebxhl7Etbj496Fb2jUbJSdzKwV4MUb6Qnpg5D/LBxnSCsjM9CuwQ4J
	 kd6yG2iHrFz+SHCuwLVPeergb3jhoYUzS3jU9Fh+noghLfNXy97KIUBQGMbVqOc2eC
	 uhde8QNCDHvm2kY1cCJcFxESJHjy3vgwzgi5MuZT34s9IsWUzpcePwDep3Y6AUvUdb
	 KIPXv8LA+hHxBfrTppXd5VT+HIwcVTe7KXSG8eUbmlKrOCn6FZ+bkwzDghoamEm+fk
	 /ztbZjs+VrxNmArheRSTWUKW4Zf6VdO+PMgFt/EIIYBkGCMHZ+Sd/nig89sISPmchz
	 Edx/xMHJIaggQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 800FC42E44;
	Sat, 30 May 2026 18:27:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B484F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A5846F5AA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCMdtIM0slS6 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 18:27:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6577C60656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6577C60656
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6577C60656
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:27:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3EADFA4C35AB;
 Sat, 30 May 2026 20:27:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49302)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTOOp-0000000023J-0fcN;
 Sat, 30 May 2026 18:27:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>
Date: Sat, 30 May 2026 20:27:06 +0200
Message-ID: <20260530182706.1679355-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780165627;
 bh=GUl6MIxxORu9rFt9df7O52oUdtRYMRw9BGAp1Je5lXk=;
 h=From:To:Cc:Subject:Date:From;
 b=V3o3bfAyTuONM6C9D+lwiuqp7aXbprjQLQPjq6HJB2wOVCO192zds65lGax92W6rZ
 SUrisRVJU7k2ooiXUnHx7PMyS1ePzj9NsEf0H6M0jr2j5EOy8ur/dGPPtGNz3gp5fp
 1Vol1RfxU3ea9pYBALH3gXhwBmLOrxFR3by78XBoho2dVY8coCsGjNlQsE91X+mrj0
 swTK+gfDyEHl/bwqK6I6+y1N4KI/xKwUQNLhilyvmTUwwTUH3WDK7G269L9cPjDOg8
 TWRW9TU3SV7BDkr1r6uy8L3IEHvZXuJcwq6YXrUvvZTOjuN2qgh6/kXN9TE9wVpheZ
 LLeu1+618angg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=V3o3bfAy
Subject: [Buildroot] [PATCH v5 1/1] package/gettext-gnu: bump version to 1.0
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

Updated GETTEXT_TINY_EXTRA_GETTEXT_FILES due to various rename commits:

- gettext-tools/misc/gettextize.in:
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=21a3caa8011d5bbe595f00451ba3b0264f3cea4b

- gettext-tools/po/Makevars.template:
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=8c716a85ec676bbc3eaba21f973d83e846a62f0c

- gettext-runtime/po/insert-header.sin &
  gettext-runtime/po/remove-potcdate.sin :
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=fe3b543701e51c9cfd66b96c0e9100b1a9f36e1a
https://gitweb.git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=9a4589466bb18cb018ea6588e6836f034ee37a44

Since upstream version 0.25 installed m4 files were moved from
/usr/share/aclocal/ to /usr/share/gettext/m4/:
https://lists.gnu.org/archive/html/bug-gettext/2025-05/msg00041.html
https://bugzilla.redhat.com/show_bug.cgi?id=2366708#c10

Added corresponding _AUTORECONF_OPTS to dovecot & libfuse.

Also added autoreconf and _AUTORECONF_OPTS to linknx to fix an error
during build which starts autoreconf:

>>> linknx 0.0.1.39 Building
[...]
configure.ac:13: warning: macro 'AM_ICONV' not found in library
[...]
configure.ac:13: error: possibly undefined macro: AM_ICONV
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
make[2]: *** [Makefile:376: configure] Error 1

seen with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_SYSTEM_ENABLE_NLS=y
BR2_PACKAGE_LINKNX=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v5: added defconfig and description for linknx fix (Thomas)
v4: Added _AUTORECONF_OPTS to linknx as well
v3: Added _AUTORECONF_OPTS to libfuse as well
v2: rebased in connection with the bump of e2fsprogs to 1.47.4

 package/dovecot/dovecot.mk             |  1 +
 package/gettext-gnu/gettext-gnu.hash   |  4 ++--
 package/gettext-gnu/gettext-gnu.mk     |  7 ++++---
 package/gettext-tiny/gettext-tiny.hash |  2 +-
 package/gettext-tiny/gettext-tiny.mk   | 14 +++++++-------
 package/libfuse/libfuse.mk             |  1 +
 package/linknx/linknx.mk               |  2 ++
 7 files changed, 18 insertions(+), 13 deletions(-)

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
 
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 147b38b2e2..859efbafb8 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -13,6 +13,7 @@ LIBFUSE_CPE_ID_VALID = YES
 LIBFUSE_INSTALL_STAGING = YES
 # We're patching configure.ac
 LIBFUSE_AUTORECONF = YES
+LIBFUSE_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/gettext/m4
 # add host-gettext for AM_ICONV macro
 LIBFUSE_DEPENDENCIES = \
 	host-gettext \
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index d67f010093..035a7725f8 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -9,6 +9,8 @@ LINKNX_SITE = $(call github,linknx,linknx,$(LINKNX_VERSION))
 LINKNX_LICENSE = GPL-2.0+
 LINKNX_LICENSE_FILES = LICENSE
 LINKNX_INSTALL_STAGING = YES
+LINKNX_AUTORECONF = YES
+LINKNX_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/gettext/m4
 LINKNX_CONF_OPTS = \
 	--without-cppunit \
 	--without-pth-test \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
