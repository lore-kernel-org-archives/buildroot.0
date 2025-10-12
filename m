Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB59CCCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A211A8126E;
	Sun, 12 Oct 2025 18:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1o6sifMFhSaN; Sun, 12 Oct 2025 18:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8FEB8131B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8FEB8131B;
	Sun, 12 Oct 2025 18:23:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B47E1BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6A114008C
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syC7AsTmkt44 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A732C4008B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A732C4008B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A732C4008B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:23:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88663A4C6715;
 Sun, 12 Oct 2025 20:20:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g6-000000000yp-38F2;
 Sun, 12 Oct 2025 18:20:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:13 +0200
Message-ID: <20251012182016.2711834-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293219;
 bh=E4CAuk3ompAplhb3q6NUnMxpBuxffnTTZs7k81rqSr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ARADVvztVAhDUPnk8WWyT1ybaxjKXTwP86oJQxpq3tWqcW0fCV3JSMAHmrZ/ff4/2
 1NmlbJFDwPWgYkkTvCfrtO7/fYuJYrusUGBgbKCCyhruAhv8kuTRC/DiAMnPvPjcrY
 vRvyLYPwTOLt+GpGcvcaHGVZyYl4MR1t29FcY8DUx3uU+prbMmLxwpYqIOhFY54Uwj
 6QafgKhKckCflvJwmwkwHPYR00M0kXD2U95bWNYyQSzt5FEgrewx0qFHiFHCVEFDAB
 W8KnwCsmk/f6pJE5nPboGvhw4LmB+Os5Um50T34BH8kEJni4YsIoMgAvlO3UYOoXsZ
 Dlf3DPGkX4/ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=ARADVvzt
Subject: [Buildroot] [PATCH 18/21] package/python-decorator: bump version to
 5.2.1
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

Changelog: https://github.com/micheles/decorator/blob/5.2.1/CHANGES.md

Updated license hash due to copyright year bump:
https://github.com/micheles/decorator/commit/eac33cb79fd1ba2200c4e59408d6a492511feb24

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-decorator/python-decorator.hash | 6 +++---
 package/python-decorator/python-decorator.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
index e12d34e7ed..5980427454 100644
--- a/package/python-decorator/python-decorator.hash
+++ b/package/python-decorator/python-decorator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/decorator/json
-md5  a6b34700dcac8a4bb04efd55e99626c1  decorator-5.1.1.tar.gz
-sha256  637996211036b6385ef91435e4fae22989472f9d571faba8927ba8253acbc330  decorator-5.1.1.tar.gz
+md5  984649ae1fd174f9a82369e7c9cc56e6  decorator-5.2.1.tar.gz
+sha256  65f266143752f734b0a7cc83c46f4618af75b8c5911b00ccb61d0ac9b6da0360  decorator-5.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256  fd11660cabf0532082c45706862fafc294907ec7f8e217818240a4999806782e  LICENSE.txt
+sha256  914ee6ed78a5efc173bda698f2708444ca9d140fcc4080c60d0503d40db39da6  LICENSE.txt
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index 5dba8cc915..d08696e773 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DECORATOR_VERSION = 5.1.1
+PYTHON_DECORATOR_VERSION = 5.2.1
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
-PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/66/0c/8d907af351aa16b42caae42f9d6aa37b900c67308052d10fdce809f8d952
+PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/43/fa/6d96a0978d19e17b68d634497769987b16c8f4cd0a7a05048bec693caa6b
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
