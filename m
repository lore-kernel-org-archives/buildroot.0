Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96790C71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 13:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6838A60B57;
	Sat, 14 Jun 2025 13:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id no7rT50v0nX5; Sat, 14 Jun 2025 13:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A020760BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A020760BB8;
	Sat, 14 Jun 2025 13:41:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 054D3151
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84C3A60AFF
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMz6EXaAF7-6 for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 13:41:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D0FF60AD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D0FF60AD0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D0FF60AD0
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:41:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ea.dip0.t-ipconnect.de [91.58.8.234])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A6992A4C0C64
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 15:41:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54236)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQR80-0000000005H-3nAJ
 for buildroot@buildroot.org; Sat, 14 Jun 2025 13:41:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Jun 2025 15:41:01 +0200
Message-Id: <20250614134101.678709-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749908461;
 bh=ymxz0i2RnPyT4iVRlItOdXuyj6N6RjfDXkwvmozi9WM=;
 h=From:To:Subject:Date:From;
 b=FXwYm6ReJXo39dIKTsrwEKhWyGE9lXkGS9B7FKBH2B/nIZQiArekt1LEGRjM2g/xL
 ucWDPhVLeM3o90ILt4mkRfbkF6fpwZUbwdYaa0KhMY1LWSzOSIt98MYgH4ej6rXWVK
 kJ4cTJLrOWVO/3Z+163HxGhft0/yQl4EaB/hS90KRglkRzwTSPuqsvjsO9COPXQsxK
 IqRNWnNZ3oJ39IBxD9mKOkB8vyqNKI2TVjsEuiTCvMJHeKODfPz7/4l33E/RDWfkqO
 ZUbuoBGKRYXQMBzdDg8cJn0EUkDO8nMgZ20Iz7n8VcrTfDERhie3eG/qaR8pTowf07
 Sgwzx4m3yVPGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=FXwYm6Re
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.49
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
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.49/ANNOUNCE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 7e5b33149c..81a5be2b7d 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.48/
-sha1  132bfa1a68e3d8f741d0b3fe03809e181fe57b7d  libpng-1.6.48.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.49/
+sha1  ba0b3067213c53ee0e36e98824450a4f264d815d  libpng-1.6.49.tar.xz
 # Locally computed:
-sha256  46fd06ff37db1db64c0dc288d78a3f5efd23ad9ac41561193f983e20937ece03  libpng-1.6.48.tar.xz
+sha256  43182aa48e39d64b1ab4ec6b71ab3e910b67eed3a0fff3777cf8cf40d6ef7024  libpng-1.6.49.tar.xz
 sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e215d70f7f..adc0a1f1c9 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.48
+LIBPNG_VERSION = 1.6.49
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
