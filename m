Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8744AC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 13:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 131744195B;
	Wed, 15 Mar 2023 13:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 131744195B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qM91_Rv2VAXf; Wed, 15 Mar 2023 13:08:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46E941950;
	Wed, 15 Mar 2023 13:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C46E941950
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBEE11BF962
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B67BE60E3F
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B67BE60E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTzlgiaEppxq for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 13:07:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECD1160AA3
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 13:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD1160AA3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA35C873D8; Wed, 15 Mar 2023 13:07:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 14:06:32 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4c6520b0af709667879f0dea10c3549a59e56824
X-Git-Newrev: 121bfe87be6b0f2bc70d28db2d93bca66c515b37
X-Patchwork-Hint: ignore
Message-Id: <20230315130756.DA35C873D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/bash: fix naming
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

commit: https://git.buildroot.net/buildroot/commit/?id=121bfe87be6b0f2bc70d28db2d93bca66c515b37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
