Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCE8C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D367607B0;
	Tue, 21 Feb 2023 01:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D367607B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nw0TF3DUwS8D; Tue, 21 Feb 2023 01:43:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC6B4700BB;
	Tue, 21 Feb 2023 01:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC6B4700BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2F581BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6160C6FFE7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6160C6FFE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CIQ0wcUtOh_M for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DE036FFEB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DE036FFEB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 791FD81979; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 18:14:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d24c6f4b15f4794046e8e1ee220298c90ddecd19
X-Git-Newrev: 7a7c6725f6ca5c1108e6fb76fad414132555b373
X-Patchwork-Hint: ignore
Message-Id: <20230220205253.791FD81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/docker: use
 APT::Retries in apt-get calls to retry
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a7c6725f6ca5c1108e6fb76fad414132555b373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

snapshot.debian.org is notoriously slow, and quite often leads to
timeouts when downloading packages. To give us a better chance of
succeeding, let's retry 3 times before failing.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/docker/Dockerfile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index de1534e77a..a16c1e3849 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -20,8 +20,8 @@ COPY apt-sources.list /etc/apt/sources.list
 
 # The container has no package lists, so need to update first
 RUN dpkg --add-architecture i386 && \
-    apt-get update -y
-RUN apt-get install -y --no-install-recommends \
+    apt-get -o APT::Retries=3 update -y
+RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
         bc \
         build-essential \
         bzr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
