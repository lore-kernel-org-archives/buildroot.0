Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FBBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 19:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C50D84080;
	Wed, 29 Jun 2022 19:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C50D84080
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HdNa_oUymHcy; Wed, 29 Jun 2022 19:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 566F784069;
	Wed, 29 Jun 2022 19:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 566F784069
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32B4C1BF3D0
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 19:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D000416CD
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 19:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D000416CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fca52ZpTnsqt for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 19:00:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C12C34097A
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C12C34097A
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 19:00:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k22so23844343wrd.6
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tWKovhzk0Dj/7e/aIzV6+0TRaWe2Jc5EEx0uqbn01oc=;
 b=MBMxQsgK+zaVdI6j9y5jLpqD7bVif9fJPwYJoMObzgwEAwhssIGDY5+t8hA3eRs5pZ
 BkRQwJ/rHHto+v2drux2SESJGqaaWEWI6pr2U0NDQPgiQoEXoIGT9BQiewzmdpZxkbOX
 W3qfMXHabLmUKUDoerGMzsrKSBlWAyRNbIGTaNp6dsv7wDHlfDgC4A+q0zpPYhrrOUKW
 n8TG4NGlr85rdLa6F9rtUAYMOU2lXqoKuiqI24NEJac+uGLe9pk4PELpUQ3FPfN2B/B5
 CcZnJupnnQtAqEmB9VKiAEGz+72PRHLd92ThqpENQ1Xm4f6zdsjFliQCNugLzw5jmyoS
 dHDQ==
X-Gm-Message-State: AJIora92Ji+v4BppH+Gv8yYd1KIjcRSmEL7sl6HL2e2cDL2YdlzHCQRV
 ru4rmhTKakI4dObJZWnxRCHqXxZTRZQ=
X-Google-Smtp-Source: AGRyM1tmi1Ty28CMUev/lcvQnEqeBI3mD/Tu96NEE0dEZbcV/4JfhSLFO4VGu16paVMXDW5JM37AOw==
X-Received: by 2002:a5d:51d2:0:b0:21b:bd52:c9c9 with SMTP id
 n18-20020a5d51d2000000b0021bbd52c9c9mr4798104wrv.498.1656529238689; 
 Wed, 29 Jun 2022 12:00:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b0039c4f53c4fdsm4793969wml.45.2022.06.29.12.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 12:00:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 20:57:02 +0200
Message-Id: <20220629185702.8309-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tWKovhzk0Dj/7e/aIzV6+0TRaWe2Jc5EEx0uqbn01oc=;
 b=edCE/x01ZZQUo35rcRi2R8JYvLK6BvNjwJ1d+qjcuhwr81NCHrumVvjH7BKh4Gs8pS
 3Q08nqnp4wU3eu+eAbK4FQ6fTuJ/FGWodN5m8B1f7nyeJc4X1h3W17vRf8J2A/rRy+EP
 p9/bXLc1Xv1Z5sWXI/j6gJ1fxIjjOl7rL9/v2RUtGFXzsUkIPeFoXxJrsKXjIbu+qHAt
 Vpolm+6swLz9lM9ZL/Nka6ZnzwiIWH9FP3oySuGs2PifAy/eN42DzeCm+TlEE83+Z5Xp
 HTcoVV4IdHIjUXCRaUHx7gHGtpXg3rycBwMgVwFJGI13qgqwSDsKdTHrlADfdkTckt9d
 RwEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=edCE/x01
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: fix build with musl-fts
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

Fix the following build failure with musl-fts raised since bump to
version 4.4.1 in commit cc66cf922b0481b66011b171db7985a27c79c381 and
https://github.com/appneta/tcpreplay/commit/e1f4c2ac9133584da4be0da855c04c314a2e68c2:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: tcpreplay-tcpreplay.o: in function `main':
tcpreplay.c:(.text.startup+0x21c): undefined reference to `fts_open'

Fixes:
 - http://autobuild.buildroot.org/results/e47940b5b158395329c0132bb1bbea429c4dc249

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcpreplay/tcpreplay.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 86894e468e..f228882ecc 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -11,14 +11,20 @@ TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
 TCPREPLAY_CPE_ID_VENDOR = broadcom
 TCPREPLAY_CONF_ENV = \
-	ac_cv_path_ac_pt_PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
+	ac_cv_path_ac_pt_PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config" \
+	LIBS="$(TCPREPLAY_LIBS)"
 TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr \
 	--enable-pcapconfig
 TCPREPLAY_DEPENDENCIES = libpcap
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+TCPREPLAY_DEPENDENCIES += musl-fts
+TCPREPLAY_LIBS += -lfts
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 TCPREPLAY_CONF_OPTS += --enable-dynamic-link=no
-TCPREPLAY_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`"
+TCPREPLAY_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --libs`
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDNET),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
