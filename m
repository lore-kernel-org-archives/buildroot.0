Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8397FCCF9FC
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31CA684173;
	Thu, 30 Oct 2025 08:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQOPdPoB-iss; Thu, 30 Oct 2025 08:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 120DE8414F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 120DE8414F;
	Thu, 30 Oct 2025 08:23:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A6F92A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F4CA613AF
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ah8in1mGzwH4 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A63C613B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A63C613B8
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48E2B87A0C; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:18:17 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: be8dcf0092edcc6b26fb7605bbcccceac73a7d76
X-Git-Newrev: ae919e24f8301085730512d93383b3d7a6a11eda
X-Patchwork-Hint: ignore
Message-Id: <20251030082229.48E2B87A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/poppler: security
 bump to v25.10.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ae919e24f8301085730512d93383b3d7a6a11eda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This contains many bug and security fixes since v22.12.0.
See the release notes: https://poppler.freedesktop.org/releases.html

In addition:
- Drop patch that has been applied upstream
- Update a few cmake configuration options that changed upstream

There is currently a build failure when enabling gpgme, so disable it
unconditionally for now.

Finally, this fixes the following vulnerabilities:
- CVE-2024-6239:
    A flaw was found in the Poppler's Pdfinfo utility. This issue occurs
    when using -dests parameter with pdfinfo utility. By using certain
    malformed input files, an attacker could cause the utility to crash,
    leading to a denial of service.
    https://www.cve.org/CVERecord?id=CVE-2024-6239

- CVE-2024-56378:
    libpoppler.so in Poppler through 24.12.0 has an out-of-bounds read
    vulnerability within the JBIG2Bitmap::combine function in
    JBIG2Stream.cc.
    https://www.cve.org/CVERecord?id=CVE-2024-56378

- CVE-2025-32364:
    A floating-point exception in the PSStack::roll function of Poppler
    before 25.04.0 can cause an application to crash when handling
    malformed inputs associated with INT_MIN.
    https://www.cve.org/CVERecord?id=CVE-2025-32364

- CVE-2025-32365:
    Poppler before 25.04.0 allows crafted input files to trigger out-of-
    bounds reads in the JBIG2Bitmap::combine function in JBIG2Stream.cc
    because of a misplaced isOk check.
    https://www.cve.org/CVERecord?id=CVE-2025-32365

- CVE-2025-43903:
    NSSCryptoSignBackend.cc in Poppler before 25.04.0 does not verify the
    adbe.pkcs7.sha1 signatures on documents, resulting in potential
    signature forgeries.
    https://www.cve.org/CVERecord?id=CVE-2025-43903

- CVE-2025-50420:
    An issue in the pdfseparate utility of freedesktop poppler v25.04.0
    allows attackers to cause an infinite recursion via supplying a
    crafted PDF file. This can lead to a Denial of Service (DoS).
    https://www.cve.org/CVERecord?id=CVE-2025-50420

- CVE-2025-52886:
    Poppler is a PDF rendering library. Versions prior to 25.06.0 use
    `std::atomic_int` for reference counting. Because `std::atomic_int` is
    only 32 bits, it is possible to overflow the reference count and
    trigger a use-after-free. Version 25.06.0 patches the issue.
    https://www.cve.org/CVERecord?id=CVE-2025-52886

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: mark commit as "security" in commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cdd1c5ca55620a4bdd1574d41fc5538d50f7359a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ineItem-open-Fix-crash-on-malformed-files.patch | 45 ----------------------
 package/poppler/poppler.hash                       |  4 +-
 package/poppler/poppler.mk                         | 24 +++++++-----
 3 files changed, 17 insertions(+), 56 deletions(-)

