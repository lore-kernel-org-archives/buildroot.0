Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7A9C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:18:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C9F60184
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04C9F60184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C501E40785;
	Thu, 26 Aug 2021 22:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NfvnwJ7Snqf8; Thu, 26 Aug 2021 22:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2017840799;
	Thu, 26 Aug 2021 22:18:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 647291C1135
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4583740788
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UNN_BmOIxFs for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C8684078D
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C1C3A8DC50; Thu, 26 Aug 2021 22:01:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 22:23:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3e524755a943e1d22b404c256deeb137fd895100
X-Git-Newrev: 0a8ef2f3f7bc211d38a5a37007bdeb489bd37aae
X-Patchwork-Hint: ignore
Message-Id: <20210826220127.C1C3A8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/network-manager: needs
 headers >= 4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a8ef2f3f7bc211d38a5a37007bdeb489bd37aae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

network-manager uncondtionally uses ETHTOOL_GLINKSETTINGS since version
1.31.3 and
https://github.com/NetworkManager/NetworkManager/commit/4a81fe13ae18cb6d157d7cb3eec300f3061263fe
which is only available since kernel 4.6 and
https://github.com/torvalds/linux/commit/3f1ac7a700d039c61d8d8b99f28d605d489a60cf
resulting in the following build failure since commit
360d1aad84449c6a1993d8c7e469dc0cd35339a2:

In file included from ./src/libnm-glib-aux/nm-default-glib.h:69:0,
                 from ./src/libnm-glib-aux/nm-default-glib-i18n-lib.h:13,
                 from src/libnm-platform/nm-platform-utils.c:6:
src/libnm-platform/nm-platform-utils.c: In function '_ethtool_cmd_to_string':
src/libnm-platform/nm-platform-utils.c:280:51: error: 'ETHTOOL_GLINKSETTINGS' undeclared (first use in this function)
                                 NM_UTILS_ENUM2STR(ETHTOOL_GLINKSETTINGS, "ETHTOOL_GLINKSETTINGS"),
                                                   ^

Fixes:
 - http://autobuild.buildroot.org/results/10b9b68ab6987b99b3e8dfb2d651808008ad0bb7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 38ab43740f..43987451b6 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	# Tested with 3.2, but may even work with earlier versions
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
@@ -62,10 +62,10 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads, gcc >= 4.9"
+comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
