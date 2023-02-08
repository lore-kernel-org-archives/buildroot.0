Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C0AC636D6
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 19:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D380C61184;
	Wed,  8 Feb 2023 19:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D380C61184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPoFDP_Paw9J; Wed,  8 Feb 2023 19:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C85386117C;
	Wed,  8 Feb 2023 19:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C85386117C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AE771BF2FE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8139F820C6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8139F820C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03vzNEBBF02V for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 19:31:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A96820C4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40A96820C4
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 19:31:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso2318253wms.3
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 11:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g4gQgxZxv1lYBjrhFLcbUmS60rWKoF3LGNHOVQZhcyM=;
 b=xHBXPGoy/eiQMjWI4nexspEFAb5yjhRfdK5qBxigz0ueTrq2GHXgTxUzyTku6TWnk+
 ldl6qX/26PWbmv9LK+lvRMGvS6eOrbnRhgFUaq96WKbJtkxiZDZO7bbBHObXhQVJWJlb
 wzUmUb34LBMY4KfcnCKjeJQRgG3Qz2Nw6FVJsELHxPfymE2ihdOsGuil3ttXAESLcXNn
 3hoJxqoE/d86nu370RNs6qkXxaRpTMHdufrYLjuVSoyq5U43wf9Yoiye087hDp/hVCUL
 gYvEODJuVqB/n7S3YTLC820+h869pCMNL1bGS8Hba9NopM/krkeDjvRvz0L2EuVzewCM
 n23g==
X-Gm-Message-State: AO0yUKXR5JSUoRVdce5xOZYsBCo3357w6474BNygEDp6CS+LrCgNaFbZ
 vzMD5ro+ZDKuKwhvLC+a2l3bh93FJiVedQ==
X-Google-Smtp-Source: AK7set8z1drFReiAn6cgv29ldRPDvcI59tSrXGAt8uY2mLzX5NxEwjpitPoCAUR7GFPIgYNgZ61tvg==
X-Received: by 2002:a05:600c:4494:b0:3dc:5a13:c7d1 with SMTP id
 e20-20020a05600c449400b003dc5a13c7d1mr10044068wmo.16.1675884697165; 
 Wed, 08 Feb 2023 11:31:37 -0800 (PST)
Received: from localhost.localdomain (pop.92-184-112-65.mobile.abo.orange.fr.
 [92.184.112.65]) by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c220400b003dfe8c4c497sm2893637wml.39.2023.02.08.11.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 11:31:36 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 20:31:33 +0100
Message-Id: <510d3c4ff7dfdb844f62433de885fc9caa9f140e.1675884676.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675884676.git.yann.morin.1998@free.fr>
References: <cover.1675884676.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g4gQgxZxv1lYBjrhFLcbUmS60rWKoF3LGNHOVQZhcyM=;
 b=avvTcKvMRNPGIZIoQS/lA2IjFSY7vyGVEKN30biryXCAu0HOkpBGNBsUTuShLgnKce
 DNhZnSLzfbFCf147H6a64NOyn02LwX8LHRJ5hiuIFuvIM8Jd4FbPbHOUgXHD7nJfIjJ4
 pjpbrtDM0rmvSkHKyb4+Pa7FY2/akfMdYotmffohtu+p68hIg6KtUNxpGjJw/7NuKucA
 G5eGe3P101fJOkxrVImlIDQZwX//vtTAXpoUAlRylmXomMAALWzlrLfrcn3dqynGWVIb
 HMLvxCq7oaQI+q3ooOYnU5iolmVlk8Cl0KQOYiKpz4Kl/oes0DFLLjdyfQUCt2R52ZVV
 cr+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=avvTcKvM
Subject: [Buildroot] [PATCH 1/3 v2] package/dmalloc: convert existing patch
 to git format
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
 .../0001-configure-fix-build-on-mips.patch    | 90 +++++++++++++++++++
 package/dmalloc/0001-mips.patch               | 45 ----------
 2 files changed, 90 insertions(+), 45 deletions(-)
 create mode 100644 package/dmalloc/0001-configure-fix-build-on-mips.patch
 delete mode 100644 package/dmalloc/0001-mips.patch

diff --git a/package/dmalloc/0001-configure-fix-build-on-mips.patch b/package/dmalloc/0001-configure-fix-build-on-mips.patch
new file mode 100644
index 0000000000..9b1525d0d1
--- /dev/null
+++ b/package/dmalloc/0001-configure-fix-build-on-mips.patch
@@ -0,0 +1,90 @@
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
+[Fabrice: Updated for 5.6.5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[yann.morin.1998@free.fr: make it a git-formatted patch]
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
