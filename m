Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3131C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 17:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB5682C33;
	Thu, 14 Apr 2022 17:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e0CSc8vBmt4X; Thu, 14 Apr 2022 17:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CD708269C;
	Thu, 14 Apr 2022 17:29:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2561BF39C
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17C324150E
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wwqzhY1nAQS for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 17:29:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 267E3410C0
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 17:29:16 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8478D20C34F4;
 Thu, 14 Apr 2022 10:29:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8478D20C34F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649957355;
 bh=gXwz7XGtzN+GCv7R//+QysTGax9XE/YzsbhgPUrBp+8=;
 h=From:To:Cc:Subject:Date:From;
 b=ZL0dKck+2D0u9QGZsh37wFPUeDNEjq+UmcmEzXsiYte8HCbFKtIYqei48Dj3LkSbI
 REcHuFab9JnrIiQx6S9ojqWubsbZ6Gc1aNYwE0MJY02t/dIAWSiIGrLHG3YjPB0Gnn
 99hoW06ZRW2lop31VuzP1u5nsjZoisEGEHBRuiTo=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 18:28:56 +0100
Message-Id: <20220414172857.35100-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 0/1] New "docker" ready qemu config
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


First, I hope you are fine and the same for your relatives.

In this contribution, I added a new qemu config for x86_64.
This configuration is mainly based on qemu_x86_64_defconfig but it adds kernel
CONFIG_ to be able to use docker.
It also adds package related to docker like DOCKER_CLI and CONTAINERD.

The CONFIG_ options added were checked with moby check-config script [1].

I was able to build and execute the image with start-qemu.sh:
Welcome to Buildroot
buildroot login: root
# docker run --rm hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
2db29710123e: Pull complete
Digest: sha256:10d7d58d5ebd2a652f4d93fdd86da8f265f5318c6a73cc5b6a9798ff6d2b2e67
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

Sadly, the image has to a bit big (more than 300M) but I think it is fine since
this image will only be used for virtualization.

If you say any way to improve this contribution, feel free to share it!

Francis Laniel (1):
  qemu_x86_64_docker: add new qemu defconfig

 DEVELOPERS                             |   2 +
 board/qemu/x86_64_docker/linux.config  | 112 +++++++++++++++++++++++++
 board/qemu/x86_64_docker/post-build.sh |  11 +++
 board/qemu/x86_64_docker/readme.txt    |   7 ++
 configs/qemu_x86_64_docker_defconfig   |  49 +++++++++++
 5 files changed, 181 insertions(+)
 create mode 100644 board/qemu/x86_64_docker/linux.config
 create mode 100755 board/qemu/x86_64_docker/post-build.sh
 create mode 100644 board/qemu/x86_64_docker/readme.txt
 create mode 100644 configs/qemu_x86_64_docker_defconfig


Best regards and thank you in advance.
---
[1] https://github.com/moby/moby/blob/master/contrib/check-config.sh
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
