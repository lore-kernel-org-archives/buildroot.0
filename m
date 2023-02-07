Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D3CC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D3DD417FB;
	Tue,  7 Feb 2023 21:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D3DD417FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Hs-GHAl_h0x; Tue,  7 Feb 2023 21:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48CD2417AA;
	Tue,  7 Feb 2023 21:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48CD2417AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E972F1BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9011761060
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9011761060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVj_Brqsl9NB for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AC9E6105A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC9E6105A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76969843AA; Tue,  7 Feb 2023 21:51:54 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 22:51:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2c823d1f548d5a0120d27d6c000603192360f7b
X-Git-Newrev: 545f8c4b5a4f95e204f31ecb496ae93aa91fcd86
X-Patchwork-Hint: ignore
Message-Id: <20230207215154.76969843AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: Add config option for
 sysupdate feature
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

commit: https://git.buildroot.net/buildroot/commit/?id=545f8c4b5a4f95e204f31ecb496ae93aa91fcd86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support the new feature added with v251,
requires openssl.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/systemd/Config.in  | 16 ++++++++++++++++
 package/systemd/systemd.mk |  7 ++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 0d4147840d..9f4d933779 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -481,6 +481,22 @@ config BR2_PACKAGE_SYSTEMD_SYSEXT
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
 
+config BR2_PACKAGE_SYSTEMD_SYSUPDATE
+	bool "enable sysupdate support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	  systemd-sysupdate atomically updates the host OS, container
+	  images, portable service images or other sources, based on
+	  the transfer configuration files described in sysupdate.d.
+
+	  Note that the bootloader must be configured specifically to
+	  support the A/B update mechanism defined by sysupdate. Only
+	  systemd-boot does this out of the box.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-sysupdate.html
+
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a38eeba1a8..6536a2740d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -91,7 +91,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
-	-Dsysupdate=false \
 	-Dsysvinit-path= \
 	-Dsysvrcnd-path= \
 	-Dtelinit-path= \
@@ -494,6 +493,12 @@ else
 SYSTEMD_CONF_OPTS += -Dsysext=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
+SYSTEMD_CONF_OPTS += -Dsysupdate=true
+else
+SYSTEMD_CONF_OPTS += -Dsysupdate=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
