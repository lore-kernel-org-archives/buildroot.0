Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AE6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B73684D6A;
	Fri, 17 Dec 2021 21:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4M9w0HT-SUy; Fri, 17 Dec 2021 21:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A0C84D61;
	Fri, 17 Dec 2021 21:41:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A19491BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 987E060EC4
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTckKR7gbVLt for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:41:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28EE160EAA
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:41:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s1so6516796wrg.1
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 13:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nbiklb84fYrnvYmBMEP24dW82WetG0I0kxfp3vp/P6M=;
 b=g335ohBoyHEYBa8Ns3vFDa1HHO/YQT/YrUOpuSmNbwAVpyBq5hWDdrxmiuAmhYUwRo
 XhK3xoO03fdBGLw+G2jphF0EmsPcoawPPtQmYL8MO7UAyJrte0+B3eIYEX8BL8TKngfm
 +sjudyoCtoKtZGVv/pbc+8K3FmDVYLn1ox9+Dh02o8xJGXVwAhIsevhYtbK5ztEtYGHg
 3kw3ap8GIAeIZWTHrpah/wN1n697uEzkGsNuaKqqIo6aj7tNv+LLDMxLZSaEa4gu+T9K
 eeehskslrlVNVLipWXNiWmIELalITADuOew/vglrSAIJY+Z1qOk2TRO0VD+A7FZsZtTb
 vYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nbiklb84fYrnvYmBMEP24dW82WetG0I0kxfp3vp/P6M=;
 b=HW42SrEIvezA/hkhupjt+5kUVNQP7psf3EGABaCLhXBufkwv8jVFymZbHBKj9Odmqb
 A5/QPgzWQJS2ixFn4c+/reZ4VK7r4uixnx9G5yhiE2geLyqoZ+/eVG4v83+IwAK0clY5
 ndS/JNd7VCxyaY8po7gCgZ316ZcdXblCk60Z3YGDi0FiP3HGZls9XEGTTjNYx1L5GXpG
 BhhAmr8so1IJM275qbs5EKnOK93S6OkbPq/5tCuGGoGEaenXxqyr2f8cwD4vBM9Fo8cv
 XkApFn41dcPt4GziRwEloFOS25PSxH9+sLN/qhSrVfETFpXhjYIHsvxKqGEpXYITI1L5
 YcpQ==
X-Gm-Message-State: AOAM530WEWFDrTY+UVJcDgPfxYuWvedJ2fE3TVpbAfEQeaaSxk7R7Nos
 w5hj3fRR3flD6+JrmHruLl+5b4DPCCYjFA==
X-Google-Smtp-Source: ABdhPJwHT2rprJd8i2YJnjdW27j3AAyXKDwEEci2goB7rnLz6gB99RTFg4xm7/7+d3kItHlr7dsHUw==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr4014096wrq.626.1639777315169; 
 Fri, 17 Dec 2021 13:41:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id 138sm11527402wma.17.2021.12.17.13.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 13:41:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:41:21 +0100
Message-Id: <20211217214121.101414-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lapack: fix CVE-2021-4048
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
Cc: Benjamin Kamath <kamath.ben@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-4048: An out-of-bounds read flaw was found in the CLARRV,
DLARRV, SLARRV, and ZLARRV functions in lapack through version 3.10.0,
as also used in OpenBLAS before version 0.3.18. Specially crafted inputs
passed to these functions could cause an application using lapack to
crash or possibly disclose portions of its memory.

It should be noted that commit 59a1fcc69620da8eab1c048977fa22d297b18284
wrongly assumed that this CVE was fixed in version 3.10.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-Fix-out-of-bounds-read-in-slarrv.patch | 82 +++++++++++++++++++
 package/lapack/lapack.mk                      |  3 +
 2 files changed, 85 insertions(+)
 create mode 100644 package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch

