Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9790EED61A
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 17:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FFA540BFF;
	Fri, 15 Sep 2023 17:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FFA540BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JfJaD1qzZqFM; Fri, 15 Sep 2023 17:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71B964031E;
	Fri, 15 Sep 2023 17:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71B964031E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18D7E1BF2FD
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6FED60B7C
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6FED60B7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtYXTSnx5tcU for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 17:50:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0709D60B1A
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 17:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0709D60B1A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7DFD8702C; Fri, 15 Sep 2023 17:50:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 19:38:58 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 995a61e958f36b9af6477a28ae10664d6150f296
X-Git-Newrev: 1c6e9cd37f01187412496ae18a5dfeaa490d2f10
X-Patchwork-Hint: ignore
Message-Id: <20230915175010.E7DFD8702C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/zynaddsubfx: fix
 build with gcc 13
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c6e9cd37f01187412496ae18a5dfeaa490d2f10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 56e7ca5dbc466f301ef6f5810177cfc17f73b9ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-MidiIn-Add-stdint.h-header-include.patch  | 26 ++++++++++++++++++++
 .../0002-Bank-Add-stdint.h-header-include.patch    | 28 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
