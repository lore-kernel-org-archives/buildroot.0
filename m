Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1A5C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9638A401BD;
	Mon, 20 Feb 2023 20:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9638A401BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-56UFUzYRwd; Mon, 20 Feb 2023 20:53:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C19E41C8A;
	Mon, 20 Feb 2023 20:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C19E41C8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87BB01BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56CD8419C5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56CD8419C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hU5Xk8aBzbf5 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 591F64194F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 591F64194F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48F2A86495; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:12:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 21747875f90cb3345b6927ded9fffb7582cf06a1
X-Git-Newrev: e71ef565e720e56c51eed6933f6d87331193837f
X-Patchwork-Hint: ignore
Message-Id: <20230220205149.48F2A86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lxc: add systemd
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e71ef565e720e56c51eed6933f6d87331193837f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure raised since bump to version 5.0.1 in
commit db19998035701d08bf1b5fd366e0b5aa9adb8e57:

Run-time dependency systemd found: NO (tried pkgconfig and cmake)

../output-1/build/lxc-5.0.1/config/init/systemd/meson.build:11:4: ERROR: Dependency "systemd" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/495175c367084093bc01c40290736c738d876894

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lxc/lxc.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index f0a0e8041a..e1639c5f15 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -63,4 +63,19 @@ else
 LXC_CONF_OPTS += -Dopenssl=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+LXC_CONF_OPTS += -Dsd-bus=enabled
+LXC_DEPENDENCIES += systemd
+else
+LXC_CONF_OPTS += -Dsd-bus=disabled
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LXC_CONF_OPTS += -Dinit-script=systemd
+else ifeq ($(BR2_INIT_SYSV),y)
+LXC_CONF_OPTS += -Dinit-script=sysvinit
+else
+LXC_CONF_OPTS += -Dinit-script=
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
