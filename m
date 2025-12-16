Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577B2D637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B17B405E0;
	Tue, 16 Dec 2025 19:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dY50X4aXER3h; Tue, 16 Dec 2025 19:46:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429E8405E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914386;
	bh=ylIwkk/var3RkEAnDCrffEf6pFoWf8UL8Brd1UFCiFs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QnruCkn53tZEoS/IwaTrDNcHdDg+dAeyldAadbI1TINEf4xZTKfanP/QKgTQmjQja
	 ZHaUUTLz2bqMXlos+eCNY9vKTbdtbG++z0f+4MUCYafMmUNf4fwKJEqIiPf5Z1AaW2
	 r0jHFAp6vBhIfj3h8gBqALO5u3R9ebN5py8X0CP0D807RTw/ZkY9iKhNGHQdQzgcQ/
	 z8o/eRKHQbfTsA07IDYBsCSTxkK6V7ih5rFiSL8B6YcuN677/S5Z2cZzmEzkn/UPXs
	 +jIQxjMHGlS2B3rj/vRJ4WJ8BsciR1yROLKODLR2seGlh1omLQf+BkAROuW/ERedWJ
	 0AFDEPZbOP2kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 429E8405E6;
	Tue, 16 Dec 2025 19:46:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E9F2364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 862AE405E6
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHYWGmtkIZMz for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:46:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AA7B405E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AA7B405E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AA7B405E0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:46:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A7927A4C460F;
 Tue, 16 Dec 2025 20:41:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVavA-000000000Bj-3RfV;
 Tue, 16 Dec 2025 19:41:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:19 +0100
Message-ID: <20251216194119.3020421-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914092;
 bh=J5MLjK2SIuIzVMg7tiBlmjNAQufnTwbW0cnRXXjiDBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rlad2twrPQ8YcccVM8+DIv0Aud9rJow0a1hw4TMg65ZUzjDR1w/LFwoUhn3TLn+uq
 9kZbVteENwDXKyigLcaKHFQNqV5mDGGS3jpA2ghrAhRUXMs3nWyj8uJb8wNUEEu/Sg
 vbWm08YKfhnwIStltdDEyERjlCfVIBWS+Ihwh3h5Du24uc+1MURDdK5ahk7PK64UAA
 EO8LvVlC7ROvaUKoI+2dqG9Qupc+vFSph8/gubMxneqA68aPUWJGPCPRPle37013Ll
 ximcsE53DmrGGr7UFZO5tlywxcfq0ViVreY0aswVLQ+niKaLvlk6tDJi+I/AlNxx3c
 dj42ldSmxxM5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rlad2twr
Subject: [Buildroot] [PATCH 26/26] package/python-zopfli: bump version to
 0.4.0
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

https://github.com/fonttools/py-zopfli/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-zopfli/python-zopfli.hash | 4 ++--
 package/python-zopfli/python-zopfli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index 0fd009879c..f452e2bdfe 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  2c42e8d5918059b84a42c0d53c5a6852  zopfli-0.2.3.post1.tar.gz
-sha256  96484dc0f48be1c5d7ae9f38ed1ce41e3675fd506b27c11a6607f14b49101e99  zopfli-0.2.3.post1.tar.gz
+md5  c744c18043764ab6aa82443cee243038  zopfli-0.4.0.tar.gz
+sha256  a8ee992b2549e090cd3f0178bf606dd41a29e0613a04cdf5054224662c72dce6  zopfli-0.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index 47a27b1084..d2816364a2 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.2.3.post1
+PYTHON_ZOPFLI_VERSION = 0.4.0
 PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).tar.gz
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/5e/7c/a8f6696e694709e2abcbccd27d05ef761e9b6efae217e11d977471555b62
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/be/4c/efa0760686d4cc69e68a8f284d3c6c5884722c50f810af0e277fb7d61621
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
