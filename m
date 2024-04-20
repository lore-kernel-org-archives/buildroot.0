Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440E3C4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 18:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4097780D41;
	Sat, 20 Apr 2024 18:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5f3bbk_FzPeT; Sat, 20 Apr 2024 18:59:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4913580E74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4913580E74;
	Sat, 20 Apr 2024 18:59:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1AFE1BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB57E600D4
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGbEUTifTnRM for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 18:59:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.43;
 helo=mail-wm1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E0C86000A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E0C86000A
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E0C86000A
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 18:59:01 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41a22d34c5eso553335e9.1
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 11:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639538; x=1714244338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJi7IVA5wZ33v6bQjl/8t7qWG7U/EOI71aA7T06XY3U=;
 b=bGj3/zIFyXtalIEy7l7PFOMhIHbGLxMFLBW/rkniKF+vYW1TaqLp/t7P3r8A00VNS8
 Y5WOaSvpczOlyypS/N8oGm8JtQ3A8coIuZ1MbnsplKU8LnGAd5ZhlrWhbaqnYDnSZJFY
 7V2RKtgVbuK1nH2v/kHbOKXASDZJ9Lo9iWHnCJTpIwFRQmks6YkMxoWy5HLixOqPLcN/
 Hju2VTip7ivz0OOrjvRfR5tn2T9Vznc5FQPg/+3pN+ScYCI6+ZIFUMlWihEjfUiSEHTA
 4ywxmfvJ0euEnP/jAAi1LIZ5A6C5+tPQuasmPWPgZcvXH33RmrYSAo2f9nabDiKVo6bX
 6d5w==
X-Gm-Message-State: AOJu0YyACE3Mo0o0sknQ6SHTa+IOcFi2Sf3ytR7gUzO3vx+/KnUNcZwT
 Hr7Wg4YKi3xrAiuVJIcPd+JWSTaWeOHLu65JYB/1VlSVAbV30rTHySnkL0zJ
X-Google-Smtp-Source: AGHT+IHO956a1hJR6zR2UtiVTZVlwd42WIs1g5xjRr6rinkNM8cos7fo94Gb3HXLDAxy5weRELQ0gg==
X-Received: by 2002:a5d:58ee:0:b0:349:eb59:c177 with SMTP id
 f14-20020a5d58ee000000b00349eb59c177mr3714766wrd.11.1713639538080; 
 Sat, 20 Apr 2024 11:58:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2033:ef69:f14:1bd2])
 by smtp.gmail.com with ESMTPSA id
 cs7-20020a056000088700b00346cdf48262sm7573981wrb.2.2024.04.20.11.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:58:57 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 20:58:47 +0200
Message-Id: <20240420185853.4134260-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420185853.4134260-1-thomas@devoogdt.com>
References: <20240420185853.4134260-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 2/8] package/gssdp: fix reference to atomic
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
 package/gssdp/gssdp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 3b446496ea..0ba8672ac7 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -18,6 +18,13 @@ GSSDP_CONF_OPTS = \
 	-Dmanpages=false \
 	-Dsniffer=false
 
+GSSDP_LDFLAGS = $(TARGET_LDFLAGS)
+
+# Uses __atomic_compare_exchange_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GSSDP_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GSSDP_CONF_OPTS += -Dintrospection=true -Dvapi=true
 GSSDP_DEPENDENCIES += host-vala gobject-introspection
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
