Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C1ECD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EF3F83487;
	Wed,  6 May 2026 22:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccCzl0ILxBbv; Wed,  6 May 2026 22:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C1EC834BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106846;
	bh=kfFlt9xXk5TD1F4TvfEjxNLdk8KJxJUmZuxrNKW5jOs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JVXxeX8TP6XqPNq4thO2gA/KUmFlV0jDm7EK9CCtlQBb1hS0HETkQ3VzlS43ZRjeo
	 8Jc0gBBGOAqj8sBYQoMLEvGFhpO1ZDnJAmnDUrQePHnHYmRAx0ds0GKnLZmQ2zQATT
	 p3LESt99g2E0D0ufGhnQc+xmUQGBEL+8GGWmSK4NpBM/dt3wHkEJ651QS5+1qFr1I7
	 POHYGHIxXC4OkvckNadwWwFuQ5VKqnr+Ziq/va0ByMRrTpg63ATMYq8SlXyHw5Dp1k
	 U/FyISbUYZMyjBti6GTLnnGWiGHGlSEnq30Dx3qyKEHPCoHQ2mwer2D4tUazSfcTMD
	 RuSKOYKb2Sfbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C1EC834BA;
	Wed,  6 May 2026 22:34:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E05F7377
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D280560F63
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGICmJ7DO1iY for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A65360F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A65360F6E
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A65360F6E
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:01 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-7de4ed0593fso123719a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106840; x=1778711640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0nT2wqSLoJgHKQ/vuOYiipu3Qy7EZB24JTYacfQFhC8=;
 b=nrw/OtbcFV8LCI+az+Y7G+s6jwk6fY9ei2XCsvyBR1yZ8F1ktqOMIHZuAjSWuMzmiG
 Ly4b/cuXevXNEur2g2Z9WxrmWy2UVKCmfRmXyE7tqeKmTeGH/2jVaDxXk8ZKrl98nLi2
 cVSnmqplwUkhaD7WQTpDSvnyWKtYbanOqli0b2Lg5rhxHcYsTYbCfuFVr3cz5iiErQRo
 stYh1F1EfbN8JlYTMvt8qnKZ1Pq0DaKRHAJCdX4fqX1IafuFLqqgpBHkPfDzEmoj9hjj
 EjZGZ/5YnOTkR0evxqXM56kV7yj38Bsd4vDizwg3rOpT6kWLVMKFxDWHqR1xpPT940N6
 ZUpQ==
X-Gm-Message-State: AOJu0YyRiwJuR1R6RFSxWvy/nzqymVuaNoFmDy0a10bR07cBqLs3151E
 X4ETrdJY21XB6TUddVHLEBjnqveTe6dpY0kTv/THEpupzs+zcHSk4bScUoqFcMgO
X-Gm-Gg: AeBDiet3KURZfHBPQFbB7qLrtgkCRKXD5yDZ4tCmisT5k5ZHuUMzedsCdzkBOcibl/v
 1Jn8sPRIkQ+9Mnb4nompFM069AUj/3wpynXZcIlKqUoEAuwWzyhl16RnvNlfX8P5VmCCgtzkP4P
 NvcJ0oLDH6w3xmxarMrOSM3JhjFK5rTlmptO1kYBrasDsvzNBvOoY09O6imC8HlZ6XWBs5tAJXC
 GDW+l8h3e7rMV8+yyHFyxJtkebnNcuW5mfIMS6cF0+bVwv/+YyaQrPv252QlXhGar0ijvLY0z84
 eWQo9SYh1AVfc3iNzlV+RJcnjGAv4+XQuiffmKsGoZ1tcMMXF08EL+t0Nooeg/5rtU+ueVa1dgV
 mSlDJaJFbRx+0MquUkbdmLizG143yZVAAIHKWXGYXvmGyMKrhoD+vry2VUpwFQ4G9MEzIVuukNn
 ro5wW912TCbr7aVZFUP9lkDi2G7bOUpMGGhA/skLFTIHJAP1ZJtLia2MyQ14BIoJZWen1OwTKrb
 YYHT1wTkVAcIQWdn/00bACxEN8bHOOq19N3Wa0cL54KSC7KqfvVH/jNNLT5YFn46+dQd8fPZNPf
 8StJJXDmZOKUqDRdfw==
X-Received: by 2002:a05:6830:2992:b0:7dc:c620:aa0c with SMTP id
 46e09a7af769-7e1df1021c5mr3158494a34.25.1778106840316; 
 Wed, 06 May 2026 15:34:00 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:13 -0600
Message-ID: <20260506223341.1759760-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106840; x=1778711640; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nT2wqSLoJgHKQ/vuOYiipu3Qy7EZB24JTYacfQFhC8=;
 b=OqR0bxeOOMnbNEpq+fELZ4pCkovrwxgJcdJKrLQL/hiWWEqzlL4vzurMd4rjDMAiXK
 4pvUhm+jM3F5ojjK/vs3p1sXa15xtO99RR2i6fgrE27/UTKb524GQcSJfsGh6YD961FY
 t6SO8/74bPiHWJCrr1TR5aYYlTxvBgey+kR8iKlKNabnBj2Qqehlr9DwoJR9SkDbhhWJ
 qSLoyd7rBViBYHqFIgdcNpRbmgVoRRPmq5G0mBg6QWFY+inOtfjTW3+splgeXVg18kKL
 D8DfhP6fPD7y3xpwnzFwcO4Z7W3K9gc9FEsuTcjHOU1sygc/op6cJHQPw+XK35/GXVQo
 bkdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OqR0bxeO
Subject: [Buildroot] [PATCH 12/40] package/hostapd: preserve /usr/sbin
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
 package/hostapd/hostapd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index d83b574fad..76cec9b31d 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -149,7 +149,7 @@ define HOSTAPD_BUILD_CMDS
 endef
 
 define HOSTAPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd \
+	$(INSTALL) -m 0755 $(@D)/$(HOSTAPD_SUBDIR)/hostapd \
 		$(TARGET_DIR)/usr/sbin/hostapd
 	$(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd_cli \
 		$(TARGET_DIR)/usr/bin/hostapd_cli
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
