Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39A4C636D7
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 08:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2516181326;
	Sat, 18 Feb 2023 08:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2516181326
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UlxRC1Dpe5sr; Sat, 18 Feb 2023 08:58:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39AD081327;
	Sat, 18 Feb 2023 08:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39AD081327
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA7E31BF46D
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 08:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AECFF418D4
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 08:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AECFF418D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FzV60pPmjzT for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 08:58:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FBDB415CD
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FBDB415CD
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 08:58:51 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 ch19-20020a17090af41300b00234463de251so198105pjb.3
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 00:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9Fe2CDtJw3XjJMZRaPWzGJCz4ECCV7hhETcb08cBjY=;
 b=cZ8EZ5E777h/ZGjkbrIGKpW/+SA3BKvGuETcA1hf6AC3gWlLoTpMBPWlnfY9iv/L2X
 ZBgpxX3uI5NCPtaBKyUHgyzu+ej/Kq0JB6t5JUi56NlS202xnBKlIkynLXHif2u5oTBQ
 ZNTrCKT5e/liW2VWk5yKYq0JpPbm/ZIO3kZirxT+GxZ+GEujaGeQF32QjGbJB7sfHH5u
 j0C+TfYowhvhR1HNN7MzDUJ2VaNRBDANTxClxy2NeHwlQ8zwKTerVUG4KZfokn3pUTDF
 aaOlOK/kC6kn4RZtx2m5FmtqE4GBmvFWDVNcRS9drWE7cGfCb7QtPCzCxAihCgQrojaT
 1iWg==
X-Gm-Message-State: AO0yUKXcpdM/iu511BgJzXgf9A1d78SkUiGIh7yaNCwB1BBQ95E/s3ov
 FGERvlmzr3G3is+0mxu5MmVFt5LLuF8=
X-Google-Smtp-Source: AK7set/b/2F4+0emGfSum4Pkc/M9mUxE/vIpCtLRaeTF0qzfEkINHlRAv2lk+IA6U7YU27Obfm7OFQ==
X-Received: by 2002:a17:903:24f:b0:19a:973b:b60b with SMTP id
 j15-20020a170903024f00b0019a973bb60bmr3861567plh.25.1676710730497; 
 Sat, 18 Feb 2023 00:58:50 -0800 (PST)
Received: from debian.. (subs02-180-214-232-87.three.co.id. [180.214.232.87])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170902ff0f00b001994a0f3380sm4267909plj.265.2023.02.18.00.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 00:58:50 -0800 (PST)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Sat, 18 Feb 2023 15:58:37 +0700
Message-Id: <20230218085837.350535-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9Fe2CDtJw3XjJMZRaPWzGJCz4ECCV7hhETcb08cBjY=;
 b=ZJGZXO8ovidrwHzAQfl+Zs3oRV8sWWeh5yC369RMNaJu8eBzJesE6qj1pIn/ReFGNg
 2eMNJ83N8xTuwzjpcZvkyolKVfQxfTsL1THLjyC8q0vf3mr6zWUUnp33SygqGKl75jwu
 KodsigS0u5aNtKzwAEgj8mm5hQXm8okBSNxEfWanbDfTwcVA9PA+4HWBsfHMRtkCDC+i
 jzzR8LozKCC41Uo6bSfliBTY8/Zfxbyy/ddvpu6+Lb/wr3tG6gqq/2Q34X6of9Urd5vm
 wr5ZFKCQeRYg7DT4Pdb5VVD5Fb60H5k4a/L5xcdpK9UUVmuXft2hIFR7d3ZKSXjyGX9U
 6skg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZJGZXO8o
Subject: [Buildroot] [PATCH] package/git: security bump to version 2.39.2
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix two CVEs (CVE-2023-22490 and CVE-2023-23946). For the full release
note, see [1].

While at it, also refresh two Buildroot patches introduced when the
package was bumped to 2.39.0.

