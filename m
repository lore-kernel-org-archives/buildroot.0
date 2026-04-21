Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFA1F94CA0
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 19:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 808C560885;
	Tue, 21 Apr 2026 19:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBWR4CdMDBkD; Tue, 21 Apr 2026 19:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A499460882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776798337;
	bh=z/6qlqtTzKHfDwbxcvsbO0RNeKf1/xFK/QjqVD8Jlnc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z+dL2Y+DsmO5PV6aNzymIVVqR6u2PJQdru9rPkNSoZCCTFC8Qyujs3JiKltDfR2B0
	 P/C+xpevNd+5Fht6ebUM4T04rO3BI7g6Gv2DZMTWGATtluxGVUt0mg16vJ8yJ/1yDg
	 0gs8LwaiHW/1l2Kd4hzBlve4yI8LTZeIEfygP1QrBc4IvsClbazGo7SzaNQg0Pe8Hv
	 plh5n8H3H06vH+LwaAzNsGS4k156mzsIhrvN/tOGoqfHrpQHPjtDh0nRPHlsn+f9HF
	 Huwdwch6lFc6oAEYzPswGRjJvQaEmML97cj21bQStQhvSHu6f9CdG2wX2eZgN73L2z
	 W4TuzP7BFzO4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A499460882;
	Tue, 21 Apr 2026 19:05:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20002183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 063FB404D6
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGbIhhvTgGQN for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 19:05:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECC1740364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECC1740364
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECC1740364
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:05:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22E55A4C0185;
 Tue, 21 Apr 2026 21:05:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34786)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFGPc-000000004Cw-3LUZ;
 Tue, 21 Apr 2026 19:05:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2026 21:05:32 +0200
Message-ID: <20260421190532.2722923-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776798333;
 bh=GAgsq5fFU3tu0KYOIoHaDrF/Gxm+7jH2siPiyuBJEhE=;
 h=From:To:Cc:Subject:Date:From;
 b=qVsxPJ5cJA1FViVj7FRePnpef1PbDULKZPo6XIDzAagxlZIUlFlR10xlWU+EX/vyG
 x6WRqm4kiaGlNmICCLT6dq/XL75IjPrz9SXXJYy8iHckGvCieyy4Mlo1CiqO40tI9p
 ASys4avOW55pJEMURnieccu1yFJISmwj6zvHdU9dk1dtPOXQ82udxbf0eAVKj+q+fb
 LEoYKqa+vmC4mT/DRsdHJMvDXRDGvZt0CQACwp2VmLuki9WoaN6zG87kZ1kPDHeJTE
 NV0e331FTp3guQqTu9bsKVIqVPBz5RhiYOyGhFJiAKpBvJt2eNi2N0epNiJo3V50Oe
 Y8F/wtloveiUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qVsxPJ5c
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump version to 2.6.25
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

http://www.haproxy.org/download/2.6/src/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index ce5dae17e7..5c644356a6 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.23.tar.gz.sha256
-sha256  1281d57f25e98456a042c81f32801a106a293c1340b0c06debb2a87d6a7b3611  haproxy-2.6.23.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.25.tar.gz.sha256
+sha256  d861cacbe2ed51ae8ad5fa9ee5165b4e5e2bccaa5b9e04324711761d7d946be9  haproxy-2.6.25.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 9504ec6b7a..a22c8b38ce 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).23
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).25
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
