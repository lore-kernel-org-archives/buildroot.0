Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA73C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 14:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A6DF60750;
	Sun,  7 Jul 2024 14:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxrBue1DA0ib; Sun,  7 Jul 2024 14:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1315A60835
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1315A60835;
	Sun,  7 Jul 2024 14:18:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A13511BF488
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 14:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D1D7409D9
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 14:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjQgzXtW9rqZ for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 14:18:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1402040279
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1402040279
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1402040279
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 14:18:04 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58c2e5e8649so6131792a12.1
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 07:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720361882; x=1720966682;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1mt686jrLzJsWPoNhb9AcjXrHvoJhbMljU7L+AQl8F8=;
 b=Oz+5FcNaJZ1d/y8Za9O/4fd+2HQulY53df+bvWZl+/J6B7lGN6e/UtW+kRYoEHQnxb
 gEtGJeKGvM7XO+JB486tN5CZ6TH75xH2JaBWu6RTU6QAfWuqG2oksLrMtmTwJ9kKkESB
 xWIurxaOvXGyoeI2r9eHBA9+o6FSkJ6TML2yNjVYI2OBWjhEb+OcDPiJU/V5cIBMUUSn
 2ctm6QBSnikEX/EOqmGhWgBMkhT+QYB8iRL0Z6BbOpYGMW/V2Mm5JXxNl695RKysvdaq
 8FMV06Iz+rClB4VDh/7vgIR2LQvlNRfSwdr8Nr/SZqVyyfVWvaSnqSWn0oHP/CenwwV3
 pyRw==
X-Gm-Message-State: AOJu0YzLVV3iq5hh/O2pIeI+r7k2GZLang0HGNglsPJgs2LbnuWV+tsB
 yNoux8tVvHZcEOkzTguLULSjKUvDznT7hiCP7HPFSnfymo0p81RM4G0hGwJAjHuLrQuFnH0cLn3
 /CEQ=
X-Google-Smtp-Source: AGHT+IG5+KWQDvbOshWDXJo5NLzAITq2pW0Wpl7d41yx3bTFZ7iXFNW739awO99RdclT1IHGjoaAWA==
X-Received: by 2002:a05:6402:254d:b0:57c:a8e5:35f0 with SMTP id
 4fb4d7f45d1cf-58e7a74d34amr8230401a12.2.1720361882384; 
 Sun, 07 Jul 2024 07:18:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58dfd5aeda6sm4550516a12.78.2024.07.07.07.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 07:18:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 16:17:58 +0200
Message-ID: <20240707141758.126043-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720361882; x=1720966682;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1mt686jrLzJsWPoNhb9AcjXrHvoJhbMljU7L+AQl8F8=;
 b=Zs9+CYbk62Y8CBtV2HW3IoQJB10tvZZwq3S7/vwiibVykS7BMHV2adko7nAz3hs8PS
 AwBStkT7SpM782NaaOuMGYN5TzB2ggJLp0nNgp33jBP2dTc9jIcg17GXK5ILaDkWaw4w
 6gbfKVZhHwO5S8Whhhx5aOLf3bGcuBNlcJMU4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Zs9+CYbk
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: update the patches to
 be applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Karoly Kasza <kaszak@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, openvmtools fails to build with output:

    Applying 0007-Use-configure-to-test-for-feature-instead-of-platfor.patch using patch:
    patching file configure.ac
    Hunk #1 succeeded at 940 (offset 142 lines).
    Hunk #2 succeeded at 1150 (offset 86 lines).
    patching file lib/misc/idLinux.c
    Hunk #2 succeeded at 1022 (offset 28 lines).
    patching file lib/nicInfo/nicInfoPosix.c
    Hunk #1 FAILED at 34.
    1 out of 1 hunk FAILED -- saving rejects to file lib/nicInfo/nicInfoPosix.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...ure-to-test-for-feature-instead-of-platfor.patch | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch b/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
index abbc5183623c..f10e74e1528f 100644
--- a/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
+++ b/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
@@ -22,6 +22,8 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
 [Retrieved (and slightly updated) from:
 http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch?h=sumo]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  open-vm-tools/configure.ac               |  4 ++++
  open-vm-tools/lib/misc/idLinux.c         | 30 ++++++++++++++----------------
@@ -32,7 +34,7 @@ Index: open-vm-tools/configure.ac
 ===================================================================
 --- open-vm-tools.orig/configure.ac
 +++ open-vm-tools/configure.ac
-@@ -798,6 +798,7 @@ AC_CHECK_FUNCS(
+@@ -940,6 +940,7 @@
  
  AC_CHECK_FUNCS([ecvt])
  AC_CHECK_FUNCS([fcvt])
@@ -40,7 +42,7 @@ Index: open-vm-tools/configure.ac
  
  AC_CHECK_FUNC([mkdtemp], [have_mkdtemp=yes])
  
-@@ -1063,10 +1064,13 @@ AC_PATH_PROG(
+@@ -1149,10 +1150,13 @@
  ###
  
  AC_CHECK_HEADERS([crypt.h])
@@ -72,7 +74,7 @@ Index: open-vm-tools/lib/misc/idLinux.c
  #ifdef __APPLE__
  #include <sys/socket.h>
  #include <TargetConditionals.h>
-@@ -997,31 +994,32 @@ Id_EndSuperUser(uid_t uid)  // IN:
+@@ -1025,31 +1022,32 @@
  static Bool
  IdIsSetUGid(void)
  {
@@ -121,8 +123,7 @@ Index: open-vm-tools/lib/nicInfo/nicInfoPosix.c
 ===================================================================
 --- open-vm-tools.orig/lib/nicInfo/nicInfoPosix.c
 +++ open-vm-tools/lib/nicInfo/nicInfoPosix.c
-@@ -34,9 +34,13 @@
- #include <sys/socket.h>
+@@ -35,9 +35,13 @@
  #include <sys/stat.h>
  #include <errno.h>
  #include <limits.h>
@@ -137,7 +138,7 @@ Index: open-vm-tools/lib/nicInfo/nicInfoPosix.c
  # include <net/if.h>
  #endif
  #ifndef NO_DNET
-@@ -348,10 +352,7 @@ GuestInfoGetNicInfo(NicInfoV3 *nicInfo)
+@@ -499,10 +503,7 @@
   *
   ******************************************************************************
   */
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
