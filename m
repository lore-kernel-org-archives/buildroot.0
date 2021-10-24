Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6A5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 11:37:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81BD16054E
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 11:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81BD16054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FCBA60771;
	Sun, 24 Oct 2021 11:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1-nJ6vxXFHy; Sun, 24 Oct 2021 11:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 854E66069C;
	Sun, 24 Oct 2021 11:37:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF871BF406
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 11:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AAE06069C
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 11:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIRlXEJzSis3 for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 11:37:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A1436063E
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 11:37:07 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 5so13650289edw.7
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 04:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DtqDvj3ukOoYLuNbyi1Af3A7RPI5HVKnNsm3fz8XzDk=;
 b=bNeFDXjAq0HEy6xC2eu056bI/Y44/KaMeBth/LHTLeHX5BafFbKKr7WgC2B9yvJ9/2
 tFl8lrijn3sRmhHJC2Pn6crSEZ09QwV7YZwLA02prPPYr8WTegVkiVG3cn0Vjl959TAW
 Zxd4b2wjvb5L+qDHqU1fKqxAYUGNngtfd0Z1y0X7SDrJdgCI8j4XPqwWnAcDl/+7Oxjy
 sLxHKLmWG9QP69XehidGt4PBOL9mYleCwTBIHGMQAeJx0165FoksAnBuZsj38orXHx6z
 zj09fJF2+Ua8K5ZSPHt6jPqnSke2X4UYLkJd8MXImviznHjcSpM2RzkP1BlDM6xqHbOG
 FKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DtqDvj3ukOoYLuNbyi1Af3A7RPI5HVKnNsm3fz8XzDk=;
 b=ts8uEwZU4SNXTFPJmDCKSPHV7hwsRL+V3rCeMbxPcABUa3yp3K9jagnuLttDIHK6EK
 w0vDmTW/yUVi9nbtJwKuzs/557izH9Nd6NrtVETl5/dvXaAbd4+w2d8h6Vt8DIHigcUK
 eKS4urmBPjJipfpGd2KPE1ex4K37H15sX437swSI+EUxQ+VNTC98yk0kTY+6PW6kjn5z
 FzB+2N+kq3ywaMMNW4VsgDgDeDHHKpQr4Ah3sSPKtICbFdM7vOxyVhZ/BQ0QXmCSWXHw
 StbwMcKRr9RpcHD9Ic+TFU1xGVoiSonU1TRex8dEZqSVwwhlMr37Zi//awpmLfozv9gr
 SWhw==
X-Gm-Message-State: AOAM530dcce8HD8m0zTGSRZol31fo/UZ0H9/+HIlpcvshywahe665AGS
 9jZqFw+gjWmg43hkx4HSrvOzKreSQ10=
X-Google-Smtp-Source: ABdhPJzuke581vzG5ixovNAdN24rDlgifvtp4WV0E8LnWv5iJ2v43XlkYYlsNq8sHseRIGPqypFifA==
X-Received: by 2002:a17:906:68c2:: with SMTP id
 y2mr14487122ejr.18.1635075425487; 
 Sun, 24 Oct 2021 04:37:05 -0700 (PDT)
Received: from localhost.localdomain (138.23.87.79.rev.sfr.net. [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id x22sm7205256edv.14.2021.10.24.04.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 04:37:05 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 13:36:54 +0200
Message-Id: <20211024113654.88720-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/clpeak: new package
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

clpeak is a tool that profiles OpenCL devices to find
their peak capacities

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/clpeak/Config.in   | 14 ++++++++++++++
 package/clpeak/clpeak.hash |  3 +++
 package/clpeak/clpeak.mk   | 13 +++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/clpeak/Config.in
 create mode 100644 package/clpeak/clpeak.hash
 create mode 100644 package/clpeak/clpeak.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f864f7ef47..41cef4a442 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1034,6 +1034,7 @@ N:	Gilles Talis <gilles.talis@gmail.com>
 F:	board/freescale/imx8mmevk/
 F:	configs/freescale_imx8mmevk_defconfig
 F:	package/cctz/
+F:	package/clpeak/
 F:	package/faad2/
 F:	package/fdk-aac/
 F:	package/httping/
diff --git a/package/Config.in b/package/Config.in
index d40eb9dabc..0a7c0deea8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -87,6 +87,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
+	source "package/clpeak/Config.in"
 	source "package/coremark/Config.in"
 	source "package/coremark-pro/Config.in"
 	source "package/dacapo/Config.in"
diff --git a/package/clpeak/Config.in b/package/clpeak/Config.in
new file mode 100644
index 0000000000..6b0aeb220c
--- /dev/null
+++ b/package/clpeak/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CLPEAK
+	bool "clpeak"
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  clpeak is a tool that profiles OpenCL devices
+	  to find their peak capacities
+
+	  https://github.com/krrishnarraj/clpeak
+
+comment "clpeak needs an OpenCL provider, a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_PACKAGE_HAS_LIBOPENCL \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/clpeak/clpeak.hash b/package/clpeak/clpeak.hash
new file mode 100644
index 0000000000..e0d2c1e92b
--- /dev/null
+++ b/package/clpeak/clpeak.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  1e9c3f959498253d6bb956dc786de7b3e4019264216a1781c06ae49a1d6600e5  clpeak-0777205be1d5681d5a76d46ec94588544e8462a5.tar.gz
+sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/clpeak/clpeak.mk b/package/clpeak/clpeak.mk
new file mode 100644
index 0000000000..e36170d8aa
--- /dev/null
+++ b/package/clpeak/clpeak.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# clpeak
+#
+################################################################################
+
+CLPEAK_VERSION = 0777205be1d5681d5a76d46ec94588544e8462a5
+CLPEAK_SITE = $(call github,krrishnarraj,clpeak,$(CLPEAK_VERSION))
+CLPEAK_LICENSE = Unlicense
+CLPEAK_LICENSE_FILES = LICENSE
+CLPEAK_DEPENDENCIES = libopencl
+
+$(eval $(cmake-package))
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
