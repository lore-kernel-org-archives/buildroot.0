Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81329C38142
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 02:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D248F81E40;
	Sun, 29 Jan 2023 02:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D248F81E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJPEK5T5HGCW; Sun, 29 Jan 2023 02:18:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F23581E30;
	Sun, 29 Jan 2023 02:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F23581E30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A43D1BF3E3
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 02:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 104B681E30
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 02:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 104B681E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tsIg5M57pRru for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 02:18:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F66281E1B
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F66281E1B
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 02:18:11 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id D54FF2000B;
 Sat, 28 Jan 2023 20:18:09 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 20:17:56 -0600
Message-Id: <20230129021756.2845959-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1674958689; bh=hZ13qophJgsCiO/i6DtSftgk2fiF6Q2xCAlvCccEKhQ=;
 h=From:To:Cc:Subject:Date:From;
 b=sEeySP7BlOJQH5+gtzo7TbsTnRKp7TufH3FcAbX+JCUMxfjXAztF4nSHpBsjVbMQ8
 H7kzfWI5AE1hVv/gsgnCZE8LsScS/o/dqhEs5CJ8losA8agS/w65HJESCjJ4Frfwqv
 IeqVXzrnMsrt9Fxge3V0wyFW4CB2dnfttPjK0pio=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=sEeySP7B
Subject: [Buildroot] [PATCH 1/1] package/ethtool: fix musl-libc builds
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream commit 1fa60003a8b8 made a change to headers that broke
compiles for musl-libc based builds.

Apply the patch slated to address the issue.

Fixes:
  - http://autobuild.buildroot.net/results/eafd07dddfe7e8b714fc3fcaf77a2d7150694ee2/

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 ...2-marvell.c-Fix-build-with-musl-libc.patch | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
