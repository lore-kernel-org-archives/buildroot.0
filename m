Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B88C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 275758217D;
	Sat, 23 Dec 2023 21:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 275758217D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id McKRD6OWrS5n; Sat, 23 Dec 2023 21:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C61821DA;
	Sat, 23 Dec 2023 21:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C61821DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 594C91BF406
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31DBE60E08
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31DBE60E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iuVeqLSX4io for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:21:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9D8F60A64
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9D8F60A64
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0CFC82557; Sat, 23 Dec 2023 21:21:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 21:15:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1667987a2d66d787b7e7ff77284909dcaea20369
X-Git-Newrev: 3dae30d7d15896eaf8f9d7a8e2d4f86e67545577
X-Patchwork-Hint: ignore
Message-Id: <20231223212146.D0CFC82557@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: fix build with libxml2
 version 2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=3dae30d7d15896eaf8f9d7a8e2d4f86e67545577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to update libxml2 to version 2.12, let's first fix a
build issue that would occur with squid by backporting an upstream
patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...8-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch b/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch
new file mode 100644
index 0000000000..fcbdcc1749
--- /dev/null
+++ b/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch
@@ -0,0 +1,32 @@
+From c9b3edc1396925aa7eca3d3cc6c798806286a974 Mon Sep 17 00:00:00 2001
+From: bkuhls <bkuhls@users.noreply.github.com>
+Date: Sun, 26 Nov 2023 15:09:21 +0000
+Subject: [PATCH] Bug 5328: Fix ESI build with libxml2 v2.12.0 (#1600)
+
+    Libxml2Parser.cc:147:40: error: invalid conversion from
+    'const xmlError*' to 'xmlErrorPtr' {aka 'xmlError*'} [-fpermissive]
+
+libxml2 recently made xmlGetLastError() return a constant object.
+
+Upstream: https://github.com/squid-cache/squid/commit/c9b3edc1396925aa7eca3d3cc6c798806286a974
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/esi/Libxml2Parser.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/esi/Libxml2Parser.cc b/src/esi/Libxml2Parser.cc
+index f03752885..236a37433 100644
+--- a/src/esi/Libxml2Parser.cc
++++ b/src/esi/Libxml2Parser.cc
+@@ -144,7 +144,7 @@ ESILibxml2Parser::lineNumber() const
+ char const *
+ ESILibxml2Parser::errorString() const
+ {
+-    xmlErrorPtr error = xmlGetLastError();
++    const auto error = xmlGetLastError();
+ 
+     if (error == nullptr)
+         return nullptr;
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
