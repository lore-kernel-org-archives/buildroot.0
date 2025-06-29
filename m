Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F98C7EE30
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 11:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3F0F6101C;
	Sun, 29 Jun 2025 11:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCtu7tzeVSE2; Sun, 29 Jun 2025 11:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2199E61027
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2199E61027;
	Sun, 29 Jun 2025 11:21:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D09F4DF
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 11:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6BB86101F
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 11:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9XYG-N9DfUe for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 11:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D58976101C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D58976101C
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 11:21:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C46848498F; Sun, 29 Jun 2025 11:21:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Jun 2025 13:09:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48639f074c31a53d30002ca7273d9c60c0e9490e
X-Git-Newrev: 89ca1bd4f489ff6738f7c317dc6d9cfdbf362bc7
X-Patchwork-Hint: ignore
Message-Id: <20250629112146.C46848498F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: bump to v1.11.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=89ca1bd4f489ff6738f7c317dc6d9cfdbf362bc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://dev.gnupg.org/T7166

This version fixes a build error which can happen with 32-bit arm
configurations.

The issue can be reproduced with commands:

    cat >.config <<EOF
    BR2_arm=y
    BR2_cortex_a8=y
    BR2_ARM_INSTRUCTIONS_THUMB2=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_LIBGCRYPT=y
    EOF
    make olddefconfig
    make libgcrypt

Build is failing with output:

    ec-nist.c: In function '_gcry_mpi_ec_nist256_mod':
    ec-inline.h:902:5: error: 'asm' operand has impossible constraints or there are not enough registers
      902 |     __asm__ ("subs %3, %7, %10\n" \
          |     ^~~~~~~

Details for this buggix: https://dev.gnupg.org/T7226

Signed-off-by: Bram Oosterhuis <dev@bybram.com>
[Julien: reword commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgcrypt/libgcrypt.hash | 4 ++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index ced8087ca9..486a29dfc0 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  dd2c68e0685bb99249efeeb06046fae15b5214ba  libgcrypt-1.11.0.tar.bz2
-sha256  09120c9867ce7f2081d6aaa1775386b98c2f2f246135761aae47d81f58685b9c  libgcrypt-1.11.0.tar.bz2
+sha1  d33eb270cd74e8c23e263eb5cdb8f7de740f7b49  libgcrypt-1.11.1.tar.bz2
+sha256  24e91c9123a46c54e8371f3a3a2502f1198f2893fbfbf59af95bc1c21499b00e  libgcrypt-1.11.1.tar.bz2
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 57eca507b3..5f56e40ac2 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.11.0
+LIBGCRYPT_VERSION = 1.11.1
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
