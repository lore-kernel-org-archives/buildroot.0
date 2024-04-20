Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5068C4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 18:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F46280E3F;
	Sat, 20 Apr 2024 18:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9JrwuukI06A; Sat, 20 Apr 2024 18:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CD6E8174A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CD6E8174A;
	Sat, 20 Apr 2024 18:59:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A01F1BF3C5
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2666F600D4
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7C7JptfJMQo for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 18:59:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.43;
 helo=mail-wr1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 714CC6000A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 714CC6000A
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 714CC6000A
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 18:59:03 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-343f1957ffcso1701467f8f.0
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 11:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639541; x=1714244341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FdsjkaXnpkTi5s7W3/VJv5/MbogzDXHgJsYcZcmAQok=;
 b=bZAGqFegiZDcLL4sN9O9gSagZ2UJeeVoMS9Mz0jsT/HCOXGgdeYR6xzrkBxoLmExhS
 tbzZ6OtnHeUBNZNBrbK04OfcGedYMLM9V4R0Usiv2vgTjIlzgOEC0eMjUfopJ5ZLRzMQ
 fUq/PUy3MlLe/HcVWeqiB5hXPLo06pB1mQ4I4DPDLqqFKYTAkBz2Us3lZOuok17LsVpk
 xa0BA7w1kQqWdSjLdplYwwOn7vRtVHdR/JA+OzpKRM4ctV6BEuzspaoWc9cyO+hgN8pO
 p/i1hAQRwOdlKNIp4n6iJvXBnQO0XH1melbx4dV0l0WMMJsnR0RXCoKvhrm2rbReu7T+
 I5BQ==
X-Gm-Message-State: AOJu0Yy863a88fJHRWRitwcideFVvLvzEj8TfCwuqKPVjJFgMykOI4WK
 U1DoZ12VBGcP0JG/xdPqsGcy38VxXKAcPlgcYw6Wkihg+c8o8zX9zxD2BBXK
X-Google-Smtp-Source: AGHT+IGQyih4pA0TglxEeJW1VzJuGmI8T3ArURANq42h2rOtj/7GSfRisHoYvFXGudB1yWSpH6srEQ==
X-Received: by 2002:a5d:5906:0:b0:346:f091:fb75 with SMTP id
 v6-20020a5d5906000000b00346f091fb75mr4188992wrd.33.1713639540727; 
 Sat, 20 Apr 2024 11:59:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2033:ef69:f14:1bd2])
 by smtp.gmail.com with ESMTPSA id
 cs7-20020a056000088700b00346cdf48262sm7573981wrb.2.2024.04.20.11.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:59:00 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 20:58:49 +0200
Message-Id: <20240420185853.4134260-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420185853.4134260-1-thomas@devoogdt.com>
References: <20240420185853.4134260-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 4/8] package/gupnp-av: fix reference to atomic
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gthread-posix.c:(.text+0x137c): undefined reference to `__atomic_compare_exchange_4'
collect2: error: ld returned 1 exit status

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/gupnp-av/gupnp-av.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index 3821c4e170..a27f451a64 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -13,6 +13,13 @@ GUPNP_AV_LICENSE_FILES = COPYING
 GUPNP_AV_INSTALL_STAGING = YES
 GUPNP_AV_DEPENDENCIES = host-pkgconf libglib2 libxml2 gupnp
 
+GUPNP_AV_LDFLAGS = $(TARGET_LDFLAGS)
+
+# Uses __atomic_compare_exchange_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GUPNP_AV_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GUPNP_AV_CONF_OPTS += -Dintrospection=true -Dvapi=true
 GUPNP_AV_DEPENDENCIES += host-vala gobject-introspection
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
