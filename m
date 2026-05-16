Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2832ACD4F3D
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 01:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67D784A23;
	Sat, 16 May 2026 01:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSGGVLElVdOt; Sat, 16 May 2026 01:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 385E684A1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778895844;
	bh=vU5m0yBGEFvJgpZNpWTr09wLnnIII5k86tupBcIfLBM=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3TGMjofDGQTMO5WvX0aGO//o3I/sVO2sTELWLTVJFCjt+SMwRD661xWIgjUdOBnD
	 QTbWn1ML+Z0zuVPm+JGe5dw7njeU732tlg6It69TQJQ7/zA+29FzGoRXY+tV1QUfaR
	 JMe/lYynazGVPBoTi6ofACD6KdqzhEBTYARwZJFG5Akv/bnA6ZAaIpjtwJ1aMiue2g
	 Ss7436ZURBvZ+MB99PkG+eng95Cz78enPUCJsqNzlP9yPg+87+pRkNArrCHdPTu1Qy
	 /AWGzHMoBcxwNZLWvCeWlYbiXkgmZ6xyTbA8UQm6jSfuwrSZo86Q29UVtnHSU5qMif
	 fZtb5NuptU5EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 385E684A1F;
	Sat, 16 May 2026 01:44:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1148B282
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB3BB616FA
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbbuaF9xOJFB for <buildroot@buildroot.org>;
 Sat, 16 May 2026 01:43:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33CD56177D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33CD56177D
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33CD56177D
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:59 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-83d31ac4017so204031b3a.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 18:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778895838; x=1779500638;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CgP48yWeRcYvyN6jrZh6ZXrD0pX4vdZ4QvdOiiWUNeg=;
 b=mVxRY0/IG2ugKV0wHQ1aWqmVkYw/hHW+QeViA0ASJyYhHr38wBnxYrpJ+YUZxivZY/
 5iy0X+RtlFkfgoWxwls810IMaGi1bbUnX+K0evZIR8sv0AjduZQhb1dHCLCzg4PRFnhE
 DICnZm/Iqv0FPv7AwN5tojxM4ZlOL+0MKb4TSgfX7U0Uyj/Sy0H/FwHZU48a36Tta7Vi
 bjFB5Cm2G3qnXv3lyi5SY20b8hRLV5NOV9UFrBtNUARhD8qLMfcV90fvDSdKpJDRW8Rf
 T8S0Xya342wA+MxPx7J7XCt6WYn3DkzBeTrQR+GtjjxI5YHUhC0qqHeqTrmq+M2ebwaC
 Kvrg==
X-Gm-Message-State: AOJu0Yz68g3Z6osXeeB9HmuVH2N+dmQfF5elIQqA6fM7briX8fvAPgQc
 VGJnl101dlp87z7dfisL72xhoSKqsjwSMQlQvUNUyFRpPrvFqlZyQJmkDKVnaGKwMAo=
X-Gm-Gg: Acq92OEWDdbvKdFwXyNPj3r7iAAFI6n+RcCgr1mt0t34w2KiUrCWFc7Gxjz2UBk6dOw
 SbY3IgGC35a/LBWhuDw5le3XSH7D+Kndb9d1KKFxK/poqX3IUkQUQRCQmC+Slyzgu2V60ly1X0S
 Vc94tJ+7zodj25m7EFQrDzop+q4Sf0OXr72aahxxgQK1M/sGyN67PcAhme9X3rMjq+a/o6hJbac
 qYswq+xtUj4R534KNY+HuVxJn5q6ZcMBA+csR1gP+hRidAe2Cmpvcv8MHznkOVHPg6aGepTk2pV
 fEHzGciKlF4gxpmmj7feFrkM+F8IbZhA5nxwvPSGq3Vq1yHBqfdZUtmjuzH68uUtArvpRtL6hfB
 nL+V8CLctSAGGEsnxIdNtqeeSVO/p00Hmei8xCHto5Mv9Tyb9KqoWXQVz7lfof9/ZiTBI0eMSHg
 a1g4eer3m7Uz48gRc+VCmAqprA
X-Received: by 2002:a05:6a00:18a9:b0:827:3b1b:43e6 with SMTP id
 d2e1a72fcca58-83f33d227c0mr6646456b3a.21.1778895838402; 
 Fri, 15 May 2026 18:43:58 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19c5ceb3sm7227670b3a.34.2026.05.15.18.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 18:43:57 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 18:43:37 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v6-6-d9081c13baf9@gmail.com>
References: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
In-Reply-To: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778895830; l=1764;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=a92H1p65nHLfLFbaCQseOGbL5/M6GrdGlbpN6j6yxcM=;
 b=bgrnDFUposC3V01IfGa3JTGxH/twCszgWrl26WnCsSaB52JiviiRwNQvrPkRYc2jiSzEECQQU
 nvTR+1D2ve2D5eFXfibDhTPd4ywFQPFBzF4CTblK4eMCu8cDgx5uFhO
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778895838; x=1779500638; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CgP48yWeRcYvyN6jrZh6ZXrD0pX4vdZ4QvdOiiWUNeg=;
 b=WfUFetTXCYiUmENjePyGVGO3tTx5q8Damv/dg8CM5VUGNiRmmzRfi6I1+0Q8PYeXel
 FlQPuDwHvqG9nr9UkyqAxBhQcqpNSZtYUIhFywBfFgPRBo8tUFKJr76POqDIdYzUTe1k
 6ckNJhnSuBW99htuI4lJ1OhkYssNYeandrbF6uU4QBxROjuXzTdMQM5fkJOJZFyf6EUH
 0Y40HI7IIsVhf+AC/gwzAziDR0E1p4DKi9INmTWnJOh3aGid7MQeMZoONANRFbcsm8qN
 RerAu8ZWlhQE0aw6nLN0kNBa2kpofONolRuxgACaC/6HkpaI5hcxqeJaxKlpghmrJHkK
 95FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WfUFetTX
Subject: [Buildroot] [PATCH v6 6/8] package/qemu: add OpenGL config
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

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 14 ++++++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2a6aa288d3..eb34f4ba0f 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -112,6 +112,20 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+config BR2_PACKAGE_QEMU_OPENGL
+	bool "Enable OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
+	select BR2_PACKAGE_LIBEPOXY
+	help
+	  Say 'y' to enable OpenGL accelerated display frontend support.
+	  This is necessary to efficiently display frames rendered in a
+	  guest on the host.
+
+	  Run qemu with `-display sdl,gl=on`
+
+comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2199db38cf..aff1762fb9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -272,6 +272,13 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_OPENGL),y)
+QEMU_OPTS += --enable-opengl
+QEMU_DEPENDENCIES += libepoxy
+else
+QEMU_OPTS += --disable-opengl
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
@@ -329,7 +336,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-membarrier \
 			--disable-mpath \
 			--disable-netmap \
-			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
 			--disable-plugins \

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
