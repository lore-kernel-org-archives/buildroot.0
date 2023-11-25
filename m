Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31A4C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61ACF4185C;
	Mon,  4 Dec 2023 20:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61ACF4185C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fA8NjIUqhNl3; Mon,  4 Dec 2023 20:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A0E41877;
	Mon,  4 Dec 2023 20:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A0E41877
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21AD01BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A004B4174E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A004B4174E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETlGlymj8R65 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 564A24175A
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 564A24175A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FF0E879B8; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:02:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fde20964c71202589568d84de0c3bb4c3d6e9b17
X-Git-Newrev: 0c54deff255d433db46e6c5ecd14c8e97f1715dd
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.3FF0E879B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jailhouse: expand
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
