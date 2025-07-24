Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2C5C83F26
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 19:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EC5441B18;
	Thu, 24 Jul 2025 19:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3rl6F1Msb8C; Thu, 24 Jul 2025 19:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6689D41AA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6689D41AA1;
	Thu, 24 Jul 2025 19:28:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE418B83
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC53660AD6
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sx2_iHa9Cz8n for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 19:28:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBAFF60F3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBAFF60F3D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBAFF60F3D
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:28:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20B61A4C10C3
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 21:27:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58438)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uf1bP-000000000S5-2KeU
 for buildroot@buildroot.org; Thu, 24 Jul 2025 19:27:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 21:27:39 +0200
Message-Id: <20250724192739.1193136-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250724192739.1193136-1-bernd@kuhls.net>
References: <20250724192739.1193136-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753385260;
 bh=q8S4/p6ByzpgNRUI3cKUMSTmH/xzSKCcGQIxrZH19Es=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=mqzntzwSvnj8F+GMLoq95H0nWJmOUNV5SK8rfQH2ckcF6W3ZCxAsmMU0PlGrDpVOW
 OMpbWwDs51WnB6qow6A1SuRctqxsKGt8HEC1xyh4eiQOtiNv+L9vwCH39znCh/E5Aj
 kp17dk2A1YtOw36blaqPNPhhnJ5hL0vr7DXp/RAMZAMubIucqtL6QsnZoeAaCLY+xj
 gDatmlscOZio/7BWoC++EcFNjeIcE2wrnHDsT4pXi+Brf9kXSrCfnL/E+afALNtMtL
 Smi0H3ES6bg3ZCvPtm070xXS3CmuPIRGrptCTFRgRTkNQllSn1dSm0KUDoTLGCJ5nr
 tjFvitcwl0jbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=mqzntzwS
Subject: [Buildroot] [PATCH 3/3] package/intel-gmmlib: bump version to 22.8.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index fc7b62bd9e..c4e90dd67f 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0e509edf0b7892fad210e406014b3f6a53816a2ddb80650e9e1294f55aa493aa  intel-gmmlib-22.8.0.tar.gz
+sha256  9b8eac1891650021ded26b72585e7a2c702a3ba47565c968feabd14ab38d18f7  intel-gmmlib-22.8.1.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index bc29e434d9..18c8e48648 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.8.0
+INTEL_GMMLIB_VERSION = 22.8.1
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
