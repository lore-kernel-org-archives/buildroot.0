Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73846C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 07:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D621D600B6;
	Thu, 30 Dec 2021 07:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CWrLV5iBBa1i; Thu, 30 Dec 2021 07:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1EE6607FE;
	Thu, 30 Dec 2021 07:36:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2518F1BF39C
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 07:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 037CC40297
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 07:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0cTozTdj8xs for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 07:36:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C5E8400E9
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 07:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=570Wdfu2d6W7VUhPX6nZtlCeE8DI7Xdkv2jQitrobTY=; 
 t=1640849792;x=1641455192; 
 b=dCzdE+7F4jVnRgAl1zl+mk5stuvdK//GsTeZEzBSjAEHVmNPkiU1rlR8JiBnUt2sifrR/DP8an8XCZrvTT9o/3P4EBjE82T52+O3mxWFb+6CVNi0bLM2QIrnAyFyjQb8GZQcf0PimII7aqjINQA1D17es+0ukZMh/sqSrCg8OP4KJ9gjyWLzhAilF20apyS9th005k4IbXaWbiXFK4bMPsvizLYwB30o8APacUTw8pjMALg/H+RFK0bUbX0qs7bV7JGtZZhim3vNJ2gE52HoClV3GZaFVi/BDLVAT6hMN8Rt2+/gzx1bL0Qck/kvZACBRpTLAINCWVk7FnShLVqK3w==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1n2pzA-0004hQ-TB; Thu, 30 Dec 2021 10:36:29 +0300
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 10:36:26 +0300
Message-Id: <20211230073626.397440-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-174C08C4: 5188C02AEC42908C481ED7ADC579193296BBA28369E3F2D2713F3D5F7D406D31BCF678C7329BA986
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9059F52CFE4D0B70AEDEC808FC37A7BE40BFF2394719FCD0D182A05F5380850404C228DA9ACA6FE271A35B44E64EB07B86BC2DC0BF5047518A841E0EAD46373E2B2101724E992B275
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7922D113DFDC6D5A3EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E8DF562B6063DE0A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F44A0340D217E221CCEC132C5F601C296F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78C592797616C97AB9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B974A882099E279BDA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB24F08513AFFAC7943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 8BD88D57C5CADBC8B2710865C38675100920FC4EF0AE1D47A3B1A56EE2B804F6B226C914C996894645FD9D8A29397D6EFF55FE49A3C2BFCFC8C84E951CD0BE2F296C473AB1E14218EA052B563B0B06C67866D6147AF826D8F44A0340D217E221CCEC132C5F601C29F972CCD2F8FE1EF1CFC4036BBF6A4EA94C2EA64209BEDCA59C5DF10A05D560A97E15B380B3B81456F2DBB7B6E8D16988ED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34BD150993ED26DDF4CD8AA0FAE35E1A1577735A49A5E389ACA282E61C0363B5123781B65484AE058E1D7E09C32AA3244C80C779A0790FAD14F67DEB84F9667F99795D98D676DD64D0729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj1qmHCAeuKqO1BC+F3IjDlA==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D69E7696479299C76742ED1F1C4CFCE77898CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop upstream patches.
Release-notes: https://git.osgeo.org/gitea/postgis/postgis/raw/tag/3.2.0/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 ...VE_VASPRINTF-HAVE_ASPRINTF-templates.patch | 32 --------------
 ...-forced-static-linking-of-liblwgeom.patch} |  0
 ...S_DEBUG_LEVEL-define-to-configure.ac.patch | 29 -------------
 ...fig-to-get-PROJ-version-if-available.patch | 42 -------------------
 ...ix-cross-compilation-with-protobuf-c.patch | 42 -------------------
 package/postgis/postgis.hash                  |  2 +-
 package/postgis/postgis.mk                    |  2 +-
 7 files changed, 2 insertions(+), 147 deletions(-)
 delete mode 100644 package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
 rename package/postgis/{0003-Disable-forced-static-linking-of-liblwgeom.patch => 0001-Disable-forced-static-linking-of-liblwgeom.patch} (100%)
 delete mode 100644 package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
 delete mode 100644 package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch
 delete mode 100644 package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch

