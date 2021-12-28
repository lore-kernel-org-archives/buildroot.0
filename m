Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC789C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 22:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73D3A405BC;
	Tue, 28 Dec 2021 22:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-snGOMYzsvZ; Tue, 28 Dec 2021 22:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FB5E405B4;
	Tue, 28 Dec 2021 22:06:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EEFC1BF9AC
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1FF0813D5
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lfmSvBTin3zs for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 22:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2625F813B2
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 22:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E5E8782AFE; Tue, 28 Dec 2021 22:00:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 23:05:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ff5f838f056b4b4889ae0fc241ded46f54250b2
X-Git-Newrev: 78d7c5f803c2f59385b57525e2d1d09da15e22a6
X-Patchwork-Hint: ignore
Message-Id: <20211228220013.E5E8782AFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: add visible option to
 build host-nodejs
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

commit: https://git.buildroot.net/buildroot/commit/?id=78d7c5f803c2f59385b57525e2d1d09da15e22a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To use nodejs on the host (independant of the actual system) to create
some static files to place onto the target rootfs nodejs can be very
helpful.

The provided nodejs package didn't expose the possibility to create a
host package, which this commit adds.

This patch contains fixes based on feedback from:
- Peter Seiderer <ps.report@gmx.net>
- Yann E. MORIN <yann.morin.1998@free.fr>

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host        |  1 +
 package/nodejs/Config.in      |  6 +-----
 package/nodejs/Config.in.host | 13 +++++++++++++
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 6e5a5c5fc5..7400da5894 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -56,6 +56,7 @@ menu "Host utilities"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
+	source "package/nodejs/Config.in.host"
 	source "package/odb/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 99c76bc3de..016aeb4e1a 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -27,11 +27,7 @@ config BR2_PACKAGE_NODEJS
 	# uses dlopen(). On ARMv5, we could technically support static
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_HOST_PYTHON3
-	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
-	select BR2_PACKAGE_HOST_PYTHON3_SSL
-	select BR2_PACKAGE_HOST_QEMU
-	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
+	select BR2_PACKAGE_HOST_NODEJS
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_ZLIB
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
new file mode 100644
index 0000000000..86eaf21dac
--- /dev/null
+++ b/package/nodejs/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_NODEJS
+	bool "host nodejs"
+	depends on BR2_HOST_GCC_AT_LEAST_7
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_HOST_QEMU
+	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
+	help
+	  Event-driven I/O server-side JavaScript environment based on
+	  V8.
+
+	  http://nodejs.org/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
