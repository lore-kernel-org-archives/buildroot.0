Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC195CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8805E845B9;
	Thu, 21 Aug 2025 18:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oNaz0l8Qf4l; Thu, 21 Aug 2025 18:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7C9A845BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7C9A845BE;
	Thu, 21 Aug 2025 18:23:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9621D8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B401845BE
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJWv1M8V0nCU for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79633845B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79633845B9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79633845B9
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:23:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b0bd237so10070935e9.2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 11:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755800621; x=1756405421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q94VACaabYwVzjVQdVUEOh0V6aQib2oGjEMibQdABbM=;
 b=Zt1WuPRbzDpeL/d7OR4lZ491Bfsd3MglrsNfAm7Z3DV2F6EqB0VOz5BgNvo2Ote91G
 /xELe8XoCbrwYwVrQFYxtK6iq0Dtaj5mpqsN/IDqs7EsGecZTkAYnADqTU2UcCDXaw5z
 rIVAX8sHI6raaoxMPr+ZrShU5rk+SCyljLA0aEDzxHn3TmB6idJ5ZzvOF4aoeBQtCyMZ
 kLuGNFChVFQIh8ODzGlgtmPd2eDL62t5B9lNNn3A4vXQhmaT6Lny5/94AU+Q8072tsgg
 srW6j1UdHaXf4hyJszYD1dxlcoXS5Mu/NV/b08L8qsILmUpgOrA6hV928uVy8aHo+A7y
 lXaQ==
X-Gm-Message-State: AOJu0YzIqlcf7N+7Ph7BAM1ZSkdO8xf3fqAD77yPyJZRzJb0As/xaJVx
 eztPBMr0QWsLn3V/7PmFkF7HzoGNA9UAd10Rp7yKGWBDtzIpPfC6EBtw8G5DDPZY
X-Gm-Gg: ASbGnct7zUO8rYXaQqLnhlE7C7YNfl+zIETki+/sp+401ct3zJCky4vjWZmk+Amm8BQ
 8KHQOzsiXJWAahtFa4aqgBUW3mPqK7Erj8pTHR/f3hJJI3kNlofGZ5vAzIs4oZNEpiKytPwgCmq
 Tldu0i57YGsj4ZyqgaeaoD5O+aLh3vQJV09BvXOB3RR0gv8ecxkhPMGSUIlbxZomcYTRD9MRc8P
 BIvk5yfaNGwTDXoo7MzIcLyPZ+8TwTt5ptzAzcbfouO4JKG0+NEatMJUTtgrqkLwxo5AHSAX7kE
 y6H4RGoUNSkEqsf5XCAl++gK1E2INftO956A+E1yLy6qLjpV8L65T8i07P6bLfRe6yamqyRVzv7
 KK28XEVJKMn0E90JGHlSdB05oWapOdJKEIbKeudP/bvwIDJ0RPIrEOThY
X-Google-Smtp-Source: AGHT+IG2vsXmTfb17Ykbw0CBMInxa9JDQJHOnGk/4FrhgCIZn9afNFeaKjc80Fxhy15pocy9lU/g4A==
X-Received: by 2002:a05:600c:1d14:b0:43c:ec0a:ddfd with SMTP id
 5b1f17b1804b1-45b51798f3bmr858075e9.6.1755800620849; 
 Thu, 21 Aug 2025 11:23:40 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50e4249bsm5912725e9.25.2025.08.21.11.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:23:40 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 21 Aug 2025 20:23:37 +0200
Message-Id: <20250821182337.3563734-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755800621; x=1756405421; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q94VACaabYwVzjVQdVUEOh0V6aQib2oGjEMibQdABbM=;
 b=Tntj0vzqrbAsNYElJUn04MX69G1tM/owti8zJZIgxRN8C5QdfM3pNhlt06pGH0HaMV
 EeI4BF1Hq1A7jyeOzETndgLjfCj0BYJVtiBijZqK60FUjgD+HCJXmM5OJ1woA1U2MNk8
 OfZDOmgJ/RHnPXIxvApJy/NapKO5CUB1EKk32CPZxbdXIyKP4LQWbTEDxIdzJ2ma1nrZ
 bIjK4PnDF4FEAIABpnVyKxyPY9C05fK0h+NFdV3Qc8G+xjHgXiNiYESd53QtQcrRRaQh
 dbWZJZoLL2vpSn2VS9hMsrgSDDCwDQFbMv8nywcTEyi36vOHbI03PorYkKvZCGHnzF/G
 9ytg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Tntj0vzq
Subject: [Buildroot] [PATCH v2] package/wcurl: new package
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

wcurl is a command line tool which lets you download URLs without having to
remember any parameters.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
v1->v2:
Fix runtime dependencies (Baruch Siach)

 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/wcurl/Config.in  |  9 +++++++++
 package/wcurl/wcurl.hash |  3 +++
 package/wcurl/wcurl.mk   | 16 ++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/wcurl/Config.in
 create mode 100644 package/wcurl/wcurl.hash
 create mode 100644 package/wcurl/wcurl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3efad36d70..3a3d263c8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -242,6 +242,7 @@ F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
+F:	package/wcurl/
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..61463e7820 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2724,6 +2724,7 @@ endif
 	source "package/vsftpd/Config.in"
 	source "package/vtun/Config.in"
 	source "package/wavemon/Config.in"
+	source "package/wcurl/Config.in"
 	source "package/wget/Config.in"
 	source "package/whois/Config.in"
 	source "package/wireguard-linux-compat/Config.in"
diff --git a/package/wcurl/Config.in b/package/wcurl/Config.in
new file mode 100644
index 0000000000..31a007b61f
--- /dev/null
+++ b/package/wcurl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_WCURL
+	bool "wcurl"
+	depends on BR2_PACKAGE_LIBCURL # runtime
+	depends on BR2_PACKAGE_LIBCURL_CURL # runtime
+	help
+	  wcurl is a small command-line tool that wraps curl for easier use
+	  when downloading files from the web.
+
+	  https://curl.se/wcurl/
diff --git a/package/wcurl/wcurl.hash b/package/wcurl/wcurl.hash
new file mode 100644
index 0000000000..b747e99502
--- /dev/null
+++ b/package/wcurl/wcurl.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  a745475f3511090685c4d000a10f4155147b75a8c7781764612a7e8f67bb6d82  wcurl-2025.05.26.tar.gz
+sha256  0127bdd267b1fa65bf5a6c487c907948e0c009aa35a5949c8aed91f779d27810  LICENSE
diff --git a/package/wcurl/wcurl.mk b/package/wcurl/wcurl.mk
new file mode 100644
index 0000000000..8499bd3e1b
--- /dev/null
+++ b/package/wcurl/wcurl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# wcurl
+#
+################################################################################
+
+WCURL_VERSION = 2025.05.26
+WCURL_SITE = $(call github,curl,wcurl,v$(WCURL_VERSION))
+WCURL_LICENSE = curl
+WCURL_LICENSE_FILES = LICENSE
+
+define FOO_INSTALL_TARGET_CMDS
+	 $(INSTALL) -D -m 0755 $(@D)/wcurl $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
