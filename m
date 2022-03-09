Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C455C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 22:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFCFC60FAB;
	Wed,  9 Mar 2022 22:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4vnCtX8GZOW; Wed,  9 Mar 2022 22:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDC4360F18;
	Wed,  9 Mar 2022 22:08:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0C2C1BF41F
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB3CB40143
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYn7O-Y8Ea6E for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 22:08:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B476040142
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 22:08:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 52B9583A68; Wed,  9 Mar 2022 21:59:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 23:06:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f4f57b62b371252425bde4440cedcac45fcaebd
X-Git-Newrev: 4accbb4655d3816fd230f9820e6aac4ee9b1d8fc
X-Patchwork-Hint: ignore
Message-Id: <20220309215932.52B9583A68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzma-alone: new package
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
Content-Type: multipart/mixed; boundary="===============8983961402689939810=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8983961402689939810==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4accbb4655d3816fd230f9820e6aac4ee9b1d8fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides "lzma_alone" host binary based on the original
LZMA SDK. It provides few extra options when compared to the LZMA Utils
/ XZ Utils project "lzma" binary (already packaged as the "lzma").

This packaging schema (LZMA SDK with lzma -> lzma_alone rename) follows
Debian's solution. Please note that Debian also uses LZMA SDK for the
base "lzma" tool which may be considered for Buildroot too - as an
independent change. Similar packaging is also used by Ubuntu & Arch.

lzma_alone is a requirement for preparing firmware images for some
Broadcom based home routers with a picky CFE bootloader. It has limited
LZMA support and building compatible images requires specifying
dictionary size and lc/lp/pb LZMA values manually.

Version 9.22 is used as it's the last release using .tar.bz2 format. The
same version is used by Debian.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
[yann.morin.1998@free.fr:
  - add the upstream sha1, add comments
  - fix license
  - add license file and its sha256
  - fix coding styles
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in.host             |  1 +
 package/lzma-alone/Config.in.host  | 18 ++++++++++++++++++
 package/lzma-alone/lzma-alone.hash |  5 +++++
 package/lzma-alone/lzma-alone.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index e5fbb07fc2..cd1c34b5a3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -50,6 +50,7 @@ menu "Host utilities"
 	source "package/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
+	source "package/lzma-alone/Config.in.host"
 	source "package/mender-artifact/Config.in.host"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
diff --git a/package/lzma-alone/Config.in.host b/package/lzma-alone/Config.in.host
new file mode 100644
index 0000000000..053b869635
--- /dev/null
+++ b/package/lzma-alone/Config.in.host
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_HOST_LZMA_ALONE
+	bool "host lzma-alone"
+	help
+	  LZMA has two well-known command-line tools:
+	  1. lzma from LZMA SDK
+	  2. lzma from XZ Utils (previously LZMA Utils)
+
+	  This package provides the former one which:
+	  1. Gives more control over compression parameters
+	  2. Gets named lzma_alone to allow coexistence
+
+	  This tool may be used to prepare firmwares for bootloaders
+	  with limited LZMA support.
+	  E.g. Broadcom's CFE bootloader for MIPS BCM47xx devices is
+	  known to fail to boot images using LZMA compression with
+	  dictionary.
+
+	  https://www.7-zip.org/sdk.html
diff --git a/package/lzma-alone/lzma-alone.hash b/package/lzma-alone/lzma-alone.hash
new file mode 100644
index 0000000000..33901d1620
--- /dev/null
+++ b/package/lzma-alone/lzma-alone.hash
@@ -0,0 +1,5 @@
+# From https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/
+sha1  fbe4d6c02202d65fae75c2db0e3cdc542ca41e6d  lzma922.tar.bz2
+# Locally computed
+sha256  9aade84f229fb25f7aef39d8866b375fe6d35a9e18098d7cd86a99e294902944  lzma922.tar.bz2
+sha256  65cd2f7b76266889cbdcec55ab8ce6e845beabb5f450d58287439b25666e3b6a  lzma.txt
diff --git a/package/lzma-alone/lzma-alone.mk b/package/lzma-alone/lzma-alone.mk
new file mode 100644
index 0000000000..2ed6c2c772
--- /dev/null
+++ b/package/lzma-alone/lzma-alone.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# lzma-alone
+#
+################################################################################
+
+LZMA_ALONE_VERSION = 9.22
+LZMA_ALONE_SITE = https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK
+LZMA_ALONE_SOURCE = lzma922.tar.bz2
+LZMA_ALONE_STRIP_COMPONENTS = 0
+LZMA_ALONE_LICENSE = Public Domain
+LZMA_ALONE_LICENSE_FILES = lzma.txt
+
+define HOST_LZMA_ALONE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/C/Util/Lzma -f makefile.gcc
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/CPP/7zip/Bundles/LzmaCon -f makefile.gcc
+endef
+
+define HOST_LZMA_ALONE_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 \
+		$(@D)/CPP/7zip/Bundles/LzmaCon/lzma \
+		$(HOST_DIR)/bin/lzma_alone
+endef
+
+$(eval $(host-generic-package))

--===============8983961402689939810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8983961402689939810==--
