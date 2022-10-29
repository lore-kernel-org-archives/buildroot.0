Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502FCC433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 08:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6B0060655;
	Sat, 29 Oct 2022 08:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6B0060655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YL6AhLcIh6kf; Sat, 29 Oct 2022 08:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F3C605EE;
	Sat, 29 Oct 2022 08:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33F3C605EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3791BF59E
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 421924054E
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 421924054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fnNNLq8Fgey5 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 08:00:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B68E4050F
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B68E4050F
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 08:00:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id o4so9261331wrq.6
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 01:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SzNEdDH1xz61MhfjY569kYvjPtjoNFwnHNq9CIE1eT8=;
 b=QhXIfObnCsLaji1Dxze6+OjuHySYKdv5IJbJ86suQwDbH9SjbFM6/VWVQaKvIzCUVg
 BySlX5I0QqVNziNTwYZFHegE4wmC4YThqmlxeGxaMtu5gmeljcVqsDdxmPljLy4Dg3Pn
 IScsUyiBaU2099UI4Huc5qSbGhoeTe+yMt3RANaorS7eZhy+8Hg+LgcYxZ65RP5+NA+d
 fWhW6Igrj4WDPMYm8mdP2yskU/j+9LACK+W3zbOAuM3rGvz/IHKfUWfxe/8FFqRXpfzb
 pGj9PvrVck0U5qWHqBzsm2KHzXV2jSfOFKf/BAV5Lf/acW/LoOQYqDPOuK4aG/U8Jap+
 eiYw==
X-Gm-Message-State: ACrzQf0iPx9qDioqgndlK/KpOmI6RL6kYfJYD0QFdlgQ6vfu95WZbn6u
 d+7NKJpqp32JcXD0FzNU5KDSp82rTCk=
X-Google-Smtp-Source: AMsMyM4doU1dIjehxQMToKLNw/4ISBSR00/J9zGiDVXGlaTOVLbqPbJPfIBE8Vti3Wp2C0TSmBqNNA==
X-Received: by 2002:a05:6000:1ac8:b0:231:90f0:217e with SMTP id
 i8-20020a0560001ac800b0023190f0217emr1682260wry.525.1667030436794; 
 Sat, 29 Oct 2022 01:00:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h5-20020adff185000000b00236863c02f5sm803448wro.96.2022.10.29.01.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:00:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 10:00:33 +0200
Message-Id: <20221029080033.17864-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SzNEdDH1xz61MhfjY569kYvjPtjoNFwnHNq9CIE1eT8=;
 b=lIOVxsYgAh9RqhHSTQUDoIXHFxsttPM7BHaAEhNZaj1vBGxVEjPPvvR6WiIHh0aPeI
 18wC6awaodyBfWrG2ZhENpRL4QVkCwQeGyHDtDGgsR5WK5Xgr7K/5vRGn5YUETKd0gmG
 4HpJ77/mYi4RVFo8/MterCekeVTQJxTDG4iMl8RTlpkLEsKbz7o8A8CUhHoRuO1XDnIw
 t1yb5C+KQYyZcewA9TNejET75OiIRJlGxRkVGh63vxzrNSZHDXg/Ujsbj9iOLU/Tp5g8
 uT3V9didLacXL3/RkDyVB88MiaTAZyZHfRE4n6fKP3PBBm9jo2AK2ANQFClM+9MZEYBv
 BBpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lIOVxsYg
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 5.5.2
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the case that the WOLFSSL_CALLBACKS macro is set when building
wolfSSL, there is a potential heap over read of 5 bytes when handling
TLS 1.3 client connections. This heap over read is limited to wolfSSL
builds explicitly setting the macro WOLFSSL_CALLBACKS, the feature does
not get turned on by any other build options. The macro
WOLFSSL_CALLBACKS is intended for debug use only, but if having it
enabled in production, users are recommended to disable
WOLFSSL_CALLBACKS. Users enabling WOLFSSL_CALLBACKS are recommended to
update their version of wolfSSL. CVE 2022-42905

https://github.com/wolfSSL/wolfssl/releases/tag/v5.5.2-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 3849ffb9fc..65d77ca659 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  97339e6956c90e7c881ba5c748dd04f7c30e5dbe0c06da765418c51375a6dee3  wolfssl-5.5.1.tar.gz
+sha256  49c6195462cae034efe6c86268824ba515682508a5f5199358d56a4168a82cf0  wolfssl-5.5.2.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 95d4f47952..d9fa72ccf4 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.5.1
+WOLFSSL_VERSION = 5.5.2
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
