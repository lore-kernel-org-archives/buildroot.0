Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F16ECA0FED
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 12:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F5808211B;
	Fri,  5 Sep 2025 12:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlGQgPNyd6CA; Fri,  5 Sep 2025 12:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F25881F99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F25881F99;
	Fri,  5 Sep 2025 12:38:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E90FF1E04
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 12:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC2B140621
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 12:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NREPLSiQd9ok for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 12:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF28F405F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF28F405F8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF28F405F8
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 12:38:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3da9ad0c1f4so1426291f8f.3
 for <buildroot@buildroot.org>; Fri, 05 Sep 2025 05:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757075888; x=1757680688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9KwJwuMXc/l5yRvZ8O/HvHEodatB+oc/MWZSA/LRMA0=;
 b=dh40Khq3rR7tojjqmsiPMtSzmKPXGxXub1R/6zFyG/OsmXNkw1TSTs1wiFOIWJmr/n
 aK8j80CaUxJvMg18MCqDxDyv/SEVzLUGocs2r5FcNp863JaD6KblJCV/hJQHWtEke4sY
 ys+c2Fau9bmZ1saWlv0NCCuIfK5nzNaAe9oNKsiD6tbDTmSKLqD2on0ikAwzKOMF0tQl
 RffmEEMQE8htpjStdCMybD7BU5WphNEskHi9zHWcBKV+nYDflPauUohiJ+iG31flOXq4
 8MmTb7XUxE6nt81PzUC5kJKpNrFo8fTBrBqLpSm3XiCBvvSwe5yY0RGQxJSVhGVpn+m+
 Ekog==
X-Gm-Message-State: AOJu0YzyeohTP440PRSxxgGUARcjSC21n8X897xWoOiOsZZU0LwyUP3I
 3ZHy2YEEkmEbT1ov3ZecD/cbtBS/Vg2K86zTypaHt2R8XIS5GE+TJ+/xfI1rGA==
X-Gm-Gg: ASbGncs7Hjb9rF7gcoSDiO4MDbFiLPZxSJHpXVA9yPlo84wsc743yPhoKq2DRvBcx+i
 II+e6uY1BE322DSSmYwX51Hcvw/VBddPqRE0ut2qjfew9nop7LtIYmwLwBvXX90AaS6xNMEVq58
 SmVsoFV/10OE+hohjBKN4pIzY120oV2S6tN3eX+NCStTAviiLsrM4B1301sBwwYxHnTqPzd/igj
 p8bTWTZLRFzKWPj+fU/sIreDcyX/xpRBxBm4SEq0peXQT7XmFY5S0MatAYHI23px2DE2LaBFk8U
 224mT9ZXR+Bzm1FhxS+WcCdz70h9g6NQCaugtOJEM5Imxb1RHlWqA64WVmiUCzUpOzuNtDIdd9s
 h13m4fD+0f5Are1zZY2eNqJqyLZZ+Y9A3n+uajKc=
X-Google-Smtp-Source: AGHT+IGKk+zKgf5Yzq8fBh9mAqqJeq3oeS+gFJs571VO3bYvEBUuyT9rXaSBAPOUaaPf0yv+DVPAoA==
X-Received: by 2002:a5d:5885:0:b0:3c7:84b4:e76 with SMTP id
 ffacd0b85a97d-3d1de4b90a8mr19698372f8f.25.1757075887809; 
 Fri, 05 Sep 2025 05:38:07 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e0f2ef13e2sm7033987f8f.31.2025.09.05.05.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 05:38:07 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Arnout Vandecappelle <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Walle <michael@walle.cc>, Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  5 Sep 2025 14:37:55 +0200
Message-Id: <20250905123754.33866-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757075888; x=1757680688; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9KwJwuMXc/l5yRvZ8O/HvHEodatB+oc/MWZSA/LRMA0=;
 b=UTkWHhV8Vo7tt8xWkcGsJJ/RFhlKwP7JV6Ofl+xEc2l+jwAEZvAtiGgGABSrZfxoFT
 B3avx865g/9AB2bjP6WfNhmJLw8WIT/NgF6UNUgSgEsx79kCFmKl8IwlrUPGhaLiJUXR
 erkvmYBGG0gu52w6htZiz8uvHm5dgR7FTfjlTWoRjsQpd0Axq8zKmjWexr1rxrQK39YK
 rUHV5vUdUfMmF0xyDzPPGRgq9DkHC+WmA3xedKmx27cdPXqJLXdT/2nD9b4a1hIzJenP
 zeeEK/nnJRem1U7DAkagsIXpk7RCydudh7rHof10THY5encte4auutRsUoMDE7Glc/fh
 Ft4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UTkWHhV8
Subject: [Buildroot] [PATCH] package/uboot-tools: use uboot host tool
 printinitialenv to extract env
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

If u-boot is compiled with the LTO option, it is no longer possible to
use the script 'get_default_envs.sh'. The problem was already observed
and a solution available upstream u-boot since the commit 486aef08de09 [1].
This was first available in release v2023.04.

Instead of using the script the new tool 'printinitialenv' is used. The
tool is build with u-boot that is a dependency of this package.

[1] https://source.denx.de/u-boot/custodians/u-boot-tegra/-/commit/486aef08de091ca35386f32fe961a201c3cfa9d4

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

The question I ask myself is, how can this problem be solved for older
U-Boot versions, or how can both options be supported? With the proposed
option, old U-Boats will no longer build.

 boot/uboot/uboot.mk                | 4 ++++
 package/uboot-tools/uboot-tools.mk | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a310..66264bb3f0 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -144,6 +144,10 @@ UBOOT_MAKE_TARGET += u-boot.stm32
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),y)
+UBOOT_MAKE_TARGET += u-boot-initial-env
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
 UBOOT_MAKE_TARGET += u-boot-initial-env
 define UBOOT_INSTALL_UBOOT_INITIAL_ENV
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 1925047ccd..25d7b26c6a 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -154,10 +154,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
 ifeq ($(UBOOT_TOOLS_GENERATE_ENV_FILE),)
 UBOOT_TOOLS_GENERATE_ENV_FILE = $(@D)/boot-env-defaults.txt
 define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
-	CROSS_COMPILE="$(TARGET_CROSS)" \
-		$(UBOOT_SRCDIR)/scripts/get_default_envs.sh \
-		$(UBOOT_SRCDIR) \
-		> $(UBOOT_TOOLS_GENERATE_ENV_FILE)
+	$(UBOOT_SRCDIR)/tools/printinitialenv > $(UBOOT_TOOLS_GENERATE_ENV_FILE)
 endef
 endif # UBOOT_TOOLS_GENERATE_ENV_FILE
 endif # BR2_TARGET_UBOOT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
