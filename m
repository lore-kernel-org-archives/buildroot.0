Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA4FC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E929340169;
	Tue,  4 Feb 2025 15:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_2ygGHWZhr7; Tue,  4 Feb 2025 15:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA160406D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA160406D7;
	Tue,  4 Feb 2025 15:16:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D31E012A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A5060C07
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oz5FyOtnwOkF for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E39F86089A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E39F86089A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:16:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB23F86E09; Tue,  4 Feb 2025 15:16:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:16:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d456c47e0b0432b617e5894a776e8b22ea88286
X-Git-Newrev: 097faead4a46e0faee98684ce128472774fe9933
X-Patchwork-Hint: ignore
Message-Id: <20250204151630.DB23F86E09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: needs headers >=
 4.20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=097faead4a46e0faee98684ce128472774fe9933
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of NetworkManager to version 1.50 in Buildroot commit
489d1f924979f7a94008e887393702e3c3663705, it uses the
NETLINK_GET_STRICT_CHK netlink macro, which only appeared in Linux
4.20, so let's add a dependency on headers >= 4.20.

This has been detected by our
tests.package.test_python_sdbus_networkmanager.TestPythonPy3SdbusNetworkmanager
at:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/9019173666

NetworkManager is not selected by any package, so only fixing
package/network-manager/Config.in is necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 1d9a02c1d3..de7989a9c5 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+	# We need NETLINK_GET_STRICT_CHK
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
@@ -59,10 +60,10 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	  This option enables support for OpenVSwitch
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc or musl toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
+comment "NetworkManager needs udev /dev management and a glibc or musl toolchain w/ headers >= 4.20, dynamic library, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
