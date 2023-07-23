Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F31C04A6A
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 09:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C112415CB;
	Sun, 23 Jul 2023 09:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C112415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ld94SdZD5m_h; Sun, 23 Jul 2023 09:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E85415C7;
	Sun, 23 Jul 2023 09:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E85415C7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3F011BF589
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C59840964
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C59840964
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yPDKx1WbrfXa for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 09:23:28 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C5BD40869
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 09:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C5BD40869
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3fd18b1d924so25004495e9.1
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 02:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690104206; x=1690709006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9z/ewpJ5BTBjugGsBI1cZJ5pgVFFnhdkIqko3uHE470=;
 b=cqsWRkOZz0/RetPlem1tHS7u7IfcZgRA1SlI3df3j8iXi3bhL3D8Kc1bGl2/89Ffvt
 gphik/gveyTTyZuZKdajAyWTex4SGSkZXrrjK6rshoDAD9Mw0W6VIrgeE30P0Hh2Lxgz
 UOT01Ac4QdGFYgWTKIwiASlChe4K7EavXP+f1w8dhwyVe7gqokBf1qXRPImDTcvJYK+d
 6Mlza59q00cnekTmj4fstj25SgG29LvziU0LSQSJPhba1DtpnpPPa0SLCtb9saT9/Z7c
 0uosMI6ieVwAH16kecQMWsA1TNNEIzgSS61+5BXoQySND6jBC8eR7iXwx4txwF/KuBsy
 XAuw==
X-Gm-Message-State: ABy/qLaAV8DMAwSOm0mM7K1jnAWjlgK4SvOdUiqCFR3KjRzUi8XR1Wta
 AJOA96W1+yOE/pmaYKarVeiTkVN0EJJA/w==
X-Google-Smtp-Source: APBJJlFtHoAsXyNUIo4Cxl715iB7UhZvQY28Y+OK5tCrK70T0KO5kKvOSadAXXt44H5k1DhoKu1yvQ==
X-Received: by 2002:a5d:5092:0:b0:314:1608:1eec with SMTP id
 a18-20020a5d5092000000b0031416081eecmr4604915wrt.63.1690104206169; 
 Sun, 23 Jul 2023 02:23:26 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb68:2f00:f09c:126e:2c9c:1d2b])
 by smtp.gmail.com with ESMTPSA id
 o8-20020adfeac8000000b003143b7449ffsm9124728wrn.25.2023.07.23.02.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 02:23:25 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 11:23:13 +0200
Message-Id: <20230723092314.129079-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230723092314.129079-1-thomas@devoogdt.com>
References: <20230610133251.97022-1-thomas@devoogdt.com>
 <20230723092314.129079-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/4] package/fluent-bit: drop cxx handling
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fluent-bit is written in pure c, so drop any cxx handling. Only the wasm
part needs c++, but that one doesn't need the fixes which are now dropped.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: No change.
v3: No change.
---
 package/fluent-bit/fluent-bit.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index b26ec2b0b6..cd8f347768 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -13,7 +13,6 @@ FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
 FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 
 FLUENT_BIT_CFLAGS = $(TARGET_CFLAGS)
-FLUENT_BIT_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
@@ -49,13 +48,11 @@ FLUENT_BIT_CONF_OPTS += \
 # Fix multiple definition of `mk_tls_*'.
 # https://github.com/fluent/fluent-bit/issues/5537
 FLUENT_BIT_CFLAGS += -fcommon
-FLUENT_BIT_CXXFLAGS += -fcommon
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
 # https://bugzilla.redhat.com/show_bug.cgi?id=574992
 FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
-FLUENT_BIT_CXXFLAGS += -U_FILE_OFFSET_BITS
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 FLUENT_BIT_DEPENDENCIES += libexecinfo
@@ -74,8 +71,7 @@ endif
 
 FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)" \
-	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)" \
-	-DCMAKE_CXX_FLAGS="$(FLUENT_BIT_CXXFLAGS)"
+	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)"
 
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
