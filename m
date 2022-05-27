Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AC6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 12:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C20A361691;
	Fri, 27 May 2022 12:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSnvAzwiDfdC; Fri, 27 May 2022 12:01:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9A46168A;
	Fri, 27 May 2022 12:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 406A51BF40B
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 12:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D21142920
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 12:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=pm.me
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvsCNmyoOKHC for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 12:01:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65E264291E
 for <buildroot@buildroot.org>; Fri, 27 May 2022 12:01:16 +0000 (UTC)
Date: Fri, 27 May 2022 12:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1653652874; x=1653912074;
 bh=M6weIjytByB6g0lZ9yKcfnVsXo8z+r4Ust1B3GzE99I=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=L57H7hfJsL50+j9CGY/kd/p8VROnDkRLVrswIPrp3ybNm2mMENFVsan/sk2q7nECL
 vfBQiCpQfC8OXbuamYJfRd2XYOmU3ArNyu5/BTBdm4Kug2O525baw5AP4UlM7R5Kkc
 +tUGIsNS3V3jwtkDbdH3azX+NjEb9HONg8NlV/W8azsvUGR/0s9TJALdf90oZN6els
 gccZs+Y08f5pOVJ27sN+/XjNPfejTaxwNylWTW7bVKbdVlPKpna7XGGWIX63nO4Hd4
 gAwwB8MwuQfSFBeYNrhiuArx+tm31uuQuVKGdcIobL7T/oDviPi5sjZb50kpphUUj3
 ScFGsWCi97p9Q==
To: buildroot@buildroot.org
Message-ID: <20220527120048.25196-1-rknecht@pm.me>
Feedback-ID: 8957232:user:proton
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/docker_x86_*: add build config for
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
Cc: Roger Knecht <rknecht@pm.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot is not only great to build embedded systems but also to create minimal docker images.
Adding a default configuration for docker images makes it easier to use.

How to build a Docker image with Buildroot:
$ make docker_x86_64_defconfig
$ make

Create a Docker image from Buildroot rootfs:
$ docker image import output/images/rootfs.tar buildroot-image:latest

Run Docker container:
$ docker run --rm -it buildroot-image:latest /bin/sh

Signed-off-by: Roger Knecht <rknecht@pm.me>
---
 DEVELOPERS                      | 4 ++++
 configs/docker_x86_64_defconfig | 8 ++++++++
 configs/docker_x86_defconfig    | 9 +++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 configs/docker_x86_64_defconfig
 create mode 100644 configs/docker_x86_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index c33959fa45..dc28496654 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2474,6 +2474,10 @@ F:	package/chocolate-doom/
 F:	package/irssi/
 F:	package/vnstat/

+N:	Roger Knecht <rknecht@pm.me>
+F:	configs/docker_x86_64_defconfig
+F:	configs/docker_x86_defconfig
+
 N:	Romain Naour <romain.naour@gmail.com>
 F:	board/qemu/
 F:	configs/qemu_*
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
