Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5CFCD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 650D9401CB;
	Wed,  6 May 2026 22:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfGairlQs-Nl; Wed,  6 May 2026 22:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8965841036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106837;
	bh=MbUGfkEhYWlvX6WjhykeyNw1/BTc7QOcKq/joVkIOdY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pwvJR3fLFVLQZZyoTMkjcIMRFOxMD9bDk8RmSUX4PFgaR0Lj7RYvw/ej20dzO/S4b
	 nkMUNKcJRrJoCKc7Gm5ywT+5m7RVmbU+JFAkn6YPRvl2ENED5kDzr8sbbcFiYp6mc0
	 P7RBWOs3ObHj9HkKDpaIN+mz3FzHAihEuUKmbEwC5D1UKhHg2IqGEvw+1bBZ+AxBb6
	 aRMxQ67f+280BRZKShioZYLpczJfw+e9mPzk35gVgQtDBkbMHrTxG6QYkRqsJvmGj0
	 /qkk3792M2ClI//pXFaELMhNSowraVnrHVLGIIlKyYeDzdFjpBaIR6UDYrsHvGUXBK
	 ziGp4U0oeg71Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8965841036;
	Wed,  6 May 2026 22:33:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B011317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5163E60F68
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWNF_1flNQ5U for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B19260F5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B19260F5E
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B19260F5E
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:54 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7d4c383f2fcso203341a34.0
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106833; x=1778711633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8EwMBfHeHp9ea8vj7m9h+r+JpObWNbWd5heZ2JB+D64=;
 b=Gc3DuK2SV+m8HTF+jG1Jt48B367NblnKwvijxabeG0ZkVM4vuyBHsRvkYZmfLAFBrD
 28h7iTZddYGzjXpsoQL3+nQqJvdQdXQReK2kiptH6eN2wojHqPQjmw4wPG+2qrLVdZHZ
 MQ7BwML2bX9NBXeJ5ppECHl0PIU82zJioA9TQhmVnfq/9oHtUVXNL4t01oFsOhTnyz1u
 awtNf2Df8pe0S6WY3q3wQb4+C5DWMerF2os6QV8EUuXHJ9cGZtgkUyNrEBY6wu1fT91E
 YEplktOABiE8Hpl4nxLVWEoVKZ6BLojVJvkxLNkKEXoqcwOyRfPoQFEYSz2hJxTnjvhE
 92nw==
X-Gm-Message-State: AOJu0YzfZ1HO7y3mQApK4m1syyxPkS/bnAeCJSAM3fYYnmGZLax43C2K
 S3ZFVujbcfk7artbBrdklZKBPSukqEq9Se0+/e/QGastUopaM87OYlcLNzDuJVtU
X-Gm-Gg: AeBDietduiTulPQZd+aVkW9e+vp8e4Q1c3EU8QJoJh3GebJ4K7sAsPdpRa9J7cHHAn/
 c4PNdCHhy9M6xR0fvYom6J72FeBuX1EhEbHJIG1AoGJfzRPuBvDqmJUmVFmZDvGG9h1nhIWWW9Z
 0Rd1csdbMhc0BYSgDHLy1OGzyHg+V6z1VGfudykvh+buLAlPXwB3SrxcQNervNjFaETby8+gJAl
 Tc/2jormI44PZGw0rWQoyKEIAqTXcDeK5/yhYXch9XsiM5pxkE0pmR3rNd/G15fOrBzd39d/mk0
 QxI/SxOI58J5TBTG1TCiN37j9n5KCMB+faW1S9LEc42+OeUOE2A8FrdRcWTjnQT2P5GMQ3pnnMA
 OrB62Rhc/VtQpuO2CEMVegXM/lN/k0XhCMl+gmzrXp3kVhYOwP5n4z2Jk/6YBzX81SXU4c5c8P0
 94yCQM5a8T5LtDNunbl/cclsfuzRCXAVDqocgGXYd8dkfWZAr6bUdbb6FZxhiv/RQE8W0BbAhhy
 pbH09YdWJ1y64bW6kDQonbaMbU590+QC5L3irBB3qExY2ns+zGm5CPjMY2z4K/6oDxje1ir0+Rg
 oZWK2NpR0Gf/aKxfag==
X-Received: by 2002:a05:6830:d13:b0:7dc:cba3:e8f2 with SMTP id
 46e09a7af769-7e1df0c81f0mr3187988a34.19.1778106833143; 
 Wed, 06 May 2026 15:33:53 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:06 -0600
Message-ID: <20260506223341.1759760-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106833; x=1778711633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8EwMBfHeHp9ea8vj7m9h+r+JpObWNbWd5heZ2JB+D64=;
 b=LeQewBw5fGWDfSWDCS/eX0o9ItRxlJrnqlDqxVUkHbRcglH00UZqhVLYwjyW8a7I5C
 e1l1dJF6B82K5u6mejhwGV4uo8+pf2AyemYy/0vRxFh/xDCMO9+8d9VyNAxTn4oFID6s
 R7Ikd9e7209MLalZuDe2sXT0cgkQpQdtM4wFCIQPFvrvS4RUduKhgB0C5LcUh/CE8SM+
 61ea4Z36v/DK/5ZDzsVNpK2Nn/78GF8f/7/CZoPycznBxSEQNCmMc9ETx1yTNA2CGiE9
 0YQWh2uGeTnSyHxxu9ltxNySNKV3d1dMBPdszV4uxhDVZWju3nBWyUAgnLo1RLP7PKfF
 11Kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LeQewBw5
Subject: [Buildroot] [PATCH 05/40] package/dcron: preserve /usr/sbin symlink
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
 package/dcron/dcron.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index f0c3efbf8f..7e70e69c14 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -14,7 +14,7 @@ define DCRON_BUILD_CMDS
 endef
 
 define DCRON_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m0700 $(@D)/crond $(TARGET_DIR)/usr/sbin/crond
+	$(INSTALL) -m0700 $(@D)/crond $(TARGET_DIR)/usr/sbin/crond
 	$(INSTALL) -D -m4755 $(@D)/crontab $(TARGET_DIR)/usr/bin/crontab
 	$(INSTALL) -D -m0644 $(@D)/extra/root.crontab $(TARGET_DIR)/etc/cron.d/system
 	# Busybox provides run-parts, so there is no need to use nor install provided run-cron
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
