Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC15C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9095D84A95;
	Mon, 19 May 2025 11:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNZOwL6M1NlD; Mon, 19 May 2025 11:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91DA684A88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91DA684A88;
	Mon, 19 May 2025 11:06:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 229D6E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C52340D90
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmoHJ4x6-SBn for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D97CF423E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D97CF423E8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D58D681E90; Mon, 19 May 2025 10:40:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 18:45:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d2d5014a8e10e82debc5f9222ab931a21edbf0c8
X-Git-Newrev: 6c3f01fde12730defcc238fe9b065b30086e066b
X-Patchwork-Hint: ignore
Message-Id: <20250519104010.D58D681E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/samba4: needs libxcrypt
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
