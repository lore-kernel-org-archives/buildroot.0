Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243A1EBFD18
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 08:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA9384120;
	Mon, 13 Apr 2026 08:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jv5RfWUG5VJh; Mon, 13 Apr 2026 08:27:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E07842E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776068836;
	bh=9wcUgQakFxCCWU34YDwJrChMHUOVgZ3xF/HCSBqv3hM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oez4LXjastf7CpwOxR4whXw7Nc8G+Fg2+ehi4VJGPMMmikQzRYRcfGS73hRFXlAd9
	 4fB8H0EKrUXo3cD0WYavL2VF/WAvZyCrLQA9lK5xMwwy6Ueov7se1KQI8LL/XNQJ5D
	 Oi+lYZ6wGkVNrEFPCVoqOBpj60FIZiqDECLY0qwhNdacDb6Eb3Z90x9Uc/GjkalYU2
	 61dtKxjgQdJBoq4rLydPvlSYpJ6szWzsa8k7Z8we0yNNCnbHBWnD7NG0InxmKFvPn/
	 josigV3TSWsIutbGQYcXM8s4r/x4Gk9WtwdJCWkTI+GPcjZoYuQNX/TY2NtaSxom2Z
	 p+7QMGvATslqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02E07842E3;
	Mon, 13 Apr 2026 08:27:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52C7D283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 446F060D9F
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORS64Wdcb_V7 for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 08:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14FDF60B73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14FDF60B73
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14FDF60B73
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:27:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ccdb.dip0.t-ipconnect.de [79.214.204.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92EBEA4C169E
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 10:27:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53382)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCCdK-000000008N3-3Oly
 for buildroot@buildroot.org; Mon, 13 Apr 2026 08:27:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 10:27:03 +0200
Message-ID: <20260413082703.3553408-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776068823;
 bh=wIZAEGYdTBaRB8eXpIaPP71p8UNQ5iPH6UKQsPW+MA4=;
 h=From:To:Subject:Date:From;
 b=f84UMb9nvuvxFJvKOF4BQ75GL8mRQnUpZ7aOLR0VdIPCrja8pHROwvtJk1CxjgICX
 VYWsiU9fTBc1JSXQKrJ/wWunlyr0T7oWh7AunsHl5fm7sL0SqxocaSX0blZJxRDxpC
 GojF6NzNZNMs7SE+4GpZEc5uP8wKLYt5llJD1NpxnPuR+sJ78TMxxhefdpTf8gNf1s
 oFjdZMzg3PD8b+/Zjd43MUCEFDc0fSxI704NE8r6DcsRrzEAaZKba10jdb4HXyDmYK
 Inzecc79KE+U/Y367dV1H91pOZKUs6UnXtL5/5ZIFX4l5zksXHrnvyVW59EGkLulGl
 gnjxRMRrGDSrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=f84UMb9n
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.53.0
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

https://sqlite.org/releaselog/3_53_0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 7c5068c7aa..49d0012ded 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e21d77a  sqlite-autoconf-3510300.tar.gz
+sha256  851e9b38192fe2ceaa65e0baa665e7fa06230c3d9bd1a6a9662d02380d73365a  sqlite-autoconf-3530000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index e9fb874399..721af0d840 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.51.3
-SQLITE_TAR_VERSION = 3510300
+SQLITE_VERSION = 3.53.0
+SQLITE_TAR_VERSION = 3530000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
