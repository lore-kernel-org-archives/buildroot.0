Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E01FCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D93E460E10;
	Sat,  3 Oct 2026 15:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBW_Iy-8dWke; Sat,  3 Oct 2026 15:55:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 90BCD60E3B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042911;
	b=Px3bW11hewm+k2GMfWHq6HxoSZl/D9G5M9VJzaU0ICv0b+5aMI2dW+0dcm1WmigQ0QwJ
	 8iGJF/qURBf77NagLg8VUgOGJnyQp1QC7idTC6TmSoN+Z1L07ndpwsVgFm8SM3A1O1bCq
	 KZIVGok2uByUArdKADOyrhq32iRFkH3RCbDhNlcaD3Hli01ICTm840CTxDWx1rk3OPkdO
	 GxWRAZf9zegdOy1HOHlfUVwUOgcORo/iH2JropXlGQ+62o2hJbFWbgUYZf/dSHc3PVzwE
	 ZcdERhf7wmnnZuaQzgAAkM3CvBXL0KueIvufM3DE+dSqiA95/8eMYpScMxf4qrFV1wA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042911;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uXN7pa0NZoQtCUgjOxZneDo1+RoeC9WNA9wuyI5ucp4=;
	b=M3h2uwDvL6l2RCe4GWLoECWvd1xDLkvPBUzCVmlurYzblwfPIW/czt0ENq2YJojve2Yw
	 wG60cLKGEpUN0WzLeySEH326hzr7MEVg7PUcJETFVr8dNvcKrNTfaK76CuxIu4MIOSHhO
	 6+5rVD4P+tHSwPNOur4raZ03+efclmjk4wPywcT1uaT+D48T4s714erQjC3n5Qae2P7tB
	 yYcPL39dj2yT1l1qqa1wOIrUXxnOwx5lzPnfMQTTiW2piQXIzs7Gzn9VrhJox3mokgfiu
	 iyyLSFomHTUI0SliWz5FVaZl2RmwZZoFS9fb9I2i/kigOhSucWIHXYpEWtM0wAhYPSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042911;
	bh=uXN7pa0NZoQtCUgjOxZneDo1+RoeC9WNA9wuyI5ucp4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qOx2cuaNg2DujnfebZCU+8Dy7pY55CZbAPZ5t6hMltUYXfwQb+/f4kJuLRi6yzt2S
	 WBjvPPHgwHl8thbxyKlWwfKaQc6kNTDgJoQlAfYNRXz3Bo+DI7lQJEtjM38+4d9b9E
	 z+AgLVgV+BCA75H22SD5b09tqMM237fz4elNev32f4qEGIt+THhovpqH+cXXS4758K
	 iXiEyXMrTXNXQLFRu8yEAUSYBGt+sEBfCPZA2zxK9m7Y1fZYlURQKlZ1hSMTGMs2ZG
	 O3vHxPaw0vkYicYOAqM/PHoXXFUmTj5pGt4aNJArbltBGfMFqkCYsLHkXgvkoxEWdS
	 AjmUuevVjTBPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90BCD60E3B;
	Sat,  3 Oct 2026 15:55:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98DA44B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86032606B9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oznXBKKb43fT for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C2AB36068D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=CieGjKdO4tz2ytbvRp34ZEFgPLAbf8WfFpxuvUYMK+os55dGhEIBVR/1tRh3PYHpRHyO
 CAkEKejq9S3MerCTKIvK/HrghQKUriiAjmfJcgDfhxqHAb6KoUuJ9dubNVwQ3iZyvFCGK
 W5F7Wkyr7rmNyeqJDoNTnwj9ZBporQA8K8grNr/PGUrLj7Fkp/YquG5hKfP6zKNZ4IfFh
 9R4nUni0CABRpyrney9EtrLC+A6sQuU4I9NgUF+esnI1uvYX9uPlUNBSlRcb6Vvj7jxpU
 lgz0tdhASylRxMz1jjeEfjPu1M3FtInbZrvpCo6dOhcB39Jjw83LlJGyPmxkDFFeeuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=p+mDLPQ7iPXH5qiE4zSQt2ZE0v/DbPttpaarRQiN0gg=;
 b=XaTRBlcOs4RFAoLk84GkMLaz2XjVWPQfQvi1YCNvpJlNOHlsHVB0lSh4GyuOZKLzNfT+
 w/LsFh9O4n0isCJsDeeUipOMLewM2L3xPcYzlKETx8hnrIIPWHWhi0Bh/aoyG76USZbFL
 O5Tc9B6TkZ/7VyOaD2qhdqozJzjqQf7a5vh5Rfhrkv0kxMKauMTEKWgeYEn+K4iWXpIiZ
 iFLKLKahE1MQDgv0apHxgvlmC6Q4gT2l0ydfhOQwg2alaGw4ggua9ZRZsP1M+4dKn4jxW
 +ChbAFbiR5RrCCKdPl9pz4elCqpOMD/SzWm0DMDptbr9cMIfeOwsZZDUC2QV6AiQcKQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2AB36068D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FCFF8A309; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8f142b2e5d3e7c3f42f6b02dd0005c24de6149f
X-Git-Newrev: b3aa5adf921e22174c0baba94b047c542d7cff6a
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.0FCFF8A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pythran: bump version to
 0.19.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b3aa5adf921e22174c0baba94b047c542d7cff6a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pythran/python-pythran.hash | 4 ++--
 package/python-pythran/python-pythran.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
index 7b428a18f0..783f830755 100644
--- a/package/python-pythran/python-pythran.hash
+++ b/package/python-pythran/python-pythran.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pythran/json
-md5  9b906f8af949adfd1a132ad9e26f49f9  pythran-0.18.1.tar.gz
-sha256  8803ed948bf841a11bbbb10472a8ff6ea24ebd70e67c3f77b77be3db900eccfe  pythran-0.18.1.tar.gz
+md5  1a10301204ffc98e04346b2e8147d955  pythran-0.19.0.tar.gz
+sha256  18a096daa8b4bbe3ace06ce5d7325be5ff57aec4cf67b91834cf1b757b3e5392  pythran-0.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
 sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index 271824585a..58e971f191 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTHRAN_VERSION = 0.18.1
+PYTHON_PYTHRAN_VERSION = 0.19.0
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/d4/84/17c4c44a24f5ec709991e603e601bf316d09c4fe915fbe348c689dede998
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/bb/a3/03098a8a5d2c9f801c227cf941d85976934f5f47307ef3d819734370acdc
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
