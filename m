Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97191C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48DAF612DF;
	Tue, 21 Feb 2023 01:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48DAF612DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ptv8DuNZFqV2; Tue, 21 Feb 2023 01:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FA4B61B25;
	Tue, 21 Feb 2023 01:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FA4B61B25
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F27E01BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A20FC6FBBF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20FC6FBBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mAJG5JDlWnP9 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4ABB6FB8C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4ABB6FB8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9F24828C8; Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 19:05:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f0901160666852eaea15eeac4a1905cfff94bab1
X-Git-Newrev: e6789e8b8b5f39e0efb9f4a9af492de416c121c8
X-Patchwork-Hint: ignore
Message-Id: <20230220205239.A9F24828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/systemd: reenable utmp
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6789e8b8b5f39e0efb9f4a9af492de416c121c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
