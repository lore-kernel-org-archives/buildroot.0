Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD01CC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 11:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 742D560D6F;
	Thu, 28 Jul 2022 11:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 742D560D6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUjKyNT8JYCZ; Thu, 28 Jul 2022 11:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6594D60AE0;
	Thu, 28 Jul 2022 11:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6594D60AE0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C43571BF359
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 11:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EEBE40227
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 11:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EEBE40227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjU3AvorO8I7 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 11:58:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B4094010C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B4094010C
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 11:58:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d8so1890624wrp.6
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 04:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ncc3jQU0z9BtLeq5pADM33DK02p9KmclJ0V1k2U2tE8=;
 b=Sg3ZWU3YiB4uEGu+if2+FuTdD+hQIfhMMpxzl7ZyGxSH06NTIdZVbH2VQMIAOcCxlC
 2NapNCOTvBlVyPKSwzCsCJIbmt4lO5Vr9p6V42AaRHw+lBXM/ejcaBVsBcg1OPjDZb0D
 F47hO3EejM+yKOP+MDuxb3FCPHBbILEHN4L/Z/8UZjBaJKKeXSileqZKfIg6sOFnKBzL
 xnFr1bwRElNBgIRtAZc4voVVOg7WM0lNuMqbhn0onGvg5R0OKLQELxWJMzXZUiLKAiOp
 QchACX+B4AnEupkPP/CtN8ldyZ1l3EPz1abwZe5+9EQhgTWYqHZpNpSUPi1VAmCDnTcZ
 g/vg==
X-Gm-Message-State: AJIora9Ni7NArEXO+/7yUaXE+rFgSEuAjZQR1BlQs2AlaMcZBEE10p2I
 PpaEjRQtm16WNgN3m/OtFcoNQyfHMWY=
X-Google-Smtp-Source: AGRyM1s4XmZVS/dpZvQZVxZF2qVreG1AJjOsEfeNCcN0VrdNiAHLTilIxABCfK971PZ07Y+PaLEtQw==
X-Received: by 2002:adf:ef8d:0:b0:21e:a5e3:35af with SMTP id
 d13-20020adfef8d000000b0021ea5e335afmr8682165wro.671.1659009530999; 
 Thu, 28 Jul 2022 04:58:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003a31df6af2esm5705828wmq.1.2022.07.28.04.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 04:58:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 13:58:47 +0200
Message-Id: <20220728115847.2533147-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ncc3jQU0z9BtLeq5pADM33DK02p9KmclJ0V1k2U2tE8=;
 b=Up077OtCyX7vh7fR3LSH9TJkDw60hfFVO7KK/tQjRmye+EQSzDX6yv+RuJCZfc66Xm
 rqiwIMJSAuUqThbE8RfzNJHGB59Ku7d1EvqIN4gTHpS4/cDgSTWrhgzK55K3lBgCyqrM
 sn1M66CsbrusFFPBKWtmAxsdkLEFozFL2YW+huArcO9PQSeUs0HGcyh3X5RPkbN6QhUa
 1RJLf5wuPffAxEflF6WpQTtwztsEFnlbm9iiLTlqFlt4TeBwjr2WLeA5h6NTFLCN1fqp
 6UFo/t5X2czMezdXqxQjVaeAib+eJLzUxQj6UM8FTwGZ+L316VJg97albO37HM44J+Up
 RDqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Up077OtC
Subject: [Buildroot] [PATCH 1/1] package/lapack: bump to version 3.10.1
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

