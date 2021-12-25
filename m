Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5579BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 21:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFADE60C30;
	Sat, 25 Dec 2021 21:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6GaNgNGJ_Xe; Sat, 25 Dec 2021 21:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3672960C2E;
	Sat, 25 Dec 2021 21:46:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3395F1BF2EB
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 21:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23D804030F
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 21:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8KOfGnNNf-qB for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 21:46:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9024D4016F
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 21:46:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 1EsBnzAjGydyP1EsBnoFcN; Sat, 25 Dec 2021 22:46:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640468799; bh=Ws3VHODTIykHb8XXzpmX2acrAp+4gyFglFvfIYeP7lM=;
 h=From:To:Subject:Date:MIME-Version;
 b=U+8SyVfYxzWx1iTPP58fWpJKkIknLk2YRGy5Yv2ivWH3ZDjOreMvuporiVSr5pCXZ
 pWDniDnpuQiajGldKjOtNENKGJvnD/b4OwcG2cbLsn+J+gfbDK4LVP5kN0NJLx0uhM
 gPwRMdlqD47xcDpy2DVrrBD33RFI04SHpygCGrxHLT2i0SDfs548/utoQwjaCzu3Uz
 HgvU4OcjrF097FimHQF2kG/UcYJgege0ffO3a+nPuQX/zaZvVdtnAJRZHrwmoG/8pr
 5mwa462DjqIPB/AvvnJtOVCX1o6UkP1vAeB3ranj1lSdB1AkujamofD3XrFxrGn+Ab
 mDYZqjnJnM1OA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 22:46:38 +0100
Message-Id: <20211225214638.105114-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfB3VtmPfXse4LRoJh4UjLRXQOqk+SrRAJC+fXl02PJKghHxO77Pqms3vkak/bfg9AbAOoauJI/iHOEE/6V9huYnpVKYHInPIwvlsIzTEkFodtgY+YVSQ
 5sPZqAxxpTuMdGws4D6P5A6xTIL+DXwil+OlPO+zIZOb+YOmehMdYCMcSUdua1XVIF+7CRTlwWtoDaz0iK7G25K65rhfSo1VdQEE9v42wENM58gGTSnB5h45
 bV9XsOgwOmJGjFpG6QGVza5nJoEvcBnlByXdLWlf8KM=
Subject: [Buildroot] [PATCH] package/harfbuzz: fix host build failure due to
 C++11
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package harfbuzz fails to build for host with error:
```
../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
   static_assert (std::is_trivially_copyable<K>::value, "");
```

Only starting from gcc version 5.0 we have 'is_trivially_copyable' member
of std. So let's depend on BR2_HOST_GCC_AT_LEAST_5 for harfbuzz. Let's
also depend on it in pango package which is the only one which needs
host-harfbuzz.

Fixes:
http://autobuild.buildroot.net/results/89e1194c1659d7e1af9db8ffe5feee770c448f76

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/Config.in | 6 ++++--
 package/pango/Config.in    | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index 2e4219ee22..81acebce46 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_HARFBUZZ
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_HOST_GCC_AT_LEAST_5 # C++11
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
@@ -11,7 +12,8 @@ config BR2_PACKAGE_HARFBUZZ
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
 
-comment "harfbuzz needs a toolchain w/ C++, gcc >= 4.9"
+comment "harfbuzz needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 5.0"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_5
diff --git a/package/pango/Config.in b/package/pango/Config.in
index e2b2e7fe2b..dfda086cff 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PANGO
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-harfbuzz
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_EXPAT
@@ -24,9 +25,10 @@ config BR2_PACKAGE_PANGO
 
 	  https://pango.gnome.org/
 
-comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 5.0"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
