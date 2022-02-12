Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34456C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E624B81D5C;
	Sat, 12 Feb 2022 13:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xS0VcKwK8m3N; Sat, 12 Feb 2022 13:14:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22BC281B14;
	Sat, 12 Feb 2022 13:14:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20B431BF954
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9498060592
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uziVLb2edR3B for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE458605DB
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0077782210; Sat, 12 Feb 2022 13:06:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 14:10:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8406392466ecd1591265e24e619202c79f08a39
X-Git-Newrev: cdbe856675dafc43838f628ce4838ee8dc8d3080
X-Patchwork-Hint: ignore
Message-Id: <20220212130603.0077782210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xml-security-c: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdbe856675dafc43838f628ce4838ee8dc8d3080
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add threads dependency to avoid the following build failure raised since
bump to version 2.0.4 in commit
27d08083ed4db5bd055219574cc602aaf8053a49:

configure: error: unable to find pthreads, currently this is required

Fixes:
 - http://autobuild.buildroot.org/results/b6065efaa722f2da911c7cf150d446da621e8c71

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xml-security-c/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
index 02544d5a01..c7963be69a 100644
--- a/package/xml-security-c/Config.in
+++ b/package/xml-security-c/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_XML_SECURITY_C
 	depends on !BR2_STATIC_LIBS # xerces
 	depends on BR2_USE_WCHAR # xerces
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends	on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XERCES
@@ -13,6 +14,7 @@ config BR2_PACKAGE_XML_SECURITY_C
 
 	  https://santuario.apache.org/cindex.html
 
-comment "xml-security-c needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7"
+comment "xml-security-c needs a toolchain w/ C++, wchar, dynamic library, threads, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
