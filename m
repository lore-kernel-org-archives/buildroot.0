Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6918C27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 15:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D054605B0;
	Sun,  9 Jun 2024 15:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8RY4CS74dDx; Sun,  9 Jun 2024 15:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D4360774
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D4360774;
	Sun,  9 Jun 2024 15:54:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12B6E1BF3EC
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 15:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F354D406A4
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 15:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIIHu8FXG8MC for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 15:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F295E4029C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F295E4029C
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 15:54:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DACE687D91; Sun,  9 Jun 2024 15:54:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jun 2024 17:45:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 089943812eb8dcbd308f3a3dea02d482bf9189df
X-Git-Newrev: 035651209f4a975cb5413b3911f5598db73e4822
X-Patchwork-Hint: ignore
Message-Id: <20240609155422.DACE687D91@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3: fix config
 directory pattern
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

commit: https://git.buildroot.net/buildroot/commit/?id=035651209f4a975cb5413b3911f5598db73e4822
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If a platform triplet is not detected during the configure stage, the
config directory (LIBPL) defaults to `config-$VERSION`.

In this scenario, the `PYTHON3_REMOVE_USELESS_FILES` hook would fail due
to `find` incorrectly expecting a second dash and then the triplet.

Now, we glob anything after the version which will match in both cases.

Fixes: 54d48c8cad ("package/python3: miscellaneous fixups")

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python3/python3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6859fc2274..86fa3b970d 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -197,7 +197,7 @@ PYTHON3_CONF_OPTS += \
 define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)-*/ \
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)*/ \
 		-type f -not -name Makefile -exec rm -rf {} \;
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/ -type d \
 		-name __pycache__ -exec rm -rf {} \;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
