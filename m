Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A58FCD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E389F60F58;
	Wed,  6 May 2026 22:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92E23uMOONVB; Wed,  6 May 2026 22:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B49460FEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106872;
	bh=L0ZKNMrJXJI797yYFJsl0zfWV4tK0cNoumivDM6cX1U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BfBy91Lqp8fBTSPV9jT55Fift9966GNcCOJxlz+M13iIQhP11lRsX7x+Ji5hh+npF
	 KO3zCSAAsPl1IhEbwjhtFsvq5z9Ss6GnFS9pGFhITtFoAypo8JUoxi0Eu5NYTYDZkL
	 hauE7r0pj9a3SWYUemdAgSCaqciHRlMDVyAeOqjVWMMZEWsz2UycpKyRpkayIlNhEe
	 lGcfcoWLY9nkQZzFeFY89zB3qR/7QHv6wTLkCmd/ArrMOg6Bl0KIcI8eV5+hYxkBiY
	 qGDK7IarIL1TR1p/af1G4bBJZPaaLBsbvte1+baREFnn34gTGS846Qqgtg+gvMM0za
	 LoQPl86CTX33g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B49460FEC;
	Wed,  6 May 2026 22:34:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 831A8280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74BFF406FD
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id go5LY3Hb4KNP for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 760BD406FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 760BD406FB
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 760BD406FB
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:25 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7dcd89701acso244802a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106864; x=1778711664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UnM3JLskSGhH6KLUa/REcPOHgexmiNqEEgGpak+hEmQ=;
 b=e1E9YaV9wERkdRcrooVniJ+bVPIdVytRVy/BykBPm4r5GiCDaGEJ0ZX0YXrTzyaeAT
 zhnv1dsWLVwLofiTr/+YD089HlOfuVE0yxjwugJ8O7iTJWFo7W8xS73UUqVAkQO9HikS
 WODB/upfqc1TcQj6/5eLxRpR4hEzkCi9WitQtu64MhR2HDztreo+/p/FZkidzrV8altf
 IvvRg56y14bY4lzGrjmxzYKvYp0ihF3BIqMCYhuq/F3NcqqbVaK9suU2em7XKfYWcZ2I
 msHyHhvJDcNJW7R8sMKvwwi8DgwWFDkoDsZB7/avE+/YOctUKFwXKdb2dADmuQniGUQi
 C4FA==
X-Gm-Message-State: AOJu0YwXXXzb9u6lDX7TVXYQ1oIHFgp8pTn8HfN0IwU977zJY0YV8T0I
 Va96AOI49Fnd+PY1GfedwxwLBibkmMr5pkMrqdsSt3u40J+swfdBvyHMbieVEHzh
X-Gm-Gg: AeBDieucNy/K0dlshGdBXJiTHh6daaLFPP41urk+wbiXVevh3ElOkm9fMfFpBU/MWKN
 oCZmYLiqWCz5WLlD79uwjVkrsOGf8oNhSZi9u+fk0if63I3oCA2qKrQ1Ri6x1yI0GRo4T0E8696
 XuRapBpERlPDWsXtfQyNtQiB0zNMe09/5S8o/cBgobf1D5XnfWr+FIEGtQzDQuVIMAGMOdfOtEC
 uGBDtHwf7qB7lpLb0RCldioHBpMP1eeueu80ecHE1wYHqflz3Q0LxILC5VUNEHX09LwMBdtjmkj
 lDktMh9TGIefSE+hAgsEoukQozbWjwcPjJB7nvprpmoYIiGpVquY/l4E44iLze5SePfU4AgoKX7
 h6R62Yq7NZUZpTz9H86AoW8hk040kRxo7R/Lto8zey/D4TejPkit45ij9ccT++Yf5Pt0gsaYmGy
 GF8mLDJT9vzhzU3myiZs+kLYdh2gd7n25G4ZNFWag7GboYNiRPGlPib1S9WN1ct+UT6P7myGdqp
 T9p8lukNWix3dnsofCkEScbeOBdu4fmKg/G8D/riOiccXubvYn+AA7ZSehpfzo2a1yQjA2bUz9S
 mS9w9ON5IhX241gbpw==
X-Received: by 2002:a05:6830:67d2:b0:7dd:91cd:2b19 with SMTP id
 46e09a7af769-7e1df05068bmr3171772a34.14.1778106864205; 
 Wed, 06 May 2026 15:34:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:36 -0600
Message-ID: <20260506223341.1759760-35-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106864; x=1778711664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnM3JLskSGhH6KLUa/REcPOHgexmiNqEEgGpak+hEmQ=;
 b=hgQGbzqkRArXzMpqfH4aBiEqYeAyF9i0MjL5FvFEoV68AOHCHNhPur2k4r1JrMuFXD
 7AEKKBmYH6Q36El69rFv4yoXJ4Wa67ZAUzT/Hp+Ts0MosPVLQZBjZ92JeAGnV/wRzPAU
 kaxDcr0cMDGvyB0dTGTN4BmFqUSSJRfGwR5xXZULjgC+C2Cxf5JdzwB5JeJ4kedK/kgp
 O6WsblSyLXzm+32J6Uv/tumu39YI+H/1Vm8R6u8QT2hTTFsyzD7TIr8R7ZgtScpJN8iC
 UvVsgnMAtM7lpkAeBooD+ZTPheGXkkQ19M86Bk6c2+POkp6SDrlvo5OB9fdHx2UEX666
 dVGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hgQGbzqk
Subject: [Buildroot] [PATCH 35/40] package/uboot-tools: preserve /usr/sbin
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
 package/uboot-tools/uboot-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index fa0b6aba78..89d2ec38ea 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -92,14 +92,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)
 define UBOOT_TOOLS_INSTALL_FWPRINTENV
-	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(TARGET_DIR)/usr/sbin/fw_printenv
+	$(INSTALL) -m 0755 $(@D)/tools/env/fw_printenv $(TARGET_DIR)/usr/sbin/fw_printenv
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE),y)
 define UBOOT_TOOLS_INSTALL_DUMPIMAGE
-	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(TARGET_DIR)/usr/sbin/dumpimage
+	$(INSTALL) -m 0755 $(@D)/tools/dumpimage $(TARGET_DIR)/usr/sbin/dumpimage
 endef
 endif
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
