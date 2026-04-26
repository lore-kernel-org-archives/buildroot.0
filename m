Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE7DFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 13:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1036984951;
	Sun, 26 Apr 2026 13:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIN_SE2NaZfP; Sun, 26 Apr 2026 13:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE4D8493C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777209806;
	bh=xVCZyFELjwOXWlCBVeu0fTi/o4fslTq3eCB08GQmH/I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z0D01zNOqeAtS+sGnbx2qDd1FgOkmkdCia6gm0pWb33+A4cE5MXKd/Vq/KBqkx7ak
	 dSxQh7rxFkVdFsOyuYuzrdvG6YZ0MBKfB+W76coqwT6zx+wf6VGFArFCvx4MOXkPoo
	 F6xctAJFKzUtWd4vl9jHWP4ZxK1CJVaN/9bnW1gBjWIRtyP4jOSzYuIz5gtdHVeKVM
	 Gw5lSyfusUHryitNhH3yrGUKYvZDwb9hJuBKYjEI3lvHDFmIsqyVRJUfxeGu5owcqs
	 /x2xzYZmsw5uybsZwxqeL1+SUYxOBz9o2VL6xpYciDPefQR9rDKZlOo4iTLC/uyp3b
	 GUDclfzR9TFZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DE4D8493C;
	Sun, 26 Apr 2026 13:23:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EAF132DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 13:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBDEE61BC4
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 13:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxeKbL3WVAKK for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 13:23:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B28A261369
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B28A261369
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B28A261369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 13:23:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 50D5EA4C0432;
 Sun, 26 Apr 2026 15:23:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54436)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGzSB-000000002nK-2DsB;
 Sun, 26 Apr 2026 13:23:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alex Suykov <alex.suykov@gmail.com>
Date: Sun, 26 Apr 2026 15:23:19 +0200
Message-ID: <20260426132319.1325484-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777209800;
 bh=UMZRZJpS0pkWsbjEtXRKt+gapjZuq6v9AgXBkBX/WV0=;
 h=From:To:Cc:Subject:Date:From;
 b=G2KCMPbVT8Y+1I77o/fuMYu270p6wumkZmEhxJROThj+RxN6c+RK1aXc3K5pScmb1
 B7T812nKWHFldjkRV5w4pxW6cdoBHWPUl0jcnWZT2+RnfMVuzECvdwGlf09UDkPpc1
 ZI2wl3ZkuK7sTaPBA7zLfe26Imkw1VAsH17PG7xWwA3cbwNrkneNShttaggZCoCb+n
 q7dKLuqjN5JQncFruxiccumAncxw0MYRHq6prYuNN8oyfxTrvKEeBX/WxM7G20bsAN
 xn3/OQnKsu+8dwmbjyCh1IBrxnmvmN/9g0WfqOWOKZJVzAyw36CL8QdBykrSxYN5dT
 e16/GHQguv88A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=G2KCMPbV
Subject: [Buildroot] [PATCH 1/1] package/vboot-utils: bump version to
 7dfa482d6a843e1e25b615d6b0200028cedce29f
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch 0001 due to upstream removal of the patched file:
https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+/1accb279b195241cdd6ea47f95747bb8664442a2%5E%21/

Renumbered remaining patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...missing-definition-of-MTD_CHAR_MAJOR.patch | 30 -------------------
 ..._csme-add-missing-USE_FLASHROM-guar.patch} |  0
 package/vboot-utils/vboot-utils.hash          |  2 +-
 package/vboot-utils/vboot-utils.mk            |  2 +-
 5 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
 rename package/vboot-utils/{0002-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch => 0001-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index facaf0ff89..30c452416e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -933,7 +933,6 @@ package/vala/0001-dont-add-dirty-to-valac-version.patch lib_patch.Upstream
 package/vala/vala-wrapper Shellcheck
 package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch lib_patch.Upstream
 package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch lib_patch.Upstream
-package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch lib_patch.Upstream
 package/vdr/0001-getloadavg.patch lib_patch.Upstream
 package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch lib_patch.Upstream
 package/vlc/0002-automake-add-subdir-objects-option.patch lib_patch.Upstream
diff --git a/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch b/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
deleted file mode 100644
index c988c79529..0000000000
--- a/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 90ed7f5cbe088912fbe0f3f45606de75602c1404 Mon Sep 17 00:00:00 2001
-From: Alex Suykov <alex.suykov@gmail.com>
-Date: Thu, 21 Jan 2016 21:59:46 +0100
-Subject: [PATCH] Add missing definition of MTD_CHAR_MAJOR
-
-This definition missing from <linux/major.h> for kernels <= 3.13
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
----
- cgpt/cgpt_wrapper.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/cgpt/cgpt_wrapper.c b/cgpt/cgpt_wrapper.c
-index afa4940e..38504aa6 100644
---- a/cgpt/cgpt_wrapper.c
-+++ b/cgpt/cgpt_wrapper.c
-@@ -33,6 +33,10 @@
- #include "cgpt_nor.h"
- #include "file_keys.h"
- 
-+#ifndef MTD_CHAR_MAJOR
-+#define MTD_CHAR_MAJOR 90
-+#endif
-+
- // Check if cmdline |argv| has "-D". "-D" signifies that GPT structs are stored
- // off device, and hence we should not wrap around cgpt.
- static bool has_dash_D(int argc, const char *const argv[]) {
--- 
-2.34.1
-
diff --git a/package/vboot-utils/0002-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch b/package/vboot-utils/0001-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch
similarity index 100%
rename from package/vboot-utils/0002-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch
rename to package/vboot-utils/0001-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index 13752f3a33..6f1de06d3f 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d65c447d5b4624ffb87815071d2734c3802a73fdca56a06c910fd0ea8e82602d  vboot-utils-4b12d392e5b12de29c582df4e717b1228e9f1594-git4.tar.gz
+sha256  b8bfffa49f9f4f82c68ad56de977eb2601d96dbff319a16945efb169d3c17278  vboot-utils-7dfa482d6a843e1e25b615d6b0200028cedce29f-git4.tar.gz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index 3058d61ad8..72742266d7 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VBOOT_UTILS_VERSION = 4b12d392e5b12de29c582df4e717b1228e9f1594
+VBOOT_UTILS_VERSION = 7dfa482d6a843e1e25b615d6b0200028cedce29f
 VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
 VBOOT_UTILS_SITE_METHOD = git
 VBOOT_UTILS_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
