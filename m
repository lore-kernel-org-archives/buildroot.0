Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB64EC8745
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA1C83C0B;
	Thu,  7 Sep 2023 15:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA1C83C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3TbvwXif7PQj; Thu,  7 Sep 2023 15:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43FE583C06;
	Thu,  7 Sep 2023 15:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43FE583C06
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0899B1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 442EE41DCE
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442EE41DCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_VWxf1xcjwJ for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C91541D93
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C91541D93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1998686A1E; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:20:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db777eef134ac3034a7970511ab96312d356c83e
X-Git-Newrev: 3b877dc7c272d9624b6fbef97e1846e32002e4a6
X-Patchwork-Hint: ignore
Message-Id: <20230907145130.1998686A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: make it compatible with
 SELinux
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
