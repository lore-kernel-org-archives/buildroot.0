Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB52C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 16:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E1560A73;
	Sun, 18 May 2025 16:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAeG05COEGKq; Sun, 18 May 2025 16:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 123A960AA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 123A960AA0;
	Sun, 18 May 2025 16:45:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DBF0E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83183407F9
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-34Nm9Sw7SP for <buildroot@buildroot.org>;
 Sun, 18 May 2025 16:45:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA72840873
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA72840873
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:45:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7511F87172; Sun, 18 May 2025 16:45:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 18:45:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2d5014a8e10e82debc5f9222ab931a21edbf0c8
X-Git-Newrev: 6c3f01fde12730defcc238fe9b065b30086e066b
X-Patchwork-Hint: ignore
Message-Id: <20250518164542.7511F87172@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: needs libxcrypt
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6c3f01fde12730defcc238fe9b065b30086e066b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of Samba to version 4.21.4 in commit
716461af945e89af56eea4a3936c4a2adc7fdb4d, <crypt.h> is needed, due to
upstream comit 0dccda38f27b3bbda5d2a4de588a333ff554651a. Since
<crypt.h> is no longer provided by glibc, a dependency on libxcrypt is
needed, to avoid the following build failure:

../../lib/util/util_crypt.c:5:10: fatal error: crypt.h: No such file or directory
    5 | #include <crypt.h>
      |          ^~~~~~~~~
compilation terminated.

This has not been detected by the autobuilders, presumably because a
lot of glibc configurations end up having libxcrypt selected by other
packages, but the issue is reproducible by building:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_SAMBA4=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/Config.in | 1 +
 package/samba4/samba4.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 36ec656168..6aff82bb3d 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_SAMBA4
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ac3141f3d9..828de56fc8 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -22,6 +22,7 @@ SAMBA4_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
 SAMBA4_CFLAGS = $(TARGET_CFLAGS)
 SAMBA4_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
