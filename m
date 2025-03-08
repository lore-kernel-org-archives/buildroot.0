Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81D9C282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 06:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5898361107;
	Sat,  8 Mar 2025 06:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgpFMlCKe21o; Sat,  8 Mar 2025 06:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4722D6110C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4722D6110C;
	Sat,  8 Mar 2025 06:13:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E73FA1C9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 06:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA7E46110C
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 06:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJHBl4yJEE4Q for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 06:13:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=kanakshilledar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E012761107
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E012761107
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E012761107
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 06:13:32 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ff62f9b6e4so668624a91.0
 for <buildroot@buildroot.org>; Fri, 07 Mar 2025 22:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741414411; x=1742019211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zEvj6tDZEPJUVDVHrDj1dksvP18OedGTgJW5WSBZLc=;
 b=JrnHOahFTa9xaRF1Y4Lq6DpXeBsvpQK3w6AXEfcJ1yBTgAqrA6p7mu9Z2nQ49rfuYs
 0YdWClS4bWDpaGMwt70fUm5GIssuyT6sACTxAt0rrWFsjnrJDoIuged8AS8SKztanNCU
 69ktEI/FHDk2Ko9L8K0674X17VWinSXFZUrFHVchfW/m9ftmrJXJmMtn4z9V8QSzjonH
 Ra8tOjWzkVBN0eZPXITPi/TiPblVjMGhWf086718dge/5FtPtKzl6gBdmYKrnka0jKU0
 S8EHxkhq+PwGrXfrUsuvavWLwMHIvI292gLNaE46/o1/ujXoeYU3g5YOcb73OTApXmyD
 oldQ==
X-Gm-Message-State: AOJu0Yy3jrEBYLTkNdGVHxFWX/Iu+8aNtISqVOK7QWPr/QfdNleSejL0
 AXY2Y9WzfcQnVz1iFIVL8eXjelDnv3cUGLoaICBOxu+8/cqVJIMoDSe5W+OC
X-Gm-Gg: ASbGncvS4DbqXgPYnz5v6Q8ErJkJVWb2b8VnLvyMXMO8C3Z4PUWBfhhyBpQAvnM/dyv
 13K5xg4YpLPVSkwG5o3dBBiTpheSYqdIvgqKREecW6f4nVykOZ0K13gAfPwAwaUEUIHIbnH1ZS6
 Y933Ri2qC239xI6+oEH02idMMUP+k4EN8xbJv/If3WmZ9L0zAeiky88nKBC56TyX2G6x3y7yBVf
 oTji+vkFcL0HfTkOrMCw+p+K3vZJ1WCnAYYmdlDyYrfNLRhkoR9owShGhFxmxSuon8pLxZltxJf
 Ia4Nbxq87Z5KObo1Wi1ehkV8mapnDHHDnvZGllAlSFuLs6UIpYyZJQHMnE4=
X-Google-Smtp-Source: AGHT+IHAfaCRgHJ6GlNIbk7MQdb4euIo5dEtSNQfTDhQMg5KAs/8ffNWWNNMX5oiVTTsdECmYtBvuA==
X-Received: by 2002:a05:6a00:4fc7:b0:736:3222:c392 with SMTP id
 d2e1a72fcca58-736becb1adfmr1093201b3a.2.1741414411491; 
 Fri, 07 Mar 2025 22:13:31 -0800 (PST)
Received: from ga401ii.. (n235.ucndns.in. [103.183.91.235])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-73699da011asm4189922b3a.84.2025.03.07.22.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 22:13:31 -0800 (PST)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>
Date: Sat,  8 Mar 2025 11:42:45 +0530
Message-ID: <20250308061245.1774235-3-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250308061245.1774235-2-kanakshilledar@gmail.com>
References: <20250308061245.1774235-2-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741414411; x=1742019211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zEvj6tDZEPJUVDVHrDj1dksvP18OedGTgJW5WSBZLc=;
 b=ZfQmggGvo4Fowbzw8OauD+ggiv9DnQfhuvu1NgQpZquQpuQ1hVqQ1+gfNJ9ND/9jqq
 6Y4WjQDk5v8s5iTnrJtqi2JbKOh03hmFQuRJ/pnn7Dtt8XqrxXnsOWLpOsnGJGH+dv2i
 7u+Zh6jnX1SU2lVFWh8tfkuNGOmQ5ee+kV3c3dK0giURUsrae+o5kbr+1QE62tEQWVbT
 o+IeNR64wOKObGXSK3DyBvxPmnHDAdC88FLMpJGAKsNuzG3WXUBW3K3wQ/gL0GmYPI2m
 KQnynPFqkQMaq3uNTHugdj+FOvLcJ/rzb6E0nue5gqPygueB2XVEeEab4mp6adHL4eQ3
 Asyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZfQmggGv
