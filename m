Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FCDC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 09:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93A8B4011A;
	Sat, 17 Feb 2024 09:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcQRSGddSzDS; Sat, 17 Feb 2024 09:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 960EE4011F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 960EE4011F;
	Sat, 17 Feb 2024 09:24:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 886EC1BF3FD
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 09:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75FCA605C8
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 09:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Ss_ie0qfynJ for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 09:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=frank.vanbever@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47357605C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47357605C2
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47357605C2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 09:24:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so1443464f8f.2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 01:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708161868; x=1708766668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7UqnUp/zielLbmMhZbIGSjyOMzfiGMERAWF5sCeRqkU=;
 b=KlSWHdKEmvHHj+yn9gEZCmHDAXW32fbh4rg5bwaMmGyBAc+S5IpEm0SYfrhgKm0syn
 YTiLUGXUB5irjf5mtpl3yGYpnJ/QGu+Raw2nInUNlJRbf4YFd83ZryYyHw9MCgDIrCz1
 lj9Pzc9d7GG/fgAKY7/a27xaQx+eDcTjpey52roDlVEzCnQjWilD7OsO3OBX27HsD3P9
 ic8X4tZ8t2ALF4MhZj6LhS01+MrpfPQw3SLVPFaYc4V8qTAyPl93Oe3un4ciOfrx21/z
 7GU9V9UpM4MNirvN2GfSezDxMNI+tUsFSFKxn0+cEeoFuU+m5SPfVswj3CcI7BU6ZoY+
 TxNw==
X-Gm-Message-State: AOJu0YzmlQq423NlSiH+OfJNJ4bbd1eq/XcDF5bTA23B8ongmT69bQ8R
 Heh+UJ4377DOs9s7nTc1N12NaxLcU8g5Dy5HaKB051PaIKoqZNiYyPjUPjznDSfsie+dbPFZWMY
 8
X-Google-Smtp-Source: AGHT+IGzlhL9djWpPKE0x8zQ3HXxn5hcQMJWkIBtF7jvkzOXRR3JQgBcZr8hfeIOq21t1j63AjZ/rw==
X-Received: by 2002:a5d:50c1:0:b0:33d:2122:e854 with SMTP id
 f1-20020a5d50c1000000b0033d2122e854mr1803233wrt.50.1708161867907; 
 Sat, 17 Feb 2024 01:24:27 -0800 (PST)
Received: from wintermute.. ([77.109.126.177])
 by smtp.gmail.com with ESMTPSA id
 ch17-20020a5d5d11000000b0033d2ae84fafsm1498574wrb.52.2024.02.17.01.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 01:24:27 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 10:24:13 +0100
Message-Id: <20240217092413.288309-1-frank.vanbever@mind.be>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1708161868; x=1708766668; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7UqnUp/zielLbmMhZbIGSjyOMzfiGMERAWF5sCeRqkU=;
 b=Yu4Ge5UCBvKXIZGT5BX5oNFnr5LE+bRg0KX5FkeCE5Ac0eJLQrUGM4ifw4ok9aP05p
 qrCdO+mQXGxWH/t6qSJK6aFmaVlUBG9lQE3FY026XELoELyWWQzpfLu7Pc7z3y7ehI28
 y8oNVqiUtSCPLmFDll6D5ZJFtCqjwPjTU6q45BzlbRxZD7+8do24aLwVb+1FR1sHhHTl
 PLXUIr96OZ8cnZy7xgnYhZoNKFDSKuERkxG11/pFYn3y5J3FE0B5AZZFIdSBXZ791GKJ
 8GQB3jBJNXY7pCBHWl107sa5VSGZlm1/4SqsjE2BK9candnN2VMZvMoIoZShe5HaAaTz
 orWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Yu4Ge5UC
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump to
 3.0.12
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
From: Frank Vanbever via buildroot <buildroot@buildroot.org>
Reply-To: Frank Vanbever <frank.vanbever@mind.be>
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The project has been transferred from Trustwave (SpiderLabs) to OWASP, hence the
change in URLs. The upstream CPE vendor ID will likely also change in the future
but the upstream is still working on this [1].

- Fixes:
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-1019

[1] https://github.com/owasp-modsecurity/ModSecurity/issues/3083

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
---
 package/libmodsecurity/Config.in           | 2 +-
 package/libmodsecurity/libmodsecurity.hash | 5 +++--
 package/libmodsecurity/libmodsecurity.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index 69bb0494cc..da14b21669 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_LIBMODSECURITY
 	  SecRules format and apply them to HTTP content
 	  provided by your application via Connectors.
 
-	  https://github.com/SpiderLabs/ModSecurity
+	  https://github.com/owasp-modsecurity/ModSecurity
 
 comment "libmodsecurity needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index b0a1bf33f3..2221a8a37d 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,5 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.11/modsecurity-v3.0.11.tar.gz.sha256
-sha256  070f46c779d30785b95eb1316b46e2e4e6f90fd94a96aaca4bd54cd94738b692  modsecurity-v3.0.11.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.12/modsecurity-v3.0.12.tar.gz.sha256
+sha256  a36118401641feef376bb469bf468abf94b7948844976a188a6fccb53390b11f  modsecurity-v3.0.12.tar.gz
+
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 548eeb8602..d8c10b98b2 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.11
+LIBMODSECURITY_VERSION = 3.0.12
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
-LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
+LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
 LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
