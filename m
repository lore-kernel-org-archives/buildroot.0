Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0802C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 10:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E59C40022;
	Wed, 29 Dec 2021 10:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tE6sre9cdlnM; Wed, 29 Dec 2021 10:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA65D4014D;
	Wed, 29 Dec 2021 10:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D03F1BF424
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 10:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2351882560
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 10:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WbylZRB7tVL for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 10:42:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8FA08254D
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 10:42:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q16so43597951wrg.7
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 02:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tuf5UgRSsJcKDAWO57Tk7sZK4ndSAZM+tFz94du2mds=;
 b=nN5ZLv9QurLH2seDYgD0SO8eFmxV1An/hIxCtY1XaBUs4XFIykBXf7Epv07Y1dJBnr
 U/wOkS1SJnhJCw86RIbGIFO3GX0oZGgses5MiKffCtITTbhO2dITuDfy2Oz3O79BwC0v
 nKzXU5PYmT2h71Uw0eqd0I3/U0NjG0Gr5p8Lqg7gDNsKGUuW3fNKIHLSmr+fYjOAo6Ow
 sUMTdKykb3fnl8rbs2nm9jFBGen5n9pOMCu3i962rIb+av9xHismglzVjDYGE+Z51A02
 TOyyhAu3HF7Gv4uIXmT+MLGyBNCdwzA7UdJHujj7fvjIrPUubc+dDkv5kPVN0BY8qBSH
 D0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tuf5UgRSsJcKDAWO57Tk7sZK4ndSAZM+tFz94du2mds=;
 b=QlgZ+4FwjZzXlZW8C5gTdaV2GAUWYDAfJSNPh0sw0+NaxO6G1/zhuodLcsQiWkdzG1
 yDpxX3gqB7PFbH/s1G/Cj/mJ0QRMIYTGu384F0vqbAv6beGZ6XV7Gx1QGo6i1+aXqsCo
 jtCX0tTpLZQj6pOJAtHOWVpJGFkJVjtXa+0wosmVhEIPxopTHi8XYmThwtN/DQ2YBZep
 dinRhJ30/38uNsjY0XcnIxkGqeAy1Cnop0l6WJJitcIqY2dNaO6z9h+jHek+mRLpv/UH
 j3xYjrns2STYjGo7VDuq4z2kZ6PLIHbSgZgCABaYHCYHeFcEmNQfjYyH+6cNLR67nnq0
 pfuA==
X-Gm-Message-State: AOAM533qhdcE5wflSiv7SuN36JOLfd+2adbpNBSeutqPTQOTxjpnewL5
 0O50wNKcSdrmvEEgPLOR3ObVpdPq64g=
X-Google-Smtp-Source: ABdhPJw1fRZnNLGn7fwdg++x3ODTa98Qvww5CB/J4W76eEiP6oFSwFnW8MMHv8q3blEJyd7zFGU1PA==
X-Received: by 2002:a05:6000:184f:: with SMTP id
 c15mr20456229wri.73.1640774554751; 
 Wed, 29 Dec 2021 02:42:34 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id f10sm11921817wmg.43.2021.12.29.02.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 02:42:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 11:41:49 +0100
Message-Id: <20211229104149.560018-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qpdf: bump to version 10.5.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version and C++14 now required)
- openssl is an optional dependency since version 10.0.0 and
  https://github.com/qpdf/qpdf/commit/0f2507234fbe3bd305404b1267607b9900857523
- wchar is not mandatory since version 10.0.0 and
  https://github.com/qpdf/qpdf/commit/2100b4ce152e9c70b3ce8760112d5a24ead4e52d
- atomic is needed since version 10.0.0 and
  https://github.com/qpdf/qpdf/commit/c5c1a028cdd3cf345046c46963fb0fdacfb2c33c
- C++14 is required since version 10.2.0 and
  https://github.com/qpdf/qpdf/commit/1b3f84f967daf9a668a5b1f5337d5d3d96e9112b

