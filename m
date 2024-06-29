Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6502EC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 29 Jun 2024 08:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0817A842BE;
	Sat, 29 Jun 2024 08:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXsoLhsNrDKQ; Sat, 29 Jun 2024 08:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4D4384487
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4D4384487;
	Sat, 29 Jun 2024 08:21:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 974591BF387
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 08:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84F5560840
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 08:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-xr7lTGio_E for <buildroot@lists.busybox.net>;
 Sat, 29 Jun 2024 08:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1ED8960831
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ED8960831
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1ED8960831
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 08:21:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cda5.dip0.t-ipconnect.de [79.214.205.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BD827A4C0D1F
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 10:21:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51570)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNTLE-000000003LR-0MXO
 for buildroot@buildroot.org; Sat, 29 Jun 2024 08:21:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Jun 2024 10:21:52 +0200
Message-Id: <20240629082152.3438355-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719649312;
 bh=XJcLuC9NHbr8HSoeZ7Bsf10AHcqzh92j5S2pnPCuVUk=;
 h=From:To:Subject:Date:From;
 b=CbeOXYNhfmM8YJd7gZi4ihWVdhVRH8FUrJPZSf+IJgnDk1C3HbCOSq2OogBoaFsI+
 FWkf0bf40JLu28H1+MiNiUi/bbE6VBZSOByXv7y613yGTpwqwqN1hZ3+N6sfydweXC
 nJ3Ckac7T7YdOYU+0Dl07pYI+ZBnchABwXPUwVn+UngZRlk6wB9DuYEzVTf5mQD2dJ
 Xsu7KVpS5CljWtMzFFzDgLxWZwTuDAup1dfu/RaFKEq3mPTYWpgBn30sujKYqfpVXG
 YgW5B+drvayD4/x5nq4MdtnwEE2vbjgEZV1Sq9Pb6wgG2GXsgVv+HfOMipG650WAM0
 zCvxMlvbTf1Rw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=CbeOXYNh
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: bump version to 1.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=blob;f=NEWS
https://dev.gnupg.org/T7166

Rebased patch.

Updated license hash due to upstream commit:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commitdiff;h=2538430a35b02b9ac002a84930650bf4767fc473

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...0001-configure.ac-add-an-option-to-disable-tests.patch | 8 +++++---
 package/libgcrypt/libgcrypt.hash                          | 6 +++---
 package/libgcrypt/libgcrypt.mk                            | 2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
index 5ddde9df1b..bc0f9ebe7f 100644
--- a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
+++ b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
@@ -15,6 +15,8 @@ Fixes:
  - http://autobuild.buildroot.org/results/50a8ba572e3fafd3c6a39bd54bcfcaf78b5ad325
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Bernd: rebased for version 1.11.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.am  |  7 ++++++-
  configure.ac | 10 ++++++++++
@@ -38,13 +40,13 @@ index 7fa4fa4d..f0bd90e4 100644
 -SUBDIRS =         compat mpi cipher random src $(doc) tests
 +SUBDIRS =         compat mpi cipher random src $(doc) $(tests)
  
- EXTRA_DIST = autogen.sh autogen.rc README.GIT LICENSES      	           \
-              ChangeLog-2011 build-aux/ChangeLog-2011 doc/ChangeLog-2011    \
+ EXTRA_DIST = autogen.sh autogen.rc README.GIT LICENSES			   \
+ 	     ChangeLog-2011 build-aux/ChangeLog-2011 doc/ChangeLog-2011	   \
 diff --git a/configure.ac b/configure.ac
 index e8c8cd39..1a6b61e5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3231,6 +3231,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
+@@ -3777,6 +3777,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
  AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
  
  
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index ffe30e1455..ced8087ca9 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  359e1d01ad2eb9cd2db964ea96ef3712d0c2c649  libgcrypt-1.10.3.tar.bz2
-sha256  8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa  libgcrypt-1.10.3.tar.bz2
+sha1  dd2c68e0685bb99249efeeb06046fae15b5214ba  libgcrypt-1.11.0.tar.bz2
+sha256  09120c9867ce7f2081d6aaa1775386b98c2f2f246135761aae47d81f58685b9c  libgcrypt-1.11.0.tar.bz2
 # Locally calculated
-sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 2e4bf7448e..7a68a95c98 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.10.3
+LIBGCRYPT_VERSION = 1.11.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
