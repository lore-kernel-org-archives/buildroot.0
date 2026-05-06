Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216A6CD3445
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF7B483566;
	Wed,  6 May 2026 22:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNRYZB6TO2Bt; Wed,  6 May 2026 22:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CCEB835CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106859;
	bh=PHL3dghRhUbHnUzw2uclUOuo4Pbo3C36e9bZY+d+zg0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SfB8UbDR3cIc9qSAgc6T0quDOCYE0y46SYjOuLdHYndwzw2NXtziibNn8PZswapDo
	 l1sPFOqZeENe4QURdxArORXoc69d9My3ion0KeZqEff+JF0u+SAtSgbZMzNz8jm7ri
	 2ecRUO0rr6oMloE5j3CuWKTBKleKLEZ19Dczc6F1qwXCejxRgtiOgoYMegisoqmLSh
	 Uhxjs/GdGnP5z4fLU8UG3fA/22Dr+n+UcL9/7js/CcYDVzvcDZIG5VdqknLwYYeguD
	 oJxF9SLhEf3NKfkMNwNzseoB1a9MB0oWZljj8tpmN0EGz+TuDNkOHhjHq3l6HNJwpd
	 vO/+U6d5jjgPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CCEB835CA;
	Wed,  6 May 2026 22:34:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB5A317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44884835A3
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vo6jkzh88Gt9 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CB2783566
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CB2783566
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CB2783566
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:14 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7dbd23bc684so155295a34.2
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106853; x=1778711653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1v4B5ftbvH2u/wLynQvOEuazBaQfjm2774mTJRs4N1U=;
 b=XSBKKUZF7qHIX8FXhAMmiL6Yyn9+VGO5/WgFV4M6XhTYrYqibyfWV8qUfVh7cfenrs
 o9uSGUsH8k7/czryNirLCUt0CVC6pB8fsTvmf32Gw8p1lRUPJJ+RJs/1SnAX0leQiU2g
 BpLFDKpqmlp+KyXWyPFnDYCIx6P6Ax1TyTA4zy9i4kcJOVqL06tV2BOLhykHeGBR8yJQ
 iWREqSmXQCYB70PQAtAjdAz0ASX5pgyIQ9o1FgAtaVsCA8FMWVAbI+lm2mPe4kRrTPpO
 grboOHbm4nMTh8lJjOuIe9vUcVwOfn/csN0/V1XsGrKNoPphkqQ6FiSGfEEtUkcI7USI
 X7Iw==
X-Gm-Message-State: AOJu0YyOHb2pAVV7n5dJECDeU46nxKXg6aOeylF6rP+rLgdosCucxqE3
 yXlwxj6QnecsOUyx7avouKOXQ6hbbw/VsV9LtDqER/N396nso6q4Ri05uF6iQrTn
X-Gm-Gg: AeBDieuUsy9a0ZSVLVd3ITORg8Uq/LkpL4leOXGVo0aQV5UXSmR5d0N/gSyCQBPROXA
 OqyAPrxJc4wObYW8qb2rcr9q95gwcLNeSkRZqR6wBhTeh5d5G6SgEoZMJB7GNzjsBKIO3cQTdXt
 Uau5YbxaQShlTsMbQF+/QYADdVdxVN7zjAZ81+Ah0rTKhG0Zne8kgkxb6qc7/QlVmAS9Ua1Bcpv
 Q6l9BfCh8J1h4YOddQZuMvjY8o2GVc9DxDOSVg3L+ZTreGMSQvDFGgv9U7z9m2M1RMiX5UWqqnl
 +zLK2WMiPmCpZCNjcDUo4rIWf3/KJcZ2evGFFgF/Gkg/iTkhun6Q2MQRPHp2rRrf1E1jx7uI4V9
 95vASE8qxSjLjyRpddRUZQnhkDPyWngIrGbcUQdNw80ee/61e9sQ1msIUOOWCZncvYUP35jRl4p
 zKbhXyFMq7dE/9N7Mngpdw2DaSEJVyYRdX9xyEUcYdlGE6+70eX2ZCiBigsGhA2vbcXfKCifsq+
 R6GvOd0kAvoeD88QwifrFEn1LEcoPSKFdlG+xlxiOOXomy3PzBAR0RvdMQaDHeWhCpJimWIO3De
 W8JWErJRVRzvAVZCOg==
X-Received: by 2002:a05:6830:3592:b0:7db:b5c9:2d87 with SMTP id
 46e09a7af769-7e1def36698mr3142598a34.11.1778106853182; 
 Wed, 06 May 2026 15:34:13 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:25 -0600
Message-ID: <20260506223341.1759760-24-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106853; x=1778711653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1v4B5ftbvH2u/wLynQvOEuazBaQfjm2774mTJRs4N1U=;
 b=O7tfa3mBKW1i+pExHXK+kSex5m/onFjobtpTDiL9Ilg7ogBjAjNnwB0Mw0b9CqL7nN
 5JfMJQ4TAjXWw9VPRbRfrXL84vvxRu+YXAV/xiYo65IraMkANeLRlQsbAiumoQ0TTbNy
 iqRlh6OicdJ857b7ewtVtt/RTnXgmgARp10wopaXFu+672DgNlvCrDusUkE/YUNi2+GT
 lW+jqqbaJlAc02h388I51sq7qXOgh5M8i356w8VU+SAUsBXMR8zHkIE41FzRCGIWnRxO
 RiTLujCi8SWDTJvKzoM+2oILTXI100X153F4+ZjM4LOsVmrjkPSJ3ICH2WNuV2ROhC0r
 yJ1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=O7tfa3mB
Subject: [Buildroot] [PATCH 24/40] package/pptp-linux: preserve /usr/sbin
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
 package/pptp-linux/pptp-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index b6c740e710..b03a8dd41f 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -19,7 +19,7 @@ define PPTP_LINUX_BUILD_CMDS
 endef
 
 define PPTP_LINUX_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/pptp $(TARGET_DIR)/usr/sbin/pptp
+	$(INSTALL) -m 0755 $(@D)/pptp $(TARGET_DIR)/usr/sbin/pptp
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
