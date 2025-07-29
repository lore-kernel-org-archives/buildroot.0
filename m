Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35C9C83F26
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 17:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7008040AE9;
	Tue, 29 Jul 2025 17:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddPYxijMsCen; Tue, 29 Jul 2025 17:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE0E40B07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE0E40B07;
	Tue, 29 Jul 2025 17:26:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E5AD13D
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 17:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6487C40C79
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 17:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EagY3WOCeNP6 for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 17:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=stefan.nickl@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 680A040C50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 680A040C50
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 680A040C50
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 17:26:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so3506204f8f.2
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 10:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753810001; x=1754414801;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BwhbEyNTDSy89cTujbfbeRBwaCS4WyWqnntBN5cEIGc=;
 b=pvIuSJPTpDTKN4xzBI8m6Q+svlYcYO4YYdg1tgxnUu8gaucjUcHT1naJGP6RRqGQuO
 Ih64jCAF3cRAvNViG8MLe3CuCEn/+y98FNqDz74IQwe2NyQzPLxwFeG5qdIHwtGVGKoa
 EYwMSI5JpiaEFLbkJnXblJC/RKfnsY5229aSxYgKBFem5nu11pahWRFbbD4bWZa1ddE9
 rr0jANQf7/AY4C5Og1ek1ASXt/LB4Ehzl51R7d3QMbe5BpRclO2110jqZY71+qWxeN/Q
 w74bVIS+i6T76vmvWUHx2/kbcDFrfAEeUtGbIbtR2arD2OvRVrNCRcfKv3AbiuXLeFeJ
 CIXQ==
X-Gm-Message-State: AOJu0Yxt2ZdkzB0UIwdle8hQAltkDrdw3ZuWonq2YKSG0bmRCnqxhinb
 wxOjK4qZGeQX7hS8K2Y/2kp2mT7GTVJCg40/pqcCBGhvYKj5x8NDLC8VefVk40ua
X-Gm-Gg: ASbGnctsRWvTikuENCLFZwtJJFyZHMjZiD+2jiJ9VUYitmiS5tzNJlQyzB0E0RUWYVc
 04AULjg1zGTfkkuZSQi+o1FMXlSiYagWC5r72nJFA2+5WR9ouXws4qNC2Uyb0wK7GAVrp6ZphAK
 EY5FbhX/SeFVBp0BCkWzH6pIpRM7HE8SJujqEE/J3LFu/gRgPww0neggAsjyRkOTqWM+bmWgEkQ
 UokPS3Gf0z4JRJsui6PI2WatWpnpk+iLvpSRexiQ0tMKDvbfQL/BUsJiDlZvoZtE/OfEpiMps9s
 hP5r6o2xTfPJ0cGFhoH3Bna9QgLM1C1oFGwC21HLAPgmEVUhM61SywcUKw66cWXhyZSMSMx9N6V
 eV+2JAK68+1SSIAz+Ons6ztc/izHFSLFHWlJBNdaMQUWl5XTXveVpfrwpzE01bUSFJZWKWX5Qfg
 cHbaPTXy3vvn043q5QLg==
X-Google-Smtp-Source: AGHT+IHCsaT+DAy1YikVk/Imb1ZEfKyxbEflVoTAaDlkSnwMOl1kaGoJ2N3/ljnazzEspCAzRozNSQ==
X-Received: by 2002:a5d:5d09:0:b0:3b7:8af8:b91d with SMTP id
 ffacd0b85a97d-3b7950286f0mr362148f8f.35.1753810000668; 
 Tue, 29 Jul 2025 10:26:40 -0700 (PDT)
Received: from ultra.fritz.box
 (p200300d19708bb003b2dcfb7dc740f0b.dip0.t-ipconnect.de.
 [2003:d1:9708:bb00:3b2d:cfb7:dc74:f0b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b778f104ffsm12615051f8f.66.2025.07.29.10.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 10:26:40 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Date: Tue, 29 Jul 2025 19:26:39 +0200
Message-ID: <20250729172639.46544-1-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753810001; x=1754414801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BwhbEyNTDSy89cTujbfbeRBwaCS4WyWqnntBN5cEIGc=;
 b=EvDVL/aC2XGQYa6F2xdTtLhn4JYPgx+A6hF4RNNLHSEblUl6fPjQ621K7j1WS9Cqd4
 VDVxjJN50EwofBMFbOBk6g0JpRBN7+jjDfbxD8PiKysZ0Rjbh4Kjt/mDBfc2pvl8VSnJ
 loLVKiFlGQha+pkpYM6DqNjtxZNEXSwvou/+UWd2egSdYwrICvxb6xvWgPZXYdtOPQMS
 hk2DCMTM53HHG7a68+O2Y2Xr+aBacZ/RngHwK0wJOwgObWZX0/fGvYMSCbR9FrWlObu3
 Yx1u8tt68oRgbR6R496WgnMlYWcncL2EPYOTxTsW/ioCOxXRWyEc6HFn63mrbImtPMTT
 OQPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EvDVL/aC
Subject: [Buildroot] [PATCH v2] package/modem-manager: Add option to enable
 AT commands via D-Bus
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
Cc: Aleksander Morgado <aleksander@aleksander.es>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
Changes v1 -> v2:
  - Don't split LIBQRTR section

 package/modem-manager/Config.in        | 6 ++++++
 package/modem-manager/modem-manager.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 6990996a86..e03447b96c 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -38,6 +38,12 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQRTR
 comment "QRTR support needs a toolchain w/ headers >= 4.15"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
+config BR2_PACKAGE_MODEM_MANAGER_ATVIADBUS
+	bool "at-via-dbus support"
+	help
+	  This option enables support for issuing AT commands
+	  over the D-Bus interface.
+
 endif
 
 comment "modemmanager needs a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 932c163175..899e3071a5 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -48,6 +48,12 @@ else
 MODEM_MANAGER_CONF_OPTS += -Dqrtr=false
 endif
 
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER_ATVIADBUS),y)
+MODEM_MANAGER_CONF_OPTS += -Dat_command_via_dbus=true
+else
+MODEM_MANAGER_CONF_OPTS += -Dat_command_via_dbus=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MODEM_MANAGER_DEPENDENCIES += systemd
 MODEM_MANAGER_CONF_OPTS += \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
