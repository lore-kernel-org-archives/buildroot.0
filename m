Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316B4C38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF60160BB8;
	Thu, 27 Oct 2022 06:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF60160BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDIPd1Z2PH1S; Thu, 27 Oct 2022 06:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1012360ADA;
	Thu, 27 Oct 2022 06:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1012360ADA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9590C1BF990
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70B7A40328
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70B7A40328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwXtT73pAgJc for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:51:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99A52400FE
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99A52400FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8941A872FA; Thu, 27 Oct 2022 06:51:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 08:50:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1545a88f9d5a694eed1a01dc0220ec1dabf5cabe
X-Git-Newrev: 810c0eecf1fb81de43c67d602290e911d6a3a486
X-Patchwork-Hint: ignore
Message-Id: <20221027065143.8941A872FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shapelib: fix CVE-2022-0699
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=810c0eecf1fb81de43c67d602290e911d6a3a486
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A double-free condition exists in contrib/shpsort.c of shapelib 1.5.0
and older releases. This issue may allow an attacker to cause a denial
of service or have other unspecified impact via control over malloc.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
