Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5A6CD4F2C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 08:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75D9960DFA;
	Fri, 12 Jun 2026 08:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuzraGS-gcEW; Fri, 12 Jun 2026 08:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 983E360EDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781252441;
	bh=AhGJIwFQB6RrW1VyHDzxYi/ogJN0XjnFoJvYXbnG4z0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PzxI406iTJPrHxHIRzqpfKyFOU9NLle/ceDG54SffoEMSsCWKOd9mxo2Y0sEAl8O0
	 DwlWGraV40I1HLilJ3orLbkr32lUMnxFHSyccK5jMgzG5tr5WpvJ0fHk+LINdWrUS6
	 fSbIiC24a+cH3qXyuU82x99v6yb460oKFGS0Z0rJbxRcgXMbsa+ir33Uevae7KxjGP
	 KHif7TyaMblQ4ULfvd9xjLrbGsCVGN6Q9LHzE0ou44NfaxTRwFX83uHfYup9QQZT4Q
	 adK6ykxKRg5zGTtVaeMTtlh/nqK5WZYbNHcH49pSDZbmv3C1EoHvBWI8G5rBBJ3ekC
	 A7cG7b5sN9J5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 983E360EDF;
	Fri, 12 Jun 2026 08:20:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C554DF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B741882119
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 08:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZdzZx0H00Wc for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 08:20:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CFF880FB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CFF880FB3
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CFF880FB3
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 08:20:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso5272745e9.1
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 01:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781252436; x=1781857236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkcURtOuTbR5HX2vKQESqICfH2ululoqB3+DxRrX2rw=;
 b=eoecFABpX0kMjVdB6l9FqwoPEDi8TBpaiihD7fzbgCvGOurIjQgOIPfrlUAgyU3MYj
 +SPVb/7jXIOOIOVnhrBHxaVPB/UowScmFU64ZRQPvT4Df3yyZVonKwhCo/HuvTFQ9W/W
 WkgH+GVLZB+JQ/MQfwdTzY2XuuZSma22klG3ROLrC3N69PiYOarfV56u6l2B/kg/b21z
 CM0zfYfhxMYnh7j1ro4BNA8qj4SomL0sxJTgKloTYVw2FshmsszNqDIRIVTVODOdtpOt
 bJKYnIp7CSw5PLZAZO2LPDKxUsDTT0WoRUS2g2/B7mG5OVC1xmpeBeUDfUsd2NC2+obF
 pa0g==
X-Gm-Message-State: AOJu0Yw3D3YgAKdbQUitFnkiC0MtKh6M3/RQcoVpfnWIsqiLVTRnJAgx
 25PXNDGULEZahSjTiKBY/98VgdqJa1A9O4n2HZ4++hTl32iP1kuChL9mQODI7fwtXYcu/E8Q051
 VqGMtMg==
X-Gm-Gg: Acq92OH/87iPnU/YPQf4xAEjEzU3GfDSgnG0aG3fd1UnZJ1Xxyq6W9v2ryl71nMw7No
 ddNClI4h+fTXRdxLA6pQNgS2PKNlFAnvAR5YSoxrs6Tn/+N/Z+vGgKlffPUqgjD28f9XtEZDwHy
 ecRxowmHBIL12UeB5jJmpv+I93nNYwqVYvY+X8oFo+lGFjdfk5nEY3bcF3P1lxRxbbSDoiW0NM5
 NS9JFARBP0V9fxNtPPmk9xr9gEljYWNr7T+Xbz7pfaTkqpp2/1TapDwhNTxA4445+90C8pJerFA
 Qg13DTCkR1iqzxzBzIEj85vH3D9JuGi/OPNUt865KSRvUW4HTlBsTkz07S/GgNNEQuFXN4dcATD
 E1pxNwRJvW7pmi5+UaAtm6nV6uPXL8/wSBCoW+00RdqtuotywEAKfI0kIOJ37VLyy0Wa//WNKL+
 /i+YYxNZuC1OkByD0ktSgMz/uQgLCbVIGWSIlNPvWiYxyEec9ViQ==
X-Received: by 2002:a05:600c:3209:b0:490:b115:e03f with SMTP id
 5b1f17b1804b1-490ec4d65b4mr12455175e9.8.1781252434745; 
 Fri, 12 Jun 2026 01:20:34 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b1092sm3601942f8f.17.2026.06.12.01.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 01:20:34 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 10:20:21 +0200
