Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F271C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37C8640C2B;
	Wed,  8 Feb 2023 16:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37C8640C2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggz58U7y8Qr4; Wed,  8 Feb 2023 16:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37CE940C29;
	Wed,  8 Feb 2023 16:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37CE940C29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 003F61BF8A8
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1941140C22
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1941140C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJUbM_MX1_Bn for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:20:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 166994014B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 166994014B
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:20:18 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1889102wmb.5
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 08:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QtYf3Wsm75Gzx8iuB1x5SPrCWv/NNnmeENpVpyvIEOA=;
 b=eKHDz7ZSKpUip6eDAdjZDks8OlCz0j+gIWrnIMzE+qch4dAFPmZFxbaXY43tPRtZJX
 nLpnBdKiFbg6wOg4REocdDwq1HeDQYuC6vDC7jHs8PZwlcHwtBK1WNHmk4heLiuhjg4z
 hIrCmAPAd0GHdofniIl7SpYPPrhyC2WLrV9CLVyveRV8ok/XvCVi7ZnpC8E3p4LSDg75
 tlgyz1lyC+o5yh9YvhrRl1qx+Ifj05PWf/sltN5dexJXS4GrnztX4qGgR+xVWWR3RUiA
 lsDt9BOoAhPSzylntgyRuP+ASOZvDiGinceciN4PDOarAULdauC4LGDet3U+mPA+k66Y
 tGsQ==
X-Gm-Message-State: AO0yUKWE88hnjB6zgURYRbBEJmBfNKiJf3sDjI3m2G/M1O1n//fOFo6Q
 SnnMFg2PbeEr10KQOXueNJckNf1PWvyLxg==
X-Google-Smtp-Source: AK7set+6+V+8r1DETBi6EUks7PM+6bfjD96G0CALKRdSaJ/mFvJS2IgurlZBKw5dgOCqVjc/xgWOBA==
X-Received: by 2002:a05:600c:3ba9:b0:3df:ea09:fcc9 with SMTP id
 n41-20020a05600c3ba900b003dfea09fcc9mr2035914wms.7.1675873217363; 
 Wed, 08 Feb 2023 08:20:17 -0800 (PST)
