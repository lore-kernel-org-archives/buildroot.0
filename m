Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE06CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5A118133E;
	Sun, 12 Oct 2025 18:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvxUc0pFK_60; Sun, 12 Oct 2025 18:24:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D581381353
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D581381353;
	Sun, 12 Oct 2025 18:24:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9010B12B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 752998133E
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IB_4dyH6mYoP for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BA9281339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BA9281339
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BA9281339
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:24:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B64A1A4C6716;
 Sun, 12 Oct 2025 20:20:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g6-000000000yp-3ei1;
 Sun, 12 Oct 2025 18:20:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:14 +0200
Message-ID: <20251012182016.2711834-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293219;
 bh=4gm7c+X0CjNT9ZSTyWH23taOKPN+VV3xAhWF5okrrjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IleuIzLN63d+FGgOLC/20Igr4t9iiItM8a1RHzD/9ILOWR8qQokmyY8cY7jYoULyr
 Fnq6fzbPy0+Q+ivD4k6t6Wt3w4lJMelTRh3udHdOS3ruyFMC121uUYdiLoLZbwiqyA
 m5YaoU1UaJJ4FCBx3BUBGcbfd8T9s0H1GxSM/ithjOOscoaIndlH4CSqk+y59GZBlP
 Z0YGEOeuv0CowIqofr39q4+pQ9NqbvlHWHztP43PT+iFY6yBkzKnD0Ez4dzKR14WGE
 bj6JByeK/SG/SqKtJuW27TsSdHuclgO11NMx2y+dyzCSh0lrMnj4+Kf3OGGdvzfVNV
 GoCxmiRs/JDRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=IleuIzLN
Subject: [Buildroot] [PATCH 19/21] package/python-dtschema: bump version to
 2025.8
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index b53830f4cb..29463ff5da 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  e4ecd1925af81376865ce0169dc1146a  dtschema-2024.11.tar.gz
-sha256  bb7dd36ff9406ec89607b893cfc5e1ffa7ead76fd5c48df77eafc9b4d4196047  dtschema-2024.11.tar.gz
+md5  7d568f4e631d1f2f5ec32aea7851859c  dtschema-2025.8.tar.gz
+sha256  3c63b643fa76215b32cc6cbea9fd0dc7627dc71c67f3dca14fc04d70a7e1235e  dtschema-2025.8.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index 13ccc16e95..28b7ac3cdf 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2024.11
+PYTHON_DTSCHEMA_VERSION = 2025.8
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/b7/e2/260c0429118b1555ddc2d0d465b7ab36e76ab2454a3d1a916ef06dffccca
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/96/0d/ae12436b8de0d06cf5aa07787679bcefd24ba0c7a556edd5cdaef4a38022
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
