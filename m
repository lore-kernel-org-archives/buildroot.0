Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8B4EC873B
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57BE983C9A;
	Thu,  7 Sep 2023 15:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57BE983C9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YND2kNqvBICi; Thu,  7 Sep 2023 15:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DB9782F6C;
	Thu,  7 Sep 2023 15:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB9782F6C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14EBD1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A496841E09
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A496841E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3_rSpJUIjse for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D135D41E37
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D135D41E37
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD1A886A1E; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 23:20:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c806e132ac64c61e4374b76c7e1d9aa14c4bbdd
X-Git-Newrev: 93c7b55c778e3dd4d84945918e5d97d5f56256c5
X-Patchwork-Hint: ignore
Message-Id: <20230907145132.BD1A886A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker: add qemu-system-misc for
 riscv runtime tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=93c7b55c778e3dd4d84945918e5d97d5f56256c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The docker image currently contains qemu-system-arm and
qemu-system-x86. Each package contains the 32bit and 64bit variants.
This has been sufficient for the time being.

The RISC-V ecosystem is growing rapidly. It is starting to become
mainstream. To increase the diversity in Buildroot runtime tests,
this commit adds the qemu-system-misc package in the Docker image,
in order to have the commands qemu-system-riscv{32,64}. This package
also contains other architectures (for example: microblaze, nios2,
s390x, xtensa, ...).

For Debian package details, see:
https://packages.debian.org/bullseye/qemu-system-misc

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index a16c1e3849..8c6e2add60 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -44,6 +44,7 @@ RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
         python3-pexpect \
         python3-pytest \
         qemu-system-arm \
+        qemu-system-misc \
         qemu-system-x86 \
         rsync \
         shellcheck \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
