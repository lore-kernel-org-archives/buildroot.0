Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE05C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6332260F68;
	Sat,  1 Oct 2022 16:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6332260F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LE4kGJ2XtfuF; Sat,  1 Oct 2022 16:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B50560EE4;
	Sat,  1 Oct 2022 16:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B50560EE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCDE71BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5EE960EE4
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5EE960EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGKByYRcH25d for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:28:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E015B60E7A
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E015B60E7A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C44078640A; Sat,  1 Oct 2022 16:28:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 18:27:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6229a31f8d7e5e38a98055f2a99b4f74683b394c
X-Git-Newrev: 60f97ad95ad2ec93effed8a41e7d2e6101cd6917
X-Patchwork-Hint: ignore
Message-Id: <20221001162812.C44078640A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gitlab-runner: fix forcing openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=60f97ad95ad2ec93effed8a41e7d2e6101cd6917
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can't use BR2_PACKAGE_LIBOPENSSL to force selecting libopenssl, as
it is part of a choice. Instead, we have a symbol explicitly to force
libopenssl: BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL.

Use that.

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gitlab-runner/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
index 72c2742562..89e3e87b5c 100644
--- a/package/gitlab-runner/Config.in
+++ b/package/gitlab-runner/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_LIBCURL_OPENSSL # runtime, for ca-certificates.
 	select BR2_PACKAGE_OPENSSL # runtime
-	select BR2_PACKAGE_LIBOPENSSL # runtime
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # runtime
 	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
 	select BR2_PACKAGE_TAR # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
