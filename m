Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BDDCD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6060560F68;
	Wed,  6 May 2026 22:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XF8iLZv3vy8Z; Wed,  6 May 2026 22:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB7660FDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106875;
	bh=l8MC0vR/Mv5KUaGlkii+FQKtzilBSfcBDFmLbMVdyYo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=A9mGy0bGouDOhPEkRgUCPUpoeIsYFiW/s6cNBqPnStjGIBfh49dbHiG4cpXm4Qh0L
	 LlMAbN3oe2O/lg98d+dNRazFqsyS/pswLujFMiflZUBAlwpXClsaw14u+OS9dLxdZy
	 fO5eGIc7OEqnQUqTP07zODaujlsgTH4PIc/T34ftWF0DZYdtL9BuUfdR+i8gdiNk3D
	 JMFXWZrTL3mwI3KNzKqG7+NVhAS6tbXvJCHZf5n/kXFGMdfLJXDhQX5X4BZdgXUEpI
	 NLZ0zgsKWGo9/0pOYbekWPGohc6TwtTKwJzK31ibfVDbMnR8xUD/C9eAIL3bghUZg9
	 S/bQ3FrRPSe4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EB7660FDB;
	Wed,  6 May 2026 22:34:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE838280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBE82406FB
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Jsk2r32vfRs for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECFA0400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECFA0400EC
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECFA0400EC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:30 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7dcdd1b492eso177006a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106870; x=1778711670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h4W+iPerjaa3kmjMNeAJw6pZydud7q93r5QujtS4+0g=;
 b=QRO/ifUGRiB2RS4K03gi09KV/H4NXFFUyP5K7sbQkvfIE9ftOY7e5MGIeuBBJzq7Ud
 qBofubVBFeArdrWfHKsztrASOkvX5uW9GpEP5DlCBM2WZbJF40jkmhtgKe0gzMOoewCg
 ouFif+59weo/VOi/sFHIwx5PvtO2sCa/Zkf05pZ2W00mCkCEcNRHim6P+lX7ZozNa6C8
 PckgYnCy7avPXpatCA8527XSwaNqsK3Zqu0Y7HnOr9CeDVFgidt+uOZ5OL3EDRD/79nW
 YnwW3RsrMF8MvG0CEMZOhMegcA9ElrR7x5pPwcCnjkVJWNzFL3N5rru+lO09oPd7wf49
 Kq2A==
X-Gm-Message-State: AOJu0YykZ8BoaaiwvCVsJ3uGG6ETEB7+zPRsthcF2nouEyBCkDSiwQ32
 p7+3QANpnVfgcBfaRVejyNS5m44DxC9B+1MBnREGuG7bUaG7eEn2aNM51rsslB2e
X-Gm-Gg: AeBDieuDUMYbc/LtpOxAxfUVdBwj6tqwgVsIFC4ZDkXCXxw8lJh4NY3oHBtkJy2jifM
 GqDgUmwm/PkeqFS5bJHt1cH+0qPDUaUr/rJiPB4JbCZHKmmIAKiOzfw0sJX/kWukHpJpXopoay6
 sJcnoahACIRQNkBjluX4cmg4eW8UGje5W7uU1QUSB+So7y1sitqPVWF8rHScuLTZaQbNkmG01DZ
 4OE1LFbWiydUYbpEVQTJh/m8yCu3hhnn/Gcs91nzZ52fgTmA/NkA73Hur0RpCYRh4cYHk4og3+R
 TuI5XQBHmRxQK9YYQN/EYwptCz1ToVDa/sVpmbMwRUloJEmA/Ph/hXj4TTNW+li60s9B9MgfyU5
 qGnDwvwnNfEdQwQZdXSnma9O036Kw4ghj/ZI7mN4dlQHwUk4X+Z8EPmXwdG9S5luu4WaE82i5mE
 YxRGfypbRRNYy7TTwSHkbwq3xd+Vc/bKhwz65X3Q5uEwjgF0Jg1xr+wL3AmvluMEqKpBvgPAJgW
 GmPOXWwP3rFPuP2gxm4DvixReb4A9b2js6R4moWA0/R4PdUNhkLqWLAMnC9WTeiEEGkAe9988uP
 ywl76us=
X-Received: by 2002:a05:6830:3806:b0:7dc:a51c:9197 with SMTP id
 46e09a7af769-7e1fd07120cmr254072a34.7.1778106869707; 
 Wed, 06 May 2026 15:34:29 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:40 -0600
Message-ID: <20260506223341.1759760-39-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106870; x=1778711670; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4W+iPerjaa3kmjMNeAJw6pZydud7q93r5QujtS4+0g=;
 b=bSFnbo87NFgnyaPhvkSiUf3IDVyhocCGWbjK0J+wqmQ3f3yYyhrhx/Y9vhVDAhqiUO
 Cr31+2H++WSOZT9jjjQDA2XfsR4YmghWXqhDrTgPepmhgfAVbuotNpImwYH/1KzZtIr5
 y7+57VKeYU7A/fIs65uOTJLXoW/a9sFyFip658v3lGfOPIhogjEJ62V+FcCGrQy2hORx
 NxmmDmEdQ/5UKKKY9ONZLr/fvDOWYlwayi6keR7q6dCj9IOMu5lbjBwpWKYCUD07wEa/
 NTfWJpRZ3mA1nkwKzsICYhy8MILF2wUM2qBopMfTqCC6Nx5D513soJbHrwD/Eu7uAhgy
 S5eA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=bSFnbo87
Subject: [Buildroot] [PATCH 39/40] package/vsftpd: preserve /usr/sbin symlink
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
 package/vsftpd/vsftpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 14c1b6be13..2f57a2f438 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -67,7 +67,7 @@ endef
 # 500 OOPS: vsftpd: refusing to run with writable root inside chroot()
 # That's why we have to adjust the permissions of /home/ftp
 define VSFTPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
+	$(INSTALL) -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
 	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
 		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
 			$(TARGET_DIR)/etc/vsftpd.conf
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
