Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C023C25B50
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 18:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE0C415C7;
	Sat, 21 Jan 2023 18:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE0C415C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMm7cJ96tupL; Sat, 21 Jan 2023 18:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C88641862;
	Sat, 21 Jan 2023 18:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C88641862
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 567271BF406
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 18:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FBBE40182
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 18:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FBBE40182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yeoAPpjSLh6C for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 18:05:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65C4240140
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 18:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C4240140
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51374870CA; Sat, 21 Jan 2023 18:05:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 19:05:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0901160666852eaea15eeac4a1905cfff94bab1
X-Git-Newrev: e6789e8b8b5f39e0efb9f4a9af492de416c121c8
X-Patchwork-Hint: ignore
Message-Id: <20230121180551.51374870CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: reenable utmp support
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6789e8b8b5f39e0efb9f4a9af492de416c121c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch provides a way to enable utmp support when using systemd,
with it disabled by default, as some security concerns may apply. Still,
there are cases where having utmp is desirable, even though it is rare,
so let's make this configurable.

See commit 32f53bdfb482d0d78308e548c654898089b5c183.

Signed-off-by: Casey Reeves <casey@xogium.me>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/Config.in  | 20 ++++++++++++++++++++
 package/systemd/systemd.mk |  9 +++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 45a9e2d644..33ac03e584 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -518,6 +518,26 @@ config BR2_PACKAGE_SYSTEMD_USERDB
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-userdbd.service.html
 
+config BR2_PACKAGE_SYSTEMD_UTMP
+	bool "enable utmp support"
+	help
+	  systemd-update-utmp-runlevel.service is a service that writes
+	  SysV runlevel changes to utmp and wtmp, as well as the audit
+	  logs, as they occur.  systemd-update-utmp.service does the
+	  same for system reboots and shutdown requests.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-update-utmp.service.html
+
+	  Utmp keeps track of what users do on the system (where they
+	  logged from, on which terminal, ...) along with a general
+	  status of the system (list of reboots, current uptime, current
+	  number of users logged in).
+
+	  You should only enable this if your system will have actual
+	  users who log in.
+
+	  https://man7.org/linux/man-pages/man5/utmp.5.html
+
 config BR2_PACKAGE_SYSTEMD_VCONSOLE
 	bool "enable vconsole tool"
 	default y
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b96873b73f..f191542866 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -87,8 +87,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dtelinit-path= \
 	-Dtests=false \
 	-Dtmpfiles=true \
-	-Dumount-path=/usr/bin/umount \
-	-Dutmp=false
+	-Dumount-path=/usr/bin/umount
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_OPTIMIZE_FAST),y)
@@ -331,6 +330,12 @@ else
 SYSTEMD_CONF_OPTS += -Dbinfmt=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_UTMP),y)
+SYSTEMD_CONF_OPTS += -Dutmp=true
+else
+SYSTEMD_CONF_OPTS += -Dutmp=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_VCONSOLE),y)
 SYSTEMD_CONF_OPTS += -Dvconsole=true
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
