Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FAC3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 18:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A897C4F036;
	Thu, 27 Mar 2025 18:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMDF-lES8OUL; Thu, 27 Mar 2025 18:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA2F64F038
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA2F64F038;
	Thu, 27 Mar 2025 18:29:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D13DB19A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C356342263
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHJvgvHW3ib2 for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 18:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EDBF40AF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EDBF40AF0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EDBF40AF0
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:29:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6caaa.dip0.t-ipconnect.de [79.214.202.170])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20994A4C027A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 19:29:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38140)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1txryZ-000000007ey-3CDl
 for buildroot@buildroot.org; Thu, 27 Mar 2025 18:29:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Mar 2025 19:29:11 +0100
Message-Id: <20250327182911.944142-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1743100152;
 bh=swt8MdLxulz8DaJDWaRxke5yOyFacT9VESPplPPeVhU=;
 h=From:To:Subject:Date:From;
 b=RO8mLfNm82azbnIhfLGio15JS6xktGLfmzlzpzoRr1lKZwArmY9BCR1485H8MBDGX
 2tSE8MJ0iqEgsiWGm2u3T2k2TwSRVkqdsN9FrdmvEk0WGJbDIT8gJb7eTVnFDJlXlf
 WAuJXL/1nvEva8tf52Z6bXC9VuQY2BI8htNCScRuDa/Zi9V20E43v7kpouOy9AL3j1
 yGxtRyiGbhdwgF3voQxfaCqv0227lWGn3NwioZVGXnp/ZX4MErWEIfYsv60tmKKlrU
 XiHyV2GTbA0kJE6G3FWlmrFeiX9wmwOE7L0qeh5WVLq95vIV0QZ/kIF8gsN3EIwnzk
 rNNTdlkv/phCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=RO8mLfNm
Subject: [Buildroot] [PATCH] package/kodi-pvr-waipu: bump version to
 21.10.1-Omega
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
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 1e25d4d9ca..a0349b4d77 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1d9cb927c1c547f82c66730d52d1425aed08a13c237104ea377c9871c26c7097  kodi-pvr-waipu-21.10.0-Omega.tar.gz
+sha256  fb8f25f28023907332d3ebf554c026c6e36e3e78f688f462439c152de676734c  kodi-pvr-waipu-21.10.1-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 7b5552438d..54080f213e 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.10.0-Omega
+KODI_PVR_WAIPU_VERSION = 21.10.1-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
