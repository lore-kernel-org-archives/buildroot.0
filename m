Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0528FC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:07:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50C060F56
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C50C060F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A13B26084D;
	Sat, 31 Jul 2021 22:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdEevSVQtwPR; Sat, 31 Jul 2021 22:07:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DAF4607C3;
	Sat, 31 Jul 2021 22:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE611BF2C1
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D15514021F
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmeR-6BIX7Yu for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11E4840225
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 417478A3F4; Sat, 31 Jul 2021 22:04:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbf8047f64f081ffbc97b67dd891690632377692
X-Git-Newrev: 62cab101356c97432da482e168adaf065de65c4f
X-Patchwork-Hint: ignore
Message-Id: <20210731220453.417478A3F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xerces: needs dynamic library
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=62cab101356c97432da482e168adaf065de65c4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable xerces on toolchains without dynamic library to avoid a static
build failure raised since the addition of xml-security-c in commit
bbda38afbbfa79ff436e1a187bb267b8d9558036 because xerces-c.pc does not
contain icu or iconv dependencies in Libs.Private

Fixes:
 - http://autobuild.buildroot.org/results/3e4f31eb017878d3417742cbc83e16bc848db98e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xerces/Config.in         | 6 ++++--
 package/xml-security-c/Config.in | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 828b5dd2a0..20cd2ab1a6 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
@@ -17,5 +18,6 @@ config BR2_PACKAGE_XERCES_ENABLE_NETWORK
 
 endif
 
-comment "xerces-c++ needs a toolchain w/ C++, wchar"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+comment "xerces-c++ needs a toolchain w/ C++, dynamic library, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR
diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
index 17d0ca3aad..02544d5a01 100644
--- a/package/xml-security-c/Config.in
+++ b/package/xml-security-c/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XML_SECURITY_C
 	bool "xml-security-c"
 	depends on BR2_INSTALL_LIBSTDCPP # xerces
+	depends on !BR2_STATIC_LIBS # xerces
 	depends on BR2_USE_WCHAR # xerces
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
@@ -12,6 +13,6 @@ config BR2_PACKAGE_XML_SECURITY_C
 
 	  https://santuario.apache.org/cindex.html
 
-comment "xml-security-c needs a toolchain w/ C++, wchar, gcc >= 4.7"
+comment "xml-security-c needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
