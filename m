Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CDFEE14D8
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 14:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49BD813D0;
	Sun, 10 Sep 2023 14:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C49BD813D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtYNAbeJRIXR; Sun, 10 Sep 2023 14:27:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3CF18174F;
	Sun, 10 Sep 2023 14:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3CF18174F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88DAC1BF255
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 14:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62AC840165
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 14:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62AC840165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTFWDJlEff5D for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 14:27:51 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DD5D40125
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 14:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DD5D40125
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1258A13F89A;
 Sun, 10 Sep 2023 16:27:46 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 16:27:39 +0200
Message-ID: <20230910142739.555507-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694356068;
 bh=vgO7NBZNY6fNbOG+GM6SYjdsFvt4ayTAtaByfkcAvT8=;
 h=From:To:Cc:Subject:Date:From;
 b=TRLUpwbhWCraSSIE6M+eLEe/bRqiR7cPR/W5LKHmc/5+slemBdhTX0ob1eaqHzgBn
 pAP79L6f6EqhC3zUy3bhwuob/eg48fri0SAHGQCNePhxphEnBfOKuK4P04KlqoRDQK
 +00+/Wbtja8Epe4ejELnWBwnY76ZV1kqkTSRpDmCJCjhnQ/MoHxdjZMsT4wEljBrZU
 txQvhPlOidIRrE1dvgZrk/P6zufZNyickhr5TRYwCx9327l2QwuEARKtxI0JWxjztl
 3Np4PKzufBSmJQvex9kisUvwGfRXXkqctUwM4CDvLoElfSqb9w/apoWHj/6nio7P5G
 VF8dEzSJcFcow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TRLUpwbh
Subject: [Buildroot] [PATCH v2 1/1] package/zynaddsubfx: fix build with gcc
 13
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When compiling with gcc 13, build fails with errors, such as:

    In file included from /build/zynaddsubfx-3.0.6/src/Nio/NulEngine.h:21,
                     from /build/zynaddsubfx-3.0.6/src/Nio/NulEngine.cpp:14:
    /build/zynaddsubfx-3.0.6/src/Nio/MidiIn.h:37:9: error: 'uint8_t' does not name a type
       37 |         uint8_t midiSysEx(unsigned char data);
          |         ^~~~~~~

Those gcc 13 changes were announced at:
https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes

This commit fixes the issue by adding upstream patches, not yet
included in a release.

Fixes:
http://autobuild.buildroot.net/results/97b5a30c7be820ac91e745cf60f9b759e962aa5c

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Reworded the commit log to correct the root cause of the issue
  (v1 was mentioning uclibc. it is in fact gcc-13)
---
 ...1-MidiIn-Add-stdint.h-header-include.patch | 26 +++++++++++++++++
 ...002-Bank-Add-stdint.h-header-include.patch | 28 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 package/zynaddsubfx/0001-MidiIn-Add-stdint.h-header-include.patch
 create mode 100644 package/zynaddsubfx/0002-Bank-Add-stdint.h-header-include.patch

diff --git a/package/zynaddsubfx/0001-MidiIn-Add-stdint.h-header-include.patch b/package/zynaddsubfx/0001-MidiIn-Add-stdint.h-header-include.patch
new file mode 100644
index 0000000000..ea4eb66190
--- /dev/null
+++ b/package/zynaddsubfx/0001-MidiIn-Add-stdint.h-header-include.patch
@@ -0,0 +1,26 @@
+From 4f1565f18cf71867f25f31c50c3a5e6995f49ae6 Mon Sep 17 00:00:00 2001
+From: fundamental <mark.d.mccurry@gmail.com>
+Date: Sat, 22 Apr 2023 10:21:09 -0400
+Subject: [PATCH] MidiIn: Add stdint.h header include
+
+Upstream: https://github.com/zynaddsubfx/zynaddsubfx/commit/70905c96fe7b9ffde19bc4bc05b0dc53a1ed1707
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ src/Nio/MidiIn.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Nio/MidiIn.h b/src/Nio/MidiIn.h
+index ce0bcfec..c6b30c61 100644
+--- a/src/Nio/MidiIn.h
++++ b/src/Nio/MidiIn.h
+@@ -17,6 +17,7 @@
+ #define MIDI_IN_H
+ 
+ #include "Engine.h"
++#include <stdint.h>//uint8_t
+ 
+ namespace zyn {
+ 
+-- 
+2.41.0
+
diff --git a/package/zynaddsubfx/0002-Bank-Add-stdint.h-header-include.patch b/package/zynaddsubfx/0002-Bank-Add-stdint.h-header-include.patch
new file mode 100644
index 0000000000..556854a9e2
--- /dev/null
+++ b/package/zynaddsubfx/0002-Bank-Add-stdint.h-header-include.patch
@@ -0,0 +1,28 @@
+From eab3bc1712e5af7e6aef942a24e833ce2c429436 Mon Sep 17 00:00:00 2001
+From: fundamental <mark.d.mccurry@gmail.com>
+Date: Wed, 19 Apr 2023 21:52:01 -0400
+Subject: [PATCH] Bank: Add stdint.h header include
+
+As uint8_t is used, this header should be included.
+
+Upstream: https://github.com/zynaddsubfx/zynaddsubfx/commit/f384d92486d6b515cb628d0f52008a9e03341d8c
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ src/Misc/Bank.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Misc/Bank.h b/src/Misc/Bank.h
+index 5120441a..3f324dd8 100644
+--- a/src/Misc/Bank.h
++++ b/src/Misc/Bank.h
+@@ -18,6 +18,7 @@
+ #include <vector>
+ #include "../globals.h"
+ #include "Config.h"
++#include <stdint.h>
+ 
+ //entries in a bank
+ #define BANK_SIZE 160
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
