Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E444EE49A6
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E1081F7A;
	Sun, 20 Aug 2023 14:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33E1081F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHQQmjeLr4FU; Sun, 20 Aug 2023 14:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8464081FDC;
	Sun, 20 Aug 2023 14:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8464081FDC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFFE41BF363
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C29D81F61
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C29D81F61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wo-BIgoWVUkl for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78B4981F64
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78B4981F64
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65AB685E1E; Sun, 20 Aug 2023 14:21:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:20:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: db777eef134ac3034a7970511ab96312d356c83e
X-Git-Newrev: 3b877dc7c272d9624b6fbef97e1846e32002e4a6
X-Patchwork-Hint: ignore
Message-Id: <20230820142118.65AB685E1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/docker-run: make it
 compatible with SELinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b877dc7c272d9624b6fbef97e1846e32002e4a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

After switching to a fresh Fedora 38 installation with SELinux disabled,
we noticed that utils/docker-run doesn't work as the applications
running inside the container are not allowed to accept the data mounted
through the bind mount.

Since we do not really need to isolate and confine the build, but rather
to provide a known environment, we don;t really need to enforce any
SELinux confinment in the container.

So, we tell docker to turn off label confinement for the container:

    https://manpages.org/docker-run

    --security-opt=[]
      Security Options
        [...]
        "label=disable"     : Turn off label confinement for the container

Suggested-by: Antoine Tenart <atenart@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: use Antoine's proposal]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/docker-run b/utils/docker-run
index e64b4f10c0..33d2e63abc 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -18,6 +18,7 @@ declare -a docker_opts=(
     --rm
     --user "$(id -u):$(id -g)"
     --workdir "$(pwd)"
+    --security-opt label=disable
 )
 
 declare -a mountpoints=(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
