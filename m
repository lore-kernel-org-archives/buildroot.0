Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01E5CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74C03807B1;
	Mon, 28 Sep 2026 11:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LW0OqtBgglbV; Mon, 28 Sep 2026 11:39:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 698F08096A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790595593;
	b=VLJfj0d+vX2RT5Cj3HudA2iJUh+ZzFiHyTWAibfpNqTrfasQze5UZtPowgMd30685pVo
	 GTZ2I/iWwSo2BzSbnYQhhKuD39EJ78Jkh0YLpv/jz1WIzhATlwwlAaW4aMyP1sVM7U+TX
	 h+H4kcJVSiTh05XZ216jRkNt1NTN89CGGJcXsG2QSY99W+rz1IHOovgsX22JrJfY0Dcj/
	 CH07xHGOtimc1vjHqFB+JzUzF9Nne3O1jztcklk4JorHupMbnryzxJj+eXhe4RxkWz8OM
	 4geQ+RUzyjXrFE6Gmmsf/oe0iSdSbpneX6JnbzMz3wkyWwrDZfGiRErj3bYB/XXPK6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790595593;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xsncFBY7pjMh1lwm0F/fHlV2229jTPHCi9L9NNhw3VQ=;
	b=Yj/gBV0+ijeAzHs3TnmQq1na2/Vjg5ln9wepcNIrajdhDQcbyuhMDY1y760g1p8h3vb7
	 V5G4U8HHzOz8v+5VE3Gy95eC6l/PX0KzJ36EC8rQm065NtMlI38RpsHiaQL3UwfHttpXg
	 oWwG6mYPYNT43+n3WjspxfLoFD2ORxpCUKBA9qJFMOZHjz837530bW0bW24TAummMbyQh
	 0Sy0oVb/FaTA/hmoctzjGYjZxH51AhE/JM+o9ymk+ZCmMj+zFe5bnJ4ssATWieeOdMyrS
	 USuSZnRdG7rK30Hzxo60/ujCCWOKqGByofAnxTmMvUoBrZJpd6ySlJfCBn0Mlca80ew==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790595593;
	bh=xsncFBY7pjMh1lwm0F/fHlV2229jTPHCi9L9NNhw3VQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ZuVFtCWk2EbGwT2Y2zo8BuFw1mCqr0A6bZevfwDrzqKvLSbbc0JdlUtGX94AGOoNK
	 SoRnBHoDO1SSlZM6PF/eEmy2Av8DMHsamYdIM3NRiHkbWlrOVgftPZB/eo3/sHKIUA
	 S0TN/2RRsNdNkEKq3DEQKN043DTVLT6nAAnhMEPIDuMbAmjVZj08kb+d7yzv/+VbJH
	 RO4nM6o97POCdmCStwPk+ufDxtrhHCEvRheUqrkzhsU7+JnW7eoqqlDk1fYw3kGVXq
	 RNnrabaV+zjrFYOGHEfUeR1Ep0RHXvE/gbeHslAn/k57S20cWhIvp1TwDcwyF2jxtF
	 eOYZlshDWB/gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 698F08096A;
	Mon, 28 Sep 2026 11:39:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB6BD32F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C194A40565
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0XcX_oJ168k for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:39:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 972F740550
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790595591;
 b=kkpZ2C16h8FWnS/deZNmXCHVA4GXFy3lLvT1euCnFxu+IzRsoEnBxsi3tyLCofyjqBsx
 E+7tyEA9EpXySazf+L468I+vpTCW4lkCsR0iAaWBz6nuYcKPlAuggQVbKVLarWiQA/7I0
 g7S4suEtof7lCbfNbCcTEi8w/3BXp6m6LUdQ6fn/2IUolPiDlX3u0lljfzbbXg9MzWo+G
 nXF3WL77BPmTmWdYA+I3ZXy/MXIaebYSUiHmyi/B7e8tCPz1jHztKKGiButg2lbDCXG/c
 R18AtVh4xC0mVIaRaa4UhNd6GcwapD/LSxZgIIJfjUaZ25yqwsCp+1ZfvJyQnXGhRsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790595591;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=O93E6wlqwLyTrip9XRkQ0lpzkar0tWz18rjj+8YxsHw=;
 b=ah9/ksuRSvgdkyV47QfNT7UUlwazLYA/qRUCRKlZo6ojDWu+PITxGaTH9mKG9N+EJXC+
 sc8raBsIKi9S+eqx6/0kN4hqcmisIeuzDsotQHpT/AVJzVjTQd/uB3Kui1NbfMHKXfm1Z
 7GP6yjvsRQ+mhTv528cEn3dOM8aG6RQNYFbOGfCNeFMVxyHsf5nxrtD7hf4IT5P1mrkl6
 hLxBeTkuhnxfFMQkQx3UJakPC3LGc0HlQvhO26AMAjwg8fLajJFDQyz6MauGAoe91yk4a
 79/ilgK7ST/7kfiMgktLZL+xs5aUESSq7CXlDcZiW5B+UKLyhj9lO2oHERbE45xwIbg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=d0WjI23b; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:34::e;
 helo=mail-ej2-x0e.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ej2-x0e.google.com (mail-ej2-x0e.google.com
 [IPv6:2a00:1450:4864:34::e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 972F740550
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:39:49 +0000 (UTC)
Received: by mail-ej2-x0e.google.com with SMTP id
 a640c23a62f3a-c2dc50c6eccso156587066b.0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 04:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790595588; x=1791200388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O93E6wlqwLyTrip9XRkQ0lpzkar0tWz18rjj+8YxsHw=;
 b=NuWBaur1SjupPGEEkekt+l0j9CgiMQDmOHYp/Kaw53zRV07PhY2w8UACGRVGDCM/Rn
 m2KiJYZ8v+bYKeUfcFgNoGjBHraL7amP+HKMByLyL0aIpfyKWh5VcONSCL1vN1EQmyvi
 VUeBTzhue3XP3BK1PAY5J+pL5GYZctH+SRB0uSDlojb/74T7P/0Yrwy57FQFQ/VDOoyq
 eyZoTw4iERg5miF21fDRoz2hm5mCJpqur55aQZfS5dnPMnReJepNEIWg+z+BWFC3I1Zy
 VLZq/lqjQ8mISdVaIIgv+JyQydrcIULXoPCl+4KaUngq8i0XECZyWlJgCaSuj/xpgDxq
 88gA==
X-Gm-Message-State: AFuF++n/Uw8SSgo7ZzZfyEd9Oh99tRfPvk5YwqK3XlJqspbaycER6wHO
 pmlw/sfvJDmvtMlTPhizLYu4iskiWJMelkSQHOWHncxSvul6OQQIExTMqSrAwQ==
X-Gm-Gg: AYBFou20J9PgNsoKMugsJABWcQ7OePlB3Ymd8xz6bL4f8Z81rC7eRNYbBBH5SBMT8Mf
 ZrFHFm8vaZSKBwV+eX8icFiv9AnkvWuON0RBFlsi4cs3ThSNKcT0GuaKmLry9t1PuFsvoKKh9sE
 6yKuy9u8HtMFLmaJfnwvICDj6y7yEGiqbBM3cFmMkaRRH1viK59JK9TGHJFh22qa1An7F5N9Zph
 Tf/TDAgDIFJteXY9eTA6gB31EnrKv8684AHvSCWAmO/Np2685jpRP3QjPTLZ4G+mq4GEL0IWucM
 BkA7tStoiBYv0eXtSKXg0BAOXJmuVi80bszenP9KvMvAzRRyxywPHBln4AVmHxLuavaUXqXeCds
 9QwMbpEBrvbvX3VIfylMj13R75cqLnDE0VSxrq6T4nUQM+DWKfi6opvgrwvfsQ9hTBVtZTxZD8t
 CJAFN6J/20azwRe3TOG5tUlbBrNeoG3qJaqCuE6GQL5z1HLuw/PViQHWbsH/arBiEK4qtiSWHF6
 RPEenIVgeLwtn3X13Y+bIaTyTQMCepPE2Af16WXgcsoiSo=
X-Received: by 2002:a17:907:cd09:b0:c29:512a:4668 with SMTP id
 a640c23a62f3a-c2ac24c1434mr1065118466b.27.1790595587550; 
 Mon, 28 Sep 2026 04:39:47 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2dbfde3194sm257286666b.4.2026.09.28.04.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 04:39:47 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 13:39:43 +0200
Message-Id: <20260928113943.1418780-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pcsc-lite: bump version to 2.5.2
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Autotools support was removed upstream in 2.5.0, so switch to the meson
build system:
- the tarball is now only provided as .tar.xz
- --disable-strict has no meson equivalent and is dropped
- there is no debugatr option anymore, so define ATR_DEBUG via CFLAGS
- pass -latomic via LDFLAGS instead of LIBS
- meson installs the systemd units into the user unit directory by
  default, so pass -Dsystemdunit=system to keep them in the system
  unit directory as before

Since 2.4.0, pcscd.service runs pcscd as the unprivileged pcscd user,
so add it to the users table.

COPYING hash changed because doc/example/pcsc_demo.c was removed from
the list of GPL-3.0+ files; Buildroot already listed it as
BSD-3-Clause.

https://github.com/LudovicRousseau/PCSC/blob/2.5.2/ChangeLog

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 package/pcsc-lite/pcsc-lite.hash |  4 ++--
 package/pcsc-lite/pcsc-lite.mk   | 34 +++++++++++++++++++-------------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 806792faee..eab6397438 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  85cab61cc744c81e2bc432656863293b8428d0136f079e3b12a84b335b5b35aa  pcsc-lite-2.1.0.tar.bz2
-sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
+sha256  60a08942d8c00a1d86a3bf4c64eddbf7a5569c7c54f6904e3f07801bb5316acd  pcsc-lite-2.5.2.tar.xz
+sha256  7dffe53fb02dd12a3518335d9c948484ee91ca098f1fac2ee9f9af639bbde7c9  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 8418d6a32a..a3a8fff323 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,56 +4,62 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 2.1.0
-PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
+PCSC_LITE_VERSION = 2.5.2
+PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.xz
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf host-flex
 PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (spy, tests), ISC (simclist)
 PCSC_LITE_LICENSE_FILES = COPYING GPL-3.0.txt
 PCSC_LITE_SELINUX_MODULES = pcscd
-PCSC_LITE_CONF_OPTS = --disable-strict
+PCSC_LITE_CONF_OPTS = -Dsystemdunit=system
 
 # - libudev and libusb are optional
 # - libudev and libusb can't be used together
 # - libudev has a priority over libusb
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-PCSC_LITE_CONF_OPTS += --enable-libudev --disable-libusb
+PCSC_LITE_CONF_OPTS += -Dlibudev=true -Dlibusb=false
 PCSC_LITE_DEPENDENCIES += udev
 else
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
-PCSC_LITE_CONF_OPTS += --enable-libusb --disable-libudev
+PCSC_LITE_CONF_OPTS += -Dlibusb=true -Dlibudev=false
 PCSC_LITE_DEPENDENCIES += libusb
 else
-PCSC_LITE_CONF_OPTS += --disable-libusb --disable-libudev
+PCSC_LITE_CONF_OPTS += -Dlibusb=false -Dlibudev=false
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-PCSC_LITE_CONF_OPTS += --enable-libsystemd
+PCSC_LITE_CONF_OPTS += -Dlibsystemd=true
 PCSC_LITE_DEPENDENCIES += systemd
 else
-PCSC_LITE_CONF_OPTS += --disable-libsystemd
+PCSC_LITE_CONF_OPTS += -Dlibsystemd=false
 endif
 
 ifeq ($(BR2_PACKAGE_PCSC_LITE_DEBUGATR),y)
-PCSC_LITE_CONF_OPTS += --enable-debugatr
+PCSC_LITE_CFLAGS = $(TARGET_CFLAGS) -DATR_DEBUG
 endif
 
 ifeq ($(BR2_PACKAGE_PCSC_LITE_EMBEDDED),y)
-PCSC_LITE_CONF_OPTS += --enable-embedded
+PCSC_LITE_CONF_OPTS += -Dembedded=true
+else
+PCSC_LITE_CONF_OPTS += -Dembedded=false
 endif
 
 ifeq ($(BR2_PACKAGE_POLKIT),y)
-PCSC_LITE_CONF_OPTS += --enable-polkit
+PCSC_LITE_CONF_OPTS += -Dpolkit=true
 PCSC_LITE_DEPENDENCIES += polkit
 else
-PCSC_LITE_CONF_OPTS += --disable-polkit
+PCSC_LITE_CONF_OPTS += -Dpolkit=false
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-PCSC_LITE_CONF_ENV += LIBS=-latomic
+PCSC_LITE_LDFLAGS = $(TARGET_LDFLAGS) -latomic
 endif
 
-$(eval $(autotools-package))
+define PCSC_LITE_USERS
+	pcscd -1 pcscd -1 * - - - PC/SC Smart Card Daemon
+endef
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
