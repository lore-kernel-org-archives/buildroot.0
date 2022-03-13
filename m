Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28172C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D383E60E9A;
	Sun, 13 Mar 2022 09:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5T2srF5ybkA; Sun, 13 Mar 2022 09:11:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8F6660E91;
	Sun, 13 Mar 2022 09:11:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9681BF97A
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C510818CA
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rg83BZEcOVlZ for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:11:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1344818C9
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:11:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9923783C4C; Sun, 13 Mar 2022 09:02:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:10:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7557cb05410f981fe5b8784bb321b28767ea93a
X-Git-Newrev: e2957f5ce743cfaf4fb3aaa98d619e83e8e6989e
X-Patchwork-Hint: ignore
Message-Id: <20220313090240.9923783C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argon2-cffi: bump to
 version 21.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2957f5ce743cfaf4fb3aaa98d619e83e8e6989e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate to new flit based build.

Since upstream commit cb0248d29ab2 (Extract CFFI bindings into
argon2-cffi-bindings), the dependency to libargon2 is carried by
argon2-cffi-bindings which is already enforced in Buildroot. So drop it
from python-argon2-cffi.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr:
  - explain why we drop the dependency to libargon2
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-argon2-cffi/Config.in               |  8 +++-----
 package/python-argon2-cffi/python-argon2-cffi.hash |  4 ++--
 package/python-argon2-cffi/python-argon2-cffi.mk   | 14 +++-----------
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/package/python-argon2-cffi/Config.in b/package/python-argon2-cffi/Config.in
index 5cddb3314e..4d5a703d76 100644
--- a/package/python-argon2-cffi/Config.in
+++ b/package/python-argon2-cffi/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_PYTHON_ARGON2_CFFI
 	bool "python-argon2-cffi"
-	depends on BR2_USE_MMU # libargon2
-	depends on !BR2_STATIC_LIBS # libargon2
-	select BR2_PACKAGE_PYTHON_CFFI # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_LIBARGON2
+	depends on BR2_USE_MMU # python-argon2-cffi-bindings
+	depends on !BR2_STATIC_LIBS # python-argon2-cffi-bindings
+	select BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS # runtime
 	help
 	  The secure Argon2 password hashing algorithm.
 
diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
index 6c416ffd88..09da5855a3 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.hash
+++ b/package/python-argon2-cffi/python-argon2-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argon2-cffi/json
-md5  f33bc18f2c2438f685ba1f0bbd2b86a4  argon2-cffi-21.1.0.tar.gz
-sha256  f710b61103d1a1f692ca3ecbd1373e28aa5e545ac625ba067ff2feca1b2bb870  argon2-cffi-21.1.0.tar.gz
+md5  b7843e8690c790f8e743d37bb75c25a8  argon2-cffi-21.3.0.tar.gz
+sha256  d384164d944190a7dd7ef22c6aa3ff197da12962bd04b17f64d4e93d934dba5b  argon2-cffi-21.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index f01c940589..0fb3e50ff3 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -4,19 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ARGON2_CFFI_VERSION = 21.1.0
+PYTHON_ARGON2_CFFI_VERSION = 21.3.0
 PYTHON_ARGON2_CFFI_SOURCE = argon2-cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/7b/39/a26aaef5c3f0c6cfd67c80599b5b40a794fdab46f4ee3be925d71e2f9596
-PYTHON_ARGON2_CFFI_SETUP_TYPE = setuptools
+PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/3f/18/20bb5b6bf55e55d14558b57afc3d4476349ab90e0c43e60f27a7c2187289
+PYTHON_ARGON2_CFFI_SETUP_TYPE = flit
 PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
-PYTHON_ARGON2_CFFI_DEPENDENCIES = host-python-cffi libargon2
-PYTHON_ARGON2_CFFI_ENV = ARGON2_CFFI_USE_SYSTEM=1
-
-ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
-PYTHON_ARGON2_CFFI_ENV += ARGON2_CFFI_USE_SSE2=1
-else
-PYTHON_ARGON2_CFFI_ENV += ARGON2_CFFI_USE_SSE2=0
-endif
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
