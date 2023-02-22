Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BF6C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 19:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9215140332;
	Wed, 22 Feb 2023 19:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9215140332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QqUi34C-40pL; Wed, 22 Feb 2023 19:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D928940547;
	Wed, 22 Feb 2023 19:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D928940547
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB4A81BF475
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 19:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90E244055D
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 19:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90E244055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id df7p9tiRDwzV for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 19:44:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20B2C4032E
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 19:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20B2C4032E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03B5E867D8; Wed, 22 Feb 2023 19:44:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 20:29:39 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4fa653b1180646cf2ab3965514c10d6ad1f109f0
X-Git-Newrev: 227bfb48661865a2496ce28236d1aba0ca831bae
X-Patchwork-Hint: ignore
Message-Id: <20230222194454.03B5E867D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/gitlab-runner:
 use LIBCURL_FORCE_TLS to enforce TLS support in curl
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

commit: https://git.buildroot.net/buildroot/commit/?id=227bfb48661865a2496ce28236d1aba0ca831bae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

BR2_PACKAGE_LIBCURL_OPENSSL is part of a "choice" option so it cannot be
selected.  What seems to be really be needed is HTTPS support in curl, so
use the blind LIBCURL_FORCE_TLS option instead (openssl is already
selected).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b95f7591bd83a0e483d2b6db49258d2ea8b44f3d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gitlab-runner/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
index 89e3e87b5c..4289613ab9 100644
--- a/package/gitlab-runner/Config.in
+++ b/package/gitlab-runner/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
 	select BR2_PACKAGE_GIT # runtime
 	select BR2_PACKAGE_LIBCURL # runtime
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
-	select BR2_PACKAGE_LIBCURL_OPENSSL # runtime, for ca-certificates.
+	select BR2_PACKAGE_LIBCURL_FORCE_TLS # runtime
 	select BR2_PACKAGE_OPENSSL # runtime
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # runtime
 	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
