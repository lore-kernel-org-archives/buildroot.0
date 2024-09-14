Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75226C02186
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4170881238;
	Sat, 14 Sep 2024 09:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnlErCq_Rf8V; Sat, 14 Sep 2024 09:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2482884717
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2482884717;
	Sat, 14 Sep 2024 09:13:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F308F1BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED00E8455C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3t545vTgWwv for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D82581238
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D82581238
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:13:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 477CC86FD0; Sat, 14 Sep 2024 09:13:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:12:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07c18fbc9e2101efe9220a643964c083743209c5
X-Git-Newrev: 24cac9c4e6a36fd14b263a8eecf7ae7d58ab5a59
X-Patchwork-Hint: ignore
Message-Id: <20240914091311.477CC86FD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system: add tini as init system
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

commit: https://git.buildroot.net/buildroot/commit/?id=24cac9c4e6a36fd14b263a8eecf7ae7d58ab5a59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tini is a special-purpose init system, aimed at containers.

Add it to the choice of init systems.

tini does not require much, so we re-use the default "none" skeleton.

Note that tini is no longer selectable on its own, which it used to be.
This change will require that people using tini be careful when
upgrading, though, but that will be very easily caught, as the
containers would no longer start at all.

We could add a comment stating why, but no other init system has such a
comment, so adding one for tini alone would be weird, so we don't add
one.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/tini/Config.in |  1 +
 system/Config.in       | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/tini/Config.in b/package/tini/Config.in
index 719e1e1f22..bca8ad8e96 100644
--- a/package/tini/Config.in
+++ b/package/tini/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TINI
 	bool "tini"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_INIT_TINI
 	help
 	  tini is a simple but valid init binary to
 	  act as PID 1 for containers.
diff --git a/system/Config.in b/system/Config.in
index 97671ab161..a1199d850d 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -149,6 +149,22 @@ comment "systemd highly recommends Linux >= 4.15"
 
 comment "Special purpose (read help)"
 
+config BR2_INIT_TINI
+	bool "tini"
+	depends on BR2_USE_MMU  # tini
+	select BR2_PACKAGE_TINI
+	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
+	help
+	  Tini - A tiny but valid init for containers
+
+	  Tini is the simplest init you could think of.
+
+	  All Tini does is spawn a single child (Tini is meant to be run
+	  in a container), and wait for it to exit all the while reaping
+	  zombies and performing signal forwarding.
+
+	  https://github.com/krallin/tini
+
 config BR2_INIT_NONE
 	bool "Custom (none)"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
