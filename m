Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC9C3ABD9
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 09:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA92E82095;
	Wed, 14 May 2025 09:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iki2-BLxNNem; Wed, 14 May 2025 09:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD1BC8308D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD1BC8308D;
	Wed, 14 May 2025 09:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E9A012A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44C3A82077
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKXuinm-LySw for <buildroot@buildroot.org>;
 Wed, 14 May 2025 09:07:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 194A8836C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 194A8836C3
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 194A8836C3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:07:49 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5fc003315dcso1271958a12.3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 02:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747213668; x=1747818468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ipwVAZgSrui/nlxjK20wrWfDW68uvmDKyUfFwtVWwRI=;
 b=YrN92SbFwpHgPSS7GRg8p3FfvPsRvRwbAzFTJH90KHD3DzfRlpGki8rVpUfvKi0R1e
 e4dNYkodx9saOZ9XyO7uxcxWcDF1rO+ui34etryAihKRbzqpn50KWnKpEw/s6F/mih+6
 NdmXgF1/K2muBV9nJkxXB4a6JWTF0OMGi1EmC1Cc673/XZBW1BCzC9h/pWDbnWoSt16O
 Ost6ggZEfzJs7RjbHc+ZvNgpiyF3DpJriSTmxItrjH7v2LiEGloAspatMNERikv2hLGF
 b25sXn0cF9oF0BuSI7e6AIIJkf/LS6w1ZO0Iv8+uauqNyZl4q+r0pMBtwYc8OIVaNxYr
 8tnA==
X-Gm-Message-State: AOJu0YzZmVXgfxlegmc9TDX5a3Nb/0ttB2cPb/5UxhRWISWHGslzHpZX
 cd7AyvRfvjQVcSkJcOcTqI0+WU0r5rQfLXMvQspAusvUsUb/3ymDuQUytIa1H57BfkWRu5ZP5lR
 h
X-Gm-Gg: ASbGncsJ5cVMTJDThcVHHz3YkAA93L3KmGGhZNJFvFLRnpC1lBMw6H/SNRf1hVeCqQG
 7Cnl5qr/RFfAOkK/gZgg9BfLCUKVwAhiWPGGlIlNZV1HkY1fVzc7DLaEMBoisvoqGMgo1RuJz30
 8N3Zc8PDERhHxM1CpUOEjOv9q7Zti/uE8pNdpgiE5besnWCA2q7Ce5bUabrRKM16etGhAI8xPIf
 llTDgsDJHmSysstb+yKW95L5KqYBlr6EPDRm/ciKVoNapiV6B18k3Mw1+u9/FDvk9qpR2PNunK/
 8u8Os5xDkOF1+HPocz6t3ipnyXZ0yY+JU7syV7eK435vAlcw87oysk9NaNOn3B7gPv/gPDP73CT
 6noS6iQ7UPNP831m3X/EaeUdU9T3Cl1iiY9a27tsZEGYiGIT0WOG8uYjfl2OTKijBFx4bG7wTfA
 EmB/aoKjf/8vKgPjsFGeL+
X-Google-Smtp-Source: AGHT+IGh8YbL48QfXcJAtKb/zFPCpyhc3d85RmFVdNY85TKISf59V9kO284D5XrysoIVxjMpCETj/Q==
X-Received: by 2002:a05:6402:1eca:b0:5ee:497:5221 with SMTP id
 4fb4d7f45d1cf-5ff988f5683mr673162a12.11.1747213667454; 
 Wed, 14 May 2025 02:07:47 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fe86b239d1sm3998693a12.35.2025.05.14.02.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 02:07:46 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 14 May 2025 11:07:44 +0200
Message-ID: <20250514090744.3586626-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747213668; x=1747818468;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ipwVAZgSrui/nlxjK20wrWfDW68uvmDKyUfFwtVWwRI=;
 b=e+NLokpvARGCqP59BwMzPAt2/Nv9hAB0vAdnF+He7cLWIRlIE0f8UwFAVe+5dP+aGQ
 rHZWslyfZugn9UGEl7ZLhYHj4KKQp0Vflpd2rsobhTidXpDLSRTh75b3R2MobgpNv4C3
 ngDVIdP5Ugkgmf2s+zDtx9R4krFGnbcsl6Vjs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=e+NLokpv
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 257.5
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

