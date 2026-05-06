Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740A0CD3444
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4881660F7A;
	Wed,  6 May 2026 22:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvxDJ94N8pQD; Wed,  6 May 2026 22:34:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ACD660FBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106863;
	bh=ZgRVg7nCTsXoF390nQLPaePuLWp1P+uf78LePEJ4+ls=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UHOiW2G1sSDVT5e6QJmJ3FEKqklFU5lnFZGpGmpZRBMirs2enJKasBEvQEMWSvO25
	 ShMWM3leHL0W5gMJLqJ2BF1BT0EG9HFuCK6hO98qh74QTk+SMo9h0cw5dKfhE/RVGh
	 yiH/6GGzRsQZFjnx4rJefOyRkiD+PUvNUGzZzq0Lq6IT5y64L2GxEjcs9aELa6VSfD
	 2Gzhe0Divrs0wHAnNSk1MC/5AQomXq0hi5B8Q0gw7uMWbPJOUMSEY5bkZo6021KQVi
	 24Z9FBYaRPoeNrb0s14pdY4eA4hLNNLd2t8yg6XskXiG74fxRBbh6XBp/naNlICmfp
	 Q7oaGdhGlPHhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ACD660FBD;
	Wed,  6 May 2026 22:34:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 734D9317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6515C835CF
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iG0NOtfvdeIm for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6611783563
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6611783563
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6611783563
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:18 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-7de44ed7a11so195723a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106857; x=1778711657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hB9d6Q/k43XXnCf2YBChhYq4wSgtLbw8wBYX3r2UWn8=;
 b=BHeVUVYWo9tqqkgXbwz28Nk8f5oEgEnSUhfXrjYCEI7K5QqMfgkMUcLOkb05j8SiK5
 YZmB5w1NyHw82mGP7yUBlKjittjspqtEI4ZL6f67C8zsLesTIrvyTauFV3d3+e1SpF73
 Jmc7NBL6HVsVvyfW54szHzThLp7m6GclbG5/Di6O/av1xHa7JzVUOoOcTn74t3ceKOhX
 1tMUZgo0Pho4ys/PhllzW80XjGLkD6idjPMeAh1RZKM972fdZfYojmaJzzggxDBHmH8S
 oEFTdKvZHFQAWu7WElrngXAuHcLIdNPhFjeuD+6DyG3HfrPoEgmNRCEZmlkzLUKV4NX8
 rAbg==
X-Gm-Message-State: AOJu0YzYvMfqeL7rKZVyg2ka4zSWcW8cWt+ZMresrbWLvJU7Cxo5vlRx
 w32Df7G+UNoobqCC6WeX/myNYYWe/0v+HDeyvWZj7cebw94k3LnzrsmGm6o3ovhs
X-Gm-Gg: AeBDietKqNJ5azBONR8kg7qH93raqM8OSntV5EBUQO6N+bGxkNxYkHzvZG+uGc8jvHF
 nUmhKY6ggygMEuvjn3bWJ9DHvSg5lezzEzgxNT62OIqzmhcuLWHw1OmEBqaE8epctYQnswPTOft
 De3hEQXdesWUMABQs00jJtJ5gb6LwJU94WEVlqzkmAW0x9D59oYT4cMMvUdL8rmXULsRj0UJ/w1
 J4V2VwMRPA85wce1vYn+FfKIUAYji9luA2AP4gVyvtGtnzcrEnlH1HWB7NM/iOV8WAXbPnBEQp4
 29syM4NjBuWbgwc27lVSIr/PAP4YLJ3AeBDGCOeZ53AyvdyyBHqpJTRJTLX70oOR6q2hcZ1Qzad
 wy6YOP7mETrtH7yQ48voZG/lu51rx5RVcKBBINkV3J4YFjiIkFnuXsfLwWZTt4Oiz99QhqQEgd0
 i9qXBW1CnEVLF5VEjGebR3bWEojxP4Ed73zUvfnQuS1o6/PiRs+zCn2MwVLZd773B6Ylzakkbae
 H767v++n8FhSLRJ6m061aLdEYOa3sSPRo8xZa15M8/vH8iBGkaHyA9O8ChyJlyiK5fxBrpnbWPU
 IV7fcnk=
X-Received: by 2002:a05:6830:44a2:b0:7dc:3d7e:40d8 with SMTP id
 46e09a7af769-7e1df19aa07mr3000335a34.28.1778106857165; 
 Wed, 06 May 2026 15:34:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:29 -0600
Message-ID: <20260506223341.1759760-28-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106857; x=1778711657; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hB9d6Q/k43XXnCf2YBChhYq4wSgtLbw8wBYX3r2UWn8=;
 b=GwACyViqoekFlYwce8pFYNa7sjmbDjmJlGUPK482GixgryhLplR9r43BaDef9XNUv3
 w2HCFNyUjeKnDmXNFkfGq8y+RaK4gIvpJMavHDsHxL+GUVTcOmj5ug/5a3mRge+Ibehq
 D4olmGz9WUdNyL67SgeFN2SqwiQe3fL9qnC1/6Xqk3eSIXebWgJwBk7jLF6UpCXin4om
 o2vfpmlbqSwDm1Zw43C9IIl8R+wQjT72gmAk5M4sFEbpcXCytmMVV4uwCSqcE+CZdUXQ
 Zj511XL+pWEBtaGeefq3ld7I7cwm2WWhdNTc0aSwV+NlDsiUngdgVyUee9Dh2LrexcQB
 oNDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GwACyViq
Subject: [Buildroot] [PATCH 28/40] package/spidev_test: preserve /usr/sbin
 symlink
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
Using install -D for files below $(TARGET_DIR)/usr/sbin can create
the parent directory path and replace that symlink with a real
directory.

With per-package directories, this can later make rsync fail when a
package target directory contains a non-empty usr/sbin directory and
the skeleton provides usr/sbin -> bin.

The skeleton dependency has already created /usr/sbin, either as a
directory or as the merged-bin symlink, so use plain install and let it
follow the existing path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/spidev_test/spidev_test.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index bd138b0142..ba097fc103 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -44,7 +44,7 @@ define SPIDEV_TEST_BUILD_CMDS
 endef
 
 define SPIDEV_TEST_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/spidev_test \
+	$(INSTALL) -m 755 $(@D)/spidev_test \
 		$(TARGET_DIR)/usr/sbin/spidev_test
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