diff --git a/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch b/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
new file mode 100644
index 0000000000..43c6444b02
--- /dev/null
+++ b/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
@@ -0,0 +1,82 @@
+From 0631b6beaed60ba118b0b027c0f8d35397bf5df0 Mon Sep 17 00:00:00 2001
+From: Keno Fischer <keno@juliacomputing.com>
+Date: Thu, 30 Sep 2021 03:51:23 -0400
+Subject: [PATCH] Fix out of bounds read in slarrv
+
+This was originally reported as https://github.com/JuliaLang/julia/issues/42415.
+I've tracked this down to an our of bounds read on the following line:
+
+https://github.com/Reference-LAPACK/lapack/blob/44ecb6a5ff821b1cbb39f8cc2166cb098e060b4d/SRC/slarrv.f#L423
+
+In the crashing example, `M` is `0`, causing `slarrv` to read uninitialized
+memory from the work array. I believe the `0` for `M` is correct and indeed,
+the documentation above supports that `M` may be zero:
+
+https://github.com/Reference-LAPACK/lapack/blob/44ecb6a5ff821b1cbb39f8cc2166cb098e060b4d/SRC/slarrv.f#L113-L116
+
+I believe it may be sufficient to early-out this function as suggested
+in this PR. However, I have limited context for the full routine here,
+so I would appreciate a sanity check.
+
+[Retrieved from:
+https://github.com/Reference-LAPACK/lapack/commit/38f3eeee3108b18158409ca2a100e6fe03754781]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ SRC/clarrv.f | 2 +-
+ SRC/dlarrv.f | 2 +-
+ SRC/slarrv.f | 2 +-
+ SRC/zlarrv.f | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/SRC/clarrv.f b/SRC/clarrv.f
+index 1f09e4da6..42f710757 100644
+--- a/SRC/clarrv.f
++++ b/SRC/clarrv.f
+@@ -348,7 +348,7 @@ SUBROUTINE CLARRV( N, VL, VU, D, L, PIVMIN,
+ *
+ *     Quick return if possible
+ *
+-      IF( N.LE.0 ) THEN
++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
+          RETURN
+       END IF
+ *
+diff --git a/SRC/dlarrv.f b/SRC/dlarrv.f
+index b036c1e66..299430361 100644
+--- a/SRC/dlarrv.f
++++ b/SRC/dlarrv.f
+@@ -350,7 +350,7 @@ SUBROUTINE DLARRV( N, VL, VU, D, L, PIVMIN,
+ *
+ *     Quick return if possible
+ *
+-      IF( N.LE.0 ) THEN
++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
+          RETURN
+       END IF
+ *
+diff --git a/SRC/slarrv.f b/SRC/slarrv.f
+index 9d72b339a..95f94fd1b 100644
+--- a/SRC/slarrv.f
++++ b/SRC/slarrv.f
+@@ -350,7 +350,7 @@ SUBROUTINE SLARRV( N, VL, VU, D, L, PIVMIN,
+ *
+ *     Quick return if possible
+ *
+-      IF( N.LE.0 ) THEN
++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
+          RETURN
+       END IF
+ *
+diff --git a/SRC/zlarrv.f b/SRC/zlarrv.f
+index 51ec558f5..e4be63e0d 100644
+--- a/SRC/zlarrv.f
++++ b/SRC/zlarrv.f
+@@ -348,7 +348,7 @@ SUBROUTINE ZLARRV( N, VL, VU, D, L, PIVMIN,
+ *
+ *     Quick return if possible
+ *
+-      IF( N.LE.0 ) THEN
++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
+          RETURN
+       END IF
+ *
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index f34f685ae2..a80131c9ad 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -12,6 +12,9 @@ LAPACK_INSTALL_STAGING = YES
 LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
 
+# 0001-Fix-out-of-bounds-read-in-slarrv.patch
+LAPACK_IGNORE_CVES += CVE-2021-4048
+
 ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
 LAPACK_CONF_OPTS += -DBUILD_COMPLEX=ON -DBUILD_COMPLEX16=ON
 else
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
