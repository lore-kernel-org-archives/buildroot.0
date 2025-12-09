Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6809FD3B7ED
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 15:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B84A608FB;
	Tue,  9 Dec 2025 15:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yk0Wk_4M1U7Z; Tue,  9 Dec 2025 15:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49BE660801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765295373;
	bh=XpgbOg6eBbnWbYy2i1SJbAfWatCmvzYjVCJDW7aXt9Y=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=nhWyuB/VBxMircFkBOZTXGySYVoxLA/O7dCcIjxP4LmN/YhmxZd2v3UXDzEyMcYcZ
	 5C692F0qmQ8JJsSAjgizjipeZa1csr1MPyeNuAO2fd9wn27iebe3sDK1IhCsKpgNG3
	 5/08Vbo8BPov7nPuuLommBkTHl3CueVzip6FCFVfB8nTwNjtaEcE0dlwjMZw74s1RM
	 JyemVNdDAEXGbiXA6+yMJFGcUCQGjv+PUQOljEm/IRLJ1JBmMX2X8OuiJdEnC0q3/a
	 50ckzS62PMHvqn8imPQGjbjtD2kt1dd2pMBztcr9SD3WpGiclvZTYkmVU0cCflPzLT
	 dfn485tEFnzhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49BE660801;
	Tue,  9 Dec 2025 15:49:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D21197
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 15:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B848F80C95
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 15:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb7C8SO9scpg for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 15:49:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.117.158.92;
 helo=sender-pp-o92.zoho.in; envelope-from=preyas17@zohomail.in;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48DAC80C6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48DAC80C6C
Received: from sender-pp-o92.zoho.in (sender-pp-o92.zoho.in [103.117.158.92])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48DAC80C6C
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 15:49:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765295363; cv=none; d=zohomail.in; s=zohoarc; 
 b=Ap/KjBp2iqtMqsfaiHz/jjqm1xaaW1e5xsZ89zSKRJO9y/pKuWbTzKcP8WA3xaem0lVQCmwc5ONOJvSOfxfeGmlVBktC6pCC6G+K3CC6adHqvs2WAc+WlddSX0XaLVwcrdfaMBRYWOJFbjwcNAR0Kh0k32ZKTu71KEPTp5T2g1Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1765295363;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=g4YhK2nFzD7fhhOHC23Py4phT6v63NolSMsBV1Q1whk=; 
 b=GQyHHhoAm7F097dFr8Bm2bLTqGNpV5ozJDYnJe945GmU/FfXdtQ85z+2pDP0r3kRKsitoo/yST2TLUtP+ogvm6x2yAp7lFHRpmwVE0Xvp1mXlFcKbtqksBT2k6rVvvl1FgjU6PTrEw9hOVjIjf26WNNGFiHJMtUP0Y7LjCa0O3w=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=zohomail.in;
 spf=pass  smtp.mailfrom=preyas17@zohomail.in;
 dmarc=pass header.from=<preyas17@zohomail.in>
Received: by mx.zoho.in with SMTPS id 1765295362060795.7199665338337;
 Tue, 9 Dec 2025 21:19:22 +0530 (IST)
To: buildroot@buildroot.org
Cc: Preyas <preyas17@zohomail.in>
Date: Tue,  9 Dec 2025 15:48:33 +0000
Message-ID: <20251209154834.5946-1-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1765295363; 
 s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=g4YhK2nFzD7fhhOHC23Py4phT6v63NolSMsBV1Q1whk=;
 b=CtvDAR6Ebt/1O3g01DX2MPd0IlwS0gXfS6jg9pU1zDO50BTFjBBvq323xKGXy+EN
 wodSgyPNm35KvekhNdl6eZN8SI9sZuLF3Bh0dFa8+esRf99sETevfmIF5Ll1H31jcmb
 jEcQHNaYP6i+vKhUoeXLE0X0uel2miJn4ifW9U+8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.in
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.in header.i=preyas17@zohomail.in
 header.a=rsa-sha256 header.s=zoho header.b=CtvDAR6E
Subject: [Buildroot] [PATCH 1/2] libseccomp: bump to 2.6.0
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
From: Preyas via buildroot <buildroot@buildroot.org>
Reply-To: Preyas <preyas17@zohomail.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to latest stable release. Refresh sha256 from upstream PGP-signed checksums. No packaging changes required.

Signed-off-by: Preyas <preyas17@zohomail.in>
---
 package/libseccomp/libseccomp.hash | 4 ++--
 package/libseccomp/libseccomp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index b80efd68f5..aaadc8424e 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,4 +1,4 @@
-# From https://github.com/seccomp/libseccomp/releases/tag/v2.5.5
-sha256  248a2c8a4d9b9858aa6baf52712c34afefcf9c9e94b76dce02c1c9aa25fb3375  libseccomp-2.5.5.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.0 (PGP-signed checksum)
+sha256  83b6085232d1588c379dc9b9cae47bb37407cf262e6e74993c61ba72d2a784dc  libseccomp-2.6.0.tar.gz
 # Locally calculated
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 10d57bb78c..26585b1887 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.5.5
+LIBSECCOMP_VERSION = 2.6.0
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
