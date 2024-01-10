Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C56C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 910D043781;
	Wed, 10 Jan 2024 21:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 910D043781
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmNFAV4S7wX1; Wed, 10 Jan 2024 21:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 557144376A;
	Wed, 10 Jan 2024 21:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 557144376A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 483371BF966
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21481835D9
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21481835D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MvlqkUnNBrRm for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:12:28 +0000 (UTC)
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB9328308B
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB9328308B
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Nfs8rVGdOnb7jNfs9rhRsz; Wed, 10 Jan 2024 22:12:25 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:12:22 +0100
Message-Id: <20240110211223.791548-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110211223.791548-1-giulio.benetti@benettiengineering.com>
References: <20240110211223.791548-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJCNQuiw48y4aCsbOT02MhBJdrN1x+dbShA0N4DiFAiErFLSX0rNCu60pAkS9No4qSOuFEiNhaC65NOi5PdXfNXCouHjh6XtDWep8Ucn0rkBkXoI8ZIg
 JFIrFBesJQpT6pP418lr2VwNCLLXtVUYJ5f4PsdaYx29KtToZD5hkT7EUTNsc24LyvwbG8OM4BvVEiG9xbcot3pb/APme9Cbg3dDM0P1CQycXJnU94SIWOEV
 aS6pNZCJdI/Mr6d5dCpZxJzWe/GBSdqptLYKYndn85yM6DJ0PKj3mVEhvX8085f/D/KIGNGFFenNZ24VgYa4sfQscRpkRXkwwCkTR+4BxPu0e8o6KGdGb6Lb
 1PzAcoHp
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704921145; bh=/2MN0+5rLx9PK6L4TSXOHEWVhrmRnAWxLpl3J2n8JGc=;
 h=From:To:Subject:Date:MIME-Version;
 b=UNq6YbiD0lw6jQvJnAz2ryWLyKum5oJ9icCvBDmmWqzwE+bBbRFScaQis5QBxJTc5
 AzC0jvLjjIGS282LWCJJZYoDRCBQrgnki+dlfDhouV5KKmw6V3yN5lV0LuL9JQJUbQ
 URzdtZvrcYTYMIWjJPqUcPr1NV8FlKsJ2g3c/EyosXnzAk1xQgtn3+IADYPM3qM0iu
 64okqFawS1N/YgLXFAuoraCWzN/26uDVha1DBOk9lODQ62IAu7yPTcKDcWyWJKiEld
 hZ4kHTWbiRGWvrqgLDl6gQzgPATSb9r66JPeCxAmCQtldCbf9brLQH1vLvvH9XU3BB
 F/pzay21qRy8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UNq6YbiD
Subject: [Buildroot] [PATCH v2 2/3] package/libtraceevent: bump to version
 1.8.2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add new patch
---
 package/libtraceevent/libtraceevent.hash | 2 +-
 package/libtraceevent/libtraceevent.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
index 14dcf54c67..c338491f26 100644
--- a/package/libtraceevent/libtraceevent.hash
+++ b/package/libtraceevent/libtraceevent.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  1801f416b317e2ae0430ce964cf22b9ecb9fb5cd9c6c2d1073b29953c3309bca  libtraceevent-1.8.1.tar.gz
+sha256  919f0c024c7b5059eace52d854d4df00ae7e361a4033e1b4d6fe01d97064a1b9  libtraceevent-1.8.2.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
index d348fc51f6..da0aa575d7 100644
--- a/package/libtraceevent/libtraceevent.mk
+++ b/package/libtraceevent/libtraceevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEEVENT_VERSION = 1.8.1
+LIBTRACEEVENT_VERSION = 1.8.2
 LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
 LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
 LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
