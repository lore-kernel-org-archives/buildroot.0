Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C54DCD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 21:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C746D60D70;
	Tue,  2 Apr 2024 21:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXnMCDWqnFwo; Tue,  2 Apr 2024 21:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB19260D61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB19260D61;
	Tue,  2 Apr 2024 21:27:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 673151BF295
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5BF380B5A
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMAOYLmccF6r for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C24780314
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C24780314
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 935D58026F; Tue,  2 Apr 2024 21:27:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 2 Apr 2024 23:22:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 305abd7a302a7859eabc934eba0ffb85cd3657ff
X-Git-Newrev: 8a29521747e78b68e4bfa3a06150163921dd4908
X-Patchwork-Hint: ignore
Message-Id: <20240402212732.935D58026F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix build with glibc 2.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a29521747e78b68e4bfa3a06150163921dd4908
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing systemd's libcrypt dependency this
broke any systemd build using glibc version 2.39.

To fix this add the libxcrypt dependency to systemd which is the
preferred way of providing libcrypt support in systemd as the glibc
variant is only used as a fallback due to being deprecated.

We should also have host-systemd depend on host-libxcrypt in case
the host system does not provide glibc with libcrypt support.

Fixes:
 - http://autobuild.buildroot.net/results/36e/36efcfc76c015c9b4c955c13afa0f81a98b529f4

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/Config.in  | 1 +
 package/systemd/systemd.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index aa5143d484..a94e9b73b8 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -28,6 +28,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBXCRYPT
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c6b006d1fb..8987dc19a6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -55,6 +55,7 @@ SYSTEMD_DEPENDENCIES = \
 	host-python-jinja2 \
 	kmod \
 	libcap \
+	libxcrypt \
 	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
 
@@ -882,6 +883,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-util-linux \
 	host-patchelf \
 	host-libcap \
+	host-libxcrypt \
 	host-gperf \
 	host-python-jinja2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