http://qpdf.sourceforge.net/files/qpdf-manual.html#ref.release-notes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups-filters/Config.in                |  8 +-
 ...ests-cxx11.cc-fix-build-with-gcc-4.8.patch | 38 --------
 ...to-be-safe-if-downstream-write-fails.patch | 86 -------------------
 package/qpdf/Config.in                        |  9 +-
 package/qpdf/qpdf.hash                        |  4 +-
 package/qpdf/qpdf.mk                          | 14 ++-
 6 files changed, 21 insertions(+), 138 deletions(-)
 delete mode 100644 package/qpdf/0001-libtests-cxx11.cc-fix-build-with-gcc-4.8.patch
 delete mode 100644 package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch

diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index 9e4e37ca6b..32381e6c1f 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -4,10 +4,10 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP # qpdf
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR # libglib2, qpdf
+	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qpdf
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
@@ -31,8 +31,8 @@ config BR2_PACKAGE_CUPS_FILTERS
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
 
-comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 4.8"
+comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/qpdf/0001-libtests-cxx11.cc-fix-build-with-gcc-4.8.patch b/package/qpdf/0001-libtests-cxx11.cc-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 76504c7475..0000000000
--- a/package/qpdf/0001-libtests-cxx11.cc-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e70c2605a11d12a8eeee3e7eec46077956e11e1f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 17 Feb 2020 22:36:08 +0100
-Subject: [PATCH] libtests/cxx11.cc: fix build with gcc 4.8
-
-Build fails on gcc 4.8 since version 9.1.1 and commit
-752416554086d5d34323bc14164d5084db83cfbd:
-
-libtests/cxx11.cc: In function 'void do_regex()':
-libtests/cxx11.cc:347:42: error: 'strlen' is not a member of 'std'
-     std::cregex_iterator m3(str7, str7 + std::strlen(str7), expr4);
-                                          ^
-
-To fix the build failure, add missing include on cstring
-
-Fixes:
- - http://autobuild.buildroot.org/results/ad7fb68ae87850a85509eed80fd0cae8721b10c5
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/qpdf/qpdf/pull/400]
----
- libtests/cxx11.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libtests/cxx11.cc b/libtests/cxx11.cc
-index fa1dc6b..91ed7b1 100644
---- a/libtests/cxx11.cc
-+++ b/libtests/cxx11.cc
-@@ -1,5 +1,6 @@
- #include <iostream>
- #include <cassert>
-+#include <cstring>
- #include <functional>
- #include <type_traits>
- #include <cstdint>
--- 
-2.24.1
-
diff --git a/package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch b/package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch
deleted file mode 100644
index 70017350f2..0000000000
--- a/package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From dc92574c10f3e2516ec6445b88c5d584f40df4e5 Mon Sep 17 00:00:00 2001
-From: Jay Berkenbilt <ejb@ql.org>
-Date: Mon, 4 Jan 2021 11:55:28 -0500
-Subject: [PATCH] Fix some pipelines to be safe if downstream write fails (fuzz
- issue 28262)
-
-[Retrieved (and updated to remove updates on ChangeLog and fuzz) from:
-https://github.com/qpdf/qpdf/commit/dc92574c10f3e2516ec6445b88c5d584f40df4e5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ChangeLog                     |   6 ++++++
- fuzz/qpdf_extra/28262.fuzz    | Bin 0 -> 40395 bytes
- libqpdf/Pl_AES_PDF.cc         |   2 +-
- libqpdf/Pl_ASCII85Decoder.cc  |   7 +++++--
- libqpdf/Pl_ASCIIHexDecoder.cc |   6 ++++--
- libqpdf/Pl_Count.cc           |   2 +-
- 6 files changed, 17 insertions(+), 6 deletions(-)
- create mode 100644 fuzz/qpdf_extra/28262.fuzz
-
-diff --git a/libqpdf/Pl_AES_PDF.cc b/libqpdf/Pl_AES_PDF.cc
-index 18cf3a4d..2865f804 100644
---- a/libqpdf/Pl_AES_PDF.cc
-+++ b/libqpdf/Pl_AES_PDF.cc
-@@ -238,6 +238,6 @@ Pl_AES_PDF::flush(bool strip_padding)
- 	    }
- 	}
-     }
--    getNext()->write(this->outbuf, bytes);
-     this->offset = 0;
-+    getNext()->write(this->outbuf, bytes);
- }
-diff --git a/libqpdf/Pl_ASCII85Decoder.cc b/libqpdf/Pl_ASCII85Decoder.cc
-index b8df3e87..9d9f6704 100644
---- a/libqpdf/Pl_ASCII85Decoder.cc
-+++ b/libqpdf/Pl_ASCII85Decoder.cc
-@@ -119,10 +119,13 @@ Pl_ASCII85Decoder::flush()
- 
-     QTC::TC("libtests", "Pl_ASCII85Decoder partial flush",
- 	    (this->pos == 5) ? 0 : 1);
--    getNext()->write(outbuf, this->pos - 1);
--
-+    // Reset before calling getNext()->write in case that throws an
-+    // exception.
-+    auto t = this->pos - 1;
-     this->pos = 0;
-     memset(this->inbuf, 117, 5);
-+
-+    getNext()->write(outbuf, t);
- }
- 
- void
-diff --git a/libqpdf/Pl_ASCIIHexDecoder.cc b/libqpdf/Pl_ASCIIHexDecoder.cc
-index f20a9769..7845268e 100644
---- a/libqpdf/Pl_ASCIIHexDecoder.cc
-+++ b/libqpdf/Pl_ASCIIHexDecoder.cc
-@@ -97,12 +97,14 @@ Pl_ASCIIHexDecoder::flush()
- 
-     QTC::TC("libtests", "Pl_ASCIIHexDecoder partial flush",
- 	    (this->pos == 2) ? 0 : 1);
--    getNext()->write(&ch, 1);
--
-+    // Reset before calling getNext()->write in case that throws an
-+    // exception.
-     this->pos = 0;
-     this->inbuf[0] = '0';
-     this->inbuf[1] = '0';
-     this->inbuf[2] = '\0';
-+
-+    getNext()->write(&ch, 1);
- }
- 
- void
-diff --git a/libqpdf/Pl_Count.cc b/libqpdf/Pl_Count.cc
-index 8077092a..c35619b8 100644
---- a/libqpdf/Pl_Count.cc
-+++ b/libqpdf/Pl_Count.cc
-@@ -27,8 +27,8 @@ Pl_Count::write(unsigned char* buf, size_t len)
-     if (len)
-     {
- 	this->m->count += QIntC::to_offset(len);
--	getNext()->write(buf, len);
- 	this->m->last_char = buf[len - 1];
-+	getNext()->write(buf, len);
-     }
- }
- 
diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index 56a96e4f41..eadfc5ea92 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_QPDF
 	bool "qpdf"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
 	help
