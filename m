Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0D4D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10E0C605DA;
	Sat, 26 Oct 2024 20:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5Kb6xKqWD_q; Sat, 26 Oct 2024 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F438605DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F438605DB;
	Sat, 26 Oct 2024 20:58:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 202315E29
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC7874010F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w716dzRwBuk9 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A17FD40003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A17FD40003
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A17FD40003
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79F94A4C0CE0;
 Sat, 26 Oct 2024 22:58:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38554)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4nrz-000000004VQ-39RT;
 Sat, 26 Oct 2024 20:58:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 26 Oct 2024 22:58:48 +0200
Message-Id: <20241026205848.2664636-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976328;
 bh=klUDicZf+jygam1PYFLqZqyb7yIp5yVIyxBQDoNUki0=;
 h=From:To:Cc:Subject:Date:From;
 b=Gb9kOtTVspEFp7Cn62XVSRI4WHX7qITgUD+WyK/2xq/dqM/h06uYrbbK6KCH0ya1K
 Y12hVsq502c/0Drg9TVjSZSwfcYNDcC2pNxDFV/W/62QkfUDd1rTEDgJCZHxELYs43
 mG5ba2l5/O/4yTqjPwGMKcwsxqiy+ijdZaIEMT6DJQEX5lSkro10SXTPnNyiY4c6Kg
 vikHEB/aDyABIXQytJsLaXr5t28Qc3h9zxmXiCDYLfLafyvHCVIzMw/hojnN29/3un
 DfNKaNPQ0nqdAee7vSeH4sEcQku5Xmbn9HnuWKlt22MQRfa2K1w6LwvlsY/e4mV7Gh
 +Muc3EgJXfPfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=Gb9kOtTV
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump version to 1.49.2
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

Changelog: https://github.com/libuv/libuv/blob/v1.49.2/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 2ca8f64a80..a2bb65b9ae 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c593139feb9061699fdd2f7fde47bb6c1ca77761ae9ec04f052083f1ef46c13b  libuv-v1.48.0-dist.tar.gz
+sha256  2e910e668e5daf1be6a5195a696985d7200adfa5c4d3400ee7b3355affdcf52c  libuv-v1.49.2-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 5f96e98a98..36a5b89fa7 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.48.0
+LIBUV_VERSION = 1.49.2
 LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
 LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
