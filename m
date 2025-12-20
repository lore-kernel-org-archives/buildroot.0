Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C302E668B7
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2343360E1A;
	Sat, 20 Dec 2025 21:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwCXOJX-mq4t; Sat, 20 Dec 2025 21:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1700F606A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267169;
	bh=TIewohsvl0W6x0xlVpo5VZCvcMW9bXOPYrTWTttNHDA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=l3ZAdXNn5Yxc+SuSDctfLqzoJlZ5mhtY6dGd+SsCEZ7A7uwPGeyRDIQ+prbnQMBNT
	 A7Pn2/MbaxZtjlHtYlyvM3qQP1rAsdWO7/86JUbbVCajYqhNaFqhX45GboicQq720J
	 ZiltkE1BlPn334tY3ypisIdm3KCuMXdB0Y9q15O4tVMwSDx+M9wbAUWkU2DBhQxf0y
	 yO6DkOSjaGTzNEWziXES46XBLWuYwPaYC7osaj3gMSARjJlsbBrhKtoQTCZO8H9mv2
	 EW6AC7HPgOt/7NIJufN0zoPh+aFS0x+MCYNrghyZlowtBHTT6Jp9OZRgKzMhkJFGHs
	 H44pp4crc7mwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1700F606A6;
	Sat, 20 Dec 2025 21:46:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EB32119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3D6140496
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ik6N4IkL8rvn for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:46:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CEB6C40471
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEB6C40471
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEB6C40471
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F1F4A4C5021;
 Sat, 20 Dec 2025 22:42:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-3za1;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:42:05 +0100
Message-ID: <20251220214206.1089100-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266932;
 bh=PY0YKsazwcV/UB0j2IxsdgcAFDRfXKIc4e8mnt11EZU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BsETXE8flotfqbVJNuPhH8uGihUxLayidewEPNk7wu0x5TdFepy/MflWHtXBykFbS
 6v6IwpZJ/pYAKvtMpjgnmHumOmvfCRadI+8wwmBOxNs9uyZJ4/LDLzEtyZlDac1sMj
 oU5JxgxQLRkHQtA04W65Qkp+JE4DDzfJv5V5JW8yuhpCzWTSW35Xt+gmLpgu7rY7DW
 Npx5mj5UYVr5zHchbUT3DYuiNp3nLg+Krs0sfqBKNUvlX4GlLJqRsQbj0nhuLsUDMF
 /787Fzz8N2xghH366KJaoPKaSXc05T2DZ+Pex+Gwn+I5q3+XulQ5YJgA+rqhkkNTFU
 4TAWHYpCKSLAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BsETXE8f
Subject: [Buildroot] [PATCH 17/18] package/python-multipart: bump version to
 0.0.21
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Kludex/python-multipart/blob/0.0.21/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-multipart/python-multipart.hash | 6 +++---
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index 594c7cd497..ed01763cd7 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/python-multipart/json
-md5  fa3ee0a8ee83e24b66ab40a841922244  python_multipart-0.0.20.tar.gz
-sha256  8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13  python_multipart-0.0.20.tar.gz
+# md5, sha256 from https://pypi.org/pypi/python_multipart/json
+md5  fd24645f1b328d5d328e8b10bc2c596c  python_multipart-0.0.21.tar.gz
+sha256  7137ebd4d3bbf70ea1622998f902b97a29434a9e8dc40eb203bbcf7c2a2cba92  python_multipart-0.0.21.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 8e11f5f6cd..6921d935eb 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.20
+PYTHON_MULTIPART_VERSION = 0.0.21
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f3/87/f44d7c9f274c7ee665a29b885ec97089ec5dc034c7f3fafa03da9e39a09e
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/78/96/804520d0850c7db98e5ccb70282e29208723f0964e88ffd9d0da2f52ea09
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
