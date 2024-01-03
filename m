Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3FCC3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 19:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C82A5417D5;
	Wed,  3 Jan 2024 19:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C82A5417D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1KeucASsPJ1; Wed,  3 Jan 2024 19:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F4CB40872;
	Wed,  3 Jan 2024 19:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F4CB40872
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 693FB1BF286
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F3D7404CA
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F3D7404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCJQBbA4b5RB for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 19:23:18 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 124F44092F
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 19:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 124F44092F
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d5f40ce04so61501915e9.2
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 11:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704309795; x=1704914595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R62EMMXNBVz26xfw+C56NH3J3NIrhfE6UqE9Qqfcz8k=;
 b=id8aWVO8AkL2bvJGZc3v+rQhFHt2junXZahuT+Uth2QKbHxUvPK/y/cgUPOb0gRwsC
 U+m31rivbcSw9NHwTRQz4fH+gJ55JuSmc8epAErAiBRnKwx0uQp+0OKqXVc98EvEnSKN
 K9v5EpCGb05083EtO6zmQHw6Ie1j5byRWfVeRGaKb4IbA7nJGya+xjmdWelzZtuhYYKj
 /4zaycJoKoXo+ufXQ9tFesr22spgGYhFcApuMpYKbOCLT6cc4gvOHn1ghpwTtxZv1qHY
 RPn1L8bfXI0eZQH3NFtgGt87ds+sSUWQRm0xETKOdgCSue5US2I9oLjsw84pBYg0WAgF
 BMwQ==
X-Gm-Message-State: AOJu0Yw0Ypcfah29ouESDhuCs4t9sJbsSb0ngGwmiUu9OX27+kcthqj8
 iZDLmU9/0gpiSLV1+2DFisQlNqctByo=
X-Google-Smtp-Source: AGHT+IFN42h0oIHdnDvOH4df1YQmrIQGq6Le52LLF1bK8Yb+97+gDRrrxH6f7oudd8oVfmdNwsYMRA==
X-Received: by 2002:a05:600c:1c0d:b0:40d:5b7a:e31f with SMTP id
 j13-20020a05600c1c0d00b0040d5b7ae31fmr7151020wms.39.1704309795237; 
 Wed, 03 Jan 2024 11:23:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b0040d579817b0sm3207106wmo.15.2024.01.03.11.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 11:23:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 20:23:11 +0100
Message-ID: <20240103192311.909037-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704309795; x=1704914595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R62EMMXNBVz26xfw+C56NH3J3NIrhfE6UqE9Qqfcz8k=;
 b=OYBePlk3/+hjx6z8XxLLNBcDnebgOMmxhLpgW5jixjEvtxa7VZDx527mdx8EOMtke1
 7mM9Lu0bizLY4l7k4N337uI81521d34XR5gYIE7uHAbwzpB8sM63vjGJUgJZPvsco4Ox
 +vWkMDDo4tQRNmJwhjQHGb5m9fmXb4CQ9sMkyD7JolynqrL/1Fwi5kASg1DykoV5KZAC
 kjODFKGymPUH3lE6RdiyzArbcOtYPH863iFkKyYtJblXZLFuZDtPc93IJDzB4x35xzhb
 Z1FayhtU2LJYvwrF2J3PMnwpFbqHFmdnWUot7a+Q6nqVJpsq4m1EvFDxWIPVLGGnwLy6
 mcwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OYBePlk3
Subject: [Buildroot] [PATCH 1/1] package/stress: bump to version 1.0.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use official tarball and so drop autoreconf

https://github.com/resurrecting-open-source-projects/stress/blob/1.0.7/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stress/stress.hash | 2 +-
 package/stress/stress.mk   | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/stress/stress.hash b/package/stress/stress.hash
index dc1785b6c7..ac36122594 100644
--- a/package/stress/stress.hash
+++ b/package/stress/stress.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1798e49ca365d928fb194ba1b8e8d1e09963b49e9edb0a78bcbba15750bb5027  stress-1.0.5.tar.gz
+sha256  e63adb57597e617c14ecb0d841b5d990460796d9e9ec69bd56fe645ef02eb239  stress-1.0.7.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 99a50f349e..53f01b3b0a 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-STRESS_VERSION = 1.0.5
-STRESS_SITE = $(call github,resurrecting-open-source-projects,stress,$(STRESS_VERSION))
+STRESS_VERSION = 1.0.7
+STRESS_SOURCE = stress-$(STRESS_VERSION).tar.bz2
+STRESS_SITE = https://github.com/resurrecting-open-source-projects/stress/releases/download/$(STRESS_VERSION)
 STRESS_LICENSE = GPL-2.0+
 STRESS_LICENSE_FILES = COPYING
-# From git
-STRESS_AUTORECONF = YES
 
 # Stress is linked statically if the --enable-static is specified.
 # However, this option is always specified in the global
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
