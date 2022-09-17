Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A90C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 10:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F12241D1D;
	Sat, 17 Sep 2022 10:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F12241D1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjCqaMeqkTZc; Sat, 17 Sep 2022 10:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FBF641A40;
	Sat, 17 Sep 2022 10:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FBF641A40
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F362A1BF5A4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9658842E2
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9658842E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyT3EP-09P3N for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 10:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6E778402E
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 10:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6E778402E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D6A45841A3; Sat, 17 Sep 2022 10:26:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 12:14:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93f53e4e1732c2834d2661fc3692703bbd26616a
X-Git-Newrev: ec8e8aaa3af7ae717a3b107d0731a5932f1beb8d
X-Patchwork-Hint: ignore
Message-Id: <20220917102605.D6A45841A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/runc: bump to version 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec8e8aaa3af7ae717a3b107d0731a5932f1beb8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the fourth patch release in the 1.1.z series of runc, primarily fixing a
regression introduced in 1.1.3 related to device rules, as well as other bugs.

 - Fix mounting via wrong proc fd. When the user and mount namespaces are used,
 and the bind mount is followed by the cgroup mount in the spec, the cgroup was
 mounted using the bind mount's mount fd.
 - Switch kill() in libcontainer/nsenter to sane_kill().
 - Fix "permission denied" error from runc run on noexec fs.
 - Fix failed exec after systemctl daemon-reload. Due to a regression in v1.1.3,
 the DeviceAllow=char-pts rwm rule was no longer added and was causing an error
 open /dev/pts/0: operation not permitted: unknown when systemd was reloaded.

https://github.com/opencontainers/runc/releases/tag/v1.1.4

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d94a0c20ca..6c8fddd397 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fc1c70e095d662e38a5889bc6de41857762ce022caaf8be2852663198c533a63  runc-1.1.3.tar.gz
+sha256  4f02077432642eebd768fc857318ae7929290b3a3511eb1be338005e360cfa34  runc-1.1.4.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index aef52de618..b60f1da2e7 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.3
+RUNC_VERSION = 1.1.4
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