diff --git a/package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch b/package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch
deleted file mode 100644
index 478759e0cc..0000000000
--- a/package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From e5cc11e0b5b867f4705fd28ff1b981c1224be1cd Mon Sep 17 00:00:00 2001
-From: Albert Astals Cid <aacid@kde.org>
-Date: Wed, 17 May 2023 22:42:05 +0200
-Subject: [PATCH] OutlineItem::open: Fix crash on malformed files
-
-Fixes #1399
-
-Upstream: https://gitlab.freedesktop.org/poppler/poppler/-/commit/591235c8b6c65a2eee88991b9ae73490fd9afdfe
-[Thomas: backported to fix CVE-2023-34872]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- poppler/Outline.cc | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/poppler/Outline.cc b/poppler/Outline.cc
-index cbb6cb49..4c68be99 100644
---- a/poppler/Outline.cc
-+++ b/poppler/Outline.cc
-@@ -14,7 +14,7 @@
- // under GPL version 2 or later
- //
- // Copyright (C) 2005 Marco Pesenti Gritti <mpg@redhat.com>
--// Copyright (C) 2008, 2016-2019, 2021 Albert Astals Cid <aacid@kde.org>
-+// Copyright (C) 2008, 2016-2019, 2021, 2023 Albert Astals Cid <aacid@kde.org>
- // Copyright (C) 2009 Nick Jones <nick.jones@network-box.com>
- // Copyright (C) 2016 Jason Crain <jason@aquaticape.us>
- // Copyright (C) 2017 Adrian Johnson <ajohnson@redneon.com>
-@@ -483,8 +483,12 @@ void OutlineItem::open()
- {
-     if (!kids) {
-         Object itemDict = xref->fetch(ref);
--        const Object &firstRef = itemDict.dictLookupNF("First");
--        kids = readItemList(this, &firstRef, xref, doc);
-+        if (itemDict.isDict()) {
-+            const Object &firstRef = itemDict.dictLookupNF("First");
-+            kids = readItemList(this, &firstRef, xref, doc);
-+        } else {
-+            kids = new std::vector<OutlineItem *>();
-+        }
-     }
- }
- 
--- 
-2.41.0
-
diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index bb07b2ee6a..34f8bcd58f 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256  d9aa9cacdfbd0f8e98fc2b3bb008e645597ed480685757c3e7bc74b4278d15c0  poppler-22.12.0.tar.xz
+# Locally calculated after verifying GPG signature
+sha256  6b5e9bb64dabb15787a14db1675291c7afaf9387438cc93a4fb7f6aec4ee6fe0  poppler-25.10.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 776fb4d566..08214d38b4 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 22.12.0
+POPPLER_VERSION = 25.10.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = https://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
 POPPLER_LICENSE = GPL-2.0+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_CPE_ID_VENDOR = freedesktop
-# 0001-OutlineItem-open-Fix-crash-on-malformed-files.patch
-POPPLER_IGNORE_CVES += CVE-2023-34872
 POPPLER_INSTALL_STAGING = YES
 
 POPPLER_CONF_OPTS = \
@@ -24,6 +22,7 @@ POPPLER_CONF_OPTS = \
 	-DBUILD_MANUAL_TESTS=OFF \
 	-DENABLE_GTK_DOC=OFF \
 	-DENABLE_QT6=OFF \
+	-DENABLE_GPGME=OFF \
 	-DRUN_GPERF_IF_PRESENT=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
@@ -98,9 +97,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 POPPLER_DEPENDENCIES += zlib
-POPPLER_CONF_OPTS += -DENABLE_ZLIB=ON
+POPPLER_CONF_OPTS += -DENABLE_ZLIB_UNCOMPRESS=ON
 else
-POPPLER_CONF_OPTS += -DENABLE_ZLIB=OFF
+POPPLER_CONF_OPTS += -DENABLE_ZLIB_UNCOMPRESS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
@@ -112,9 +111,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 POPPLER_DEPENDENCIES += tiff
-POPPLER_CONF_OPTS += -DWITH_TIFF=ON
+POPPLER_CONF_OPTS += -DENABLE_LIBTIFF=ON
 else
-POPPLER_CONF_OPTS += -DWITH_TIFF=OFF
+POPPLER_CONF_OPTS += -DENABLE_LIBTIFF=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
@@ -126,9 +125,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 POPPLER_DEPENDENCIES += libnss
-POPPLER_CONF_OPTS += -DWITH_NSS3=ON
+POPPLER_CONF_OPTS += -DENABLE_NSS3=ON
 else
-POPPLER_CONF_OPTS += -DWITH_NSS3=OFF
+POPPLER_CONF_OPTS += -DENABLE_NSS3=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+POPPLER_DEPENDENCIES += lcms2
+POPPLER_CONF_OPTS += -DENABLE_LCMS=ON
+else
+POPPLER_CONF_OPTS += -DENABLE_LCMS=OFF
 endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
