Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EA2C04A94
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 19:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C941414B9;
	Wed,  2 Aug 2023 19:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C941414B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0gmAhsTsIu0G; Wed,  2 Aug 2023 19:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22EAB414FF;
	Wed,  2 Aug 2023 19:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22EAB414FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 584151BF84C
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47EF98204A
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47EF98204A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12sslSZcpREi for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 19:02:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57EA580B8E
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 19:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57EA580B8E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41FF4840CD; Wed,  2 Aug 2023 19:02:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 2 Aug 2023 21:01:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59ddc3a987426a1b9ad2497038c0b52d2c11ee8b
X-Git-Newrev: 3ceb8c97bcb6753740fa27a58b8e0dc00dbbbd19
X-Patchwork-Hint: ignore
Message-Id: <20230802190221.41FF4840CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: handle vconsole w/ keymap
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ceb8c97bcb6753740fa27a58b8e0dc00dbbbd19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd v254 provide a new option "default-keymap" to handle vconsole
with keymap support [1]. With this change systemd now use the "us"
keymap by default and requires keytable files and keyboard utilities
from kbd package.

The keymap support can still be disabled using -Ddefault-keymap=""
at build time.

Handle the vconsole w/ keymap support and allow to use another
keymap than "us" by default.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561206 (TestInitSystemSystemdRwNetworkd)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561203 (TestInitSystemSystemdRwIfupdownDbusbrokerDbus)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561202 (TestInitSystemSystemdRwIfupdownDbusbroker)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561201 (TestInitSystemSystemdRwIfupdown)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561199 (TestInitSystemSystemdRwFull)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561197 (TestInitSystemSystemdRoNetworkd)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561194 (TestInitSystemSystemdRoIfupdownDbusbrokerDbus)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561190 (TestInitSystemSystemdRoIfupdownDbusbroker)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561189 (TestInitSystemSystemdRoIfupdown)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561186 (TestInitSystemSystemdRoFull)

[1] https://github.com/systemd/systemd/releases/tag/v254
[2] https://github.com/systemd/systemd-stable/commit/1cd421106893c5126e33e211cf6634e9167d1762

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: don't introduce inter;ediate boolean option]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 4 +++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index bea717a456..89ce62d1d2 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -563,10 +563,19 @@ config BR2_PACKAGE_SYSTEMD_UTMP
 config BR2_PACKAGE_SYSTEMD_VCONSOLE
 	bool "enable vconsole tool"
 	default y
+	select BR2_PACKAGE_KBD if BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP != ""
 	help
 	  systemd-vconsole-setup is an early boot service that
 	  configures the virtual console font and console keymap.
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
 
+config BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP
+	string "default keymap"
+	default "us"
+	depends on BR2_PACKAGE_SYSTEMD_VCONSOLE
+	help
+	  Default keymap for the system. Leave empty to not set a
+	  default keymap.
+
 endif
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0aa1da3fb8..3ce0634594 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -348,7 +348,9 @@ SYSTEMD_CONF_OPTS += -Dutmp=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_VCONSOLE),y)
-SYSTEMD_CONF_OPTS += -Dvconsole=true
+SYSTEMD_CONF_OPTS += \
+	-Dvconsole=true \
+	-Ddefault-keymap=$(call qstrip,$(BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP))
 else
 SYSTEMD_CONF_OPTS += -Dvconsole=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
