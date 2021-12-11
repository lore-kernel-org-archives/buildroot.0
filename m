Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119A6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE848402C5;
	Sat, 11 Dec 2021 23:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQV9rjUwb7xc; Sat, 11 Dec 2021 23:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2FA540291;
	Sat, 11 Dec 2021 23:06:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E72331BF963
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D452C424F8
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VtyAGZKqW2AB for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:06:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 223E0422EA
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:06:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B218F82A4F; Sat, 11 Dec 2021 23:01:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 23:42:12 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 69fa2d879c0f08c25e5c94cdf1801ddc3b98a181
X-Git-Newrev: bda562d50950036bc9ebbf93401b9f8bd28bebfc
X-Patchwork-Hint: ignore
Message-Id: <20211211230107.B218F82A4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] support/docker: don't use
 sudo to build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bda562d50950036bc9ebbf93401b9f8bd28bebfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

On a properly setup machine, it is totally useless to use sudo to run
docker; it is very bad practice. Instead, users really should add
themselves to the docker group.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9f6a2dbe030b10eda2797430a87fffc34f8c4685)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 9bd62a04fe..f31477c023 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -1,7 +1,7 @@
 # This Dockerfile generates the docker image that gets used by Gitlab CI
 # To build it (YYYYMMDD.HHMM is the current date and time in UTC):
-#   sudo docker build -t buildroot/base:YYYYMMDD.HHMM support/docker
-#   sudo docker push buildroot/base:YYYYMMDD.HHMM
+#   docker build -t buildroot/base:YYYYMMDD.HHMM support/docker
+#   docker push buildroot/base:YYYYMMDD.HHMM
 
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository, so do not forget to update the apt-sources.list
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