- Drop patch (already in version)
- Update hash of LICENSE (update in year:
  https://github.com/Reference-LAPACK/lapack/commit/e7ad0370d4c3bb81d663abb773e49094f68bd5d6)

http://www.netlib.org/lapack/lapack-3.10.1.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-Fix-out-of-bounds-read-in-slarrv.patch | 82 -------------------
 package/lapack/lapack.hash                    |  4 +-
 package/lapack/lapack.mk                      |  5 +-
 3 files changed, 3 insertions(+), 88 deletions(-)
 delete mode 100644 package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch

diff --git a/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch b/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
deleted file mode 100644
index 43c6444b02..0000000000
--- a/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 0631b6beaed60ba118b0b027c0f8d35397bf5df0 Mon Sep 17 00:00:00 2001
-From: Keno Fischer <keno@juliacomputing.com>
-Date: Thu, 30 Sep 2021 03:51:23 -0400
-Subject: [PATCH] Fix out of bounds read in slarrv
-
-This was originally reported as https://github.com/JuliaLang/julia/issues/42415.
-I've tracked this down to an our of bounds read on the following line:
-
-https://github.com/Reference-LAPACK/lapack/blob/44ecb6a5ff821b1cbb39f8cc2166cb098e060b4d/SRC/slarrv.f#L423
-
-In the crashing example, `M` is `0`, causing `slarrv` to read uninitialized
-memory from the work array. I believe the `0` for `M` is correct and indeed,
-the documentation above supports that `M` may be zero:
-
-https://github.com/Reference-LAPACK/lapack/blob/44ecb6a5ff821b1cbb39f8cc2166cb098e060b4d/SRC/slarrv.f#L113-L116
-
-I believe it may be sufficient to early-out this function as suggested
-in this PR. However, I have limited context for the full routine here,
-so I would appreciate a sanity check.
-
-[Retrieved from:
-https://github.com/Reference-LAPACK/lapack/commit/38f3eeee3108b18158409ca2a100e6fe03754781]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- SRC/clarrv.f | 2 +-
- SRC/dlarrv.f | 2 +-
- SRC/slarrv.f | 2 +-
- SRC/zlarrv.f | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/SRC/clarrv.f b/SRC/clarrv.f
-index 1f09e4da6..42f710757 100644
---- a/SRC/clarrv.f
-+++ b/SRC/clarrv.f
-@@ -348,7 +348,7 @@ SUBROUTINE CLARRV( N, VL, VU, D, L, PIVMIN,
- *
- *     Quick return if possible
- *
--      IF( N.LE.0 ) THEN
-+      IF( (N.LE.0).OR.(M.LE.0) ) THEN
-          RETURN
-       END IF
- *
-diff --git a/SRC/dlarrv.f b/SRC/dlarrv.f
-index b036c1e66..299430361 100644
---- a/SRC/dlarrv.f
-+++ b/SRC/dlarrv.f
-@@ -350,7 +350,7 @@ SUBROUTINE DLARRV( N, VL, VU, D, L, PIVMIN,
- *
- *     Quick return if possible
- *
--      IF( N.LE.0 ) THEN
-+      IF( (N.LE.0).OR.(M.LE.0) ) THEN
-          RETURN
-       END IF
- *
-diff --git a/SRC/slarrv.f b/SRC/slarrv.f
-index 9d72b339a..95f94fd1b 100644
---- a/SRC/slarrv.f
-+++ b/SRC/slarrv.f
-@@ -350,7 +350,7 @@ SUBROUTINE SLARRV( N, VL, VU, D, L, PIVMIN,
- *
- *     Quick return if possible
- *
--      IF( N.LE.0 ) THEN
-+      IF( (N.LE.0).OR.(M.LE.0) ) THEN
-          RETURN
-       END IF
- *
-diff --git a/SRC/zlarrv.f b/SRC/zlarrv.f
-index 51ec558f5..e4be63e0d 100644
---- a/SRC/zlarrv.f
-+++ b/SRC/zlarrv.f
-@@ -348,7 +348,7 @@ SUBROUTINE ZLARRV( N, VL, VU, D, L, PIVMIN,
- *
- *     Quick return if possible
- *
--      IF( N.LE.0 ) THEN
-+      IF( (N.LE.0).OR.(M.LE.0) ) THEN
-          RETURN
-       END IF
- *
diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
index 6f6dbff1a6..4d4d2c0596 100644
--- a/package/lapack/lapack.hash
+++ b/package/lapack/lapack.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  328c1bea493a32cac5257d84157dc686cc3ab0b004e2bea22044e0a59f6f8a19  lapack-3.10.0.tar.gz
-sha256  66246b7d3e6736aea46e63fd5e087659474d07edfe2f9b051d085d9b42aaac61  LICENSE
+sha256  cd005cd021f144d7d5f7f33c943942db9f03a28d110d6a3b80d718a295f7f714  lapack-3.10.1.tar.gz
+sha256  44f7c08ab11e40b21d8bf8220712929ba8d0204645d2174869acf915562d0969  LICENSE
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 609075842d..2d069c1c93 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LAPACK_VERSION = 3.10.0
+LAPACK_VERSION = 3.10.1
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
@@ -13,9 +13,6 @@ LAPACK_INSTALL_STAGING = YES
 LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
 
-# 0001-Fix-out-of-bounds-read-in-slarrv.patch
-LAPACK_IGNORE_CVES += CVE-2021-4048
-
 ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
 LAPACK_CONF_OPTS += -DBUILD_COMPLEX=ON -DBUILD_COMPLEX16=ON
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
