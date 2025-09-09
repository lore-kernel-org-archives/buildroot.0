Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50053CA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 16:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04871413F5;
	Tue,  9 Sep 2025 16:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aw1DtSx9Dj9E; Tue,  9 Sep 2025 16:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 099AD41401
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 099AD41401;
	Tue,  9 Sep 2025 16:10:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B552DCA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2ED040079
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3JLDFwC71N4 for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 16:10:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DD9440022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DD9440022
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DD9440022
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:10:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0bb.dip0.t-ipconnect.de [84.161.176.187])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8FE7EA4C0ED2
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 18:09:57 +0200 (CEST)
Received: from [192.168.1.144] (port=52362 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uw0uq-000000008OY-2vHc
 for buildroot@buildroot.org; Tue, 09 Sep 2025 16:09:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Sep 2025 18:09:56 +0200
Message-ID: <20250909160956.59310-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757434197;
 bh=Fd0XmkxDNFNfHex7kjpcqHPAdDEfFMrOM9r7mwY7d7c=;
 h=From:To:Subject:Date:From;
 b=TGvcUZ7yxzMmJJcIpKCsTGncTNBSTP8tViVZpAwF7zl5rPYCzXLfqb3ocowGeEyvI
 mmUPK7H5YgVX1ePeNghrwXqLvhB6YT5jjFev0IPYWvb47Rc8zFsdSJyysfbgwxWZMN
 j6SmHmS88L5WWFadAAHY6rShA7+WLU6fWHFIz8EcWipTCYJCzyDA4XBId1V5DYt+eB
 ducqUg1yIrlTYd06ZaAq5D4Y2AE/BOPlwZxsDAv45fLplJ8IvnyjYp54mfnPntlhPo
 KWBDoaLyEAxCDoIwKK6W26jDBgH8Ho9clb+tb3cHfzWESX99U0gdNjw0gdHgSc3nq7
 gcpD8e0V5Atjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=TGvcUZ7y
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.399
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

Release notes: https://github.com/vcrhonek/hwdata/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 5507a6b0df..db9a789dec 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  cd52f7eb5c0f438a3605d1799d9f345a2894ad0f269ab6e8441f55e27e80dd78  hwdata-0.398.tar.gz
+sha256  74872355e14d5ddc48a0f63036227ffb5f7796a3012c6377ac1fc7432ffe2b41  hwdata-0.399.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index fd914c238d..ace30889f0 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.398
+HWDATA_VERSION = 0.399
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
