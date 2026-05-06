Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8C3CD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB26B60FB4;
	Wed,  6 May 2026 22:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qj7KPXRi8wc7; Wed,  6 May 2026 22:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 082CC60F6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106854;
	bh=hvgJobQptd8MeJ6DywCVMhDJpa1+mQ6WTbslgeEfx94=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mIJ7CnGlXaHSdrKW5wauakxM7ToouWdYvLfpWPD/OlEz1UYPxkdFxm2Jjgoo9eEtA
	 ve2EormhfawKt/yYqj8+Et2WN1Mbqmn8GqPb5/AxDXiNAZcS9t82bScCspzwylIMZl
	 zfJg16w+RYq9U+RPZOXmsyjJTKxLjE+g6mbX8VLxGpySdRuHvJ9TfIRzulqcfSjIyQ
	 1YyQUPchqFABzyoTGn69FFIvr2BBVi+ezLDfDmHkTXuyj5m6p7eR/g501kcmiowtBT
	 ur97oz3IUOxz8tx+kTj6YFa4Uz+n+u9rMaWqlUgn3iXxUTTLAiQmCFbOozwWISezw+
	 x8DISSbBYG2ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 082CC60F6E;
	Wed,  6 May 2026 22:34:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2E59317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8B20406F9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCPVOsoIubuu for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2875B400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2875B400EC
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2875B400EC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:09 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7d4be94eeacso256435a34.2
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106848; x=1778711648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W/qInaE+IVCh+ROJdpuT3uoSpEXX+0NGoD/SHh+Sflk=;
 b=acEbApsv6i9iwWdWVdBhWQzsQH0m0e/uiwkv2mY7fCbAv/JpyGj/kqCHxGTKnae41T
 PqFyNQrkCl3VD1zbRqngqDkIlbYaO8wiFtoBzZNQ0M/efxACka3EpjPvXWwakcx9BvnU
 XIhGtf0sLh1oAFnNHoU0wC4pvlG8TGYzUmcIjoYhdAoIw4nkpZCrBcaSjL05v39KDRQg
 ty5p8EP0YDt6e3vBCpaR0piorB+YG9vwuXP0f8xKH1Ndlr5ie5LTS723jvCi8F+JpcHo
 mkpiudClnuhYUNAcyl/WkQfhJ/nzr8r4SWnDiPtU/mMnvxLRnOWrodMJnVApX29Hq2y3
 16Bw==
X-Gm-Message-State: AOJu0YwLjtM3FqgngsvwQbwOHhl+f0UMtwbFBel2solg+TSth5tXtlll
 3v8RYdL453McC4AXoAetyOgH2WYUfr4l9iCvNNiEKReofNrtiZaWU7sEUTukwX8X
X-Gm-Gg: AeBDietpByrsFsjlCh7a3B9zHQ9OvTqxEJz/CKqihnpVodxC/rc6B3WSnnWR2W6qiD+
 Ej1rH8Zm2snV5mJ2XCvuThIXVYXl5WUCPXSUNP8yUL4J9f67JPtycHmV5/9t2/TnirzRFiktZL2
 9dEqzWLYlh/4TxqD7pMaWt6MpgXjaLAhFCkQZlYrWZSlSl36DEqdfZApPRPVLRuoHAQfVRQE4QZ
 iuUNZS/wHxULT1Iu6xTmsNoy3vyGDqY9LZXyggZhQsB1S9ClrTLJKXI172Iju5szWBKmjl3Swwc
 tRyzPO9JLtaJQMMl55DkhxXb6izesKRaSU9Uu0PdJuqWBgqnwTv5aOzVUDD9ZaduJ2z0n0srtSP
 FvkIJDUPlH7S0UUrLD0aa/yz+0/lqeQpja220CqTjxkM8ci6n45oSr4A35quqf03fnHDmUHiNUk
 cD0Ats01GoDLencCGjD/MZpe1u8yfpXAsexpuNjtA5Se0t9j/ax23W6jsTmgpEOu51fg9+vVHmQ
 A+iuzs8dU7dablwLq0aM+luywlpFP0COxZr0fwaFvvq2ZWSea0lJifC6dEorequp22108ybccfz
 L2j2TNXifwEdEi+DcQ==
X-Received: by 2002:a05:6830:378a:b0:7dc:e37b:b5d3 with SMTP id
 46e09a7af769-7e1deecda2fmr2908939a34.7.1778106847851; 
 Wed, 06 May 2026 15:34:07 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:20 -0600
Message-ID: <20260506223341.1759760-19-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106848; x=1778711648; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/qInaE+IVCh+ROJdpuT3uoSpEXX+0NGoD/SHh+Sflk=;
 b=o0HNiWhcPu2HKhvftn/F6VJSCWs9NH9+WHkJMQiWbagmk0jYvLuWMqBUn9Y/LN9t4U
 a95HFtcNJy+FU3x9jpV9j+5FXeyGL9CINWOhMvaT62X30YdR87eu2s9PEK7qdl2HoyS0
 BAYfvXifX6D0a1N/N6/WlF2qyQbGfYOW4gEZjMHcU/aSx3Rya/9tNBPZJDNZfiuxz/WM
 uWZRDXI6aWVlY/no2OTzXm+D1G2p0vsepy3lTbZ2kJicFOt39kldJMZdHcfHkHr7PD6R
 lbgnk/63WXJd4V9ePYsgXyHyHP3Bu8eip4bJjz6wYAQzz2GMMj/rVIHptbXz2z1vzaZp
 Mrfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=o0HNiWhc
Subject: [Buildroot] [PATCH 19/40] package/noip: preserve /usr/sbin symlink
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
 package/noip/noip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index 8b57d82469..3918849ca2 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -20,7 +20,7 @@ define NOIP_BUILD_CMDS
 endef
 
 define NOIP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/noip2 $(TARGET_DIR)/usr/sbin/noip2
+	$(INSTALL) -m 0755 $(@D)/noip2 $(TARGET_DIR)/usr/sbin/noip2
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
