Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FB7C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Mar 2022 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B51208151E;
	Wed,  2 Mar 2022 21:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVD6n2ps6zmY; Wed,  2 Mar 2022 21:02:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C0081446;
	Wed,  2 Mar 2022 21:02:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 194ED1BF307
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 21:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07AA340897
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 21:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1Bf33up9nCr for <buildroot@lists.busybox.net>;
 Wed,  2 Mar 2022 21:02:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF03A4087E
 for <buildroot@buildroot.org>; Wed,  2 Mar 2022 21:02:08 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.100.77])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D2CDA5FFA5;
 Wed,  2 Mar 2022 22:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646254925;
 bh=o1cXvIEEqzqUsr7hHyC08NueTXpkSLx1ZRJ6Ate7Z8E=;
 h=From:To:Cc:Subject:Date:From;
 b=sSKQ6aMUjTlYHh88LWOiVOIvMTSxDBfCTK0Cbe/pXyIBX6fVS6tWQufKyVMqgawO3
 dtWtEudrfQiN1LS0RsHNU5s+758B11NdEhc3aacTwrQ1KKT+z/S405tPDG1wCPwmnJ
 V24V2XymgJlOAlmRXd3gEPpeG+ETcSgeXnaw08Xpnu5QYVCMCC5t9cMzKIM1CJ8flN
 ADNokUDCbCR4l1Jmmd/UZE3BMvBa7wJGIpOVz0r/UFH4xQ+6VKwPYIaJPUfKywrZYe
 C90fG9m42g5JBZbwg9UyC9C1uW5MTpZLl1nsZtWTvCQjs1lAS5NwSJZrYW6cRVtqJG
 DulRcAwVZkncQ==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  2 Mar 2022 22:01:50 +0100
Message-Id: <20220302210150.33658-1-ju.o@free.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/{gnupg,
 gnupg2}: use gnupg2 by default
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch reverses the logic to select gnupg2 by default, while still
allowing to select gnupg (v1).

Quoting: https://gnupg.org/download/index.html
"""
GnuPG 1.4 is the old, single binary version which still support the
unsafe PGP-2 keys. This branch has no dependencies on the above listed
libraries or the Pinentry. However, it lacks many modern features and
will receive only important updates.
"""

gnupg 1.4 is kept in Buildroot for now, as the package is still
maintained upstream. It might still be useful is some specific cases:
- it has a smaller footprint (compared to v2),
- it has less dependencies (only zlib),
- it has less build dependencies (can build static, no need for
MMU/threads, ...)

Most Linux distributions are now shipping gnupg2 by default. gnupg v1
is now more for legacy/compatibility/specific cases.

There is currently only two packages selecting gnupg in Buildroot:
gpgme and python-gnupg
This commit also reverses the logic for those packages.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested with:

    support/testing/run-tests \
        -d dl -o output_folder \
        -k tests.package.test_python_gnupg.TestPythonPy3GnuPG

Note: this change was quickly discussed in:
https://lists.buildroot.org/pipermail/buildroot/2022-January/634021.html
---
 package/gnupg/Config.in        | 1 -
 package/gnupg2/Config.in       | 1 +
 package/libgpgme/Config.in     | 2 +-
 package/python-gnupg/Config.in | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 2db46318f1..e92fca709d 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_GNUPG
 	bool "gnupg"
-	depends on !BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_ZLIB
 	help
 	  GnuPG is the GNU project's complete and free implementation
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index ef1817ef02..9438cf69f6 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GNUPG2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpth
 	depends on BR2_USE_MMU # libassuan, libnpth
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_GNUPG
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBGCRYPT
diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
index 4aabd06367..20f491b664 100644
--- a/package/libgpgme/Config.in
+++ b/package/libgpgme/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBGPGME
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
 	depends on BR2_USE_MMU # libassuan
 	#gnupg is not needed to build, but at runtime.
-	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2
+	select BR2_PACKAGE_GNUPG2 if !BR2_PACKAGE_GNUPG
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBASSUAN
 	help
diff --git a/package/python-gnupg/Config.in b/package/python-gnupg/Config.in
index 038a940778..54f8fb6a29 100644
--- a/package/python-gnupg/Config.in
+++ b/package/python-gnupg/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_GNUPG
 	bool "python-gnupg"
-	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2 # runtime
+	select BR2_PACKAGE_GNUPG2 if !BR2_PACKAGE_GNUPG # runtime
 	help
 	  A wrapper for the Gnu Privacy Guard (GPG or GnuPG).
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
