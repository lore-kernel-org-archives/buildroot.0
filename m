Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85328CAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 12:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3510C60AB9;
	Sat,  4 Oct 2025 12:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kh1fOeAdFowy; Sat,  4 Oct 2025 12:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBC9560AA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBC9560AA5;
	Sat,  4 Oct 2025 12:21:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4AA7909
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B04E7813F3
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUsiniarnaPY for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 12:21:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9950F813D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9950F813D7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9950F813D7
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:21:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 56C1CA4C5D65;
 Sat,  4 Oct 2025 14:21:14 +0200 (CEST)
Received: from [192.168.1.144] (port=43328 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v51GE-000000002yn-00lx;
 Sat, 04 Oct 2025 12:21:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat,  4 Oct 2025 14:21:11 +0200
Message-ID: <20251004122113.2161276-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759580474;
 bh=vZczyGmtszGPIiKnTXZzz/Za2/APzheY8bgm/Oj03d0=;
 h=From:To:Cc:Subject:Date:From;
 b=AmSxx7QAbqehzktgNZfuly7sKNFYDquO6lbSddxM3DVRZ21g7A1G+WGwKTdWeLT22
 zrsfJaLsU06t0w8zSYClXEMk0Tz1KRK8/AUp9VqbP1Q6l+CkKbeVGw4MAKoZjzjgRX
 KV7fNCGD0+fOgdaUFqhQgK5tef2M86hlqkWOz0lRjLX9ua4h5NaeyFT9elssKlo79y
 jVHGzw8sYaZTf4xvrft1saahAjOpCvha7slPtNty3oUwNTOrivYQij1MSnAwcmQgca
 KA2saw8Q/sH4oHrMjMMl+YY8nxRxiuozXigK9rKZufTiP7aCJNxmLRwWQ1bh4TdO1v
 oEzLnLPJYgT4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=AmSxx7QA
Subject: [Buildroot] [PATCH 1/3] package/libassuan: bump to version 3.0.2
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
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libassuan.git;a=blob;f=NEWS;h=c659638adcfee1874e678c48571556e662b9140a;hb=0f84595a4bc706d3afb969d59618244c7db3b59f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libassuan/libassuan.hash | 4 ++--
 package/libassuan/libassuan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 6bb5022d13..f41115cf3a 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  b6ccd955085dac902a09871f94a3d41a7667d0c8  libassuan-2.5.7.tar.bz2
-sha256  0103081ffc27838a2e50479153ca105e873d3d65d8a9593282e9c94c7e6afb76  libassuan-2.5.7.tar.bz2
+sha1  57fb6f59b1a07e5125115454f5ad4cb0665e0eef  libassuan-3.0.2.tar.bz2
+sha256  d2931cdad266e633510f9970e1a2f346055e351bb19f9b78912475b8074c36f6  libassuan-3.0.2.tar.bz2
 # Locally calculated
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 9cdc34bda2..f08c74ee4c 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.5.7
+LIBASSUAN_VERSION = 3.0.2
 LIBASSUAN_SITE = https://gnupg.org/ftp/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
