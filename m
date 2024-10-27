Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514DCD13587
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 20:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1198D401B6;
	Sun, 27 Oct 2024 20:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Gg7qtU3iWJq; Sun, 27 Oct 2024 20:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DED3E40190
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED3E40190;
	Sun, 27 Oct 2024 20:56:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B190E112A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 931C860667
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xgMqBAckw3P for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 20:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85A556064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85A556064B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85A556064B
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:56:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8211DA4C10AC
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 21:56:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44230)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5AIz-000000003Lv-3Wj4
 for buildroot@buildroot.org; Sun, 27 Oct 2024 20:56:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 21:56:10 +0100
Message-Id: <20241027205610.3445994-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241027205610.3445994-1-bernd@kuhls.net>
References: <20241027205610.3445994-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730062570;
 bh=XkVoZyoDepEUe4fwnIKN93/1NbhCSsjtLfxL5hHgk9w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Bgg6wYVuh+974/389v4MauBzSjv9NS+N3fR3GeZPtFG8jdvs0TsqpkffYK39vrt/E
 fM06xfFTbohXXN3aEkvj/E1/wwpe1FMVGZlgpNAsZsEYe3QyKgYVSTuM8ZS+QZts01
 sOhofEJR7nayUopvWHzZqjyI+O8h7PVoX5zxqHO9jA+Om0HYViKXdrh+9E8pF7US/I
 3GNVFFkLdVUh+LwhTHHDcAtG9MWB+pbBEZ0w5MuzwUnxRlTFR/714PNrK9RKs4QNph
 GIthOL2rTUWUlFeOGNwlJwPVVsy8EINk742SyCm8xQkBBaw3E/wc9rJ0cmfrOzt0s5
 7cFZ+RFf7wL8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=Bgg6wYVu
Subject: [Buildroot] [PATCH 2/2] package/iwd: bump to version 3.0
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

Changelog:
https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog?h=3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index e05bf6fad7..b0a72efd7a 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  86827b97cb5b19ddecce36568c59378da2fae8cf37a0e2b9eacd1269f24c6f8e  iwd-2.20.tar.xz
+sha256  bd167ab368b6ba302b6c948a4f41f02d233a12e20d5094b1c0393325309f8a60  iwd-3.0.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 47020624ea..3a178795da 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 2.20
+IWD_VERSION = 3.0
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
