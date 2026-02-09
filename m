Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB7BE94603
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 20:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 799FE612C1;
	Mon,  9 Feb 2026 20:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpV4USkrx1bP; Mon,  9 Feb 2026 20:32:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AF3360E09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770669163;
	bh=Gw9GpOSJGMJ7kcEnP9p5pEaJKFrXqbsDFHcMfAj4pKA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fHtCSpQrcOYu1g4jKgGSPHrvXopsjCIeZ9/qg4pRJuRYJgycsT2bqjxQUkvSGyItt
	 rykdMjY0+V2ud1wF9jEBWg0OkeFlOFqYZGzaWM8yR2wDUKB5ZgbrG2zB8uQPjoOt9i
	 ZcmE5OxbXmX+hXaOgiCtA/97SPjqAHBvcHpyMAMaS+r19TTfyuyQm6YbiZvh9FNLPv
	 QxI9Fgh7lKE2XYFXvKuWM2MudwadjBOzhdqTl7qEzgAhOfizDT8Wiors/3/qryQOMY
	 cQZrqjsIhqf4peBBtkPLhh1gOggPk0XERjf4jEzu3x9U8nVU5izIICmzcyxlyjP+nG
	 KZE15+r1z/Ujw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AF3360E09;
	Mon,  9 Feb 2026 20:32:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C879E219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD4404010A
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-ZqjT7qJE12 for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 20:32:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B2F6400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B2F6400CE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B2F6400CE
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b67.dip0.t-ipconnect.de [91.58.11.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E1A5A4C0860
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 21:32:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37864)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vpXvm-0000000029N-3m8R
 for buildroot@buildroot.org; Mon, 09 Feb 2026 20:32:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  9 Feb 2026 21:32:27 +0100
Message-ID: <20260209203227.3837422-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770669147;
 bh=E166OltlGFSS04f5dE5NdZjXpjgjKKjJmRbWSC8zmkU=;
 h=From:To:Subject:Date:From;
 b=oxekAk1Fpeie13Kk7Sv6dDddMjVP5Z2V29j3IXQShonVnU93Fy5NdpRRYVS+9FLV9
 Y/Xkj0i6QG5rdOEr4YB7yG+yaLpDGLQZotKdME5i+K6GG7+g9bf7UxkuYYqStOX3X6
 N/t5kKEzpaLT1pNiy9hbHEPhaJePy3jA3Gs3ML9oybGHO/ZtAm4B907QE/S8elfQix
 90GmUFpoQjvFGIH39xfXcmnBMFJsOrp+UV8qkKh9ilyFyVU+dDsjNxDm3KQAZyKnv1
 U6uhGBTdFGoAEqZRCSQw05czQkQMh/ObzqiC/57WLLXQOITxzOhmcf8EPd7H8f0qfj
 oAbpaos9h6HnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=oxekAk1F
Subject: [Buildroot] [PATCH 1/1] package/libheif: bump version to 1.21.2
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

https://github.com/strukturag/libheif/releases/tag/v1.21.2

Use sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libheif/libheif.hash | 3 ++-
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 3da82e3e27..0daabcb5dc 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,4 @@
+# From https://github.com/strukturag/libheif/releases/tag/v1.21.2
+sha256  75f530b7154bc93e7ecf846edfc0416bf5f490612de8c45983c36385aa742b42  libheif-1.21.2.tar.gz
 # Locally computed:
-sha256  9799b4b1c19006f052bcf399c761cc147e279762683cefaf16871dbb9b4ea2a1  libheif-1.21.1.tar.gz
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index acd302d847..b96dca4d98 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.21.1
+LIBHEIF_VERSION = 1.21.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
