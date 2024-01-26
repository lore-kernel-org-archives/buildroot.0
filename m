Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A046AC47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 16:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57FC7420DF;
	Fri, 26 Jan 2024 16:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FC7420DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id po6Ib6_YGmzW; Fri, 26 Jan 2024 16:12:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 649CC420B0;
	Fri, 26 Jan 2024 16:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 649CC420B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F1C61BF98E
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08927614DB
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08927614DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuovG2shNWVs for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 16:12:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C144614D2
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 16:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C144614D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A59086584; Fri, 26 Jan 2024 16:12:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 17:08:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de81f2e3bcd7268214ad909af7d7e467b1720a63
X-Git-Newrev: 69a7680407bef325c613b33121ed1ec6a97ab7cb
X-Patchwork-Hint: ignore
Message-Id: <20240126161218.2A59086584@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump version to 6.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=69a7680407bef325c613b33121ed1ec6a97ab7cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport fix of ss's output.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...revent-Process-column-from-being-printed-.patch | 45 ++++++++++++++++++++++
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch b/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
new file mode 100644
index 0000000000..10fa472d64
--- /dev/null
+++ b/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
@@ -0,0 +1,45 @@
+From f22c49730c3691c25a1147081363eb35aa9d1048 Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <stephen@networkplumber.org>
+Date: Sat, 13 Jan 2024 08:51:55 -0800
+Subject: [PATCH] Revert "ss: prevent "Process" column from being printed
+ unless requested"
+
+This reverts commit 1607bf531fd2f984438d227ea97312df80e7cf56.
+
+This commit is being reverted because it breaks output of tcp info.
+The order of the columns enum is order sensistive.
+
+Bug: https://bugzilla.kernel.org/show_bug.cgi?id=218372
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=f22c49730c3691c25a1147081363eb35aa9d1048
+---
+ misc/ss.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/misc/ss.c b/misc/ss.c
+index 09dc1f37..9438382b 100644
+--- a/misc/ss.c
++++ b/misc/ss.c
+@@ -100,8 +100,8 @@ enum col_id {
+ 	COL_SERV,
+ 	COL_RADDR,
+ 	COL_RSERV,
+-	COL_PROC,
+ 	COL_EXT,
++	COL_PROC,
+ 	COL_MAX
+ };
+
+@@ -5795,9 +5795,6 @@ int main(int argc, char *argv[])
+ 	if (ssfilter_parse(&current_filter.f, argc, argv, filter_fp))
+ 		usage();
+
+-	if (!show_processes)
+-		columns[COL_PROC].disabled = 1;
+-
+ 	if (!(current_filter.dbs & (current_filter.dbs - 1)))
+ 		columns[COL_NETID].disabled = 1;
+
+--
+2.43.0
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index edd03b6459..0be058e64b 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  a70179085fa1b96d3c33b040c809b75e2b57563adc505a4ad05e2609df373463  iproute2-6.5.0.tar.xz
+sha256  ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d  iproute2-6.7.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index a2e90a66f3..7e70f62ff2 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.5.0
+IPROUTE2_VERSION = 6.7.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
