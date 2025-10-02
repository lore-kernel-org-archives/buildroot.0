Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DD6CAC5B0
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 18:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FD9660618;
	Thu,  2 Oct 2025 18:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S97y39Od152l; Thu,  2 Oct 2025 18:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63DD86061E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63DD86061E;
	Thu,  2 Oct 2025 18:59:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6338C1CE
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 18:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A8E260618
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 18:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GA6ntPfRu9p4 for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 18:59:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 482DE60616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 482DE60616
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 482DE60616
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 18:58:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc8f.dip0.t-ipconnect.de [79.214.204.143])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F3F23A4C59B3
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:58:57 +0200 (CEST)
Received: from [192.168.1.144] (port=55170 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4OW1-00000000061-2Q8y
 for buildroot@buildroot.org; Thu, 02 Oct 2025 18:58:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  2 Oct 2025 20:58:57 +0200
Message-ID: <20251002185857.2327302-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759431538;
 bh=Uv1hVMJ6iIkoV0JEjrq/m5lsAfQrFRMQfBvZFIc/eZA=;
 h=From:To:Subject:Date:From;
 b=M+h1o8dUHKlGl8RhHdR7NJSM2yfwHa2jUUIU0nj8ZO4aG+uyxE3rY4ZmgiEMGBMnb
 lPuO2kAwZAcV9Ft9SkUtMS0S5HQIc7p/soO5urtEU8EPGWVhAvyWWN/FoKCmNIG4dx
 kbJMsZKOf+sYdt6ZoZan0GOjMssQQ5p7rF7cqs4VclSAtydw4OpH4hf7oM3l/qNfvl
 VevIdQ7CnM6juZdhk7BYqTy8ImXmllBA9jU0WWudXatGYHQHTHaxoK+CVRpDW9EcJY
 udok5+F4S+Xs+7vdctrVjLOOlJ2EUYUMmB3I7NQscSzR9igc0NIiUezltlkNNacX84
 7+DRwIYHRpqaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=M+h1o8dU
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.18
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

Release notes:
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/alpha-and-stable-release-0-4-8-18-and-0-4-9-3-alpha/20578

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 55c915ef4d..95a3a26eb7 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.17.tar.gz.sha256sum
-sha256  79b4725e1d4b887b9e68fd09b0d2243777d5ce3cd471e538583bcf6f9d8cdb56  tor-0.4.8.17.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.18.tar.gz.sha256sum
+sha256  4aea6c109d4eff4ea2bafb905a7e6b0a965d14fe856214b02fcd9046b4d93af8  tor-0.4.8.18.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 399d4b481f..f9ff4fbca6 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.17
+TOR_VERSION = 0.4.8.18
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
