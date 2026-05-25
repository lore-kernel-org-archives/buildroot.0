Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E1ECD5BB1
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 12:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 699B860EE2;
	Mon, 25 May 2026 12:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2zzvvr2CxZ0; Mon, 25 May 2026 12:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523D060F85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779712293;
	bh=xnAJz3N4YrafRdGBvIf7P0aQxnE+yb9he+Jx3y5CH7o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cvdRcqox/zzbOP3WAZUMMCM+yuBrhCPhciMQLbfGZg3H5CPWi8snX9PN1DoXVoXOH
	 nt8uCATUhLADcVczxpD3YHuKG9mQANXigwmiHboLBflw7V2q1hiEXpiVR0cWM181Hq
	 1ExxhNaFlLMr9Od4g6rhlWNOWs9QB02lBWVA42Owhzu6KGIabg9nwX9FjbAhsrihCO
	 vn3Zvbypco/vhynBTevorKnmKHBa++w9v6m9bRE6oUdM4occgzUx9szJkiwVENWdzw
	 jFzsL/FrGKeV8oKYm5R0D/KJ6h6BnkaSk958XB56G06eAUc/dLH2C4TrcVTvQOTWdM
	 r57RnOVTIyhbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 523D060F85;
	Mon, 25 May 2026 12:31:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAA7721F
 for <buildroot@buildroot.org>; Mon, 25 May 2026 12:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABE884037F
 for <buildroot@buildroot.org>; Mon, 25 May 2026 12:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTfWj5v3EYRD for <buildroot@buildroot.org>;
 Mon, 25 May 2026 12:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 01E884025D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01E884025D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01E884025D
 for <buildroot@buildroot.org>; Mon, 25 May 2026 12:31:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 353CAA4C0EEA
 for <buildroot@buildroot.org>; Mon, 25 May 2026 14:31:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33682)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRUSq-000000008BG-3vSG
 for buildroot@buildroot.org; Mon, 25 May 2026 12:31:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 25 May 2026 14:31:25 +0200
Message-ID: <20260525123125.2919307-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779712286;
 bh=iu4CahmfaXnr9PKyQgSVmHlcXNzMfxHLYldpye+ni44=;
 h=From:To:Subject:Date:From;
 b=kYt261bKGnXr96KeLECFHbEx165kAy7qYZZm7o9VkgkL7KSEmLxbkG2397/YB2MqU
 4GSEvKyNH4DH/894/kdJRAxRnJACSmLxcDLZbDShBXDNLIfCJobhOvO0e1CNQnH9MA
 8n2f09zACUtA48FiNRKOy6Z7tMh2TCCpKh1mh+F+2BA5TZvDW+HIY/JwUKSpaMaS1k
 TxT/zBS8eHhE0NKCesG/D8bY9yvviJ9aJiscXWEe2S+KUUfJgh1BAKn7mtyPh+3imb
 ItMQf1idAC8ncSGdfc6Xhkc7Ne9GW4DvVvuD2N8Z9Leb8x1xCijkOD36wKFBP4HwGe
 8md/cKp7/XwYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kYt261bK
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump version to
 10.11.17
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

https://mariadb.com/docs/release-notes/community-server/10.11/10.11.17
https://mariadb.com/docs/release-notes/community-server/changelogs/10.11/10.11.17

Fixes CVE-2026-44168, CVE-2026-44169, CVE-2026-44170, CVE-2026-44171,
CVE-2026-44172 & CVE-2026-44173.

https://mariadb.com/docs/release-notes/community-server/10.11/10.11.16
https://mariadb.com/docs/release-notes/community-server/changelogs/10.11/10.11.16

Fixes CVE-2026-3494 & CVE-2026-34303.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 216b3be7e3..ca23b36a38 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.11.15
-sha512  98d1e54954b69cf87a96be7d76f80333f27832a29279e6b0a9615b830e171713222abcb9ec9b9a545c0fc4a0f9f8e3d4774babcabf534a6fa3cb3dfdaed0dedc  mariadb-10.11.15.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.11.17
+sha512  788803b15afbb6193111774a233d0db0604f27ebae3b4b439368e2d7caeffb662846e530fa65f453a6d77541cedb99112ea319c7c0c2ce5074c32aefb06a51aa  mariadb-10.11.17.tar.gz
 
 # Hash for license files
 sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index e2c0cee3d5..c718c1ce7b 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.11.15
+MARIADB_VERSION = 10.11.17
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
