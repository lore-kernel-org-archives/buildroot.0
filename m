Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA59CCD194
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 11:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3143561780;
	Thu, 16 Oct 2025 11:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9zkoeW09OQu; Thu, 16 Oct 2025 11:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59E9960ABD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59E9960ABD;
	Thu, 16 Oct 2025 11:59:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B0A993E
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 11:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E2AF60A45
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 11:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzUpU_IQmbnZ for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 11:58:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 299EA60905
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 299EA60905
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 299EA60905
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 11:58:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso4952055e9.3
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 04:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760615935; x=1761220735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9oV3ufRUZXuyshPrxen8ZwzalE4aIvWCh6a03TYM5lw=;
 b=R4FDm7nryq8C26L56Ziy5P8XSyp/XpwdkZy1JxwOfMlRI7I9xaPebgJB4SWCBq/1RX
 j2CIf/hDNNTKcgYwykDoWWDY6QWaCe39IKK2mSznfIQLatzLIIwc3MWqyTqc92Z1vqpQ
 fQy3FBQWzgCrKS8MQ04Tm3SWqUuF1rqbXLKRNlRTG/lnpXKZCkaDv75HNHCpXUSSRLZo
 72EYGmDvpAi/Tp6wgASXph8JjMrAOi5tqekp/CE6vNtfPwXdqd+P1e6HVB9aHG/mOFLV
 wQPp+GzWYR+BiQefgkBVKny9SmKl470Pxxap49c6tq6hhlngUc9zmBcF6RFQ3m1bWM9O
 izog==
X-Gm-Message-State: AOJu0Ywr8fq9Yj8U7f8vx0MK/+7C0CmrBzQi7VBq7uoh1kiKMev+yIxI
 sytrA++U4FSp+N8PR2iLBjMscxO89M4uGwTxjirHNuPPWGERoQF5yMTEPtmRFH8lAflKQrvLbv/
 zrXQ4
X-Gm-Gg: ASbGncujzV2EPCwUJ0Jv+DwK6jvJ6Im0mmDmEYd1bdZCrACxZYtNy5eyQsXun9ueFsd
 uKZKRDLklcUz+SlaJ3AtaOXf+YFtO8VemCgMw+XvOeylLXZo4muvDqzv0c9k8bgZXsbHyu6yd3j
 tFEOcflFcwxqXPo1s34Dr3L3lrOf9IuxqaymqQixjUuFvcbE+x34JsMe8kZt0D3o1k2CaIhNYdX
 lIEa8fCSu8VRILXZLBytsw6IDU3jtHSFLSqwwHLh3mg9qwI/GMdp8Y6DtE8s5UrtA8CRZybtFer
 NQ+Smw6iGONXZbPIqLPa3XRLRA08/XATo9btXre9KI4IjcQHwKb2mw71K9ZopVgdwQgZHRTvWlP
 ZUqQ7zOPep7nhw63+UBvkTnjPpUJw1EIhs3zQUOLcCwvbqvfHGq3vBUDLsYDnl2wuBpFBDAk+oU
 O6N5gk9J4qpA==
X-Google-Smtp-Source: AGHT+IGA4KVQWHv3avU2baiyzxHOyxq4LALjTnqd2i6/lxk6CccaIbWDs+cjlncGCdhRvPHs9A3eqg==
X-Received: by 2002:a05:600c:c4a8:b0:46e:4921:9443 with SMTP id
 5b1f17b1804b1-46fa9b1b277mr248637005e9.37.1760615934629; 
 Thu, 16 Oct 2025 04:58:54 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144239f4sm22690485e9.2.2025.10.16.04.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 04:58:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 16 Oct 2025 13:56:01 +0200
Message-ID: <20251016115601.228048-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760615935; x=1761220735; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9oV3ufRUZXuyshPrxen8ZwzalE4aIvWCh6a03TYM5lw=;
 b=JRFAK9sT0GyJvPCuqnoavy9Ti1jiNvO9kHnCV2yIYVSxTkh4QUpz9BFeBswOufagpE
 A/E3no8viyvTkG0T8B4edHGguhK1QTVxkUCdlNykHT7zxNEF8/fCJrhmIb7iV/LP+Weq
 EyJyvT0IolitZ/y+YI4suIec52Nn1D/AGfqQpOsd96JbG4iss6JRkwd34Xd2vs6dm5Yf
 SrHO2UEEYTlFV/8DcHRX7E138lNcb2ts1gEPvlrAsvXtf0HV8nofd1rEdAWiifRlFLPQ
 cwxODZ2+B857koeP1iBibOGaSa8pfT0muICpO457AFFDwZB/bTSPrPV8zkr2EwwuqM12
 BQnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JRFAK9sT
Subject: [Buildroot] [PATCH] package/poppler: bump to v25.10.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...em-open-Fix-crash-on-malformed-files.patch | 45 -------------------
 package/poppler/poppler.hash                  |  4 +-
 package/poppler/poppler.mk                    | 24 ++++++----
 3 files changed, 17 insertions(+), 56 deletions(-)
 delete mode 100644 package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch

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
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
