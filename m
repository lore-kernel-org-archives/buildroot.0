Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A454EC46CA2
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 17:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 589E8826F5;
	Tue, 19 Dec 2023 17:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 589E8826F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6mJBBvF2tdK; Tue, 19 Dec 2023 17:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D87E83224;
	Tue, 19 Dec 2023 17:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D87E83224
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE1E81BF390
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5E6940280
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5E6940280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6BL4oOakNfv for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 17:24:52 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8476400DC
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 17:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8476400DC
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6d6d48354ccso1673161b3a.1
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 09:24:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703006692; x=1703611492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdGFK9Sgr1DcpaLFQYhc9ftXemYECX5d3esBuog3GQI=;
 b=W8k8g1FShyK+tj6bsA1SsgHjfrG4OazLPbVCCowr/9H8Rl4vjj8wCr40olvagUc/2f
 XJ0uFg4L9Y+mqOX6s5OPGL81UCvGwP+OSSGWMQFzitdHiyehjQfdhktXsLbzf0WajBNI
 6fs1v9bNFOJqi6Yzz7F0DBtmCILF8DLYH9ZZEXQ15Lh6h7VzsMSY8Mf3kt+Jg2xulHI4
 ODrjxzf7HeKYHu4IEx8MZvW4yVk3wfEcKAEYBHHVPtNFLcH1baxstiOM11D8u8Euxh7P
 4v/l2+rY1nE9FZW/wsnczwoluzhrN/XeY4rBL6y6NwODX+YTPr7gbn9OKE958+K7BxYc
 uKlA==
X-Gm-Message-State: AOJu0Yz0QC6TdLk24VJtBe08K4NWJgwHQXs5BnE8FLIWOupvkS+fh6hJ
 jZt4WODz7YhFtSidjRLK71C82i0La2BR3CPEkOk=
X-Google-Smtp-Source: AGHT+IF6lc2Zew2IXSGGFd5REdoFUtbpO9AktkZpBZTj5dX1zVUmjLHEoVqfikvc2McbgBfZHcrNug==
X-Received: by 2002:aa7:8593:0:b0:6d8:d6b1:4ddc with SMTP id
 w19-20020aa78593000000b006d8d6b14ddcmr1765211pfn.7.1703006691722; 
 Tue, 19 Dec 2023 09:24:51 -0800 (PST)
Received: from fedora.. ([75.174.143.7]) by smtp.gmail.com with ESMTPSA id
 g192-20020a636bc9000000b0058901200bbbsm19910829pgc.40.2023.12.19.09.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:24:50 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 10:24:43 -0700
Message-ID: <20231219172446.498409-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
References: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703006692; x=1703611492;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdGFK9Sgr1DcpaLFQYhc9ftXemYECX5d3esBuog3GQI=;
 b=b2ip/E4/riD8JkSmYR6XcLzwdZMrKh7crrqqX5jLYqMC7v02BZyXFr9DOoe0z+YpyY
 qlrRzpwe5jelk9H5tTFYnjXxdl+l/UMpl3ZdLNxV8J9SwCwiWWeeXUfhTNliEJY1G9en
 MQcE9yU+XjkBDW0Q/gHCTtHoGNHYIiWeMjXhg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=b2ip/E4/
Subject: [Buildroot] [PATCH v3 3/6] package/mender-grubenv: bump version to
 64e32b01d1bf54784d2a290ad0469c583e843864
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mender grubenv now expects bios installs to be in boot/grub-mender-grubenv
instead of boot/grub/grub-mender-grubenv.

Also, update the LICENSE hash as the year has been updated to 2023.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index 193bff073b..d44220eadd 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7a08eb3d996afb38c1a4f7c51b7eb44aec6197ff713ce75e4f39d5b448cfc82  mender-grubenv-2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b.tar.gz
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  5232988ff3063a5132099807fcc7da9b70f0bf50a5396f763f4113a80284dff8  mender-grubenv-64e32b01d1bf54784d2a290ad0469c583e843864.tar.gz
+sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index a6d8d48d43..e733ca592c 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = 2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b
+MENDER_GRUBENV_VERSION = 64e32b01d1bf54784d2a290ad0469c583e843864
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
@@ -29,14 +29,14 @@ MENDER_GRUBENV_MODULES_MISSING_PC = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
-MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/grub
+MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot
 
 define MENDER_GRUBENV_INSTALL_I386_CFG
 	mkdir -p $(BINARIES_DIR)/boot-part/grub
 	cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
 		$(TARGET_DIR)/boot/grub/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
-		$(TARGET_DIR)/boot/grub/grub-mender-grubenv \
+		$(TARGET_DIR)/boot/grub-mender-grubenv \
 		$(BINARIES_DIR)/boot-part/
 endef
 MENDER_GRUBENV_TARGET_FINALIZE_HOOKS += MENDER_GRUBENV_INSTALL_I386_CFG
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
