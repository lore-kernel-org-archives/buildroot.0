Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9189C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C2E84109B;
	Mon, 21 Nov 2022 21:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C2E84109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MKgYgascftv; Mon, 21 Nov 2022 21:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0838D409A8;
	Mon, 21 Nov 2022 21:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0838D409A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D60BA1BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEFDB4046B
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEFDB4046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZHJnJ0hStSs for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:00:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB50F402F5
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB50F402F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5AB284087; Mon, 21 Nov 2022 21:00:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 21:59:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7368099ae9767a57ec72fcfbb29a5d85ac7bcf7
X-Git-Newrev: 5852fee868c318f0864bed3238b46348156422b6
X-Patchwork-Hint: ignore
Message-Id: <20221121210015.A5AB284087@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: fix build failure with
 make 4.3.91
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5852fee868c318f0864bed3238b46348156422b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make 4.3.91 doesn't allow to safely override Simple Expanded Variables, so
let's add a patch pending upstream[0] to make those variable Conditional
Expanded.

[0]: https://bugzilla.mozilla.org/show_bug.cgi?id=1801182

Fixes:
http://autobuild.buildroot.net/results/1074143dbea60567cd83be0a23f7c0214d470de9/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch b/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch
new file mode 100644
index 0000000000..7b3abea307
--- /dev/null
+++ b/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch
@@ -0,0 +1,45 @@
+From a1a5f3afea2ee59bdbb7a74eb2d7f82b635dbd1a Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 17 Nov 2022 20:38:48 +0100
+Subject: [PATCH] Bug 1801182 - Allow overriding OS_ARCH, OS_TEST and
+ OS_RELEASE in Makefile
+
+Starting from Make 4.3.91 simple expanded variables can't be safely
+overriden via command line anymore, so let's use conditional expanded
+variables to override OS_ARCH, OS_TEST and OS_RELEASE.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Upstream status: https://bugzilla.mozilla.org/show_bug.cgi?id=1801182]
+---
+ nss/coreconf/arch.mk | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
+index 17e9faeac..85aac9341 100644
+--- a/nss/coreconf/arch.mk
++++ b/nss/coreconf/arch.mk
+@@ -20,17 +20,17 @@
+ # Macros for getting the OS architecture
+ #
+ 
+-OS_ARCH := $(subst /,_,$(shell uname -s))
++OS_ARCH ?= $(subst /,_,$(shell uname -s))
+ 
+ #
+ # Attempt to differentiate between sparc and x86 Solaris
+ #
+ 
+-OS_TEST := $(shell uname -m)
++OS_TEST ?= $(shell uname -m)
+ ifeq ($(OS_TEST),i86pc)
+-    OS_RELEASE := $(shell uname -r)_$(OS_TEST)
++    OS_RELEASE ?= $(shell uname -r)_$(OS_TEST)
+ else
+-    OS_RELEASE := $(shell uname -r)
++    OS_RELEASE ?= $(shell uname -r)
+ endif
+ 
+ 
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
