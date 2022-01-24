Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A5EC433FE
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BBC44063A;
	Mon, 24 Jan 2022 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNt8JOGFiljX; Mon, 24 Jan 2022 21:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F3AD40573;
	Mon, 24 Jan 2022 21:06:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F04091BF35F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED17F60EBF
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqBGOnhBGGF1 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:06:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D95460AEF
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:06:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 49458822C3; Mon, 24 Jan 2022 20:59:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 22:05:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e46157821f0ad4107e8ddcf039661e9ac189609
X-Git-Newrev: b23ef210299ca7f0eedf8fc898b0e5a0f3578293
X-Patchwork-Hint: ignore
Message-Id: <20220124205911.49458822C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyxml: fix CVE-2021-42260
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

commit: https://git.buildroot.net/buildroot/commit/?id=b23ef210299ca7f0eedf8fc898b0e5a0f3578293
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TinyXML through 2.6.2 has an infinite loop in TiXmlParsingData::Stamp in
tinyxmlparser.cpp via the TIXML_UTF_LEAD_0 case. It can be triggered by
a crafted XML message and leads to a denial of service.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tamp-always-advance-the-pointer-if-p-0xef.patch | 37 ++++++++++++++++++++++
 package/tinyxml/tinyxml.mk                         |  3 ++
 2 files changed, 40 insertions(+)

diff --git a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
new file mode 100644
index 0000000000..ea0f6476c8
--- /dev/null
+++ b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
@@ -0,0 +1,37 @@
+From f7ca0035d17a663f55668e662b840afce7b86112 Mon Sep 17 00:00:00 2001
+From: Christian Voegl <cvoegl@suse.com>
+Date: Wed, 27 Oct 2021 11:25:18 +0200
+Subject: [PATCH] In stamp always advance the pointer if *p= 0xef
+
+The current implementation only advanced if 0xef is followed
+by two non-zero bytes. In case of malformed input (0xef should be
+the start byte of a three byte character) this leads to an infinite
+loop. (CVE-2021-42260)
+
+[Retrieved (and backported) from:
+https://sourceforge.net/p/tinyxml/git/merge-requests/1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tinyxmlparser.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/tinyxmlparser.cpp b/src/tinyxmlparser.cpp
+index 81b7eae..8aa0dfa 100755
+--- a/src/tinyxmlparser.cpp
++++ b/src/tinyxmlparser.cpp
+@@ -274,6 +274,12 @@ void TiXmlParsingData::Stamp( const char* now, TiXmlEncoding encoding )
+ 						else
+ 							{ p +=3; ++col; }	// A normal character.
+ 					}
++					else
++					{
++						// TIXML_UTF_LEAD_0 (239) is the start character of a 3 byte sequence, so
++						// there is something wrong here. Just advance the pointer to evade infinite loops
++						++p;
++					}
+ 				}
+ 				else
+ 				{
+-- 
+2.34.1
+
diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index b8b8e43c05..d173254e31 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -14,4 +14,7 @@ TINYXML_LICENSE = Zlib
 TINYXML_LICENSE_FILES = README
 TINYXML_CPE_ID_VENDOT = tinyxml_project
 
+# 0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
+TINYXML_IGNORE_CVES += CVE-2021-42260
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
