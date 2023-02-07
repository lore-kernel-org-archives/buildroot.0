Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B04C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10ED641770;
	Tue,  7 Feb 2023 13:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10ED641770
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbAN5pB5ayeg; Tue,  7 Feb 2023 13:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF88141780;
	Tue,  7 Feb 2023 13:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF88141780
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C93D1BF376
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43EDD60F4C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43EDD60F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6tmX1lN3O8mf for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:44:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77EC060E76
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77EC060E76
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6378E8418E; Tue,  7 Feb 2023 13:44:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 14:44:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d68b617993bd2f5c82a4936ed1e24e4fec6b94a2
X-Git-Newrev: 33bdf7bb037c05863aa69bbe219e1cb78d596a3a
X-Patchwork-Hint: ignore
Message-Id: <20230207134415.6378E8418E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-linux: fix build with kernel
 >= 6.1
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
Content-Type: multipart/mixed; boundary="===============1099072138559779076=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1099072138559779076==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=33bdf7bb037c05863aa69bbe219e1cb78d596a3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with kernel >= 6.1

In file included from ./include/linux/string.h:20,
                 from ./include/linux/bitmap.h:11,
                 from ./include/linux/cpumask.h:12,
                 from ./include/linux/mm_types_task.h:14,
                 from ./include/linux/mm_types.h:5,
                 from ./include/linux/buildid.h:5,
                 from ./include/linux/module.h:14,
                 from /home/autobuild/autobuild/instance-11/output-1/build/dahdi-linux-3.2.0/drivers/dahdi/wctc4xxp/base.c:24:
./arch/powerpc/include/asm/string.h:27:22: note: expected ‘void *’ but argument is of type ‘const unsigned char *’
   27 | extern void * memcpy(void *,const void *,__kernel_size_t);
      |                      ^~~~~~
/home/autobuild/autobuild/instance-11/output-1/build/dahdi-linux-3.2.0/drivers/dahdi/wctc4xxp/base.c:661:9: error: too many arguments to function ‘netif_napi_add’
  661 |         netif_napi_add(netdev, &wc->napi, &wctc4xxp_poll, 64);
      |         ^~~~~~~~~~~~~~
In file included from ./include/net/inet_sock.h:19,
                 from ./include/linux/udp.h:16,
                 from /home/autobuild/autobuild/instance-11/output-1/build/dahdi-linux-3.2.0/drivers/dahdi/wctc4xxp/base.c:38:
./include/linux/netdevice.h:2562:1: note: declared here
 2562 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
      | ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d7ce103a886329c68c04ebe05571be8f95a873ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0004-next-fix-kernel-6-1-build.patch           | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/dahdi-linux/0004-next-fix-kernel-6-1-build.patch b/package/dahdi-linux/0004-next-fix-kernel-6-1-build.patch
new file mode 100644
index 0000000000..b910c4b775
--- /dev/null
+++ b/package/dahdi-linux/0004-next-fix-kernel-6-1-build.patch
@@ -0,0 +1,32 @@
+From a759a578277bde98eba7ef4bf86bdf819a900de9 Mon Sep 17 00:00:00 2001
+From: John Thomson <git@johnthomson.fastmail.com.au>
+Date: Sun, 23 Oct 2022 13:42:52 +1000
+Subject: [PATCH] fix kernel 6.1 build
+
+kernel 6.1 includes b48b89f9c189 ("net: drop the weight argument from netif_napi_add") [0]
+
+[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b48b89f9c189d24eb5e2b4a0ac067da5a24ee86d
+
+Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
+[Retrieved from:
+https://github.com/asterisk/dahdi-linux/pull/14/commits/a759a578277bde98eba7ef4bf86bdf819a900de9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/dahdi/kernel.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/dahdi/kernel.h b/include/dahdi/kernel.h
+index 35e93bc4..fd64a15e 100644
+--- a/include/dahdi/kernel.h
++++ b/include/dahdi/kernel.h
+@@ -58,6 +58,10 @@
+ 
+ #include <linux/poll.h>
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0)
++#define netif_napi_add netif_napi_add_weight
++#endif
++
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0)
+ #include <linux/pci.h>
+ #include <linux/dma-mapping.h>

--===============1099072138559779076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1099072138559779076==--
