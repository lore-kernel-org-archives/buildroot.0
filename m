Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83467C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C2D342906;
	Fri,  7 Jan 2022 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BEFsGayObr5w; Fri,  7 Jan 2022 21:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B14D428AC;
	Fri,  7 Jan 2022 21:06:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D611B1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1B4340010
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOWJahFJJx1p for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:05:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5CCC424B3
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:05:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 26CA6826D2; Fri,  7 Jan 2022 20:59:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 22:05:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10b8d6e512de293f60ccda989d593683b6ccc263
X-Git-Newrev: ebce685e1d60b47b8fc5490a5820b79fc3a913ca
X-Patchwork-Hint: ignore
Message-Id: <20220107205949.26CA6826D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avahi: add option to
 enable/disable default services
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebce685e1d60b47b8fc5490a5820b79fc3a913ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, Avahi installs service definitions for SSH and SFTP, but
those might not be present on all systems. This commit adds an option
to control the installation of those Avahi services. Even though that
potentially breaks backward compatibility with older configuration, we
have chosen to make the option default to disable, which means that
now the SSH and SFTP avahi services are no longer installed by
default.

As there is no way to tell the Avahi package not to install the
service files in the first place, we have to manually remove them from
the target directory.

Signed-off-by: Florian Larysch <fl@n621.de>
[Thomas: make the option default to disabled, fix small formatting issues.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avahi/Config.in | 7 +++++++
 package/avahi/avahi.mk  | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 5e303d044e..95b01bfe92 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -42,6 +42,13 @@ config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 	  Enable the libdns_sd (Bonjour) compatibility library support
 	  for legacy applications.
 
+config BR2_PACKAGE_AVAHI_DEFAULT_SERVICES
+	bool "install default service definitions"
+	depends on BR2_PACKAGE_AVAHI_DAEMON
+	help
+	  Install the SSH/SFTP service definitions included with the
+	  Avahi daemon by default.
+
 endif
 
 comment "avahi needs a toolchain w/ threads"
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 9de6ebc4d2..13e2106014 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -193,4 +193,13 @@ endef
 AVAHI_POST_INSTALL_STAGING_HOOKS += AVAHI_STAGING_INSTALL_LIBDNSSD_LINK
 endif
 
+ifeq ($(BR2_PACKAGE_AVAHI_DEFAULT_SERVICES),)
+define AVAHI_REMOVE_DEFAULT_SERVICES
+	$(foreach service,ssh sftp-ssh, \
+		$(RM) -f $(TARGET_DIR)/etc/avahi/services/$(service).service
+	)
+endef
+AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_REMOVE_DEFAULT_SERVICES
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
