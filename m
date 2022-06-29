Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A150FC43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 11:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD10F4112E;
	Wed, 29 Jun 2022 11:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD10F4112E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wq4hgNLKMWvg; Wed, 29 Jun 2022 11:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF62240605;
	Wed, 29 Jun 2022 11:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF62240605
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21D9F1BF4DA
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 11:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF87341A31
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 11:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF87341A31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4GAlxCtwZIk for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 11:32:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA42F41A2F
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA42F41A2F
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 11:32:51 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 q18-20020a9d7c92000000b00616b27cda7cso10320448otn.9
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 04:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+dIp/U77k0BV+oeQePKcycVyOUzz2CKe0gc5mo53kWM=;
 b=6owQg32/ZWhLKAfCH/cQ6Y02sSu52BALSsunpMwNNM4/GjLi6JG00TivgiOJl0anXU
 WXH2a8QDusrs83kClGojlOLq46z/EXlayR5faMaAA8WirsEeE7J4hiFOm8/+sjHK4UrG
 9KFC9jp7W0ocMFY62JsvNDkpD5Zkh4N7LB52zvuyp45dnLF1hPev58uOsJ+VVAyrFk9N
 A2VwFitHsMlXsFlTwYmqZ1Vo2JvN6Rpj5drqG2WzB1GHhvEhKdlwsrF/hNbpGXHOgDfO
 TPMrPEZaM4dEj/44QlEq+NfuF39f9u9fydhkQdLfV0yjG5m2ad71bf8N1/oaFeO8zPUM
 FCnw==
X-Gm-Message-State: AJIora9Td5LfSQf0HIkh5kXvqJxJq49bvBnIdHNog5BnvTrOJC64F90m
 q4jJm8Nt99goBCiu/j/dLHF5B7nQuj0=
X-Google-Smtp-Source: AGRyM1sx8u8lg9LF3QlOHK2m4ozqGpCoLUv1lrWxqt8sX2pjpESPf8QYaR2as+5jGIQdQTjd4qFLCg==
X-Received: by 2002:a9d:1c6:0:b0:617:865:c204 with SMTP id
 e64-20020a9d01c6000000b006170865c204mr387151ote.17.1656502370446; 
 Wed, 29 Jun 2022 04:32:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-112.hlrn.qwest.net.
 [71.218.105.112]) by smtp.gmail.com with ESMTPSA id
 m13-20020a056870a40d00b001067f7f5004sm10918915oal.39.2022.06.29.04.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 04:32:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 05:32:48 -0600
Message-Id: <20220629113248.2317891-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+dIp/U77k0BV+oeQePKcycVyOUzz2CKe0gc5mo53kWM=;
 b=EowdSecaAFquOGTaKguhZb4pTHQ4D8qQzEJEKRsF3XjpM9F9lyJRa6QokN0OkKcXdv
 WevkvQayl0ssXHm58JklPxpq7xTO5+hKNF309cZJHc/TBLIN3Kx723FghiGhfHbTT2Tb
 Y0lCX63rfPKMxH/iwHkY0uuwOYt4BCH6eNY0YY47ADXxJyBuNnlUWJhb3T508JVzGOlR
 BrNtZOdiXVQDNd9vCaOA7SON5Dl3AE4AgQGVPylmTbu8ePXdO4qljmpkwwR6VTBcV6uF
 m+/P6FU6OIrdZZD/xGqEwZk0OG9yK7U0kfXgtFkc9vU+1yPilhVERY9elxS3vUOxLpI7
 HZlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EowdSeca
Subject: [Buildroot] [PATCH 1/1] package/weston: bump to version 10.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/weston/weston.hash | 10 +++++-----
 package/weston/weston.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index b78a7c7550..951d62a100 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-February/042103.html
-md5  bc4abe2ee6904a4890a0c641c6257f91  weston-10.0.0.tar.xz
-sha1  b1a51e3bb7ee1d75bbf728c8071771e07fc97fdd  weston-10.0.0.tar.xz
-sha256  5c23964112b90238bed39e5dd1e41cd71a79398813cdc3bbb15a9fdc94e547ae  weston-10.0.0.tar.xz
-sha512  77e05530751e4f743eebf015ab5b78a1fcc66b774713b5e296cfffc488be84e459f811c85ac4280b7b63eebf4ff5c958dd7306376ab343e6b80feae16c8c35a4  weston-10.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042260.html
+md5  dac91aecc97a85bf9664dec0d5c90ae3  weston-10.0.1.tar.xz
+sha1  87cc339503f01317a0ca8d986b1b211c8aae99bb  weston-10.0.1.tar.xz
+sha256  8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115  weston-10.0.1.tar.xz
+sha512  688d843096a95b463161b98e85ca3443b31ba2ee49fc8d456a2780cc96f576e9d097054e9f361997a66e9cc8373cf29e406a742dae3884b3b50b26acf1710c8c  weston-10.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 90cf160688..76df9bf2dd 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WESTON_VERSION = 10.0.0
-WESTON_SITE = https://wayland.freedesktop.org/releases
+WESTON_VERSION = 10.0.1
+WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
