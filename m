Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F406C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BA0C40116;
	Sat,  4 Nov 2023 17:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BA0C40116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8wWSZ4AHuXze; Sat,  4 Nov 2023 17:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 189504014B;
	Sat,  4 Nov 2023 17:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 189504014B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1056D1BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA5BA821BD
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5BA821BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48_qxEmUbjyN for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:44:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F1168216C
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F1168216C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A81C866BA; Sat,  4 Nov 2023 17:44:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 18:42:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a9b47a8dbb1e7b709704239b578474a20d84c89
X-Git-Newrev: 893bd5697488c45809eeebebaff699c7c242c02f
X-Patchwork-Hint: ignore
Message-Id: <20231104174402.0A81C866BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker: use host's network setup
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=893bd5697488c45809eeebebaff699c7c242c02f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our utils/docker-run wrapper is needed to provide a reproducible build
environment: tools, variables, etc... but is not meant for
isolation. As such, we do not care which network configuration is
used.

In some settings (e.g. enterprise networks), it is often the case that
a VPN is in use, especially in those wonderful times of widespread
remote work.

Letting Docker decide on the network setup will most usually lead to
it creating a private network that is NATed onto the principal network
interface, leading to non-functional network in the container when a
VPN is in use.

As such, always use the host network configuration, and do not let
Docker create a private network for the container.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/docker-run | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/docker-run b/utils/docker-run
index 848e9b3840..464cbf691f 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -21,6 +21,7 @@ declare -a docker_opts=(
     --user "$(id -u):$(id -g)"
     --workdir "$(pwd)"
     --security-opt label=disable
+    --network host
 )
 
 declare -a mountpoints=(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
