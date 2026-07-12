Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC572C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 11:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E7D40B7C;
	Sun, 12 Jul 2026 11:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1jmCO7jZD0s; Sun, 12 Jul 2026 11:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F8BB40728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783855726;
	bh=9jMsDVSxc9lANmek4oNjjMSES1x41ntOl9UrYCZTlIQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K2gabma26T9Gxh1/FfBP6DcB/kaxFjSdxeKO+Xe1eVYLUWFpGj/A7axRcLu/2Csdh
	 PALw4tyWtLJWLRl5c1uZfpcjDy7iX3QmcNnLtgVhy1UBHt9o2SmYbKPgIMsoTgB5Eu
	 J8PAUPafGbBi7i0jIlvsyODQb1/7AiyPfpGJo8umWXxZJFcE6tR/fApw7bjaaetf17
	 22ZYbAwpetIDrhJ7toPfeqcycCAVrx1NwFarIyKL/KA6LWeh/f3pqWv9mhdfcI5cFE
	 AK3Mp1WIRe6BocGqm+nQqIrQSeMXWA0pzP+vs5OBfMY3pPeGYSFJ9freUFC2qsA5J3
	 ERfrK/fskJ8gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F8BB40728;
	Sun, 12 Jul 2026 11:28:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AC672EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F07F8606BD
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1PN7FUngqpY for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 11:28:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13ECA606BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13ECA606BB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13ECA606BB
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:28:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36313A4C209B;
 Sun, 12 Jul 2026 13:28:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33162)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wisMT-0000000026K-3ZrW;
 Sun, 12 Jul 2026 11:28:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2026 13:28:41 +0200
Message-ID: <20260712112841.1579476-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783855722;
 bh=Na/YsTxHcdinc0aTItYqDEvl1+9n3RrpNQja8B8PXF8=;
 h=From:To:Cc:Subject:Date:From;
 b=lmlTxCAsaCQfK7N3UWd91mWdRj3nFO5py+9M6PK75knIVT4bo9gmkFO1uAYaGHFFj
 GNKDCj8G/wR14Y7Cu/aEIqprPZXxdTZcHt8WNP2izP1lSLKF4LeAwzMp/IuVMB0IYr
 74VBD2TyJsFznrDiGsj5APwfLPVA41HC3DtI+n58rnaffJZumk8RE4aykAcAJYORVg
 dQeohAQIbtcpkHHjU/wzMq37JBQE7mKGVLn3WdZL5aVXhppO1qjlL95TnFK91gbU7A
 B+1QvQYPtAl7oEAXwZfqOPzDEh9kamvtWxI4AdAeQYbo7eGqX7lVU8U5pJXMvlI6W9
 xtu4J2TqljOtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lmlTxCAs
Subject: [Buildroot] [PATCH 1/1] package/libffi: bump version to 3.7.1
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

https://github.com/libffi/libffi/releases/tag/v3.7.1
https://github.com/libffi/libffi/releases/tag/v3.7.0
https://github.com/libffi/libffi/releases/tag/v3.6.0

Updated license hash due to copyright year bump:
https://github.com/libffi/libffi/commit/4f7ef24565eb60e8a093bfeba0bb77d5c576c311

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f00ff35e09c2f57c8a57e86525207e9e1e0e7ee8

https://gitlab.com/bkuhls/buildroot/-/commits/435248f5df767d9b0f10fdc03d64d820d38d3602
with the exception of bootlin-armv7m-uclibc which is broken with 3.5.2
as well:

../src/arm/sysv.S: Assembler messages:
../src/arm/sysv.S:104: Error: selected processor does not support ARM opcodes

This bump does not introduce new build errors.

 package/libffi/libffi.hash | 6 +++---
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 11e30e0e44..5f34afd392 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libffi/libffi/releases/tag/v3.5.2
-sha256  f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc  libffi-3.5.2.tar.gz
+# From https://github.com/libffi/libffi/releases/tag/v3.7.1
+sha256  d5e9a6638ddbd2513ddb54518eb67e4bbe6fa707bcc01c10f6212f0a088d819d  libffi-3.7.1.tar.gz
 # License files, locally calculated
-sha256  d5699fa516968e3a1550e6c902b7441c78856f2603d61bedd0b0662a26655366  LICENSE
+sha256  17b64dc60f3b6897a60f971e288b973f655c2edcdf08b25f3c3dd5549857881c  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 2f3208333c..c24ce22c84 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.5.2
+LIBFFI_VERSION = 3.7.1
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
