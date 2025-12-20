Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A813BE668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B2BD819B8;
	Sat, 20 Dec 2025 21:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qAd13w3r1OM; Sat, 20 Dec 2025 21:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9649281DBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266964;
	bh=DTKI63x/TB5YEryscRxascPrH7oYm0aERuAHxMQMkDs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ISa6eeXAGetR+Yme1LA/0SLJzEjibRCdITbk3uJLCs7BvPFYWofDWxTER9bQCMCQ9
	 2mtjtUnjG1fQMthGd5s1as+9r7Fk1CcuCsPJVFt87bilGobYzIoB55HjnDgYZAVTQH
	 2XxqthJQVqfWfG38o7yNDKH9S/7yqIrxUZxh7YreemdwxFWfWWEgXsJqqffLfUdnir
	 mhoH62upxq+/faK422oAxqO0r0q9stF0Kzsb17b8QvaVUyYXL3VsVDhEULaXYgshsx
	 plTzgMeeQROI6ZsqTkHFaTMjc0/PaXQ8qW2/QXhHGVTNVrKtHxQ6Q/48zHl6iGQTV6
	 nrDjINbk8MYqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9649281DBF;
	Sat, 20 Dec 2025 21:42:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18E8C119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3927406E5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0ciRgBnNljn for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:42:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9E29406DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9E29406DD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9E29406DD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80C1CA4C4DDF;
 Sat, 20 Dec 2025 22:39:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fz-000000001mj-2q3s;
 Sat, 20 Dec 2025 21:39:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:46 +0100
Message-ID: <20251220213946.1088820-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266797;
 bh=BO4J07iCA/F28FrC8BZiOYhUWChZAHoqGiZ6mm2pTNI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=a2Q2eclgp1fTLBPBBM067r92Ya9OoWRlLmIsddQ2ZQdVabcgsp1XiaKQ0Ni5w3cU2
 qAge+bKffQyNF9BbqoPTOCkv0wJifjSSvRfcmTph3fG/uTRhkMXBpOQK3ZBJxJgVgd
 jkzcFEEi5BSBwJeq7At6vdpftvyb/mfkchqp6vQxUwlD38gjNOZlfjzjsHBB8e5OFs
 0BkxraCl7DgJ1ZlUet8EL9DV3O44dhfCnJDj3FY0WKzl/gSdNSjc7PSx+2brlnc0pa
 //fqtKz1igi7mZGkaiX+V9jdtWXch4MBOPsa9RdG01DFfbwQ1eyR8EOgqZYRpSlOgv
 AfefD92opUtSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=a2Q2eclg
Subject: [Buildroot] [PATCH 15/15] package/python-mpmath: update tarball URL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-mpmath/python-mpmath.hash | 4 +++-
 package/python-mpmath/python-mpmath.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-mpmath/python-mpmath.hash b/package/python-mpmath/python-mpmath.hash
index 1b263c925f..e402647a59 100644
--- a/package/python-mpmath/python-mpmath.hash
+++ b/package/python-mpmath/python-mpmath.hash
@@ -1,3 +1,5 @@
-# Locally computed sha256 checksums
+# md5, sha256 from https://pypi.org/pypi/mpmath/json
+md5  d5d17bbefea73eeb959967351d905306  mpmath-1.3.0.tar.gz
 sha256  7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f  mpmath-1.3.0.tar.gz
+# Locally computed sha256 checksums
 sha256  c26cae81da4508e5e249985777a33821f183223ebb74d7f8cfbf90fe7eef2fb7  LICENSE
diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
index cd19dd52be..86a3562d04 100644
--- a/package/python-mpmath/python-mpmath.mk
+++ b/package/python-mpmath/python-mpmath.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MPMATH_VERSION = 1.3.0
 PYTHON_MPMATH_SOURCE = mpmath-$(PYTHON_MPMATH_VERSION).tar.gz
-PYTHON_MPMATH_SITE = https://mpmath.org/files
+PYTHON_MPMATH_SITE = https://files.pythonhosted.org/packages/e0/47/dd32fa426cc72114383ac549964eecb20ecfd886d1e5ccf5340b55b02f57
 PYTHON_MPMATH_SETUP_TYPE = setuptools
 PYTHON_MPMATH_LICENSE = BSD-3-Clause
 PYTHON_MPMATH_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
