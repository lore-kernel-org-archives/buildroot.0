Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E291EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBDB481BF5;
	Sun, 16 Jul 2023 06:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBDB481BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvBYa73Ql-YX; Sun, 16 Jul 2023 06:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0571281B69;
	Sun, 16 Jul 2023 06:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0571281B69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E41B1BF8B4
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13DC460B27
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13DC460B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 32yaahCZM2bs for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 209B060B12
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 209B060B12
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1191F87034; Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:15:12 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 0067ab06a30ab5ba2cf417cb41382bace61ff93a
X-Git-Newrev: 9153c6283bc84cb3f64688469a0e5b718516cdeb
X-Patchwork-Hint: ignore
Message-Id: <20230716062109.1191F87034@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/alsa-plugins: fix
 dependencies for the alsa plugin package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9153c6283bc84cb3f64688469a0e5b718516cdeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

The alsa-utils will remove and create the /usr/share/alsa dir
as a whole and since the alsa plugins needs to add config into
this same directory it should come after those install steps.

Also, the bluez alsa needs the plugins installed to find them
during the configuration phases - so, interlock the plugins
when configured.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 3223a34ee546ca1e15d022cf0ae6253187a79af9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-plugins/alsa-plugins.mk | 4 ++++
 package/bluez-alsa/bluez-alsa.mk     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
index 5728ebfe37..d23a81c5ee 100644
--- a/package/alsa-plugins/alsa-plugins.mk
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -20,6 +20,10 @@ ALSA_PLUGINS_CONF_OPTS = \
 	--disable-maemo-resource-manager \
 	--with-speex=no
 
+ifeq ($(BR2_PACKAGE_ALSA_UTILS),y)
+ALSA_PLUGINS_DEPENDENCIES += alsa-utils
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 ALSA_PLUGINS_CONF_OPTS += --enable-samplerate
 ALSA_PLUGINS_DEPENDENCIES += libsamplerate
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index 83dfce6177..649810b0ad 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -20,6 +20,10 @@ BLUEZ_ALSA_CONF_OPTS = \
 	--with-alsaplugindir=/usr/lib/alsa-lib \
 	--with-alsaconfdir=/etc/alsa/conf.d
 
+ifeq ($(BR2_PACKAGE_ALSA_PLUGINS),y)
+BLUEZ_ALSA_DEPENDENCIES += alsa-plugins
+endif
+
 ifeq ($(BR2_PACKAGE_FDK_AAC),y)
 BLUEZ_ALSA_DEPENDENCIES += fdk-aac
 BLUEZ_ALSA_CONF_OPTS += --enable-aac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
