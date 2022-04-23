Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B950C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C62984190A;
	Sat, 23 Apr 2022 16:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKssEhXySn3T; Sat, 23 Apr 2022 16:33:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C826417CA;
	Sat, 23 Apr 2022 16:33:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CF891BF95D
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 965A560F16
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rguYZ-nOy38m for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E08D860E26
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8BA4B84202; Sat, 23 Apr 2022 16:22:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:15:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2945215624ec66b4d691be527561a4a5b64e7028
X-Git-Newrev: 68ef4e546dcdade5fc768fbebf9e064f5240db2d
X-Patchwork-Hint: ignore
Message-Id: <20220423162249.8BA4B84202@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vde2: fix build with BR2_OPTIMIZE_0
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

commit: https://git.buildroot.net/buildroot/commit/?id=68ef4e546dcdade5fc768fbebf9e064f5240db2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with BR2_OPTIMIZE_0:

/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips64-buildroot-linux-uclibc/10.3.0/../../../../mips64-buildroot-linux-uclibc/bin/ld: vde_l3.o: in function `ip_output_ready':
vde_l3.c:(.text+0xb30): undefined reference to `iphead'

Fixes:
 - http://autobuild.buildroot.org/results/5eeefcdac0b8974a424a885fdc2e82f7cb4b617d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...003-vde_l3-Add-static-to-inline-functions.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch b/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch
new file mode 100644
index 0000000000..7f771dfc7e
--- /dev/null
+++ b/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch
@@ -0,0 +1,37 @@
+vde_l3: Add static to inline functions
+
+Add static to inline functions to avoid the following build failure
+with BR2_OPTIMIZE_0:
+
+/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips64-buildroot-linux-uclibc/10.3.0/../../../../mips64-buildroot-linux-uclibc/bin/ld: vde_l3.o: in function `ip_output_ready':
+vde_l3.c:(.text+0xb30): undefined reference to `iphead'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5eeefcdac0b8974a424a885fdc2e82f7cb4b617d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nura vde2-2.3.2.orig/src/vde_l3/vde_l3.c vde2-2.3.2/src/vde_l3/vde_l3.c
+--- vde2-2.3.2.orig/src/vde_l3/vde_l3.c	2022-04-21 11:05:17.393452698 +0200
++++ vde2-2.3.2/src/vde_l3/vde_l3.c	2022-04-21 11:10:36.509804404 +0200
+@@ -100,17 +100,17 @@
+ };
+ 
+ 
+-inline struct vde_ethernet_header *ethhead(struct vde_buff *vdb)
++static inline struct vde_ethernet_header *ethhead(struct vde_buff *vdb)
+ {
+ 	return (struct vde_ethernet_header*)(vdb->data);
+ }
+ 
+-inline struct iphdr *iphead(struct vde_buff *vdb)
++static inline struct iphdr *iphead(struct vde_buff *vdb)
+ {
+ 	return (struct iphdr*)(vdb->data + 14);
+ }
+ 
+-inline void *payload(struct vde_buff *vdb)
++static inline void *payload(struct vde_buff *vdb)
+ {
+ 	return (uint8_t*)(vdb->data + 14 + sizeof(struct iphdr));
+ }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
