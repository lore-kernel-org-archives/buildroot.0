Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D693C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 14:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 088B640632;
	Sun, 11 Aug 2024 14:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DNd_hwN-Atw; Sun, 11 Aug 2024 14:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C0A40633
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38C0A40633;
	Sun, 11 Aug 2024 14:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B59651BF409
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 14:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A32C140633
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 14:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhqubsuADrZq for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 14:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EE5C40632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EE5C40632
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EE5C40632
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 14:14:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EDFD3B0051B;
 Sun, 11 Aug 2024 16:14:03 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Aug 2024 16:13:56 +0200
Message-ID: <20240811141356.1201929-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723385646;
 bh=FsPzGEk35tgeSAAfnXiK/Jq0sQrHJ1otl9fMtZHjc6I=;
 h=From:To:Cc:Subject:Date:From;
 b=LV0duJmz8JIL/pb61t3gvWihsUVZNmAk19jfaXJTzoijy/hVjrIcQvGwEelisWJQu
 uv/7r6SUNQZqypF20PdJy9oh0vlv2nR73rmy4CEvRHVkx9iETteMrrZ3k9Gnr1viOQ
 DehIumdxRybjuxTIb3T5OOzAC1tXWhuutRS8qGV6hGiLAyWxqhTeWe3J5xHWP/SVWq
 KLbds942OCAtGifeBpRkA3bZwbRrbt/MaGEn2A9HP92+fUBDrUiBQRVs+2fID1kiMK
 LW46wdiRiDF1DArJuNsformWH+jBa4xordhpttUaywacNgxnzPj+z68uSO1EfBFwSW
 KFPJEQzHY7YCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LV0duJmz
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: needs MMU
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
Cc: Julien Olivain <ju.o@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libgpg-error imported code using fork() in commit [1] and enabled it
soon after in [2]. Those commits were first included in libgpg-error
version 1.28.

For reference, the libgpg-error Buildroot package was updated to that
version in commit [3].

When Buildroot configuration has no MMU support (e.g. BR2_USE_MMU is
not set), libgpg-error fails to build with error:

    /build/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./.libs/libgpg-error.a(libgpg_error_la-spawn-posix.o): in function '_gpgrt_process_spawn':
    spawn-posix.c:(.text+0x630): undefined reference to 'fork'

This issue can be observed with the command:

    utils/test-pkg -a -p libgpg-error

It will show few build failures:

    ...
       bootlin-armv7m-uclibc [ 6/41]: FAILED
    ...
    bootlin-m68k-5208-uclibc [ 8/41]: FAILED
    ...

This commit fixes the issue by adding the package dependency on
BR2_USE_MMU.

This commit also propagates this dependency on the libgcrypt and
libksba packages. They are requiring libgpg-error but had no
dependency on MMU.

Finally, for completeness, for all other packages requiring
libgpg-error which already had the dependency on BR2_USE_MMU, the
corresponding comment is updated to reflect that change. Namely: gcr,
gnupg2, libassuan, libgpgme, libostree, netatalk, pinentry, vpnc, and
wireshark. Note: for simplifity, few packages already depending on
BR2_USE_MMU but having libgpg-error as an optional dependency are not
updated (libjcat, mutt and opkg).

