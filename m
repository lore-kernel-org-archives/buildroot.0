Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CC4C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7B6D403B2;
	Sat, 11 Dec 2021 23:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FPqGWyN4snr; Sat, 11 Dec 2021 23:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E5E1403B1;
	Sat, 11 Dec 2021 23:09:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 164F01BF297
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAF094047B
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGsqqVqfU7Pk for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:06:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98927404B6
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:06:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4326B82ABB; Sat, 11 Dec 2021 23:01:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 23:42:17 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: e8b450d67708275c85076c07ec60f29c0ea7e87d
X-Git-Newrev: 168e25719d455e4be06486e312b3c261c3c43dd3
X-Patchwork-Hint: ignore
Message-Id: <20211211230119.4326B82ABB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] support/docker: don't use
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

commit: https://git.buildroot.net/buildroot/commit/?id=168e25719d455e4be06486e312b3c261c3c43dd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
