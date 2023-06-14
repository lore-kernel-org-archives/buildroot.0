Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3DCEB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 14:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4F8C83A42;
	Wed, 14 Jun 2023 14:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F8C83A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZnuvV2gRlXwJ; Wed, 14 Jun 2023 14:50:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCCD783A3C;
	Wed, 14 Jun 2023 14:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCCD783A3C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F44A1BF2B7
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18055612F0
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18055612F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1w44eH--QGC5 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 14:50:47 +0000 (UTC)
X-Greylist: delayed 00:08:41 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79CE6612CA
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79CE6612CA
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 14:50:47 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 55711E003F8;
 Wed, 14 Jun 2023 16:42:03 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 16:42:02 +0200
Message-Id: <20230614144202.21459-1-fl@n621.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1686753723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4nSdpsIZYs9HcmViGzeL5tH975sF631RPkuigbvmivY=;
 b=SQZfI6IsC1tyHvgjtNPrgz0SJqO1GhOFTB7mZEy/m6Dw6yMZRWiJ+AV4nNOrIolrQqBTuI
 WkaVs6cLvxjTnk+x2HLSkOUyZqxgcSqjMuAXfosd/sif985MSQXp8x3hFZwg/1UfGSapR5
 JFdZQcd2MN6xvY5HSXdaNnrdwob99sQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=n621.de header.i=@n621.de
 header.a=rsa-sha256 header.s=dkim header.b=SQZfI6Is
Subject: [Buildroot] [PATCH 1/1] linux: make kconfig depend on host-make
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
Cc: Florian Larysch <fl@n621.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 0b9efc991f ("linux: use BR2_MAKE") switched LINUX_MAKE to
$(BR2_MAKE). However, this also implicitly sets LINUX_KCONFIG_MAKE.

Thus, when host-make is being used in a build that has
PER_PACKAGE_DIRECTORIES enabled, the dotconfig step will try to use the
make instance from the host directory, but since it is not listed in
LINUX_KCONFIG_DEPENDENCIES, it won't be available yet at that point in
time.

Add an explicit dependency to LINUX_KCONFIG_DEPENDENCIES to have it
copied over early enough.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index cc36b5251d..1c4fe45ac9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -88,7 +88,8 @@ LINUX_DEPENDENCIES += \
 # only if the host does not have them.
 LINUX_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
-	$(BR2_FLEX_HOST_DEPENDENCY)
+	$(BR2_FLEX_HOST_DEPENDENCY) \
+	$(BR2_MAKE_HOST_DEPENDENCY)
 
 # Starting with 4.18, the kconfig in the kernel calls the
 # cross-compiler to check its capabilities. So we need the
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
