Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30E8C4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E64BE80A5A;
	Sat, 25 Nov 2023 21:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E64BE80A5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvEZciw45C7w; Sat, 25 Nov 2023 21:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5544180F54;
	Sat, 25 Nov 2023 21:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5544180F54
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB4C91BF473
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9175181238
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9175181238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8nsDN1PO01z for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 21:05:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C44A880F54
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 21:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C44A880F54
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC7C6873AF; Sat, 25 Nov 2023 21:05:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:02:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fde20964c71202589568d84de0c3bb4c3d6e9b17
X-Git-Newrev: 0c54deff255d433db46e6c5ecd14c8e97f1715dd
X-Patchwork-Hint: ignore
Message-Id: <20231125210555.AC7C6873AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jailhouse: expand
 PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c54deff255d433db46e6c5ecd14c8e97f1715dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In a follow-up patch, we want to remove this variable. Replace it with
its expansion, which is anyway just
$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) --root=$(TARGET_DIR)

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
[yann.morin.1998@free.fr:
  - fixup after introduction of JAILHOUSE_INSTALL_HELPER_SCRIPTS
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jailhouse/jailhouse.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 913be765bd..c239e75e76 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -42,7 +42,8 @@ define JAILHOUSE_INSTALL_HELPER_SCRIPTS
 	$(PKG_PYTHON_SETUPTOOLS_ENV) \
 	$(HOST_DIR)/bin/python setup.py \
 		install --no-compile \
-		$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
+		$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
+		--root=$(TARGET_DIR))
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
