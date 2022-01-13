Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE545C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 795F8415C0;
	Thu, 13 Jan 2022 21:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6gSsN9mNPxr; Thu, 13 Jan 2022 21:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA950415BD;
	Thu, 13 Jan 2022 21:40:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 784341BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 665CB84CEB
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TyPAn1pKmxz for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:40:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A372484CDE
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:40:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3AB1B828C8; Thu, 13 Jan 2022 21:33:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 22:12:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e68ec6de08f0ae9488a4df62ea15eb7e2bdf7b8
X-Git-Newrev: ddba0ef6b1e8e407c44bb1036a75aecaeb89da92
X-Patchwork-Hint: ignore
Message-Id: <20220113213356.3AB1B828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pahole: new host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddba0ef6b1e8e407c44bb1036a75aecaeb89da92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pahole is a tool used to show data structure embedded in debugging
information formats like DWARF.

It is notably needed by the Linux kernel to generate BPF Type
Format (BTF) information used by Compile Once - Run Everywhere (CO-RE)
BPF tools.

To be built, pahole needs __LIB to be set to lib at stated in its
README.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                    |  3 +++
 package/Config.in.host        |  1 +
 package/pahole/Config.in.host |  6 ++++++
 package/pahole/pahole.hash    |  3 +++
 package/pahole/pahole.mk      | 18 ++++++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a17e828aa5..a91e2dfcde 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -971,6 +971,9 @@ N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
 F:	package/odhcploc/
 
+N:	Francis Laniel <flaniel@linux.microsoft.com>
+F:	package/pahole/
+
 N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index c390ae3e7d..20034f6ee0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -61,6 +61,7 @@ menu "Host utilities"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/opkg-utils/Config.in.host"
+	source "package/pahole/Config.in.host"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
 	source "package/pigz/Config.in.host"
diff --git a/package/pahole/Config.in.host b/package/pahole/Config.in.host
new file mode 100644
index 0000000000..e427629632
--- /dev/null
+++ b/package/pahole/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PAHOLE
+	bool "host pahole"
+	help
+	  Pahole and other DWARF utils.
+
+	  https://git.kernel.org/pub/scm/devel/pahole/pahole.git
diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
new file mode 100644
index 0000000000..420db15e75
--- /dev/null
+++ b/package/pahole/pahole.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  cde85af68b368f50a913be387f94f6b43612a04af6c92387b4dcabb712a668fe  pahole-v1.23-br1.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
new file mode 100644
index 0000000000..1ad937062d
--- /dev/null
+++ b/package/pahole/pahole.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# pahole
+#
+################################################################################
+
+PAHOLE_VERSION = v1.23
+PAHOLE_SITE = git://git.kernel.org/pub/scm/devel/pahole/pahole.git
+PAHOLE_SITE_METHOD = git
+# pahole contains git submodule and relies on them to be built.
+PAHOLE_GIT_SUBMODULES = YES
+HOST_PAHOLE_DEPENDENCIES = host-elfutils
+# Defining __LIB is needed to build pahole.
+HOST_PAHOLE_CONF_OPTS = -D__LIB=lib
+PAHOLE_LICENSE = GPL-2.0
+PAHOLE_LICENSE_FILES = COPYING
+
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
