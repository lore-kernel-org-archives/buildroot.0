Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E29E7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0178C83C95;
	Thu, 21 Sep 2023 18:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0178C83C95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RAZi_y2w2GPd; Thu, 21 Sep 2023 18:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458E583C93;
	Thu, 21 Sep 2023 18:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 458E583C93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98A2A1BF98E
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 715D84207D
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 715D84207D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dF8NUaoHAo4Z for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:51:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED5D941DB8
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED5D941DB8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D955F874B9; Thu, 21 Sep 2023 18:51:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 20:49:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6425e0b8482e53d5ab5ff2d655628ba7d4be3960
X-Git-Newrev: ec8a9cc5189d41cf751e872f5c13da3fdc9187ee
X-Patchwork-Hint: ignore
Message-Id: <20230921185155.D955F874B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcl: fix package patch
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec8a9cc5189d41cf751e872f5c13da3fdc9187ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit 4e365d1768 "package/tcl: bump to version 8.6.13" did NOT
refreshed the package patch, because the patch was still applying
correctly and the package was working as expected.

It was refreshed in the previous bump, in commit 9cf314745a
"package/tcl: bump to version 8.6.12". This was part of 2022.02.

Looking closer at the patch content, the -/+ lines are exactly the
same. So this patch does not change anything. Since the file was kept
and the commit log mention a patch refresh, the intent was more
likely to carry over the old patch (which was declaring all libc
functions as "unbroken".

This commit actually refreshes this patch. It was regenerated with
git format-patch. Since the patch is renamed due to git format-patch,
the .checkpackageignore is updated accordingly.

Note:
This ancient patch will be removed soon, as an upstream commit [1],
not yet in a release, cleaned up and removed those old parts.

[1] https://github.com/tcltk/tcl/commit/04d66a25716cb7738dad3170cca4d0a4683db08a

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                      |  2 +-
 ...patch => 0001-Disable-tcl-compatibility-layers.patch} | 16 +++++++++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8acd9558eb..f8aaf41af9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1388,7 +1388,7 @@ package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch Upstr
 package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch Upstream
 package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch Upstream
 package/tcf-agent/S55tcf-agent Shellcheck Variables
-package/tcl/0001-dont-build-compat.patch Upstream
+package/tcl/0001-Disable-tcl-compatibility-layers.patch Upstream
 package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch Upstream
 package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch Upstream
 package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch Upstream
diff --git a/package/tcl/0001-dont-build-compat.patch b/package/tcl/0001-Disable-tcl-compatibility-layers.patch
similarity index 61%
rename from package/tcl/0001-dont-build-compat.patch
rename to package/tcl/0001-Disable-tcl-compatibility-layers.patch
index 7a7d959cd2..b7b776ad5d 100644
--- a/package/tcl/0001-dont-build-compat.patch
+++ b/package/tcl/0001-Disable-tcl-compatibility-layers.patch
@@ -1,4 +1,6 @@
+From c829552921f0c7c8e522f911135ee100742b441b Mon Sep 17 00:00:00 2001
 From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
+Date: Tue, 8 Apr 2014 15:54:04 -0500
 Subject: [PATCH] Disable tcl compatibility layers
 
 Turn off building compatibility layers for old/broken versions of
@@ -9,17 +11,25 @@ to not have broken behavior.
 Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
 [Fabrice: Update for 8.6.12]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Julien: Update for 8.6.13]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
+ unix/tcl.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
+index ca94abd4ad..42eb58d384 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
-@@ -2725,7 +2725,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
+@@ -2646,7 +2646,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
  #include <stdlib.h>
  #include <string.h>
  int main() {]$2[}]]])],[tcl_cv_$1_unbroken=ok],
 -		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
-+		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
-	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
++		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=ok]))
+ 	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
  	    tcl_ok=1
  	else
+-- 
+2.41.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
