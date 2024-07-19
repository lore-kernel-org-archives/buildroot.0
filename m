Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB2AC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 21:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD31180BF4;
	Fri, 19 Jul 2024 21:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mcDWKlefSzW; Fri, 19 Jul 2024 21:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACDBE80C02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACDBE80C02;
	Fri, 19 Jul 2024 21:18:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C72131BF4E7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B499380C02
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3l7K2Rv3lBE for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 21:18:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C39A980B96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C39A980B96
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C39A980B96
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 21:18:40 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-808a8c90f5bso85981239f.2
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721423919; x=1722028719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kscGryAPbkYG7cu8vfFcun5LDZJdt3g+tpGnFwbIR64=;
 b=ZYKH1bPeoCgLF1FLAtpyHjwKR30VT3VshJNwcVdYGGbmXGdJhKlFqmwqLBMzH5wGwc
 JCrv1es9L+7r73l6sKU7x2E/kFm/EVQC7imZCeIoB+6ZWB7wyF8u2Dd+SHJkcSkCBxcI
 j+JRv4KJDGaHNhVnUJlS7ZtTBg18zgckWFQk2OiHeu4YzolfnvuNIxYoRWJM39zp7+NM
 wUjsWy8WuxS6lEDv7VFEUXBzmvOprx2yEMVmjebjMuhK9GjvRla3gE3MvpsnOyPjrxhF
 BS9C28tt+Oy5SyQ9eexDYCjuliRk4QxrhcP+pHjU24k/M0Z1GaAHaEqnmVqsZz74kGu3
 HbyQ==
X-Gm-Message-State: AOJu0YwqWHDIJohx2yZbfTxZVSkV/sEWbxJi48ccA5qo/fdJPW0wYh+5
 MFsQOsGW0u2XwVxshJWXV9lD6e/OKojDTmYJOEdwr4HX+1MhSXqjWzzQmQ==
X-Google-Smtp-Source: AGHT+IEQoEXu1xUFzTTrvmBWG3avlid+la26ZaeFat6F/PxLBxuSMrdok437zwTGEZRXyGyEV2Qmfg==
X-Received: by 2002:a05:6602:634d:b0:817:449c:a822 with SMTP id
 ca18e2360f4ac-817449ca890mr1017667139f.1.1721423919464; 
 Fri, 19 Jul 2024 14:18:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2343d3230sm479754173.133.2024.07.19.14.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 14:18:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 15:18:37 -0600
Message-Id: <20240719211837.3917916-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721423919; x=1722028719; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kscGryAPbkYG7cu8vfFcun5LDZJdt3g+tpGnFwbIR64=;
 b=e9XRWxAr3YyzYERrv02/1bVp5ThcHzSWVubqUhBn8tC97aKvSxl7RaCtJKh1AwLS6E
 Y+xAIqX4hWC246USMfBP9AaxNLK7OsQ3UDyLakSQNJL22ykTiJDf1ecsL6NxG9hx0wlV
 fr2l3XMJ9y6lY15U2OqG6s8l6V+KP4vM8kdep3lzv9Q6lFQX9OH+b05zv0TIUHNEPqgY
 y1ZYP4JwcMN8ZAoR+5GIrA2P/hAlWkkOW9ayg+BfNQFTxLXGneb1IXF07tyMNA4pdSdQ
 yUTmAXJ+fRo4OW2hz62OiPkLlIxvLeEMYgEoQ/hCrMAycAYfbvf8QTPJDik7shTqLtEH
 FXfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e9XRWxAr
Subject: [Buildroot] [PATCH v2 1/1] package/tailscale: new package
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
Changes v1 -> v2:
  - don't set GOPROXY
---
 package/Config.in                |  1 +
 package/tailscale/Config.in      |  8 ++++++++
 package/tailscale/tailscale.hash |  3 +++
 package/tailscale/tailscale.mk   | 18 ++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/tailscale/Config.in
 create mode 100644 package/tailscale/tailscale.hash
 create mode 100644 package/tailscale/tailscale.mk

diff --git a/package/Config.in b/package/Config.in
index f2e10b2b5e..35927bbd94 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2613,6 +2613,7 @@ endif
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
index 0000000000..ba4a818d2c
--- /dev/null
+++ b/package/tailscale/tailscale.mk
@@ -0,0 +1,18 @@
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
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
