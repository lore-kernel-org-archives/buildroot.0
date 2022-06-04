Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB36C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 12:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16745844EC;
	Sat,  4 Jun 2022 12:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPS-CszeN7Dk; Sat,  4 Jun 2022 12:45:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 262E884410;
	Sat,  4 Jun 2022 12:45:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EECE1BF5A5
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 12:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 077EF40C03
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 12:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=pm.me
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id law-OMzeeZll for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 12:45:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42DAA4002B
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 12:45:44 +0000 (UTC)
Date: Sat, 04 Jun 2022 12:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1654346741; x=1654605941;
 bh=9n7d4mRxtj3LoXFuUg8rRC75xvZW235yQoiQYwN2NIU=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=JBqzYVBLUYPxtJeOsotDGCSY+i85smYsro6UITwD2POUI8zW8coxfU8sePKDOXMTK
 lVAZ2Zqq/k5OBSNOTcOOh4CMhEPeOzHU8PKcjHSOQ41wsLVA0T3L1XtrcvACku/MGf
 2NZZPpvqm2krqIPK9mbu/XWi9k0ge8ou5HMSMKj22d3/dMkIHFYGiAT6S1hmJw1eGo
 5y4wZ+VecKCN/d18RuDeaMJLdgeobzGXxGkjKnpbd4tEcPHpK0CQW0NbUC1x+8c1Fb
 Kn2HKmtiASN6xJo95BX0lo1fEFZLzh5t1dIfkJad/15g428ZHRRBgEKLmHvYX5aP2+
 nY4d8bhxUgZ0A==
To: buildroot@buildroot.org
Message-ID: <20220604124523.22056-1-rknecht@pm.me>
Feedback-ID: 8957232:user:proton
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] configs/docker_*: add build config for
 docker images
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
From: Roger Knecht via buildroot <buildroot@buildroot.org>
Reply-To: Roger Knecht <rknecht@pm.me>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Roger Knecht <rknecht@pm.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot is not only great to build embedded systems but also to
create minimal docker images. Adding a default configuration for
docker images makes it easier to use.

How to build a Docker image with Buildroot:
$ make docker_x86_64_defconfig
$ make

Create a Docker image from Buildroot rootfs:
$ docker image import output/images/rootfs.tar buildroot-image:latest

Run Docker container:
$ docker run --rm -it buildroot-image:latest /bin/sh

Signed-off-by: Roger Knecht <rknecht@pm.me>
---
v2:
 - Added Docker defconfig for ARM(64)

 DEVELOPERS                       | 3 +++
 configs/docker_aarch64_defconfig | 8 ++++++++
 configs/docker_arm_defconfig     | 8 ++++++++
 configs/docker_x86_64_defconfig  | 8 ++++++++
 configs/docker_x86_defconfig     | 9 +++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 configs/docker_aarch64_defconfig
 create mode 100644 configs/docker_arm_defconfig
 create mode 100644 configs/docker_x86_64_defconfig
 create mode 100644 configs/docker_x86_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index c33959fa45..ed46867afa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2474,6 +2474,9 @@ F:	package/chocolate-doom/
 F:	package/irssi/
 F:	package/vnstat/

+N:	Roger Knecht <rknecht@pm.me>
+F:	configs/docker_*
+
 N:	Romain Naour <romain.naour@gmail.com>
 F:	board/qemu/
 F:	configs/qemu_*
diff --git a/configs/docker_aarch64_defconfig b/configs/docker_aarch64_defconfig
new file mode 100644
index 0000000000..33577190c5
--- /dev/null
+++ b/configs/docker_aarch64_defconfig
@@ -0,0 +1,8 @@
+# Architecture
+BR2_aarch64=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_TAR=y
+
+# Init
+BR2_INIT_NONE=y
diff --git a/configs/docker_arm_defconfig b/configs/docker_arm_defconfig
new file mode 100644
index 0000000000..e17892fdf4
--- /dev/null
+++ b/configs/docker_arm_defconfig
@@ -0,0 +1,8 @@
+# Architecture
+BR2_arm=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_TAR=y
+
+# Init
+BR2_INIT_NONE=y
diff --git a/configs/docker_x86_64_defconfig b/configs/docker_x86_64_defconfig
new file mode 100644
index 0000000000..e571e8162a
--- /dev/null
+++ b/configs/docker_x86_64_defconfig
@@ -0,0 +1,8 @@
+# Architecture
+BR2_x86_64=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_TAR=y
+
+# Init
+BR2_INIT_NONE=y
diff --git a/configs/docker_x86_defconfig b/configs/docker_x86_defconfig
new file mode 100644
index 0000000000..33bb25a309
--- /dev/null
+++ b/configs/docker_x86_defconfig
@@ -0,0 +1,9 @@
+# Architecture
+BR2_i386=y
+BR2_x86_i686=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_TAR=y
+
+# Init
+BR2_INIT_NONE=y
--
2.17.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
