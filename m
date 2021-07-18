Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339B7C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:41:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9FA061037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9FA061037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B482D60ABE;
	Tue,  3 Aug 2021 23:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOqkKrtFrpaM; Tue,  3 Aug 2021 23:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBCB360ADB;
	Tue,  3 Aug 2021 23:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 079A91BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2BCD40F1F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1h2UuWFKIxmv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AD1340697
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8C69583FEF; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 14:01:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 367e926678cf9e72fcb97012faa88fa24a79a937
X-Git-Newrev: 1176b02a1cf562b5d13fe176b9aed35c6e19868d
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.8C69583FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libqb: needs threads
 and dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=1176b02a1cf562b5d13fe176b9aed35c6e19868d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libqb fails to build without threads or dynamic library since the
addition of the package in commit
22864d570dd18d78a77dedab8fbcc5e0122c0acc

Also add ac_cv_prog_cc_c99=-std=gnu99 to fix build failure without wchar

Fixes:
 - http://autobuild.buildroot.org/results/21c1b5d29da4949f4582056ab4e2335ec225d8d6
 - http://autobuild.buildroot.org/results/aa4df6364cdf3c862be13b6b738595f420ec6105
 - http://autobuild.buildroot.org/results/376d316094238ba7097e8bdc51960ba38532683a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqb/Config.in    | 5 +++++
 package/libqb/libqb.mk     | 4 ++++
 package/usbguard/Config.in | 4 ++--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libqb/Config.in b/package/libqb/Config.in
index 4ab010ca50..e481835dfc 100644
--- a/package/libqb/Config.in
+++ b/package/libqb/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_LIBQB
 	bool "libqb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBXML2
 	help
 	  Library for client-server applications
 
 	  https://github.com/ClusterLabs/libqb
+
+comment "libqb needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index a0d97d5eb8..a9cf5e3fb9 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -13,4 +13,8 @@ LIBQB_INSTALL_STAGING = YES
 LIBQB_AUTORECONF = YES
 LIBQB_DEPENDENCIES = libxml2
 
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
+LIBQB_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
+
 $(eval $(autotools-package))
diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 582e9b3852..34e24a2156 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_USBGUARD
 	bool "usbguard"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
-	depends on !BR2_STATIC_LIBS # protobuf
+	depends on !BR2_STATIC_LIBS # libqb, protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_LIBQB
 	help
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
