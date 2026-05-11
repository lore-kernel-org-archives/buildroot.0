Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3B8CD37B2
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 16:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08E4C40153;
	Mon, 11 May 2026 16:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfGsQutVVhKu; Mon, 11 May 2026 16:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17F95400B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778515221;
	bh=s/wqPerRlwgg08sqJxOSDy/2m7PYxvTh1rSc8FVmX6Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VdOwkVkwsoIW1wA1jWP7Ob4Cfi1xw4pDZZCycKGqk8SRnE243X38NaZmLRRPaOH9o
	 rpXP1G/q6eD+QkJSwPO/bVJWMGWrvYRbZuqj5Imo1IoJt8UipAUWsMRUoBntDcDfy1
	 yfGyJrsCAopgmXfphDP5OkwCDg1DXAWZsUQYnrCxW55wqSgA00TuPNsFgGm59QO06O
	 KoaRiqOznoio7FV8GuVeCB3/lVSXrqTbBEJMgQy9MU3J8ioli/MK089pFOqxbznqNY
	 Q0ajgMElu//7U7JfoT5EQAaWGNhzWY35qgppa5YxCELCE7ebasVoP597StJv39axkl
	 uXCDlQI+3Ee7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F95400B8;
	Mon, 11 May 2026 16:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC4F1173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 16:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEA4860035
 for <buildroot@buildroot.org>; Mon, 11 May 2026 16:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0ZEEmnZbv5h for <buildroot@buildroot.org>;
 Mon, 11 May 2026 16:00:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB32C60034
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB32C60034
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB32C60034
 for <buildroot@buildroot.org>; Mon, 11 May 2026 16:00:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CD76CA4C3595
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:00:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50952)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMT3I-000000007h7-0PHV
 for buildroot@buildroot.org; Mon, 11 May 2026 16:00:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 18:00:16 +0200
Message-ID: <20260511160016.1225647-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778515216;
 bh=Ae/lI+ET1lYqvCqN72NnCrKajxl7j1ZvtMddRjsGiZk=;
 h=From:To:Subject:Date:From;
 b=evlVdR8t2o3TNxdwSYgZwIjNANZw72dAeGaa++Yjnfq2InvdHzZg4ODdSUX+L0IcG
 +hxwovG/wfLndBZwRKQlW/SaX2ik9eX8OGpJvaBdSeOSKrXmvS16m2nr7kHD3hwGoe
 gaA+5+SAlhPZIToUzYVQdFBwSgoPYGTpDjHjGtfF8Kw9CkLZZIujAxMNShVMtvmJ6n
 T4htDI1F0ZaKD/lXdlQtQfmC5zzlvKJ8f/aKRig1ttUTMSiKO6EWovaV/VAgtw8TtR
 go3/3NgN5cFSuYbCQezDI/5FxehLh3vD9ipb2Z3C3CyXINofesT/djZCB1dNDF0HVM
 JSgjVreBE/m9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=evlVdR8t
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: security bump version
 to 1.61
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

https://github.com/gpg/libgpg-error/blob/libgpg-error-1.61/NEWS
https://dev.gnupg.org/T8239
https://lwn.net/Articles/1071807/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 1e52e78d22..cddf2c7828 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  851a1619aee8f7723ed50f09cb6a186c483c280c  libgpg-error-1.60.tar.bz2
-sha256  11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09  libgpg-error-1.60.tar.bz2
+sha1  ec35eea78798a0321986168ea28d55baccd5934b  libgpg-error-1.61.tar.bz2
+sha256  7a85413f2bc354f4f8aa832b718af122e48965e9e0eb9012ee659c13c6385c93  libgpg-error-1.61.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 808339b935..df95e5fe0c 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.60
+LIBGPG_ERROR_VERSION = 1.61
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
