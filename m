Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E31C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 14:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AC7C6115B;
	Thu,  9 Dec 2021 14:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eAc0KqXhwMe2; Thu,  9 Dec 2021 14:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9162461159;
	Thu,  9 Dec 2021 14:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8B6A1BF391
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 14:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A403184FE1
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 14:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkycurKEkRng for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 14:14:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A78C84FB5
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 14:14:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.252.129.8])
 by smtp6-g21.free.fr (Postfix) with ESMTP id 45AB578039B;
 Thu,  9 Dec 2021 15:14:30 +0100 (CET)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 15:14:10 +0100
Message-Id: <20211209141410.694868-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/openfpgaloader: add cmsis-dap
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
 Jean Burgat <jeanburgat33@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

CMSIS-DAP support depends on hidapi, but this package has depends on
udev so instead of adding this option by default, this let user decide.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
- use select BR2_PACKAGE_HIDAPI and add depends on BR2_PACKAGE_HAS_UDEV (Thomas)
---
 package/openfpgaloader/Config.in         | 14 ++++++++++++++
 package/openfpgaloader/openfpgaloader.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index c998369bed..792ba918aa 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -10,6 +10,20 @@ config BR2_PACKAGE_OPENFPGALOADER
 
 	  https://github.com/trabucayre/openFPGALoader/
 
+if BR2_PACKAGE_OPENFPGALOADER
+
+config BR2_PACAKGE_OPENFPGALOADER_CMSIS
+	bool "CMSIS-DAP support"
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_HIDAPI
+	help
+	  openfpgaloader CMSIS-DAP support
+
+comment "openfpgaloader CMSIS-DAP needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
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
