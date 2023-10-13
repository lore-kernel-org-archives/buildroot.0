Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97C5CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 15:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ED0D60F6B;
	Fri, 13 Oct 2023 15:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ED0D60F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFV1FwJAC4-c; Fri, 13 Oct 2023 15:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BC4F610FA;
	Fri, 13 Oct 2023 15:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BC4F610FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 257EC1BF99A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F08C24049A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F08C24049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgJin7Sp622q for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 15:21:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8F6740102
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 15:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8F6740102
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCF2F84898; Fri, 13 Oct 2023 15:21:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 17:13:49 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 6f71f481f79825713bf3f794f2117dfb9e8a44f0
X-Git-Newrev: c6d2eba3d3cda999854afd60f14f4df925c7e1a4
X-Patchwork-Hint: ignore
Message-Id: <20231013152133.BCF2F84898@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/gptfdisk: fix bug
 with util-linux 2.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6d2eba3d3cda999854afd60f14f4df925c7e1a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Due to a change in util-linux (commit
10f5f79485964ab52272ebe79c3b0047b1f84d82, "libbuid: use
_UL_LIBUUID_UUID_H to cover uuid.h"), gptfdisk no longer detects the
availability of libuuid to generate UUIDs, causing the following
message at runtime:

  Warning! Unable to generate a proper UUID! Creating an improper one as a last
  resort! Windows 7 may crash if you save this partition table!

This issue exists since util-linux was bumped to version 2.38 in
Buildroot
ee978e853a6a4c9bb5ed661c1ae704e79f155a35 ("package/util-linux: bump
version to 2.38").

This issue has been fixed in upstream gptfdisk, but the fix [0] is not
yet in a new stable release, so we backport it.

Additionally, now that gptfdisk uses libuuid again, the build fails
because passing LDLIBS to make overrides the default value in the
Makefile. To fix this, this patch adds -luuid to GPTFDISK_LDLIBS.

[0] https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 58fbfe870640cf20678d4f6a40999ea5223c6fca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d.cc-to-deal-with-minor-change-in-libuuid.patch | 41 ++++++++++++++++++++++
 package/gptfdisk/gptfdisk.mk                       |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch b/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
new file mode 100644
index 0000000000..22c34ced6f
--- /dev/null
+++ b/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
@@ -0,0 +1,41 @@
+From 6a8416cbd12d55f882bb751993b94f72d338d96f Mon Sep 17 00:00:00 2001
+From: Rod Smith <rodsmith@rodsbooks.com>
+Date: Sat, 16 Apr 2022 09:32:04 -0400
+Subject: [PATCH] Updated guid.cc to deal with minor change in libuuid
+
+Upstream: https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f
+Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
+---
+ NEWS    | 2 ++
+ guid.cc | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index 9e153fd..9ec7e63 100644
+--- a/NEWS
++++ b/NEWS
+@@ -6,6 +6,8 @@
+   (commit 740, which is pre-release as I type; presumably version 1.19 and
+   later once released).
+ 
++- Updated guid.cc to deal with minor change in libuuid.
++
+ 1.0.9 (4/14/2022):
+ ------------------
+ 
+diff --git a/guid.cc b/guid.cc
+index 1e73ab7..d3e4fd5 100644
+--- a/guid.cc
++++ b/guid.cc
+@@ -141,7 +141,7 @@ void GUIDData::Zero(void) {
+ void GUIDData::Randomize(void) {
+    int i, uuidGenerated = 0;
+ 
+-#ifdef _UUID_UUID_H
++#if defined (_UUID_UUID_H) || defined (_UL_LIBUUID_UUID_H)
+    uuid_generate(uuidData);
+    ReverseBytes(&uuidData[0], 4);
+    ReverseBytes(&uuidData[4], 2);
+-- 
+2.42.0
+
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index f3fc930202..393ea9469a 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -14,6 +14,8 @@ GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_SGDISK) += sgdisk
 GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_CGDISK) += cgdisk
 
 GPTFDISK_DEPENDENCIES += util-linux
+GPTFDISK_LDLIBS += -luuid
+
 ifeq ($(BR2_PACKAGE_GPTFDISK_SGDISK),y)
 GPTFDISK_DEPENDENCIES += host-pkgconf popt
 GPTFDISK_SGDISK_LDLIBS += `$(PKG_CONFIG_HOST_BINARY) --libs popt`
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
