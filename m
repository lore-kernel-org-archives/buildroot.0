Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80439C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 29 Jun 2024 09:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C94A60853;
	Sat, 29 Jun 2024 09:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxJKfE5MEIWc; Sat, 29 Jun 2024 09:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D2F960774
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D2F960774;
	Sat, 29 Jun 2024 09:57:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E25A1BF38A
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 09:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 082F7415D6
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 09:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxXE0eMqlW91 for <buildroot@lists.busybox.net>;
 Sat, 29 Jun 2024 09:57:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11DFB415CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11DFB415CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11DFB415CD
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 09:57:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf0a.dip0.t-ipconnect.de [84.161.191.10])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5B8BFA4C0A6E;
 Sat, 29 Jun 2024 11:57:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32802)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNUpa-000000002qM-1hYm;
 Sat, 29 Jun 2024 09:57:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Jun 2024 11:57:18 +0200
Message-Id: <20240629095718.2899158-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719655039;
 bh=6N2su0pqVypwSWI7b5vtsxCQzHEu3M+Nbs4HjPa+Mn0=;
 h=From:To:Cc:Subject:Date:From;
 b=Cp9KoFCBy+W6Y/HFGXo0XKySac7KdHNxEIJ8bJNgOkx1TNKUPP42WGBvMcR/rmu0r
 RQ4h7j3ovlKwv90hPhxJ34vFn2TMjJgv0uHRJhTHH9ybHJJld11GmbsumeZPOSlR0c
 llNR7VMdQzDjUbs2UEMJKcPkl3oiInAq1OK+lx6s/G4/YqYVM0N1aJPchEiV6YahF0
 BB6CTeCYjTdQwRjRqcLH5YHDgzvRKLcr2Yw6lvf1tmXqTBp1nmdMnvn6id3qHxnKay
 b23pa/+zTN3OhdYbFCL249o8BxVD7c6oYnwALqnwTQHtDsBVcbKkioxBL98pyHi+Cx
 MkTidN28tLfAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Cp9KoFCB
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 972db9300e..225123a5f0 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e3f05da73596097757fb4c0f9306e415b1772f26a52b5b86c50d63811e7e65af  tvheadend-c63115464d8f6556fb4cac93ce8740afea1b00d5.tar.gz
+sha256  8454c696e9987ae77d1bc6e1fe45536bd9ef69192b6e568840fe8994ca2a5c2b  tvheadend-d2e41b553e7cc6eb06fd21b42bbed4b3a1f28bc0.tar.gz
 sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 8f2e37b122..0453e08f4b 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = c63115464d8f6556fb4cac93ce8740afea1b00d5
+TVHEADEND_VERSION = d2e41b553e7cc6eb06fd21b42bbed4b3a1f28bc0
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
