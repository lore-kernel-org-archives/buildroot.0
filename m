Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B81AC2A060
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E3D080C8B;
	Sat,  3 Jan 2026 22:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8LG0jCZmqj3; Sat,  3 Jan 2026 22:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C12280D6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480231;
	bh=ZbtuU2mO5Uk8+RljXRDHPMUvg4+5zmdE4/Krg9Fi4RU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=KAr8TIIiXmmhjbjsyI+3wIby+unvWwJx+1T+9Jl9oJi3UqyQRXoPNlREM+OkeilLK
	 KPXICnRMLTg9EeNFh7d2NICH+fpJX11cAUrVjcdY+jdb8esNZmEuzzXVf/al8dqELL
	 AwcF9awFL+YiqF8+K1Tx1hlvFHcJOUNjJiqpQpB3DdZh63D1k1wI84TsxXzT4vUiQJ
	 qiqwIKzBa+F6NDamyCStFp1VpXqnmTTnp87TqY6nRTU9qNnK3DWudbU0pIbkpc7qA2
	 dVsCJAu9OklAzdrGy6PshM9AoihP4v78xr9w++UmFDWOAPikXR51LdLObgnoomuXZr
	 LzlxTtescCZOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C12280D6F;
	Sat,  3 Jan 2026 22:43:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF6BF70A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A424480C4E
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYyvRU6mqhQH for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB39180C50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB39180C50
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB39180C50
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D60174E41F38;
 Sat,  3 Jan 2026 22:43:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AAF966072B;
 Sat,  3 Jan 2026 22:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9709D113B06CD; Sat,  3 Jan 2026 23:43:44 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 23:43:19 +0100
Message-ID: <20260103224330.2933161-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480225; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Bji1c8oeCnXAoCYIZ8HkFUzZ9DGR/6zoDoWMpvzsE34=;
 b=FbgyOK4ngSWkrEMPTH73QotKnD3eBFaWi2/yx5d1LWeL8lKCVjs3O5t7Dcc5eX/NFFvLNc
 FSxfh72+gqua3ZnV496MrQhUEHCf0d875pv77355ka2tiZQBda3HaSTdAa88rqLtU74TTW
 Rlv2IcYzSvo3PQX09gkDZKeRx3dew6qLO0UsW2gz0yDs27E+7+8kKnn6vgcgbOW2DTKmwB
 lLrklbCLXNSB3R4rTizAU19bWBFk88bSLUm5equ1bCN02/sSqzB7dn38t4drif1GOWYDUt
 rz3io5ppRgOmtaxbNB3GBCE0+qeYDxla4tnDT56AJ4IbXdI8Oy+5DdUT43R5zA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FbgyOK4n
Subject: [Buildroot] [PATCH 06/11] package/python-pillow: propagate
 python-pybind C++ dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit
5f446a8d6dd8715385d6e2df2714f064bf26243d ("package/python-pillow: bump
to version 12.0.0") added a select BR2_PACKAGE_PYTHON_PYBIND to
python-pillow without propagating the C++ dependency, causing:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PYBIND
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_PILLOW [=y] && BR2_PACKAGE_PYTHON3 [=y]

Fix this by propagating the dependency to python-pillow, and in turn
to python-pillow reverse dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pillow/Config.in     | 4 ++++
 package/python-qrcode/Config.in     | 4 ++++
 package/python-weasyprint/Config.in | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
index 51d8db5920..eaf98c85af 100644
--- a/package/python-pillow/Config.in
+++ b/package/python-pillow/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PILLOW
 	bool "python-pillow"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pybind
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -14,3 +15,6 @@ config BR2_PACKAGE_PYTHON_PILLOW
 	  tiff, freetype, webp, and openjpeg (JPEG-2000).
 
 	  https://pypi.python.org/pypi/Pillow/
+
+comment "python-pillow needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-qrcode/Config.in b/package/python-qrcode/Config.in
index 9a17cc1f08..071c867b01 100644
--- a/package/python-qrcode/Config.in
+++ b/package/python-qrcode/Config.in
@@ -13,6 +13,10 @@ config BR2_PACKAGE_PYTHON_QRCODE_SVG
 
 config BR2_PACKAGE_PYTHON_QRCODE_PIL
 	bool "PIL support"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pillow
 	select BR2_PACKAGE_PYTHON_PILLOW
 
+comment "PIL support needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 endif
diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
index 5ed84e075e..9db2a5afbb 100644
--- a/package/python-weasyprint/Config.in
+++ b/package/python-weasyprint/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEASYPRINT
 	bool "python-weasyprint"
-	depends on BR2_INSTALL_LIBSTDCPP # python-zopfli
+	depends on BR2_INSTALL_LIBSTDCPP # python-zopfli, python-pillow
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
