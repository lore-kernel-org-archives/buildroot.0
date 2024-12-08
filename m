Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330B6E77180
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E215D40723;
	Sun,  8 Dec 2024 14:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APfJ0emYGIaP; Sun,  8 Dec 2024 14:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51C164071B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51C164071B;
	Sun,  8 Dec 2024 14:38:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 976156F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85F8881BC5
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1yxX1ORUrhM for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4184381BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4184381BB4
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4184381BB4
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:33 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3e5c225aaso113427a12.3
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668711; x=1734273511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zNJWb2aaTnaqFA407nSdAkJEivLbSdkDlpOPA4NnaNc=;
 b=wI0wXjb504nbPDnGogCT9ixm41z81hAKXfxIqCTLBDit8jirqi+PuuGovnufBuOZIZ
 6atISRhBkzimjlV27tCwpMyATjCusvTmTS5K9oxoyX6+VM6uMtGxQV9umn99LEtHXtEs
 m7CTj0+zJW2fa9VPdWPSd80/2kLUqKOtwgZjdKs1XYugaTEJj9RTQ6XZGFf5SIvdUD4q
 Tewm4zQZhyNxRSPwxlib6L811VEBZ2K/OhbuQ5EMmesIyozizBZEoRCOsWe//AgQge74
 Zb7rf/15J36YfF0dacDiacZ1S6eJpOfAp6Mn891NgEb7gaUstMlqqLmsOPhlKtsJcpcJ
 7kCA==
X-Gm-Message-State: AOJu0YzzoWf0SDiu64zc6P7p8PBj+H2r0liybNSLq/CWPKN1KkrzhPbO
 S0TwjG1ZYhCNycBiBuzyCqCiW0HljL7VdVIZkEa5hHl31BERCCZiAvAfKQ==
X-Gm-Gg: ASbGncvgzOv1JPp2HKFAlCEe/BZdG79llr2V+LLIGPJCVP7CrL3ycbnHyE6YSmHRE/n
 dE8RPBghzGQgTg06QT4i1K0+wJp6lCAXYnXmT3UcDlMG3t2fI8AtvUuMEYe9AI2AIfFtsqhwP6Z
 VVywJq7RaAQR6FJaZgKhBinMgSWH2ls6IpnS6KrtDFZT5TYuJlxqPQVCpc3YQdDckqWYtYSBys1
 +BiE8qPcpZkhwwYuOJ29Uja/n5Ob6Z60D92XEqGObI=
X-Google-Smtp-Source: AGHT+IHHlVrF8BwwHN7KY3vm0DrptayOGFHZtub9QVSzf/ZDHd4jmvipVTw0LxIubz/7NetDpzun1g==
X-Received: by 2002:a17:906:6a1a:b0:a9e:e0a4:e984 with SMTP id
 a640c23a62f3a-aa63a3437cemr349322166b.13.1733668710476; 
 Sun, 08 Dec 2024 06:38:30 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:29 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:37:56 +0200
Message-ID: <20241208143802.1048266-6-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668711; x=1734273511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zNJWb2aaTnaqFA407nSdAkJEivLbSdkDlpOPA4NnaNc=;
 b=SQsdsvBX9BFFtHocTYpgvhKy0cmrqWaAXg64bJx8M1LvXBiPY60Y5o178vsIIcIgWj
 l1hZ+Q2XQMQcbkg838HrhnqLsl4mP9+vnXgirnxjvU6tfI9PsNtgiCLDXowitM80RZzW
 v4y5/kfzxFZNw+KV2GNV0sHPO8CiVKQ8uNZwR2s6oAvstHQApg6Hgw4c6/7ILzQWeZkY
 sWWlvxs/0IRW/5YYXSS0EphWfku9HiVlTEfg1u65sqW3Hg9KptFs9vKG7aJ6kFVCVZbQ
 H+uE3ocyB/HUS+T4MFZ2UjnD5oFQrmgoeJCXoO4eK+Maa/rEDuUID6IiObvmLSyV6Pps
 hhFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SQsdsvBX
Subject: [Buildroot] [PATCH v2 05/11] package/qoriq-restool: new package
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

Introduce a package for the restool program, which permits the user to
modify the network configuration of the DPAA2 subsystem and create one
that is adequate to their use case.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: none

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/qoriq-restool/Config.in          | 21 +++++++++++++++++++++
 package/qoriq-restool/qoriq-restool.hash |  3 +++
 package/qoriq-restool/qoriq-restool.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/qoriq-restool/Config.in
 create mode 100644 package/qoriq-restool/qoriq-restool.hash
 create mode 100644 package/qoriq-restool/qoriq-restool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 44628db3bef5..dba4bbbb21e6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3305,6 +3305,7 @@ N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-mc-binary/
 F:	package/qoriq-mc-utils/
+F:	package/qoriq-restool/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 52b28871e96d..ddbe41e0ff20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -599,6 +599,7 @@ endmenu
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
+	source "package/qoriq-restool/Config.in"
 	source "package/raspi-gpio/Config.in"
 	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
diff --git a/package/qoriq-restool/Config.in b/package/qoriq-restool/Config.in
new file mode 100644
index 000000000000..3f1834a7dce0
--- /dev/null
+++ b/package/qoriq-restool/Config.in
@@ -0,0 +1,21 @@
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
+	  The restool program is able to talk to the Management Complex
+	  at runtime and permits the dynamic reconfiguration of
+	  networking objects, as well as saving the current configuration
+	  into a new DPL file. Without the restool program, the only
+	  possible networking configuration is that specified in the
+	  boot-time DPL file.
+
+	  https://github.com/nxp-qoriq/restool
+	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM # sign in required
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
index 000000000000..4a89a80afa70
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -0,0 +1,24 @@
+###############################################################################
+#
+# qoriq-restool
+#
+################################################################################
+
+QORIQ_RESTOOL_VERSION = lf-6.6.36-2.1.0
+QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
+QORIQ_RESTOOL_LICENSE = GPL2.0
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
