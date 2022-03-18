Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AA6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACB404037E;
	Fri, 18 Mar 2022 22:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MfLb5dG0nLuA; Fri, 18 Mar 2022 22:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87FE440275;
	Fri, 18 Mar 2022 22:41:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8F011BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C40F440374
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZ7WywHyYJuH for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:40:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D77D640131
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:40:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 167AB83AA0; Fri, 18 Mar 2022 22:31:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 23:26:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1b25c32a2b46fb74bec3818248379513b7d788b
X-Git-Newrev: 752f478affb5eba6364f44abccdb77ad60e5f000
X-Patchwork-Hint: ignore
Message-Id: <20220318223159.167AB83AA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: add support to build with
 python-cryptography
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
Content-Type: multipart/mixed; boundary="===============4603675760056858388=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4603675760056858388==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=752f478affb5eba6364f44abccdb77ad60e5f000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer version of optee-os (>= 3.16) uses python-cryptography instead of
python-pycryptodomex in python scripts. Add support to build these
newer versions by adding a new
BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY option which will
select host-python-cryptography dependency when building optee-os.

Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
[yann.morin.1998@free.fr:
  - move the _ARCH_DEPENDS option from the main symbol to thus new
    symbol
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/optee-os/Config.in   | 9 +++++++++
 boot/optee-os/optee-os.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index ea16550b72..b998228121 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -61,6 +61,15 @@ config BR2_TARGET_OPTEE_OS_NEEDS_DTC
 	  Select this option if your OP-TEE OS platform configuration
 	  requires the Device Tree compiler to be available.
 
+config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
+	bool "OP-TEE OS needs host-python-cryptography"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	help
+	  OP-TEE OS version below 3.16 used python-pycryptodomex
+	  package in python scripts. Newer version uses
+	  python-cryptography. Select this option if optee-os needs
+	  python-cryptography to be built.
+
 config BR2_TARGET_OPTEE_OS_CORE
 	bool "Build core"
 	default y
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 9f76d8450e..5313a1badc 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -21,7 +21,13 @@ else
 OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
 endif
 
-OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pycryptodomex host-python-pyelftools
+OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
+
+ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
+OPTEE_OS_DEPENDENCIES += host-python-cryptography
+else
+OPTEE_OS_DEPENDENCIES += host-python-pycryptodomex
+endif
 
 ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_DTC),y)
 OPTEE_OS_DEPENDENCIES += host-dtc

--===============4603675760056858388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4603675760056858388==--
