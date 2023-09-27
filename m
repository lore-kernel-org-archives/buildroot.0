Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83518E82CD8
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 20:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2DB60B6F;
	Wed, 27 Sep 2023 20:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D2DB60B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDQ3wWYDJDSa; Wed, 27 Sep 2023 20:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AD6061460;
	Wed, 27 Sep 2023 20:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AD6061460
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 448381BF35B
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DB9682EA1
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DB9682EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0mdYCOBZRI9 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 20:51:09 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D68D182CE4
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D68D182CE4
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so91262115e9.0
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 13:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695847866; x=1696452666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2uq9K14n0IRNN5uZY5C5si+0GW3BAv7nbxRt+FhWcNg=;
 b=fXuTLwOwWY4cB2shJ04gSDYIzFAx3aNmCGd+4U90q3McTHViX3tSQfSwnV/cpgltse
 iZpo2Pk/Lt2xXfLAKS5za20Vxdo8LZr04WSpy7r41p0oH7hJrk4lw56N585NWy6xmhRO
 qQAYh5kXJYfhE1ZBPvx3ZuW2Mvd55/XXHoH+4IxFNB3zTZGpPhAzvgOwzWHog4XQAI1c
 NTz9vRJAwkeHgB2UsjHcmOZD7GPNH7WKKiYBkGZvk0P9TJvofKYwdmFkaYElJT68pFB+
 XqaofsEcAWgui8ckgi3/2F1c4G+Dza125n8aC9sIaYhHYL+/Zlp6nYLDsTVRl5QkD1/L
 cKZw==
X-Gm-Message-State: AOJu0YzhRbHY8uQGPDFtBBX1KAXq8FCAgjKRU+k6sq5wEpEGjXDaR0vz
 P2ScCU2a9OZNuAu1PBbQVbKEP7b9u0Y=
X-Google-Smtp-Source: AGHT+IFka4E/eTB7YRTOP7gRGoPhNRvmfR0eQB93GsMvE2CUksInCmsYSv5xK1Nsrvu868A3RTgJRA==
X-Received: by 2002:a7b:ca4d:0:b0:401:dc7c:2488 with SMTP id
 m13-20020a7bca4d000000b00401dc7c2488mr3051293wml.11.1695847866284; 
 Wed, 27 Sep 2023 13:51:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c2d5500b004053e9276easm15349227wmg.32.2023.09.27.13.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 13:51:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 22:51:00 +0200
Message-Id: <20230927205100.640507-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695847866; x=1696452666; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2uq9K14n0IRNN5uZY5C5si+0GW3BAv7nbxRt+FhWcNg=;
 b=R02/6InmLPlq/NjDVsLAZ8Jb2FD+Dy5t6EhplDPmHuM7F2ooLNiXtuP7um0HLG4lIF
 O0BVBk9Y9mVh+p0QFT+pKN/h7phD81sEFFQyYtaCqk3SvgIfrO1oNmRvZHqFwWblFGRe
 e7OCmWQJwB0H0MMG+OWZ+y/JKEB0txEc92xNW/2sp1xCXExvfFg2AhvclUeIv4JrpZxW
 ClMQ4Lyj1dSQNtC421im6W5tHR7424WC3q4zExtjV14iJtqdW/08n3SjNA8uh4dZqGtF
 edkji7IfNMmiS9dsuyrWDQaUvTiFohAtjJTEI5z1Tqh0wT5zEtNC2Eh2ycitX9SHGTDB
 y9+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R02/6Inm
Subject: [Buildroot] [PATCH 1/1] package/libyang: security bump to version
 2.1.111
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2023-26916: libyang from v2.0.164 to v2.1.30 was discovered to
  contain a NULL pointer dereference via the function lys_parse_mem at
  lys_parse_mem.c.
- Fix CVE-2023-26917: libyang from v2.0.164 to v2.1.30 was discovered to
  contain a NULL pointer dereference via the function
  lysp_stmt_validate_value at lys_parse_mem.c.

https://github.com/CESNET/libyang/releases/tag/v2.1.55
https://github.com/CESNET/libyang/releases/tag/v2.1.80
https://github.com/CESNET/libyang/releases/tag/v2.1.111

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 26a28d6eed..3658b20e4e 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  761cfd959342b147f6a43a84c931c7fde68dd3a1ad540a0e5302288b204f073d  libyang-2.1.30.tar.gz
+sha256  3e52b922fcf371933ad7de1686ad83504e3358236e7817b5af795b0db52fa221  libyang-2.1.111.tar.gz
 sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index f160035c09..5533c7c68e 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.1.30
+LIBYANG_VERSION = 2.1.111
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