Fixes:
http://autobuild.buildroot.org/results/dbc82ba08e6a30c2f558c8c36ad7eeb0e3cab090/
http://autobuild.buildroot.org/results/074a803de0f48cd86b9135cca50f136cccf1bcea/
http://autobuild.buildroot.org/results/4c1966a71020af31c1dc1b0a13a3928c84e75874/
...and many others.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=8f41cc23b12485404203be5881aaaadb78696b4d
[2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=1865c0ba1769b407a3c504f1ab0a4278704a9fc1
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/692d191c8b0b3c86022e6a6ba3bd2d8f53b39f03

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcr/Config.in          | 2 +-
 package/gnupg2/Config.in       | 2 +-
 package/libassuan/Config.in    | 2 +-
 package/libgcrypt/Config.in    | 1 +
 package/libgpg-error/Config.in | 1 +
 package/libgpgme/Config.in     | 2 +-
 package/libksba/Config.in      | 1 +
 package/libostree/Config.in    | 2 +-
 package/netatalk/Config.in     | 2 +-
 package/pinentry/Config.in     | 2 +-
 package/vpnc/Config.in         | 2 +-
 package/wireshark/Config.in    | 2 +-
 12 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/package/gcr/Config.in b/package/gcr/Config.in
index dbc22cf478..e4a90a5550 100644
--- a/package/gcr/Config.in
+++ b/package/gcr/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GCR
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_MMU # libglib2, libgpg-error
 	depends on !BR2_STATIC_LIBS # p11-kit
 	select BR2_PACKAGE_GNUPG2 if BR2_PACKAGE_GNUPG2_DEPENDS && !BR2_PACKAGE_GNUPG # runtime
 	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS # runtime
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index 043d53554c..b282520dd8 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_GNUPG2_DEPENDS
 	default y
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpth
-	depends on BR2_USE_MMU # libassuan, libnpth
+	depends on BR2_USE_MMU # libassuan, libgpg-error, libnpth
 	depends on !BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GNUPG2
diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
index 012e65c4b6..8e860e86a1 100644
--- a/package/libassuan/Config.in
+++ b/package/libassuan/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBASSUAN
 	bool "libassuan"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
-	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_MMU # fork(), libgpg-error
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
 	  Libassuan is a small library implementing the so-called
diff --git a/package/libgcrypt/Config.in b/package/libgcrypt/Config.in
index d3e5d4f7a2..a4df65a37c 100644
--- a/package/libgcrypt/Config.in
+++ b/package/libgcrypt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBGCRYPT
 	bool "libgcrypt"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
+	depends on BR2_USE_MMU # libgpg-error
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
 	  LibGCrypt is GNU's basic cryptographic library.
diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 5a2c14ead8..8e466e86e0 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Libgpg-error is a small library with error codes and
 	  descriptions shared by most GnuPG related software.
diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
index 16ce27d0ef..51c4f228e4 100644
--- a/package/libgpgme/Config.in
+++ b/package/libgpgme/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBGPGME
 	bool "libgpgme"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
-	depends on BR2_USE_MMU # libassuan
+	depends on BR2_USE_MMU # libassuan, libgpg-error
 	select BR2_PACKAGE_GNUPG2 if BR2_PACKAGE_GNUPG2_DEPENDS && !BR2_PACKAGE_GNUPG # runtime
 	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS # runtime
 	select BR2_PACKAGE_LIBGPG_ERROR
diff --git a/package/libksba/Config.in b/package/libksba/Config.in
index 1f25d6dbe2..7d764c2461 100644
--- a/package/libksba/Config.in
+++ b/package/libksba/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBKSBA
 	bool "libksba"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
+	depends on BR2_USE_MMU # libgpg-error
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
 	  CMS and X.509 library
diff --git a/package/libostree/Config.in b/package/libostree/Config.in
index 49eed6517e..847a9ed17b 100644
--- a/package/libostree/Config.in
+++ b/package/libostree/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBOSTREE
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme, libgpg-error
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_USE_MMU # e2fsprogs, libglib2, libgpgme
+	depends on BR2_USE_MMU # e2fsprogs, libglib2, libgpgme, libgpg-error
 	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8 # loop_config
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index 225d5891c7..60189f320e 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_NETATALK
 	bool "netatalk"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_MMU # fork(), libgpg-error
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index bd5e3af5a1..401c60323d 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_PINENTRY
 	bool "pinentry"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
-	depends on BR2_USE_MMU # libassuan
+	depends on BR2_USE_MMU # libassuan, libgpg-error
 	select BR2_PACKAGE_LIBASSUAN
 	select BR2_PACKAGE_LIBGPG_ERROR
 	# At least one backend is needed to avoid build breakage
diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index 6455b0d87a..b71c0e613e 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_VPNC
 	bool "vpnc"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on !BR2_STATIC_LIBS # gnutls
-	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_MMU # fork(), libgpg-error
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 8b05599ecb..ce9d41bf00 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_WIRESHARK
 	bool "wireshark"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_MMU # fork(), glib2
+	depends on BR2_USE_MMU # fork(), glib2, libgcrypt -> libgpg-error
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_INSTALL_LIBSTDCPP
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
