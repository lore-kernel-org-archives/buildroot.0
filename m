Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D9FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 11:12:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC46761073
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 11:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC46761073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75152401C9;
	Sun, 14 Nov 2021 11:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qX2-wLk9EmUp; Sun, 14 Nov 2021 11:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 923C140126;
	Sun, 14 Nov 2021 11:12:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8128C1BF2A0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 11:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68E5B401C6
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 11:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g91tvFVwub5V for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 11:12:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A2C940110
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 11:12:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so13444987wme.0
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 03:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zl2Z2EcBOU2N0r+wuP7q7uzAV64IZAigHcFoTx/1/PE=;
 b=iP8vDnovu9swfJ1d88yEY8SpAU+WJ4u89xFLgmehqMZUar8tvGCrIgKmRe+KJgIQRj
 huinN54RAWNEtEdDo8j6z9uS2rILky8m/jj4cDS8MbLeKHOHCV1/BdoEjSGNHrHLX4u5
 fcgVxyoeBNtVGzI66BPqHnbZcVQqqO3C/dwP9meF31fmlXXX1c/3MNKhJL63mfxTc/KA
 rVpibGlyhdClMM7XwaRaoRSdhCZauyBeRfRjLX1laLJvgNRQijOvd1puhgbJhV4oLmGH
 MSy1x5V7C+XopEri22yqUemAl2nWEIRuHV7KvOOj3HVvtKU2Mk/P3voVBMOE8W0qxdFz
 WttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zl2Z2EcBOU2N0r+wuP7q7uzAV64IZAigHcFoTx/1/PE=;
 b=NE8LzZ+pkmOhIdqXk2BEHVUpGZ3GO0m48idoswrtAH5sgo+mzX6/zN6JzwqhQu1Xiw
 vrEnnSCmjk9waS31s6ZWnIhH7/o8gSQvZ594DgT6eSskNrCTajdnFLuEPaKF9JUA3ZaS
 kovFj7Hmku8jbiMIyyyX2FRI/oXxJrEfGX5S+i1GmvQz1r2llTZaYaORgYdwTasv00aJ
 srsbB5tbFGq5Wg5tUMh6WwC6OdqFT3tQcVvHTPGjSERNlKON2YtbthDyqkuP7IiEq4RH
 OqiufrCA8PrH4NslQ3A+fGk4sqmzerwK6FUOn/VCdzbVV54FHQu9jEN1Nf5+0ZDT4UOR
 37qg==
X-Gm-Message-State: AOAM5310pg2OrQKT0gkwKrgQLMU96z7srrLNZEoGLvTEnwrg8vOf/Hn+
 7J7R1bpRCp+EFD5HzxPH6oNjeOwNrPk=
X-Google-Smtp-Source: ABdhPJxqwxCDJvs6l2zo8Ap4+8ULmQXsNUaLzTAl3jHbBT8S8XyNQI4rsoUwAtYt5Q+f8teFlvBRzg==
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr32402188wmq.168.1636888360494; 
 Sun, 14 Nov 2021 03:12:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id u6sm10694167wmc.29.2021.11.14.03.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 03:12:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 12:10:27 +0100
Message-Id: <20211114111027.1247718-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/libsoup: add gssapi support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsoup/libsoup.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index a8b4cf12bb..1a26714992 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -25,7 +25,6 @@ LIBSOUP_DEPENDENCIES = \
 LIBSOUP_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 LIBSOUP_CONF_OPTS = \
-	-Dgssapi=disabled \
 	-Dgtk_doc=false \
 	-Dntlm=disabled \
 	-Dsysprof=disabled \
@@ -47,6 +46,15 @@ else
 LIBSOUP_CONF_OPTS += -Dintrospection=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+LIBSOUP_CONF_OPTS += \
+	-Dgssapi=enabled \
+	-Dkrb5_config=$(STAGING_DIR)/usr/bin/krb5-config
+LIBSOUP_DEPENDENCIES += libkrb5
+else
+LIBSOUP_CONF_OPTS += -Dgssapi=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
 LIBSOUP_CONF_OPTS += -Dgnome=true
 else
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
