Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF04AC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 14:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 579326058C;
	Wed, 17 Jul 2024 14:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqjKq3h7pDlt; Wed, 17 Jul 2024 14:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 660E7605AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 660E7605AA;
	Wed, 17 Jul 2024 14:57:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 960291BF35D
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 14:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8357E812C3
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 14:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEPiFcrvBqQF for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 14:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28321812AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28321812AF
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 14:57:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1181581402; Wed, 17 Jul 2024 14:57:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 16:57:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd7c8a2528cf81cef27b4fa7170f6f1f880bf148
X-Git-Newrev: a22f17881cce09c285067be096a683c523620826
X-Patchwork-Hint: ignore
Message-Id: <20240717145755.1181581402@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: fix build with glibc 2.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=a22f17881cce09c285067be096a683c523620826
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97, it removed the deprecated
libcrypt support.

Until the upgrade of glibc to 2.39, Busybox could rely on the libcrypt
provided by glibc. Since version 2.39, glibc no longer provides
libcrypt, causing a build failure with Busybox configurations that
have CONFIG_USE_BB_CRYPT disabled.

To fix this, add the libxcrypt dependency to Busybox when
BR2_PACKAGE_LIBXCRYPT is selected. The user is still responsible for
enabling BR2_PACKAGE_LIBXCRYPT when their Busybox configuration has
CONFIG_USE_BB_CRYPT disabled.

Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6c20a98d2d..204ebe0106 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -164,6 +164,10 @@ define BUSYBOX_SET_MDEV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+BUSYBOX_DEPENDENCIES += libxcrypt
+endif
+
 # sha passwords need USE_BB_CRYPT_SHA
 ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256)$(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
 define BUSYBOX_SET_CRYPT_SHA
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
