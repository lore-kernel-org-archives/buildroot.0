Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9865C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 06:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 325BF4025F;
	Sat,  4 Dec 2021 06:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kc1OTGUQ6WkZ; Sat,  4 Dec 2021 06:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C12C402B0;
	Sat,  4 Dec 2021 06:01:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 016DC1BF83B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 06:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2BDF41295
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 06:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ju8JkcciW7kU for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 06:01:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEED8410B5
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 06:01:00 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtpfb2-g21.free.fr (Postfix) with ESMTP id 381804C29E
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 07:00:53 +0100 (CET)
Received: from x230.trabucayre.com (unknown
 [IPv6:2a01:e34:efc8:1080:3e97:eff:fe89:644f])
 by smtp2-g21.free.fr (Postfix) with ESMTP id B528D2003AE;
 Sat,  4 Dec 2021 07:00:46 +0100 (CET)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 06:59:44 +0100
Message-Id: <20211204055944.19323-2-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211204055944.19323-1-gwenj@trabucayre.com>
References: <20211204055944.19323-1-gwenj@trabucayre.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/openfpgaloader: add cmsis-dap
 support option
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Jean Burgat <jeanburgat33@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

CMSIS-DAP support depends on hidapi, but this package has depends on
udev so instead of adding this option by default, this let user decide.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/openfpgaloader/Config.in         | 13 +++++++++++++
 package/openfpgaloader/openfpgaloader.mk |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index c998369bed..c3712a8ea0 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -10,6 +10,19 @@ config BR2_PACKAGE_OPENFPGALOADER
 
 	  https://github.com/trabucayre/openFPGALoader/
 
+if BR2_PACKAGE_OPENFPGALOADER
+
+config BR2_PACAKGE_OPENFPGALOADER_CMSIS
+	bool "CMSIS-DAP support"
+	depends on BR2_PACKAGE_HIDAPI
+	help
+	  openfpgaloader CMSIS-DAP support
+
+comment "openfpgaloader CMSIS-DAP needs hidapi"
+	depends on !BR2_PACKAGE_HIDAPI
+
+endif
+
 comment "openfpgaloader needs a toolchain w/ threads, C++, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
index 73117cb994..0c39aad687 100644
--- a/package/openfpgaloader/openfpgaloader.mk
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -17,4 +17,11 @@ else
 OPENFPGALOADER_CONF_OPTS += -DENABLE_UDEV=OFF
 endif
 
+ifeq ($(BR2_PACAKGE_OPENFPGALOADER_CMSIS),y)
+OPENFPGALOADER_DEPENDENCIES += hidapi
+OPENFPGALOADER_CONF_OPTS += -DENABLE_CMSISDAP=ON
+else
+OPENFPGALOADER_CONF_OPTS += -DENABLE_CMSISDAP=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
