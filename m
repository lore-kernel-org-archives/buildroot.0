Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E0CC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57D2143653;
	Thu, 30 Nov 2023 23:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57D2143653
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KSX6M1769mSp; Thu, 30 Nov 2023 23:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 340A2436C0;
	Thu, 30 Nov 2023 23:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 340A2436C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9771BF2A1
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FE1C60A77
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE1C60A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZ-0URz484XL for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A1F160B5D
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1F160B5D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A501876B1; Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:51:24 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 11be509a03223ec5cff935399402538794713200
X-Git-Newrev: fe30c5797727a9a093d2056033157356175b5d2e
X-Patchwork-Hint: ignore
Message-Id: <20231130230902.3A501876B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libxml2: security
 bump to version 2.11.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe30c5797727a9a093d2056033157356175b5d2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix CVE-2023-45322: libxml2 through 2.11.5 has a use-after-free that can
only occur after a certain memory allocation fails. This occurs in
xmlUnlinkNode in tree.c. NOTE: the vendor's position is "I don't think
these issues are critical enough to warrant a CVE ID ... because an
attacker typically can't control when memory allocations fail."

https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.11.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e5af07dce9eb2333a863b09ac1c06eb35f3adb70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index cad19f930f..78c1ddc6a2 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.5.sha256sum
-sha256  3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6  libxml2-2.11.5.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.6.sha256sum
+sha256  c90eee7506764abbe07bb616b82da452529609815aefef423d66ef080eb0c300  libxml2-2.11.6.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index d2f96a7e96..b7a2c796fc 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.11
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).5
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
