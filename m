Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C349C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 16:31:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4C67619E0
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 16:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4C67619E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8585A4049D;
	Sun,  3 Oct 2021 16:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VObijfqNVkr3; Sun,  3 Oct 2021 16:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A20740578;
	Sun,  3 Oct 2021 16:31:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69D2A1BF59A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 16:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5947360B5B
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 16:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PfhuuaaZGWrT for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 16:31:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88C9B60B37
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 16:31:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3A8EB8DBFD; Sun,  3 Oct 2021 16:28:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 18:30:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b8a8476d3ff435b210bc28d4526e78eb8f6f7ed
X-Git-Newrev: 22cccbd771b859f4a127e28575b360daf36cb4f7
X-Patchwork-Hint: ignore
Message-Id: <20211003162831.3A8EB8DBFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=22cccbd771b859f4a127e28575b360daf36cb4f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to backport an ARM compilation build fix.

The optional pw-cli tool now depends on readline, so depend on it when
available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../pipewire/0001-cpu-fix-compilation-on-ARM.patch | 28 ++++++++++++++++++++++
 package/pipewire/pipewire.hash                     |  2 +-
 package/pipewire/pipewire.mk                       |  6 ++++-
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch b/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch
new file mode 100644
index 0000000000..445cab08bd
--- /dev/null
+++ b/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch
@@ -0,0 +1,28 @@
+From f8817b439433798bd7217dc4ae72197887b0fc96 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Thu, 30 Sep 2021 11:12:27 +0200
+Subject: [PATCH] cpu: fix compilation on ARM
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+f8817b439433798bd7217dc4ae72197887b0fc96]
+---
+ spa/plugins/support/cpu-arm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spa/plugins/support/cpu-arm.c b/spa/plugins/support/cpu-arm.c
+index d80b8ad87..de07ebf41 100644
+--- a/spa/plugins/support/cpu-arm.c
++++ b/spa/plugins/support/cpu-arm.c
+@@ -80,7 +80,7 @@ arm_init(struct impl *impl)
+ 	int arch;
+ 
+ 	if (!(cpuinfo = get_cpuinfo())) {
+-		spa_log_warn(impl->log, NAME " %p: Can't read cpuinfo", impl);
++		spa_log_warn(impl->log, "%p: Can't read cpuinfo", impl);
+ 		return 1;
+ 	}
+ 
+-- 
+2.25.1
+
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index a289464988..879cfa41cb 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ce7dbd71bce46c9d81c549d8c846e8f3a8a263a19bf981d141d57bd2d316e3ac  pipewire-0.3.35.tar.bz2
+sha256  f4ae272e8d3fa3ff6a6ba2a465d1f951405b08fd31bbb82c27bb7cf55e113ba1  pipewire-0.3.38.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index b88f129055..87e747e917 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.35
+PIPEWIRE_VERSION = 0.3.38
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -146,6 +146,10 @@ else
 PIPEWIRE_CONF_OPTS += -Dlibpulse=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+PIPEWIRE_DEPENDENCIES += readline
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2),y)
 PIPEWIRE_DEPENDENCIES += sdl2
 PIPEWIRE_CONF_OPTS += -Dsdl2=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
