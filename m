Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FECC35FF3
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 06:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D5E341A55;
	Fri, 21 Mar 2025 06:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-7W950v_QPE; Fri, 21 Mar 2025 06:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDEC541A56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDEC541A56;
	Fri, 21 Mar 2025 06:24:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CE561A4
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 06:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D78983F0A
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 06:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5n-tlv2IsncM for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 06:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC173833A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC173833A8
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC173833A8
 for <buildroot@busybox.net>; Fri, 21 Mar 2025 06:24:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so16830335e9.3
 for <buildroot@busybox.net>; Thu, 20 Mar 2025 23:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742538262; x=1743143062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mBv+AgdYm7kIsf2D5MNrSxDYzoqTzFXs29FEooJfIMs=;
 b=UjYwuRz8Ygk3tmxRqH7O5/YDyQ/EgrpI+wvvfl8OllNrSZHAac6fIbEkoNiMUVKSnw
 9tqgMRK2+K9ip+xSTNyD7uyY4gom4JN0DKcIn9EYIu7HntJVfVv1b4RU7Ou4wMKJOuC8
 qf3q3llOqi5H+0bTmqocobPM5qbJ2aXa8AMAcA7/f6rIfPCjz66UR9JeGFaKuQ1bL7BS
 tVly5SlyK/JQTS4Xkj0NiFlcSgrEmB0D1rAEnRlMXtFcDryyuCpMtwylyMnQs1TBwVKd
 cE1uqbU2WHWHOnoy+k+KeVQgRQwZLuK3+vVwQ3lxioY1CfBOsfFhrDAmwmFiOEQhEBxo
 2arA==
X-Gm-Message-State: AOJu0YxMKw4hUJcKEnszXEK47u04zslKgAXJ0jRdhNQe3D0UVOViOV6l
 xQVNwDiXwBKRscZRqRZFF/OFNHwDb6p77ftH6Cj/B3klA9uKCa+g54QLzFjz+E826Ine2H+9aF1
 17A==
X-Gm-Gg: ASbGncubkW0Thy9mCXktgnzPCumfyrHzoY2L4N8OvK29xtQggfTFx73W/Akcuc2eJ1B
 J2U1h8huISmtiXUljVBX7PAZFJkBGm2bf3vc4+VxrSz9xjUTmzOtGuD+ftAFsqHXbrBfB/v1uo0
 EYbdnUgJEIM+x7AWgYsCIYfeoW2v/ouEAIzSSphM5bAdPvRRBKmtgI4KnnhYaR/f39Zv0EKauxZ
 RjnyqBzr3iapUTkD7b8s91e6R1yx7pwwzaLl6zwuKw88JNRBWniEPUqXCIGtT0sryiXv0yyGvVK
 q0nixIvNF4GJ6c9B8JjO60WbAYelbiLRQtHyg3L7AIt9vNhCuRr6FdbrrFwZroK/dwEsRojf5Sq
 M4sQ=
X-Google-Smtp-Source: AGHT+IF+J7aKejH7rFgTcNw1FNVXeTtC2UiRZNmdb3uhQpMmHvt6RnnBJum6UEngzSwaoTKrxKfNUw==
X-Received: by 2002:a05:600c:1c9b:b0:43d:1b95:6d0e with SMTP id
 5b1f17b1804b1-43d50a200e4mr15539745e9.23.1742538262372; 
 Thu, 20 Mar 2025 23:24:22 -0700 (PDT)
