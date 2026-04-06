Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B7F46C6D
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF2A40A00;
	Mon,  6 Apr 2026 18:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDLSKD7O-dhJ; Mon,  6 Apr 2026 18:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D67E40A02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775499859;
	bh=FynoAtC9lINHleWq58ClLLwQOmsmjgixDSaTVZVGT6o=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rmlfqyABzW9CquycWDlseIYKLZpijHBC/HyiRAGncivEbBl+9jNuH7gO9AfoCwOts
	 lDsEYj0rYceOCinMPBwHzHzUEyK4ov8Fg8U4Ci0ivKMIIXE5h1bje6cN2kSqp1+jdA
	 F7VN/OwDEKGVweK6We2i/9PQ/VhGWq9Asih2vFK9HZoEouownmoYcqp9GtTpvX+ENU
	 61XB+xMZPk1h+rgOHKDeLeAnLGCkVPq+9P8ut+KqDqXFBXAgTYBTsMAJ//Uxq5nGr5
	 YSEvUhuiW/Ggs4+zcLBCZrNSOPhnPO/YjzpSLuCvGo0pi0eG9XWsffcX7ytHvgkDQb
	 QpZulFsFTl4Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D67E40A02;
	Mon,  6 Apr 2026 18:24:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E5321EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34016402EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGLO3DLiNwPL for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 008BB40126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 008BB40126
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 008BB40126
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:24:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C5CCAA4C3962;
 Mon,  6 Apr 2026 20:23:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9oaY-000000001kA-0Asg;
 Mon, 06 Apr 2026 18:22:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon,  6 Apr 2026 20:22:14 +0200
Message-ID: <20260406182217.1853895-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182217.1853895-1-bernd@kuhls.net>
References: <20260406182217.1853895-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775499782;
 bh=yIBywHi+v6BTL6XihXsXQr8vhAfC9YbWxMzQwsEcQjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fjtS7IQfR6ttiPRATUsCybNKAH6GAjy5hrCMcsX03DBqfl9/OXguj20Vdi/t3w+/g
 u2p2FgESS0zilS4RKTbOV0Mx9AskL0m9dHiXhw+GKHp4qYfbf1M8QI7Yr57zV2Azgz
 FD3P7k6WlXOkeD1hr09sAGgVzi7+bFzWMu5kNisDi1MgSQkev+lXQ/HkER91GzhfFD
 7uMvi1oNnHn81iodea/6pO1it6qgN4ylqPkgxaEk9H7NYBYqqnPokPlAm81klRDs4J
 kQbFfwlN7HhvRArLiQ9ya3D1p5RKS9In9uJuIg0A4bcE7ci70wg0IFG/SaR8d/ppBX
 KFqKtWouHBAzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fjtS7IQf
Subject: [Buildroot] [PATCH 10/11] package/aircrack-ng: switch to pcre2
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

Added two upstream commits to support pcre2 and switch the package from
pcre to pcre2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-autotools-add-PCRE2-detection.patch  | 102 +++++++++++++
 ...icate-if-PCRE-or-PCRE2-is-being-used.patch | 142 ++++++++++++++++++
 package/aircrack-ng/aircrack-ng.mk            |   2 +-
 3 files changed, 245 insertions(+), 1 deletion(-)
 create mode 100644 package/aircrack-ng/0001-autotools-add-PCRE2-detection.patch
 create mode 100644 package/aircrack-ng/0002-autotools-indicate-if-PCRE-or-PCRE2-is-being-used.patch

