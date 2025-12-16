Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8F1D637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26DD40597;
	Tue, 16 Dec 2025 19:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r63TrQa-vQua; Tue, 16 Dec 2025 19:43:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03FC404A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914230;
	bh=sijiNUY6ehP6jmrMYEaj/0o4Q9i92eGgm7PsMywn2Q8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Nny7HRn90CGFJ9xFtYxzrv4HjCOzp5DOwdvn2/7zn6S4NxhHuIvIfXMY+AMpXFUjH
	 ASR4oH9E88Pau+27a7yTAV1BIbxBYPIq6qGrA4KtIHO+iUIOfzaAiPjwwuGZzvWVP6
	 MQ3ZyQe9EJyULrODQ+TekygQwpjn5oAzCQogTEBsZOH7m7XlHcwOne7uEErBSSuRBv
	 U/PRJ63+ThkLuj/H1wQQFC7MXEbhynO06SDrYsptTTgQ2HWpQ6uTJKMQHFsWlPwvbo
	 4a7ICbm9Pxl3p6sM+hxe/TRixLpiPRSw5Fo/3f/2ClacTh5rAYOLY7BuSRQo95G1CW
	 RPY3rWNIGGkFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C03FC404A6;
	Tue, 16 Dec 2025 19:43:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70B99364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5771260F83
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-9wXpTNkJDj for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:43:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A96F61040
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A96F61040
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A96F61040
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76373A4C45B9;
 Tue, 16 Dec 2025 20:41:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-3Y0j;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:06 +0100
Message-ID: <20251216194119.3020421-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914090;
 bh=zwZWBsk0OC3CJ+p6IMjUy8EsTJ0PsfQsDPIRXQ69QWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ULFGyDpWLhn9wXZDY6+nYdTMJAEWOTMRVLIHY8heaHU6kStPx3K1KxxAD7hHeILU4
 LMqK6VAxvfYlJawI66vY/00CZloQfqcWFh1IZzEsY/Ypj5/N+meW/WyzI4yk/1yBRy
 y6hLvoQzSh07xdLnlhU1O4lehUNK2CoZjIgbaa78EK3HiS3L4vZsqfCCffbrePu/3b
 DdvBdQemSNDgaLvzS0ShwUm6/pxlXBsZOVSQJbyIm/5YVUMGwG/D7vACBDnWVd/OwC
 HadY3rWXJOipuGS5aQ92WhGUbltI1zG/6iT33hpqFX0ebVj+BxHYfQ0/pxa2YutN+6
 woQT7X0TGqniA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ULFGyDpW
Subject: [Buildroot] [PATCH 13/26] package/python-typeguard: bump version to
 4.4.4
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/agronholm/typeguard/blob/4.4.4/docs/versionhistory.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-typeguard/python-typeguard.hash | 4 ++--
 package/python-typeguard/python-typeguard.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
index 8cd3dd0dc6..e567715fa9 100644
--- a/package/python-typeguard/python-typeguard.hash
+++ b/package/python-typeguard/python-typeguard.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typeguard/json
-md5  842237266846dbb102b7239fcf4faeb6  typeguard-4.4.1.tar.gz
-sha256  0d22a89d00b453b47c49875f42b6601b961757541a2e1e0ef517b6e24213c21b  typeguard-4.4.1.tar.gz
+md5  4f97177b802372a70bb571b2aff09313  typeguard-4.4.4.tar.gz
+sha256  3a7fd2dffb705d4d0efaed4306a704c89b9dee850b688f060a8b1615a79e5f74  typeguard-4.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
index df5433993d..71d7f11858 100644
--- a/package/python-typeguard/python-typeguard.mk
+++ b/package/python-typeguard/python-typeguard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEGUARD_VERSION = 4.4.1
+PYTHON_TYPEGUARD_VERSION = 4.4.4
 PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
-PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/62/c3/400917dd37d7b8c07e9723f3046818530423e1e759a56a22133362adab00
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/c7/68/71c1a15b5f65f40e91b65da23b8224dad41349894535a97f63a52e462196
 PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
 PYTHON_TYPEGUARD_LICENSE = MIT
 PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