Message-ID: <20260612082022.268330-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781252436; x=1781857236; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KkcURtOuTbR5HX2vKQESqICfH2ululoqB3+DxRrX2rw=;
 b=GwZd7Edzaby0o8RUERlsSWuhjHKTtp8np4fBGajNK3hbh4N/6wCJFsTvs8/949YxgJ
 MUHQBD2J5IRlb3eIAWEzXO7jh2w1WMcL4z8KXx75u3TxryL5sFv1Bib/bRTRF10s+luP
 YxgICpW6P+JEMNLFr/8n6Cx1z3JQSmRA5ciHH0VlYyFHFBVAzc8R372g0S0G2fO4jQjF
 1SAqB+aO1W7bbrTgFogyBMoFT2bPQ/WmLkeEcenHjj/+gTPZpZOs27KYiTFWwxZpnDlo
 9nB1Q653sZFA9SzFm2GOPaFhTfr9XZJUywMbyYomV0iLwK/6UKfmi95DOzC8V9Wwgs87
 MgkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=GwZd7Edz
Subject: [Buildroot] [PATCH] package/lsb-release-minimal: new package
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/lsb-release-minimal/Config.in          |  6 ++++++
 .../lsb-release-minimal.hash                   |  3 +++
 .../lsb-release-minimal/lsb-release-minimal.mk | 18 ++++++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/lsb-release-minimal/Config.in
 create mode 100644 package/lsb-release-minimal/lsb-release-minimal.hash
 create mode 100644 package/lsb-release-minimal/lsb-release-minimal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9aaffa29a..76c749831 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1185,6 +1185,7 @@ F:	package/lua-inotify/
 F:	package/lpeg/
 F:	package/lpty/
 F:	package/lrandom/
+F:	package/lsb-release-minimal/
 F:	package/lsqlite3/
 F:	package/lua*
 F:	package/lynis/
diff --git a/package/Config.in b/package/Config.in
index 630662477..0b5e86904 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2739,6 +2739,7 @@ comment "Utilities"
 	source "package/lockfile-progs/Config.in"
 	source "package/logrotate/Config.in"
 	source "package/lowdown/Config.in"
+	source "package/lsb-release-minimal/Config.in"
 	source "package/minisign/Config.in"
 	source "package/neofetch/Config.in"
 	source "package/opendoas/Config.in"
diff --git a/package/lsb-release-minimal/Config.in b/package/lsb-release-minimal/Config.in
new file mode 100644
index 000000000..3d2e154bc
--- /dev/null
+++ b/package/lsb-release-minimal/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LSB_RELEASE_MINIMAL
+	bool "lsb-release-minimal"
+	help
+	  Minimal fake lsb-release that uses os-release.
+
+	  https://codeberg.org/gioele/lsb-release-minimal
diff --git a/package/lsb-release-minimal/lsb-release-minimal.hash b/package/lsb-release-minimal/lsb-release-minimal.hash
new file mode 100644
index 000000000..3ad1785b6
--- /dev/null
+++ b/package/lsb-release-minimal/lsb-release-minimal.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  87bdd39802a7c15753f5c5187f2901b6b9df4dd11721e3762ca4b1701a421c85  v12.1.tar.gz
+sha256  89080b681f36c46c868001c21ec4b7f355acb517ce33719e0189d00c13175a95  LICENSE.txt
diff --git a/package/lsb-release-minimal/lsb-release-minimal.mk b/package/lsb-release-minimal/lsb-release-minimal.mk
new file mode 100644
index 000000000..073b55637
--- /dev/null
+++ b/package/lsb-release-minimal/lsb-release-minimal.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# lsb-release-minimal
+#
+################################################################################
+
+LSB_RELEASE_MINIMAL_VERSION = 12.1
+LSB_RELEASE_MINIMAL_SOURCE = v$(LSB_RELEASE_MINIMAL_VERSION).tar.gz
+LSB_RELEASE_MINIMAL_SITE = https://codeberg.org/gioele/lsb-release-minimal/archive
+LSB_RELEASE_MINIMAL_LICENSE = ISC
+LSB_RELEASE_MINIMAL_LICENSE_FILES = LICENSE.txt
+
+define LSB_RELEASE_MINIMAL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/lsb_release \
+		$(TARGET_DIR)/usr/bin/lsb_release
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
