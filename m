Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5998AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 20:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B02A83F21;
	Sat, 28 May 2022 20:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZkteSOWNVLA; Sat, 28 May 2022 20:41:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E141583F14;
	Sat, 28 May 2022 20:41:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD5811BF962
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D76608A5
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zt7vAJAprmwt for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 20:40:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA3E4607B4
 for <buildroot@buildroot.org>; Sat, 28 May 2022 20:40:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 74A5E8632F; Sat, 28 May 2022 20:29:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 22:40:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3ee0c781e44f03349795fc65e28d26085ec30d3
X-Git-Newrev: d590003e31dd0c72ef51fd7d9515af62017b0c56
X-Patchwork-Hint: ignore
Message-Id: <20220528202917.74A5E8632F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcsc-lite: needs gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d590003e31dd0c72ef51fd7d9515af62017b0c56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc >= 4.9 is needed since bump to version 1.9.6 in commit
b02f13cd54912f3dffd0e0863378050104430d77 and
https://github.com/LudovicRousseau/PCSC/commit/d56ed18dbebc4423506ce7f61d3e3bcf4bdc4cb0:

In file included from winscard_clnt.c:123:0:
readerfactory.h:101:3: error: unknown type name '_Atomic'
   _Atomic DWORD dwEventStatus; /**< Recent event that must be sent */
   ^

Fixes:
 - http://autobuild.buildroot.org/results/189f030a2252f17abf8b819feec0003815c66e79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/acsccid/Config.in    | 2 +-
 package/ccid/Config.in       | 2 +-
 package/libnfc/Config.in     | 6 ++++--
 package/pcsc-lite/Config.in  | 6 ++++--
 package/strongswan/Config.in | 4 ++++
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/acsccid/Config.in b/package/acsccid/Config.in
index a926be6e16..2d644ea567 100644
--- a/package/acsccid/Config.in
+++ b/package/acsccid/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ACSCCID
 	bool "acsccid"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite, libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb, pcsc-lite
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index aae5a7181c..c12733375b 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CCID
 	bool "ccid"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb, pcsc-lite
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index ead61e4529..3686f570a9 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -13,13 +13,15 @@ config BR2_PACKAGE_LIBNFC_ACR122_PCSC
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 	help
 	  support for acr112_pcsc driver
 
-comment "acr122_pcsc driver needs a toolchain w/ threads, dynamic library"
+comment "acr122_pcsc driver needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_LIBNFC_ACR122_USB
 	bool "acr122_usb driver"
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index 1b4d0f7d18..f4ed5ba2f0 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PCSC_LITE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Atomic keyword
 	help
 	  Middleware to access smart card using SCard API (PC/SC).
 
@@ -33,6 +34,7 @@ config BR2_PACKAGE_PCSC_LITE_EMBEDDED
 
 endif
 
-comment "pcsc-lite needs a toolchain w/ threads, dynamic library"
+comment "pcsc-lite needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 430625a102..919ce1f5bc 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -108,9 +108,13 @@ config BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE
 config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
 	bool "Enable EAP-SIM smart card backend"
 	depends on !BR2_STATIC_LIBS # pcsc-lite
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
+comment "EAP-SIM smart backend needs a toolchain w/ dynamic library, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_STRONGSWAN_EAP_AKA
 	bool "Enable EAP-AKA"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