Subject: [Buildroot] [PATCH 1/2] package/sipeed-lpi4abin: add licheepi4a
 boot bins
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

Sipeed LicheePi 4A requires some proprietary binaries
for booting, these are provided in the th1520-boot-firmware
repo [1]. These binaries are also required for the onboard
sound and wifi.

[1] https://github.com/revyos/th1520-boot-firmware

Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
 package/Config.in                            |  1 +
 package/sipeed-lpi4abin/Config.in            |  5 ++++
 package/sipeed-lpi4abin/sipeed-lpi4abin.hash |  2 ++
 package/sipeed-lpi4abin/sipeed-lpi4abin.mk   | 30 ++++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/sipeed-lpi4abin/Config.in
 create mode 100644 package/sipeed-lpi4abin/sipeed-lpi4abin.hash
 create mode 100644 package/sipeed-lpi4abin/sipeed-lpi4abin.mk

diff --git a/package/Config.in b/package/Config.in
index 4a81a62ec4..ce8cb95d7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -616,6 +616,7 @@ endmenu
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
 	source "package/sigrok-cli/Config.in"
+	source "package/sipeed-lpi4abin/Config.in"
 	source "package/sispmctl/Config.in"
 	source "package/smartmontools/Config.in"
 	source "package/smstools3/Config.in"
diff --git a/package/sipeed-lpi4abin/Config.in b/package/sipeed-lpi4abin/Config.in
new file mode 100644
index 0000000000..b8dc9fbc9e
--- /dev/null
+++ b/package/sipeed-lpi4abin/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_SIPEED_LPI4ABIN
+	bool "sipeed-lpi4abin"
+	depends on BR2_riscv=y
+	help
+	  This package provides TH1520 SoC binary blobs for LicheePi 4A.
diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.hash b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
new file mode 100644
index 0000000000..f7a8abdfdd
--- /dev/null
+++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 e5b29e1267009617dcf7cf3d0d59d7de62b06b96bb1981de3206b9a53123481f  sipeed-lpi4abin-master-git4.tar.gz
diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.mk b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
new file mode 100644
index 0000000000..c0aadef35f
--- /dev/null
+++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# sipeed-lpi4abin
+#
+################################################################################
+
+SIPEED_LPI4ABIN_VERSION = master
+SIPEED_LPI4ABIN_SITE = https://github.com/revyos/th1520-boot-firmware.git
+SIPEED_LPI4ABIN_SITE_METHOD = git
+# SIPEED_LPI4ABIN_LICENSE = PROPRIETARY
+# SIPEED_LPI4ABIN_LICENSE_FILES = LICENSE
+
+SIPEED_LPI4ABIN_INSTALL_IMAGES = YES
+SIPEED_LPI4ABIN_INSTALL_TARGET = NO
+
+SIPEED_LPI4ABIN_AON_FPGA_FILENAME = addons/boot/light_aon_fpga.bin
+SIPEED_LPI4ABIN_C906_AUDIO_FILENAME = addons/boot/light_c906_audio.bin
+SIPEED_LPI4ABIN_STR_FILENAME = addons/boot/str.bin
+
+define SIPEED_LPI4ABIN_INSTALL_IMAGES_CMDS
+	$(foreach f, \
+		$(SIPEED_LPI4ABIN_AON_FPGA_FILENAME) \
+		$(SIPEED_LPI4ABIN_C906_AUDIO_FILENAME) \
+		$(SIPEED_LPI4ABIN_STR_FILENAME) \
+		, \
+		$(INSTALL) -D -m 0644 -t $(BINARIES_DIR)/bootbins $(@D)/$(f)
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
