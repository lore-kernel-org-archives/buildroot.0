Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6566EC30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 13:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 078176059A;
	Sun,  7 Jul 2024 13:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnUHfq1ZiPbe; Sun,  7 Jul 2024 13:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED8B16061B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8B16061B;
	Sun,  7 Jul 2024 13:48:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF2101BF29C
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 13:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA3656061B
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 13:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmp2ZOZc0Smx for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 13:48:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3DB246059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DB246059A
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DB246059A
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 13:48:47 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52ea5dc3c66so3532872e87.3
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 06:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720360125; x=1720964925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ixGO1ZyigsNM2LOQiHAax7lmtRiG3UcItzW/Mvjt/os=;
 b=Dlt01n7hOBA7vE5WBf8asygBRt84WUp/3qFFZT2vOOmyh/jqILhYgNHlqcbMAa/WOB
 K1aOcaQj8w/IDuTlI0SWBI4gdoBHE0Dr5j3RpkVnmaZCZIXu8VRSlhNk5fVWuLs9jICS
 le9FJYoDzVzBQa35XwyLwJSEBKrOxGtS635702HsiBowW8o6rYNzcLu6V6TYS7TjE8T6
 CL4W15q4EueDOud1/QqFRhCHd4iUiMyI4GweyERfkm3EqYWJfybf2E4PpDweejyxh/c0
 kBhasgaQKeEJUlxMJosVXMKhrvpN0jhINwBXSZ2sHyuNYOLbMGQhldBAA3djVkAUDS2w
 UlMw==
X-Gm-Message-State: AOJu0YzOsDbHdPCkS10sknKA51kijSf+bh0+ddZhv7FG8Q5TLUcuPmjO
 V5J7jb66mxJeCSOqQEQQY9dT6bI25rYjl0pLXSbKnnEj8TkisE2Vl+76kdBfocTudS1F0Cc58Rp
 dbNU=
X-Google-Smtp-Source: AGHT+IGp21Wrpea/e4zhVFpprDuGQrHVxkn3fjKjYDD3YpOUgWwKkpPqk9F6rgmr97tGN6QEhjIjxw==
X-Received: by 2002:ac2:48b0:0:b0:52c:cd77:fe03 with SMTP id
 2adb3069b0e04-52ea060db7amr7696710e87.14.1720360124538; 
 Sun, 07 Jul 2024 06:48:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b92985desm759132066b.78.2024.07.07.06.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 06:48:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 15:48:40 +0200
Message-ID: <20240707134840.4130434-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720360125; x=1720964925;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ixGO1ZyigsNM2LOQiHAax7lmtRiG3UcItzW/Mvjt/os=;
 b=heItuxaRyJlP7ImSJ3+0Ao35t4akhDMfhH8gR45IgXTEfFpS9hh+IB8XEdbEOVeuaX
 z0hon9uXXTp87rOHVGUPqCNLCSyvmxaBrF16Drgajok9etiQdD2fLQCEhF2CZOLOskVH
 b4WpfaFzWc7OkLVkIWje8v8mWZMTQocZbvESw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=heItuxaR
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: fix patch fuzz
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

Due to this change, shairport-sync fails to build with output:

    Applying 0001-configure.ac-find-sndfile-through-pkg-config.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 304.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                       | 1 -
 ...001-configure.ac-find-sndfile-through-pkg-config.patch | 8 +++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d2627455e..6b489fe12924 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1359,7 +1359,6 @@ package/setserial/0002-tiocghayesesp-build-fix.patch lib_patch.Upstream
 package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch lib_patch.Upstream
 package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch lib_patch.Upstream
 package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch lib_patch.Upstream
-package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch lib_patch.Upstream
 package/shairport-sync/S99shairport-sync Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch lib_patch.Upstream
 package/shellinabox/0001-Makefile-disable-always-building-statically.patch lib_patch.Upstream
diff --git a/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch b/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
index bd97ec0c3d8f..b593703a2a69 100644
--- a/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
+++ b/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
@@ -13,7 +13,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/92ed30a6855ca11800b779718822bcba4a69c9a3
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mikebrady/shairport-sync/pull/1263]
+Upstream: https://github.com/mikebrady/shairport-sync/pull/1263
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  configure.ac | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
@@ -22,9 +24,9 @@ diff --git a/configure.ac b/configure.ac
 index f77087c5..9b982c51 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -304,7 +304,14 @@ AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP
+@@ -303,7 +303,14 @@
+ AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP convolution support])])
  if test "x$with_convolution" = "xyes" ; then
-   AM_INIT_AUTOMAKE([subdir-objects])
    AC_DEFINE([CONFIG_CONVOLUTION], 1, [Include audio DSP convolution support.])
 -  AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
 +  if  test "x${with_pkg_config}" = xyes ; then
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
