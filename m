Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C79C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 10:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B595360B5C;
	Sun,  6 Jul 2025 10:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wK-m94jraomW; Sun,  6 Jul 2025 10:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0EDE60AAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0EDE60AAD;
	Sun,  6 Jul 2025 10:10:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F14C19C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30D4A6086B
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KaNSeysrQ8Ih for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 10:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7CD86062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7CD86062D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7CD86062D
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:10:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4c9.dip0.t-ipconnect.de [79.214.196.201])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C549DA4C395F;
 Sun,  6 Jul 2025 12:10:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58384)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uYMKa-000000007dj-3I2f;
 Sun, 06 Jul 2025 10:10:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Date: Sun,  6 Jul 2025 12:10:44 +0200
Message-Id: <20250706101044.840248-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751796644;
 bh=DRBDuVCifBBWM6IQtdzS3tpvR6GayWmTaWmJUpEjV5I=;
 h=From:To:Cc:Subject:Date:From;
 b=jRbG4VNjc21e8t7pJiPtv4arpcE8iik2k+fmIUzEqcNfUmtYPoYqAii6Asp8B5UgD
 n5m4quuGDbrS/xzxXxe+FlODZ8T+JMCp55JPKS8F5vVPBMxt4SLTxLflwoRDaOgHxN
 n48YdPR6wAZ4TLGrPQ6V1w7adPcUMhk4X61qPEy9Bi44EpBAzMUQiV5SrtNgapumNN
 clMVCg2c8KwUxGH+98Vf+yML16L+AyU10bFcqV5KLXFq0iBAirWFAC4E8MPJw/yfS2
 Fu9S2cflgc4EfzV+7hGINHSpzmEEZtsRdbddrevhDGAe6A6WAbd7jAj/IdfM8hh/Hl
 2eqSY4jJ1zoDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=jRbG4VNj
Subject: [Buildroot] [PATCH 1/1] package/libcddb: Fix build with gcc-14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/723/7236cf5fd4f33aabd3178586f877dff04d754abe/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcddb/0001-gcc14.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/libcddb/0001-gcc14.patch

diff --git a/package/libcddb/0001-gcc14.patch b/package/libcddb/0001-gcc14.patch
new file mode 100644
index 0000000000..fe06d2512d
--- /dev/null
+++ b/package/libcddb/0001-gcc14.patch
@@ -0,0 +1,24 @@
+Fix build with gcc-14
+
+https://bugs.gentoo.org/919280
+https://src.fedoraproject.org/rpms/libcddb/blob/rawhide/f/pointer-types.patch
+
+Patch downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/libcddb/files/libcddb-1.3.2-c99.patch?id=9200fde5b926191737a8380a08cffa2998013945
+
+Upstream: https://sourceforge.net/p/libcddb/patches/9/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/lib/cddb_net.c
++++ b/lib/cddb_net.c
+@@ -329,7 +329,7 @@
+             default:
+                 /* we got connected, check error condition */
+                 l = sizeof(rv);
+-                getsockopt(sockfd, SOL_SOCKET, SO_ERROR, &rv, &l);
++                getsockopt(sockfd, SOL_SOCKET, SO_ERROR, &rv, (socklen_t * restrict)&l);
+                 if (rv) {
+                     /* something went wrong, simulate normal connect behaviour */
+                     errno = rv;
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
