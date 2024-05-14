Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E20BC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 20:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06F5741819;
	Tue, 14 May 2024 20:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycYuhdrvz28L; Tue, 14 May 2024 20:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C271640127
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C271640127;
	Tue, 14 May 2024 20:33:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCE701BF232
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 20:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7A0240127
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 20:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdcbYUYlrWbe for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 20:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.52;
 helo=mail-wm1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B478E400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B478E400E2
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B478E400E2
 for <buildroot@buildroot.org>; Tue, 14 May 2024 20:33:53 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4200ee78f35so26673095e9.1
 for <buildroot@buildroot.org>; Tue, 14 May 2024 13:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715718832; x=1716323632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgGfrRUFqngWuGRN8oAHZaLdgTo4A17+WNvMHwpQDjY=;
 b=HAbC1k7rbmOdzjTEbp2q/Q9LSx9gBgKON2P4/h3h3wwb9v4sHF7vGu0tY4A4NS2ait
 MKBT5ulT3gSAEwqanMUa/Ev/pGpnGCQlMyw7vBDAnHAFThT18iwRep8f7nGqh0uoiy4d
 U0boWcIhXrhIJaxNsmJvfK7AnazS8xT1ZhjWtuTyAHDm96WnZmKixTD7PlHuwZ7sVUD8
 nPDFKCLBmr6bGLBVrrRigS9hDyhyjkSl8RgZkYtZNoesbG5matX/3Zb0ZRthUyl48Vqq
 AuyU2Eef5OaNB0aHo85FlT6fUIEs0EC3S2vXFGMP2B7wKUb5GAbBkeB0sorXAhV3njXL
 EcPw==
X-Gm-Message-State: AOJu0YyPfE5PUL5PpuU01MOJUTMXHr03krvYTYcp+t+mN7NcVDqZrMIb
 7aqup0wXKQsCS5/5Yg2q4oy+92s8SOfW9DPHQCr9pMjaAIa9sKkhgZzSBw==
X-Google-Smtp-Source: AGHT+IGhtwbUYIEOW+1A87nl0KMsR5Jhl2ledv4OZYSdsIbJtkaWJC7q3kvSBWJSwQUz/7VMlQOxCQ==
X-Received: by 2002:a05:600c:790:b0:41b:5944:d05c with SMTP id
 5b1f17b1804b1-41feaa38608mr146263025e9.15.1715718831345; 
 Tue, 14 May 2024 13:33:51 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:a5d4:851e:63d3:a5f0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbd60sm14592948f8f.90.2024.05.14.13.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:33:50 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Date: Tue, 14 May 2024 22:33:47 +0200
Message-Id: <20240514203347.4107730-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420185958.4165997-1-thomas@devoogdt.com>
References: <20240420185958.4165997-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/fluent-bit: bump to v3.0.3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
- https://fluentbit.io/announcements/v3.0.1
- https://fluentbit.io/announcements/v3.0.2
- https://fluentbit.io/announcements/v3.0.3

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: bump from v3.0.2 to v3.0.3
---
 package/fluent-bit/fluent-bit.hash | 2 +-
 package/fluent-bit/fluent-bit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index cc9c976d60..a53f6dba51 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e70ae5be2f0ca1cb842a1c8d2762437907c522765f79b5c0c391eaa1b57c9f4c  fluent-bit-3.0.0.tar.gz
+sha256  2f3b82e8b7802fe92625009531592f12d500ff61a02ecf4cd27e0f138a6dc566  fluent-bit-3.0.3.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 33054bea66..b235c3abf4 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 3.0.0
+FLUENT_BIT_VERSION = 3.0.3
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
