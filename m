Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADC9C25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91C94069B;
	Mon, 13 May 2024 20:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1YSA6cgg0ll; Mon, 13 May 2024 20:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86EDD407D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86EDD407D6;
	Mon, 13 May 2024 20:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 140641BF947
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2579D60AC1
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CakyPvw793Ms for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68CC760AB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68CC760AB9
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:36:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5610F87158; Mon, 13 May 2024 20:36:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 22:35:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fbac15e4c2e730c846c139e8986cc2b56b36018
X-Git-Newrev: 69cb6259479c548a09aac1140261c17f1cbb86b3
X-Patchwork-Hint: ignore
Message-Id: <20240513203622.5610F87158@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: enable obsolete nios2 target
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

commit: https://git.buildroot.net/buildroot/commit/?id=69cb6259479c548a09aac1140261c17f1cbb86b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC 14.1.0 deprecated NIOS2 so we need to enable it explicitely.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc-final/gcc-final.mk     | 5 +++++
 package/gcc/gcc-initial/gcc-initial.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 99d7047b5f..5feb96b568 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -117,6 +117,11 @@ else
 HOST_GCC_FINAL_CONF_OPTS += --disable-libgomp
 endif
 
+# allow to build gcc 14.x
+ifeq ($(BR2_nios2),y)
+HOST_GCC_FINAL_CONF_OPTS += --enable-obsolete
+endif
+
 # End with user-provided options, so that they can override previously
 # defined options.
 HOST_GCC_FINAL_CONF_OPTS += \
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1f8b76a942..8b4247bdad 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -42,6 +42,11 @@ HOST_GCC_INITIAL_CONF_OPTS = \
 	--disable-largefile \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
+# allow to build gcc 14.x
+ifeq ($(BR2_nios2),y)
+HOST_GCC_INITIAL_CONF_OPTS += --enable-obsolete
+endif
+
 HOST_GCC_INITIAL_CONF_ENV = \
 	$(HOST_GCC_COMMON_CONF_ENV)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