Received: from localhost.localdomain (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c169400b003dc54eef495sm2167672wmn.24.2023.02.08.08.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 08:20:17 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 17:20:14 +0100
Message-Id: <a05fdd9655c1a39952ccdb45c057b4468bdcf8f6.1675873210.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675873210.git.yann.morin.1998@free.fr>
References: <cover.1675873210.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QtYf3Wsm75Gzx8iuB1x5SPrCWv/NNnmeENpVpyvIEOA=;
 b=J98DLR1EdqawdhqjRKmKsK+qgeJcNp1M2COdVYd48CmuQ/DbygFj9G2tHAZYyR82wD
 wX0ik20yccBup/0CYJySMouCJoEkVAGT96mGxTu7Mh5k/IX1+dvM6kHsemzk0wtDAZ1B
 M3Wkmn82KXJ2y8O6jj2E0KRSatAPX9cAjroyeu4YTmyeqcBFq/HnrD5ZT09ZN7/HuTqG
 WUEism36ryVpzQtC2rkSdpx3uVzEPx/R0xCXlO8E5UzA/BkXs18DW4vZA3hWAX2V/QLG
 t6LRUOMW+Roh3RDaKgT6rfrFEqxpF5aTNvYuWzBODHM7FDbNxmLU0nbAxqDv6BQiAHLr
 uNjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J98DLR1E
Subject: [Buildroot] [PATCH 1/3] package/dmalloc: convert existing patch to
 git format
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We're going to add more patches, so let's cleanup our historical
baggage...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-configure-fix-build-on-mips.patch    | 87 +++++++++++++++++++
 package/dmalloc/0001-mips.patch               | 45 ----------
 2 files changed, 87 insertions(+), 45 deletions(-)
 create mode 100644 package/dmalloc/0001-configure-fix-build-on-mips.patch
 delete mode 100644 package/dmalloc/0001-mips.patch

diff --git a/package/dmalloc/0001-configure-fix-build-on-mips.patch b/package/dmalloc/0001-configure-fix-build-on-mips.patch
new file mode 100644
index 0000000000..90a6ad7f54
--- /dev/null
+++ b/package/dmalloc/0001-configure-fix-build-on-mips.patch
@@ -0,0 +1,87 @@
+From af6adb3f5f05be4faa88a5aa83296c388c8085e7 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 8 Feb 2023 12:30:10 +0100
+Subject: [PATCH] configure: fix build on mips
+
+This patch is a historical baggage that Buildroot has carried for ages
+(since 2006), and the reason for it are notentirely clear.
+
+Since dmalloc is pretty tricky, and as this patch has not been
+identified as causing issues, we keep it; we just add the configure.ac
+patchlet to match the one in configure.
+
+As for the title, the original patch was named dmalloc-mips.patch, so
+presumably it fixes some mips issue; let's title the commit that way.
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ configure    |  4 ++--
+ configure.ac |  2 +-
+ return.h     | 16 +++-------------
+ 3 files changed, 6 insertions(+), 16 deletions(-)
+
+diff --git a/configure b/configure
+index d52a1e8..c18dfb2 100755
+--- a/configure
++++ b/configure
+@@ -5413,8 +5413,8 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking return.h macros work" >&5
+ $as_echo_n "checking return.h macros work... " >&6; }
+ if test "$cross_compiling" = yes; then :
+-   $as_echo "#define RETURN_MACROS_WORK 0" >>confdefs.h
+- { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++   $as_echo "#define RETURN_MACROS_WORK 1" >>confdefs.h
++ { $as_echo "$as_me:${as_lineno-$LINENO}: result: assume yes (cross-compiling)" >&5
+ $as_echo "no" >&6; }
+ 
+ else
+diff --git a/configure.ac b/configure.ac
+index a5295f1..9740fdc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -705,7 +705,7 @@ int main()
+ ])],
+ [ AC_DEFINE(RETURN_MACROS_WORK, 1) AC_MSG_RESULT([yes]) ],
+ [ AC_DEFINE(RETURN_MACROS_WORK, 0) AC_MSG_RESULT([no]) ],
+-[ AC_DEFINE(RETURN_MACROS_WORK, 0) AC_MSG_RESULT([no]) ]
++[ AC_DEFINE(RETURN_MACROS_WORK, 1) AC_MSG_RESULT([assume yes (cross-compiling)]) ]
+ )
+ 
+ ##############################################################################
+diff --git a/return.h b/return.h
+index 9d3f5f1..d916c7a 100644
+--- a/return.h
++++ b/return.h
+@@ -117,26 +117,16 @@
+ /*************************************/
+ 
+ /*
+- * For DEC Mips machines running Ultrix
++ * For Mips machines running Linux
+  */
+ #if __mips
+ 
+-/*
+- * I have no idea how to get inline assembly with the default cc.
+- * Anyone know how?
+- */
+-
+-#if 0
+-
+ /*
+  * NOTE: we assume here that file is global.
+  *
+- * $31 is the frame pointer.  $2 looks to be the return address but maybe
+- * not consistently.
++ * $31 is the return address.
+  */
+-#define GET_RET_ADDR(file)	asm("sw $2, file")
+-
+-#endif
++#define GET_RET_ADDR(file)	asm("sw $31, %0" : "=m" (file))
+ 
+ #endif /* __mips */
+ 
+-- 
+2.25.1
+
diff --git a/package/dmalloc/0001-mips.patch b/package/dmalloc/0001-mips.patch
deleted file mode 100644
index 3150d030ec..0000000000
--- a/package/dmalloc/0001-mips.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-[Fabrice: Updated for 5.6.5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---- a/configure
-+++ b/configure
-@@ -7107,7 +7107,7 @@
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking return.h macros work" >&5
- $as_echo_n "checking return.h macros work... " >&6; }
- if test "$cross_compiling" = yes; then :
--   $as_echo "#define RETURN_MACROS_WORK 0" >>confdefs.h
-+   $as_echo "#define RETURN_MACROS_WORK 1" >>confdefs.h
-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
- $as_echo "no" >&6; }
- 
---- a/return.h
-+++ b/return.h
-@@ -106,26 +106,16 @@
- /*************************************/
- 
- /*
-- * For DEC Mips machines running Ultrix
-+ * For Mips machines running Linux
-  */
- #if __mips
- 
- /*
-- * I have no idea how to get inline assembly with the default cc.
-- * Anyone know how?
-- */
--
--#if 0
--
--/*
-  * NOTE: we assume here that file is global.
-  *
-- * $31 is the frame pointer.  $2 looks to be the return address but maybe
-- * not consistently.
-+ * $31 is the return address.
-  */
--#define GET_RET_ADDR(file)	asm("sw $2, file")
--
--#endif
-+#define GET_RET_ADDR(file)	asm("sw $31, %0" : "=m" (file))
- 
- #endif /* __mips */
- 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
