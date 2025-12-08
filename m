Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5C0D3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 17:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59AB560DBD;
	Mon,  8 Dec 2025 17:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EX6D3TI4Donc; Mon,  8 Dec 2025 17:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B012860B8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765215877;
	bh=2QA5W5XPv72mwPx3jXTDPPvCPjqK0mk/ZtXIJI7/UMY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HLcvCuJusQ6BYXcAMPuzbypKQrtUbw6BHhULjvVA9JhTSeRUq8AJ5zscrVvTS1jNe
	 qP+yMfoEPs5vB5uoN+n2OfqF/nczXooaaHEGPfqtuUNHD9t4mgVbDvS8TzKMgzOA2K
	 WDWn/uUapXk3sG2BmBu+9p6ltMC9Tj1NglwU11dmivr5NbtKof6DBI0UdOVOGnkT3o
	 JJqUIxXf1tjM3AqP2bZDfkqThDMYhLjNL/W0aPWJKnhQJPVFmHVLfgCejBcccSgmLK
	 JJbmyoomk5oLLdoG1WHu/nk24OCHhqEp4BQcn3zdwPjpa/+ZHJNR3G0654n7GgYwJw
	 qAJQRk5lOIqow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B012860B8E;
	Mon,  8 Dec 2025 17:44:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4466E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 17:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8AB84088A
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 17:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IzTg59SDzao for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 17:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC07740759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC07740759
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC07740759
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 17:44:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 749F3A4C0375;
 Mon,  8 Dec 2025 18:44:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33264)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSfHe-000000004UU-3L7p;
 Mon, 08 Dec 2025 17:44:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Date: Mon,  8 Dec 2025 18:44:27 +0100
Message-ID: <20251208174427.3459324-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765215867;
 bh=mmY/Mk5pBC5dHHG1D4eWT8OflobD5alZ7aVNWBn47tI=;
 h=From:To:Cc:Subject:Date:From;
 b=maPUIcuaPlWZOmBALWm3lI5Idmle6SQjkdLMLAJ5ccVyMEGW3J6HSu1svy3kmgROg
 0dxBkrle3P7sihzDdIKGfZLYICwWegDvEyurmbUpMGzw4W3aIwUX00jRUzq9ga0P6N
 EuC1jCEImSEb1HS0g3sdRSBBWFcqH9MWSz/cIfI1T+PAk0Fk6CHyUlw/pNzIpamxyA
 HrVsjsg1AH5jlOXITPtRskoN8bcxf9zreSpSR0B/+yH9c4hN9iq4GC+RJ8v1CXdMil
 Um7dzOliaTfdeVeT4W5R4ImuACL1heal3IDUKhaMvIb3Iu0t6hJciuOhrl6nutkmGi
 hBKelyriaRkiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=maPUIcua
Subject: [Buildroot] [PATCH 1/1] package/swtpm: needs gmp
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

Buildroot commit 2b449935c2e8e19a03a8962f49493a76ccca11f9 bumped swtpm
from version 0.8.2 to 0.10.1.

Upstream added gmp as dependency in version 0.9.0:
https://github.com/stefanberger/swtpm/commit/605e0ce8800201fca2a9a37dea5e99be7bdb2233

This causes build errors which are fixed by adding host-gmp as
dependency.

Fixes:
https://autobuild.buildroot.net/results/d14/d14b2953e04b488b2f357386870d557d50190d34/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/swtpm/swtpm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index 25377f5771..de7f2fa05e 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -10,6 +10,7 @@ SWTPM_LICENSE = BSD-4-Clause
 SWTPM_LICENSE_FILES = LICENSE
 
 HOST_SWTPM_DEPENDENCIES = \
+	host-gmp \
 	host-json-glib \
 	host-libopenssl \
 	host-libtasn1 \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
