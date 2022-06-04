Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FADC43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 17:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2A0C611D6;
	Sat,  4 Jun 2022 17:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GziC605Tqcs0; Sat,  4 Jun 2022 17:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB224611BC;
	Sat,  4 Jun 2022 17:05:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 087FE1BF962
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 17:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05B9D419C7
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 17:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E6MA4Bq_jIg8 for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 17:05:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A4F44099E
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 17:04:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 06CB786B23; Sat,  4 Jun 2022 16:53:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jun 2022 19:00:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c585eb32d13ce8af09dbfbb273a88839c544348
X-Git-Newrev: 51b4a43e562e8551614528e88c05db9bf2fd1003
X-Patchwork-Hint: ignore
Message-Id: <20220604165315.06CB786B23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zchunk: fix build with
 argp-standalone and NLS
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

commit: https://git.buildroot.net/buildroot/commit/?id=51b4a43e562e8551614528e88c05db9bf2fd1003
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

/home/buildroot/autobuild/instance-3/output-1/host/bin/i686-linux-gcc  -o test/zck_cmp_uncomp test/zck_cmp_uncomp.p/zck_cmp_uncomp.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 '-Wl,-rpath,$ORIGIN/../src/lib' -Wl,-rpath-link,/home/buildroot/autobuild/instance-3/output-1/build/zchunk-1.2.2/build/src/lib -Wl,--start-group src/lib/libzck.so.1.2.2 -largp -Wl,--end-group
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-help.o): in function `arg':
/home/buildroot/autobuild/instance-3/output-1/build/argp-standalone-1.4.1/argp-help.c:936: undefined reference to `libintl_dgettext'

Fixes:
 - http://autobuild.buildroot.org/results/1242d0b15ceb816e946bfc1b31dd39e68227359f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zchunk/zchunk.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
index 5582c21e77..fc91f90431 100644
--- a/package/zchunk/zchunk.mk
+++ b/package/zchunk/zchunk.mk
@@ -9,8 +9,11 @@ ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
 ZCHUNK_LICENSE = BSD-2-Clause
 ZCHUNK_LICENSE_FILES = LICENSE
 ZCHUNK_INSTALL_STAGING = YES
-ZCHUNK_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
+
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+ZCHUNK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
+ZCHUNK_LDFLAGS += $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 ZCHUNK_DEPENDENCIES += libcurl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
