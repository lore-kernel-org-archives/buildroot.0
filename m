Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0D9CD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 22:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF63F6078B;
	Sat, 30 Mar 2024 22:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iN9j8upunlx; Sat, 30 Mar 2024 22:11:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE11E6072C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE11E6072C;
	Sat, 30 Mar 2024 22:11:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 231281BF239
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 22:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D28A820E8
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 22:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcnU49gLZfy9 for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 22:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35EC181E7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35EC181E7B
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35EC181E7B
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 22:11:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso1834666f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 15:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711836686; x=1712441486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2i62T7LgvRaJwTzhdmClbqzeV4E87sHxuN4Fya0BrPE=;
 b=dh3/LErXc4H1z9f1uN4qfBPFb7buRKXaxVWBN82DyK8qqHmZ+t6m0V3bcXAGCQMqRv
 IMGJi8/gZq7+V0dJ+GVkZOBMCh/wdopu+f7SRsPNwUnaxJku/SkbLdvuPa6exi5Gj6jk
 WS49WzL7aeiVmOVXymzFdgPcUrjN/zPQ9WS5VTilu0i5DFV6NOyV3jlIMlMhovUowVNY
 4jCu5X6RzGda4XJiU2FpXRazynvx+W2add6V9LJ2nriUorgzDostkG8nWNPJmqlbcpdx
 RBSMd/6YAvw7Kh6g0bZo6HKmF7lv28/U942xT/iT9+1Gt/7TOiBVx7lO/FfJnt+m/m7D
 Osyg==
X-Gm-Message-State: AOJu0Yx9/uw2rnJLFVdRqK82MNDoo8L+AXxOmgY2omvIIiUNy2UBMUHb
 3/9Kyo9MoVtjhB6rBh+PYSNduOgoLThsUUBHV/6qOn8qZZfc9EShW528qjGB
X-Google-Smtp-Source: AGHT+IHAqG2qWAKZoBKE5veoL161Xa+cuu3VIkrVlKZM1LLBK84vWS89+A9Ti0T4c1ZDCRAAqKg5ng==
X-Received: by 2002:a05:6000:ca:b0:341:7295:4b8b with SMTP id
 q10-20020a05600000ca00b0034172954b8bmr7413282wrx.1.1711836686143; 
 Sat, 30 Mar 2024 15:11:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bn9-20020a056000060900b00341bdecdae3sm7499598wrb.117.2024.03.30.15.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 15:11:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 23:11:22 +0100
Message-ID: <20240330221122.1112448-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711836686; x=1712441486; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2i62T7LgvRaJwTzhdmClbqzeV4E87sHxuN4Fya0BrPE=;
 b=egwSW3T50/spT55T/CMJohJCJrhB19TwqmGkObNJdwZrwx1VpHv4Gwe+Y7JGIB2sRr
 QIkLbckzUYFFsmvi/U+gGblEn06p+pMlURlLm70PrtqYRORaGhjrNeHnwMGgGAMVaVBN
 c0FZcdKWzjoXOAK/o1AyV+7Je0Bscb9YBZoKdcwo0TVv8Skxg3G8kBTdGbvh2ai1EHxS
 A6AxAoUhDUDsVdo8HkiMsQrRrP7eTKMl+/5E6QQkImgZf4lDBvD9bnc097eqPNx2PGrT
 WWSb5XtQTeuBqOSOxNbyDc0jnDQ8jkTAedVsDeuRqUwI+w/n6Nphdzea1THCGi47IQCb
 m0Ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=egwSW3T5
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: set ac_cv_path_SHUTDOWN
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set ac_cv_path_SHUTDOWN to /sbin/shutdown to avoid the following build
failure when shutdown is not available on host raised since the addition
of the package in commit d12b63b741586b89c4017551308c43512a617287:

configure: error: Missing required tool; need any one of: shutdown shutdown.bsd

Fixes: d12b63b741586b89c4017551308c43512a617287
 - http://autobuild.buildroot.org/results/a8bbb5ced8343e08070361f260050de422144710

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apcupsd/apcupsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 97e6d6a558..43a016678d 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -11,6 +11,7 @@ APCUPSD_LICENSE_FILES = COPYING
 APCUPSD_CPE_ID_VENDOR = apcupsd
 APCUPSD_SELINUX_MODULES = apache apcupsd
 APCUPSD_CONF_OPTS = --disable-test
+APCUPSD_CONF_ENV = ac_cv_path_SHUTDOWN=/sbin/shutdown
 
 ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
 APCUPSD_CONF_ENV += ac_cv_path_usbcfg=$(STAGING_DIR)/usr/bin/libusb-config
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
