Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E224AD2F7EB
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 12:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A579784A0F;
	Fri,  5 Dec 2025 12:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlihRfg_i9z2; Fri,  5 Dec 2025 12:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDFA184A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764937637;
	bh=D3Nm0M3Gx3ojOHxnnnpk8C084FR+Ah2DGk5h7zPb54I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=EZkNT6/LEQPGrP8d2EZRytnlLp6KlzTceidMS8b8jwJ1/Z82HnxZayPddy9bc3KJV
	 /kOQMTqV7dn27iMQDO/gj4OSe8UkagMAFmWePeQHDaoy5tOqlOap9HYXImJGKgIXI4
	 eN65qoHgefo4StRs+yxvSFCPY/nxZvzWSipXBu52beQYMWW2vuBpZMHbeHfZm0ZcoE
	 OitCLYjYrMRf6LwiL6rj7ZOOhdmrsY2ShMXOcp2s7bO44tSpLU1rzZ0o/ghjUPSSnD
	 FoOrU37Slcw5l9iBZXc2QbLOCA42J23xsJ+34qy7I0WOZyQS9wv7ovB2KPEnhQ9e/n
	 B9qGjTQQXtihQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDFA184A06;
	Fri,  5 Dec 2025 12:27:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D96231A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C390284948
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhKy-1BO_uzb for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 12:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCD8384940
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCD8384940
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCD8384940
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:27:14 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 39CF72C89475;
 Fri, 05 Dec 2025 13:27:12 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 13:27:12 +0100
Message-ID: <20251205122713.600576-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764937632; bh=BtXXpq4TngaSZJQluw0p8qcZkDdSlfB7EZhIwVDhpcE=;
 h=From:To:Cc:Subject:Date;
 b=TKahxanelfVrHTAcayCp4Go8I3NqhlNES+P9RZmQrtQyW6U5mUWNt5Ib7o14DYg6z
 1/UOcRanvvUluYnS6wCSANHXEWZrxyb9Xd7IIZPGNSWv5WJNDvJ2FrF2IS14Y4ykvi
 Zld015tpyUEJAkqLjVwqtpEFcUISBQuD6Cpjaw5er2MMRhve3lJ7WA1lB5rsOjqxOs
 D56hnwgLylpKrLUpDC0fyZi/siGiYaJ+9mxMrAT0RXg7ecdyh/mGpsVfmIJ6H1nAE9
 6B7HG2zkPfynbV151lhB27yW8lQodT9R+SvFQB1WAYn5OCkhQsWBv9QRt9h4K0aSgE
 1FO9dQYgfyIyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=TKahxane
Subject: [Buildroot] [PATCH] package/python-anyio: bump to 4.12.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop dependency on python-sniffio, that's no longer required.

Release Notes https://github.com/agronholm/anyio/releases/tag/4.12.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-anyio/Config.in         | 1 -
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
index d843f37af0..e06dc8fc4f 100644
--- a/package/python-anyio/Config.in
+++ b/package/python-anyio/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_ANYIO
 	bool "python-anyio"
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
-	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
 	help
 	  High level compatibility layer for multiple asynchronous
 	  event loop implementations.
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index f93986fb9d..2a02bc9d37 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  9bbd9262979f576a9023389e48204037  anyio-4.11.0.tar.gz
-sha256  82a8d0b81e318cc5ce71a5f1f8b5c4e63619620b63141ef8c995fa0db95a57c4  anyio-4.11.0.tar.gz
+md5  a026af4a3b485699718761b1b44ad1df  anyio-4.12.0.tar.gz
+sha256  73c693b567b0c55130c104d0b43a9baf3aa6a31fc6110116509f27bf75e21ec0  anyio-4.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 431eb5f286..035e2298e8 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.11.0
+PYTHON_ANYIO_VERSION = 4.12.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/c6/78/7d432127c41b50bccba979505f272c16cbcadcc33645d5fa3a738110ae75
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/16/ce/8a777047513153587e5434fd752e89334ac33e379aa3497db860eeb60377
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
