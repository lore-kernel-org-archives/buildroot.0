Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F06C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:12:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 839A4610D1
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 839A4610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C0CC614E8;
	Wed, 22 Sep 2021 20:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piFus8S9Hci1; Wed, 22 Sep 2021 20:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAF0A614E3;
	Wed, 22 Sep 2021 20:12:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFEE01BF32D
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF8A4614E3
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RqZzZf5gE62q for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 20:12:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEF0C614D7
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 20:12:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BA1EA8CA10; Wed, 22 Sep 2021 20:10:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 21:58:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d50290764ea3fd7f7fafd1a10aedbe652689ac29
X-Git-Newrev: 71b83227128be62c169313e85bb8f339f977ad67
X-Patchwork-Hint: ignore
Message-Id: <20210922201007.BA1EA8CA10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker: bump docker image for the
 gitlab-ci to Debian bullseye
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71b83227128be62c169313e85bb8f339f977ad67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with Qemu 6.1.0, gcc 7.5 is needed to build.
Since we build host-qemu package for qemu defconfig, we have to
upgrade to (at least) Debian buster that provide gcc 8 as host compiler.

While testing this upgrate, the test_edk2 failed since it actually
requires Qemu >= 4.1.0 to support arm SBSA reference machine [1].
Debian Buster only provide Qemu 3.1.

Finally, upgrade to Debian bullseye but it requires some linux
kernel version bump in several defconfigs since host gcc is based
on gcc-10 [2].

[1] https://git.qemu.org/?p=qemu.git;a=commit;h=64580903c2b3aee08d74d64e6248a313b246cb69
[2] http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=621f2ded601546119fabccd1651b1ae29d26cd38

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Arnout: don't install python]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/docker/Dockerfile       | 2 +-
 support/docker/apt-sources.list | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index a9bacca3a0..2aee129668 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -6,7 +6,7 @@
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
 # file that is shipped next to this Dockerfile.
-FROM debian:stretch-20171210
+FROM debian:bullseye-20210902
 
 LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
index 789fb8fc17..0f872fd398 100644
--- a/support/docker/apt-sources.list
+++ b/support/docker/apt-sources.list
@@ -1,4 +1,4 @@
-# Latest just before 20171210T000000Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch-updates main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20171209T224618Z/ stretch/updates main
+# Latest just before 20210817T000000Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20210902T193650Z/ bullseye-security main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye-updates main
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
