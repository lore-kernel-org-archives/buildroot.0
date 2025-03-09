Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EBBC28B25
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 13:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FB9820C7;
	Sun,  9 Mar 2025 13:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibAQjuspy6BJ; Sun,  9 Mar 2025 13:03:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE032820C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE032820C9;
	Sun,  9 Mar 2025 13:03:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9971FDC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 13:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88B44605F7
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 13:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJ6tjud2j5Ga for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 13:03:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=kanakshilledar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A22F2605D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A22F2605D2
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A22F2605D2
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 13:03:00 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2fc92215d15so931685a91.1
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 06:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741525380; x=1742130180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMS+kZdr+iV5bfuG+jM1WvUYL3bmpEv9lDuT45eAXDk=;
 b=mS4wDiz9bT6Ip39o8r/plhCq/QqvZYNa4gYA453z7XoBwNuNa5YjZnIPjZ5mgK8UWh
 f9mrIhypzsqQDbmFU8QfmFo8BogB1e7GIYRRVxm9OzT/Xtc3CKUXu0s1DcbBwbnuKyY1
 55cVK3wlwRioMnCRODfMoU5s8ArZY7MwAqDG2SjiZIf7hpMOLHO+IWTlNYo3n+e1u1Se
 R5mdGlnnRshOv9tTnVooN1dqa+Qh+zO7cOluaVKP97kvlbhm8OTlBYXQiy7dhK4bWr2z
 1q01O4fkhNxVBL18sUyHW6RBVsD7WzJjO4TmbjLnmyj97SfZ6GXtwgwtY64+xSVWByuh
 NzxA==
X-Gm-Message-State: AOJu0Yy/1Cx490CchhIx/8RzKnkkjaVdR/1xUKzqyxjkade5E1g7CH9u
 muwLnbbAUQYXasd5j9KmWTeuFTNG2bXOt8ZxSGwZTmrTSvvkEtNsEhLlQoGB
X-Gm-Gg: ASbGncsSYgJPq88mFdL2Gu6D2HUm5KGJvmPi9SA7bDYeCE1A7NTRl9lUqpoPGLK/7l8
 PzWt3q5XVYYCR7nZbn840JI+eXfPE4xjLADbpR83YhwariOc7rU1uj9k04hxCd+HSVWP6c32V6u
 F51ri102cdymRWgfVUV2ZHjt0Ff9dZU4mLz6gfwckQOFyLa3mn6NI7tQJ0NzUDuqlRiSDwHGOWa
 3iUwFGo0W9FbhVJ229py5ljcs4xWX2mi+VpxqKEXzOIdLt5NL9oAf0ZNyhxQVdbWxNwcRCmGbyR
 bhqJ6I3eeUZLUlW33AWh+vU2/IH4EnUM45msj4VINUvRRVnDYHSvywgQkd75
X-Google-Smtp-Source: AGHT+IExDoedRFppLm9rFrBZyhzJSr16s7hrR0At3NTH3ZxUi/c4gIVZN2CCEwQCmzC9ZIcmsMIjaA==
X-Received: by 2002:a05:6a20:12c6:b0:1f3:2c55:8d7c with SMTP id
 adf61e73a8af0-1f5582f06f6mr3374116637.7.1741525379758; 
 Sun, 09 Mar 2025 06:02:59 -0700 (PDT)
