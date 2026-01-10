Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9896D277C1
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 18:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A32640748;
	Sat, 10 Jan 2026 18:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxjlLAPfTSsZ; Sat, 10 Jan 2026 18:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 314B64073A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768068492;
	bh=SfMKmrn7YcZXd2wJqDnmKVGjnfyd42EineP6SrhuuTo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OVSphMxZyKq3msup+bVWkDzwjOLTkOq7HcYJzeX7GnEynGxbanZ3P7Tx7tk2vcU8p
	 wK3hJukSauATh/sO5SocmxuFKhvIGky5WkX7wzVsuVHVd7pRKzYCOmZBVObX42XeSk
	 9YoJBuyvb91Rdaj0d3mnkaNnYWr/lNi3eAu7uRLe6FS0kssBKbnJit1OewPKwDpEs7
	 V8DFC9sIMNL/ePayZl5Q+9Be6ZEfgCJDuGUFS8D3bYITXROo/gvn8Zsf1u9eWiAhfv
	 /W/Obk3SK7k/uYBSuZLNDDomW/A1JVRAaIrT6vNXulij+otjpC0B7grYEBeDIZz3PJ
	 /lWWVSeu9Gv5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314B64073A;
	Sat, 10 Jan 2026 18:08:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE91B131
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94C2060820
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6daa3QfKi9au for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 18:08:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E63760793
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E63760793
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E63760793
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:08:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0320A4C362F
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 19:08:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38428)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vedNf-000000008EE-1cBs
 for buildroot@buildroot.org; Sat, 10 Jan 2026 18:08:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Jan 2026 19:08:07 +0100
Message-ID: <20260110180807.2254994-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768068487;
 bh=Og/w55ntPepNuaadChOzKP4IUvpFGHX4aAMirf9xlXQ=;
 h=From:To:Subject:Date:From;
 b=P/bZnbFFG+MgdtBnPYpf01nNa7p4Mafz1RHyomyw6sBQGDzodYvLkWhqI3p7bIZGt
 NaUTIAniUnxprtO+7Pa4oMZSKz81xBwi/lHhF475LCuE9O40QRdA+HpTmhrYjjhpfM
 idwA+qzeSZX4xQA3zvNxkYS70SSKQNcqq8mqWmYicOh9xlgTNhd8u5boaCtnJQjy+8
 j6tYP1BiHQ7XZhUK5XruSP3ZROJ7r81jizFXxXfeE9GWNEwmOCdvMPuxEUgDt6u+w0
 Fws2DR02pdWqkiWtK4CUd/yP1jAJCQGfFvbfeXxwYizNg+ZUILveWNRoVtTErwleNV
 MFnTzl8bqPXFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=P/bZnbFF
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.403
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

https://github.com/vcrhonek/hwdata/releases/tag/v0.403

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 6a0b931aea..eee3eaa555 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  e390fe2f5f5ef7ed9ccbe62eb7cd40d4ee2b57389e7869c0dc96433c81812e7a  hwdata-0.402.tar.gz
+sha256  77d0a69e5558d16d33bbb510a09093deaf11c882baf9ef6ec5f18a8ef96e2c13  hwdata-0.403.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 8a8e399c21..c185358bf6 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.402
+HWDATA_VERSION = 0.403
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
