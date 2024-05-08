Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A087C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27AF60D67;
	Wed,  8 May 2024 16:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcqVsaALVFTl; Wed,  8 May 2024 16:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B326A60D54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B326A60D54;
	Wed,  8 May 2024 16:30:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3191BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63C2541B22
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Zwi04NqRAwe for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D3FB41AEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D3FB41AEC
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:30:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77B0F86A91; Wed,  8 May 2024 16:30:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 May 2024 18:29:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e07cd5a1bc7f2b2d2db9702eca159729232b839
X-Git-Newrev: f44b46c47bd6d961fdc0e0aa9476d32f508e091c
X-Patchwork-Hint: ignore
Message-Id: <20240508163005.77B0F86A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdadm: replace PIE workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=f44b46c47bd6d961fdc0e0aa9476d32f508e091c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace PIE workaround added by commit
826e0bc3360ac1daa3581232c52ee47697bfabc6 by an upstream patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch  | 40 ++++++++++++++++++++++
 package/mdadm/mdadm.mk                             |  2 +-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch b/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch
new file mode 100644
index 0000000000..4d46d58230
--- /dev/null
+++ b/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch
@@ -0,0 +1,40 @@
+From 893a55831e5abbcd15b171db66fa1f389fb61506 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 7 May 2024 19:32:16 +0200
+Subject: Makefile: Move -pie to LDFLAGS
+
+Move -pie from LDLIBS to LDFLAGS and make LDFLAGS configurable to allow
+the user to drop it by setting their own LDFLAGS (e.g. PIE could be
+enabled or disabled by the buildsystem such as buildroot).
+
+Suggested-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+
+Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=893a55831e5abbcd15b171db66fa1f389fb61506
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7c221a89..adac7905 100644
+--- a/Makefile
++++ b/Makefile
+@@ -132,12 +132,12 @@ CFLAGS += -DUSE_PTHREADS
+ MON_LDFLAGS += -pthread
+ endif
+ 
+-LDFLAGS = -Wl,-z,now,-z,noexecstack
++LDFLAGS ?= -pie -Wl,-z,now,-z,noexecstack
+ 
+ # If you want a static binary, you might uncomment these
+ # LDFLAGS += -static
+ # STRIP = -s
+-LDLIBS = -ldl -pie
++LDLIBS = -ldl
+ 
+ # To explicitly disable libudev, set -DNO_LIBUDEV in CXFLAGS
+ ifeq (, $(findstring -DNO_LIBUDEV,  $(CXFLAGS)))
+-- 
+cgit 1.2.3-korg
+
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 6de9467092..153395d32a 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -21,7 +21,7 @@ MDADM_BUILD_OPTS = \
 	CXFLAGS="$(MDADM_CXFLAGS)" \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 	CHECK_RUN_DIR=0 \
-	LDLIBS=-ldl
+	LDFLAGS=$(TARGET_LDFLAGS)
 
 MDADM_INSTALL_TARGET_OPTS = install-bin
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
