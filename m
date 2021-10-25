Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39305C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:02:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF19760FC2
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF19760FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E60580F4F;
	Mon, 25 Oct 2021 22:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDDdh_WvKmEv; Mon, 25 Oct 2021 22:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE80480F4A;
	Mon, 25 Oct 2021 22:01:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17CF21BF2FA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FEB1403EB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8irkHKPKXgK for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 22:01:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A9EA40158
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 22:01:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e12so15382553wra.4
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 15:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hv3QpQFegiMhUFuOUh83l8lDDUfRSLNZm3eksJFR8w=;
 b=OpMqX+E19GdGtQQ4BSOy90XzKAxx/QJjKmcYCAlWT7iMiNcBH1JeY9dRGFv8+5D8jW
 +eI2hgCkDTZKxzMMRVVSJ/f0qMuxBSH1qQjhfNg766aRyo2iqPKOigv4qk650emW6IGS
 k2acEc4zKVqgWXjwBgJaCuA+bw5kxk/ASvYdS8Zofd8eJndN47+0qIsb20MQEnlqRjd6
 I5ayao0NCteOEnoq43y1WyY7/kLdtAX9+8GPnjWYxOhGQ9qvOvxWCX1TkaLTxEjrc5rx
 1fFfJLKqGuf1rv0wlz9Sx0fVY46ykgimcBwwwP7RA0A8GP26i65a+8Q9zFqg8PPJ9qFj
 Iotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hv3QpQFegiMhUFuOUh83l8lDDUfRSLNZm3eksJFR8w=;
 b=KzDjux4GiuXFvapc6pnHZThzQ4JTBxdueOHMrgYxtpxGLR5u333N2v9c57OyfCUn9O
 Kn1AbDSh5jWo4SCiV0mu6jn746weU59zHjrCANYbYiKpxzFJ04Ti4bZpt2nHQBFpgxql
 H2ipel7W/jnIiqim+1CQzCCOfGzh8AO/0ZX0nWGEHVJ90e06/K/ExTIXSKozgqYdlNCV
 eM+PC7XCyV6xZZwdIfkwi3lZYf1csT715ADesPIAZKW0YLwHdNT+iuHcPEHjqPflWwI0
 9H0KoF+Wv4i/ItEPIORCDwzIXJ63xaRIVWGufgizMzekGoQL105GdmeYQQRRlxazbcGl
 G7pw==
X-Gm-Message-State: AOAM530cDO3x4T3tSZ48o+6U2RfNayAH4SnHwaRgm/3u6Hs1rBT10oQv
 YKFL37aGSsWZV7WVUE6BCjkr1ztqXGQ=
X-Google-Smtp-Source: ABdhPJygSksXtDMEiMKSZPfwv3gbPeENMw0LVMLsXR7kKh8+djPDZdhd35S3UKJ0yPrkKBG7iUWhFA==
X-Received: by 2002:a05:6000:8a:: with SMTP id
 m10mr26464945wrx.115.1635199315135; 
 Mon, 25 Oct 2021 15:01:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id v185sm20488039wme.35.2021.10.25.15.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:01:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 00:00:26 +0200
Message-Id: <20211025220026.3713785-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: don't override dependencies
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

Don't override APCUPSD_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apcupsd/apcupsd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 502d1b7152..80ed0b0832 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -34,7 +34,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB),y)
 APCUPSD_CONF_OPTS += --enable-modbus-usb
-APCUPSD_DEPENDENCIES = libusb libusb-compat
+APCUPSD_DEPENDENCIES += libusb libusb-compat
 else
 APCUPSD_CONF_OPTS += --disable-modbus-usb
 endif
@@ -65,7 +65,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_APCUPSD_USB),y)
 APCUPSD_CONF_OPTS += --enable-usb
-APCUPSD_DEPENDENCIES = libusb libusb-compat
+APCUPSD_DEPENDENCIES += libusb libusb-compat
 else
 APCUPSD_CONF_OPTS += --disable-usb
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
