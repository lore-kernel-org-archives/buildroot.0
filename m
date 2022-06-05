Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2A8C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9210B41748;
	Sun,  5 Jun 2022 20:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zm7iQVZCL0f; Sun,  5 Jun 2022 20:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4616941719;
	Sun,  5 Jun 2022 20:55:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0C591BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89642840D9
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqDNV2XaB1MC for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:55:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B997D8409D
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:55:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 14FCE86BE8; Sun,  5 Jun 2022 20:43:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 22:49:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d8c5d9b53437741c79cd3d759de1fe81af9055fd
X-Git-Newrev: edfa431c9b7b53dbbb3063bd5efd88aac84b1c6e
X-Patchwork-Hint: ignore
Message-Id: <20220605204341.14FCE86BE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/optee-os: add support to
 build with python-pillow
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=edfa431c9b7b53dbbb3063bd5efd88aac84b1c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some specific versions of OP-TEE need the python-pillow module on the
host to build support for the TUI (Trusted User Interface) feature.

To allow building such OP-TEE versions, this commit adds the option
BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW which when enabled ensures
that host-python-pillow is built before OP-TEE.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/optee-os/Config.in   | 7 +++++++
 boot/optee-os/optee-os.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index fb8a189a75..0be6e68b0c 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -72,6 +72,13 @@ config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	  python-cryptography. Select this option if optee-os needs
 	  python-cryptography to be built.
 
+config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW
+	bool "OP-TEE OS needs host-python-pillow"
+	help
+	  Some specific OP-TEE OS versions may use python-pillow to
+	  build the Trusted User Interface feature.  Select this
+	  option if optee-os need python-pillow to be built.
+
 config BR2_TARGET_OPTEE_OS_CORE
 	bool "Build core"
 	default y
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 5313a1badc..88f14b48e4 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -29,6 +29,10 @@ else
 OPTEE_OS_DEPENDENCIES += host-python-pycryptodomex
 endif
 
+ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_PILLOW),y)
+OPTEE_OS_DEPENDENCIES += host-python-pillow
+endif
+
 ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_DTC),y)
 OPTEE_OS_DEPENDENCIES += host-dtc
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
