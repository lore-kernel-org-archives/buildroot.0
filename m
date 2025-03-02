Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB48DC19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 886C483F87;
	Sun,  2 Mar 2025 21:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WT1Zn9zGHUB7; Sun,  2 Mar 2025 21:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AD3B83FC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AD3B83FC0;
	Sun,  2 Mar 2025 21:52:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CCCD958
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 014776090A
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycAytOapvKSe for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D059D60903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D059D60903
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D059D60903
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-390ef13838cso193329f8f.1
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952368; x=1741557168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAmIx3Lii4BY89hW4VbxdH3zybNXGVcAhRoCwAsIVPc=;
 b=LjxKTcRvfW5dHoG7bcFLy6/t8Ol05nhwqJs9Ea/BhCF3khYU7C6/g832KjZl9zefFh
 FvCH9xR5uJn6ZU1rix08IVidHQ4vi37NXMAZzm1jSXoP1a1GtHEZyWEX9n1NcxgvifAp
 qBoWLrHWWJfpUNxTnODEtr63CRPIj8favJ0aslSmobYf+HC70uwzu1O0Yg5hERN53ItE
 xWOtWJIapoVccFcITooc97jO6a8O5kwJIuQSYJ4NiPFKEqZYllguC9jj1GWCwPzIvF6o
 JjJ1bnBkf6VXppnod6kejWzcmf4fM6CVisH8lkwIWGdTXL0ogCpfJEsjazF5hfTitVYe
 jXBA==
X-Gm-Message-State: AOJu0YzAxmy/dBiJlOQ0bwox/BNnNKQu7by50I0thwEFO+Q37suTmkTi
 IMJCE0cKZOIbTn4r7+WSOG1n0c48bi076Mj4MN35maCtAchd9jggF75VOBJc
X-Gm-Gg: ASbGncux9VnOBQCDBC0UbjTUDgBE7G700X8Jr+ZTVVdgwgBMNGd+6oQb8GZx37hd3L5
 84b69xAgxE5tOoAd6EvpQnaIiArdMgYMfVW2nzd89CGJkuJOGbDG5bInSDUJ8WTgB0rxnlLasTa
 Yp325lrb/7OUD8EdAen8lVazMSTwYELatIG6M/g2UzwOvpO/2gmnaOFNd2+dV5bJGQpZI6RGrOT
 xg0zannH23mGmTX+kzwldCmIJIwxqebt5e5ZFQe0GvzCzi/wu+uv50k0nqI4DGsxega7G8CrqHY
 +XF/VgoyDfBB4Xqos1l46xUp/0AYq54z4txKNg==
X-Google-Smtp-Source: AGHT+IEYFLMphaNf+BQJnznvhMBU8PyuzwdPOj2qSmUbVaV6OJ6qk6C22Vrp6jWYEWKXu2b2Rzbcvw==
X-Received: by 2002:a05:600c:154a:b0:439:9821:7938 with SMTP id
 5b1f17b1804b1-43ba67448e9mr37614655e9.6.1740952368056; 
 Sun, 02 Mar 2025 13:52:48 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:47 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:11 +0200
Message-ID: <20250302215219.1276480-8-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952368; x=1741557168; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAmIx3Lii4BY89hW4VbxdH3zybNXGVcAhRoCwAsIVPc=;
 b=mb4Y9YwCx15shTH9e5pysY45bn2VmkIT8WmS0ciYx12Bxg51sPCGfh2Yo+wjPNA/uh
 sTC3ddBH0V4F4ome8RY5iB7Itve8dR8jsy8O8cmLChRvFcP2FQ2dWLyB95z27NJF3S40
 LwnB4iEXNF5DKoTjktw4Pr/Tcsz0ST7cnb420YzQDj/E4QLkVEJjtUJ9juRXEmO2Rowb
 D3Z+aFOBCNWzEtQcNbGpiLhlFkA+Rns9T7VI1JQTHfOPm8lvVOASxM1w2u2CiIGWmtwJ
 6idxil0toFsODaKU0lWjCq98IVYAHgRGFm9UcKcMfSg695okBR17ewiv+VP2Ku9IuDeH
 wd/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mb4Y9YwC
Subject: [Buildroot] [PATCH 07/15] package/qoriq-restool: new package
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce a package for the restool program, which permits the user to
modify the network configuration of the DPAA2 subsystem and create one
that is adequate to their use case.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
- Reindent help text.
- Fix license.

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/qoriq-restool/Config.in          | 22 ++++++++++++++++++++++
 package/qoriq-restool/qoriq-restool.hash |  3 +++
 package/qoriq-restool/qoriq-restool.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/qoriq-restool/Config.in
 create mode 100644 package/qoriq-restool/qoriq-restool.hash
 create mode 100644 package/qoriq-restool/qoriq-restool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 55854a77e0c8..319fc68a77e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3360,6 +3360,7 @@ N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-mc-binary/
 F:	package/qoriq-mc-utils/
+F:	package/qoriq-restool/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index f1df62658f58..87f621ffd22e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -593,6 +593,7 @@ endmenu
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
+	source "package/qoriq-restool/Config.in"
 	source "package/raspi-gpio/Config.in"
 	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
diff --git a/package/qoriq-restool/Config.in b/package/qoriq-restool/Config.in
new file mode 100644
index 000000000000..dbe0934d4dd3
--- /dev/null
+++ b/package/qoriq-restool/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_QORIQ_RESTOOL
+	bool "qoriq-restool"
+	help
+	  The DPAA2 architecture in Layerscape SoCs consists of
+	  networking resources that can be assembled into various
+	  nuggets of functionality, called "objects" (DPMAC, DPNI,
+	  DPDMUX, DPSW etc), by the Management Complex (MC) firmware.
+
+	  The MC firmware reads a file called Data Path Layout (DPL)
+	  which describes the set of networking objects it should
+	  create statically, at boot time.
+
+	  The restool program is able to talk to the Management
+	  Complex at runtime and permits the dynamic reconfiguration
+	  of networking objects, as well as saving the current
+	  configuration into a new DPL file. Without the restool
+	  program, the only possible networking configuration is
+	  that specified in the boot-time DPL file.
+
+	  https://github.com/nxp-qoriq/restool
+	  # sign in required
+	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM
diff --git a/package/qoriq-restool/qoriq-restool.hash b/package/qoriq-restool/qoriq-restool.hash
new file mode 100644
index 000000000000..c2332d9b27eb
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0cfced32caa615266ff633946d40a36660c856d7eb057b81de392570e136c5e5  qoriq-restool-lf-6.6.36-2.1.0.tar.gz
+sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
new file mode 100644
index 000000000000..6b9db59fbc8c
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# qoriq-restool
+#
+################################################################################
+
+QORIQ_RESTOOL_VERSION = lf-6.6.36-2.1.0
+QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
+QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0-or-later
+QORIQ_RESTOOL_LICENSE_FILES = COPYING
+
+QORIQ_RESTOOL_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	CROSS_COMPILE="$(TARGET_CROSS)"
+
+define QORIQ_RESTOOL_BUILD_CMDS
+	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE) $(QORIQ_RESTOOL_MAKE_OPTS)
+endef
+
+define QORIQ_RESTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
