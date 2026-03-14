Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EE010706F2
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 18:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4348F413FE;
	Sat, 14 Mar 2026 18:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZN52l-ADWEz; Sat, 14 Mar 2026 18:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBA43413EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773513549;
	bh=LV7rCzo3Br1YPXIOnzAohDX41JIa8+6FS10LoOkORIo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l0Oy8cK6FV1cPZNNZl+G2DVsIr5/pOB3/W9Fia192M/HxRCdV3jUNsWigBHashIPy
	 u7bmH5/kA2XojWD3ML6eJ3l6OUJTtCEYIEN01soCn5MIJB2RxdpHyAyIFkwzUmbKtE
	 59ooaug6xiFiWjxorrFXMgOXGh9x43Q/gu1ieBujfjG9RKV0c65eOFanEeeQSWpMQZ
	 YOk4pRy5fuaLmP95gQc4oTRNaY6DR6BioZhvYKqMIY42I9eGW0aqem88DaJZebZ+tp
	 5/IJ0xv8HryYjQ4bsPGNS3Wq5AZ8W0aTi9eznVPDaQOBnByFOnzdpllf9aZQ5BkbNZ
	 Wchj4jOTynCGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA43413EF;
	Sat, 14 Mar 2026 18:39:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 265E91B2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 186974038E
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqIG2fn-NJNz for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 18:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1F384019B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1F384019B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1F384019B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:39:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 23C1BA4C0615
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 19:39:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54312)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1TtA-000000002Hh-3LVW
 for buildroot@buildroot.org; Sat, 14 Mar 2026 18:39:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 19:39:04 +0100
Message-ID: <20260314183904.3171654-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773513545;
 bh=k6InL1JoNAjOV6/M3yuacxnsYtxS0AcYTMdVQW0k8i4=;
 h=From:To:Subject:Date:From;
 b=E4H+p3eulS9WdXpGfQE7SUlFn/MPQMiQ8gTQuPwiguhZnUtNUhr76uUh64UTNSmft
 eeiXZzqYf+XJ3MC4UbZAqzcWGZsLEN9qKyyB1DvU6OC9yT6EC6+T8eyyk7mYFKENn9
 92N7sx1SdwcglKTW5fzZObbEESrr/BDD3qbcl8lPa2gz3SygBWmSGXANqw0VtLLMOX
 wKuo6SMjK/crNZGZTf47ld3RVj3XJHCRdKNM4Regh3yNM03CJS1SSnwfalRouLGioV
 IQDKIBZWPvtu6paj2oAxhdt4ezmgexFFgz8BlglnIz0aq5AG0RHxngdMSfV9OpASs0
 Vg0xZ3LN+l8jQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=E4H+p3eu
Subject: [Buildroot] [PATCH 1/1] package/file: bump version to 5.47
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

https://github.com/file/file/blob/FILE5_47/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/file/file.hash | 4 ++--
 package/file/file.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 53c4d5c4db..bb367893a9 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,6 +1,6 @@
 # Locally calculated after verifying signature
-# https://astron.com/pub/file/file-5.46.tar.gz.asc
+# https://astron.com/pub/file/file-5.47.tar.gz.asc
 # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
-sha256  c9cc77c7c560c543135edc555af609d5619dbef011997e988ce40a3d75d86088  file-5.46.tar.gz
+sha256  45672fec165cb4cc1358a2d76b5d57d22876dcb97ab169427ac385cbe1d5597a  file-5.47.tar.gz
 sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
 sha256  2e14b6fa9a74f952ebfde3c96527158df281c953cfaf35609eb854d4da30131c  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index a33b306c4c..b70b3c521c 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.46
+FILE_VERSION = 5.47
 FILE_SITE = https://astron.com/pub/file
 FILE_LICENSE = BSD-2-Clause, BSD-3-Clause (vasprintf.c)
 FILE_LICENSE_FILES = COPYING src/vasprintf.c
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