Received: from vm-2404.. (61.186.66.37.rev.sfr.net. [37.66.186.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd9eb21sm17157535e9.32.2025.03.20.23.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 23:24:21 -0700 (PDT)
To: buildroot@busybox.net
Date: Fri, 21 Mar 2025 07:23:57 +0100
Message-ID: <20250321062358.3955810-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1742538262; x=1743143062; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mBv+AgdYm7kIsf2D5MNrSxDYzoqTzFXs29FEooJfIMs=;
 b=EkRywLSXhWjh0iLItA7HrDurtHKIieMWa8LryoxasFmbbVlUHOAyBk1kds7q9ha1dm
 4D53AIwfYOJWll5BjiCGMC7AKkNUJfEikxrb481lkf4p8miVe4LvRV8JeVv4AiCTLDDL
 GqmB8UZm8t6tSCVTCa+Mjv69NodT/tUSVCByRX1+ILm7V5B1vk4p/LHtXPgB15dOzlOs
 AYUFA81Vttdq+/rU89J0vTOfOFOjR44x301IAs60C1vdZFIf4PjvaDyUvsVtRcz8ZOIf
 HBzaFVbvQe2ZqiNT5H/O692w0xBmubnVig8k0SJc81gIdAStJaRCWFiRoynDDRCIj8EA
 b7pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=EkRywLSX
Subject: [Buildroot] [RFC PATCH] docs/manual/customize-directory-structure:
 add a custom top Makefile
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../manual/customize-directory-structure.adoc | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/docs/manual/customize-directory-structure.adoc b/docs/manual/customize-directory-structure.adoc
index e0eecb564..b0beebb40 100644
--- a/docs/manual/customize-directory-structure.adoc
+++ b/docs/manual/customize-directory-structure.adoc
@@ -49,6 +49,7 @@ to you.
 |           +-- package2.mk
 |
 +-- Config.in (if using a br2-external tree)
++-- Makefile (if using a custom top makefile)
 +-- external.mk (if using a br2-external tree)
 +-- external.desc (if using a br2-external tree)
 ----
@@ -109,3 +110,86 @@ BR2_GLOBAL_PATCH_DIR="board/<company>/common/patches board/<company>/fooboard/pa
 
 then first the patches from the 'common' layer would be applied,
 followed by the patches from the 'fooboard' layer.
+
+==== Custom top Makefile
+
+Here, a custom Makefile for your project which adds some new targets,
+on the top of all Buildroot targets.
+
+The variable +BOARD+ needs to be adjusted to your project.
+
+With the variable +BUILDROOT+, it is easy to upgrade the Buildroot version
+used by your project.
+
+----
+BOARD?=<boardname>
+BUILDROOT:=buildroot-2025.02
+OUTPUT:=output_$(BOARD)
+SD?=/dev/sdX
+
+export BR2_DL_DIR=$(CURDIR)/download
+
+all: $(BOARD)
+
+.PHONY: buildroot
+buildroot: $(BUILDROOT)
+
+.PHONY: buildroot-clean
+buildroot-clean:
+	rm -rf $(BUILDROOT)
+
+.PHONY: conf
+conf: $(OUTPUT)/.config
+
+.PHONY: conf-clean
+conf-clean:
+	rm -f $(OUTPUT)/.config
+
+.PHONY: board
+board: $(BOARD)
+
+.PHONY: board-clean
+board-clean:
+	rm -rf $(OUTPUT)
+
+.PHONY: dd
+dd:
+	@mount | grep $(SD)
+	sudo dd status=progress if=$(OUTPUT)/images/sdcard.img of=$(SD)
+	sync
+	sync
+
+$(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz:
+	mkdir -p $(BR2_DL_DIR)/buildroot
+	cd $(BR2_DL_DIR)/buildroot && wget https://buildroot.org/downloads/$(BUILDROOT).tar.xz
+
+$(BUILDROOT): $(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz
+	tar xfJ $(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz
+	touch $(BUILDROOT)
+	# here, apply patches against the Buildroot official tarball
+
+$(OUTPUT)/.config: $(BUILDROOT)
+	$(MAKE) -C $(BUILDROOT) O=$(CURDIR)/$(OUTPUT) defconfig BR2_DEFCONFIG=../configs/$(BOARD)_defconfig BR2_EXTERNAL=..
+
+.PHONY: $(BOARD)
+$(BOARD): $(OUTPUT)/.config
+	$(MAKE) -C $(BUILDROOT) O=$(CURDIR)/$(OUTPUT)
+
+# delegate all other targets to the Buildroot makefile
+%:
+	$(MAKE) -C $(BUILDROOT) O=$(CURDIR)/$(OUTPUT) $@
+----
+
+Now, an example of work session.
+
+----
+ $ make buildroot       # custom
+ $ make conf            # custom
+ $ make nconfig         # Buildroot
+ $ make savedefconfig   # Buildroot
+ $ make source          # Buildroot
+ $ make board           # custom
+ $ make dd              # custom
+
+ $ make help            # Buildroot
+----
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
