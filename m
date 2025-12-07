Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD84AD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 22:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23079406BB;
	Sun,  7 Dec 2025 22:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foaXAGN39sQ7; Sun,  7 Dec 2025 22:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F28040551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765146381;
	bh=rygu4sBsaE3V5QSfonkuTzYILE4PDsmRU1HAAeI/c/0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Acu2jyHfkoptRIoq/7JJ6av1gqzp9C39Z9XLC6E1jGnEp5FpI+8Ak+QF1QK/3GSs4
	 EFZXBHiUTcRl3EngSqirUlYkC+3ogpZsKQtBdKFqP+6Mw0OWTiJ6oNYrIkBA7jvYhT
	 ruIegmFr5/xF7LWVpCI8f7S7uaAvOcPPSBFRVR1Nx+zBohmUVAyDjsBl9RQZlx9SbI
	 839C1cnQ6kvdMaoLK6siW45ETgW8Y6aMrmBkayXsIEYP960k92zjrg6NsBaj5GOhwJ
	 Yz/oetfK27my2JipwDJp4q6riw4WZz+hv45j0GU1Sc5AG9E6mqt68ibeU69b8hnQee
	 7jT9i+lPgUnQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F28040551;
	Sun,  7 Dec 2025 22:26:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE2DAE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA5A560B14
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_gMICRorFhn for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 22:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 406F860A4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 406F860A4D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 406F860A4D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:26:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.102.30]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fMe-1vQhBd0wDC-00Evlm; Sun, 07
 Dec 2025 23:26:15 +0100
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun,  7 Dec 2025 23:26:04 +0100
Message-ID: <20251207222604.764118-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:GHzQK0i4d88oYpeem/m5UwFEl2y3bml3kPTndRQbMm+p4J11FRU
 hoO6TWecQNcsB9Vf4ThUhGtHgnMiC9/5EQP0YnupjTTwN/P3SmuLXDjgPEzOrw/9n70umeU
 qPIeYTUm1eiuVRZ+YIybOZFgX6aPyBfABnNeGu04wzHoyfuFsir8nM4WS13qwQ8miOynTXF
 OBKeuZldgH7d7MXdAu65w==
UI-OutboundReport: notjunk:1;M01:P0:P0uwCmFCQ8s=;jYhKH7X6ureObmPdV0qVovND1xO
 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
 T8q94g4FkxEW89UszmdL
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1765146375; x=1765751175; i=fiona.klute@gmx.de;
 bh=/A0FgcrZ22KbToZBC2Y7HxW58Dw5W+djKoIFQsdw1AE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tSvIa4/ahCBvtFwlytx2rauwsdiTiQe6LefG+RBB05xnSklac7QAIIhH01+hkeyj
 wSGR/C2bcOtIUCoos11SKwhXmN9y9IP6OtPyFHYNNIvQDB5knPnjOI1jV6/XLRZfc
 /O7Be+esIEXJpUdEo/5kslnwMxn0/Ec4N2zYLpGsLnHDXMLSW214gRX/Rk6hoh172
 6Cqi40qWiFla33+appIgjxYMrkSzOyLLhFCqUPud17/8N9BxLlgmMZek2coLqexfT
 mrFBRQeK/8g0A+apIy6nEBfq8pvYuUUm0apKdg8SKxc2jGFwbZKW222k96Cap6ic0
 0u075cUDymG0LYNU1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=tSvIa4/a
Subject: [Buildroot] [RFC PATCH 1/1] package/apache: use "Debian" filesystem
 layout to fix read-only rootfs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous configuration placed both logs and PID file in /var/logs,
which is not writable with a read-only rootfs (e.g. squashfs), as well
as non-standard. An additional issue was that the Buildroot-default
--prefix=/usr override meant various Apache-internal directories
(e.g. htdocs) were placed directly in /usr.

Using the "Debian" layout provides a standard-compatible layout with
logs in /var/log/apache2 and PID file in /var/run/apache2 (both in
tmpfs with the default Buildroot fstab). Both directories need to
exist when the server starts, so handle that in the init script.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I'm sending this as RFC because the "right" filesystem layout is
certainly debatable. As is the changes allow the server to start with
a read-only rootfs without adjusting its configuration, and get
Apache-internal directories out of /usr. Please note that the upstream
default prefix is /usr/local/apache2, not /usr/local.

The "layout" values are defined in config.layout in the package source
(or see https://svn.apache.org/repos/asf/httpd/httpd/trunk/config.layout),
adding a Buildroot one would also be an option. Unfortunately I don't
see a way to override the directories for logs and PID file
independently on the ./configure command line.

 package/apache/S50apache      |  2 ++
 package/apache/apache.mk      | 12 +++++++-----
 package/apache/apache.service |  1 +
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/apache/S50apache b/package/apache/S50apache
index 71e8837bae..fd1c58312f 100644
--- a/package/apache/S50apache
+++ b/package/apache/S50apache
@@ -2,6 +2,8 @@
 # shellcheck disable=SC2034 # checkpackage-required variable
 DAEMON="apache"
 
+mkdir -p "/var/log/apache2" "/var/run/apache2"
+
 case "$1" in
 	start|restart|graceful|graceful-stop|stop)
 		apachectl -k "$1"
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 3b1574cb78..983f55af93 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -43,7 +43,9 @@ APACHE_CONF_OPTS = \
 	--without-suexec-bin \
 	--enable-mods-shared=all \
 	--with-mpm=$(APACHE_MPM) \
-	--disable-luajit
+	--disable-luajit \
+	--enable-layout=Debian \
+	--prefix=/
 
 ifeq ($(BR2_PACKAGE_BROTLI),y)
 APACHE_CONF_OPTS += --enable-brotli
@@ -111,14 +113,14 @@ endif
 
 define APACHE_FIX_STAGING_APACHE_CONFIG
 	$(SED) 's%"/usr/bin"%"$(STAGING_DIR)/usr/bin"%' $(STAGING_DIR)/usr/bin/apxs
-	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
-	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
-	$(SED) 's%^sbindir =.*%sbindir = $(STAGING_DIR)/usr/bin%' $(STAGING_DIR)/usr/build/config_vars.mk
+	$(SED) 's%/usr/share/apache2/build%$(STAGING_DIR)/usr/share/apache2/build%' $(STAGING_DIR)/usr/bin/apxs
+	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/%' $(STAGING_DIR)/usr/share/apache2/build/config_vars.mk
+	$(SED) 's%^sbindir =.*%sbindir = $(STAGING_DIR)/usr/sbin%' $(STAGING_DIR)/usr/share/apache2/build/config_vars.mk
 endef
 APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
 
 define APACHE_CLEANUP_TARGET
-	$(RM) -rf $(TARGET_DIR)/usr/manual $(TARGET_DIR)/usr/build
+	$(RM) -rf $(TARGET_DIR)/usr/share/apache2/default-site/htdocs/manual $(TARGET_DIR)/usr/share/apache2/build
 endef
 APACHE_POST_INSTALL_TARGET_HOOKS += APACHE_CLEANUP_TARGET
 
diff --git a/package/apache/apache.service b/package/apache/apache.service
index b8747e2658..561e4e2851 100644
--- a/package/apache/apache.service
+++ b/package/apache/apache.service
@@ -4,6 +4,7 @@ After=network.target
 
 [Service]
 Type=forking
+ExecStartPre=/bin/mkdir -p /var/log/apache2 /var/run/apache2
 ExecStart=/usr/bin/apachectl start
 ExecReload=/usr/bin/apachectl graceful
 ExecStop=/usr/bin/apachectl stop
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
