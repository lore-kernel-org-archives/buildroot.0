Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C3CC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 13:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 794F940518;
	Sat, 27 Apr 2024 13:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amaHiDegcLb8; Sat, 27 Apr 2024 13:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0E0A40930
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0E0A40930;
	Sat, 27 Apr 2024 13:48:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2611B1BF25B
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 13:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12E55403B9
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 13:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sBP-iTskJch for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 13:47:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.45;
 helo=mail-ej1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1304740162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1304740162
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1304740162
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 13:47:56 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a58e787130fso70386166b.0
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 06:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714225675; x=1714830475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8IOvVVWR/ixMXiWGo/JTzV1TPZuzk4DswNXPF3aHWQ4=;
 b=tR52DLMku2AGcRre15QkJ8VtTLzWiib8xy/ewAEDVV89uj1hSOY2p4xFdkTp9rbgVS
 L7cZ1n0AwD/3pJGyPepQqEMV10QVirsOt9/4iMZ3SPALIV5QWvQLBij1RU82mouooUuu
 bFyE5nZN3QEmy/0zGKN9ARKMhlVntwifE1f0pr2jMd6cCOy4f2jGSJJEuiUdLZ15F+De
 BPLRwxplThiBqFfXHIiInAG99y3kg7Wfk41lN8iSdUHZvBPI4SQJ9RDKyYFViMEqTIdG
 5719yOk320C0I+exn26lTX0441gM03zvr730tL+OUezAnJy45s/kUFwD40ASZ/FzL0gk
 ui6g==
X-Gm-Message-State: AOJu0Yxc7kQXJg4P1e4r6iwNtm9txLaN44rhTJh4HjniToRrf8z1BG6/
 Stk/FESyZzwBT0ZIw22XiuTFOeYcafxa68UIHftFaIAH2GDHo+UHYNuqYw==
X-Google-Smtp-Source: AGHT+IEcT23vetyXG/o4pKKhEd+71XWxCCln543jx6XVtDrvWe549uxnm9fCRvP7Q0u56jgfP0arfA==
X-Received: by 2002:a17:906:d83:b0:a52:182b:dee9 with SMTP id
 m3-20020a1709060d8300b00a52182bdee9mr4365969eji.35.1714225674680; 
 Sat, 27 Apr 2024 06:47:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:d5bf:f5:506b:c838])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a170906b14f00b00a51eed4f0d7sm11688919ejb.130.2024.04.27.06.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 06:47:53 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 15:47:48 +0200
Message-Id: <20240427134748.700804-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240427134748.700804-1-thomas@devoogdt.com>
References: <20240427134748.700804-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 2/2] package/wayland-protocols: bump to 1.36
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Announce:
  http://lists.freedesktop.org/archives/wayland-devel/2024-March/043537.html
  https://lists.freedesktop.org/archives/wayland-devel/2024-April/043572.html
  https://lists.freedesktop.org/archives/wayland-devel/2024-April/043581.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 58c432e365..93d40a919c 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-January/043400.html
-sha256  94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a  wayland-protocols-1.33.tar.xz
-sha512  4584f6ac86367655f9db5d0c0ed0681efa31e73f984e4b620fbe5317df21790927f4f5317ecbbc194ac31eaf88caebc431bcc52c23d9dc0098c71de3cb4a9fef  wayland-protocols-1.33.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-April/043581.html
+sha256  71fd4de05e79f9a1ca559fac30c1f8365fa10346422f9fe795f74d77b9ef7e92  wayland-protocols-1.36.tar.xz
+sha512  5448b9aedc953ce6be0f378da900c195c8743cb6001f615823b5fc9cab3e3ee54271132055743278e10decef7f8e9dcdeef31593a2a12062575fb90eb0084be0  wayland-protocols-1.36.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 50a08d1988..c0dfe69401 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.33
+WAYLAND_PROTOCOLS_VERSION = 1.36
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
