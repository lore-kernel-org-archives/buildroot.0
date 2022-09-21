Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D204C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA5BF61079;
	Wed, 21 Sep 2022 20:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5BF61079
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLINg5EVmyAT; Wed, 21 Sep 2022 20:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55CAF6107C;
	Wed, 21 Sep 2022 20:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55CAF6107C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73C5B1BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C8F340483
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C8F340483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id belG2xPyr0Ns for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:44:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 882CF400D2
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 882CF400D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EFB385DB7; Wed, 21 Sep 2022 20:44:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 22:40:25 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 180c928b6d39c0c2a61148bab767a07f23765a13
X-Git-Newrev: 3a13c6f1c2ac76a1614dcf6aff870a2af0f2cdd4
X-Patchwork-Hint: ignore
Message-Id: <20220921204425.6EFB385DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/runc: bump to
 version 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a13c6f1c2ac76a1614dcf6aff870a2af0f2cdd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit ec8e8aaa3af7ae717a3b107d0731a5932f1beb8d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
