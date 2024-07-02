Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C3EC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 440A18128F;
	Tue,  2 Jul 2024 07:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4c1DV7vB-U5j; Tue,  2 Jul 2024 07:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD6F8124F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD6F8124F;
	Tue,  2 Jul 2024 07:20:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49C3D1BF335
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 434FD40953
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eU9rlHysk0XK for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:20:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16EE740830
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16EE740830
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16EE740830
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:20:33 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f39bso269085a12.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719904832; x=1720509632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=luyl9x/A5blUPiW1pjWvMH0OeXcafsOOwuT2Ca7zb8o=;
 b=PctLX0RZTjJT39/pwfsNp9SPlRpgCj+O24qW2ORv/gq1MaQpXaylI1Vt6l0+VTtcg9
 qsB2jvBSbqv147Njvi8q2l8mhO9g1gx1uZOyb5hfUGJRYRGGNdD+kzC5ubOFPQgQruES
 Avm6Cyto0mAMmHyF8YwLJ4jlh79lmo6iCpSVGCql2Nwj6tkezkVcwPtQslN7j8TnopkB
 dhrAwOfHwZdKQDwBFGEKFRv4Q0dDe1oRRhTVM9UUOxy7mUPEjQVR25PCsV72hA0fj0BN
 h6XEr4jvMnqh1zGOArJ0GfTb/tmFX32ovBRtIiX1KqWS1TLHcX9Vf4813pED6evhjuvc
 VT5w==
X-Gm-Message-State: AOJu0YzYvngfZlp9VIzC6lUgTbl2O1ywIpyzKHrVytqPp74H2XYgkY74
 eD58xfDM+3UGnqO4Pdo96wtvSpp/2e1Bm88RBvbGTOcfOwOcCTlJ8auFTItK5K2kuhSiqiKTEBE
 6ns8=
X-Google-Smtp-Source: AGHT+IE+evYzM/JeSbLDWrz5yJPlaDhN+hz0Q2pMT5+L6Tn7gTtid8g2o82u/zclo2jvcw2niZP8pQ==
X-Received: by 2002:a05:6402:11d1:b0:57d:17c3:a593 with SMTP id
 4fb4d7f45d1cf-5879f983dbdmr4997391a12.22.1719904831683; 
 Tue, 02 Jul 2024 00:20:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c733:f73f:670d:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58612c835cfsm5255807a12.14.2024.07.02.00.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 00:20:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 09:20:24 +0200
Message-ID: <20240702072024.2375844-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719904832; x=1720509632;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=luyl9x/A5blUPiW1pjWvMH0OeXcafsOOwuT2Ca7zb8o=;
 b=c4fmEHE60NNZ6/ErOnPPO7ohmjx9LQ6gA/oSwR4yNuiCbiRqLniVLzARXiAXzHP2EB
 Zsk422MYgy7R4uhm5STbP5PqeNFYV4E5JV7LSmMaJLsKA+6h668qCoTQ8QL5xHiLgt4p
 CKFZ4Zl6UtGxVhF2hIITVvBB8iU8H8zTSCSgs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=c4fmEHE6
Subject: [Buildroot] [PATCH 1/1] package/libtheora: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, theora fails to build with output:

    Applying 0002-fix-autoreconf.patch using patch:
    patching file Makefile.am
    Hunk #1 FAILED at 4.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej
    patching file configure.ac
    Hunk #1 FAILED at 68.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                         |  1 -
 package/libtheora/0002-fix-autoreconf.patch | 14 +++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 949b7467cfe6..94ed9a19fdd4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -911,7 +911,6 @@ package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch lib_pa
 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch lib_patch.Upstream
 package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
 package/libtheora/0001-link-libtheoradec.patch lib_patch.Upstream
-package/libtheora/0002-fix-autoreconf.patch lib_patch.Upstream
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
 package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch lib_patch.Upstream
 package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch lib_patch.Upstream
diff --git a/package/libtheora/0002-fix-autoreconf.patch b/package/libtheora/0002-fix-autoreconf.patch
index dd3f47322235..27fc379ad404 100644
--- a/package/libtheora/0002-fix-autoreconf.patch
+++ b/package/libtheora/0002-fix-autoreconf.patch
@@ -1,9 +1,10 @@
 Fix broken autoreconf
 
-Downloaded from upstream git
-https://git.xiph.org/?p=theora.git;a=commitdiff;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
+Upstream: https://git.xiph.org/?p=theora.git;a=commitdiff;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 
 From: Tim Terriberry <tterribe@xiph.org>
@@ -22,9 +23,8 @@ diff --git a/Makefile.am b/Makefile.am
 index 89fd753..1783857 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -4,6 +4,8 @@
- #AUTOMAKE_OPTIONS = foreign 1.7 dist-zip dist-bzip2
- AUTOMAKE_OPTIONS = foreign 1.11 dist-zip dist-xz
+@@ -2,5 +2,7 @@
+ AUTOMAKE_OPTIONS = foreign 1.6 dist-zip dist-bzip2
  
 +ACLOCAL_AMFLAGS=-I m4
 +
@@ -35,7 +35,7 @@ diff --git a/configure.ac b/configure.ac
 index 1cbec1a..456b603 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -68,7 +68,7 @@ AC_LIBTOOL_WIN32_DLL
+@@ -61,7 +61,7 @@ AC_LIBTOOL_WIN32_DLL
  AM_PROG_LIBTOOL
  
  dnl Add parameters for aclocal
@@ -43,4 +43,4 @@ index 1cbec1a..456b603 100644
 +AC_CONFIG_MACRO_DIR([m4])
  
  dnl Check for doxygen
- AC_ARG_ENABLE([doc],
+ AC_CHECK_PROG(HAVE_DOXYGEN, doxygen, true, false)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
