Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B286CD6E60
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24B21405B3;
	Mon,  1 Jun 2026 20:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoCPTg9bS6BX; Mon,  1 Jun 2026 20:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41B22407DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780346874;
	bh=jMgku2KTASTDGYMlW92ggj4xkcQleWjMHb/cpSCnx0s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JFDsTnSF3l+20/vlLdApzFjvOUt7aCCVzhgmUtJaoeP/E0NaFupHyfIXAyd1bi3Wm
	 oOI1MMAMQtwqQPhYr0lj6YsZcs5YA5BKTLKGsBEkJYL8bi07quyBIc+5s2kns5P370
	 4e3+AmRkE4wc0+3xu/K8ly/uAYYirSzVenQ3sfpVilojPCZJbfGiNuo4vfHJiKi5Z8
	 vuHzUKnVUbB70DxgCWSlPL1WsyL5PaGgWsqj+sl9f88Rg8V4PZOxh7xk0URBX2F6g4
	 2Fw2lXlIiurWcQxYArqAMU2YHEhPneprKIJHSC6jgvP+XyxHM3ajy8lILDt4jZAjgw
	 94UjmnQeU70Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B22407DE;
	Mon,  1 Jun 2026 20:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C58AF4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C4A7405B7
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5sspq5Jy5GN for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:47:51 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D33E2404F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D33E2404F2
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D33E2404F2
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:50 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3965adfd75fso30754641fa.1
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 13:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780346868; x=1780951668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OJcjcO1ob1ci1fEpS9qhoBlyxsfw/N7f64AA+x7iXPA=;
 b=XXbq/TQYKTJ7KYwdv1DaDMjH0v2rSkioxHNU3giI8UEasHJxu/hMtSueDT6jCILhI5
 8fUP7pl6ETctFUujDmI0C6kGJacXUP8L7eaqXszW8Wff+d1/71IbMFJ9t4Nq4BM15Wb1
 WWe6tVGuK3mBu2kK38girMq53I0671986jnD7W6mfNi8tLYSwT+khutYB/e1Y91QFEQn
 m/Gd+hMJSnYjAuEmfYsX2bh2lZ8VGyx/Fy7qhI11/zFVRytVUC2p9pZtreYY2p+IUw0x
 Aaag5vKphll5lvhhXQBf+cT9Z1hRNNqd0xJ4pZEZ1CdZw3ddQuoYzjmd4HlKVcvUBEpn
 fmqg==
X-Gm-Message-State: AOJu0Yxuxrje0dlanIPvJj3kxu8rfCJQW3PKob0Ue/dZHZIV14WcjEsr
 Di8I30uDh067AKBlsqWgFxVxAatQPPOFRmgDXeRqcezW8Pfly15X5oVoqlBeYtIHnqgyoCPmgZp
 G4ED143Stbw==
X-Gm-Gg: Acq92OEUK9grMN71eyt8PxYfsjSiy8zqbjGYw9NebRHBHSh2zoKyeZFWtVhNl5wkwi2
 ZHsJB0pQiP3Rzs+400SO6QJB8zxxJdsOiK9vEJvdCyBW8V5IakI7KRuuB7APo/2ASJxksO00Fzk
 rvuQXqlZZ2NKRHTCillKoWWwq4TIKQXx4OPOSHgRtR05sG7wKKhJ6C8EcBkI/IuSMPvQ/J9wMuS
 sFgfAOqCjgF1ZEf8sXX+lbiNG4foSRRS1gOb4MEP5TBSFMP6PYCsjHJgBKoWTJhw1RojHjzrSCM
 GYVl+kDD8GhgxKD+yTHxxMBSAgHwnsTH3XriPsWzV9L8xwWY3gQIUAiOoHFN1d58ZgVpiuuy6Db
 ZiMg5Ir3BftpvC+UuRqb5D+4Wp35GHWdc9+XLfwqRPAcs1NCqLfkvjTMhGTkLQda9Hx7ti2D1to
 b1+iHkU6Dy2UDdzK/ObfEx96CArc+qQk5ri6w6HV5LyqTdk81KVGN3HvXVoylpSQ==
X-Received: by 2002:a05:651c:324f:b0:394:7f1:510f with SMTP id
 38308e7fff4ca-39664fb25e4mr40639771fa.25.1780346868425; 
 Mon, 01 Jun 2026 13:47:48 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-39659de42fasm27782141fa.19.2026.06.01.13.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 13:47:46 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon,  1 Jun 2026 22:47:29 +0200
Message-ID: <20260601204735.888967-4-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601204735.888967-1-j@j-ernberg.se>
References: <20260601204735.888967-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780346868; x=1780951668;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJcjcO1ob1ci1fEpS9qhoBlyxsfw/N7f64AA+x7iXPA=;
 b=BkZbHnoMIU1zfrlD2XDWPNQtySUWyH9WCAj2HIvFGskV1MKEJK5aYzOZeoI6ELlBFX
 XSOVEt6HyvcReRnaE5KGwnx7gqn6lirwVHtHazbN0Q3Img1HiqO6ybOJ16Cy3khXKjVj
 +btnAGJa28YIIcqcC7kaeJ6DXnWk8eB50/VDBD0ZjN+KKK8cK2NX6OP8EWGSy/n0mFMB
 0Q3saqRsRyO5yXVKqkFzqWC0fQGu3mxbPAavdP97fp3Z35YyQHprR4UCY5aWjpqlhpqs
 7ZIYYeYofSDC+/Uu+DHt/iiwgUcPBG9bm/6tYKAhbpW21+peiqmIB/3XTLG4E15hu1/F
 bwLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=BkZbHnoM
Subject: [Buildroot] [RFC PATCH 3/9] package/rtl8188eu: Select
 linux-firmware for the firmware
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Due to partial rtl8188eu support in the upstream Linux kernel
linux-firmware packages the firmware for this chip now.

It's packaged under the same filename, but is a later version (v28) from
2017 [1] while the firmware blob bundled in the repository is from over 13
years ago [2].

The LICENSE is updated for the same reason, the appropriate license will
be provided by the linux-firmware package.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/WHENCE?id=fe1a0a75caa69da62849cbf549c32531c6d1da4b#n3628
Link: https://github.com/Benetti-Engineering/rtl8188eu/commit/a27737ea39d72040d7421600949373982d78a0d2
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

RFC/RFT: I don't have any of the hardware for this chip and cannot test
that this doesn't break stuff.
---
 package/rtl8188eu/Config.in    | 2 ++
 package/rtl8188eu/rtl8188eu.mk | 8 +-------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
index 102e8d7bf7..397ce4c080 100644
--- a/package/rtl8188eu/Config.in
+++ b/package/rtl8188eu/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_RTL8188EU
 	bool "rtl8188eu"
 	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_LINUX_FIRMWARE # runtime
+	select BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX # runtime
 	help
 	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
 
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5f378e0b6e..a4b6b89e3d 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -6,7 +6,7 @@
 
 RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
-RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
+RTL8188EU_LICENSE = GPL-2.0
 RTL8188EU_LICENSE_FILES = COPYING
 RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
 
@@ -18,11 +18,5 @@ define RTL8188EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
 endef
 
-define RTL8188EU_INSTALL_FIRMWARE
-	$(INSTALL) -D -m 644 $(@D)/rtl8188eufw.bin \
-		$(TARGET_DIR)/lib/firmware/rtlwifi/rtl8188eufw.bin
-endef
-RTL8188EU_POST_INSTALL_TARGET_HOOKS += RTL8188EU_INSTALL_FIRMWARE
-
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
