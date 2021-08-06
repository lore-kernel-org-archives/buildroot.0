Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE2FC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 12:49:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4946E611C3
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 12:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4946E611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C40A83BC1;
	Fri,  6 Aug 2021 12:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YRNFHAQPxyqH; Fri,  6 Aug 2021 12:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F7B683B83;
	Fri,  6 Aug 2021 12:49:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65FCF1BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 12:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62A6F608FE
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 12:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2tBinXEYq2-i for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 12:49:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2955C6086D
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 12:49:06 +0000 (UTC)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05ADF4FB;
 Fri,  6 Aug 2021 14:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628254142;
 bh=1MujidM/blZs8UF/MYR6Jou/0ryDN6Zj3RAeZd6GH0g=;
 h=From:To:Cc:Subject:Date:From;
 b=N/dhIWSQXC3S3t6EoB4ZGBP56olCQE1S5Cs4U/71atHEyZ0gzB36828XjpuiV3Lm9
 uctJFvxZnKX7PptAQkVXQx/BLauPzXHi7u9jkB8j82hinp4tXdlykkMeZpy5rja0d9
 0RXInbI29lycj1l1HS3EnqD/ibSPXctJEPX7yL3g=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 15:48:54 +0300
Message-Id: <20210806124854.1832099-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rwmem: new package
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

rwmem is small tool to read & write device registers. Some of the
features include:

- support mmaped and i2c devices
- addressing with 8/16/32/64 bit addresses
- accessing 8/16/32/64 bit memory locations
- little and big endian addressess and accesses
- bitfields
- address ranges
- register description database

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 package/Config.in        |  1 +
 package/rwmem/Config.in  | 10 ++++++++++
 package/rwmem/rwmem.hash |  2 ++
 package/rwmem/rwmem.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/rwmem/Config.in
 create mode 100644 package/rwmem/rwmem.hash
 create mode 100644 package/rwmem/rwmem.mk

diff --git a/package/Config.in b/package/Config.in
index 046c04e994..6e97346eb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -134,6 +134,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/ramsmp/Config.in"
 	source "package/ramspeed/Config.in"
 	source "package/rt-tests/Config.in"
+	source "package/rwmem/Config.in"
 	source "package/sentry-native/Config.in"
 	source "package/spidev_test/Config.in"
 	source "package/strace/Config.in"
diff --git a/package/rwmem/Config.in b/package/rwmem/Config.in
new file mode 100644
index 0000000000..0fd9142e92
--- /dev/null
+++ b/package/rwmem/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RWMEM
+	bool "rwmem"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_FMT
+	select BR2_PACKAGE_INIH
+	help
+	  Simple program to read/write from/to any location in memory.
+
+	  https://github.com/tomba/rwmem
diff --git a/package/rwmem/rwmem.hash b/package/rwmem/rwmem.hash
new file mode 100644
index 0000000000..9becbc5b21
--- /dev/null
+++ b/package/rwmem/rwmem.hash
@@ -0,0 +1,2 @@
+sha256  55d28f029c0cd5c21d3e1c89371e2905d5217f571ef5389ed0fce163804d1c4a  rwmem-c8291705c82bb0686be9adf6a427a2b72114719a.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rwmem/rwmem.mk b/package/rwmem/rwmem.mk
new file mode 100644
index 0000000000..24c4e92efc
--- /dev/null
+++ b/package/rwmem/rwmem.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# rwmem
+#
+################################################################################
+
+RWMEM_VERSION = c8291705c82bb0686be9adf6a427a2b72114719a
+RWMEM_SITE = $(call github,tomba,rwmem,$(RWMEM_VERSION))
+RWMEM_LICENSE = GPL-2.0
+RWMEM_LICENSE_FILES = LICENSE
+RWMEM_CONF_OPTS = -Dpyrwmem=disabled
+RWMEM_DEPENDENCIES = host-pkgconf fmt inih
+
+$(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