Noteable changes:
  - Add -Dipe=false and -Dsysupdated=disabled as defaults to CONF_OPTS and
    HOST_CONF_OPTS. If another user has a use for either, they can submit a
    patch at a later date.

  - systemd-networkd now requires kernel >= 5.4 due to the inclusion of the
    sockios.h header, which uses the SIOCGSTAMP_OLD macro. This macro was first
    introduced in kernel 5.2, but the official README recommends 5.4 as a
    baseline, so stick with that. Due to this change:
      - systemd-networkd now depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
      - default y only if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
      - Add a section in migrating.adoc about the new requirement

  - The sha256sum of README.md changed due to the addition of some CentOS CI
    lines.

  - Add the new license file LICENSES/alg-sha1-public-domain.txt.

Tested with `./utils/test-pkg -p systemd -a`
40 builds, 28 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Tested with `./support/testing/run-tests tests.init.test_systemd`
All tests passed

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 docs/manual/migrating.adoc   |  7 +++++++
 package/systemd/Config.in    | 12 +++++++++---
 package/systemd/systemd.hash |  5 +++--
 package/systemd/systemd.mk   |  8 ++++++--
 4 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 1b55bc6173..4cc88d19ae 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -209,3 +209,10 @@ or with a startup script.
 Note that systems using systemd are not impacted: systemd always ensures
 that `/run` is writable. Systems further using systemd-resolved already
 had a `/etc/resolv.conf` that pointed into `/run` anyway.
+
+[[migrating-systemd]]
+=== Migrating to 2025.08
+
+In 2025.08, starting with systemd version 257, systemd-networkd requires kernel
+5.4 or later. If you are still using a kernel older than 5.4, please update
+your kernel or use an alternative network manager.
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 851b91aeba..320d416203 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -52,9 +52,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  an elaborate transactional dependency-based service control
 	  logic.  It can work as a drop-in replacement for sysvinit.
 
-	  Kernel versions below 4.15 ("recommended baseline") have
+	  Kernel versions below 5.4 ("recommended baseline") have
 	  significant gaps in functionality and are not recommended
-	  for use with this version of systemd.
+	  for use with this version of systemd. (e.g. lack race-free
+	  process tracking by pidfd, systemd-networkd, and new mount
+	  API support).
 
 	  Systemd requires a Linux kernel >= 3.15 with the following
 	  options enabled:
@@ -354,7 +356,8 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
-	default y
+	default y if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	help
 	  systemd-networkd is a system service that manages networks.
 	  It detects and configures network devices as they appear, as
@@ -365,6 +368,9 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
+comment "systemd-networkd needs a toolchain with kernel headers >= 5.4"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 config BR2_PACKAGE_SYSTEMD_OOMD
 	bool "enable out-of-memory killer"
 	help
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 976d88c1f5..ca7ff360b5 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,7 +1,8 @@
 # sha256 locally computed
-sha256  896d76ff65c88f5fd9e42f90d152b0579049158a163431dd77cdc57748b1d7b0  systemd-256.7.tar.gz
+sha256  4d65f9482608cf9f7823df42a6d7796f0e0dfcfb94301df75effff86d40da33e  systemd-257.5.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
+sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
 sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  LICENSES/BSD-3-Clause.txt
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
@@ -12,4 +13,4 @@ sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  3df2dfbb09215ab1aecdd3c91d7fbe02fee4a0e75ef8967a25d1a6fe3b8abc06  LICENSES/README.md
+sha256  8f3141489df84100440efa9911603e83757ff97f26f737e1d7fa2b25207a7905  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 337d52b1f2..a6a2f5a818 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 256.7
+SYSTEMD_VERSION = 257.5
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -35,6 +35,7 @@ SYSTEMD_LICENSE = \
 SYSTEMD_LICENSE_FILES = \
 	LICENSE.GPL2 \
 	LICENSE.LGPL2.1 \
+	LICENSES/alg-sha1-public-domain.txt \
 	LICENSES/BSD-2-Clause.txt \
 	LICENSES/BSD-3-Clause.txt \
 	LICENSES/CC0-1.0.txt \
@@ -73,6 +74,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dfirst-boot-full-preset=false \
 	-Didn=true \
 	-Dima=false \
+	-Dipe=false \
 	-Dkexec-path=/usr/sbin/kexec \
 	-Dkmod-path=/usr/bin/kmod \
 	-Dldconfig=false \
@@ -99,6 +101,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dfuzz-tests=false \
 	-Dinstall-tests=false \
 	-Dlog-message-verification=disabled \
+	-Dsysupdated=disabled \
 	-Dtmpfiles=true \
 	-Dukify=disabled \
 	-Dbpf-framework=disabled \
@@ -1011,7 +1014,8 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dopenssl=disabled \
 	-Dp11kit=disabled \
 	-Dlibfido2=disabled \
-	-Dpcre2=disabled
+	-Dpcre2=disabled \
+	-Dsysupdated=disabled
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
