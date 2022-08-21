Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFA2C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 15:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA3040990;
	Sun, 21 Aug 2022 15:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCA3040990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81ldSYs7A9Hq; Sun, 21 Aug 2022 15:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC012409E5;
	Sun, 21 Aug 2022 15:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC012409E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 158171BF5AD
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E464E403F9
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E464E403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXUJ-fVFAVzy for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 15:31:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC657400BB
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC657400BB
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 15:31:09 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id b5so6170939wrr.5
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 08:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=zqQvAqzVG0gW888/coEm+SXxex50gv7NmbuTQtfI+sI=;
 b=6fDbCerre1CBRXHUvMp+luiEVT5/Xpq1ojO5Gw9nUQJFQpI1LtUT5cAvVTYbIydFRp
 fQXkmXBlG691Zl7yoORj+ImuezBbDrNRyDXyMwDqTl0gYbNuHGD9p5nHRF+i9chhf2WP
 4zcg+GBODuwghy478Uy5R4nyCFYpcjQLq0b1xniSyBMppp9EHAv8x3PdCxBsBbw8O9GI
 SVQ/sE1y3XAr/UqNjR5CpR4xE3/Xt+SCHGhyD7xW3l0FgpD/B7DkFBmgoNpbe+UOMLI8
 BDxNnN/xNaBje+1CD25ZovUOeroMPlRd0C1IRIqFVmjvIAWgga8gJpvO7CQmYkGv7cz0
 qzsQ==
X-Gm-Message-State: ACgBeo3AvHyV8qSKvv3mPJSV705YKWlOxDk2P6arIz7e6gvYTuLAvZOc
 D3/Q4SJXXReuKXu1dEJgXb13jy/Hu9k=
X-Google-Smtp-Source: AA6agR7+aYqy3KCQGIMqHn30Hmn8pfbGQvoWNyflKjqfhvz2W3Kfd/fKjN6CTu4NATfJaAHi/8xyww==
X-Received: by 2002:adf:df84:0:b0:225:5687:1f56 with SMTP id
 z4-20020adfdf84000000b0022556871f56mr1451235wrl.96.1661095867997; 
 Sun, 21 Aug 2022 08:31:07 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003a342933727sm2454195wmq.3.2022.08.21.08.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 08:31:07 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 17:31:03 +0200
Message-Id: <20220821153104.239709-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=zqQvAqzVG0gW888/coEm+SXxex50gv7NmbuTQtfI+sI=;
 b=CLE6x3+hbRPUnJEJJ9QBALnuXXCqYYGNEQFpbTpzxUF/2LE0QjTdZZW1RBSDjwvUoT
 CKvP1a0AQXhBmzDf4pr5gJQLTz7P+qbOKrY1Gh7BG3JN1Y+K6xu6T9EAY51XzLvHPfRa
 nbvQ3KRCwBWYD51rtGCFDBFs17ZCKCrVGChcS8PlrIjxL3sKUCqh88qieiaTe4CCksxT
 5zZw5nLdjpaagoBDyrfH+m/jBPKTfalp8o1EEJPVvptqTzVvkPY5mcOrfTQdrk2hGDQA
 gQbYfoEN6rr0QRzbKvpw0M5c5S4SM4e85yPBR3Dg3BtXwebQC1qPul0SycK+2VuBq8bY
 jodA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CLE6x3+h
Subject: [Buildroot] [for-next] package/gcc: bump to version 12.2.0
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See announce:
https://gcc.gnu.org/pipermail/gcc-announce/2022/000174.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
 package/gcc/Config.in.host                                    | 2 +-
 package/gcc/gcc.hash                                          | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename package/gcc/{12.1.0 => 12.2.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)

diff --git a/package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.2.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/12.1.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/12.2.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 64e0d0b986..746f4df434 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -83,7 +83,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "10.4.0"    if BR2_GCC_VERSION_10_X
 	default "11.3.0"    if BR2_GCC_VERSION_11_X
-	default "12.1.0"    if BR2_GCC_VERSION_12_X
+	default "12.2.0"    if BR2_GCC_VERSION_12_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index b9536ddffe..666124fa6d 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
 sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.1.0/sha512.sum
-sha512  2121d295292814a6761edf1fba08c5f633ebe16f52b80e7b73a91050e71e1d2ed98bf17eebad263e191879561c02b48906c53faa4c4670c486a26fc75df23900  gcc-12.1.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.2.0/sha512.sum
+sha512  e9e857bd81bf7a370307d6848c81b2f5403db8c7b5207f54bce3f3faac3bde63445684092c2bc1a2427cddb6f7746496d9fbbef05fbbd77f2810b2998f1f9173  gcc-12.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
