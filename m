Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BF2C369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A997B84008;
	Wed,  9 Apr 2025 20:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iT_L3GOUrE_v; Wed,  9 Apr 2025 20:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC5878402D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC5878402D;
	Wed,  9 Apr 2025 20:04:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FB51201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB37083F94
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwZJOh-XKv0v for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D763881D47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D763881D47
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D763881D47
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-399749152b4so3955154f8f.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229038; x=1744833838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OrozWIypjYVphb9atQkxt3EKGiMInQkI8zenN49gnVc=;
 b=DvkyE2xvNWLJ6Zwggywzxm/T3/D9eFYBys2rhd91vUO85JjC9M6yDXVClXamnzZSQS
 7NOW3/Hp/KU/p2RrlZzhC1xi4n3O3IBlQ9G22BPMLDwnzb4gjgdu569LYem61mmt300m
 iUfvyN6Y4wTCnHBzuIp1UYIstaxYYk+m76i4zuw2OjZrJ8MI9b8idL4M9kazGi7HLmkr
 hi+rJhvsGPAtx1nTH+o6CJuht0kYJtOdsMTtTCTiz0JiUoDNJ0r8740TAZYn1dVp25kk
 o/0dMWxjhbVj0Lc7OClfYOgijJNK08KZMw2D5+bZLSw3lUinrYBbKiBYRpvkrOUOR86c
 GEzQ==
X-Gm-Message-State: AOJu0YwD8Ucb4ecHs80NzZ29swdruzjBMq9v77hqm++5I3w5ZqhxlSo0
 gAC9IFNedMogBjS0h4nfGArcZZ6mISA+DLvo22h40rZGUKbjUgdfikrAng==
X-Gm-Gg: ASbGnct0kAnyV9Egr1oMOu2I1Zm6OHcolyPlPUxuWw4BWXPt4/czLZWwFdieARPqaTV
 2VZBulIgBBxt7/AMugr7Ez0+XQKTw65Ub9TVnEZYeyV7XCeJ5Bc9MH8f6A7iapRBC/30yKldzGq
 5Zsl82TJGs7/b7z+wctJIKK4v565wPv/lTlkAd1qiwPdoK+IHROap7CfeX+i/1KsLDJkGGVI/A/
 5BFPwRkIn9/wuEVYfHlCK0UC2CIoUgtqlFyXKrNjc3W+/CyGHqy1+f+7GQ9tN5yvPEjRL4vvcJN
 tYSvIxELmOqGQ+xhLx8v8I5Fv2UtVukDVD2VoKL6ph5migZgzRPg/0I4Zs33sQ==
X-Google-Smtp-Source: AGHT+IFIEljZD0YkYkxKZmAfEKgfdrmSUqbJJPZ+C77quhn6kb5wajCkB627n1jGq5JMhsfpTUI1Zw==
X-Received: by 2002:a05:6000:430a:b0:39c:1257:feb8 with SMTP id
 ffacd0b85a97d-39d8f4efe45mr45677f8f.56.1744229037763; 
 Wed, 09 Apr 2025 13:03:57 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:57 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  9 Apr 2025 22:03:44 +0200
Message-ID: <6e381e96c2b798f987305ff8e81bbfb2733c1df8.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229038; x=1744833838; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OrozWIypjYVphb9atQkxt3EKGiMInQkI8zenN49gnVc=;
 b=SokahwnZXHrTxDCQuZ3YLn+P/LEoYwxkgnNzBG7DIEeARtiAWXjkqpQNpsOnWrUQlt
 Jl+h2yqfHdmkRE1WcAwGP9Q+H7RETm+ntcJ0MIfHMosFnen8T10dyZILz3x8uDkCuFfU
 N9EVgSzeJdnDOnnkGowvfBs9PgLy/W7ANCWn70lOqaJ2cszRTxQYR/gam0QE2yCy+bwd
 r7KLBO2jXgU03Djhu3/7yNjPu7/PE8AG46blkrVdRYvAJ7Lkhe6tpDvyvOxfNsZT4auU
 XIkjnjEQnk8x1AmhkTmK6qaxoKcT3UqAFCa/vXqAhTYFY7fELxjwZ9gYotq5Hrb6x/1l
 +/2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SokahwnZ
Subject: [Buildroot] [PATCH 29/29 v2] package/fx2lafw: new package
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

sigrok.org's IPv6 is unresponsive, and as it is the first one tried when
connecting, this causes a huge delay when fetching; indeed, our git
backend does at least three git-fetch, each timing out after ~135s, for
a total of ~400s, plus the time of download (which is fortunately rather
small for this package). So, force use of IPv4.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/fx2lafw/Config.in    | 11 +++++++++++
 package/fx2lafw/fx2lafw.hash |  5 +++++
 package/fx2lafw/fx2lafw.mk   | 21 +++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/fx2lafw/Config.in
 create mode 100644 package/fx2lafw/fx2lafw.hash
 create mode 100644 package/fx2lafw/fx2lafw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b4250a5dbf..ccc1f0c61a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3439,6 +3439,7 @@ F:	package/gloox/
 F:	package/tpm2-pkcs11/
 
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
+F:	package/fx2lafw/
 F:	package/sdcc/
 
 N:	Yann E. MORIN <yann.morin@orange.com>
diff --git a/package/Config.in b/package/Config.in
index 28bdae9c1b..9e2e63b144 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -445,6 +445,7 @@ menu "Firmware"
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
index 0000000000..d5709c0284
--- /dev/null
+++ b/package/fx2lafw/fx2lafw.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  8efa8c555384a463a50a0d8ff12dbe718308132fdcf0db0d45b1cadb0868f52f  fx2lafw-0f2d3242ffb5582e5b9a018ed9ae9812d517a56e-git4.tar.gz
+sha256  5081618178f9a8946720f37b898fb502a06d470092dbeb64041fa988a45aab8c  README
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/fx2lafw/fx2lafw.mk b/package/fx2lafw/fx2lafw.mk
new file mode 100644
index 0000000000..0368208d85
--- /dev/null
+++ b/package/fx2lafw/fx2lafw.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# fx2lafw
+#
+################################################################################
+
+FX2LAFW_VERSION = 0f2d3242ffb5582e5b9a018ed9ae9812d517a56e
+FX2LAFW_SITE = git://sigrok.org/sigrok-firmware-fx2lafw
+
+# The IPv6 is unresponsive, causing huge delays during download, so force IPv4
+FX2LAFW_DL_OPTS = -4
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
