Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4300EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 21:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B54B740901;
	Tue, 30 Nov 2021 21:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29mg1Yc0lnjp; Tue, 30 Nov 2021 21:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F24314090B;
	Tue, 30 Nov 2021 21:55:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75FC81BF306
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 21:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6572E81776
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 21:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vq9w46ZJ2Ki7 for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 21:55:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E3F58175F
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 21:55:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d9so26680908wrw.4
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 13:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F5ME+aBmQ3C2nbdjOYYVhyYt5+VovrQo8B9BzvRbiq4=;
 b=YX6utspVf7sEnIRNKcat+wTAqDSTIU3hwZqnIZ5foxs5UsfHu7/q9SuGK9oDs6gh1x
 ma6JC4OSOWZKpCouW3TI+bwI+RKNsAEYONWE0HXNfGy3Kpyo6y0EDQGEd6y7wLGbQY+8
 qkMpE3vYwVJn47k6c2VItJj6+pcEisci0mzxwHF3XxEjyRnGE7cExV7GuRd5HTneFBp6
 hn9l+dOGdZnPia3SH0jduP2PzFfw/P0pwS4tC8ikw5k7AYtVJ1J+nk/AsknBjkLvz+T1
 2mcWVgm9ghNLspqKbVPFgKbVAVhci5eY70o3gbELGdKSY/dbep5y2r4p3lmbtnIEf586
 2dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=F5ME+aBmQ3C2nbdjOYYVhyYt5+VovrQo8B9BzvRbiq4=;
 b=jzgQFGcXUK+DqJppxfCxlALHP/aBU5anRFDe8JZUr362KJvUSihmyxoQVLfpzE37O4
 Cr7nhsia/iosKwfy9ZQI2LjEmBMsVNnIsNXoGeZTL+eVHEox6gCo0oMVZdEmR2ZuWDVI
 KevyZeiap5ecoQ/VsH+sYuzHOb97ZMALIx/4feyb23syI0BK/USjkMQwH07LT9+exj5f
 GZBngO6NoZbB8xNaOWTd/3i+mCs3pNihg2uOEWHDqdUTvA8M1KYsANi3pE7+lau2hkys
 lMR/fBDhaygJarAFE6TCLa+XnCG679pOFtte0K3m32JAGUf3wEgz310R+dgUW8Kv+Rbm
 Iz4g==
X-Gm-Message-State: AOAM5318Rm4yAPbfWI0YBEdrgTemx+Oa4oKgj/LI64tjQtkKb2Po9rd0
 9rrdO4jyYa40Ee0cZdg8U4EEc1nBI5M6Qw==
X-Google-Smtp-Source: ABdhPJyMRKf3PZK8Fq2HVOETX88Xhw5XSy0stWyCgxcN/KC0AgzZD/Zh1CL8qq1CZENo20IRMhG0pg==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr1855863wrq.626.1638309352611; 
 Tue, 30 Nov 2021 13:55:52 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:551c:2eec:7b8c:53f1])
 by smtp.gmail.com with ESMTPSA id u23sm3477755wmc.7.2021.11.30.13.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 13:55:52 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 22:55:47 +0100
Message-Id: <20211130215547.3717152-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv5] package/mender-grubenv: fix grub module checks
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.com>

Commit b68810e70cbd (boot/grub2: add support to build multiple Grub2
configurations in the same build) broke mender-grubenv by splititng up
BR2_TARGET_GRUB2_BUILTIN_MODULES into two separate symbols, one for
legacy boot, and one for EFI boot.

This causes a systematic build failure now, as the legacy variable
BR2_TARGET_GRUB2_BUILTIN_MODULES is now always empty (during build).

We fix that by suplicating the missing modules check: one for EFI and
one for legacy boot.

The EFI check is tricky: idneed, there can be more than one EFI platform
enabled simlutaneouslyl indeed, on x86_64 we can have bothe ehte 32-bit
and 64-bit EFI platforms enabled. So the check is inverted, and we check
that no platform is not enabled (yeah, double negation). For consistency,
we do the same for the legacy b oot, even though in that case there can
only ever be only one enabled at once at most.