diff --git a/package/aircrack-ng/0001-autotools-add-PCRE2-detection.patch b/package/aircrack-ng/0001-autotools-add-PCRE2-detection.patch
new file mode 100644
index 0000000000..e99663c39e
--- /dev/null
+++ b/package/aircrack-ng/0001-autotools-add-PCRE2-detection.patch
@@ -0,0 +1,102 @@
+From 6b05dc10cdcf45d50bc8f9dd74667a3ff399a059 Mon Sep 17 00:00:00 2001
+From: Andras Gemes <andrasgemes@outlook.com>
+Date: Fri, 20 Jan 2023 14:52:12 +0100
+Subject: [PATCH] autotools: add PCRE2 detection
+
+Upstream: https://github.com/aircrack-ng/aircrack-ng/commit/6b05dc10cdcf45d50bc8f9dd74667a3ff399a059
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ build/m4/aircrack_ng_pcre2.m4 | 61 +++++++++++++++++++++++++++++++++++
+ configure.ac                  |  2 ++
+ 2 files changed, 63 insertions(+)
+ create mode 100644 build/m4/aircrack_ng_pcre2.m4
+
+diff --git a/build/m4/aircrack_ng_pcre2.m4 b/build/m4/aircrack_ng_pcre2.m4
+new file mode 100644
+index 0000000000..f61c0f656d
+--- /dev/null
++++ b/build/m4/aircrack_ng_pcre2.m4
+@@ -0,0 +1,61 @@
++dnl Aircrack-ng
++dnl
++dnl Copyright (C) 2023 Andras Gemes <andrasgemes@outlook.com>
++dnl
++dnl Autotool support was written by: Joseph Benden <joe@benden.us>
++dnl
++dnl This program is free software; you can redistribute it and/or modify
++dnl it under the terms of the GNU General Public License as published by
++dnl the Free Software Foundation; either version 2 of the License, or
++dnl (at your option) any later version.
++dnl
++dnl This program is distributed in the hope that it will be useful,
++dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
++dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++dnl GNU General Public License for more details.
++dnl
++dnl You should have received a copy of the GNU General Public License
++dnl along with this program; if not, write to the Free Software
++dnl Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
++dnl
++dnl In addition, as a special exception, the copyright holders give
++dnl permission to link the code of portions of this program with the
++dnl OpenSSL library under certain conditions as described in each
++dnl individual source file, and distribute linked combinations
++dnl including the two.
++dnl
++dnl You must obey the GNU General Public License in all respects
++dnl for all of the code used other than OpenSSL.
++dnl
++dnl If you modify file(s) with this exception, you may extend this
++dnl exception to your dnl version of the file(s), but you are not obligated
++dnl to do so.
++dnl
++dnl If you dnl do not wish to do so, delete this exception statement from your
++dnl version.
++dnl
++dnl If you delete this exception statement from all source files in the
++dnl program, then also delete it here.
++
++AC_DEFUN([AIRCRACK_NG_PCRE2], [
++AC_ARG_ENABLE(static-pcre2,
++    AS_HELP_STRING([--enable-static-pcre2],
++		[Enable statically linked PCRE2 libpcre2-8.]),
++    [static_pcre2=$enableval], [static_pcre2=no])
++
++if test "x$static_pcre2" != "xno"; then
++	AC_REQUIRE([AX_EXT_HAVE_STATIC_LIB_DETECT])
++	AX_EXT_HAVE_STATIC_LIB(PCRE2, ${DEFAULT_STATIC_LIB_SEARCH_PATHS}, pcre2 libpcre2-8, pcre2_version)
++	if test "x$PCRE2_FOUND" = xyes; then
++		HAVE_PCRE2=yes
++	else
++		HAVE_PCRE2=no
++	fi
++else
++	PKG_CHECK_MODULES(PCRE2, libpcre2-8, HAVE_PCRE2=yes, HAVE_PCRE2=no)
++fi
++
++AS_IF([test "x$HAVE_PCRE2" = "xyes"], [
++    AC_DEFINE([HAVE_PCRE2], [1], [Define this if you have libpcre2-8 on your system])
++])
++])
+\ No newline at end of file
+diff --git a/configure.ac b/configure.ac
+index 06aca4e466..6d8e0e5677 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -143,6 +143,7 @@ AIRCRACK_NG_EXT_SCRIPTS
+ AIRCRACK_NG_HWLOC
+ AIRCRACK_NG_PCAP
+ AIRCRACK_NG_PCRE
++AIRCRACK_NG_PCRE2
+ AIRCRACK_NG_RFKILL
+ AIRCRACK_NG_SQLITE
+ AIRCRACK_NG_ZLIB
+@@ -319,6 +320,7 @@ ${PACKAGE} ${VERSION}
+     Jemalloc:                    ${JEMALLOC}
+     Pcap:                        ${PCAP_FOUND}
+     Pcre:                        ${HAVE_PCRE}
++    Pcre2:                       ${HAVE_PCRE2}
+     Sqlite:                      ${HAVE_SQLITE3}
+     Tcmalloc:                    ${TCMALLOC}
+     Zlib:                        ${HAVE_ZLIB}
diff --git a/package/aircrack-ng/0002-autotools-indicate-if-PCRE-or-PCRE2-is-being-used.patch b/package/aircrack-ng/0002-autotools-indicate-if-PCRE-or-PCRE2-is-being-used.patch
new file mode 100644
index 0000000000..455e211115
--- /dev/null
+++ b/package/aircrack-ng/0002-autotools-indicate-if-PCRE-or-PCRE2-is-being-used.patch
@@ -0,0 +1,142 @@
+From b381ef3f6b6cc83a4aa016f4c0aebb58fcffcf3f Mon Sep 17 00:00:00 2001
+From: Andras Gemes <andrasgemes@outlook.com>
+Date: Mon, 23 Jan 2023 16:58:38 +0100
+Subject: [PATCH] autotools: indicate if PCRE or PCRE2 is being used
+
+Upstream: https://github.com/aircrack-ng/aircrack-ng/commit/b381ef3f6b6cc83a4aa016f4c0aebb58fcffcf3f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ build/m4/aircrack_ng_pcre.m4  | 28 ++++++++++++++--
+ build/m4/aircrack_ng_pcre2.m4 | 61 -----------------------------------
+ configure.ac                  |  3 +-
+ 3 files changed, 26 insertions(+), 66 deletions(-)
+ delete mode 100644 build/m4/aircrack_ng_pcre2.m4
+
+diff --git a/build/m4/aircrack_ng_pcre.m4 b/build/m4/aircrack_ng_pcre.m4
+index 72f09b98ff..af3e24b4bc 100644
+--- a/build/m4/aircrack_ng_pcre.m4
++++ b/build/m4/aircrack_ng_pcre.m4
+@@ -55,7 +55,29 @@ else
+ 	PKG_CHECK_MODULES(PCRE, libpcre, HAVE_PCRE=yes, HAVE_PCRE=no)
+ fi
+ 
+-AS_IF([test "x$HAVE_PCRE" = "xyes"], [
++AC_ARG_ENABLE(static-pcre2,
++    AS_HELP_STRING([--enable-static-pcre2],
++		[Enable statically linked PCRE2 libpcre2-8.]),
++    [static_pcre2=$enableval], [static_pcre2=no])
++
++if test "x$static_pcre2" != "xno"; then
++	AC_REQUIRE([AX_EXT_HAVE_STATIC_LIB_DETECT])
++	AX_EXT_HAVE_STATIC_LIB(PCRE2, ${DEFAULT_STATIC_LIB_SEARCH_PATHS}, pcre2 libpcre2-8, pcre2_version)
++	if test "x$PCRE2_FOUND" = xyes; then
++		HAVE_PCRE2=yes
++	else
++		HAVE_PCRE2=no
++	fi
++else
++	PKG_CHECK_MODULES(PCRE2, libpcre2-8, HAVE_PCRE2=yes, HAVE_PCRE2=no)
++fi
++
++if test "x$HAVE_PCRE" = "xyes" && test "x$HAVE_PCRE2" = "xyes"; then
++    AC_DEFINE([HAVE_PCRE2], [1], [Define this if you have libpcre2-8 on your system])
++    PCRE2_NOTE="(Pcre and Pcre2 found, using Pcre2)"
++elif test "x$HAVE_PCRE" = "xyes"; then
+     AC_DEFINE([HAVE_PCRE], [1], [Define this if you have libpcre on your system])
+-])
+-])
++elif test "x$HAVE_PCRE2" = "xyes"; then
++    AC_DEFINE([HAVE_PCRE2], [1], [Define this if you have libpcre2-8 on your system])
++fi
++])
+\ No newline at end of file
+diff --git a/build/m4/aircrack_ng_pcre2.m4 b/build/m4/aircrack_ng_pcre2.m4
+deleted file mode 100644
+index f61c0f656d..0000000000
+--- a/build/m4/aircrack_ng_pcre2.m4
++++ /dev/null
+@@ -1,61 +0,0 @@
+-dnl Aircrack-ng
+-dnl
+-dnl Copyright (C) 2023 Andras Gemes <andrasgemes@outlook.com>
+-dnl
+-dnl Autotool support was written by: Joseph Benden <joe@benden.us>
+-dnl
+-dnl This program is free software; you can redistribute it and/or modify
+-dnl it under the terms of the GNU General Public License as published by
+-dnl the Free Software Foundation; either version 2 of the License, or
+-dnl (at your option) any later version.
+-dnl
+-dnl This program is distributed in the hope that it will be useful,
+-dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
+-dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-dnl GNU General Public License for more details.
+-dnl
+-dnl You should have received a copy of the GNU General Public License
+-dnl along with this program; if not, write to the Free Software
+-dnl Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
+-dnl
+-dnl In addition, as a special exception, the copyright holders give
+-dnl permission to link the code of portions of this program with the
+-dnl OpenSSL library under certain conditions as described in each
+-dnl individual source file, and distribute linked combinations
+-dnl including the two.
+-dnl
+-dnl You must obey the GNU General Public License in all respects
+-dnl for all of the code used other than OpenSSL.
+-dnl
+-dnl If you modify file(s) with this exception, you may extend this
+-dnl exception to your dnl version of the file(s), but you are not obligated
+-dnl to do so.
+-dnl
+-dnl If you dnl do not wish to do so, delete this exception statement from your
+-dnl version.
+-dnl
+-dnl If you delete this exception statement from all source files in the
+-dnl program, then also delete it here.
+-
+-AC_DEFUN([AIRCRACK_NG_PCRE2], [
+-AC_ARG_ENABLE(static-pcre2,
+-    AS_HELP_STRING([--enable-static-pcre2],
+-		[Enable statically linked PCRE2 libpcre2-8.]),
+-    [static_pcre2=$enableval], [static_pcre2=no])
+-
+-if test "x$static_pcre2" != "xno"; then
+-	AC_REQUIRE([AX_EXT_HAVE_STATIC_LIB_DETECT])
+-	AX_EXT_HAVE_STATIC_LIB(PCRE2, ${DEFAULT_STATIC_LIB_SEARCH_PATHS}, pcre2 libpcre2-8, pcre2_version)
+-	if test "x$PCRE2_FOUND" = xyes; then
+-		HAVE_PCRE2=yes
+-	else
+-		HAVE_PCRE2=no
+-	fi
+-else
+-	PKG_CHECK_MODULES(PCRE2, libpcre2-8, HAVE_PCRE2=yes, HAVE_PCRE2=no)
+-fi
+-
+-AS_IF([test "x$HAVE_PCRE2" = "xyes"], [
+-    AC_DEFINE([HAVE_PCRE2], [1], [Define this if you have libpcre2-8 on your system])
+-])
+-])
+\ No newline at end of file
+diff --git a/configure.ac b/configure.ac
+index 6d8e0e5677..9d1d148cfd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -143,7 +143,6 @@ AIRCRACK_NG_EXT_SCRIPTS
+ AIRCRACK_NG_HWLOC
+ AIRCRACK_NG_PCAP
+ AIRCRACK_NG_PCRE
+-AIRCRACK_NG_PCRE2
+ AIRCRACK_NG_RFKILL
+ AIRCRACK_NG_SQLITE
+ AIRCRACK_NG_ZLIB
+@@ -320,7 +319,7 @@ ${PACKAGE} ${VERSION}
+     Jemalloc:                    ${JEMALLOC}
+     Pcap:                        ${PCAP_FOUND}
+     Pcre:                        ${HAVE_PCRE}
+-    Pcre2:                       ${HAVE_PCRE2}
++    Pcre2:                       ${HAVE_PCRE2} ${PCRE2_NOTE}
+     Sqlite:                      ${HAVE_SQLITE3}
+     Tcmalloc:                    ${TCMALLOC}
+     Zlib:                        ${HAVE_ZLIB}
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 6ce738bbab..cd3abe5f08 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -13,7 +13,7 @@ AIRCRACK_NG_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CMOCKA),cmocka) \
 	$(if $(BR2_PACKAGE_LIBNL),libnl) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_PCRE),pcre) \
+	$(if $(BR2_PACKAGE_PCRE2),pcre2) \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	host-pkgconf
 AIRCRACK_NG_AUTORECONF = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
