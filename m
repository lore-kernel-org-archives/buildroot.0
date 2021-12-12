Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3353C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C53D42716;
	Sun, 12 Dec 2021 14:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ct_RQNfjlXLY; Sun, 12 Dec 2021 14:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35194270F;
	Sun, 12 Dec 2021 14:12:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 596B11BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4936085757
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQdFPEqu3ii1 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96BC68574A
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B5E9C82D86; Sun, 12 Dec 2021 14:06:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:04:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad32710f5937c41ebae9f60b306aa9b3efea548a
X-Git-Newrev: 60621916c258fc8edf1e8695ffec50b2a787c60e
X-Patchwork-Hint: ignore
Message-Id: <20211212140652.B5E9C82D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openfpgaloader: add cmsis-dap
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60621916c258fc8edf1e8695ffec50b2a787c60e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CMSIS-DAP support depends on hidapi, but this package has depends on
udev so instead of adding this option by default, this let user decide.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Arnout: also propagate hidapi's NPTL dependency]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openfpgaloader/Config.in         | 16 ++++++++++++++++
 package/openfpgaloader/openfpgaloader.mk |  7 +++++++
 2 files changed, 23 insertions(+)

diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index c998369bed..054278c256 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -10,6 +10,22 @@ config BR2_PACKAGE_OPENFPGALOADER
 
 	  https://github.com/trabucayre/openFPGALoader/
 
+if BR2_PACKAGE_OPENFPGALOADER
+
+config BR2_PACAKGE_OPENFPGALOADER_CMSIS
+	bool "CMSIS-DAP support"
+	depends on BR2_PACKAGE_HAS_UDEV # hidapi
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hidapi -> libusb
+	select BR2_PACKAGE_HIDAPI
+	help
+	  openfpgaloader CMSIS-DAP support
+
+comment "openfpgaloader CMSIS-DAP needs udev /dev management and a toolchain w/ NPTL threads"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
