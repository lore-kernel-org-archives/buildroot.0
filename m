Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EF4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 16:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFBD440423;
	Mon, 14 Feb 2022 16:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOfB_57UhucN; Mon, 14 Feb 2022 16:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA45C40332;
	Mon, 14 Feb 2022 16:57:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6E931BF97D
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 16:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 961B060B57
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 16:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M606ut2XtliW for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 16:57:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E312360F26
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 16:57:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 15E6382AA4; Mon, 14 Feb 2022 16:49:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 17:56:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61912cc89a0ee391fdb1d79203fbf027822fa97d
X-Git-Newrev: cef07c93587b186f68c42b8748a4db81c81ec7dc
X-Patchwork-Hint: ignore
Message-Id: <20220214164932.15E6382AA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: allow interactive use
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

commit: https://git.buildroot.net/buildroot/commit/?id=cef07c93587b186f68c42b8748a4db81c81ec7dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without -i, the container cannot be used interactively. Allow using it as
in:

  $ ./utils/docker-run
  + exec docker run -v /home/ceresoli/devel/buildroot:/home/br-user -it registry.gitlab.com/buildroot.org/buildroot/base:20220206.1756
  br-user@1e9508a4ccbb:~$ ls
  arch  board  boot  CHANGES  Config.in  Config.in.legacy  configs  COPYING  DEVELOPERS  docs  fs  linux	Makefile  Makefile.legacy  output  package  README  support  system  toolchain	utils
  br-user@1e9508a4ccbb:~$

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 35153199a1..2bca8d8e3a 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -7,4 +7,4 @@ IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
 set -x
-exec docker run -v "${MAIN_DIR}:/home/br-user" -t "${IMAGE}" "$@"
+exec docker run -v "${MAIN_DIR}:/home/br-user" -it "${IMAGE}" "$@"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
