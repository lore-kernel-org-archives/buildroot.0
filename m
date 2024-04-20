Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9FAC4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 18:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E493E81FF3;
	Sat, 20 Apr 2024 18:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBIUKbMnY9gD; Sat, 20 Apr 2024 18:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C8F81FC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C8F81FC1;
	Sat, 20 Apr 2024 18:59:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8B1D1BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2108600D4
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buUH9DGsOvkU for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 18:59:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.50;
 helo=mail-wm1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D45EC6000A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D45EC6000A
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D45EC6000A
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 18:59:08 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41a268edd85so29025e9.3
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 11:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639546; x=1714244346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UC3lwCTzzdr4lBG3rbj/n9QdOAB5rh6JQ6auLNy+r7s=;
 b=WR68QR54fwyFzWE2ugan7gY+fbt1QHVyPNEsMkKAXFdR4lTD1J338YGl+RQQEG/bdr
 aEJdaVXLaZp5ecHKs3yF5E2M6FA7S+cWoeMkt72y00adqBYyae1NMHojHkYVH8hqNo7b
 Ty67t1h4spiVEsv6wSe1abGWES5keveIOiQjphpdm4j0rM6JHf+Ghw3lLGMDG5LNWelP
 VaS4BOunmayXWMkgElHxS9bZLba3RS3fCDMe/JvMTRYIVzREosJbSF0IpR1lI69SkS+m
 zLxUqnn0NDPDu/meEEaOvvyod0/cvjDQ7pyrssbjRFaSZu7OMppNtwLTdl2MIo/DEVVQ
 FVGw==
X-Gm-Message-State: AOJu0YzfBR39uYZgkL2wKVSUiBqDP3w+JXAHG5K/JZORXJaQUUKJ3PuO
 wGCXFQDH4uuVno/NAzJcWkc519SMrAIdnB67R9AuVZ+j0IzuHi/sEEKFRKWq
X-Google-Smtp-Source: AGHT+IFeRM5kpy5LLdD17h+6SI8C6YnHkNyU6zWIjqAySBUKjNg6Qmjh87TQIOkYW4R+VLBM7qfm8Q==
X-Received: by 2002:a5d:456d:0:b0:343:6b09:7551 with SMTP id
 a13-20020a5d456d000000b003436b097551mr3305250wrc.38.1713639545913; 
 Sat, 20 Apr 2024 11:59:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2033:ef69:f14:1bd2])
 by smtp.gmail.com with ESMTPSA id
 cs7-20020a056000088700b00346cdf48262sm7573981wrb.2.2024.04.20.11.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:59:04 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 20:58:53 +0200
Message-Id: <20240420185853.4134260-8-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420185853.4134260-1-thomas@devoogdt.com>
References: <20240420185853.4134260-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 8/8] package/libqmi: fix reference to atomic
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
 package/libqmi/libqmi.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 524333feba..8aa2b4a5f2 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -14,6 +14,13 @@ LIBQMI_INSTALL_STAGING = YES
 LIBQMI_DEPENDENCIES = libglib2
 LIBQMI_CONF_OPTS = -Dman=false -Dfuzzer=false
 
+LIBQMI_LDFLAGS = $(TARGET_LDFLAGS)
+
+# Uses __atomic_compare_exchange_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBQMI_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBQMI_DEPENDENCIES += gobject-introspection
 LIBQMI_CONF_OPTS += -Dintrospection=true
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
