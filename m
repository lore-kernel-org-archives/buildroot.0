Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A34C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 23:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B4B440BDD;
	Thu,  3 Nov 2022 23:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B4B440BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnezPt_URII7; Thu,  3 Nov 2022 23:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A47940BD3;
	Thu,  3 Nov 2022 23:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A47940BD3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D4BB1BF322
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 23:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61F8D40BD3
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 23:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61F8D40BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hs2fXThoMSWT for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 23:43:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DE8E40520
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DE8E40520
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 23:43:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id o30so2102320wms.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 16:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OuTSRryIGznO8UA4P7Oubfnl+xkdCrdzzK2r+3EUQPE=;
 b=F3+CQuLisDpT3jm2ZBAjFzRfS15RdI1hv7gaaLo9FheOlCVu3cC9Ualah9+6cG9hzt
 N9J1A2MD/o3ogrc3J+6wX9ljFsc5X4+QiKeqS5c9tsLnbLkK/KtdHsQP5DBp+n8KXMi0
 ImGA01HpDOt6ggMjZl2wftOzFK60MUc8X40wIMcjdXGUMVHhjxCQmuk25GBFy0XSXHnK
 cfCatNAKu+aMjOvvhg9pRalxWYiNkbVVzZbS8jpcg2iEDq8tqAtCLKfjH0OF0rjllQLg
 /E/Zz+JFplGljFF6xhEbk4z0rRpBUBuHoIjldMU152u9yaGsUPv+pKoGISyubDHjFCBs
 1EkA==
X-Gm-Message-State: ACrzQf2SK1WH/5sUBLvvrRKmAvgZAkc1J372Is/U46kma5uVDwlG5eZ6
 igMgjtk5linMHaJIdeZkF5nqZshLoUc=
X-Google-Smtp-Source: AMsMyM6tTPN+GfohgmM6nCcLz9mTTA2M/VvtyJ5f/bT8jd6le286HGrFK2nrxFKLaKH6/XfsRYH2qQ==
X-Received: by 2002:a05:600c:4b27:b0:3cf:8ec7:b8f with SMTP id
 i39-20020a05600c4b2700b003cf8ec70b8fmr3078291wmp.69.1667519027016; 
 Thu, 03 Nov 2022 16:43:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 b3-20020a05600c150300b003c6c1686b10sm1141232wmg.7.2022.11.03.16.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 16:43:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 00:43:42 +0100
Message-Id: <20221103234342.351104-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OuTSRryIGznO8UA4P7Oubfnl+xkdCrdzzK2r+3EUQPE=;
 b=m9OpOIQbHrDxDoYlifkIMEw2dUIAfYXOcwKskoVgM1tNIpuyNtbwy+//Mq+LSCGaEh
 w8u2bNi+zbqP83nggiD5953Myswl20uInDdfwW8/W/7TFDAscb0H0PE8nFI8Ny0AvgTB
 ruRxA1sb9s2Pn9R2Jh2EUViZdPvfef/2C22AMhCLWzbEqcHe0b91tum3mT4XRiSDG78W
 JR647b7fUAqsmV3QbsQlPx6oQJxsQL2d/K89hUMI338DvtmfVtqulrTVXIz2A1yW4Vp+
 eWxS9OpjXwcD/10SWmJXkOIsKC3l7asYHEPdL7ZHVsc53T9bNQL1v5hiE/NVQjcO2fFh
 FGQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=m9OpOIQb
Subject: [Buildroot] [PATCH 1/1] package/libqb: disable tests
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable tests to avoid the following build failure when check is
enabled:

libstat_wrapper.c:11:10: fatal error: gnu/lib-names.h: No such file or directory
   11 | #include <gnu/lib-names.h>
      |          ^~~~~~~~~~~~~~~~~

This build failure is raised since bump to version 2.0.6 in commit
2ee1bd7bb2e8d01f4ddca3fb1127ec729be1c9bf and
https://github.com/ClusterLabs/libqb/commit/78df90b180740712d0c90b6d982b78241cc99d72

Fixes:
 - http://autobuild.buildroot.org/results/450cfc36d4fd6dc71c138bec45f05b5a2d92a08d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../libqb/0001-Add-disable-tests-option.patch | 62 +++++++++++++++++++
 package/libqb/libqb.mk                        |  3 +
 2 files changed, 65 insertions(+)
 create mode 100644 package/libqb/0001-Add-disable-tests-option.patch

diff --git a/package/libqb/0001-Add-disable-tests-option.patch b/package/libqb/0001-Add-disable-tests-option.patch
new file mode 100644
index 0000000000..1afb05520d
--- /dev/null
+++ b/package/libqb/0001-Add-disable-tests-option.patch
@@ -0,0 +1,62 @@
+From 051d9cfe8f365e30affc6476ed79b9e04a6b15ad Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 4 Nov 2022 00:27:50 +0100
+Subject: [PATCH] Add --disable-tests option
+
+Add --disable-tests to allow the user to disable tests. As a
+side-effect, this will avoid the following build failure when check is
+found:
+
+libstat_wrapper.c:11:10: fatal error: gnu/lib-names.h: No such file or directory
+   11 | #include <gnu/lib-names.h>
+      |          ^~~~~~~~~~~~~~~~~
+
+This build failure is raised since version 2.0.5 and
+https://github.com/ClusterLabs/libqb/commit/78df90b180740712d0c90b6d982b78241cc99d72
+
+Fixes:
+ - http://autobuild.buildroot.org/results/450cfc36d4fd6dc71c138bec45f05b5a2d92a08d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ClusterLabs/libqb/pull/475]
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 5 +++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a08b1d2..6a710a0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -39,7 +39,11 @@ ACLOCAL_AMFLAGS		= -I m4
+ 
+ dist_doc_DATA		= COPYING INSTALL README.markdown
+ 
+-SUBDIRS			= include lib doxygen2man docs tools tests examples
++SUBDIRS			= include lib doxygen2man docs tools examples
++
++if ENABLE_TESTS
++SUBDIRS			+= tests
++endif
+ 
+ dist-clean-local:
+ 	rm -f .snapshot-version autoconf automake autoheader
+diff --git a/configure.ac b/configure.ac
+index ac44b7e..4946008 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -562,6 +562,11 @@ AC_ARG_WITH([force-sockets-config-file],
+ 	[ FORCESOCKETSFILE="$withval" ],
+ 	[ FORCESOCKETSFILE="$sysconfdir/libqb/force-filesystem-sockets" ])
+ 
++AC_ARG_ENABLE([tests],
++  [AS_HELP_STRING([--disable-tests],[disable tests])],,
++  [ enable_tests="yes" ])
++AM_CONDITIONAL([ENABLE_TESTS], [test x$enable_tests = xyes])
++
+ AC_ARG_ENABLE([install-tests],
+   [AS_HELP_STRING([--enable-install-tests],[install tests])],,
+   [ enable_install_tests="no" ])
+-- 
+2.35.1
+
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index 0f409fd646..65d68181ee 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -12,6 +12,9 @@ LIBQB_LICENSE = LGPL-2.1+
 LIBQB_LICENSE_FILES = COPYING
 LIBQB_CPE_ID_VENDOR = clusterlabs
 LIBQB_INSTALL_STAGING = YES
+# We're patching configure.ac
+LIBQB_AUTORECONF = YES
+LIBQB_CONF_OPTS = --disable-tests
 LIBQB_DEPENDENCIES = libxml2
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
