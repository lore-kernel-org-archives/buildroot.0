Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A701AD59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 15:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 564A380D30;
	Sat, 13 Dec 2025 15:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ci5ljZPejxI2; Sat, 13 Dec 2025 15:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49CB180EA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765639060;
	bh=y/QS5pZfdb8OQrvwje0GLwV9A4RTFJg0IysE8RGU+1w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sPZ0NLr7dZxeixQhaInMZppp0zKnKzXuDAl8f2ytiL2Z53MLle2BPB7jc03kUyCHi
	 2u+heYLp4/0kMq1AvoPgw7EF25QrctZCzxgMtDHizSdrgtvG2akBqT4dcwJXBBjBkg
	 MPbPIadnLyHB3MFLJ2IJ7t/UUDg+Dj5LBS7UnffsW7blH3x1ccfGOEVR5PLDAVpA1u
	 rNDRGDLnG+8W5hV7R40zlDSuZj4s+w4QlIA/KQ1M6WcSUDVjrp3nVxc5LUazSkl6iW
	 AczGp15ffUUC7qYHHKMRG546Be3OYHJ6Cs1aY/RZo51KobW3vV5M/QY3e6zcBTH2qh
	 no7Y8bDdy/KiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49CB180EA8;
	Sat, 13 Dec 2025 15:17:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4311513D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34CC081E5B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHksULlleJb8 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 15:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7471780EA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7471780EA8
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7471780EA8
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:17:35 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id URNEvWlslwf0DURNEvzJkQ; Sat, 13 Dec 2025 16:17:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Dec 2025 16:17:29 +0100
Message-ID: <20251213151730.821513-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKZcuaO3jkyCyUXqTErCXCDe4wtA8/gxUYGbeRdXU9cveuXJyrLu/gcqQhEdfmO1EXYEwf6H4qqTRjgxo8DxaJWD6Xld6tJHXeUgD2vW6ukPbHcX8Yf0
 OtmlVUCVuvpfcpOcSUjQEzMlzeqUm3evrOCfM/ym6xSDAVmi/7oaPLZ0BPcfl1wkDA1S8nUMKIo7FUhWnREQ/fMnWqUVUyXTP9E+wIdyGpJFQg5DGGlo0ByZ
 qg0WA5aZeELp2nTUfnAwcT4Ljv4XzmblIGcYwrQKiUkO9oGyXdlZifQIzRhe+N+3dmSF7NZcF+q4maGdfPJIuQ1Zqe6EK1nBf9z/nz1kYpsEOE9wyg5xI+jp
 dD9hyZah
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765639052; bh=6y7ZiXLJ0TMUbzctQjUSAuyfpvVzYcvYevo+Pz8drpc=;
 h=From:To:Subject:Date:MIME-Version;
 b=nwpnhbUC30QOy45VLzah7zVS7WveGlUfALRF0MqKcXuQ/cIzk3y9YbngvMmM4/Ly4
 AYFxcOgz1SuG3eXuOX8F+2IBBx6oKv2x864bBqfapDt0p1REMw/5/07y5U59gHtPW7
 G6TexY4Cl8E+sOa+J1SX0Mxtd3I19Dg7MCnV0iiRtB2Gm+fcFiCfdX52XaqduW3BcM
 yDbUXzccGvy4mdzNdKSyV8wpIPLW2UcDy6c9+Klv0OrZOcCTNssGK5SFdK3zPzdJeb
 XXnbyb8Gs16/1bPcx0g/yafIKQlaMM7PQ36d4lG+47obcj2deFl94olGjU05xl19tY
 LQ0ePYeBhr4Xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=nwpnhbUC
Subject: [Buildroot] [PATCH v2 1/2] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_DB
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

Package libtirpc expose rpcdb so make it selectable.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add patch to series
---
 package/libtirpc/Config.in   | 6 ++++++
 package/libtirpc/libtirpc.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 31f1636ef5..e1ac9a4e7b 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -16,6 +16,12 @@ config BR2_PACKAGE_LIBTIRPC_GSS
 	help
 	  Enable GSSAPI support
 
+config BR2_PACKAGE_LIBTIRPC_DB
+	bool "db"
+	depends on BR2_PACKAGE_LIBTIRPC
+	help
+	  Enable RPCDB support
+
 comment "libtirpc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index ab15954561..7aca2c83af 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -25,5 +25,12 @@ LIBTIRPC_CONF_OPTS += --disable-gssapi
 endif
 HOST_LIBTIRPC_CONF_OPTS = --disable-gssapi
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC_DB),y)
+LIBTIRPC_CONF_OPTS += --enable-rpcdb
+else
+LIBTIRPC_CONF_OPTS += --disable-rpcdb
+endif
+HOST_LIBTIRPC_CONF_OPTS += --disable-rpcdb
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
