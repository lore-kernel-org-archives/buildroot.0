Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5C0CAC5B9
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 10:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEAA4849AF;
	Fri, 26 Sep 2025 10:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfmS0SBu-drF; Fri, 26 Sep 2025 10:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D0E8436C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D0E8436C;
	Fri, 26 Sep 2025 10:06:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7A48177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C512C8436E
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8t3ne4grtuwc for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 10:06:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA60A84315
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA60A84315
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA60A84315
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46de78b595dso9939635e9.1
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758881173; x=1759485973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=30/jI+dwl1Em+78dHZqsWohiMbJhigAwdar/zFRlQck=;
 b=PrVyrdPyXmNINZr+I5nvAFQJhEmO7J3hLxXux8DlNGGjl7FJtD+etErVrL+HIXlilP
 V/YEfc41XmLa5+WOOjT2pJEtsQ4SbR1rzioKU1rXY5iezI5dKNJ5/BtjEslvcckgfGcp
 8fcrxc9LApiukAi+20FB+nLlYu2eLGEnaNXIFSvonG1/MPEJUCPyks6GHh3Xxiuhh6Uv
 5KsIUA4K/UtRPQ/EmCclAg7kqfRBlQKlrihnLH6T87yrehoyXFPg1jfPmvoVsbNVk3Tz
 Ihna6VH/zsENCGpxg6YC1Rmmq+cuQzjF+pymfHQjgIre607zjl4ucy65cK24bX5epxrz
 Qu/A==
X-Gm-Message-State: AOJu0YzDdQo60GIo7DgV/sO199KaOPlFqQgfkvdKsWvoI08WfUKreLvs
 fXsOxK6cTKRgck5xh1zZjrPTExFC0p+Autdp+9m5ILSAg18u3gcVFt4eF/nFvgwikDuD/9a9pNQ
 0AS0j1FA=
X-Gm-Gg: ASbGncv4E2Dh5BnPUBkbVxv0Vck0FWcB71K9795GjM6fzIHZMy53U1N0jwjlqhh9HRW
 jejfUyesNKfu6C9ldY1de9zbRJsfFar4gH7WPwIgWmIHc2VTfOkkUG+DJ7ggiMB8KeAfuAKmBi8
 gsm2lj6G9iq9HdNelQb5QvQP6hWOcbYbq+ebJIxGMspIg6XwYWFGR0ngDP6FMy/mS/tEkjTKxgY
 N84K7roycPq/cF0Omk1ReidkoXjqzVzpTvSjKaE5e3q+yp8Stzv7/6/aQjEljpnTcBagAJZmw2D
 23tV7kAlEtrO8lBX4jAAtjkU9torRhh2vkuFcmpH7vRvnIzh9m1rG1RQfnWBYoHSk5hvlxWDCfL
 Hu/GJXKCQaL/ZiVQQJsw70uRTFib1F9tHO29xuz58Yk5qsBnSy60aDQeDuXPkmOQ=
X-Google-Smtp-Source: AGHT+IHfxuWgneVeT4bww61tyV1GvIhO0gjekItVZND6UUesw1m+6mWyuXY2QPqEssrKCvvfrgJyhg==
X-Received: by 2002:a05:600c:8a0d:10b0:46e:3193:fec9 with SMTP id
 5b1f17b1804b1-46e329b9c26mr45194365e9.14.1758881172794; 
 Fri, 26 Sep 2025 03:06:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab62233sm112622825e9.21.2025.09.26.03.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 03:06:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Christian Stewart <christian@aperture.us>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Sep 2025 12:06:04 +0200
Message-ID: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758881173; x=1759485973;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=30/jI+dwl1Em+78dHZqsWohiMbJhigAwdar/zFRlQck=;
 b=JFckbeksyG8nynLNSK4E+G7DSTI8aKS9Z6RoL3Evh2pnVTwiS6Akrrhytkl7lPBcdI
 c8X2hmL5EF4pmtBp6eyqYQGIbT5GP9LjmlupnfovMqtkcbCtg4rH718qQX6mOuw+yKxb
 6k5RzgkG9Kfs7pysDJnT8jRWqx3zMXnZkd/hY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JFckbeks
Subject: [Buildroot] [PATCH 1/6] package/embiggen-disk: fix
 EMBIGGEN_DISK_VERSION
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

Make EMBIGGEN_DISK_VERSION compliant with release-monitoring.org.

Fixes: 4ae18c511a2a7e8b0b6cd7a2961ba4c0e395fe2a
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/embiggen-disk/embiggen-disk.hash | 2 +-
 package/embiggen-disk/embiggen-disk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
index 02c99add6aa8..1a327dce2a2a 100644
--- a/package/embiggen-disk/embiggen-disk.hash
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  25e536bd58969077554927a456cd3cb79e21f126e47545ba511abe64a0f3ba5e  embiggen-disk-v20240521-go2.tar.gz
+sha256  67ab51d13c85c5e3f1805f1e7b1e2db92edf8472007cd859c5919692eb0c0cbc  embiggen-disk-20240521-go2.tar.gz
 sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
index 47b86c072bf3..a981cdf87f63 100644
--- a/package/embiggen-disk/embiggen-disk.mk
+++ b/package/embiggen-disk/embiggen-disk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EMBIGGEN_DISK_VERSION = v20240521
-EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
+EMBIGGEN_DISK_VERSION = 20240521
+EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,v$(EMBIGGEN_DISK_VERSION))
 EMBIGGEN_DISK_LICENSE = Apache-2.0
 EMBIGGEN_DISK_LICENSE_FILES = LICENSE
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
