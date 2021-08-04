Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731BDC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:00:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DF9861037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DF9861037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D88BC608D0;
	Wed,  4 Aug 2021 21:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMJQiXtALYU0; Wed,  4 Aug 2021 21:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33B8360776;
	Wed,  4 Aug 2021 21:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 564881BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 532A6608C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJi-3fVv909M for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:00:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9225A6063A
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:00:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so2228439wmb.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=coOmofIFFI+8HkBVH92VUfPbcKWspyipWouDLyv+WRs=;
 b=Nc0eBZ+Z+Phcy08dhizX4LkaCZwAt9hjOUImf/uTyF8OCFy78bIEGuTFRb0ZwJ3GG6
 shw1QMkQ2nacV47FARJBW4/WNVivat2UsEVobHGxMZPGduU+UU1GvaWwHXgMM1noZwMu
 1E3ZKoUsyL3QIh9s1dOgyIG76N4oy8JPvsCHzZ6zthOAMGhkIxakeuMle3FE9415VNMz
 kkl4Xy/VoJS9D0Aro0UC4AgIjx4eIsJ+pgn8YbED8LUix0XC5g35N8pZzjQX9TRsHMhC
 pd8Hvr6AKBOp9Lsj713PU1JVR1enXLCjSie8v5tLRBa9wo9kDQcNh1YDQ5FgtlnhjGpH
 m17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=coOmofIFFI+8HkBVH92VUfPbcKWspyipWouDLyv+WRs=;
 b=SvaZuhZTt/IbBO06ZrD0N4bpwKMHocNNNs3TLM+w+yE1Ib/mDXI6pWu9CqP57wF2wX
 QkiP/uqpgLp0lYa8tREmZJink6z5ChDO+/bKVBkqE5T26RoKgL+ewuLGMDVIyknxU6IB
 iuIWGzOYRjVhdRT5F1o1BhfF8wVHUIWe+owx84uaxuIjv3qwol/DrI/YX1zSVC5OFqD4
 odEy3FcIS/AYpF9vdLeB8gSv68wuUkTaFQPBoENLYJx6ytPGFzyfQ3CftuePdHX1j0AD
 9ucJWRakkd2dy/3RUSecu1x/+Za2lXInF0fo3QZWGoM1PM9H99DxDxAHczKyzakEh7RI
 Gz6A==
X-Gm-Message-State: AOAM531c10xSQ214ZqKMNsp8iXtS3/iiJa1phCijvyhuy78iCwjaW1Ku
 fawq4hsgwkpzDuFCQcctP6zv0onoBxk41A==
X-Google-Smtp-Source: ABdhPJztfMs+aQ9qnP8ka0LdzWl4KeKyPpj2IXELCUl7Af4WN/8N00/NPFNSM1djLhy5wMBpn2qyKg==
X-Received: by 2002:a1c:7fc4:: with SMTP id a187mr1283157wmd.15.1628110806517; 
 Wed, 04 Aug 2021 14:00:06 -0700 (PDT)
Received: from kali.home (pop.92-184-97-43.mobile.abo.orange.fr.
 [92.184.97.43])
 by smtp.gmail.com with ESMTPSA id w5sm4355337wro.45.2021.08.04.14.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 14:00:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 22:59:55 +0200
Message-Id: <20210804205956.1475477-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804205956.1475477-1-fontaine.fabrice@gmail.com>
References: <20210804205956.1475477-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/shairport-sync: use without options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Use wihtout options as they have been fixed since version 3.3.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/shairport-sync/shairport-sync.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index adc584d554..ba8b44a621 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -28,14 +28,16 @@ SHAIRPORT_SYNC_CONF_ENV += LIBS="$(SHAIRPORT_SYNC_CONF_LIBS)"
 # libavahi-client.
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 SHAIRPORT_SYNC_DEPENDENCIES += avahi
-SHAIRPORT_SYNC_CONF_OPTS += --with-avahi
+SHAIRPORT_SYNC_CONF_OPTS += --with-avahi --without-tinysvcmdns
 else
-SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
+SHAIRPORT_SYNC_CONF_OPTS += --without-avahi --with-tinysvcmdns
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDAEMON),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libdaemon
 SHAIRPORT_SYNC_CONF_OPTS += --with-libdaemon
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-libdaemon
 endif
 
 # OpenSSL or mbedTLS
@@ -54,21 +56,29 @@ endif
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libsndfile
 SHAIRPORT_SYNC_CONF_OPTS += --with-convolution
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-convolution
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_DBUS),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libglib2
 SHAIRPORT_SYNC_CONF_OPTS += --with-dbus-interface --with-mpris-interface
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-dbus-interface --without-mpris-interface
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libsoxr
 SHAIRPORT_SYNC_CONF_OPTS += --with-soxr
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-soxr
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_MQTT),y)
 SHAIRPORT_SYNC_DEPENDENCIES += avahi dbus mosquitto
 SHAIRPORT_SYNC_CONF_OPTS += --with-mqtt-client
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-mqtt-client
 endif
 
 define SHAIRPORT_SYNC_INSTALL_TARGET_CMDS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
