Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2639C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50C9141624;
	Sat, 14 May 2022 09:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkK1GGsvm518; Sat, 14 May 2022 09:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08C744086E;
	Sat, 14 May 2022 09:51:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3976D1BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36D3241674
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0HbEbV8Urman for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 587804086E
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 13F588376E; Sat, 14 May 2022 09:39:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:37:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d95a6dac3143a74fbd011eb423f3010ae3b05927
X-Git-Newrev: 4a1e3ff0713b04373d4838c75ffcb84ee021ace4
X-Patchwork-Hint: ignore
Message-Id: <20220514093944.13F588376E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: wired driver needs
 headers >= 4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a1e3ff0713b04373d4838c75ffcb84ee021ace4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wired driver enables macsec support which depends on if_macsec.h.
That header has only been exported since kernel v4.6, see commit:
https://github.com/torvalds/linux/commit/dece8d2b78d19df7fe5e4e965f1f0d1a3e188d1b

Fixes:
- http://autobuild.buildroot.net/results/6bb619eb7fdecf7824fcc549c4ccb8e487665d10/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 7e2432985c..92953f69f0 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -42,6 +42,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
 config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
 	bool "Enable wired support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	help
@@ -49,6 +50,9 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
 	  supplicant can be used with Ethernet.  This also enables
 	  support for MACSEC.
 
+comment "wired macsec support needs a toolchain w/ headers >= 4.6"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+
 comment "wired support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
