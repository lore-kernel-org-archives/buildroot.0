Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9170CC3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 20:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFEDF400FB;
	Sat, 27 Jul 2024 20:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXmlB5otIoHk; Sat, 27 Jul 2024 20:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F63340354
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F63340354;
	Sat, 27 Jul 2024 20:23:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0720E1BF59B
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 20:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0214581E56
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 20:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EF7SoXqjaY-V for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 20:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F09128128F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F09128128F
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F09128128F
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 20:23:52 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-816ca307407so83994439f.2
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 13:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722111832; x=1722716632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NyZ6ndzocOBcGrkS3PS5ORVMjJfGktCvon6VtI1hW/U=;
 b=C/OHZlNivbu3YYMAiACEhnu/oSOjjPa/uKOotC4By93SKH/E4lsYguFKfJpjC5IHc6
 Ydy8CSz97lRcaBhi1VIDP63Q6ZPQgz8v6cbwodEKV0MhWusYGpYZryjKzm7Tt4m/tCEc
 TPA2Wv/vW6lOSlj6JA54bF7TkpjlVvxChKqzh6nDwc/4RmAEE/qvAqRTAnzMP/3FEIzc
 49umdLz+igP5MylWseeV88AbojWxkkmoA5Xl6tJH04RD1OPapevyHzEG8zn87GiiHdfR
 SvXvMkVEmQr/MndvQbm/pKoB3tZ8MYMGJfE9tW8XvzhSbAXjqnGaSX3Av0wNpqeOAzMr
 IHRQ==
X-Gm-Message-State: AOJu0YwIml9HgRc4ca9KdRqdE3vCkIS3oNjXwnTZ+45kItHSVyShHQUv
 h1T/J+XDFKAw6BWPegCrr2kLbJIt2Db5qRJP2rkYh+zYhsllT0ih/NCb4/OZ
X-Google-Smtp-Source: AGHT+IEmmOQGPe9Fq4fUjAWf+koDHsKcip7Kx5Gp7YxtmUA2MofKf2pkyeteCRABn0FDmeA6EUuUzg==
X-Received: by 2002:a05:6602:6425:b0:804:2216:4b23 with SMTP id
 ca18e2360f4ac-81f95c39323mr439323539f.17.1722111831500; 
 Sat, 27 Jul 2024 13:23:51 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-81f7d6cbfedsm183554239f.10.2024.07.27.13.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 13:23:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 14:23:40 -0600
Message-Id: <20240727202340.1484781-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722111832; x=1722716632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NyZ6ndzocOBcGrkS3PS5ORVMjJfGktCvon6VtI1hW/U=;
 b=bz/DId60wfj0EFpAQ98lj7r2I89EYtRE1RoaGjs7Y+WfO9Go3V8oYI7fT5uPbsbkfa
 eB31ocGNHNOrY7DvVh3krGRQY8XLHtAi5tI0mXmdYYNZxPmcUmUegEuqHJYR1hP9Ovmo
 I1vepNJ5f3yMBFexNoZiJsowZdJvV1/ESLYn57JG9eOiyPUhgS2jHWaojtwLocYyUdZM
 X6Hi+/lMQhD4iiwaQ+Khfnonk86uq9KpDv4/ApB2yO9ouBiyn7XoFsMIUrGl5hEK4np/
 Pex+QxJQ5wAYSZqN+4w9oOGAcu9MMMzrmUNc2OF4E3f+5Hx9v0JZrmNiamolz2VTlvmJ
 s5bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bz/DId60
Subject: [Buildroot] [PATCH v3 1/1] package/tailscale: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - set required CONFIG_TUN kernel config option
Changes v1 -> v2:
  - don't set GOPROXY
---
 package/Config.in                |  1 +
 package/tailscale/Config.in      |  8 ++++++++
 package/tailscale/tailscale.hash |  3 +++
 package/tailscale/tailscale.mk   | 22 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/tailscale/Config.in
 create mode 100644 package/tailscale/tailscale.hash
 create mode 100644 package/tailscale/tailscale.mk

diff --git a/package/Config.in b/package/Config.in
index 90f1ecc877..15965ecb87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2617,6 +2617,7 @@ endif
 	source "package/stunnel/Config.in"
 	source "package/suricata/Config.in"
 	source "package/system-config-printer/Config.in"
+	source "package/tailscale/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
diff --git a/package/tailscale/Config.in b/package/tailscale/Config.in
new file mode 100644
index 0000000000..c81a7134ee
--- /dev/null
+++ b/package/tailscale/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TAILSCALE
+	bool "tailscale"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  The easiest, most secure way to use WireGuard and 2FA.
+
+	  https://github.com/tailscale/tailscale
diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
new file mode 100644
index 0000000000..882ff9d5d0
--- /dev/null
+++ b/package/tailscale/tailscale.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  a961aa07a3b0927cd647d6ae69fc212afbbdb0e4c47b8aeb181cb64360b7f143  tailscale-1.70.0-go2.tar.gz
+sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
new file mode 100644
index 0000000000..13604c9e27
--- /dev/null
+++ b/package/tailscale/tailscale.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# tailscale
+#
+################################################################################
+
+TAILSCALE_VERSION = 1.70.0
+TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
+TAILSCALE_LICENSE = BSD-3-Clause
+TAILSCALE_LICENSE_FILES = LICENSE
+TAILSCALE_GOMOD = tailscale.com
+TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
+TAILSCALE_INSTALL_BINS = tailscale tailscaled
+TAILSCALE_LDFLAGS = \
+	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
+	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
+
+define TAILSCALE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
