Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01A6CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D7360FB2;
	Wed,  6 May 2026 22:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ccg52RXbxlvw; Wed,  6 May 2026 22:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B9160F9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106850;
	bh=j/kJbUGOYprKemU6h0JMXnkG7cRunySQ/VeEUTbYjao=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hhAcSTQ/Bcl0qVeZyGxZuUj4/V8VhcyiG+kV6//XF+XpxDk/9Jpsq/2qVhwNIGtXg
	 Z2u4L3XfqEooF7k7upd6iceOhqXrMspqHugvyTxtgGT97NP0AuieWASteTj2btF97s
	 k9ydUuO1MUxwwih/SlUpnI2HKjLjLq34P02f7/wFKvLtzfe1a8qwvMCiJfoiHEXiI/
	 Y1XSi0QSoLg6E1BP8s8re9twuo10bUOSEBxgrZxkyX/R3YsyyZtz9WbpaVErTL/34a
	 /XetIaWziMWxpxl3cJvA7kbnsaCRXDrMnkgXHdl3608Sk2hkLWHUZiTcNhD5Yi6NKY
	 xf6fwdd8XHXHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93B9160F9B;
	Wed,  6 May 2026 22:34:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EB24280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 210C160F8B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gf8O76R22Snk for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 696AA60F7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 696AA60F7C
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 696AA60F7C
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:05 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7dbe437b072so127316a34.2
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106844; x=1778711644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pbd4n/M22meHUIQalX8p8ooi6Pc9q3kPGPcgUXTOpNk=;
 b=SsdrTuEIuB5B3fjQpp++6riCg3cwz4rdxSKUPI9NwfsTjVkPh9l38/0bz8QJqfZeEr
 cVFnvWDMu9N663vQ+nq73xRs6HCtwWQq2r3w636jOjE6IGFYNkMEGH/TAYSwC6dj7yEm
 7gYhmAz4U7wxrDO4DBh4J7xsThIp1zRufcb0uiozcpon5+zvT2QpRBYohZf+gYEBvYfS
 W4SQ8Yeq7syd265bzb6ibHJyjLskjhDHd5HxIN1c/SOROYav/jzVQJxHQofghak5A8D5
 wh6h5Ex96gqHbN3ur8mMZjJXeaGduE5OAQmJUcr7xmsmXfMim4lh8jdg1cekIjCJTSyW
 GR5A==
X-Gm-Message-State: AOJu0YxwrM3Qph1h3PIObjGFInm9j9iYwYeU/5rAycabNXDpyxFDe3t6
 wsw7SFod/h2Hn9m8HGSMh6xsgr541oEOzS/T8+W2ok55j9RkwvqIcXufZeUuL3cb
X-Gm-Gg: AeBDiesw7FwOaT+W9eGAkdBjdaygm2MRSK8lytNcZkDVE97FB4cXRBxSFhO75O2jk7s
 mLiUfsaaF97RkFad2OGvDTHW213HUZZ4yw2nVL8ACe7AoK1//J2VY1RRnlC/4yDwbthVxjQ9LFE
 wrTPmQ8dN+iKqorymSqFIcznwMwa+Ej5/YKSyVGj1+KrXqCJLwIFVP6mRL6TmxIgo1N7Csdoma1
 w5bb/0tprfTWh3vvpDS7uAf2mEPJpFwd2MLzM55zi/9OHqJBHWykNB1KSMczA8kI5JTV6yw5p5z
 qxRAL09Wh5kHYl4nuz/iyrhHQRTmhkNe+KHfSc2P9vSOeA8gTsNop5wT1lMG7NcuCPpggdR1gFm
 sMVIzz0drQg5YeaAs/8zVOX8H7lYAKtNJYKASJ0zr0LPwpk0CFlssuRJhZFTzMWsWrYXcYDBWaL
 Un5yVVPLKZv7RCAOWy4vw6Rj9WPPpJ/C5HW9GsW0DNF7fuDKlcV/YZ+/Ms8xO6rNe8+iIdH7Y0J
 purmMDxMrZiNxdPq52e9S+QrB0XmCkl/Ad0C25wk3qDpH4k8eYVw8eEux2Iz0rtKhlPdAijdQDe
 V5GJWFo=
X-Received: by 2002:a05:6830:f81:b0:7d7:fcac:6374 with SMTP id
 46e09a7af769-7e1dee817a4mr2628485a34.8.1778106844142; 
 Wed, 06 May 2026 15:34:04 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:17 -0600
Message-ID: <20260506223341.1759760-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106844; x=1778711644; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pbd4n/M22meHUIQalX8p8ooi6Pc9q3kPGPcgUXTOpNk=;
 b=WfLgh59iU3JCoI8/PhEpp6UB6EuFcjK8TwWyQptwivkphA3DXjkjSGajMtiKeCsuC5
 6RYJ9X9XfqdDllZqs8duJst2fezAQpCxB0sBwu1OQmeMt0DfsxwyXxxasMCQPigglj+S
 SqgZ7Ad9DqT3cUQx9xSHcmWb8QZkc8kbm5tJBPCHD3t5Mn8SErQp3txJMjm/dniMj1Rc
 qSWPCpifPJD5p47dE+a5eA1C07EjXUtOdy5S4fXqhVQcbcL+a8+oSVF5K9IgCW/4BUdk
 k9rBK7DE73Azv6wDwh/EqtOUCp1UfaUGKGJFKdyBs8gXcot3/lvdDOFMS2/PjFdt/jUM
 PIcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WfLgh59i
Subject: [Buildroot] [PATCH 16/40] package/linux-tools: preserve /usr/sbin
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
 package/linux-tools/linux-tool-hv.mk.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-hv.mk.in b/package/linux-tools/linux-tool-hv.mk.in
index e638fecfc6..0310d90c88 100644
--- a/package/linux-tools/linux-tool-hv.mk.in
+++ b/package/linux-tools/linux-tool-hv.mk.in
@@ -40,7 +40,7 @@ endif
 
 define HV_INSTALL_TARGET_CMDS
 	$(foreach prog,$(HV_PROGS_y), \
-		$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/hv/$(prog) \
+		$(INSTALL) -m 0755 $(LINUX_DIR)/tools/hv/$(prog) \
 			$(TARGET_DIR)/usr/sbin/$(HV_$(prog))
 	)
 	$(HV_KVP_HELPER)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