Received: from ga401ii.. (j254.ucndns.in. [103.155.210.254])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-736dae80528sm43377b3a.133.2025.03.09.06.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 06:02:59 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun,  9 Mar 2025 18:32:31 +0530
Message-ID: <20250309130230.1520839-4-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309130230.1520839-2-kanakshilledar@gmail.com>
References: <20250309130230.1520839-2-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741525380; x=1742130180; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMS+kZdr+iV5bfuG+jM1WvUYL3bmpEv9lDuT45eAXDk=;
 b=myTgyV2VrADxITSNzuYddbtWGpBcpunpAwcAllYYZ64NhDhgr3CmYIVJYox4zfjdbz
 MeCyCn0yaJuYRfjL8Ks4bToxgyj72+s/ImfsqsUhgVCcfT9K3ZcQPAYLw3/Fjr+kOSVi
 +fCrovEd2W2bka5weSpbiV9GWeEQ0hlfH5rwQ5urVatsaUJcrKiWQk/jCNVoy4oiEre7
 DiE/WR+JXyQXuJrgTsC9VqiBgKw6zUrgRzHa6hecWngeJJAgQKI93cj4u+Svsi5hH8T8
 74Y+/7JSf6Uz7M6L9sVkibRTaK5LiPoumLdGMxhQWKIjZ+3Ptf6RpoGV5Xn7knfW+8df
 4qcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=myTgyV2V
Subject: [Buildroot] [PATCH v2 1/2] package/sipeed-lpi4abin: add licheepi4a
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

---
Changes in v2:
 - simplify the BR2_PACKAGE_SIPEED_LPI4ABIN condition.
 - change the _VERSION to latest commit hash instead of branch name.
 - uncommented _LICENSE and removed _LICENSE_FILES.
 - simplify the boot bins filenames.
 - simplify the image install commands.
 - assigned this package to self in DEVELOPERS.
---

Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
 DEVELOPERS                                   |  3 +++
 package/Config.in                            |  1 +
 package/sipeed-lpi4abin/Config.in            |  5 ++++
 package/sipeed-lpi4abin/sipeed-lpi4abin.hash |  2 ++
 package/sipeed-lpi4abin/sipeed-lpi4abin.mk   | 26 ++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/sipeed-lpi4abin/Config.in
 create mode 100644 package/sipeed-lpi4abin/sipeed-lpi4abin.hash
 create mode 100644 package/sipeed-lpi4abin/sipeed-lpi4abin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f04dd2a1e..45eed3630c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2054,6 +2054,9 @@ F:	package/libodb-mysql/
 F:	package/libqb/
 F:	package/usbguard/
 
+N:	Kanak Shilledar <kanakshilledar@gmail.com>
+F:	package/sipeed-lpi4abins/
+
 N:	Karoly Kasza <kaszak@gmail.com>
 F:	package/irqbalance/
 F:	package/openvmtools/
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
index 0000000000..1f9791b0bd
--- /dev/null
+++ b/package/sipeed-lpi4abin/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_SIPEED_LPI4ABIN
+	bool "sipeed-lpi4abin"
+	depends on BR2_riscv
+	help
+	  This package provides TH1520 SoC binary blobs for LicheePi 4A.
diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.hash b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
new file mode 100644
index 0000000000..9d66be164b
--- /dev/null
+++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  a1c608a7b0cc641d39666a07d8bb1a73ded35385316989c3e8182d968ed89b3e  sipeed-lpi4abin-44ec4e1cc82141963842ec45db0d1617f9f07e75-git4.tar.gz
diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.mk b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
new file mode 100644
index 0000000000..315075cede
--- /dev/null
+++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# sipeed-lpi4abin
+#
+################################################################################
+
+SIPEED_LPI4ABIN_VERSION = 44ec4e1cc82141963842ec45db0d1617f9f07e75
+SIPEED_LPI4ABIN_SITE = https://github.com/revyos/th1520-boot-firmware.git
+SIPEED_LPI4ABIN_SITE_METHOD = git
+SIPEED_LPI4ABIN_LICENSE = PROPRIETARY
+
+SIPEED_LPI4ABIN_INSTALL_IMAGES = YES
+SIPEED_LPI4ABIN_INSTALL_TARGET = NO
+
+SIPEED_LPI4ABIN_FILES = \
+		addons/boot/light_aon_fpga.bin \
+		addons/boot/light_c906_audio.bin \
+		addons/boot/str.bin
+
+define SIPEED_LPI4ABIN_INSTALL_IMAGES_CMDS
+	$(foreach f,$(SIPEED_LPI4ABIN_FILES), \
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
