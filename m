Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158D9C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3B184053E;
	Sat, 13 Jul 2024 19:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KfHG60LVqMt; Sat, 13 Jul 2024 19:56:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0B6240531
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0B6240531;
	Sat, 13 Jul 2024 19:56:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59F1E1BF870
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54FB381414
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1GB4qG3OyXn for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F17813ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85F17813ED
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70E018660D; Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 21:54:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c0d7b72c0993a55c8dcb7b38d85792e1bf6e8bc
X-Git-Newrev: ba6baa019b8b0146d053f310ddd2bc96cb9465a5
X-Patchwork-Hint: ignore
Message-Id: <20240713195553.70E018660D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymupdf: add missing
 python-zlib dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3360037772961567649=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3360037772961567649==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ba6baa019b8b0146d053f310ddd2bc96cb9465a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turns out that python-pymupdf doesn't require zlib directly, but it
does require the zlib python module.

This fixes the following runtime error:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.11/site-packages/fitz/__init__.py", line 22, in <module>
  File "/usr/lib/python3.11/site-packages/fitz/fitz.py", line 3402, in <module>
  File "/usr/lib/python3.11/gzip.py", line 9, in <module>
ModuleNotFoundError: No module named 'zlib'

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymupdf/Config.in         | 2 +-
 package/python-pymupdf/python-pymupdf.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
index ecaa5496b5..3831a25451 100644
--- a/package/python-pymupdf/Config.in
+++ b/package/python-pymupdf/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	select BR2_PACKAGE_HOST_SWIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_MUPDF
-	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Python bindings for the PDF rendering library MuPDF.
 
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 8825868fb5..8547d4f3fb 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -12,7 +12,7 @@ PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
 # No license file included in pip, but it's present on github
-PYTHON_PYMUPDF_DEPENDENCIES = freetype host-swig mupdf zlib
+PYTHON_PYMUPDF_DEPENDENCIES = freetype host-swig mupdf
 PYTHON_PYMUPDF_BUILD_OPTS = --skip-dependency-check
 
 PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf -I$(STAGING_DIR)/usr/include/freetype2"

--===============3360037772961567649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3360037772961567649==--
