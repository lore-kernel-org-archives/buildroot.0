Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD1DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 17:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3B860F57
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 17:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B3B860F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 142B54045D;
	Sat,  9 Oct 2021 17:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yrB_Lmse3LO2; Sat,  9 Oct 2021 17:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 706F340450;
	Sat,  9 Oct 2021 17:31:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A50A21BF5F8
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 17:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92D4D4025B
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 17:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlTKoKVM04Z7 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 17:31:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B764400A8
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 17:31:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e3so6600445wrc.11
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 10:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DoCJ/Iwz1t3Lqw4ZcHeKvr1jyEq7q1wFiJUCmAtxbf0=;
 b=K5u88ewrIAZCji4Q/OgxA1GZQq4wOgwYzT8ElGT9prClbQBn3+S1sLJ0mJhK/2xh9j
 EN8nkrzaXJBiuF164pL/7her3hw9fsguB/aC3BaIPUVWuIxbSTmC4g/OWQ9LNDIbbTzJ
 gQnRO+c2WRLl4d1gfyWrLU72HT+rJFHNTF/M8sinyaqv0M8FUvU86pX8F6ADR1zKQJ2D
 hk9Z7pnclTEQ4FWswYywHqJRa95qdYWdykKoRGgIdcB6yFYxkXbjZwNOwyTm5sviSkl1
 b7RlkXAXpIXAQxOrUce6S6ltktjfnn4/cTcojwShyflLi/4ovFsNbwEmRn9G/5ymOYef
 K3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DoCJ/Iwz1t3Lqw4ZcHeKvr1jyEq7q1wFiJUCmAtxbf0=;
 b=kBqafs2P4AmigjLNk86jJ3zhtKxKmCGLOXy+pDd5FAUYE0aHr1d+v0tlj8/Ncxft2n
 2khR5u+EmL3C5I/VGn00le7Z///Ym4+Hkm8LcFX8b3CuRmVnGB6nCTafAUQo0nK4lBBf
 RAXqvYY9hVaSzOYLqbFQJcudCER1XBFFfV3CCeRD1Bsd0DozqsqfbrtaQEow8t8Ca6F4
 lymsRZC5G0iYJ46MgnKBOINhJ5tti5D7anEFgFa44HdlpCyI1VPsv59Iq0UG6GFv9yx7
 vzbfF/pjgbfO2k6EwvkNZ6R+cvmO2+Xc4D/aXlC1L/GEY6yWeW/ZLrMqiZWD94tL0O8N
 PmOQ==
X-Gm-Message-State: AOAM533mWpy0bd2S6zbZuAT7CI17ljimZITE789PfBAAg4I8qV4z9dr9
 PDZLnpjIm1GdLFP6WGyL5X9APwoA/UA=
X-Google-Smtp-Source: ABdhPJyYpNJGzsjNzIGgoC8VZu1J2gQ2N0qVwyPt7DmGEgR7rTx/U6UFJYMmZgaKZtoAbzRAsEqayQ==
X-Received: by 2002:adf:f904:: with SMTP id b4mr12352841wrr.403.1633800676091; 
 Sat, 09 Oct 2021 10:31:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id 196sm2812200wme.20.2021.10.09.10.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 10:31:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 19:30:17 +0200
Message-Id: <20211009173017.674627-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/oracle-mysql: fix build with
 autoconf >= 2.70
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

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

autoheader: warning: missing template: CRAY_STACKSEG_END
autoheader: warning: Use AC_DEFINE([CRAY_STACKSEG_END], [], [Description])
autoreconf: error: /home/buildroot/autobuild/instance-2/output-1/host/bin/autoheader failed with exit status: 1
package/pkg-generic.mk:273: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/oracle-mysql-5.1.73/.stamp_configured' failed

Fixes:
 - http://autobuild.buildroot.org/results/e5329bcf166d46b2eb17f2bc727c0307bef5ed02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-alloca.m4-Remove-obsolete-Cray-supp.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch

diff --git a/package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch b/package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch
new file mode 100644
index 0000000000..f3dbde253c
--- /dev/null
+++ b/package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch
@@ -0,0 +1,50 @@
+From 0d8ab9b020870c62c216fca77e7f8bd3eeb710c3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Oct 2021 19:23:46 +0200
+Subject: [PATCH] config/ac-macros/alloca.m4: Remove obsolete Cray support
+
+Remove obsolete Cray support to avoid the following build failure since
+autoconf >= 2.70 and
+http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=15edf7fd8094fd14a89d9891dd72a9624762597a:
+
+autoheader: warning: missing template: CRAY_STACKSEG_END
+autoheader: warning: Use AC_DEFINE([CRAY_STACKSEG_END], [], [Description])
+autoreconf: error: /home/buildroot/autobuild/instance-2/output-1/host/bin/autoheader failed with exit status: 1
+package/pkg-generic.mk:273: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/oracle-mysql-5.1.73/.stamp_configured' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e5329bcf166d46b2eb17f2bc727c0307bef5ed02
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ config/ac-macros/alloca.m4 | 14 --------------
+ 1 file changed, 14 deletions(-)
+
+diff --git a/config/ac-macros/alloca.m4 b/config/ac-macros/alloca.m4
+index 8c730dd671f..eecb8249573 100644
+--- a/config/ac-macros/alloca.m4
++++ b/config/ac-macros/alloca.m4
+@@ -46,20 +46,6 @@ then
+    ALLOCA=alloca.o
+    AC_DEFINE(C_ALLOCA, 1)
+  
+- AC_CACHE_CHECK(whether alloca needs Cray hooks, ac_cv_os_cray,
+- [AC_EGREP_CPP(webecray,
+- [#if defined(CRAY) && ! defined(CRAY2)
+- webecray
+- #else
+- wenotbecray
+- #endif
+- ], ac_cv_os_cray=yes, ac_cv_os_cray=no)])
+- if test "$ac_cv_os_cray" = "yes"; then
+- for ac_func in _getb67 GETB67 getb67; do
+-   AC_CHECK_FUNC($ac_func, [AC_DEFINE_UNQUOTED(CRAY_STACKSEG_END, $ac_func)
+-   break])
+- done
+- fi
+  fi
+  AC_SUBST(ALLOCA)dnl
+ else
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
