Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2358C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 00:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 408C660592;
	Tue, 20 Aug 2024 00:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAMfCQ1uqYjk; Tue, 20 Aug 2024 00:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 350AC605D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 350AC605D8;
	Tue, 20 Aug 2024 00:28:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6F81BF95D
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 00:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 150474049C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 00:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MN0KAoiQMhOg for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 00:28:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E374140175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E374140175
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E374140175
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 00:28:40 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-39d37218c5cso8888365ab.1
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 17:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724113720; x=1724718520;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j6eWCb9qTeCdmHEYwhRAMyWu54xiPVtLxLrTmLX+yVk=;
 b=FqziFbNKRPVo0hsJjSukTUmHf+Bv3JEYKx3m446pQPfPpJTspkU3xb9tx1iWgo/MKp
 BSWi9KmXfEGC3Jvx79ED60gghx0zoAEitSWN2uVvwgzQ93hprSKPl4q/FOi0RR54i8oe
 9hDozbVUtbmY0QSFCxA1CMATVFAJvCsLEWuYC91XpR4FevxQDM65DH07Nj+xT3JCtHcG
 +auDWILxCk5kJBc8+7y1Q8X8AeK/txgjSljX+nMgt2ynLsFPErMmNNpasT1bxi6W66z2
 20XCNHaaMhxmR71yxRXAVap/AqtXD+Bubdp6PnraQ9RUmXslGwJmmAFJO7FYvcp8LSzO
 215Q==
X-Gm-Message-State: AOJu0YyMZ0V1v/HJqNDayd5Es//Hc3pZM9xTSTJQino4HgVkFUdU50/d
 paXzyBzx4aHK1DrSo3z/D0/QQtGMx16DyDjih6FTBZrb0Xe+ZyWCaYdhj7IT
X-Google-Smtp-Source: AGHT+IHMFWulArl+cRLXblsizH8uDqE52xswvks/TTxoaQBPmnLlEY/UU4UmjcKszW3Yn1TsU0SmEA==
X-Received: by 2002:a05:6e02:1fec:b0:39d:2124:d6d5 with SMTP id
 e9e14a558f8ab-39d26ceda1bmr159457025ab.10.1724113719375; 
 Mon, 19 Aug 2024 17:28:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39d2c48359csm27360755ab.35.2024.08.19.17.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 17:28:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 18:28:36 -0600
Message-Id: <20240820002836.2563288-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724113720; x=1724718520; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j6eWCb9qTeCdmHEYwhRAMyWu54xiPVtLxLrTmLX+yVk=;
 b=OwHtQLSfALrTDMx0n9u3tX3vUvXl0oof7zbw3wHmKO/dtoG5g7zSoLU2XZI43OkLOc
 Mx6SSZF0QSlGrpUWSZtpDHZLZLBLB7ZC1/bbGJOIOsyp3dcAn1VOmwcf3CRz6rfav11u
 vdRMUOd4c6OzhB1jp5IFFcYvxnHlsrgIZu0TLY1YOifI/jASW+kt3tj/Zo6OPpEUqHOX
 /ry077d0FKMBq6SKa4ebmJXphmeAXDAKW2lMG/Gyd4GqE7ikxLuLrlFtQ4HtMM6em91Q
 G9Hp/Qh7NjHmAzns/Od4XaLXxSYIz6VIrbmT1UjCon+uRnN5fVDnZ7UAQprEELJjJ4x3
 6IiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OwHtQLSf
Subject: [Buildroot] [PATCH v5 1/1] package/tailscale: new package
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
Changes v4 -> v5:
  - bump to version 1.72.0
  - remove GOPROXY override
Changes v3 -> v4:
  - restore GOPROXY override
Changes v2 -> v3:
  - set required CONFIG_TUN kernel config option
Changes v1 -> v2:
  - don't set GOPROXY
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/tailscale/Config.in      |  8 ++++++++
 package/tailscale/tailscale.hash |  3 +++
 package/tailscale/tailscale.mk   | 22 ++++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/tailscale/Config.in
 create mode 100644 package/tailscale/tailscale.hash
 create mode 100644 package/tailscale/tailscale.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..a02bda2aca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1503,6 +1503,7 @@ F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
 F:	package/stb/
+F:	package/tailscale/
 F:	package/zchunk/
 F:	support/testing/tests/package/sample_python_rtoml.py
 F:	support/testing/tests/package/test_python_rtoml.py
diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..d44886b9db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2625,6 +2625,7 @@ endif
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
index 0000000000..15c7a42f9f
--- /dev/null
+++ b/package/tailscale/tailscale.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2b08140f9391f51e83c0d8b430c33f240d50d1edeac969c124dec59af3e27054  tailscale-1.72.0-go2.tar.gz
+sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
new file mode 100644
index 0000000000..291ec49cbe
--- /dev/null
+++ b/package/tailscale/tailscale.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# tailscale
+#
+################################################################################
+
+TAILSCALE_VERSION = 1.72.0
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
