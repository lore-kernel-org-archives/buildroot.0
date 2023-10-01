Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D9EE78491
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 21:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DF3841835;
	Sun,  1 Oct 2023 21:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DF3841835
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7h5smAG3E24; Sun,  1 Oct 2023 21:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB084183B;
	Sun,  1 Oct 2023 21:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AB084183B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B48C1BF404
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 21:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15EBD60A5B
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 21:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15EBD60A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qW9N-vF5f0JT for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 21:05:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E31BD6073E
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 21:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E31BD6073E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFAF583FC0; Sun,  1 Oct 2023 21:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 23:05:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80e94c76169fd15d2433b18a9e54d6a4f3c4ff18
X-Git-Newrev: 58fbfe870640cf20678d4f6a40999ea5223c6fca
X-Patchwork-Hint: ignore
Message-Id: <20231001210548.CFAF583FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gptfdisk: fix bug with util-linux
 2.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=58fbfe870640cf20678d4f6a40999ea5223c6fca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
