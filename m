Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED084C28B20
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 14:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A79514068B;
	Sun, 30 Mar 2025 14:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id on9g_E0-Wb1a; Sun, 30 Mar 2025 14:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBBCE406E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBBCE406E4;
	Sun, 30 Mar 2025 14:28:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6860121
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 14:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A76EB81EE9
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 14:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypCx2jsU63KM for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 14:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.41;
 helo=mail-wm1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4BD9812C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4BD9812C4
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4BD9812C4
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 14:28:47 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so19344535e9.1
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 07:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743344925; x=1743949725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JTSyR7tF+rPnZEXw69KC+/J+imZA0Bjqo7fIg8HrPSw=;
 b=Og2eBGi6y9ppYjdPUhSHxxYJ+NZPC6gkk5o1yC7oBcFZ00qbY1tYxUWh2qgKBNkrCI
 P/9rIl4cerWvwnY91AQn739O7l+fi7abQqk4SYkVP94fsaBIb5RIXhQuS3CNM/YefnIo
 xgp47EoS5osmmONIIRBpknN8yagLonCSIfeecSiXP9M9gwlqmMUzTH8iL4XjoUh7QD3i
 2/ittsI5uhF7Iro6fC8vZmngxpEo720slZrYjep7hJ0qOEMTcUgcDySUkNorMUU2FwVW
 ddk8QAv7G7b/ze6keSDylUtBZaCdKTJCEMFWjnbSZ/4ka5gghfWNS7irxn2yNaLx9N4P
 sIEw==
X-Gm-Message-State: AOJu0YyAggvM8MTvRmsSlnx1CtgFDjqyOGgS6Mx4N204cvjYN0dyqhfV
 lji3eFrO1euL+x/STfj228CzFaYfytyN+KXQAvNi6QI/gDBm3OFFOKDLdQ==
X-Gm-Gg: ASbGnct+yI9FIU132tHTLYoC5LirdTyb9bqSQaET++CFq3Uv5BmdnUxb6ROjS5G4T/d
 JTOX2EzY5Xy4W/L0U3DzaicA5ZNBff6/gsCDErICykKHkXOoNT4r+Pek8mMx2YS9in8g6l6fi7N
 XEQiA0+5p2Nm2Rz8VGnmnhA5ru0yg6OMana2bTnd8ji7w2wyAWDzHvXW9UV6murcdjNt1GW7QBJ
 RZwN+PKEPWnERwY37mXecBO9eOPZolctptX+7LD9J92hC6voXeP/mPYRPO96W/dnXDUIWL8WYG3
 MyKANjQffCN4DKtXkedKaXjjJLlhhaExAKLFdH1ZZ5jGC6Ntv9cHJBx65RqipXvNuy3mCBPm3Jc
 =
X-Google-Smtp-Source: AGHT+IGSifxZf1+us27brDbLnGah/6WOBnFKuZWXEDTVNjmYu5i+eMQOFajg2u4JegUMD7L3uONz4A==
X-Received: by 2002:a05:6000:2484:b0:39c:13fa:80b with SMTP id
 ffacd0b85a97d-39c13fa096fmr3669374f8f.12.1743344925112; 
 Sun, 30 Mar 2025 07:28:45 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:b123:453f:1763:244d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0a3sm8810398f8f.71.2025.03.30.07.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 07:28:44 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 30 Mar 2025 16:28:42 +0200
Message-ID: <20250330142842.2909327-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libsoup3: bump to 3.6.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
- https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.3.news
- https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.4.news
- https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.5.news

Also drop the krb5_config, which was dropped in commit
https://gitlab.gnome.org/GNOME/libsoup/-/commit/123eb029bf3fa08f3c45678c0a43ae4b930e6631.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 23af347903..32aa7382fa 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.1.sha256sum
-sha256  ceb1f1aa2bdd73b2cd8159d3998c96c55ef097ef15e4b4f36029209fa18af838  libsoup-3.6.1.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.5.sha256sum
+sha256  6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234  libsoup-3.6.5.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index f2f96c2def..0db587a93a 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP3_VERSION_MAJOR = 3.6
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).1
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).5
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
@@ -45,9 +45,7 @@ LIBSOUP3_CONF_OPTS += -Dintrospection=disabled -Dvapi=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
-LIBSOUP3_CONF_OPTS += \
-	-Dgssapi=enabled \
-	-Dkrb5_config=$(STAGING_DIR)/usr/bin/krb5-config
+LIBSOUP3_CONF_OPTS += -Dgssapi=enabled
 LIBSOUP3_DEPENDENCIES += libkrb5
 else
 LIBSOUP3_CONF_OPTS += -Dgssapi=disabled
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
