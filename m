Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2000BC021AB
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4B4F84DA8;
	Wed, 19 Feb 2025 08:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3kpGPVEM_3M; Wed, 19 Feb 2025 08:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12A684DA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12A684DA1;
	Wed, 19 Feb 2025 08:52:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E553DC8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD767410D1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-vWt4eSP5KD for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BAB6411CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BAB6411CD
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BAB6411CD
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4396a4d5e3bso48323865e9.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955061; x=1740559861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LV3oG5ip/Ap7dHRk7DMwmi+4M3VZrHjz/0O9JVylXWk=;
 b=vxbZOCDrk/LK3ERH8zMdzLLUBlIt+8370gqEbw4LtettD8WyOccIPmJRIbxHu6TPWY
 q3BXtfzjVfltpKz6PZMwP2B0B/EvkeIIj54V/+OP2Tivp1//7lSDYAU3jJDWj8+TtSsn
 umVZ93et7G2kwCknyJN3RJf44gPOyY7PVALwNE2FkIwzegQVkchREFlFmCohnaDYlGCQ
 Wx5uBeBH7IJEp4oW5aj8TJUELnXAhZM+0uZhPgZvqw5GiqYsCocDv/4MXjvkOVTUFR2y
 mCMiHZZw1no4+a/zoLB7DFkCpLaCjDjusOcPMsv3Bh8E2QM8HW9JvYeZP1GmakH8/9MZ
 FniQ==
X-Gm-Message-State: AOJu0YzoYBKsQXyPAEXNmuBk4OJj4enNFqmnwS7P/eI8M0Yx3Kipj3hq
 /oT1x8PQYIXTQekSBOxoGLW5JpzHOS3omcEuRgnJ3JtxxBK3fk2zKutVNQ==
X-Gm-Gg: ASbGncvkZ9gTyYZOFyMVTltVSk1DuY5iuscdbTxNd5fCaUPum2kpcRiJjKP5rDe/ykR
 YYEpxcd067F5SqytYwUY0iypgSwR4PspVadb/maYcsheE1myQR7eNsTUbeJ9NHA0pvAnXjab0LC
 MNdyoTxrgDIC0okvuj8M9Dft72ibNFKl3JLdTHo5IHmOP/wjpHOWwJGnK2uRxrofZI4agtgNID8
 ktRGemG7PcVWv4DT8nsbDMHLZc9nJaNyDdPp/0U1A1hBvBvSM9Xw7UqsSDvd63pRSNPn3kVyfdG
 FZg4hotbSK1I7hDjd73gkj2q9Q==
X-Google-Smtp-Source: AGHT+IHoSNtHwqRcyAdzTy27dnh0+TF+3YfBQvCjHl9Qcmwn4xMkCXhDKzAOdUDV6bIld0dGWSCvSA==
X-Received: by 2002:a05:600c:1c18:b0:439:6d7c:48fd with SMTP id
 5b1f17b1804b1-43999d755acmr24587235e9.4.1739955061009; 
 Wed, 19 Feb 2025 00:51:01 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:51:00 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2025 09:50:42 +0100
Message-ID: <20fb13c87db6e0a2da3afa4e5119583a73473a2f.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955061; x=1740559861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LV3oG5ip/Ap7dHRk7DMwmi+4M3VZrHjz/0O9JVylXWk=;
 b=S9ItSiiziu0rBGDVaN4wrCa89kDDDQMkGGeCXJOWhIlay6c88OhSwQIPXKdS69eyCO
 MNSjpKC1bFPOr+Q9aBVXAiKEvVKpUkyKOmWB0A7ModV06to7Qt+fdYOT4zoTivw+QZre
 bnUi9C7Mv9OtceWauHr/aGNLIQhm1OLSB5ZEyjnbofZ7nGPLjZ0kF7OkpTLKRWheCHG9
 w7or15U/JWmhgtumN/BLJrN+mDstZ7mUENJ1st4tat9ZMn9k2iL+ZvNzROO9ifwgQk4Y
 EFCxM8rAK6cWco4e1lGnmFjFvZPn1t6tal6lSTti/TKHfgimEKZAAltuCnxhfBvyeTCz
 vcKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S9ItSiiz
Subject: [Buildroot] [PATCH 27/27] package/fx2lafw: new package
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

fx2lafw (FX2 logic analyser firmware) is a set of firmware files for
FX2- or FX2L-based logic analysers. It is developped by the Sigrok
project.

