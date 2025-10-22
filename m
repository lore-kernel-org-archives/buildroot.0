Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4EACCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3B740A75;
	Wed, 22 Oct 2025 16:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kydtnq3suet; Wed, 22 Oct 2025 16:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46BFC40A86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46BFC40A86;
	Wed, 22 Oct 2025 16:35:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35BF3DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C29760B54
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TX0Rt-FT2CJF for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2157C60A58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2157C60A58
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2157C60A58
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:35:02 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3ee18913c0so1362872666b.3
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150901; x=1761755701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fs6LfzfdIKnOXo5lmA42LfM5QVr14TZzszr5YGixgbs=;
 b=nPmK/qns6e313irIh4t1pjS2s2pvr3JozCi7Z7rpxJPHf+CNSDRr0MLLAGhziSTW8E
 VE0EtzZGelawhTCxTsu9elHVqmQT0KpJr1lHIPazE2SREqlb8eF9kZIkUl98/rlP8L2F
 2Ij8M/pa9WfDrC+iXAJNaxBZdS7gqCDKl2atPclygiohGsO21zFckA8tzqy0MYFQWgOr
 XRpwRS+nGJJrAKLlmUPlIjKeELYAHTfack1E9jTWvBK5ceatZzAEVNpDVWIoEWcVatl4
 NjcXKmjuzoR4P8oCkosf+J0Ng78R+7CnPyBNJ/celSqypd7uPgOksVQ8WvppzalzqH4W
 LcNg==
X-Gm-Message-State: AOJu0YzxNBavDWjkCQp23moLB/VK5EHvkdgqpkiKG9E6BupPJwohAkWT
 e+TjICdBUpMobhzTheH6FcXGjaziEX6Y4R6IyEC4G/tlkk1ZtKwN5TWz/kSZkCFceVP3Mou8Oiz
 wTRMg
X-Gm-Gg: ASbGnct4F2y5tWkTiLLb4ByxdkzkRAnLRcNgFww4ccQDlZvj8vRLSidJAAIdRFKC2Mn
 5bp//Jp8fCga1gv3xkNiQarFojgDWADIor24s4BGY1yrIthu/0JPb7ve+YWuXWRv8y5gw5+iigN
 C1ebz9yH1XRoURMnHJZHxjFV5F8LgwiyTIUOwbrKkZ63VN4wZdhIyUq6asvlI/9hAWqlmyONlwt
 FvRYNxu37/spj2mjqihhuyAs1f1TcSWXyBbNKzyojX60N5v+QdLNiwLEE40Wzy5cQEJwfKFFG5k
 +KDchtY+cxUx2kS3Td6xU4te6pFFjncly03RBTujoL+GiF8NgA6INPCvhJchLB10lm+xg3J63g9
 wpgYLRxU5XdPmm55y6ATvmt5HKXmjxcujrIKBxj4QnwefQOa1IrMS/aYeiAJ5+lnlIrvU0Y8ZdE
 pwgXEXfYH9ZNOo5+mGTTKQFzlfLVvFlPsgEg3I55Ctdo0P9VMn
X-Google-Smtp-Source: AGHT+IE5uLNuqf4Zmfa2CJaN8oHKR4XUT3xVJ81+o2TWYJkYnwo2AuBMIinQAN/UsvE+0KWziop3FQ==
X-Received: by 2002:a17:907:7f1e:b0:b4e:fc90:47a8 with SMTP id
 a640c23a62f3a-b647254f626mr2561816166b.4.1761150900776; 
 Wed, 22 Oct 2025 09:35:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d3501ed5esm190988166b.70.2025.10.22.09.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:35:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 22 Oct 2025 18:34:56 +0200
Message-ID: <20251022163457.19215-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761150901; x=1761755701;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fs6LfzfdIKnOXo5lmA42LfM5QVr14TZzszr5YGixgbs=;
 b=P1f8j/frrsYvSsfqDYSQM7HQJWIciaHFtue/Gey6gRyr0qN+68QZ+p7CTKITCmMIYf
 1K4BI7xLGWg/VjpAfuOkyNnB7GbA+SCBNHDVaZdvPFlh7aPZsLI2astbCizIRv+3Ikwc
 efcN3KU+ECFlCQzphIODssWeYDjFpBZlc3Xtw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=P1f8j/fr
Subject: [Buildroot] [PATCH 1/2] package/libglib2: security bump to version
 2.84.4
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

This bump includes the security fix for CVE-2025-7039.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-7039

Release notes:
https://gitlab.gnome.org/GNOME/glib/-/releases/2.84.4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 9ed0b204eeb1..129849b21b9f 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.84/glib-2.84.3.sha256sum
-sha256  aa4f87c3225bf57ca85f320888f7484901a17934ca37023c3bd8435a72db863e  glib-2.84.3.tar.xz
+# https://download.gnome.org/sources/glib/2.84/glib-2.84.4.sha256sum
+sha256  8a9ea10943c36fc117e253f80c91e477b673525ae45762942858aef57631bb90  glib-2.84.4.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 7eda9742c1e2..3382790bb330 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.84
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
