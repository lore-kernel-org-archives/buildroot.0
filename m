Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95817FC6166
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 00:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4024A80E61;
	Sat,  3 Jan 2026 00:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUZe8KLiP5Tc; Sat,  3 Jan 2026 00:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CB2780E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767400600;
	bh=aouP9Rmhlnfq9mzEHmjytpBkIPObBWCeWKZVLX8/9kI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bXCqa+IZXGuMzfAh6y1QTU9YvlkxchsG/xgRwJJoMDn0iTE64vBJejcYWvwH8nbH6
	 N5+OfsHuoWALbpk2xcn1Dbz/6j4l1NtAqSUnII7rxIIIHkCnX/gm4+dfEvMA0IONTe
	 28vXxbb7R2I9ehGZEIMSp1Q89gJrEA1O6DrLdhbHSJ20DTJ4xYcjjyNuljT4Q8W88R
	 PGMOHueLYNjVY0NV3HUFP1YlWheenT+4eg7GUVQ2CWwjVTH1uSRbB5TNDAmyxf85Tx
	 T9kT8KpiaPNVS20BDZYt3gGb/zd6bB3BNr6vnWQEkGUAPbKUV8N/qn4In8tPNKIIZk
	 dgdNJTKT4h9Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CB2780E78;
	Sat,  3 Jan 2026 00:36:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6151B249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA09540502
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odwT7Fcj6Iih for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 00:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0595D404A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0595D404A6
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0595D404A6
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:36:34 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7c7bfba3996so7540474a34.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 16:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767400593; x=1768005393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ybcSUx7mr4sH2uLvRJbpJOmMAw1s1WotbAkPCWYfHs=;
 b=WnN2eRx2hwPIGsA2hZ6k5czNxeItG+LkzqerAsiiztUr2q1po9jY9keEC+7Ih/lvsv
 iP1bF59KKEbWEnf80Yn44VZLvW7H4o0Lmk6JgBhx002uZUAOiuQjXdFOQfJ03ziS2uDZ
 HO4gFonMbxqXxplSFW5sWP3Ffy0feK5fZx5WIJ3U4Jz1m38qMat4V1gmOlCng8CsAdqD
 XSReZOvDXb1HxTE+o8NeJ2Y5c3dlWH6BbGXUFsM+lmQ5G7FLAUe2RFSirhFaN7YQNeib
 2yxcnzqbDv7PtI07Bb/cRxzDLCtIsilGrRVBuW9zH3juhwffoWX3uzK9B/3VJcrQ4Ebj
 kJMQ==
X-Gm-Message-State: AOJu0YzfXlJMaL3MPvXpA7Ib8WT29oqihOfmssKGYAfldrvHhPkyg4Zb
 pnKjosE6DKG5IqBCZLbB8wPflckI0xM2xkbfgWiO2tOVRgKsP6wNc97hIqkA5aOiUeE=
X-Gm-Gg: AY/fxX4A25RYlchnxy0JdrY4I4fZsVm73HP/RZSxFsURlcBeuhrvHLd9tFCi6/9mf+N
 hSUjzv+KoSrjD6vpE3XCoucCrLXilN8MrD8ovHRNHbOKs/02Oa1AD/q2hnONFy/ctvKJZOyHj/X
 9zNNloYvjSDztkPlFWey2qBS/V38Bdv1yyRkh+Z1f4WPdCfCXqy/2abVvdMcAaYIOTqEV4SkwJN
 wTJmqq7ktRjzZpidn8Ewv/IO7+kO5sZ+m2KlAX9JEZnKwPIYBmP+zUEwlauOTCr7Wi11EjNM4/I
 jm69mmqtZd9l/l9BElocgS6qKcGTKm5ehySbe/czeovjKqwZDkqtu5uH4uQmTWrnyX0Mzesi0bq
 DoO+AQyX+/Hw6vX2b6H5xRZU6tJe80rXzCGj8broAZxdKaQVSjrf6dzjDPqzmgYvdynXqz6fS26
 4/9clGSoOi2n6h21obA2nGscJDrc7DlMMMjto9XarLWnuF79B9OIDP8UclCCf7Eb/Fh5HgCU4kR
 8lSGuwVJhBJ4g3FIZ/QEFbgV7TSoQPHPhfSKk9Ms/Z7XFjyNaLFPJg=
X-Google-Smtp-Source: AGHT+IGnkVkeutjN/vhFSVabYcgCdhw5DpiL71iZ4Rwid9yZ8gwUEFvt4eRSwb6Uel6OHTl2jnutKg==
X-Received: by 2002:a05:6830:412a:b0:7c7:61e1:444 with SMTP id
 46e09a7af769-7cc66a7f7b5mr22388078a34.19.1767400593594; 
 Fri, 02 Jan 2026 16:36:33 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667284fdsm29422648a34.2.2026.01.02.16.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 16:36:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 17:36:29 -0700
Message-ID: <20260103003629.670533-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767400593; x=1768005393; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ybcSUx7mr4sH2uLvRJbpJOmMAw1s1WotbAkPCWYfHs=;
 b=aZDd7aP+9yc/jwNVBf++o1/9dKUs8gxPxnravpCQsbAhw703N/sfzrUzv6djCNqBja
 9RM359zqtMyHnu4afJ4Fw5EhMdHr+4d33xG1i/vwqdgHQd4Lz3HmniUsVQVifaANojtd
 kufoWLb8NPnQ1inzMfP5e9yZP7GSVR4xw5EjcvQfqtoefs+qrezlai4mTflQtFZUeUii
 3V1ahwUx1Bjx/i2Btr0D/yexEpMAHiqphMmePz8Mu+8bcoBAoAeGcIuApHVYnJ27Htw9
 h7ZprwKlNyGStN58DbeuhBBbjXZI+vGXqkGBWQFoTgIhaKoJNuiHx5rudOgyDKlL2Aax
 So/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aZDd7aP+
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.76.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-grpcio/Config.in          | 1 +
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
index 9657ccb6ed..6119991c7e 100644
--- a/package/python-grpcio/Config.in
+++ b/package/python-grpcio/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_PYTHON_GRPCIO
 	bool "python-grpcio"
 	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  HTTP/2-based RPC framework.
 
diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index c57ece77ca..9441d89389 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  ad83dd7166a99b20c0e004b538eb5ad9  grpcio-1.70.0.tar.gz
-sha256  8d1584a68d5922330025881e63a6c1b54cc8117291d382e4fa69339b6d914c56  grpcio-1.70.0.tar.gz
+md5  b2b6afdac225e749c4c97284a0c1113f  grpcio-1.76.0.tar.gz
+sha256  7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73  grpcio-1.76.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index 24c0a08cae..af9817a0ef 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.70.0
+PYTHON_GRPCIO_VERSION = 1.76.0
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/69/e1/4b21b5017c33f3600dcc32b802bb48fe44a4d36d6c066f52650c7c2690fa
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/b6/e0/318c1ce3ae5a17894d5791e87aea147587c9e702f24122cc7a5c8bbaeeb1
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
