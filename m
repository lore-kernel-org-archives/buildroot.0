Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C83BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 21:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1371408FC;
	Mon, 14 Mar 2022 21:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Be2j-sfZds3w; Mon, 14 Mar 2022 21:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FFD408BA;
	Mon, 14 Mar 2022 20:59:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AACD31BF263
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 20:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97F0040438
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 20:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlGAMJtJKNXm for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 20:59:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBED740153
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 20:59:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1FB3283E75; Mon, 14 Mar 2022 20:51:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 21:59:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77f9d2d6a6fc4a6485acd7b5f1970b638764c1fa
X-Git-Newrev: 67be54cd943a466aab6bf53df2aa9e712da43556
X-Patchwork-Hint: ignore
Message-Id: <20220314205118.1FB3283E75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: add option to select DTC
 dependency
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
Content-Type: multipart/mixed; boundary="===============4972054213141316027=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4972054213141316027==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=67be54cd943a466aab6bf53df2aa9e712da43556
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some platforms (stm32, sam) needs DTC to build the platform
device-trees. Add BR2_TARGET_OPTEE_OS_NEEDS_DTC configuration
option to select host-dtc package when building.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
[yann.morin.1998@free.fr: move option]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

--===============4972054213141316027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4972054213141316027==--
