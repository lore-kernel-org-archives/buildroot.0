Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70986C7618A
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 13:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D06C4185D;
	Wed, 15 Mar 2023 13:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D06C4185D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AGVJliEjZsBC; Wed, 15 Mar 2023 13:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4BE34186B;
	Wed, 15 Mar 2023 13:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4BE34186B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13E301BF31D
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 131E34098E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 131E34098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IXlszuVwyVCg for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 13:09:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EEC840948
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 13:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EEC840948
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E9E3873E8; Wed, 15 Mar 2023 13:09:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 14:06:25 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c59348420fa9e010c98609c881b1163b6827df4e
X-Git-Newrev: f953a186d160ff80e2bcb979db53b55b373454f1
X-Patchwork-Hint: ignore
Message-Id: <20230315130904.2E9E3873E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bash: fix naming
 of target-finalize-hook
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

commit: https://git.buildroot.net/buildroot/commit/?id=f953a186d160ff80e2bcb979db53b55b373454f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When the target-finalize-hook for bash was added in commit
311c9eebc4dcfb764e3a7082706daf68e0603188 in order to write bash into
/etc/shells, it was done at the same time as for package/mksh and it was
incorrectly copied and MKSH still appeared in the name of the hook.

The hook is now correctly named BASH_ADD_BASH_TO_SHELLS

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7f96255f4a40a5cbc0c37a69126c5a06fe8773b6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash/bash.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 3aca22898e..9a7b768241 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -62,10 +62,10 @@ endif
 
 # Add /bin/bash to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
-define BASH_ADD_MKSH_TO_SHELLS
+define BASH_ADD_BASH_TO_SHELLS
 	grep -qsE '^/bin/bash$$' $(TARGET_DIR)/etc/shells \
 		|| echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
 endef
-BASH_TARGET_FINALIZE_HOOKS += BASH_ADD_MKSH_TO_SHELLS
+BASH_TARGET_FINALIZE_HOOKS += BASH_ADD_BASH_TO_SHELLS
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
