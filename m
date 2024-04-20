Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB5AC4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 18:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18F4780E3B;
	Sat, 20 Apr 2024 18:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lR354u6BLoz7; Sat, 20 Apr 2024 18:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2032380C04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2032380C04;
	Sat, 20 Apr 2024 18:59:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCC61BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28021406B1
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLLfBixk1aA9 for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 18:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.44;
 helo=mail-wr1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0415F40645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0415F40645
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0415F40645
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 18:59:04 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-346406a5fb9so2437346f8f.1
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 11:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639542; x=1714244342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nG6b3+9krlkoTyhlMgSxKgWUjfKhJ/5So0GPZ7cH9+w=;
 b=MN3ANltqYcvwXhaHW/JXI+Nwd5Jr0rCuJB5dfqhQNGLy132XYBNBd3elMxTV6E9MCk
 FMaNpa3RKon7ZqDag+zxCXQy8ccQ1flriD9Yt7oLRJq6W/tBmguQ7ABPUzFcmOF1tdKd
 cTZjeFipkFmUw/ITb5B6yOws/yCBwoXIMbCqnPvZr7x+1R3aPnQHQwTeqp9y1t8WLIIW
 L5jAA2zud2XJ1ShAnSK8hIo0uGEDEb0+ZQM4LY9FuFOEfZrd/ODenCjJugihkPiTovek
 4jugSyUatVSOPCUXyMw0sDjLPyCwADWnOZb5CJLXY5/KVD7kdkYau+tS+gVxmjO8wtBZ
 5cvA==
X-Gm-Message-State: AOJu0YwIY6Eh03xRyENcAOt0+5ps1M8fNUk8Bk1YlZ6Se0yMe0SF8rRq
 qvs8ckXkbtTXLXrQKBx4b7d2kvcVvPBuqu8JvfMpVYhVWF5eNI5Ubwxz4Q6z
X-Google-Smtp-Source: AGHT+IEzT1SE1xpxipagiXQTK4+rH9Cdmq2385hUM5pAsiAQC7rIS8nJgbLbiN+5k46oFhvW1hNduQ==
X-Received: by 2002:adf:ff8e:0:b0:34a:56e7:5cc4 with SMTP id
 j14-20020adfff8e000000b0034a56e75cc4mr3795849wrr.2.1713639542081; 
 Sat, 20 Apr 2024 11:59:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2033:ef69:f14:1bd2])
 by smtp.gmail.com with ESMTPSA id
 cs7-20020a056000088700b00346cdf48262sm7573981wrb.2.2024.04.20.11.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:59:01 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 20:58:50 +0200
Message-Id: <20240420185853.4134260-5-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420185853.4134260-1-thomas@devoogdt.com>
References: <20240420185853.4134260-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 5/8] package/gupnp-dlna: fix reference to
 atomic
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
 package/gupnp-dlna/gupnp-dlna.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 0064700fd2..8de25e6347 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -15,6 +15,13 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
 GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
 
+GUPNP_DLNA_LDFLAGS = $(TARGET_LDFLAGS)
+
+# Uses __atomic_compare_exchange_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GUPNP_DLNA_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GUPNP_DLNA_CONF_OPTS += -Dintrospection=true -Dvapi=true
 GUPNP_DLNA_DEPENDENCIES += host-vala gobject-introspection
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
