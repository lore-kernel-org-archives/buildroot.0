Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BEDCDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 14:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C6A61143;
	Fri, 20 Oct 2023 14:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C6A61143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIiZEwxJ0P95; Fri, 20 Oct 2023 14:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3204370534;
	Fri, 20 Oct 2023 14:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3204370534
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E41C01BF860
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 14:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E8E370534
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 14:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E8E370534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTX3TmVJNGHK for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 14:53:12 +0000 (UTC)
X-Greylist: delayed 1947 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 20 Oct 2023 14:53:12 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C64B61143
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C64B61143
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 14:53:11 +0000 (UTC)
Received: from bl14-19-118.dsl.telepac.pt ([85.247.19.118]
 helo=trinity.bot.igalia.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qtqMj-0039I7-J9; Fri, 20 Oct 2023 16:20:41 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 20 Oct 2023 15:20:41 +0100
Message-Id: <20231020142041.25503-1-clopez@igalia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iGSHK9vNbGlJASkc6BHoawiKBXY7T2HDVrF0D4LODXU=; b=jCiiPtKZDjaJLFdX8KtYjVhXE2
 VqQgkeowHDFx4kYKGCdcUpF9+RkSiGnDCyZ/CoabT8sV/mqupglvMRvF8NVZtV7J9p8E3NGDmlqls
 O41NeOcgyk4BlwNrtm8UL7wuOAQwIOU2I8EWEo5BFy1nZftnS7IiP3eQ9qEOmGocxhsYj2JxGTPEO
 9pl/Z1GDOnhyGT1X0YMrNlPbrYrT7YOTpPFK7L+DjHyKE42fBjmreNoQhLlhF3o6Mo6O9ka+CTDLW
 +6Z/PcbIkgIqU81tW8w9yLWB+Mu2K/CYfNG3egLIHY6829+waxv0D0k5HJNTVt1sgFbssiQozyw+6
 PEHhiWsQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=jCiiPtKZ
Subject: [Buildroot] [PATCH 1/1] configs/raspberrypi*: stop setting
 powersave as the default CPU governor
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* The defconfigs from the RPi Kernel set `powersave` as the default
  CPU governor, which is a bad idea as that reduces performance by
  setting the CPU frequency to the minimum one.

* In case of a buildroot build user-space is not configured by default
  to change the CPU governor, so `powersave` will remain the CPU
  governor and it will slow down everything.

* I submitted a fix for those defconfigs to upstream here:
  https://github.com/raspberrypi/linux/pull/5666
  However, we shouldn't wait until that is accepted and backported
  to all the stable branches (if ever is).

* This patch unsets the selection of `powersave` as the default CPU
  governor.

* Then the CPU governor that will be selected as default after this
  patch will be the Linux's default one that is either `ondemand` or
  `schedutil` depending on the Kernel version.

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 board/raspberrypi/default-cpu-governor.fragment | 9 +++++++++
 configs/raspberrypi0_defconfig                  | 1 +
 configs/raspberrypi0w_defconfig                 | 1 +
 configs/raspberrypi2_defconfig                  | 1 +
 configs/raspberrypi3_64_defconfig               | 1 +
 configs/raspberrypi3_defconfig                  | 1 +
 configs/raspberrypi3_qt5we_defconfig            | 1 +
 configs/raspberrypi4_64_defconfig               | 1 +
 configs/raspberrypi4_defconfig                  | 1 +
 configs/raspberrypi_defconfig                   | 1 +
 configs/raspberrypicm4io_64_defconfig           | 1 +
 configs/raspberrypicm4io_defconfig              | 1 +
 configs/raspberrypizero2w_defconfig             | 1 +
 13 files changed, 21 insertions(+)
 create mode 100644 board/raspberrypi/default-cpu-governor.fragment

diff --git a/board/raspberrypi/default-cpu-governor.fragment b/board/raspberrypi/default-cpu-governor.fragment
new file mode 100644
index 0000000000..e2e201d71d
--- /dev/null
+++ b/board/raspberrypi/default-cpu-governor.fragment
@@ -0,0 +1,9 @@
+# The defconfigs from the RPi Kernel set "powersave" as the default CPU governor.
+# That is a bad idea as it reduces performance, so we unset that default option here.
+# The option to build the powersave governor (but not as the default) is also enabled.
+# A fix for this was sent to upstream: https://github.com/raspberrypi/linux/pull/5666
+# However, we need to carry this option override until those defconfigs are fixed on
+# *all* the kernel branches that we support. So that can be a long time depending
+# on wheter the above PR gets accepted and/or backported to the stable branches.
+CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=n
+CONFIG_CPU_FREQ_GOV_POWERSAVE=y
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 4506e94bce..a5a019822d 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -8,6 +8,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 7a35794c2d..420cf53f7c 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -8,6 +8,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 9b484c5588..84c7a85393 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -11,6 +11,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 4d838ae0e8..b67cd5ae90 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -10,6 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 0a59ab42a9..81995bb67e 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -10,6 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 40d0c0f888..4040d03066 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -11,6 +11,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 5942f7c4e1..fb2a916a4c 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -10,6 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 4e5580c140..2a2fc2aa21 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -10,6 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index cca53f9b37..55deb343b2 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -10,6 +10,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 29cb0472d7..b4abc9126b 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -10,6 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index 017aecc0dd..106ca50609 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -10,6 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index 2ea503ca24..17e386d4f1 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -8,6 +8,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/default-cpu-governor.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
