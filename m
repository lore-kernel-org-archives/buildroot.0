Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7091C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:53:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83AAB610A1
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83AAB610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58F8160017;
	Thu, 19 Aug 2021 20:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIWv_QiSNaMV; Thu, 19 Aug 2021 20:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFE19605E9;
	Thu, 19 Aug 2021 20:53:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8551C113E
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DBA74011D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8q2vmzhoWDE for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:53:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CE8140001
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:53:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EAD418D5DC; Thu, 19 Aug 2021 20:53:00 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:53:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ee1063136edd030f1c4a8ca88d0a80d98ce8719
X-Git-Newrev: 709004563b200a6b9456143de9722d99f4c5054b
X-Patchwork-Hint: ignore
Message-Id: <20210819205300.EAD418D5DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: fix build of gdb on riscv
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=709004563b200a6b9456143de9722d99f4c5054b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build of gdb on riscv without host-gdb is broken since commit
4ecd247ead22a6cfb87a4ffafc4be05201328aef because BR2_GDB_VERSION_10 is
never defined if BR2_PACKAGE_HOST_GDB is not selected resulting in the
following build failure:

/bin/bash: line 0: cd: /tmp/instance-0/output-1/build/gdb-10.1/gdb/gdbserver: No such file or directory

So add a BR2_PACKAGE_GDB_TOPLEVEL hidden option as suggested by Thomas
Petazzoni.

Fixes:
 - http://autobuild.buildroot.org/results/ce47d616ee79d5f735779570ebc3b4a9c0f64c6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host |  9 +++++++++
 package/gdb/gdb.mk         | 11 +----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 56943267bb..142bf1458a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -93,3 +93,12 @@ config BR2_GDB_VERSION
 	default "9.2"      if BR2_GDB_VERSION_9_2 || (!BR2_PACKAGE_HOST_GDB && !BR2_riscv)
 	default "10.2"	   if BR2_GDB_VERSION_10 || (!BR2_PACKAGE_HOST_GDB && BR2_riscv)
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
+
+# recent gdb versions (>= 10) have gdbserver moved at the top-level,
+# which requires a different build logic.
+config BR2_PACKAGE_GDB_TOPLEVEL
+	bool
+	default y if BR2_arc
+	default y if BR2_GDB_VERSION_10
+	default y if !BR2_PACKAGE_HOST_GDB && BR2_riscv
+	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 17e10e8b16..f9010019f5 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -8,19 +8,10 @@ GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE = $(BR2_GNU_MIRROR)/gdb
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
 
-# recent gdb versions (>= 10) have gdbserver moved at the top-level,
-# which requires a different build logic.
-ifeq ($(BR2_GDB_VERSION_10),y)
-GDB_GDBSERVER_TOPLEVEL = y
-endif
-
 ifeq ($(BR2_arc),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
-# recent gdb versions (>= 10) have gdbserver moved at the top-level,
-# which requires a different build logic.
-GDB_GDBSERVER_TOPLEVEL = y
 endif
 
 ifeq ($(BR2_csky),y)
@@ -35,7 +26,7 @@ GDB_CPE_ID_VENDOR = gnu
 
 # On gdb < 10, if you want to build only gdbserver, you need to
 # configure only gdb/gdbserver.
-ifeq ($(BR2_PACKAGE_GDB_DEBUGGER)$(GDB_GDBSERVER_TOPLEVEL),)
+ifeq ($(BR2_PACKAGE_GDB_DEBUGGER)$(BR2_PACKAGE_GDB_TOPLEVEL),)
 GDB_SUBDIR = gdb/gdbserver
 
 # When we want to build the full gdb, or for very recent versions of
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
