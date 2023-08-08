Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03886C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 19:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C83CC402E0;
	Tue,  8 Aug 2023 19:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C83CC402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEJ2_DDMkg47; Tue,  8 Aug 2023 19:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71F1402A9;
	Tue,  8 Aug 2023 19:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C71F1402A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 577121BF341
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30F1C60D4C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F1C60D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DC8dcbZJCKjh for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 19:58:04 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB90C60C25
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 19:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB90C60C25
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9836313F88A;
 Tue,  8 Aug 2023 21:57:59 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 21:57:53 +0200
Message-ID: <20230808195753.19748-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691524680;
 bh=vB37cmPXutIf6CQs0a0wIx6xiXxHeqKkN021nIABJQk=;
 h=From:To:Cc:Subject:Date:From;
 b=BechoeXLXwFy4tyS015S9CMjd9vRsAPTkD+V83ZOmtUpMdp03TiY1Bk8vIi7Qtr5t
 ZoHTodAvyZrVBrsNjhur/XfzZ0S2hbQsU7C1OULIqNA5zk3M5wqriT7PnXoPQkonAi
 YVVEtWZUG5b1qvu6HoUHbk5HXxkDf/TZ/4G/X8rWd9dW/0ILJCtsPoMxyMw0DZHRsX
 LnOBB1lQS79l74TdRYBy/wP204aD2uMf0wBRE25S2Nr/FGWqL8grqHb6dD6QBo/tgD
 Lhr7iJbpoDb2DyXfjtqm5T/7EfqN+vj5Zv2JPGE3kOPzfImVpQENOpGjQyCiTPwO7y
 x2oBPsLw9ByeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BechoeXL
Subject: [Buildroot] [PATCH next 1/1] support/docker: add qemu-system-misc
 for riscv runtime tests
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Note: I have already two work-in-progress patch series using
qemu-system-riscv64. I'll wait for this patch to be accepted, and
.gitlab-ci.yml to be updated to use the image before sending those.
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