[1]: https://lore.kernel.org/git/xmqqr0us5dio.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 ...compat-util-avoid-redefining-system-function-nam.patch | 8 +++++---
 ...compat-util-undefine-system-names-before-redecla.patch | 6 +++---
 package/git/git.hash                                      | 2 +-
 package/git/git.mk                                        | 2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
index dbde87940a..24100e1f6e 100644
--- a/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
+++ b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
@@ -1,4 +1,4 @@
-From 385f67eb2254edb1fb4cf523e5e3d5a8f123d72c Mon Sep 17 00:00:00 2001
+From 86aeac96d04ae5381085c0f93acb12d3bfd06969 Mon Sep 17 00:00:00 2001
 From: Jeff King <peff@peff.net>
 Date: Wed, 30 Nov 2022 16:15:14 -0500
 Subject: [PATCH] git-compat-util: avoid redefining system function names
@@ -64,7 +64,7 @@ Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
  1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/git-compat-util.h b/git-compat-util.h
-index a76d0526f7..e3456bdd0d 100644
+index af05077560..f6882b9b50 100644
 --- a/git-compat-util.h
 +++ b/git-compat-util.h
 @@ -341,11 +341,12 @@ struct itimerval {
@@ -83,7 +83,7 @@ index a76d0526f7..e3456bdd0d 100644
  #endif
  
  #ifndef NO_LIBGEN_H
-@@ -1471,14 +1472,16 @@ int open_nofollow(const char *path, int flags);
+@@ -1479,14 +1480,16 @@ int open_nofollow(const char *path, int flags);
  #endif
  
  #ifndef _POSIX_THREAD_SAFE_FUNCTIONS
@@ -102,6 +102,8 @@ index a76d0526f7..e3456bdd0d 100644
  #define getc_unlocked(fh) getc(fh)
  #endif
  
+
+base-commit: cbf04937d5b9fcf0a76c28f69e6294e9e3ecd7e6
 -- 
 An old man doll... just what I always wanted! - Clara
 
diff --git a/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch b/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
index 9e3c9b662c..f6207300ee 100644
--- a/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
+++ b/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
@@ -1,4 +1,4 @@
-From 6d406390b870fdb2cd9d18b12ebfabc12f5096df Mon Sep 17 00:00:00 2001
+From d4a11fd215195cd1ca6a43058ef250b688ade1f4 Mon Sep 17 00:00:00 2001
 From: Jeff King <peff@peff.net>
 Date: Fri, 2 Dec 2022 06:05:38 -0500
 Subject: [PATCH] git-compat-util: undefine system names before redeclaring
@@ -29,7 +29,7 @@ Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/git-compat-util.h b/git-compat-util.h
-index e3456bdd0d..211861da0f 100644
+index f6882b9b50..dadb9e55cb 100644
 --- a/git-compat-util.h
 +++ b/git-compat-util.h
 @@ -346,6 +346,7 @@ static inline int git_setitimer(int which,
@@ -40,7 +40,7 @@ index e3456bdd0d..211861da0f 100644
  #define setitimer(which,value,ovalue) git_setitimer(which,value,ovalue)
  #endif
  
-@@ -1480,6 +1481,9 @@ static inline void git_funlockfile(FILE *fh)
+@@ -1488,6 +1489,9 @@ static inline void git_funlockfile(FILE *fh)
  {
  	; /* nothing */
  }
diff --git a/package/git/git.hash b/package/git/git.hash
index 75398896e5..b7840cd1eb 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  40a38a0847b30c371b35873b3afcf123885dd41ea3ecbbf510efa97f3ce5c161  git-2.39.1.tar.xz
+sha256  475f75f1373b2cd4e438706185175966d5c11f68c4db1e48c26257c43ddcf2d6  git-2.39.2.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 1d728e1964..206d06ffe7 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.39.1
+GIT_VERSION = 2.39.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: d00e437922fb1b611f35c3138b9fbf7bcff62757
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
