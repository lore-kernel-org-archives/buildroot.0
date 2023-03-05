Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71341C6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2491560FDB;
	Sun,  5 Mar 2023 18:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2491560FDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBAHXdS8oSCd; Sun,  5 Mar 2023 18:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 659E660F99;
	Sun,  5 Mar 2023 18:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 659E660F99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D57C71BF868
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0388813CA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0388813CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 086IIDDo7Q-w for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:28:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D62BC81757
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D62BC81757
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C446786705; Sun,  5 Mar 2023 18:28:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 19:22:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7af75b36aaf5c048a2db3e506cb7ec10d4ba05dc
X-Git-Newrev: 7f96255f4a40a5cbc0c37a69126c5a06fe8773b6
X-Patchwork-Hint: ignore
Message-Id: <20230305182821.C446786705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bash: fix naming of
 target-finalize-hook
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f96255f4a40a5cbc0c37a69126c5a06fe8773b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the target-finalize-hook for bash was added in commit
311c9eebc4dcfb764e3a7082706daf68e0603188 in order to write bash into
/etc/shells, it was done at the same time as for package/mksh and it was
incorrectly copied and MKSH still appeared in the name of the hook.

The hook is now correctly named BASH_ADD_BASH_TO_SHELLS

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash/bash.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index ec5e2d722f..9a73ed8c36 100644
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
