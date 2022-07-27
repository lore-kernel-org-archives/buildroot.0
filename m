Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C24C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE7D74028D;
	Wed, 27 Jul 2022 10:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE7D74028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nqd0ezurDhdg; Wed, 27 Jul 2022 10:19:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E80BF4049F;
	Wed, 27 Jul 2022 10:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E80BF4049F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF3511BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7A6081801
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7A6081801
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rR35C0734zNx for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:19:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE297817B3
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE297817B3
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:19:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i8so568265wro.11
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 03:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JpQHzZHRQjt8r4uJd7vz8qICdwfFj7uEKDVTyLDnYwc=;
 b=rjuP480y9bpuU/qAbMV9k9/533SdFH5j6f1z+6zSt2+MTQu4zgRth/93wptwE9HhK6
 hzxt70YTwNuoeQxDm9ZpumW7nC8B2hUk4JT0przj6VxqcY9fBs5MxFdQPWJUBAukgdg8
 xVs17ZAV1dq3vCbg8XD9/21cVMLFtw6nUZKNqFZoobQsaGA9xysmj2at8L1COpFVA7vL
 4wSZ0iLSHaNEvjPCKZ6RvFMwpznsAtfjzRj+kzzqZSAJOA6/cCvbjOAonPqRQ0sO1EwO
 dsMOgd5sHRjnoARxZ2YZ8O1MUGfM7Jen0MJi/3OUb4yVAEZDB38ChNM53fffdradXPWZ
 xaPw==
X-Gm-Message-State: AJIora8rbw8Vy+yFTfjwPMOel33glckAGEbrHqd/Zh9cspsdUGXn/d4B
 Bos8eqRk5VdWu163JGPtktFlPyh0AUc=
X-Google-Smtp-Source: AGRyM1trQ3SyxMa9eAbss2UTWyK15ma63W6MOh3hUFkT+LmB+h7qFC4c2zddrwa9VfHcgh/0hF/Ccw==
X-Received: by 2002:adf:f0c6:0:b0:21e:4480:2fa5 with SMTP id
 x6-20020adff0c6000000b0021e44802fa5mr13957091wro.377.1658917147778; 
 Wed, 27 Jul 2022 03:19:07 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a5d6e54000000b0021d65e9d449sm16383875wrz.73.2022.07.27.03.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 03:19:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:19:02 +0200
Message-Id: <20220727101902.1087257-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JpQHzZHRQjt8r4uJd7vz8qICdwfFj7uEKDVTyLDnYwc=;
 b=lPV67S5yLDeqBBK9ZTaCKB3YEATcgF9mSnkltDmNA2YeQa/mqOkjHcvbNpKMz1YC8X
 GCwOgW/H1qFrpxGxc7KWA0ahXoIZzWPjREWggnciY2/eN9+6bZuIhaKONtxWLY2/wfgY
 8kdMOjyvBvngCdW24iss0PXKQTfP8qmRK4whVYDiMziP5ltZwZMHPIyR2o8E/Qf8fGOv
 BZpyoEpDyusL5ExDloWoXaARx92jCtCyFw/p+gRSCzObQwqht+k1iMLjCWPQ0N4ABha4
 kiYfGz9/3B04nkhObK+AFI/mvj7wIsZDg3hf1WhamRmhC9xiXfUTy7jAS/i0mAioL0c5
 7JEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lPV67S5y
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: improve dependency
 handling
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use explicit options
- speex is optional, not mandatory
- lirc-tools and valgrind are optional dependencies (enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseaudio/Config.in     |  1 -
 package/pulseaudio/pulseaudio.mk | 65 ++++++++++++++++++++++++++++----
 2 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 0fcd7b16eb..337a64bf1d 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -22,7 +22,6 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_PULSEAUDIO_ENABLE_ATOMIC
-	select BR2_PACKAGE_SPEEX
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 5f6981ba0d..7b2d362316 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -20,16 +20,32 @@ PULSEAUDIO_CONF_OPTS = \
 	-Dtests=false
 
 PULSEAUDIO_DEPENDENCIES = \
-	host-pkgconf libtool libsndfile speex libglib2 \
-	$(TARGET_NLS_DEPENDENCIES) \
-	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
-	$(if $(BR2_PACKAGE_DBUS),dbus) \
-	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_FFTW_SINGLE),fftw-single) \
-	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
+	host-pkgconf libtool libsndfile libglib2 \
+	$(TARGET_NLS_DEPENDENCIES)
 
 PULSEAUDIO_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+PULSEAUDIO_CONF_OPTS += -Davahi=enabled
+PULSEAUDIO_DEPENDENCIES += avahi
+else
+PULSEAUDIO_CONF_OPTS += -Davahi=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+PULSEAUDIO_CONF_OPTS += -Ddbus=enabled
+PULSEAUDIO_DEPENDENCIES += dbus
+else
+PULSEAUDIO_CONF_OPTS += -Ddbus=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
+PULSEAUDIO_CONF_OPTS += -Dfftw=enabled
+PULSEAUDIO_DEPENDENCIES += fftw-single
+else
+PULSEAUDIO_CONF_OPTS += -Dfftw=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 PULSEAUDIO_CONF_OPTS += -Dsamplerate=enabled
 PULSEAUDIO_DEPENDENCIES += libsamplerate
@@ -58,6 +74,20 @@ PULSEAUDIO_CFLAGS = $(TARGET_CFLAGS) -DAO_NO_SPARC_V9
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
+PULSEAUDIO_DEPENDENCIES += lirc-tools
+PULSEAUDIO_CONF_OPTS += -Dlirc=enabled
+else
+PULSEAUDIO_CONF_OPTS += -Dlirc=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PULSEAUDIO_CONF_OPTS += -Dopenssl=enabled
+PULSEAUDIO_DEPENDENCIES += openssl
+else
+PULSEAUDIO_CONF_OPTS += -Dopenssl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 PULSEAUDIO_DEPENDENCIES += orc
 PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/bin/orcc
@@ -132,6 +162,27 @@ else
 PULSEAUDIO_CONF_OPTS += -Dx11=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+PULSEAUDIO_CONF_OPTS += -Dspeex=enabled
+PULSEAUDIO_DEPENDENCIES += speex
+else
+PULSEAUDIO_CONF_OPTS += -Dspeex=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PULSEAUDIO_CONF_OPTS += -Dsystemd=enabled
+PULSEAUDIO_DEPENDENCIES += systemd
+else
+PULSEAUDIO_CONF_OPTS += -Dsystemd=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+PULSEAUDIO_CONF_OPTS += -Dvalgrind=enabled
+PULSEAUDIO_DEPENDENCIES += valgrind
+else
+PULSEAUDIO_CONF_OPTS += -Dvalgrind=disabled
+endif
+
 # ConsoleKit module init failure breaks user daemon startup
 define PULSEAUDIO_REMOVE_CONSOLE_KIT
 	rm -f $(TARGET_DIR)/usr/lib/pulse-$(PULSEAUDIO_VERSION)/modules/module-console-kit.so
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
