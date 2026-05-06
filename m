Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B6CCD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D8F041058;
	Wed,  6 May 2026 22:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOe6TD-idQAA; Wed,  6 May 2026 22:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F296440CED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106855;
	bh=jBjG0fhvsktztnByr/4sbgVzqh8nkCP4lVdW6lpbW64=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JIynoDQ3kI/IU/+S86rd6tKOhekDRD/+9MtYW8H1RSqKbz11WZwx42GmqeAvNy3c/
	 XNBkzPz9rxeJnXpjad8RHTrAp1taXfPKffnQP1wsDr29szTYjR3HZ689FYDECrfm80
	 DCaiTpnXXxtPL4nfzmWuOvk2OeSajVK68I4trFDP1wMN8JVIYevxmbbp1JfPOXZ174
	 EfCV0mNIR740i48LhVEdFqaxxZ0M+nDeW1jR9r8pc7cZ6qOJpr4CjvZ7vKHOYSE4p5
	 oRllAa8MZzFdLSFOqLVkXtR1eRDek6XOtO/SRhmf0gTNo6iITbY9PbUN8Csv1Gy+c9
	 Yit3KEAMVzdBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F296440CED;
	Wed,  6 May 2026 22:34:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07DE7317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE0024077C
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3xebcq3u-8s for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47F6641042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47F6641042
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47F6641042
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:10 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-479eb8bcacbso97601b6e.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106849; x=1778711649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oK07AfdmhuutAkFVPLfeESGT9VyKM6aY+vtH6Se9Ocs=;
 b=C2PKCLBUDPDarW7JUy9hdUpALGFI4Ttk6y6QkxviVDQ/CHnh8hJLCExePo1Pljy5s7
 T4MYB7hIhWsiPe3VTDOXocapApJwe+UgiiLGa3595tzcTFYJgHMrZAxo9H+RwgG67zOp
 Y3UWNE1aHXNVpYwdzUbqGCS2PfuZGNMHjcSGrsAYgT2He71DFZMgrJDJFHHrAvQRNZpT
 l2SnFEDJk5cytrcBI4RC+VerNK2SUX+eJyU4TBAB6tArLEZ6jZfA5SfdR6xYIvsCt50o
 qt4BQq/AX1SnRLFhBaEQI87alux178ZiZXxOZeif4TUZAL4Ej5YTWLKYvpWleD3jCdfD
 6O9A==
X-Gm-Message-State: AOJu0Yx3BWwsuTs/cydnpUGD3H1onvg/gMAQlDZ/9ECYHCSRdZU9b6/L
 7wFEWTKlDqUEOcHVkWojrljmYDwtHqthpHyb4h0SztCSitPj+xZO7oWwyhwTLReW
X-Gm-Gg: AeBDies5pw5rKyi+eNV3nh+wPvPy998/097glA1QjFVf3mhZxyWUGbPxYUeyfgP/FtY
 EOLxq2UBtQvRlQTQ00K3sAuFwzFou7g7ttWuaB3wKi7wvR+VwPFxGex5F48vO2DveCgvJ3jjRPM
 0tjCZNgAl4ETnF+NtMw2votyIfjvno5DK6Ltvc0VprOmset7j8ymJPWArgotHWYOBJ5dnmUUri3
 D3vVJpaS8meZnvHrxiVAruSgOOSKtukDGWCsrfX2aGTiXMyP5Qx+xCOSj9AQHgYry1ldJr5L3PV
 pD+wHqsopxyxriCX0IoE+gPRF41DyVdmjutY3oV/dB5I43j+wmw4EUmlaV8FkOQQR/wZY5XGcFX
 db9gPmx4lz3ALkRydbhyMjGDXYXe21dnTEz0mdQwf1z95R9znDUFG06oIDEYgIJyElwoxQQGRch
 HvdBLww4y0J52ed6q5qHcl5yjzdJmE3/g8cmcr5ViSbccfcama/4Vcyb/j4nx66y1aCRsF17sua
 qekkhL+6OdT6Tt6ZjlFQXkY87pABGX6aepvvkCOBVToMr+znMXwDarPgwKwN7dRfJ31+KQmt0DP
 t/uyvKE=
X-Received: by 2002:a05:6808:1902:b0:467:1f38:bc1a with SMTP id
 5614622812f47-480420593f9mr3164461b6e.7.1778106848857; 
 Wed, 06 May 2026 15:34:08 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:21 -0600
Message-ID: <20260506223341.1759760-20-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106849; x=1778711649; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oK07AfdmhuutAkFVPLfeESGT9VyKM6aY+vtH6Se9Ocs=;
 b=QDvtiLQP6hJhShGgIvN3j0Kbd8uIqEPoBoYBp0qoEftqjrCvkA6+5EJY1Rcc9XW8Rh
 wXJKoAV2blFA16k4KayU5BHAQvuNYCvuMs7zl6sTE5zkxbFLgGtaX+cyTM65L0B8qoSS
 weC7T0rxQjHT7Vgjvb+bgtY3v/bVE9LbEBcUoNbtRR6G0NnHre/UvPJFOpjyHuxRBmIb
 s6KTFdETBF0Ijms+gFWtF/IFd6Owf3rYCF1On9/ax4c/vjmTaarr2ny+HnjFTmBA/3jf
 mOzKfeS3OWmaKhNPevR5vdsuvifWfETfj9IpSXRjKUGiFXUHV2LRzUQsKLEa2A1buXJf
 rUNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QDvtiLQP
Subject: [Buildroot] [PATCH 20/40] package/odhcp6c: preserve /usr/sbin
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
 package/odhcp6c/odhcp6c.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index 92688b7237..7c5cddfbb0 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -12,7 +12,7 @@ ODHCP6C_LICENSE_FILES = COPYING
 ODHCP6C_DEPENDENCIES = libubox
 
 define ODHCP6C_INSTALL_SCRIPT
-	$(INSTALL) -m 0755 -D $(@D)/odhcp6c-example-script.sh \
+	$(INSTALL) -m 0755 $(@D)/odhcp6c-example-script.sh \
 		$(TARGET_DIR)/usr/sbin/odhcp6c-update
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
