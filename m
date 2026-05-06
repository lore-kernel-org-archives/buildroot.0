Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885E8CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59240833CD;
	Wed,  6 May 2026 22:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSjzC37kcHaZ; Wed,  6 May 2026 22:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7847F834EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106849;
	bh=tZlMQy6aZnxiXtmg0ijbxutE1+BHaiTris6gA7iggFg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=n0TKCFTUNmzNztE15COgMuf6+5IVBClGdXvInvUbgTQhi8StGENfGjb1i3tgI6iQl
	 73NKly/RiCUpc6yxHpJy17+8zDKqmsDPozhgjfoMWkjKNhXNB2lkkZspFHttfuNe7f
	 X1ViXc20ALJuf2UMG6F5CS49LYi+JmtmiTCuTf0WoLneom1I/yIu7uSqzG2w7yA90v
	 T12hlI+Hi+WbUhjM3E2FZDfJIcfagipjlYczB0mdYY6LF70aHOFbl/4EQWkGZittul
	 dvqQ4YI2pvtnIbip0rQSiSZ4XL3u4ExAPuGpAUePeFf2Bg1LpglcZZ05QVmtHE1x43
	 Gg6+mGLR/lLJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7847F834EF;
	Wed,  6 May 2026 22:34:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68FE8280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A995406F3
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rECtLA4LokQ for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 54829400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54829400EC
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54829400EC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:04 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7dea20cf21aso231068a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106843; x=1778711643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GyjFYNiBNWl7brqhR6f7K5Klmiu6CF/jOdJCeLqn21c=;
 b=e/EJGC6YFLv3eb9BE1arfITPOqMlHz4IbCTH31kkD86+tJYMb4TAd+71YbdHNCgJPG
 HokZ5FCDbSMc1VSN3tKkEZa/FJFlfQ9FVuT+1y7auYM/rLgZGOfSm628vq2j7ibA4U3U
 Q+DiewGbtL3TJ0V6iIrgnuvINO6ZilQg4haCkPgvorixUAKnlPH/Zc98vjBV6t6ivshH
 vdPc5ESqe8/LmkAanWR3uW1LVqzFil1/UI0q5c0wG+g9SPukg/mg09s3+KFm5E+TH9uC
 BwCDrjUc5qDnKlDo93Va99Q4HRxwGJRhyhP2ElknZyVL7hTZvEjVYn5bCO+D8hu/4ghv
 d1IQ==
X-Gm-Message-State: AOJu0YyHds6TGcTxt6t9bZlBGe4sKPb2MuKSI6prcJ4o0fK6av6Xs/Rp
 FCrzkLYv8dR+FDyaD9tPY2AxhEMos6nKj0RppPmhXPVk4blozgbAIUZtUhGpRsAB
X-Gm-Gg: AeBDieuo/p0iuV/RexEGP+ppQmVjFWAxAFNPRsKCjT1op+/Qyi4sv52sdQrSUOqi8lM
 G1evl+t6VWdwtNBC4DeEFbKwCTq7aqPh72MwrCy/FweBsRdcvqdhzExmWVAmlaqH/ed4nDSKoub
 GQfA5S/4VO9qzoTyfhvV0IfZmJ0g/3JUx+mVhD+DWoK/Nz9Jg7w5i9hEdqcnYPeukAKuLSapXgw
 vxOSfehCt3w1oLJk2tFMH9xN2yAmQTyrfQAxcLqd0t9OceIUbWXfWjybtSUZ9m+lG2zpzEnB9mP
 EjrMcSqDZslTU5ca8CRTNCRLc3HhB3K4LkYYJNMSyfJksO1TxEj75NsHDlR9aVMnh+s23my+JrT
 QZ6K7dDREEf2zu3Jx9ANWR5WPFpGq5Ox0bLw6VAUfQL2LS+xDescvKhjBzuVmP5kftDfR1BUQ9y
 viV2NV2dLVp0lXHggwfqjspGXdAQs1QE5yoxPr3Jkho+V5kUG6zNGs1OV+LfS/mUBbV+hC/kP5m
 El9NE2aUYCMW1SkYl8InI2DFCLGlUYm3/90s9qKKxcRtVWTDHnt6OBFBvjhCs2dIMTuFWUnthT2
 boCw+bPGajIg4t1r/g==
X-Received: by 2002:a05:6830:4108:b0:7d9:b58e:55f2 with SMTP id
 46e09a7af769-7e1df217e18mr2935914a34.24.1778106843143; 
 Wed, 06 May 2026 15:34:03 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:16 -0600
Message-ID: <20260506223341.1759760-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106843; x=1778711643; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GyjFYNiBNWl7brqhR6f7K5Klmiu6CF/jOdJCeLqn21c=;
 b=Y9o/JH0TT90GWi4s/sneTC0w3UHfUDFxl++kOwAZtfghdNCO4bkXNV9581S6OTVhhA
 LAFzQqV0Tgxa9CpAxCylbvRWQLMzzLI59WcEemUk4v9c7vEd4eRhem4viR+nu9TioqVc
 pF9vmQvLkBVR2FJ0MgVTI16YTR0DhvcE05ta2XeismRfPUYFo1lAAcjfAKxHqcSYtKDP
 ziJ5DC4qKEnOiuBPvs0Ggo11o7+LJNj51d8utInDha//msNIH7+b1+NDWwU0cE6W7WFG
 6CgcG9Ztj4ROIRNlv/qJdoYr47Bvt9f5AXSbPjnNJAgOg5RZAdG6MPhIDzYeUumRWSRF
 Pd6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Y9o/JH0T
Subject: [Buildroot] [PATCH 15/40] package/libss7: preserve /usr/sbin symlink
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
 package/libss7/libss7.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libss7/libss7.mk b/package/libss7/libss7.mk
index faa147c78e..6baed4cf28 100644
--- a/package/libss7/libss7.mk
+++ b/package/libss7/libss7.mk
@@ -49,7 +49,7 @@ endef
 
 define LIBSS7_INSTALL_TARGET_CMDS
 	$(foreach u,$(LIBSS7_UTILS),\
-		$(INSTALL) -D -m 0755 $(@D)/$(u) $(TARGET_DIR)/usr/sbin/$(u)$(sep))
+		$(INSTALL) -m 0755 $(@D)/$(u) $(TARGET_DIR)/usr/sbin/$(u)$(sep))
 	$(call LIBSS7_INSTALL_SO,$(TARGET_DIR))
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