diff --git a/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch b/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
deleted file mode 100644
index 3a40afddb2..0000000000
--- a/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7bf2fc388df10bc1760cd06594f50da0c78ee3a2 Mon Sep 17 00:00:00 2001
-From: fidomax <adobegitler@gmail.com>
-Date: Tue, 26 Jan 2021 07:33:17 +0300
-Subject: [PATCH] Add HAVE_VASPRINTF HAVE_ASPRINTF templates
-
-It fixes autoreconf error:
-autoheader: warning: missing template: HAVE_ASPRINTF
-autoheader: Use AC_DEFINE([HAVE_ASPRINTF], [], [Description])
-autoheader: warning: missing template: HAVE_VASPRINTF
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Fetch from: https://github.com/postgis/postgis/commit/d0ac5df49961d1d1a74b894f9941b973c0695c11.patch
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 9ac7051bb..dddb3aef7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -11,6 +11,8 @@ dnl **********************************************************************
- 
- AC_INIT()
- AC_CONFIG_HEADERS([postgis_config.h])
-+AH_TEMPLATE([HAVE_VASPRINTF])
-+AH_TEMPLATE([HAVE_ASPRINTF])
- AC_CONFIG_MACRO_DIR([macros])
- AC_CONFIG_AUX_DIR([build-aux])
- AC_PROG_INSTALL
--- 
-2.30.0
-
diff --git a/package/postgis/0003-Disable-forced-static-linking-of-liblwgeom.patch b/package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
similarity index 100%
rename from package/postgis/0003-Disable-forced-static-linking-of-liblwgeom.patch
rename to package/postgis/0001-Disable-forced-static-linking-of-liblwgeom.patch
diff --git a/package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch b/package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
deleted file mode 100644
index 71409ca599..0000000000
--- a/package/postgis/0002-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 97d0cb4f4a6f3bec50729e3f896d4a84b796c5c6 Mon Sep 17 00:00:00 2001
-From: fidomax <adobegitler@gmail.com>
-Date: Tue, 26 Jan 2021 09:17:17 +0300
-Subject: [PATCH] Add POSTGIS_DEBUG_LEVEL define to configure.ac
-
-In case of using autoreconf "#define POSTGIS_DEBUG_LEVEL 0" is removed from postgis_config.h.in so build failed with undefined POSTGIS_DEBUG_LEVEL.
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Fetch from: https://github.com/postgis/postgis/commit/2b2c2cb159cfcaacb75a4e74f17bd2834d61acd0.patch
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index dddb3aef7..86e1597ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1131,6 +1131,8 @@ else
-     CPPFLAGS="-DNDEBUG $CPPFLAGS"
- fi
- 
-+AC_DEFINE([POSTGIS_DEBUG_LEVEL], [0], [Define debug level. Default 0])
-+
- dnl ===========================================================================
- dnl Allow the developer to disable the automatic updates of postgis_revision.h
- dnl with --without-phony-revision
--- 
-2.30.0
-
diff --git a/package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch b/package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch
deleted file mode 100644
index 1e65b98d3e..0000000000
--- a/package/postgis/0004-Use-pkg-config-to-get-PROJ-version-if-available.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 876a04a795fcb179e0dc802e260353012c4890f9 Mon Sep 17 00:00:00 2001
-From: Maxim Kochetkov <adobegitler@gmail.com>
-Date: Thu, 28 Jan 2021 08:12:57 +0300
-Subject: [PATCH] Use pkg-config to get PROJ version if available
-
-In case of cross-compile AC_PROJ_VERSION([POSTGIS_PROJ_VERSION]) fails.
-So try to get version by pkg-config first
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Fetch from: https://github.com/postgis/postgis/commit/671a878982550e3c590d642620a6621b52c230c7.patch
----
- configure.ac | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 86e1597ee..016f81c7d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -866,6 +866,7 @@ elif test ! -z "$PKG_CONFIG"; then
- 		[
- 			PROJ_CPPFLAGS="$PROJ_CFLAGS"
- 			PROJ_LDFLAGS="$PROJ_LIBS"
-+			POSTGIS_PROJ_VERSION=`$PKG_CONFIG proj --modversion | sed 's/\([[0-9]]\).*\([[0-9]]\).*\([[0-9]]\)/\1\2/'`
- 		],
- 		[
- 			PROJ_LDFLAGS="-lproj"
-@@ -887,8 +888,10 @@ AC_CHECK_HEADER([proj_api.h],
- 		)]
- 	)
- 
--dnl Return the PROJ.4 version number
--AC_PROJ_VERSION([POSTGIS_PROJ_VERSION])
-+dnl Return the PROJ.4 version number if not detected by pkg-config
-+if test "x$POSTGIS_PROJ_VERSION" = "x"; then
-+	AC_PROJ_VERSION([POSTGIS_PROJ_VERSION])
-+fi
- AC_DEFINE_UNQUOTED([POSTGIS_PROJ_VERSION], [$POSTGIS_PROJ_VERSION], [PROJ library version])
- AC_SUBST([POSTGIS_PROJ_VERSION])
- CPPFLAGS="$CPPFLAGS_SAVE"
--- 
-2.30.0
-
diff --git a/package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch b/package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch
deleted file mode 100644
index b415edf0b8..0000000000
--- a/package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8b80c4bd848ff3d71b998dc8a4bd42627ed72581 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 17 Apr 2021 11:58:19 +0200
-Subject: [PATCH] configure.ac: fix cross-compilation with protobuf-c
-
-Try to retrieve the version from pkg-config to avoid the following
-error:
-
-checking protobuf-c version... configure: error: in `/home/fabrice/buildroot/output/build/postgis-3.1.1':
-configure: error: cannot run test program while cross compiling
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/postgis/postgis/commit/8b80c4bd848ff3d71b998dc8a4bd42627ed72581]
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 48ba070a40..df75fe6601 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1004,6 +1004,7 @@ if test "$CHECK_PROTOBUF" != "no"; then
- 		PKG_CHECK_MODULES([PROTOBUFC], [libprotobuf-c >= 1.1.0], [
- 				PROTOBUF_CPPFLAGS="$PROTOBUFC_CFLAGS";
- 				PROTOBUF_LDFLAGS="$PROTOBUFC_LIBS";
-+				PROTOC_VERSION=`$PKG_CONFIG libprotobuf-c --modversion | sed 's/\([[0-9]]\).*\([[0-9]]\).*\([[0-9]]\)/\100\200\3/'`
- 			], [
- 				AC_MSG_RESULT([libprotobuf-c not found in pkg-config])
- 			])
-@@ -1054,7 +1055,10 @@ if test "$CHECK_PROTOBUF" != "no"; then
- 		[])
- 
- 	AC_MSG_CHECKING([protobuf-c version])
--	AC_PROTOBUFC_VERSION([PROTOC_VERSION])
-+	dnl Return the protobuf-c version number if not detected by pkg-config
-+	if test "x$PROTOC_VERSION" = "x"; then
-+		AC_PROTOBUFC_VERSION([PROTOC_VERSION])
-+	fi
-         if test ! "$PROTOC_VERSION" -ge 1001000; then
-                 AC_MSG_ERROR("Old protobuf-c release found but 1.1.0 is required. You can disable MVT and Geobuf support using --without-protobuf")
-         fi
diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index b1c19f029e..12ca18f84f 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc8e3fe8bc532e422f5d724c5a7c437f6555511716f6410d4d2db9762e1a3796  postgis-3.1.4.tar.gz
+sha256  7ab9e154c6947c0cffb8fa12d70806add9aa060e62b6c86a2e206f9d4b507cfd  postgis-3.2.0.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 3a340c680e..d9cda64730 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.1.4
+POSTGIS_VERSION = 3.2.0
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
