Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34947C43334
	for <buildroot@archiver.kernel.org>; Sat,  2 Jul 2022 13:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D53FB408CB;
	Sat,  2 Jul 2022 13:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D53FB408CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JMlI9TBcJck; Sat,  2 Jul 2022 13:58:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D92240884;
	Sat,  2 Jul 2022 13:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D92240884
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 789CB1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CA91410B4
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA91410B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JXsetc-gK6j for <buildroot@lists.busybox.net>;
 Sat,  2 Jul 2022 13:56:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3337E415B1
 for <buildroot@buildroot.org>; Sat,  2 Jul 2022 13:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3337E415B1
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 24881878AB; Sat,  2 Jul 2022 13:43:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Jul 2022 15:54:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17f568f39948a0abc57337473dd8eb13ac4266fb
X-Git-Newrev: df91a970b66be48134da515c5287917f8fcad6bd
X-Patchwork-Hint: ignore
Message-Id: <20220702134313.24881878AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: security bump to
 version 9.56.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=df91a970b66be48134da515c5287917f8fcad6bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-2085: A NULL pointer dereference vulnerability was found in
Ghostscript, which occurs when it tries to render a large number of bits
in memory. When allocating a buffer device, it relies on an
init_device_procs defined for the device that uses it as a prototype
that depends upon the number of bits per pixel. For bpp > 64,
mem_x_device is used and does not have an init_device_procs defined.
This flaw allows an attacker to parse a large number of bits (more than
64 bits per pixel), which triggers a NULL pointer dereference flaw,
causing an application to crash.

Drop patch (already in version)

https://www.ghostscript.com/doc/9.56.0/News.htm
https://www.ghostscript.com/doc/9.56.1/News.htm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-704405-Fix-typo-in-non-forked-lcms2-code.patch | 28 ----------------------
 package/ghostscript/ghostscript.hash               |  4 ++--
 package/ghostscript/ghostscript.mk                 |  2 +-
 3 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch b/package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch
deleted file mode 100644
index bb1227f687..0000000000
--- a/package/ghostscript/0001-Bug-704405-Fix-typo-in-non-forked-lcms2-code.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 830afae5454dea3bff903869d82022306890a96c Mon Sep 17 00:00:00 2001
-From: Robin Watts <Robin.Watts@artifex.com>
-Date: Fri, 1 Oct 2021 12:44:44 +0100
-Subject: [PATCH] Bug 704405: Fix typo in non-forked lcms2 code.
-
-[Retrieved from:
-https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=830afae5454dea3bff903869d82022306890a96c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- base/gsicc_lcms2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/base/gsicc_lcms2.c b/base/gsicc_lcms2.c
-index ccf1d7051..9badb6dee 100644
---- a/base/gsicc_lcms2.c
-+++ b/base/gsicc_lcms2.c
-@@ -462,7 +462,7 @@ int
- gscms_transform_color(gx_device *dev, gsicc_link_t *icclink, void *inputcolor,
-                              void *outputcolor, int num_bytes)
- {
--    return gscms_transformm_color_const(dev, icclink, inputcolor, outputcolor, num_bytes);
-+    return gscms_transform_color_const(dev, icclink, inputcolor, outputcolor, num_bytes);
- }
- 
- int
--- 
-2.25.1
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 95305a5e06..ca26a38a02 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9550/SHA512SUMS
-sha512  3646b7981dced443559ba97c74c08463139e86a5479661e4dcd217c51e3f8e766da9cf4d7889a98ba3c079a17e9e5b452cc765b633e0720deab2337e77efdd09  ghostscript-9.55.0.tar.gz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9561/SHA512SUMS
+sha512  f498384af80654c040635564b8bc9a64c4bb5b0769bb00aade4042bbe9117c482362dc1a1fac72db3ce9487dd5a5bb8fb81b35b360680fe598df33dfbbe79499  ghostscript-9.56.1.tar.gz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 02cb35fcfc..5bf8b08966 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.55.0
+GHOSTSCRIPT_VERSION = 9.56.1
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
