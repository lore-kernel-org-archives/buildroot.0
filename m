Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7C5C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D99C460DB9;
	Fri, 18 Sep 2026 13:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhGrmuihRhnx; Fri, 18 Sep 2026 13:06:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2FAB560DF5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736789;
	b=LY/468+d1bQDwsXRWmMeE1ealUjbJnPrZREL+iycNG3urV2qa69JoxCrEWXkdMzey3Ni
	 YS9K/dOw1uJyaDZsPwHVHPw8m2Pn0pVgsFj95+5XRL4Ggah3y5KzLnV3kW5IY+NTCAHSO
	 zqSdOMMec2UTuB9pTn1WC36QCaecDMTarrGRp+9PvE79m01S07flmf6rMzwoxDcFtlDQ3
	 GSkTHnxeOP+JbipMvfBTjx6YuXjyL9aFas9WVmPhHEg/kt5cn+dMVQQ4a8FkjaB7Ey5dv
	 WaV0YXazHhdYsIUNdVtarbd3QdMLEsK2mpgdeuynQfu/Vv4Q2VZnccrySrn/HNRqLIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2WakZT47EWU4XZKPTZKax/yzK8PLSyNBNqVuVx54juc=;
	b=X7PMKXi6gjC0tcFGXNZfNvbmHNpBURkxcXycTFUwavZSeYTB0TMI9UAyujVbDVH3/vE2
	 Thsi0TXiZ7c4bU+wu2k+UdqKW6KCIyyQRjKJNEUxh9jgUR8/al2qzqKLCUfhzMeCHNQUh
	 o1/bcMqO2nNd5ROpq3umScP7niGuZZOl/tX+jEmsln/7P2+KZJMxS4A+JjSwNkuvODO47
	 uvIsnvis6t0pVLozkSuAdO5OGB8JpnSSq4aDxnBSUnQOWyw+qKhdlzyApiIKkM6ElRYJf
	 JnLFHxXO0egatzfsX92ZGkpxBhzTFy1RArEuGAaEuWqATO0QItBCeydbGkOicz6A0sQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736789;
	bh=2WakZT47EWU4XZKPTZKax/yzK8PLSyNBNqVuVx54juc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=reHCvc62iCRY5xhjqCohFOy6UEo6xi1bCY25qHteu3RfbYtDAqG5FH3XHH+yxgGSk
	 6zc/2Dj46Ceb0IXOnw13wkVJcXSHIz0aHX3PQ9vnk9ltU7NA/R73XX2YSKJ5VigDRf
	 iwa50GIni1AxBg7kfD+Ijz0Uhc9BGMpslRIPk5HdzGFCwuskSNUiSusqHm9BmWx6sH
	 1Z7pDN/Zkt95Ex0Ywsd6SLb5kFjaekgbvoqZeF2X64uUKES1UxfioyK+JmGdk8ym4r
	 BSVi4W/ZR5ng3HDapnrvcQUU3Z/SC6+dfUrqE/eBVUTfrlx2u/PHJ/LgLpX2foiu+M
	 ThVDIYvzN4JFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FAB560DF5;
	Fri, 18 Sep 2026 13:06:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27621224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF9B8124D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfoD9XlFYl0W for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CC2F38129C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=l2998vCjC4etUG63zXmYWHkuYckxTSnhwYUmxSL2IG9FTJRoh03sBrwwcrT+blIjcQnX
 gOP40bZOtRs/z95zKl4wvE2UfhY8RMIkG/qd2nbhQg57kgvRzxucZN0mMaIj5stR4pPvt
 Z4dplZFw5Ts9I1rrT0/wwJMmK/DTbboq3mqg65j7J8DddMBFs5oHepvEDUAXIDX5UTRrK
 Vasbku9e7y+juasMzqLOPvNAqdkD/eCsqswELpV4LLcP5aNUxRVJHdZ8eCceEYvZP88aE
 QuzEq1J1lgSG9KELNgSlxgOV4Fo34s0BdX9TKWmX9Z7LJo7oBCrMFINTxSxmqBspx5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AwtPSy+0ynodNfQbrOpvPuSqLfez7P8Af0t+eZ2FaNg=;
 b=HRR7i8va7wtn2iTWMQBLRKAW/WqSRd+CGXXF+0mebBFVF4+QqG7AEZsHE1Wfe32wrtZ8
 yHaTpQx2yrFI6yFGSeUWv1VlDm/LmWp00WfrXtYfZgf11eDPifF/mQZIc+EhV8WFA5alQ
 569X5GLIpXEMkbIEDda4WA0myVSRqjVak9oUX23MmXyBrup14EHC+B4PncYAJQ5GGGo+5
 Qw658Ps1kS3h0atylyvrSDrck8VzWYZnbXHgjWeinVp33xsW3oMFuTtCuJ6uGKybskksn
 RGuKpGjXLjJo6W7Wm3p+u/6mtvVtdvPEhAxSARKSdeZo5TIFeZzmxSBGxN4+boCNOlA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC2F38129C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 852EF97696; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:19:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4d2f85fd017fbd0a260bbf1044bb606b15d8cdc8
