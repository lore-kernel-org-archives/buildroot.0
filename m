Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FC9CD4F3C
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 12:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A35746F545;
	Sat, 16 May 2026 12:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5HVjyEjajfB; Sat, 16 May 2026 12:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B0360E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778934821;
	bh=f6NV93yQ3ChTJLmNSPaE7Fmx2oc+sv7I9D98BjtVvFM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=b22p9KZFoEeS+CQXMGAJUggCqi65VG5zN/TtCGdVuMk5+2iR/61z9ampqC/PlNWAF
	 XLN8YrGGJNDOg2N6I3TGbWrNZc6dqPVRGVGW12JxlPRMMjYOFxUeL77p4PKFEVkoci
	 5Frk/w4MjcaW7qoEMoDqw6v37Ps8h3SIJaHsQ/KxrAuGWhT+D0M2fKOsOtJLOXBozi
	 ba/Gm1srR7YZXsj/+Pu+3f2htGnoX15K2h+xiqpqS9AtdN9VC1TpeaplN5k3hLe+Yp
	 rYHOUi+J4B9feb8CNxSLbsoHL+NacTsCGVY1KCY/CXHkymnH7xfJVJOeefV/Q62bQC
	 4OE8H57+u3P5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B0360E65;
	Sat, 16 May 2026 12:33:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CC8C282
 for <buildroot@buildroot.org>; Sat, 16 May 2026 12:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B0174033F
 for <buildroot@buildroot.org>; Sat, 16 May 2026 12:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0lJO76T1_cr for <buildroot@buildroot.org>;
 Sat, 16 May 2026 12:33:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254;
 helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37A5340336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37A5340336
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37A5340336
 for <buildroot@buildroot.org>; Sat, 16 May 2026 12:33:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4184B60142
 for <buildroot@buildroot.org>; Sat, 16 May 2026 12:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAC1C19425;
 Sat, 16 May 2026 12:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Date: Sat, 16 May 2026 15:33:25 +0300
Message-ID: <20260516123325.612495-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1778934815;
 bh=kLyxyGVe8SX7En2lGVtkXL8jeuFRIBTwdmApyKYNjnw=;
 h=From:To:Cc:Subject:Date:From;
 b=gVyaKtWkDxb4N9SFU76/Jkrw4hXf8J0qcYH0XKeDRXaQE5R8iGWPrGg4LcR1nN0dK
 QrQCPQDOwRj596SVv+yiUy59slrLFPPuIj1f8MPa0MVM0wuB2vZRt1GGM6lW4kizfu
 C6UfBsKPNvx8VbKKWpUblcs5VudFekcCf7dkSTBqvSu1JuPavLktviGlMVormLQdKr
 r6FKrgAkN+FbdJqqwzkQsjYaXaqkVbRFE3LD4c6WHWzDeelit8S4WGTAtTc3ZB6E1M
 BFUB2rCqibRffoUCHzAZjxV9vRR7mbKqVpdW65Vi7pdA+/RpyMxE36wm5xCUci+N+j
 ZsQThoCixc5tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gVyaKtWk
Subject: [Buildroot] [PATCH] package/quota: bump version to 4.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump version to 4.11. Removed patches given [1] has:

* setproject: Fix openWRT build (Jan Kara)
* setproject: fix openat() call (Konstantin Demin)

[1] https://sourceforge.net/p/linuxquota/code/ci/v4.11/tree/Changelog

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 .../0001-setproject-fix-openat-call.patch     | 41 -------------------
 .../0002-setproject-Fix-openWRT-build.patch   | 32 ---------------
 package/quota/quota.hash                      |  6 +--
 package/quota/quota.mk                        |  2 +-
 4 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 package/quota/0001-setproject-fix-openat-call.patch
 delete mode 100644 package/quota/0002-setproject-Fix-openWRT-build.patch

