Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5F8D5B161
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 21:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9DDA814D4;
	Sat, 13 Dec 2025 21:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5kDZPys_T57; Sat, 13 Dec 2025 21:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC25D815D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765662077;
	bh=fuZBgVq6awk62hrs9DvdWEdkYjluyaAnfogSRp0Vm88=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M0rDO3Fr6G97VVUr05BCrdajo62TyPTEMPVfRkyqbNCaANf9PQP0i5fuupuAGUlM/
	 LSgBR1XhLuPhkDv3/yp8sfZVuA2Xc+Uqlv+TXlTbxutNiIi0rYRIkoVwuMe2kv3cEV
	 Y59aLIjJOnA6CDjsIztVYlzvW8s0gZEQHIZQ1jlW9pZWRHMlaLOwn6UaTeJEqBhU92
	 XZ3DDU+Z2vMlZzSAmgyFquQgOzeWMNZMiDL+25KDU+UgmiiZiwEds2BXOfl7QjQNdh
	 KGw/FcA6qCzYP/xA79tHP9TCdRcL5BXsvDk6p4pCIMQusC1+JsXWAXHSHIbKo6p6Lu
	 ZXun+3S6rq5UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC25D815D8;
	Sat, 13 Dec 2025 21:41:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24C1D2EB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 165C4608B5
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fE4AK8j3pxCN for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 21:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39B9160890
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B9160890
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39B9160890
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:41:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id UXMSvqOTq3rWiUXMSvHz6H; Sat, 13 Dec 2025 22:41:08 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Dec 2025 22:41:05 +0100
Message-ID: <20251213214107.1893921-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPZmBN7ucbg08uqPXpC90V9uR9gPHnJUsAwNSeTRTlMqGRksvrIZeccspeZH4I8QMO+b8jhm7UEB4Pj+ZrmJBmparxUnO6z/fUvK4C4eNeHoCBF0WagU
 7aial5HX6qvHLPde49Vr1e7vIA7rIsuE0KdRUeaLSdZdxq874+NWgICorwNSwqsBwzT0HkNNXG7OGDTV2SPpu5QvCk/0h0rrRkk0Rl+DVMgTq7wh/NCvBOuT
 0WjZv7jIETDHkqQjQyRa5urzHDOXOeiAOq3VFEc9PavNYTWNaws/Ct4stX17nq94B7KYw3WGOnMzrp/PUdFnOmxgHSchFjsx5EBoZz2njbvflN1ei0jEy+Ip
 4IJqCihz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765662068; bh=rT5kxgZwwCJA5Bf3NjBzQKAkWGpQkCtqiQQ3KQDW8ZE=;
 h=From:To:Subject:Date:MIME-Version;
 b=UTORGOi3ZTgb/vDFRU5XcBVNB3JUaaNpamYlQE/iAqCawkAeIOTCa7qvnbIxjFrFt
 RYvRSa+IV+jRRNFEwZAmmqKAP97H7zuYVc0gPon26GGAljEn9oKp+y8ZfPTx+GfBe1
 kx5EYZwm2qUYhF0tITDCH+5/7IBVxQdrzdmK2Y4jhX+JL5r+0Ma6pDbikCy3EMkm2p
 GR36f6siI49wE+qg9zlzEEslrvbiN7TXdho4p7OyP0MuRtTkViHTDGca/OtqpAt5+n
 DK3qlYI4ELRKsh8mS7bmggWE4AJg1ivg+wC/qXHsTTCahdoIB1EAlJjuVv4F0KgQV2
 lOWRY6s5ybowQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=UTORGOi3
Subject: [Buildroot] [PATCH v3 1/3] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_RPCDB
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

Package libtirpc with commit[1] exposes --enable-rpcdb so make it
selectable to allow packages that use rpcdb functions to enable it
and build correctly.

[1]:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* added patch to series
V2->V3:
* renamed BR2_PACKAGE_LIBTIRPC_RPCDB and added section BR2_PACKAGE_LIBTIRPC
  as suggested by Thomas Petazzoni.
* improved commit log with commit as suggested by Petr Vorel and Thomas
  Petazzoni
---
 package/libtirpc/Config.in   | 10 +++++++++-
 package/libtirpc/libtirpc.mk |  7 +++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 31f1636ef5..61fb23af5e 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -7,15 +7,23 @@ config BR2_PACKAGE_LIBTIRPC
 
 	  http://sourceforge.net/projects/libtirpc/
 
+if BR2_PACKAGE_LIBTIRPC
+
 config BR2_PACKAGE_LIBTIRPC_GSS
 	bool "gss"
 	depends on BR2_USE_MMU # libkrb5
 	depends on !BR2_STATIC_LIBS # libkrb5
-	depends on BR2_PACKAGE_LIBTIRPC
 	select BR2_PACKAGE_LIBKRB5
 	help
 	  Enable GSSAPI support
 
+config BR2_PACKAGE_LIBTIRPC_RPCDB
+	bool "rpcdb"
+	help
+	  Enable RPCDB support
+
+endif
+
 comment "libtirpc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index ab15954561..eadacedfcf 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -25,5 +25,12 @@ LIBTIRPC_CONF_OPTS += --disable-gssapi
 endif
 HOST_LIBTIRPC_CONF_OPTS = --disable-gssapi
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC_RPCDB),y)
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
