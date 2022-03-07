Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B66CC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDE9F40918;
	Mon,  7 Mar 2022 19:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dItPCaE8K409; Mon,  7 Mar 2022 19:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAFF0403F8;
	Mon,  7 Mar 2022 19:30:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 004251BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF76960B5E
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5leNcEM4w9BN for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:29:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4C3D60EAD
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 288D082DB9; Mon,  7 Mar 2022 19:21:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 20:28:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efcb7eeabc22df47ca09e69c99f73e9183ed6cf3
X-Git-Newrev: f41d47f15b63a4bbe026834478e63acba85d33fe
X-Patchwork-Hint: ignore
Message-Id: <20220307192114.288D082DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: link with -latomic
 if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=f41d47f15b63a4bbe026834478e63acba85d33fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link with -latomic if needed to avoid the following build failure raised
since the addition of the package in commit
7227d005d2435ec7b38995a6247d233ddb5ba365:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/libcamera-still.dir/libcamera_still.cpp.o: undefined reference to symbol '__atomic_fetch_sub_4@@LIBATOMIC_1.0'

Fixes:
 - http://autobuild.buildroot.org/results/b20465140f3a5281f9b586f442b67fd400e7184a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera-apps/libcamera-apps.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 210d4e1e52..f4fc019c17 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -45,4 +45,8 @@ else
 LIBCAMERA_APPS_CONF_OPTS += -DENABLE_QT=0
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBCAMERA_APPS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
