Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD260C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72AD860B51;
	Tue, 21 Feb 2023 01:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72AD860B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orP0NWE-Dd18; Tue, 21 Feb 2023 01:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A52296FC0D;
	Tue, 21 Feb 2023 01:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A52296FC0D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF581BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC1886FC11
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC1886FC11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K_UelnQYpd3Q for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3262E6FC21
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3262E6FC21
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E8548648F; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 16:30:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 71c132494062055bf07c23617a56f0b705dbe93b
X-Git-Newrev: b95f7591bd83a0e483d2b6db49258d2ea8b44f3d
X-Patchwork-Hint: ignore
Message-Id: <20230220205250.2E8548648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gitlab-runner: use
 LIBCURL_FORCE_TLS to enforce TLS support in curl
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

commit: https://git.buildroot.net/buildroot/commit/?id=b95f7591bd83a0e483d2b6db49258d2ea8b44f3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

BR2_PACKAGE_LIBCURL_OPENSSL is part of a "choice" option so it cannot be
selected.  What seems to be really be needed is HTTPS support in curl, so
use the blind LIBCURL_FORCE_TLS option instead (openssl is already
selected).

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