The latest release, 0.1.7, is more than 5 years old now, and no longer
builds with recent sdcc versions (starting with 4.2.3). The git tree has
fixes for those build failures. Rather than backport the 4 commits of
interest, just use the git tree directly: it contains another unrelated
fix, a few documentation changes, and two new firmwares. Also, given the
git tree has not been touched since early 2024, and given the frequency
of releases before that, don't wait to get those two new firmwares.

fx2lafw bundles fx2lib. Usually, we'd avoid using a bundled version, but
in this case, it is an old version, and anyway fx2lafw can't use a
pre-installed version. The probability that another package would use
fx2lib is extra slim as well; if we eventually get one, the chances it
also bundles its own copy are also relatively high. And finally, fx2lib
runs on a separate microcontroller, not on the target's main CPU, so it
can't be shared to any "real target" package. There is no reason to
expand the efforts to unbundle it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Note: sigrok.org's IPv6 is unresponsive, and as it is the first one
tried when connecting, this causes a huge delay when fetching; indeed,
our git backend does at least three git-fetch, each timing out after
~135s, for a total of ~400s, plus the time of download (which is
fortunately rather small for this package). So, during review, do not
be alarmed that the download takes ages: that's just it, it *does* take
ages... :-/
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/fx2lafw/Config.in    | 11 +++++++++++
 package/fx2lafw/fx2lafw.hash |  5 +++++
 package/fx2lafw/fx2lafw.mk   | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/fx2lafw/Config.in
 create mode 100644 package/fx2lafw/fx2lafw.hash
 create mode 100644 package/fx2lafw/fx2lafw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4d0d294a8f..89b246266c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3417,6 +3417,7 @@ F:	package/gloox/
 F:	package/tpm2-pkcs11/
 
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
+F:	package/fx2lafw/
 F:	package/sdcc/
 
 N:	Yann E. MORIN <yann.morin@orange.com>
diff --git a/package/Config.in b/package/Config.in
index cb84e3caad..1370f6561b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -444,6 +444,7 @@ menu "Firmware"
 	source "package/armbian-firmware/Config.in"
 	source "package/b43-firmware/Config.in"
 	source "package/brcmfmac_sdio-firmware-rpi/Config.in"
+	source "package/fx2lafw/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/nxp-bt-wifi-firmware/Config.in"
diff --git a/package/fx2lafw/Config.in b/package/fx2lafw/Config.in
new file mode 100644
index 0000000000..675750d114
--- /dev/null
+++ b/package/fx2lafw/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_FX2LAFW
+	bool "fx2lafw"
+	select BR2_PACKAGE_HOST_SDCC
+	select BR2_PACKAGE_HOST_SDCC_DEV_LIB
+	select BR2_PACKAGE_HOST_SDCC_MCS51
+	help
+	  fx2lafw is an open-source firmware for Cypress FX2 chips which
+	  makes them usable as simple logic analyzer and/or oscilloscope
+	  hardware.
+
+	  https://sigrok.org/wiki/Fx2lafw
diff --git a/package/fx2lafw/fx2lafw.hash b/package/fx2lafw/fx2lafw.hash
new file mode 100644
index 0000000000..4584dedbb2
--- /dev/null
+++ b/package/fx2lafw/fx2lafw.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  2631ef96a48d1dc4589c46d50334262ea14a761a32e345f1f2fd71ef0c27a799  fx2lafw-bb3c6dfdb3f95bf529ed95dcc5fb3610e4473673-git4.tar.gz
+sha256  5081618178f9a8946720f37b898fb502a06d470092dbeb64041fa988a45aab8c  README
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/fx2lafw/fx2lafw.mk b/package/fx2lafw/fx2lafw.mk
new file mode 100644
index 0000000000..d209f04003
--- /dev/null
+++ b/package/fx2lafw/fx2lafw.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# fx2lafw
+#
+################################################################################
+
+FX2LAFW_VERSION = bb3c6dfdb3f95bf529ed95dcc5fb3610e4473673
+FX2LAFW_SITE = git://sigrok.org/sigrok-firmware-fx2lafw
+
+FX2LAFW_LICENSE = GPL-2.0-or-later, LGPL-2.1-or-later (fx2lib)
+FX2LAFW_LICENSE_FILES = README COPYING COPYING.LESSER
+
+FX2LAFW_DEPENDENCIES = host-sdcc
+
+# Straight our of git tree
+FX2LAFW_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
