Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BA1C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:16:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D55A60F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D55A60F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6AD84267;
	Wed,  4 Aug 2021 00:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5FDDeeuVyMF; Wed,  4 Aug 2021 00:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FFD384233;
	Wed,  4 Aug 2021 00:16:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 175B11BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A357140F9B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctrA3DOr4NH1 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 407AA40665
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8589881469; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:38:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f00da714a20a7826dda67d66f2a6b6ef858ef3e3
X-Git-Newrev: 833e7db4f672656a3778faf155ac9d1ef2755bfe
X-Patchwork-Hint: ignore
Message-Id: <20210803211012.8589881469@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pymupdf: bump
 to version 1.18.14
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3535552143908138698=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3535552143908138698==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=833e7db4f672656a3778faf155ac9d1ef2755bfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Recent tarballs from PyPI use setuptools instead of distutils, so
change `PYTHON_PYMUPDF_SETUP_TYPE`.

They also include a license file, so include it and a hash for it.

This version also has a new dependency: freetype2.

PYTHON_PYMUPDF_REMOVE_PATHS is updated to take the new dependency into
account, but also the sed command are changed to delete include lines
instead of turning them into empty strings. Indeed, empty include
strings lead to using multiple `-I` flags which were not followed by
anything. Depending on the number of empty include strings (because
two successive `-I` "cancel" each other out), it would have failed to
compile.

Also, it turns out the patch version of python-pymupdf doesn't have to
match mupdf's version (e.g. python-pymupdf 1.18.14 is compatible with
mupdf 1.18.*) so while at it, remove the word "exactly" from the
comment.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymupdf/Config.in           |  1 +
 package/python-pymupdf/python-pymupdf.hash |  6 ++++--
 package/python-pymupdf/python-pymupdf.mk   | 19 +++++++++++--------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
index cd4c8cfcbb..54714eb3bf 100644
--- a/package/python-pymupdf/Config.in
+++ b/package/python-pymupdf/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # mupdf -> harfbuzz
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_MUPDF
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index a5a53997cd..ee7a916519 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  0e924bbb7364ba63df65d33fee9656f0  PyMuPDF-1.16.0.tar.gz
-sha256  1a6cc5b8b0fb9aa16bfa453fdfed445398f00d2556e78d90ba54cdce8d900857  PyMuPDF-1.16.0.tar.gz
+md5  70d6c2232e531772bbe9a813044262f9  PyMuPDF-1.18.14.tar.gz
+sha256  efe85cb80f79cc3f3890aa2ab82b962b8a999ca078e33e9bacc5d0be5c4656dc  PyMuPDF-1.18.14.tar.gz
+# Locally computed:
+sha256  282751b8c98ee9e445346eb57a992c9ecbe25ed8dd554df046777313e19b10f9  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 9f8d1744b1..ceeeb0a55b 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -4,21 +4,24 @@
 #
 ################################################################################
 
-# python-pymupdf's version must match exactly mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.16.0
+# python-pymupdf's version must match mupdf's version
+PYTHON_PYMUPDF_VERSION = 1.18.14
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/d2/da/692102b6e6868a57d1dc7f98d07413116a02493b3b49a798dcd6f676d368
-PYTHON_PYMUPDF_SETUP_TYPE = distutils
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/41/f6/dbefe3d6949fa81fb7bcac9141e4345330d272724718ac5a6af78297498b
+PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = GPL-3.0, AGPL-3.0+ (code generated from mupdf)
+PYTHON_PYMUPDF_LICENSE_FILES = COPYING
 # No license file included in pip, but it's present on github
-PYTHON_PYMUPDF_DEPENDENCIES = mupdf zlib
+PYTHON_PYMUPDF_DEPENDENCIES = freetype mupdf zlib
 
-PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf"
+PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf -I$(STAGING_DIR)/usr/include/freetype2"
 
 # We need to remove the original paths as we provide them in the CFLAGS:
 define PYTHON_PYMUPDF_REMOVE_PATHS
-	sed -i "s:\/usr\/include\/mupdf::g" $(@D)/setup.py
-	sed -i "s:\/usr\/local\/include\/mupdf::g" $(@D)/setup.py
+	sed -i "/\/usr\/include\/mupdf/d" $(@D)/setup.py
+	sed -i "/\/usr\/include\/freetype2/d" $(@D)/setup.py
+	sed -i "/\/usr\/local\/include\/mupdf/d" $(@D)/setup.py
+	sed -i "/mupdf\/thirdparty\/freetype\/include/d" $(@D)/setup.py
 endef
 
 PYTHON_PYMUPDF_POST_PATCH_HOOKS = PYTHON_PYMUPDF_REMOVE_PATHS

--===============3535552143908138698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3535552143908138698==--
