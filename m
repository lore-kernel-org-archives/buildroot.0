Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C2C61DD9
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 18:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44BCC4058A;
	Sun, 30 Aug 2026 18:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2dmjlpwJCDA; Sun, 30 Aug 2026 18:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788113262;
	bh=/nrXKC5PjYDhz9nlOB4poKX/K32ZQ/cOvRlC4ZfVMIo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PFfGZnsZAVraMr7v4qVpPU/33E1Sb1zZfuAU3E5fG/6d3vOyKz8aTdRwMmku7umJ7
	 UiFaoFjdLtPU3uiAtDsajpVPeqs3gTgi9TDPBGzXgAK0HUvtF1WvgjsN50LgGB3/pu
	 Ve+/HgRi11yAACj+pGrMl8yJncKP0CpD1c5xGr2UH+ZPJGElbzIjAxPBC9jifjpOb1
	 UvDMll4/AIcbmaD+b3broUkJBns8QBrSQ03J35B9GIPzhTDrbntiDBIz7/HJh3taAq
	 kZqKKdCvoVcJCgURiJLXeOfE3raeSE8abzvClLbOiSUl3htULuBhdnaMoW78a7ss8g
	 PBd0Ly03U+zIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 522124043B;
	Sun, 30 Aug 2026 18:07:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5094F2
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C383C605D8
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WopCDwlC_faU for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 18:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hnYzQE6S
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E10BF605A9
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:07:39 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48436668d20so391519f8f.3
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 11:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788113257; x=1788718057; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5diu3DthhpAg1ijEdL4TrCtNf7Si9oiNcHZu1jjNbxM=;
 b=hnYzQE6SAKGGM/rB7Ea+7A9PCJWro7bp3hSml6tVdKd5aC72+VWwo+LUgNxgswdY/F
 /SsBqtanivEWMI0whHT33+jdDjx7p21VrYOMNfPQ5FP5s4EdkNiliP8mYECczOrOG4ZP
 dQ6bWyL67FjTViscgekphEM2XIPLAJ6HY9l9F6Tl1GA/u7nlLwsFk6annidwGYByXbuY
 LAQ5YcvbGk5zO/TaH0sd7izr7Ns80hVbGms5MuUjbkJ8rEz7qtTkNjRXjXhk9nCH+g2I
 muSX1kHDquLyWNBydxc7kZTzb9d5oDcEXyY3wG/sQrTagrc7SxhF7d+UHF9Jk74d2e0Z
 3HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788113257; x=1788718057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5diu3DthhpAg1ijEdL4TrCtNf7Si9oiNcHZu1jjNbxM=;
 b=AAahBA9sc6l2szcs10q+IHMrrhhs8dkTqJENWM3qg+JxcnIvXbOq3KbMgZobMQKK4X
 KFVbxJm5YSPfOdAtRHcnxdT9KM/0u6lYr2bnSzqu2GioDJq2iSMdvdN81GwVO19/OgVZ
 qa+WF0NTO0lQ45ak5iYETscUhY+DAQeNcobERSqXTF31fA88g3W6ihTVaxBfsPUJQE+e
 wKmHdGrLSPz6QqcdLNl/nuefNka6qcnApFRSgrn/YlYxP7MjcuKVWDbnIlMm1hUyb9IP
 4fFLb8BBYkt+2wRjOUzIvNMFXvSiQAlPY5Mgx/uTy79SqxEetc7rPF/V/8JLncfRBs8D
 W8Kg==
X-Gm-Message-State: AFuF++k6wvzPvU1D4BwtQ+vCoqSrF/EizCwCTCA7SpsPldLOTIqmrYl9
 Dl7MHouG1rhZEBxc3N2XAwimZTNU6U5Adu1ZQO9X2nrL3xtT56/kpywE4XXO/g==
X-Gm-Gg: AYBFou2o5NjMf5nr7OtUu7mQ87dnigx55a5dkTYPcuQRNndJGyhFi9txD/EAw+EDihG
 72wyQRE4nV7xnNxcn8F5dYxHOXxvgLokJzsmebWJwEMmT4xFB9mvyf6V9Ou6PVuqksVO7SYBd+2
 29QyY/+4/gLBqzIh+pnONf8Y9m70OTRd/wxI6BvFV7OTBMRIX25bR8K6YPi9n4KMOI7acpK1rpK
 zd6I9zSzG2uh7CyHNWfa/QZi+H7TwepXulvbqD8fjlWFB6LDp/wZB0wLhyaLUzJHeSRD1agr6QY
 G7tj53iPzy2JgTtj6qIqP3t/a04efx/vN9Z0cmw0hiYKDLehOF0ZQ8VCNCwQjD612ho3rn71ymg
 f0/5ZzO9nOdKKmO2Kbh57jTkPhwPij8Hl4zD5OU0f1tlQeTvXE0A5baPqzwE5TngHbvUye2gs0S
 jrbN7xaZCJlZa+X7UgIT42JC2hD4oe9C5On9XLEAE0UfvKa6THw2hwDKu4hbc0SuMYraRMEdb3B
 qOk+xEoBItbn3YA
X-Received: by 2002:a05:6000:3106:b0:47f:8d71:210a with SMTP id
 ffacd0b85a97d-482f79cf4d0mr29530834f8f.15.1788113257158; 
 Sun, 30 Aug 2026 11:07:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb2e6e8sm19071327f8f.32.2026.08.30.11.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 11:07:35 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sun, 30 Aug 2026 20:07:13 +0200
Message-ID: <20260830180717.96967-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/civetweb: fix underlinked shared library
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

The install steps re-link libcivetweb.so but do not pass LIBS, so the link
falls back to the upstream Makefile defaults and loses the OpenSSL flags
added by the package. The correctly linked library produced by the build
step is then overwritten by an underlinked one, leaving SSL_CTX_free,
EVP_Digest and friends undefined and breaking any package linking against
-lcivetweb.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 package/civetweb/civetweb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index af221e9133..4fdd94ecc7 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -93,7 +93,7 @@ define CIVETWEB_INSTALL_STAGING_CMDS
 		PREFIX="$(STAGING_DIR)/usr" \
 		$(CIVETWEB_INSTALL_OPTS) \
 		$(CIVETWEB_CONF_OPTS) \
-		COPT='$(CIVETWEB_COPT)'
+		COPT='$(CIVETWEB_COPT)' LIBS="$(CIVETWEB_LIBS)"
 endef
 
 define CIVETWEB_INSTALL_TARGET_CMDS
@@ -102,7 +102,7 @@ define CIVETWEB_INSTALL_TARGET_CMDS
 		PREFIX="$(TARGET_DIR)/usr" \
 		$(CIVETWEB_INSTALL_OPTS) \
 		$(CIVETWEB_CONF_OPTS) \
-		COPT='$(CIVETWEB_COPT)'
+		COPT='$(CIVETWEB_COPT)' LIBS="$(CIVETWEB_LIBS)"
 endef
 
 $(eval $(generic-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
