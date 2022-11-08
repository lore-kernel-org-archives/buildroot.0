Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C0FC4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8299F81E64;
	Tue,  8 Nov 2022 19:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8299F81E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNzPq0344Wsl; Tue,  8 Nov 2022 19:40:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4EB681E60;
	Tue,  8 Nov 2022 19:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4EB681E60
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D67E61BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B25BF60AA3
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B25BF60AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYk6hEuzvHad for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:40:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E564A606FF
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E564A606FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D271188244; Tue,  8 Nov 2022 19:40:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 20:39:36 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: db93b802bcaa1ce1349129b177687d40735866a7
X-Git-Newrev: 0fe9a26ca302821aa9976bd64e2f2d537495999d
X-Patchwork-Hint: ignore
Message-Id: <20221108194025.D271188244@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/shapelib: fix
 CVE-2022-0699
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fe9a26ca302821aa9976bd64e2f2d537495999d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

A double-free condition exists in contrib/shpsort.c of shapelib 1.5.0
and older releases. This issue may allow an attacker to cause a denial
of service or have other unspecified impact via control over malloc.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 810c0eecf1fb81de43c67d602290e911d6a3a486)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-Remove-double-free-in-contrib-shpsrt.patch | 26 ++++++++++++++++++++++
 package/shapelib/shapelib.mk                       |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch b/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
new file mode 100644
index 0000000000..a565874b8c
--- /dev/null
+++ b/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
@@ -0,0 +1,26 @@
+From c75b9281a5b9452d92e1682bdfe6019a13ed819f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Albin=20Eldst=C3=A5l-Ahrens?= <laeder.keps@gmail.com>
+Date: Mon, 3 Jan 2022 12:34:41 +0100
+Subject: [PATCH] Remove double free() in contrib/shpsrt, issue #39
+
+This fixes issue #39
+
+[Retrieved from:
+https://github.com/OSGeo/shapelib/commit/c75b9281a5b9452d92e1682bdfe6019a13ed819f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ contrib/shpsort.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/contrib/shpsort.c b/contrib/shpsort.c
+index e21e9e0..920cd8c 100644
+--- a/contrib/shpsort.c
++++ b/contrib/shpsort.c
+@@ -113,7 +113,6 @@ static char ** split(const char *arg, const char *delim) {
+ 	free(result[--i]);
+       }
+       free(result);
+-      free(copy);
+       return NULL;
+     }
+     result = tmp;
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index 52f9584e19..37d2d9ae64 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -11,4 +11,7 @@ SHAPELIB_LICENSE_FILES = web/license.html COPYING
 SHAPELIB_CPE_ID_VENDOR = osgeo
 SHAPELIB_INSTALL_STAGING = YES
 
+# 0001-Remove-double-free-in-contrib-shpsrt.patch
+SHAPELIB_IGNORE_CVES += CVE-2022-0699
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
