Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F8ACD5BAA
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 16:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC42D407E8;
	Wed, 20 May 2026 16:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcBByepIFtiM; Wed, 20 May 2026 16:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0603340735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779295018;
	bh=Vh0NS4/EZxj5I01Qru8CTl9V1nCLVrfXQUTseSKOR5M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OvjdMilD6JDWj060whmOSAp/49ZlWfKoSp2DQSVtr4Sq8aoY7pYNv9Zh/z+86I7lA
	 9amB2vHtNn+yRPF8NTubtq3vtI1SCkzzjLZ2hVRIiT71K0QKlg9hknXAu6kGiTUjyR
	 8kbGqOLBxkY7ajmvEPJxTn47qHUlJqecTwoh3lGkj7JoZyz3qWgcFKEtw8xJmtISwg
	 S+l6ic7JAMd7Dcz4C/U02LSA81JfyZsKt7kyEDmg44zHLdzZI66iIdywcn0vc0GEBE
	 V8WOBpbGZWUEb7euTyq7rjw7fZr0v7an2iucPbk6XRBEnqj+rjZgIgOEAPcrEh/obN
	 e/A4BagkGcBXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0603340735;
	Wed, 20 May 2026 16:36:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D1DA265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 16:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A65A61151
 for <buildroot@buildroot.org>; Wed, 20 May 2026 16:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mS9vHi_19LW for <buildroot@buildroot.org>;
 Wed, 20 May 2026 16:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE4166114B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE4166114B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE4166114B
 for <buildroot@buildroot.org>; Wed, 20 May 2026 16:36:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ef6.dip0.t-ipconnect.de [91.58.14.246])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D4109A4C174E
 for <buildroot@buildroot.org>; Wed, 20 May 2026 18:36:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47296)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPjuf-000000005cP-2sV4
 for buildroot@buildroot.org; Wed, 20 May 2026 16:36:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 18:36:53 +0200
Message-ID: <20260520163653.1086908-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779295013;
 bh=My9iXqTtgYDGzj6XfX4G7PTUjKtAatsQTLCHguAZrAs=;
 h=From:To:Subject:Date:From;
 b=nfayO3me1W2HvIVkmIs+qjvDsoMDNEbscftQlVS6IQjje+yFrMlVhTB1cK2Xh5x2C
 k37vM84HXrzbYhBb07PsW6iKESdVkF6ZxBEkZwOTuLQAphoLUGtPyCkwvDIIY9xZkh
 8z0TZH4Q/6HcABNj+8RDpTMCTm5qVZq7b7+CP+k9j9Sb08LLb/qeJe1x76NuK9I4qG
 H/UCmPwdYFdXDDlXAKvOBor86j2/oQtCcxnWe6bEmzK5xNXko9VHIdq0fKVaFe/gCO
 Ld0gcID5uHKHl/+dbfjt49uv11fXj4djbMLemb2GEV/2pjyqzeW/vx5AN8Hz6pvs9T
 Gfiq9LY4YVA7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nfayO3me
Subject: [Buildroot] [PATCH 1/1] package/rsync: security bump version to
 3.4.3
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

https://download.samba.org/pub/rsync/NEWS#3.4.3

Fixes CVE-2026-29518, CVE-2026-43617, CVE-2026-43618, CVE-2026-43619,
CVE-2026-43620 & CVE-2026-45232.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 933d330323..666bb5cf99 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.2.tar.gz.asc
-sha256  ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315  rsync-3.4.2.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.3.tar.gz.asc
+sha256  c72e63ca3021cbc80ba86ec30102773f4c5631fbc492b52e773b3958f82a53d3  rsync-3.4.3.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 3282a759c6..5b4345d036 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.2
+RSYNC_VERSION = 3.4.3
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