diff --git a/package/quota/0001-setproject-fix-openat-call.patch b/package/quota/0001-setproject-fix-openat-call.patch
deleted file mode 100644
index 3c5d523e1e..0000000000
--- a/package/quota/0001-setproject-fix-openat-call.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d9852bd5b76ca65f283929e803b87343942ecb1f Mon Sep 17 00:00:00 2001
-From: Konstantin Demin <rockdrilla@gmail.com>
-Date: Tue, 1 Jul 2025 14:35:36 +0200
-Subject: [PATCH] setproject: fix openat() call
-
-It looks like that openat() call was copy-pasted from above fstatat() call.
-However, manpage for openat() doesn't mention AT_SYMLINK_NOFOLLOW.
-Furthermore, AT_SYMLINK_NOFOLLOW constant value (0x100) sometimes (!) clashes
-with O_CREAT constant value which is defined as 0100 (0x40) OR 0x100 (yes, two
-different values for the same constant appear in headers). This produces build
-errors when fortifying defines (-D_FORTIFY_SOURCE) are in effect (e.g. with
-glibc 2.41). In order to keep correct behavior, use O_NOFOLLOW instead of
-AT_SYMLINK_NOFOLLOW.
-
-Fixes: e61d46c65899ced9599c93a6128f19d8759fcad8
-Signed-off-by: Konstantin Demin <rockdrilla@gmail.com>
-Signed-off-by: Jan Kara <jack@suse.cz>
-
-Upstream: https://sourceforge.net/p/linuxquota/code/ci/d9852bd5b76ca65f283929e803b87343942ecb1f/
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- setproject.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setproject.c b/setproject.c
-index 3047c3d..e688dcd 100644
---- a/setproject.c
-+++ b/setproject.c
-@@ -73,7 +73,7 @@ static void setproject_recurse(int dirfd, unsigned id, unsigned dev)
- 		if (!S_ISDIR(st.st_mode) && !S_ISREG(st.st_mode))
- 			continue;
- 
--		int fd = openat(dirfd, d->d_name, AT_SYMLINK_NOFOLLOW);
-+		int fd = openat(dirfd, d->d_name, O_NOFOLLOW);
- 		if (fd < 0) {
- 			errstr(_("error opening %s: %m"), d->d_name);
- 			errno = 0;
--- 
-2.47.3
-
diff --git a/package/quota/0002-setproject-Fix-openWRT-build.patch b/package/quota/0002-setproject-Fix-openWRT-build.patch
deleted file mode 100644
index 04cc5fab04..0000000000
--- a/package/quota/0002-setproject-Fix-openWRT-build.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 41ba7031ca4852739dd1f66102d34e4a98490906 Mon Sep 17 00:00:00 2001
-From: Jan Kara <jack@suse.cz>
-Date: Tue, 1 Jul 2025 15:41:56 +0200
-Subject: [PATCH] setproject: Fix openWRT build
-
-basename() needs libgen.h include in openWRT build environment. Add it.
-
-Reported-by: "W. Michael Petullo" <mike@flyn.org>
-Signed-off-by: Jan Kara <jack@suse.cz>
-
-Upstream: https://sourceforge.net/p/linuxquota/code/ci/41ba7031ca4852739dd1f66102d34e4a98490906/
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- setproject.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setproject.c b/setproject.c
-index e688dcd..4308435 100644
---- a/setproject.c
-+++ b/setproject.c
-@@ -13,6 +13,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <libgen.h>
- 
- #include <linux/fs.h>
- 
--- 
-2.47.3
-
diff --git a/package/quota/quota.hash b/package/quota/quota.hash
index e82c1f2c64..675a28041b 100644
--- a/package/quota/quota.hash
+++ b/package/quota/quota.hash
@@ -1,6 +1,2 @@
-# From https://sourceforge.net/projects/linuxquota/files/quota-tools/4.10/
-sha1  343f26a6f1b6a8dbbd7d89045b0c087efb08d553  quota-4.10.tar.gz
-
-# Locally calculated
-sha256  a04a0cafca29c15be8b6ac660e06188bccb802c19efe2e7c19ed7f3d667ecf5e  quota-4.10.tar.gz
+sha256  0a51b8f920254d8e83c34a4c3082b7d241f5d6fd65188afadf29859d5223ef78  quota-4.11.tar.gz
 sha256  32a5fd41e7a257f7f0373988ea8d45cebdbf376060703c242c11c000751b1203  COPYING
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index f22ebe41c4..f5a0a09dfc 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUOTA_VERSION = 4.10
+QUOTA_VERSION = 4.11
 QUOTA_SITE = https://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
