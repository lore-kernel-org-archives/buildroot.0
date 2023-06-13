Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290D8C7EE29
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 12:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB717416D0;
	Tue, 13 Jun 2023 12:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB717416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6rF3FKnhZqC; Tue, 13 Jun 2023 12:54:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E72E440BA2;
	Tue, 13 Jun 2023 12:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E72E440BA2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D85311BF352
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACCAD610B7
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACCAD610B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCWbe77YW1x7 for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 12:54:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD30960FEB
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 12:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD30960FEB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA4EF828C3; Tue, 13 Jun 2023 12:54:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 14:47:01 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8016b8a34a1bc5a6dd82f2d22d1c5e075df4fd57
X-Git-Newrev: 24905d4d935d643e27754e4d550c43475b342ae9
X-Patchwork-Hint: ignore
Message-Id: <20230613125451.BA4EF828C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-pymupdf:
 add missing host swig dependency
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
Content-Type: multipart/mixed; boundary="===============3323717609810770497=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3323717609810770497==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=24905d4d935d643e27754e4d550c43475b342ae9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

It appears that python-pymupdf needs swig when building since mupdf
was bumped to 1.18.0 in commit
f00da714a20a7826dda67d66f2a6b6ef858ef3e3. This was not noticed before
because when building on a machine where swig is already available
outside buildroot, it is used and the build succeeds.

This fixes the following build failure:

swigging fitz/fitz.i to fitz/fitz_wrap.c
swig -python -w509 -o fitz/fitz_wrap.c fitz/fitz.i
error: command 'swig' failed: No such file or directory
make: *** [package/pkg-generic.mk:293:
/home/buildroot/autobuild/instance-2/output-1/build/python-pymupdf-1.21.1/.stamp_built]
Error 1

Fixes:
- http://autobuild.buildroot.net/results/c689a385d984b87b63f3f2ff30338049774b1bf2
- http://autobuild.buildroot.net/results/cf268d3631330a8288fb8ad2af009abb7f1ca6b0

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a650d714341c0e2900dac492c02d3b5701c87c8d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pymupdf/Config.in         | 1 +
 package/python-pymupdf/python-pymupdf.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
index b3f9565238..ecaa5496b5 100644
--- a/package/python-pymupdf/Config.in
+++ b/package/python-pymupdf/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # mupdf -> harfbuzz
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_HOST_SWIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_MUPDF
 	select BR2_PACKAGE_ZLIB
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index 70448e8d90..03fc8bc4fb 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -12,7 +12,7 @@ PYTHON_PYMUPDF_SETUP_TYPE = setuptools
 PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
 # No license file included in pip, but it's present on github
-PYTHON_PYMUPDF_DEPENDENCIES = freetype mupdf zlib
+PYTHON_PYMUPDF_DEPENDENCIES = freetype host-swig mupdf zlib
 
 PYTHON_PYMUPDF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/mupdf -I$(STAGING_DIR)/usr/include/freetype2"
 

--===============3323717609810770497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3323717609810770497==--
