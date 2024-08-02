Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B131C3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D806133B;
	Fri,  2 Aug 2024 21:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkA1L8QAQSfb; Fri,  2 Aug 2024 21:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07B97612FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B97612FE;
	Fri,  2 Aug 2024 21:35:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B176C1BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F18340286
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UYS_-d6827E for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CEFD400B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CEFD400B5
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:35:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3CA683C26; Fri,  2 Aug 2024 21:35:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 23:32:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cd3797e9bd103d3c02f37875fda96350863620d
X-Git-Newrev: ef35d60e1a7f74d381deee26051f78c8bde0002d
X-Patchwork-Hint: ignore
Message-Id: <20240802213533.F3CA683C26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: add option to enable clients
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef35d60e1a7f74d381deee26051f78c8bde0002d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In some cases, the clients are useless on the target, e.g. when there is
no need to adjust the gpsd daemon at runtime.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpsd/Config.in | 11 +++++++++++
 package/gpsd/gpsd.mk   |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 1b61f8c286..cbdcdb5725 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -210,6 +210,17 @@ config BR2_PACKAGE_GPSD_UBX
 	help
 	  uBlox UBX binary support
 
+config BR2_PACKAGE_GPSD_CLIENTS
+	bool "gpsd clients"
+	default y # legacy
+	help
+	  Build and install gspd client programs, like:
+	    - gpsctl
+	    - gpsdctl
+	    - gpsdecode
+	    - gpspipe
+	    - ...
+
 config BR2_PACKAGE_GPSD_PYTHON
 	bool "build Python support and modules"
 	depends on BR2_USE_WCHAR # python3
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index c57fad83c3..77c6f6c562 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -178,6 +178,12 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
+ifeq ($(BR2_PACKAGE_GPSD_CLIENTS),y)
+GPSD_SCONS_OPTS += gpsdclients=yes
+else
+GPSD_SCONS_OPTS += gpsdclients=no
+endif
+
 ifeq ($(BR2_PACKAGE_GPSD_PYTHON),y)
 GPSD_SCONS_OPTS += \
 	python=yes \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
