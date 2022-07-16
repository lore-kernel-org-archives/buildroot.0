Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F031FC43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DE1142481;
	Sat, 16 Jul 2022 15:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DE1142481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-rIZmT7sHpc; Sat, 16 Jul 2022 15:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DBFB41C1E;
	Sat, 16 Jul 2022 15:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DBFB41C1E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34A3A1BF4DA
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EAAA84E55
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EAAA84E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMwAogFKoeuc for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:05:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4A1684E51
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4A1684E51
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:05:53 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id f2so10534432wrr.6
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 08:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X3C7/empGtyuCFa7rEBkahEZG1unIBNz+g+Ljwl5IKE=;
 b=ZfTpyMZkUoEztVeo6CFyDYekManXys18t64e3EO3N5rwweQZF+gZejs9FueA2NHMEj
 sqsYqf1o3ByKca60gH2uc9D5FFTrxgm1PDjGLyM055z2DyspohkpCtDQpIO219/5A3GV
 r5GDAd5omlKpzm6++v9EiYVWpa+GsW2jTw44Kcj9R5xWrzyJjXJT5sq0rr2JYqtGmoeT
 Y1YDIGwsltrZm2dztY/hqRFADcw/8VKCZXhDlELYUWCzXo3S5WHzC5glC6Ck1B5DwzYd
 L2to/jUgB6N0aHcZS21SotKzT5A0F4D+hj+v1lBpyQAh8bXw0M+W9SA6VwcWh+CySt0p
 3Ung==
X-Gm-Message-State: AJIora9m6ExLqWNc5uH8gvGweQbf3pfIIAdcE3acos+OOJ+bP/nACoeU
 tZ7dYYt0ItXFgchWr1vwzDz0kPSvebI=
X-Google-Smtp-Source: AGRyM1t10ieaVKEoj8x+iwK25YqIgxba3+q1X6yhhqis2WPEPAnPY7R6cL0RSHAP5VFRYwcAXzVcJQ==
X-Received: by 2002:a05:6000:15c8:b0:21d:babe:e75c with SMTP id
 y8-20020a05600015c800b0021dbabee75cmr17494291wry.32.1657983951421; 
 Sat, 16 Jul 2022 08:05:51 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe883000000b0021d7ff34df7sm7625105wrm.117.2022.07.16.08.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 08:05:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 17:02:47 +0200
Message-Id: <20220716150247.753062-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X3C7/empGtyuCFa7rEBkahEZG1unIBNz+g+Ljwl5IKE=;
 b=G5XZhK5eiVQ4EhmzslQ9xE170C72jYztfLFUHdpEFuUkgFINzAOzwjw47xreh2j3qH
 fLq+gGrf3NEgkn7LRW28FSeydjuyY48ETT8RvyXRDTAxs2Gv9CwacGZ9wcVMqlJBr6Fz
 g1CF8Lde0pqCROTWo54D++m80pNtg1tF65Z3g0uj3LGJuN8Z9C+JFK96dT9pZtHESTZQ
 +eRyPaPPDi8j9fQYE2DDl0HuyxVtPSlwhrTJ8BpaBD965k+di204Tqnt0fhwG0DWaCdV
 uMi7tmfsMOV60RU5KjKmJHCT2JhTQBwU+bhYdJnWNM4ARE7iV6eRS8cvTMdnowWedIIB
 XYjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G5XZhK5e
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: bump to version 1.45
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

https://dev.gnupg.org/T5352
https://dev.gnupg.org/T5676
https://dev.gnupg.org/T5802

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tion-of-lock-obj-pub.native.h-for-cr.patch | 34 ----------------
 .../0002-build-Fix-disable-threads.patch      | 39 -------------------
 package/libgpg-error/libgpg-error.hash        |  8 ++--
 package/libgpg-error/libgpg-error.mk          |  2 +-
 4 files changed, 5 insertions(+), 78 deletions(-)
 delete mode 100644 package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
 delete mode 100644 package/libgpg-error/0002-build-Fix-disable-threads.patch

diff --git a/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch b/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
deleted file mode 100644
index 621f070ee2..0000000000
--- a/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7350874f6f62314af4c8ec1973c91d305a6f4ddc Mon Sep 17 00:00:00 2001
-From: David Michael <fedora.dm0@gmail.com>
-Date: Fri, 26 Mar 2021 16:06:50 +0900
-Subject: [PATCH] build: Fix generation of lock-obj-pub.native.h for cross
- build.
-
-* src/gen-lock-obj.sh: Capture echo output with quotes.
-
---
-
-Fixes-commit: 99ae862a96a569724f49a604ebb7d3f6d2c2d374
-Signed-off-by: David Michael <fedora.dm0@gmail.com>
-Upstream: 33593864cd54143db594c4237bba41e14179061c
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/gen-lock-obj.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
-index a710f0c..258eec6 100755
---- a/src/gen-lock-obj.sh
-+++ b/src/gen-lock-obj.sh
-@@ -38,7 +38,7 @@
- #     AWK=gawk ./gen-lock-obj.sh
- #
- 
--if test -n `echo -n`; then
-+if test -n "`echo -n`"; then
-     ECHO_C='\c'
-     ECHO_N=''
- else
--- 
-2.31.1
-
diff --git a/package/libgpg-error/0002-build-Fix-disable-threads.patch b/package/libgpg-error/0002-build-Fix-disable-threads.patch
deleted file mode 100644
index 6ed0f83070..0000000000
--- a/package/libgpg-error/0002-build-Fix-disable-threads.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7ede0d4ce19e0ed14cd1cec81ba7df4e467f1eeb Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Mon, 21 Jun 2021 12:16:20 +0900
-Subject: [PATCH] build: Fix --disable-threads.
-
-* src/gen-lock-obj.sh: Fix generating '}}}'.
-
---
-
-GnuPG-bug-id: 5495
-Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Fixes-commit: 1fb90a7da186ee2ee098a666f6f3a35bb1720e59
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-[Retrieved from:
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=220a427b4f997ef6af1b2d4e82ef1dc96e0cd6ff]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/gen-lock-obj.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
-index 258eec6..014667f 100755
---- a/src/gen-lock-obj.sh
-+++ b/src/gen-lock-obj.sh
-@@ -121,10 +121,10 @@ while test "$i" -lt $ac_mtx_size; do
-     fi
-     i=$(( i + 1 ))
- done
-+echo '}}}'
- fi
- 
- cat <<'EOF'
--}}}
- ##
- ## Local Variables:
- ## mode: c
--- 
-2.31.1
-
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 4e124941cd..b29ec37598 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,10 +1,10 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  5e620d71fc24d287a7ac2460b1d819074bb8b9bb  libgpg-error-1.42.tar.bz2
+sha1  fe724ed37b4935964059a47b7c64d5f8246659d8  libgpg-error-1.45.tar.bz2
 
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.42.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  fc07e70f6c615f8c4f590a8e37a9b8dd2e2ca1e9408f8e60459c67452b925e23  libgpg-error-1.42.tar.bz2
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.45.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA
+sha256  570f8ee4fb4bff7b7495cff920c275002aea2147e9a1d220c068213267f80a26  libgpg-error-1.45.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index babcbdaded..86dea6ad2a 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.42
+LIBGPG_ERROR_VERSION = 1.45
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
