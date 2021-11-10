Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E21C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 10:31:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 048416115A
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 10:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 048416115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9C54403D9;
	Wed, 10 Nov 2021 10:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPhoNmFWY49o; Wed, 10 Nov 2021 10:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0134740223;
	Wed, 10 Nov 2021 10:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC3E61BF5D7
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 10:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BBAD81764
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 10:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErMZ-RFjrQdN for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 10:31:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D86A814BA
 for <buildroot@busybox.net>; Wed, 10 Nov 2021 10:31:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso4197804wmd.4
 for <buildroot@busybox.net>; Wed, 10 Nov 2021 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uTm+Z+ahi8G6jS7IHw0cyZ+pXfN/2mb4VfZqEeFwwPk=;
 b=gE9KI9gV9krbaQNofdYxKtRGtkOMbf9glEQb12+piYiLmXHRPNUSpe4oxi9Hbs9JFO
 vuLNZZYwGxnIY2O/GfHg4AkvHGKaohCureyXvnNgLoxli9teIp/VBcUqhR7owgLY6qgs
 RkKs/mrPg9V5scAzEu7NvaMgC20/BvCfW6wPngHYzYRF//+GGVSYqQJqI6M60mJhjfNq
 cU/Uk/bDgP+6lmbfoSaefOoiYzbLdk9EIA/FtU5Nk6bGg7EgIrPYI9tOypyXE9iws/pf
 wGjxWq1weBeTVdGSQlH9ykhxtc8oDRGrzLKILst1ibWiKp7TfinbN2U/CtIKdeFjAgRq
 Eotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uTm+Z+ahi8G6jS7IHw0cyZ+pXfN/2mb4VfZqEeFwwPk=;
 b=xPNrSHDtKJfDg6lr0Fy9yM+56wD0R7rtoStsqoPk6o0phVLJZGccNHdG7JL0gYKKEV
 f5PssFH0BtMi8nEx7MjQkCRd8IBAx59scQddv4nrm1Vpa1tmo1fTruDTlxHdmfF4oyjj
 G/+vHpGHYF7g6nydSrkpu1DYUNvubDB8jiOnpqe6N32brLTy/g2MUOXINqeF/O/XtJrk
 wOTLM8pPd+kkMfskWYSI/EIXHfUXJPV70luNkqAAjTRJm8XTUvkPOYA7TXSPsnfx8fGM
 hazm0z/O/mHebRkXdwkouJI0Cc7A5lt9sLl5+il7IfcIm3MJt0r3NMV/YnnvZLAVlx0o
 X/Nw==
X-Gm-Message-State: AOAM533Q3iqL3GxpQu3g8zwXdqM7YrnGNkZZpPvqZd5dZ0OsoKLENEbo
 Ctqb947pKVIjyu3e1i8e0sR/z7RHTa4=
X-Google-Smtp-Source: ABdhPJxBbL+OCk2cfCOgZ7+/D5LOW9sB5uIk0pSmSKh8KNRMQVJ5Dc986UL/W3MW5aLjRYoQ8N9BMQ==
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr14755898wmh.15.1636540289946; 
 Wed, 10 Nov 2021 02:31:29 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id o25sm5363499wms.17.2021.11.10.02.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 02:31:29 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 10 Nov 2021 11:31:07 +0100
Message-Id: <20211110103107.421623-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/luajit: fix luvi
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

luvi uses the cross bytecode generation of host-luajit
the bytecode format has 2 flavors, depending of GC64 option.

since the commit https://github.com/LuaJIT/LuaJIT/commit/bd00094c3b50e193fb32aad79b7ea8ea6b78ed25
GC64 mode is enable by default on all 64bits platform.

with this patch, luajit and host-luajit are built with the same option,
so the bytecode generated by host-luajit is valid on luajit.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index fbbd8ebc7..e93361ba3 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -26,8 +26,10 @@ endif
 # libraries are installed.
 ifeq ($(BR2_ARCH_IS_64),y)
 LUAJIT_HOST_CC = $(HOSTCC)
+LUAJIT_XCFLAGS += -DLUAJIT_ENABLE_GC64
 else
 LUAJIT_HOST_CC = $(HOSTCC) -m32
+LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
 endif
 
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
