Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37A6C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A04BA8412F;
	Mon, 20 Feb 2023 23:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A04BA8412F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id caTId1dmXXS8; Mon, 20 Feb 2023 23:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE77C84123;
	Mon, 20 Feb 2023 23:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE77C84123
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6FE51BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 230A64158C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 230A64158C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qs9uAmYbXdLO for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4124441745
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4124441745
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C56A8648F; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:30:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1e2e6e011a26d013869398299fc7bded38e8fdd7
X-Git-Newrev: 4f97275bc78b717bec0c5d1efaaf73a0e6e36f53
X-Patchwork-Hint: ignore
Message-Id: <20230220205243.3C56A8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ethtool: fix musl-libc
 builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f97275bc78b717bec0c5d1efaaf73a0e6e36f53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream commit 1fa60003a8b8 made a change to headers that broke
compiles for musl-libc based builds.

Apply the patch slated to address the issue.

Fixes:
  - http://autobuild.buildroot.net/results/eafd07dddfe7e8b714fc3fcaf77a2d7150694ee2/

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0002-marvell.c-Fix-build-with-musl-libc.patch  | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch b/package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..f13edbbe50
--- /dev/null
+++ b/package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch
@@ -0,0 +1,71 @@
+From a26296eea68aa6c16b253f34825c9b9007269672 Mon Sep 17 00:00:00 2001
+From: Florian Fainelli <f.fainelli@gmail.com>
+Date: Sat, 14 Jan 2023 08:34:11 -0800
+Subject: [PATCH] marvell.c: Fix build with musl-libc
+
+After commit 1fa60003a8b8 ("misc: header includes cleanup") we stopped
+including net/if.h which resolved the proper defines to pull in
+sys/types.h and provide a definition for u_int32_t. With musl-libc we
+would need to define _GNU_SOURCE to ensure that sys/types.h does provide a
+definition for u_int32_t.
+
+Rather, just replace u_uint{16,32}_t with the more standard
+uint{16,32}_t types from stdint.h
+
+Fixes: 1fa60003a8b8 ("misc: header includes cleanup")
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+
+[Upstream: https://patchwork.kernel.org/project/netdevbpf/patch/20230114163411.3290201-4-f.fainelli@gmail.com/]
+Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
+---
+ marvell.c | 34 +++++++++++++++++-----------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/marvell.c b/marvell.c
+index d3d570e..3f3aed8 100644
+--- a/marvell.c
++++ b/marvell.c
+@@ -31,23 +31,23 @@ static void dump_timer(const char *name, const void *p)
+ static void dump_queue(const char *name, const void *a, int rx)
+ {
+ 	struct desc {
+-		u_int32_t		ctl;
+-		u_int32_t		next;
+-		u_int32_t		data_lo;
+-		u_int32_t		data_hi;
+-		u_int32_t		status;
+-		u_int32_t		timestamp;
+-		u_int16_t		csum2;
+-		u_int16_t		csum1;
+-		u_int16_t		csum2_start;
+-		u_int16_t		csum1_start;
+-		u_int32_t		addr_lo;
+-		u_int32_t		addr_hi;
+-		u_int32_t		count_lo;
+-		u_int32_t		count_hi;
+-		u_int32_t               byte_count;
+-		u_int32_t               csr;
+-		u_int32_t               flag;
++		uint32_t		ctl;
++		uint32_t		next;
++		uint32_t		data_lo;
++		uint32_t		data_hi;
++		uint32_t		status;
++		uint32_t		timestamp;
++		uint16_t		csum2;
++		uint16_t		csum1;
++		uint16_t		csum2_start;
++		uint16_t		csum1_start;
++		uint32_t		addr_lo;
++		uint32_t		addr_hi;
++		uint32_t		count_lo;
++		uint32_t		count_hi;
++		uint32_t		byte_count;
++		uint32_t		csr;
++		uint32_t		flag;
+ 	};
+ 	const struct desc *d = a;
+ 
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
