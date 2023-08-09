Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E804C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23CCD60FC0;
	Wed,  9 Aug 2023 21:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23CCD60FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ah9hFpJ-tu3k; Wed,  9 Aug 2023 21:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24D4860E86;
	Wed,  9 Aug 2023 21:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D4860E86
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DB001BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06F364063C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06F364063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28fNB2_0xze1 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:15:09 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32425400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32425400D9
Received: from fli4l.lan.fli4l (p4fd6c449.dip0.t-ipconnect.de [79.214.196.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C54DA4C110E;
 Wed,  9 Aug 2023 23:14:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57460)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTqVH-0001EZ-0Z;
 Wed, 09 Aug 2023 23:14:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:13:56 +0200
Message-Id: <20230809211401.3587177-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809211401.3587177-1-bernd@kuhls.net>
References: <20230809211401.3587177-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691615643;
 bh=HBGGgL9C6WUUQQ9t60HfKAwdiQCLlo6X04F7DszC4tc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0Iq7LCTEhRW8NEygTBYxAdw9bl/ATsaxP9ED1FK17gqBeF7E0wX3ADqi5e8zo8Ktg
 iDIKaNEB84MQtFm+QnKQOR4hFNGinAxfT0pnBxZPpJGnzty9etLNtD3F9joUMVugh9
 4ZWz3Awets/q5nkVC0MshMdPq9pyPCFdA8G8Y7KkF36F2h62YuZ1qCtPNxq3af2DrK
 HA/crkbG/xZQ07Ne5bxmyAKImKPxVQkz6TNhGc+H2OimLjnGpzUvEl7ilkhOOABRM+
 1CJmcmgg758KlWId6dbIK/hGZ4sZNgyapMmfzLFo16FW4kAzoAnOPRb4fV12ErGeyS
 hJ9VRiEmep+AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=0Iq7LCTE
Subject: [Buildroot] [PATCH/next v3 09/14] package/python3: use upstream
 build system to disable decimal module
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...021-Add-an-option-to-disable-decimal.patch | 54 -------------------
 package/python3/python3.mk                    |  4 +-
 3 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 package/python3/0021-Add-an-option-to-disable-decimal.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 35f0f04380..fb29bc5d42 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1226,7 +1226,6 @@ package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
-package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0021-Add-an-option-to-disable-decimal.patch b/package/python3/0021-Add-an-option-to-disable-decimal.patch
deleted file mode 100644
index d683565f94..0000000000
--- a/package/python3/0021-Add-an-option-to-disable-decimal.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 7091fdf77f612425c178a75148560f9c3514e8b8 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:51:31 +0100
-Subject: [PATCH] Add an option to disable decimal
-
-This patch replaces the existing --with-system-libmpdec option with a
---with-libmpdec={system,builtin,none} option, which allows to tell
-Python whether we want to use the system libmpdec (already installed),
-the libmpdec builtin the Python sources, or no libmpdec at all.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[aduskett@gmail.com: Update for python 3.7.0]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[james.hilliard1@gmail.com: adapt to python 3.9]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- configure.ac | 19 +++++++++++++------
- 1 file changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5e6d72f7db..e6b1f1e9de 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3630,14 +3630,21 @@ fi
- AC_SUBST(LIBFFI_INCLUDEDIR)
- 
- # Check for use of the system libmpdec library
--AC_MSG_CHECKING(for --with-system-libmpdec)
--AC_ARG_WITH(system_libmpdec,
--            AS_HELP_STRING([--with-system-libmpdec], [build _decimal module using an installed libmpdec library, see Doc/library/decimal.rst (default is no)]),
-+AC_MSG_CHECKING(for --with-libmpdec)
-+AC_ARG_WITH(libmpdec,
-+            AS_HELP_STRING([--with-libmpdec], [select which libmpdec version to use: system, builtin, none]),
-             [],
--            [with_system_libmpdec="no"])
--AC_MSG_RESULT($with_system_libmpdec)
-+            [with_libmpdec="builtin"])
-+AC_MSG_RESULT($with_libmpdec)
-+if test "$with_libmpdec" != "none"; then
-+   MPDEC=yes
-+else
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _decimal"
-+   MPDEC=no
-+fi
-+AC_SUBST(MPDEC)
- 
--AS_VAR_IF([with_system_libmpdec], [yes], [
-+AS_VAR_IF([with_libmpdec], [system], [
-   LIBMPDEC_CFLAGS=${LIBMPDEC_CFLAGS-""}
-   LIBMPDEC_LDFLAGS=${LIBMPDEC_LDFLAGS-"-lmpdec"}
-   LIBMPDEC_INTERNAL=
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 324c35838b..ea65a0c66b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -98,9 +98,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_DECIMAL),y)
 PYTHON3_DEPENDENCIES += mpdecimal
-PYTHON3_CONF_OPTS += --with-libmpdec=system
+PYTHON3_CONF_OPTS += --with-system-libmpdec
 else
-PYTHON3_CONF_OPTS += --with-libmpdec=none
+PYTHON3_CONF_ENV += py_cv_module__decimal=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYEXPAT),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
