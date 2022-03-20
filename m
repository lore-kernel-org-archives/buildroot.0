Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A19C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E59106070A;
	Sun, 20 Mar 2022 18:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35BhybQG3WSi; Sun, 20 Mar 2022 18:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E7D460AD7;
	Sun, 20 Mar 2022 18:48:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07ECE1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9C94401AE
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djfAltwBXozw for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6117440577
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7921A8461A; Sun, 20 Mar 2022 18:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 19:24:01 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d3c27619bfb917e5b2e893871d2a25f434c8efc3
X-Git-Newrev: 1feb0309f967fbbed17e96f99ddf555ec0e2054d
X-Patchwork-Hint: ignore
Message-Id: <20220320183734.7921A8461A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/optee-os: add option
 to select DTC dependency
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
Content-Type: multipart/mixed; boundary="===============3438581436300280999=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3438581436300280999==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1feb0309f967fbbed17e96f99ddf555ec0e2054d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Some platforms (stm32, sam) needs DTC to build the platform
device-trees. Add BR2_TARGET_OPTEE_OS_NEEDS_DTC configuration
option to select host-dtc package when building.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
[yann.morin.1998@free.fr: move option]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 67be54cd943a466aab6bf53df2aa9e712da43556)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/optee-os/Config.in   | 7 +++++++
 boot/optee-os/optee-os.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 0974578484..ea16550b72 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -54,6 +54,13 @@ config BR2_TARGET_OPTEE_OS_VERSION
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
+config BR2_TARGET_OPTEE_OS_NEEDS_DTC
+	bool "OP-TEE OS needs dtc"
+	select BR2_PACKAGE_HOST_DTC
+	help
+	  Select this option if your OP-TEE OS platform configuration
+	  requires the Device Tree compiler to be available.
+
 config BR2_TARGET_OPTEE_OS_CORE
 	bool "Build core"
 	default y
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 166b5e693c..9f76d8450e 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -23,6 +23,10 @@ endif
 
 OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pycryptodomex host-python-pyelftools
 
+ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_DTC),y)
+OPTEE_OS_DEPENDENCIES += host-dtc
+endif
+
 # On 64bit targets, OP-TEE OS can be built in 32bit mode, or
 # can be built in 64bit mode and support 32bit and 64bit
 # trusted applications. Since buildroot currently references

--===============3438581436300280999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3438581436300280999==--
