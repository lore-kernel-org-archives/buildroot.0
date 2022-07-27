Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32842C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C823760C31;
	Wed, 27 Jul 2022 13:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C823760C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpqzKafyqMpf; Wed, 27 Jul 2022 13:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB4260BDE;
	Wed, 27 Jul 2022 13:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB4260BDE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 579B41BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33298817AC
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33298817AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nd1Hje2ODcau for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:39:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B24817B5
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06B24817B5
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:39:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h9so24285370wrm.0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRiwh88NGrecojPfxBn9H+vMLIo4acq6FZsx/9/fbaY=;
 b=IhQFfyjDJmEVw0thpptgYz74DT+v5Vf7gUOW1pdk50ptyng+3mVAutkPZTgvsa2GQ1
 9FBD/+7UF/w91Ttk+S+LtirEVcf+G5DuNLiN0/H++NpbULLiniZ3LqteKlbvumWxTTTJ
 bEYxmovHKhxufD+b8LnEAHQOCZvabzn7BT1c/5Vd67t05r/rxR+3bwJQPZ5OzuRBsWDJ
 ncbUbvOiFFPh+wLAOUSRzalzbjJVr0sqo5SllopFfX5MZcb8+H/Ikjy6wAKYhsZ0x+Gb
 nOsLsA+imZqkzkhQQABsY4ovQvvq9Kn+9mey7PspSTYW1+ZVth4MsqdeaQru9L0Zu0oY
 9u9g==
X-Gm-Message-State: AJIora8PtW+VBex53iWH30EjOg6go8HG0oH7XWDwsl8dOjpCz6tLU7CJ
 fgHDtTs5Enh0nBe/G8yeYGHW+bJgBYo=
X-Google-Smtp-Source: AGRyM1uYtXfFJrB5d7/zydrSrCSQYiITlsYlxU5gW1+nVKxbqCOumcRtVfO+gKb4sUk8KweWsBjhVg==
X-Received: by 2002:a05:6000:100d:b0:21e:69b3:1901 with SMTP id
 a13-20020a056000100d00b0021e69b31901mr13997326wrx.622.1658929172533; 
 Wed, 27 Jul 2022 06:39:32 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c1c0300b003a31b00c216sm2783324wms.0.2022.07.27.06.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:39:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 15:39:29 +0200
Message-Id: <20220727133929.1325636-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRiwh88NGrecojPfxBn9H+vMLIo4acq6FZsx/9/fbaY=;
 b=dH73hL4CZNAR9vuV1zY765abcjIwnIsKbKKQroM0T3gE6FxP4Da/ZFDzKF8xyl3owu
 wZyCJ4oFQ2q+pWACRBy8yw2goloyFeS529WdIPfHKoETsjpVduKpq60PADDTbv11c+Kl
 SCOjGLA/lRPbpUSRNBa7xOjwBot0p4HOpzltBMS1SHLlriA8flyvlzli1hb7vPXrQ57a
 5YX+aLvU07CatCUcbnVfpkzCZPpspTb2mlQdPia5YCPsIvjXqUzSbnTur7x3PHg4i2fm
 Djj4B1XieMHFlIqjCB3pgQhIRwVub5U3wyAOi3VWZD9sC2QBcjikUuCH2PLCm0tIJJVh
 xidQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dH73hL4C
Subject: [Buildroot] [PATCH 1/1] package/minizip: use minizip-ng
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

https://github.com/nmoinvaz/minizip is a symlink to
https://github.com/zlib-ng/minizip-ng

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/Config.in  | 2 +-
 package/minizip/minizip.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index e4d185d9d7..98eb4dec16 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_MINIZIP
 	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
 	  MimarSinan Codex Suite 2002 tools, and compatible sofware.
 
-	  https://github.com/nmoinvaz/minizip
+	  https://github.com/zlib-ng/minizip-ng
 
 config BR2_PACKAGE_MINIZIP_DEMOS
 	bool "minizip"
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 61936e0568..5adee7c494 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MINIZIP_VERSION = 3.0.6
-MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
+MINIZIP_SITE = $(call github,zlib-ng,minizip-ng,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
 MINIZIP_CONF_OPTS = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
