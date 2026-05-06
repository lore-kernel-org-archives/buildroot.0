Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDA8CD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B31F383487;
	Wed,  6 May 2026 22:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlVYwCeZIZhs; Wed,  6 May 2026 22:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA9BE834E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106865;
	bh=yPDG0/Xxc/agTeYhGIFsBw7bUxWeC/dmY8Ed6pkaQoo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nHOJbJR0N6aCoaMnG5WHx7HQ1y7oY9rmXdsyzFuepw5uHKA5a9LCWvvFKLh0DTRB9
	 s6QhNL4Ug6xuqEJDMMoxMZ9wkDRSfAFUcT+D1WL/WL1SsJlQ6gXyU82Tjd6cc/z32y
	 O8g6+Q4vT5MD/sysf7oG4jBLgo9Gt//JRQ8Z8deUWz1tN3FUDcFh2PZF0CZLkOXuID
	 EuuTId9Tirilz6l7tb8gBPjK2VcyRkh/n4NJvQib6GHodZzJ9goE4NWZjZIudggcw1
	 S4KSmciW3CWXvgQie1tzGZibw+xGrVizmSD4UO6YHcByOBWJGKM7LRXnDKlr8p9wpa
	 udmrF4i2pOa6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA9BE834E1;
	Wed,  6 May 2026 22:34:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 947DF377
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C984106D
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KnL7eK_NfHu7 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 626FA4106C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626FA4106C
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 626FA4106C
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:20 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7de431da8fbso201176a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106859; x=1778711659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CWi4a1e7wVgB3IAmtbVttYehTRtRCjEDCseQmAxYdlc=;
 b=srqNS4lqyWDAwTM4Al9lzWI7FoLOHs2ysabZK1WJ9IGyv2yedgWVFxndwOWr5ZOJ8f
 R9iLlPtPmFFfxX2vzVVAHU7xKa8M5mZOTRIG7badv7TC5Wb5/4d2m70keSpjTGxXJZLr
 +Nem0BMKm8CXtpykJDvxmtJhiwBeG19/XV/tA87o3fRFeDl/cKRxhWLidkcicy04sFnO
 AzDj+wMIpo/37QL5sGPtaS+BezeaYC+EFRHyKhXRReLATGe5B9JHtZIXt82EELpshDNx
 R/WFEiX0ivDVmzegVIOZSgU/x9W1UpBCLygn/dnGfIkgjZWne+/Zj/AM4536WMhpNtH9
 5cUQ==
X-Gm-Message-State: AOJu0Yz2TNV/ds7WmGbf2LtqmzzGD4Yg5oahnCkjvORbq47bklUn85Tb
 64GAZQEEXm5tQ9SX7U5mw++k0skTDifgF3MxiFde9Z/IisDF670NLMOTQRt1j/3N
X-Gm-Gg: AeBDiesRO860suuTHF/B8RBVuI+Vy6KuXHsyKH57QQDoQRi9ubkqKT3+S6dXfexmvMH
 R+s3hMEFIifkRBG/AH/IhNx4X2FGrbkaldNowZHEGcHqZu0uSf8Lx8VRi6CuKT1frXXX/ArNHaH
 PgnKDis6Cdx5zGL0dHhkOUhhwTXt6I8TP6QZVUC95vSE1UCAYlonBYuEcqH7S+HqntiT9hOYVNa
 mBkalAo7zqFKXLMSwcjHxYpZLdpT+u0DWJdqsFD3NS5hYH3zTq+kEeydOFZA4slrKEdNMkW8tWY
 KWnjbFyctILI+DRT3YFFrYw/gLtsTIKlpogiLNIC5p7ap5ydVDjuXmeTGuMSwr7cly8Lw/XxYLU
 2Et+V/d1ztfNZglU0+040NywOKiUE28M6Ta7Jt+rQyC8L0sOapUpAv+Z8pF91kVBDBmEox5DHq0
 9eAso6WtKn52Lvl6+c6kJRSLTHD9hPCXfwKsz1J4qyyMKZLeOdYvBbVvu4gmkAIjt4RMLPB5IFi
 63Q6lb4/zgX1HMI/whqVK5gS75nf38RDn1RAIgzhyG8AFRZTEiGYlLh4bGld7hIUpOCvIAsJVvh
 CyMTzL3lJjnphK9LrA==
X-Received: by 2002:a05:6830:d13:b0:7dc:de8a:b93e with SMTP id
 46e09a7af769-7e1df20e3a3mr3245724a34.25.1778106859076; 
 Wed, 06 May 2026 15:34:19 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:31 -0600
Message-ID: <20260506223341.1759760-30-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106859; x=1778711659; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CWi4a1e7wVgB3IAmtbVttYehTRtRCjEDCseQmAxYdlc=;
 b=fodwtw1c86Q1H8ENBwxLyOSpGhsbEzMwM9MapTFUAQlUYMOumYBeLzK2o8ihk8utWt
 npj7CdF7iqdQW3AijBR54xkDd1UuqNWWupvu0DJylc0UkbT00qW4Y9Ztft69gBDHbfE2
 XLT5k25yM2bTkxeDs2z9tZcs0u1Plut8fW/n0KGplzim1W/k3lwOYdRD7xj+4moYo/G2
 apnoFRAWG5YRhe4WtwW0PDUvF+vJ/bh8c7yn2zhEr/42/mjwgPJRbDB/uI+bLzN7STNE
 YPsev4hCrKs51HUxm/4lyEw0pqsUCx569kWfXSXqVDA9ZA4ilc+029Xy3p7yZTzfY4mq
 SCkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fodwtw1c
Subject: [Buildroot] [PATCH 30/40] package/tftpd: preserve /usr/sbin symlink
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
 package/tftpd/tftpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 73ac7006a4..05ee31790b 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -19,7 +19,7 @@ TFTPD_AUTORECONF_OPTS = --include=$(@D)/autoconf/m4
 
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
-	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
+	$(INSTALL) $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
 endef
 
 define TFTPD_INSTALL_INIT_SYSV
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
