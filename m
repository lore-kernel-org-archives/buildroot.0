Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CB7C25B4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 04:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1509828F2;
	Wed,  8 May 2024 04:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvJuvMH8WbTb; Wed,  8 May 2024 04:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8337828DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8337828DD;
	Wed,  8 May 2024 04:02:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80AD91BF386
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 04:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B3BB401D2
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 04:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HW2uXib5UaUF for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 04:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A000F40150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A000F40150
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A000F40150
 for <buildroot@buildroot.org>; Wed,  8 May 2024 04:02:24 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-36c6df3d735so16030835ab.0
 for <buildroot@buildroot.org>; Tue, 07 May 2024 21:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715140943; x=1715745743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y5nq85SwWh6KjU2zU57gpbQ8o+ReZj55oyEnhHRflMY=;
 b=TAZL8nQYJUdRf/8RjgW544t93blaVELqdhkySZmj1M2Fm8gbmrkhH7VEiFaPK9f8U/
 kVvllWrr7iXVBjR2YRqNJjbJsSX7cR4tDmNcV2y8u+lAb+t2xK5jMIIRC5R4Yb5Urql8
 WkY6YFbMgSbUAQPQuiAiG6Jj1tbOrBjBo5KBLAZMPj6sjdG649cmopxA2L76ctbZN/JK
 wNvIQVjXO2xrNGtqPtYwZDtpEmzgHu0hIIJT1qqXzrulTwiDDGCboRewYZiVpQX+gWQW
 JPFE56g97Sw5vNkDdHP4h2pCjDY0/uDFvaNsk1qpGpoXwrBfr5xyX2idU8xFcq/xCLJM
 QOOw==
X-Gm-Message-State: AOJu0YzL88L9nejgDCvtbDAjA5Tk3yptYAQPwohCCQ3AHJSP3NZbZn5d
 MluWgk9VyNlhqNwuO0jRs/n2Ca+UMpywo/eEn/MAZDB7vEmu4BAxFzNQz76H3jOEsCUwfCwfP4T
 4
X-Google-Smtp-Source: AGHT+IFOzJFJEWAxLCEtVKfA2YtCIGkTUomQQmvdloOd/r9evHxmqmG1h2gE6SGmvX2nP0QJcAMHhA==
X-Received: by 2002:a05:6e02:1fe8:b0:36b:3ac1:5853 with SMTP id
 e9e14a558f8ab-36caed43a8amr15683245ab.27.1715140943140; 
 Tue, 07 May 2024 21:02:23 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b006eac9eb84besm10142263pfh.204.2024.05.07.21.02.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 May 2024 21:02:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  7 May 2024 21:02:20 -0700
Message-ID: <20240508040220.28371-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1715140943; x=1715745743; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5nq85SwWh6KjU2zU57gpbQ8o+ReZj55oyEnhHRflMY=;
 b=iYS+GzyuxLE/ZtbQmSJygeb5AHew00u3aURAcAxhGergcTqznJ2ZWm6Q46T+ZdqMMy
 qNvo9Z5t1flPb45dpkVLmGFHrwUCr7BYf0thPwny1J6tl6rYG597Fzs/qc6XMkN38N4H
 /sTq6EROP6Y7JBZmnJAMIBAesEnb5jnq2i9hN1cVOsJKoFNL82K2Gs97FoyTzjfb9Czb
 ItBmVly6kYNSNb/cV4t1ba7kHZ7PLvUzepRm7LdY5+oEKldWAJ+5fL4O9ocbO3uljQTr
 Peb1Xi5CNThEGp/iMnhMYuRlJFGQQ5UrNa0bYlTqDfh6aXZSwn390qFUSQekAnV3RyXG
 UZew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=iYS+Gzyu
Subject: [Buildroot] [PATCH v1 1/1] package/mdadm: add udev to ldlibs if
 enabled
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a build failure where the udev_ functions are undefined.

-ludev needs to be added to LDLIBS.

The build failure was against the systemd version of udev.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/mdadm/mdadm.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 6de9467092..6365c4607a 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -12,6 +12,7 @@ MDADM_LICENSE_FILES = COPYING
 MDADM_CPE_ID_VALID = YES
 
 MDADM_CXFLAGS = $(TARGET_CFLAGS)
+MDADM_LDLIBS = -ldl
 
 MDADM_BUILD_OPTS = \
 	CC=$(TARGET_CC) \
@@ -21,7 +22,7 @@ MDADM_BUILD_OPTS = \
 	CXFLAGS="$(MDADM_CXFLAGS)" \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 	CHECK_RUN_DIR=0 \
-	LDLIBS=-ldl
+	LDLIBS="$(MDADM_LDLIBS)"
 
 MDADM_INSTALL_TARGET_OPTS = install-bin
 
@@ -32,6 +33,7 @@ endif
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 MDADM_DEPENDENCIES += udev
 MDADM_INSTALL_TARGET_OPTS += install-udev
+MDADM_LDLIBS += -ludev
 else
 MDADM_CXFLAGS += -DNO_LIBUDEV
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
