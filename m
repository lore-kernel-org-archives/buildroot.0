Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BB1C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 09:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8B2C40210;
	Mon, 12 Aug 2024 09:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ze8pcBJnkBNV; Mon, 12 Aug 2024 09:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C28F9404E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C28F9404E7;
	Mon, 12 Aug 2024 09:52:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A95021BF27C
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9594D40210
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psWQpffTqCsY for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 09:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9080240203
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9080240203
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 09:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B7698470E; Mon, 12 Aug 2024 09:52:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 11:19:12 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 83bfb10a71005bbf941822af42d37695b9569179
X-Git-Newrev: dc20060f40bd198419d2910ce32668251f50922d
X-Patchwork-Hint: ignore
Message-Id: <20240812095251.0B7698470E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-pymupdf:
 add missing python-zlib dependency
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
Content-Type: multipart/mixed; boundary="===============8744947898733401558=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8744947898733401558==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dc20060f40bd198419d2910ce32668251f50922d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit ba6baa019b8b0146d053f310ddd2bc96cb9465a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 639ce0e00e..3e9cd3e6f1 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -12,7 +12,7 @@ PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
 # No license file included in pip, but it's present on github
-PYTHON_PYMUPDF_DEPENDENCIES = freetype host-swig mupdf zlib
+PYTHON_PYMUPDF_DEPENDENCIES = freetype host-swig mupdf
 
 PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf -I$(STAGING_DIR)/usr/include/freetype2"
 

--===============8744947898733401558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8744947898733401558==--
