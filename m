Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F71C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB95D8254D;
	Mon,  8 Aug 2022 15:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB95D8254D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYZL9Dcs1yqD; Mon,  8 Aug 2022 15:14:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4DD982531;
	Mon,  8 Aug 2022 15:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4DD982531
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98BE91BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7376660B00
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7376660B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHTjq9NtlZGF for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:14:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5612A60A46
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5612A60A46
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:14:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id a11so4955514wmq.3
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 08:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=SJJSROyokMhlnY1HYUOwEyv1nC1c+vscXcNrnP1p8dM=;
 b=cWdhqppgxo6iAFUPvEctkK4jTWlL6IDeCNWG0l9QixvTe/7VW8repPlh7g3unHcnis
 Rwzlc7SJCTx4hQxzaOYdzhXl+mtF272MkoOkGp9o5OA+R8ZYqkYF7KdZkGrduIEyFwfR
 YxO497hD5xq51n2MML3apBWzoe52mBFRpHdB4r7w1Ib9N+B45QmwTeAQmOBBqyYiOjXG
 WeAl84511imtATS3ixv8rFjowqM6DCE6qqfcRhG2/O+1p7Ye5BVCHbLn1eKbOoJGcVC8
 YpOphJXKg7oTVEfW0YXrHcqms1EC5YNz4fjhih9VAS4Vf3tqUDTgq5+IgM8cv7SVwgRo
 fyrg==
X-Gm-Message-State: ACgBeo0pQjs/qSsJRXHw+ASU7ILpu2TeX7f/Rwc19Nmmto5oYdPI81d5
 9eP18954Se7dlUMajhioOc/r4SArUyc=
X-Google-Smtp-Source: AA6agR6CaxtRopOiJdgKL5hI0I0GltMwOLywCv8LhIPPXm1SgIVCsjs4EVN/SD8c/zZy/K1V5UDLHw==
X-Received: by 2002:a05:600c:4c06:b0:3a5:4eec:eb4b with SMTP id
 d6-20020a05600c4c0600b003a54eeceb4bmr1849081wmp.151.1659971659045; 
 Mon, 08 Aug 2022 08:14:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adff051000000b002217e3f41f1sm7551628wro.106.2022.08.08.08.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 08:14:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 17:14:01 +0200
Message-Id: <20220808151402.1694762-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=SJJSROyokMhlnY1HYUOwEyv1nC1c+vscXcNrnP1p8dM=;
 b=AHkSG3IBP3o3OjZNcW3tqsAN1+/2lp+8BZnCwQUS0qVGeH/oiamgzlnTnOCs9Q3oVa
 VdFPe/5vC46Ap5ktOWpYWISNAu4VA5rn/fHa6dm3HwhaDN0MKuXVV3/KHd8bUajT84NA
 4NeUsghD/LJ1hCcM/OoAnmz3nlL6JEg6GS0Zrtc6022c6mP9MMAAYgc5t+obDkD78tDv
 PnN1XnKOgAeYIjHhKBuqqKCc137W9rOdsglxu+ArB/aCRsOW/VYPTdh0Mpgh0LuBwXEf
 5tXCfj8u3aEF+HBMurCIMJnWN1gcRhyYR4pElkXvcgwsYou/GO0bQgmyukJqniKGsQp+
 UWfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AHkSG3IB
Subject: [Buildroot] [PATCH 1/2] package/serd: bump to version 0.30.14
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to meson-package
- Update hash of COPYING (update in year:
  https://github.com/drobilla/serd/commit/0e7053de7086423484e5a8f2c0db76efba4ed257)

https://github.com/drobilla/serd/blob/v0.30.14/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/serd/serd.hash |  6 +++---
 package/serd/serd.mk   | 12 +++++++-----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/serd/serd.hash b/package/serd/serd.hash
index d64a2aa271..c8a45a0831 100644
--- a/package/serd/serd.hash
+++ b/package/serd/serd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# http://download.drobilla.net/serd-0.30.10.tar.bz2.sig
-sha256  affa80deec78921f86335e6fc3f18b80aefecf424f6a5755e9f2fa0eb0710edf  serd-0.30.10.tar.bz2
-sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
+# http://download.drobilla.net/serd-0.30.14.tar.xz.sig
+sha256  a14137d47b11d6ad431e78da341ca9737998d9eaccf6a49263d4c8d79fd856e3  serd-0.30.14.tar.xz
+sha256  13b62d3705cabee6a21730eb24f773249271c2d95e9ecbab16069e729d4ae147  COPYING
diff --git a/package/serd/serd.mk b/package/serd/serd.mk
index 85b16f6866..7c4f971145 100644
--- a/package/serd/serd.mk
+++ b/package/serd/serd.mk
@@ -4,17 +4,19 @@
 #
 ################################################################################
 
-SERD_VERSION = 0.30.10
+SERD_VERSION = 0.30.14
 SERD_SITE = https://download.drobilla.net
-SERD_SOURCE = serd-$(SERD_VERSION).tar.bz2
+SERD_SOURCE = serd-$(SERD_VERSION).tar.xz
 SERD_LICENSE = ISC
 SERD_LICENSE_FILES = COPYING
 SERD_INSTALL_STAGING = YES
 
-SERD_CONF_OPTS += --largefile --no-coverage
+SERD_CONF_OPTS += -Ddocs=disabled -Dtests=disabled
 
 ifeq ($(BR2_STATIC_LIBS),y)
-SERD_CONF_OPTS += --static --no-shared --static-progs
+SERD_CONF_OPTS += -Dstatic=true
+else
+SERD_CONF_OPTS += -Dstatic=false
 endif
 
-$(eval $(waf-package))
+$(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