Finally, the install commands are split into two macros, that are also
defined conditionally under the same conditions as the checks are done.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998@free.fr:
  - drop superfluous check on empty modules lists
  - move EFI and legacy commands under same condition as checks
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
changes v1 -> v2:
  - Change ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y) to
    ifneq ($(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI),) to cover all grub2
efi
    scenarios. (Thomas)
  
  - Change BR2_TARGET_GRUB2_BUILTIN_MODULES to
    BR2_TARGET_GRUB2_BUILTIN_MODULES_PC (thomas)

Changes v2 -> v3:
  - Check for both MODULES_EFI and MODULES_PC (Thomas)

Changes v3 -> v4:
  - Add qstrips to needed variables (Thomas)
  - Check for empty module lists (Thomas)
  - Split up MENDER_GRUBENV_INSTALL_IMAGES_CMDS to work with pc and efi
    at the
    same time.

Changes v4 -> v5 (Yann):
  - drop superfluous check on empty modules lists
  - move EFI and legacy commands under same condition as checks
---
 package/mender-grubenv/mender-grubenv.mk | 56 ++++++++++++++++--------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index 07df25512c..a910f55cb4 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -31,14 +31,44 @@ MENDER_GRUBENV_DEFINES = \
 # These grub modules must be built in for the grub scripts to work properly.
 # Without them, the system will not boot.
 MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test regexp
-MENDER_GRUBENV_MODULES_MISSING = \
-	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
+
+# grub2 does not provide a syntetic EFI option, so check all of them
+ifneq ($(BR2_TARGET_GRUB2_I386_EFI)$(BR2_TARGET_GRUB2_X86_64_EFI)$(BR2_TARGET_GRUB2_ARM_EFI)$(BR2_TARGET_GRUB2_ARM64_EFI),)
+MENDER_GRUBENV_MODULES_MISSING_EFI = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
+define MENDER_GRUBENV_INSTALL_EFI_CFG
+	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
+	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
+		$(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT
+endef
+endif
+
+# grub2 does not provide a syntetic legacy boot option, so check all of them
+ifneq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),)
+MENDER_GRUBENV_MODULES_MISSING_PC = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
+		$(MENDER_GRUBENV_MANDATORY_MODULES))
+
+define MENDER_GRUBENV_INSTALL_I386_CFG
+	mkdir -p $(BINARIES_DIR)/boot-part/grub
+	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
+		$(TARGET_DIR)/boot/grub/mender_grubenv* \
+		$(BINARIES_DIR)/boot-part/grub
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
-ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
-$(error The following missing grub2 modules must be enabled for mender-grubenv \
-	to work: $(MENDER_GRUBENV_MODULES_MISSING))
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING_EFI),)
+$(error The following missing grub2 efi modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MODULES_MISSING_EFI))
+endif
+
+ifneq ($(MENDER_GRUBENV_MODULES_MISSING_PC),)
+$(error The following missing grub2 pc modules must be enabled for mender-grubenv \
+	to work: $(MENDER_GRUBENV_MODULES_MISSING_PC))
 endif
 endif
 
@@ -54,21 +84,9 @@ define MENDER_GRUBENV_INSTALL_TARGET_CMDS
 	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-# Overwrite the default grub2 config files with the ones in this package.
-ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
 define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
-	mkdir -p $(BINARIES_DIR)/boot-part/grub
-	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
-		$(TARGET_DIR)/boot/grub/mender_grubenv* \
-		$(BINARIES_DIR)/boot-part/grub
+	$(MENDER_GRUBENV_INSTALL_I386_CFG)
+	$(MENDER_GRUBENV_INSTALL_EFI_CFG)
 endef
-else
-define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
-	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
-	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
-		$(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
-		$(BINARIES_DIR)/efi-part/EFI/BOOT
-endef
-endif
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