X-Git-Newrev: ec4c7979f9877cfca670b0a9865508c65b54426c
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.852EF97696@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/hidapi: propagate
 dependencies of libgudev
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec4c7979f9877cfca670b0a9865508c65b54426c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since hidapi was introduced in commit
6267f34afdd06ad848bbf7a2975cb279132b6ba0, it forgot to propagate some
dependencies of libgudev (which existed back then). Initially libgudev
was only needed when BR2_INIT_SYSTEMD=y, but still the dependencies
were not propagated for the systemd case.

Anyway, since e739dd5a11f5b2bd9648a45623bc174adae42b6e, libgudev is a
mandatory dependency of hidapi, independently from the selected init
system.

We make sure to propagate all dependencies of libgudev to hidapi, and
propagate them to the reverse dependencies of hidapi.

Fixes: 6267f34afdd06ad848bbf7a2975cb279132b6ba0 ("hidapi: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 74def2cdd46b44ede4d768026480291f56ccea87)
[tperale: drop libmanette change not present]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/hidapi/Config.in         | 8 ++++++--
 package/openfpgaloader/Config.in | 9 +++++++--
 package/openocd/Config.in        | 9 +++++++++
 package/python-hid/Config.in     | 8 ++++++--
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index 1d3c86b677..fa44288917 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_HIDAPI
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_USE_MMU # libgudev
+	depends on BR2_USE_WCHAR # libgudev
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -15,7 +17,9 @@ config BR2_PACKAGE_HIDAPI
 
 	  http://github.com/libusb/hidapi/
 
-comment "hidapi needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9"
+comment "hidapi needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index bd83ad415b..80305f1eba 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -17,12 +17,17 @@ config BR2_PACKAGE_OPENFPGALOADER_CMSIS
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hidapi -> libusb
+	depends on BR2_USE_MMU # hidapi
+	depends on BR2_USE_WCHAR # hidapi
 	select BR2_PACKAGE_HIDAPI
 	help
 	  openfpgaloader CMSIS-DAP support
 
-comment "openfpgaloader CMSIS-DAP needs udev /dev management and a toolchain w/ NPTL threads"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "openfpgaloader CMSIS-DAP needs udev /dev management and a toolchain w/ NPTL threads, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
 
 config BR2_PACKAGE_OPENFPGALOADER_LIBGPIOD
 	bool "libgpiod support"
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index a7e068f10d..2c2f6fe7aa 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -16,12 +16,21 @@ config BR2_PACKAGE_OPENOCD_CMSIS_DAP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
+	depends on BR2_USE_MMU # hidapi
+	depends on BR2_USE_WCHAR # hidapi
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_HIDAPI
 	help
 	  Enable support for CMSIS-DAP compliant debuggers (i.e
 	  Atmel/Microchip EDBG, etc.)
 
+comment "CMSIS-DAP support needs udev, toolchain w/ NPTL, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_OPENOCD_FTDI
 	bool "MPSSE mode of FTDI based devices"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/python-hid/Config.in b/package/python-hid/Config.in
index 3a9e16c9f4..e46a5c2000 100644
--- a/package/python-hid/Config.in
+++ b/package/python-hid/Config.in
@@ -3,13 +3,17 @@ config BR2_PACKAGE_PYTHON_HID
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hidapi
+	depends on BR2_USE_MMU # hidapi
+	depends on BR2_USE_WCHAR # hidapi
 	select BR2_PACKAGE_HIDAPI
 	help
 	  ctypes bindings for hidapi.
 
 	  https://github.com/apmorton/pyhidapi
 
-comment "python-hid needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9"
+comment "python-hid needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
