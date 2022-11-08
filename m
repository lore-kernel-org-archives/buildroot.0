Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318A3C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC64B60E38;
	Tue,  8 Nov 2022 19:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC64B60E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDDJQ-DI_75D; Tue,  8 Nov 2022 19:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0CED60E1E;
	Tue,  8 Nov 2022 19:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0CED60E1E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1D0F1BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAB2860E1E
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAB2860E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOb2-q69Qf0w for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:41:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E657F60AA3
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E657F60AA3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D57C88824A; Tue,  8 Nov 2022 19:41:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 20:39:14 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 7f15ebaa75e2444fc671bb3b1fb0ec227c67ac60
X-Git-Newrev: 8db8c313318f95f90d9143b5144ee10847b8d838
X-Patchwork-Hint: ignore
Message-Id: <20221108194133.D57C88824A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/shapelib: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=8db8c313318f95f90d9143b5144ee10847b8d838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
