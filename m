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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151CDC4320A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:44:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA3F61040
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEA3F61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94D5B40164;
	Wed,  4 Aug 2021 20:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VO-uoGlxEHb3; Wed,  4 Aug 2021 20:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E026400D9;
	Wed,  4 Aug 2021 20:44:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3C81BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3683C6073B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TWdz_U1PiT84 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:44:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2B8960705
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:44:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c16so3608757wrp.13
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GJ07uScIOwau8Qcx3gTOB5CfWOwiapPPixLPNAuOG4I=;
 b=TeHTKR1OZXeho7nynwJpPBRqzafRikyxTpi2yRT6zM34rWEkYyqfqXBhylORwbYcdS
 p8Ur7dOgFrfK+cwGIvHtZq76zZbykExTeXbr2DXItIXXNbxJb5CTfWBlrheHIavR5gH1
 B8dDCVTU2U6tDqqA4OJqrbsjlqc2ySBC1HsjZowqM40hgbmzODFOsfCsqRgJENpYpxIl
 dZNsmtG469M7mAD4CyLJ4etMbq70Fn9pwvpacw3kc36ipD9eBHcB4VLrtBMsr2DWRUju
 GIzxh2ogN7NQP6LtncjGN+7ALSlkRQbBdRVGHvPWhz2hBL+wDHy2D5uIHwnJTq5+JuMN
 nhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GJ07uScIOwau8Qcx3gTOB5CfWOwiapPPixLPNAuOG4I=;
 b=bgGlNPtIvJlbU37ednxBVQS6Us/YJQx6YpN+oMVr1mhW2muvhllhPWiZMj6U17pY4/
 T0u1W583JgjPC3hbxdNqa7ef3HdC/I9irpjqByj9uHAWxiujTCKAQBTDC3bz4q7GnvLb
 lzJ14iYC16zQohTipZmi2No+CB9nDi0hGRw8I15fw5f5ezyHKAMdprdvBuexILZJTHX+
 ZhLaeAioKzETv/0ZHmspo1XrmKISMhJkOu2zEK1pFY+MoM/tSX4FkEc9QiX7W1ogZ2ha
 ky0QNFsjAd8nEsviJCYpS6k7FUDrZqEFgP9P8LAbZ8oNjK57DiP62RXHqHaCEcTEm1Yc
 MRNQ==
X-Gm-Message-State: AOAM533oEXL5jRPlOSlzzn38WuQ0n2qkCftp6zhIpDTLWhBxZ80d7Rm6
 ngGy9kPhoScFJpvsWNilk/7S6LrFSfdbnw==
X-Google-Smtp-Source: ABdhPJwAf4k/M+/fyKVv7rx2tOgf7uvlaoQawYia32GKgXx4CwKaZlo5/1KfiEBTdmnmKbX0C7+J1w==
X-Received: by 2002:adf:e652:: with SMTP id b18mr1175046wrn.349.1628109848427; 
 Wed, 04 Aug 2021 13:44:08 -0700 (PDT)
Received: from kali.home (pop.92-184-97-43.mobile.abo.orange.fr.
 [92.184.97.43])
 by smtp.gmail.com with ESMTPSA id s14sm3251437wmc.25.2021.08.04.13.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:44:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 22:43:58 +0200
Message-Id: <20210804204358.1465897-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libqmi: add gobject-introspection
 optional dependency
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

gobject-introspection is an optional dependency (enabled by default)
since version 1.26.0 and
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/commit/2aa0badc79595c92981793d18f05c99485156a6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libqmi/libqmi.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 35a41e5bd0..7b1d76a0c1 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -16,6 +16,13 @@ LIBQMI_DEPENDENCIES = libglib2
 
 LIBQMI_CONF_OPTS = --disable-Werror
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBQMI_DEPENDENCIES += gobject-introspection
+LIBQMI_CONF_OPTS += --enable-introspection
+else
+LIBQMI_CONF_OPTS += --disable-introspection
+endif
+
 # if libgudev available, request udev support for a better
 # qmi-firmware-update experience
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