@@ -15,6 +14,6 @@ config BR2_PACKAGE_QPDF
 
 	  http://qpdf.sourceforge.net/
 
-comment "qpdf needs a toolchain w/ C++, wchar, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+comment "qpdf needs a toolchain w/ C++, gcc >= 5"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 050c9d9a4c..08a048f2ed 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/qpdf/files/qpdf/9.1.1/qpdf-9.1.1.sha512/download
-sha512  008a11fef663a57ca173631f2053988023babea6c333cfe01db0ef955c8cd36d387ed9f2039f55bd5f9ca94c7a8e400461a09a15c5f89e03bc0817fdd0d3d585  qpdf-9.1.1.tar.gz
+# From https://sourceforge.net/projects/qpdf/files/qpdf/10.5.0/qpdf-10.5.0.sha256/download
+sha256  88257d36a44fd5c50b2879488324dd9cafc11686ae49d8c4922a4872203ce006  qpdf-10.5.0.tar.gz
 # Locally computed:
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
 sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index c96bf6bf2e..8e0769059d 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPDF_VERSION = 9.1.1
+QPDF_VERSION = 10.5.0
 QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
@@ -14,8 +14,9 @@ QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
 QPDF_CONF_OPTS = --with-random=/dev/urandom
 
-# 0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch
-QPDF_IGNORE_CVES += CVE-2021-36978
+ifeq ($(BR2_USE_WCHAR),)
+QPDF_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DQPDF_NO_WCHAR_T"
+endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 QPDF_CONF_OPTS += --enable-crypto-gnutls
@@ -24,4 +25,11 @@ else
 QPDF_CONF_OPTS += --disable-crypto-gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+QPDF_CONF_OPTS += --enable-crypto-openssl
+QPDF_DEPENDENCIES += openssl
+else
+QPDF_CONF_OPTS += --disable-crypto-openssl
+endif
+
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
