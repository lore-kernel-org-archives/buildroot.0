Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208A0E67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE00E80C35;
	Sat, 20 Dec 2025 21:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rh8KIQs_s_aH; Sat, 20 Dec 2025 21:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18E7780C91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267181;
	bh=Ti3nYOL6yocOndqsYNAqJpaaXrQStwi6r0KdUk5bDjw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FayrKVDKUBBYr+17a3yTb9dP86KwYB5sAxOEUSLc/rmoxXAEz00QmqTSYMLb64z3H
	 BUi4EZa3zzZqEKOWP7dgYe6mI0FZFy2LUGQJOKIHfW7GSymXTxKWMBWOB/jt3LUPy9
	 8HT9XcfoLrh0CFT6ia94bkkxcgIUUQQLvRncCGyGPLNxp268zDkAE6nYAtJ3KB1ELv
	 Nru6MgCXalq7nBLq7PjsKG/UYUfFW2cdkbRXqetwSR7BbGlP/eFb7FSlUZCu+RzGyG
	 CnL9/RgdikZb9arbYo9Wa3pbRP1y60ooxWsrv3Bl1Fn8kouWJsnZKTCAu0UkEq9ESa
	 ymxfJ+GL+ueqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E7780C91;
	Sat, 20 Dec 2025 21:46:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DAAC293
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAEA640634
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONekiknyUdKg for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:46:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B80384064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B80384064C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B80384064C
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 37FA3A4C5034;
 Sat, 20 Dec 2025 22:42:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iG-000000002DO-05vY;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:42:06 +0100
Message-ID: <20251220214206.1089100-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266932;
 bh=9PB5cLW0LjanVkVwSbjGuhjTIJGm4+5/cL9ov6gR+7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=B2RkXFe1RF9U7NRCyAxYF+WsMTg1UPKObsHmH6NBJoZfwK29wcWpxekrPK0liuwW5
 q43lal+nuXqNibeN+oVivg5aIM/XEheYNVFDoZ406Jyc60Y2NubOSQ/d4LEyqLqSZQ
 oV3srbwkNVIt9XxdRSCR8coAuzIPioTQ52GfKm6732AwoyNeofS81ZgPP1OkJEnEn6
 Qf2m71MyBLAYL4QG2OPQI/v0c4CTEb5+Scf6F38slybnFHRPig4aafmeC22EOPIlR0
 n4vK6JG97Pw8yLfgHhwP7yOieFTfM7vQjx6tWWI8OPEXMnd3HkSGoZGh7FmVjPQH4u
 jj5RBPqpcuv6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=B2RkXFe1
Subject: [Buildroot] [PATCH 18/18] package/python-paramiko: bump version to
 4.0.0
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

https://github.com/paramiko/paramiko/blob/4.0.0/sites/www/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 918dda17e1..64e49fd90f 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  2ea59e8a3423fe050398071b209b9b69  paramiko-3.5.0.tar.gz
-sha256  ad11e540da4f55cedda52931f1a3f812a8238a7af7f62a60de538cd80bb28124  paramiko-3.5.0.tar.gz
+md5  86c64e731c55db62c0be2ddcb97e6be5  paramiko-4.0.0.tar.gz
+sha256  6a25f07b380cc9c9a88d2b920ad37167ac4667f8d9886ccebd8f90f654b5d69f  paramiko-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index e79860c442..6ad0fa0d1b 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 3.5.0
+PYTHON_PARAMIKO_VERSION = 4.0.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/1b/0f/c00296e36ff7485935b83d466c4f2cf5934b84b0ad14e81796e1d9d3609b
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/1f/e7/81fdcbc7f190cdb058cffc9431587eb289833bdd633e2002455ca9bb13d4
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
