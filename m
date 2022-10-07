Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FDEC433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 23:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 681A64187B;
	Fri,  7 Oct 2022 23:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 681A64187B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xea3YNe1Y0hJ; Fri,  7 Oct 2022 23:57:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A3B54186D;
	Fri,  7 Oct 2022 23:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A3B54186D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 941141BF2C6
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 23:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 700CC404DB
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 23:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 700CC404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRG18rCozbIJ for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 23:57:22 +0000 (UTC)
X-Greylist: delayed 00:07:13 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1B6840114
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1B6840114
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 23:57:22 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id A5D33201D1;
 Fri,  7 Oct 2022 18:50:08 -0500 (CDT)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 18:50:01 -0500
Message-Id: <20221007235002.79221-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1665186608; bh=Yx+/fUnDNaP515vX9aWdUG/dq4Omiy1UlxJ7TlFaBs8=;
 h=From:To:Cc:Subject:Date:From;
 b=aYHfDYhOyzz5LhUO6I71iM5i6pj/hZl8XAdP7KAYDOAQJib4jcy6kvCEL/5+2IFqQ
 KuchJzcTTQLGqEtuf/TkyXe0Bn1Mu6KctHeJjnZIrSxUE4ujPV5aKRos1mZPNuUWHC
 yqSZLHu7c96eutST1EeN/XSAywyRXgJWrCavjLQM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=aYHfDYhO
Subject: [Buildroot] [PATCH 1/2] package/busybox: add patch to silence build
 errors
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
Cc: Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As part of pkg-kconfig, the .config file gets regenerated after fixups.

When Busybox is built with per-package directories enabled, the
toolchain is not available for Busybox's makefile to determine compiler
capabilities so certain calls will fail and emit errors.

For now, assume the following are true:

Buildroot will not use GCC < 4
  Skip a call to cc-ifversion to avoid the following error

  /buildroot/output/build/busybox-1.35.0/scripts/gcc-version.sh: line 11: /buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc: No such file or directory

Target system is linux
  Skip a call to -dumpmachine to avoid the following error

  make[2]: /buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc: Command not found

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 ...ags-assume-GCC-4-and-target-is-linux.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/busybox/0006-Makefile.flags-assume-GCC-4-and-target-is-linux.patch

diff --git a/package/busybox/0006-Makefile.flags-assume-GCC-4-and-target-is-linux.patch b/package/busybox/0006-Makefile.flags-assume-GCC-4-and-target-is-linux.patch
new file mode 100644
index 0000000000..567d46704f
--- /dev/null
+++ b/package/busybox/0006-Makefile.flags-assume-GCC-4-and-target-is-linux.patch
@@ -0,0 +1,50 @@
+From d384e999e1dff473f2bf084c6a9b9730ad39b878 Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@xes-inc.com>
+Date: Thu, 6 Oct 2022 13:16:34 -0500
+Subject: [PATCH] Makefile.flags: assume GCC >= 4 and target is linux
+
+As part of pkg-kconfig, the .config file gets regenerated after fixups.
+
+When Busybox is built with per-package directories enabled, the
+toolchain is not available for Busybox's makefile to determine compiler
+capabilities so certain calls will fail and emit errors.
+
+For now, assume the following are true:
+
+Buildroot will not use GCC < 4
+  Skip a call to cc-ifversion to avoid the following error
+
+  /buildroot/output/build/busybox-1.35.0/scripts/gcc-version.sh: line 11: /buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc: No such file or directory
+
+Target system is linux
+  Skip a call to -dumpmachine to avoid the following error
+
+  make[2]: /buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc: Command not found
+
+Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
+
+diff --git a/Makefile.flags b/Makefile.flags
+index c34356230..274527954 100644
+--- a/Makefile.flags
++++ b/Makefile.flags
+@@ -45,7 +45,7 @@ CFLAGS += $(call cc-option,-Werror,)
+ #CFLAGS += $(call cc-ifversion, -eq, 0404, -fno-strict-aliasing)
+ endif
+ # gcc 3.x emits bogus "old style proto" warning on find.c:alloc_action()
+-CFLAGS += $(call cc-ifversion, -ge, 0400, -Wold-style-definition)
++CFLAGS += -Wold-style-definition
+ 
+ ifneq ($(CC),clang)
+ # "clang-9: warning: optimization flag '-finline-limit=0' is not supported
+@@ -184,7 +184,7 @@ LDLIBS += $(if $(SELINUX_LIBS),$(SELINUX_LIBS:-l%=%),$(SELINUX_PC_MODULES:lib%=%
+ endif
+ 
+ ifeq ($(CONFIG_FEATURE_NSLOOKUP_BIG),y)
+-ifneq (,$(findstring linux,$(shell $(CC) $(CFLAGS) -dumpmachine)))
++ifneq (,$(findstring linux,linux))
+ LDLIBS += resolv
+ endif
+ endif
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
