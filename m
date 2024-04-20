Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0336FC4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 18:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD84081BF5;
	Sat, 20 Apr 2024 18:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UH7ZifZcdZn2; Sat, 20 Apr 2024 18:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9E6581B9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E6581B9A;
	Sat, 20 Apr 2024 18:59:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8561BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1223180C35
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-5-DPoQizMV for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 18:59:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.47;
 helo=mail-wr1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A1BF80C66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A1BF80C66
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A1BF80C66
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 18:59:03 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so2415460f8f.1
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 11:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639540; x=1714244340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVawS3Efo/n+5eiFORxRbYw8GX7kaqb4do4/mSDRNTQ=;
 b=xKh+gSt+is7tOmdtQCTJ54Zxnrnlm62ZBTtN6jawZVlfTbXhstEGILY6aRqdp/khdz
 WRo7yjINjWWxllrMi3EaJjQ0G4gnLGVWJqE/Hprfy6rPcNIYRty4vqPcDmyeg8PpkPk7
 N7xaUoFtNSEHd6UUUE4UmDz+M44EzaTgjmdJt2lXanOIIiswzXcgwGNUZ7N69GRoDStS
 WZl5HT/6CuiShISKnZ+9bKPQGaWMIo+sXihs+HbZYL5jtZX7NXyFdtEFAo0kppyFbu7z
 lYEZQauvO5mJIMRIMhtCN7pQ74dCwt4sUGIXyfJHydN65x22iQMpFwuaUSXsxOE2IwUP
 3bFQ==
X-Gm-Message-State: AOJu0Ywn/5tgvKk6QZ+Y2I51/UFEBBZo/WQ5jhXR0GpLsYMJ694RUVek
 VXYHh/hqBcFODsoRGI/hp46fWdzBEg+fXQIOlH8m91ggwFyIsnOz1Jc4jLG3
X-Google-Smtp-Source: AGHT+IH6zEN0gD0waWYv+r6v0aTYtEvpqumZZqx/cH3CK1T26c18D8oDaPO6oGHZKy3OvXTjQea6uA==
X-Received: by 2002:adf:cc84:0:b0:34a:80ed:9930 with SMTP id
 p4-20020adfcc84000000b0034a80ed9930mr2395845wrj.8.1713639540043; 
 Sat, 20 Apr 2024 11:59:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2033:ef69:f14:1bd2])
 by smtp.gmail.com with ESMTPSA id
 cs7-20020a056000088700b00346cdf48262sm7573981wrb.2.2024.04.20.11.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:58:59 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 20:58:48 +0200
Message-Id: <20240420185853.4134260-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420185853.4134260-1-thomas@devoogdt.com>
References: <20240420185853.4134260-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 3/8] package/gupnp: fix reference to atomic
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
 package/gupnp/gupnp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index cfcc114189..8f91439ff5 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -15,6 +15,13 @@ GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
 GUPNP_CONF_OPTS = -Dexamples=false
 
+GUPNP_LDFLAGS = $(TARGET_LDFLAGS)
+
+# Uses __atomic_compare_exchange_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GUPNP_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GUPNP_CONF_OPTS += -Dintrospection=true -Dvapi=true
 GUPNP_DEPENDENCIES += host-vala gobject-introspection
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
