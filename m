Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5218C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 19:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6756680E5E;
	Tue,  1 Sep 2026 19:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5hLnn30uDAN; Tue,  1 Sep 2026 19:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788291725;
	bh=OZLvj5KToESDU3LyfmvGGqST7XvjLeyOxeXoz8N+Wgg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bDUBsO551vsH1o0kpyXsbcz2wi5XxeNekVtlxtixHuKVUkTrOXDlnzVb9s9/gUJ6T
	 o1a/MPGem+mIF/GGFFAwFfI1WgZyGqUn2EGc7UIixthGbCNwf+Vzak4ltSaE4NcJnq
	 9vuT85v3yYOqMx2kT6mYXwKG1al3lPZ7+JOj3K9T/JzLERD9MMbtIoBr3saTW851yc
	 jCrScv097/ILZDYq1Bx1eK+sqRHI2ogY84BvOvfXMIbk5HYpXKqTH4XAR7r6RBsvlU
	 pInYZ7mnY9JAwv+uztNjtPX0Y7aFGjweFpvunNjnWEdHh629AC16PioLamjyjL9Uob
	 dECP1HwSMycZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9564480DCA;
	Tue,  1 Sep 2026 19:42:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3102B3AF
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EE3F40249
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HVWP_Rvrs0R for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 19:42:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=eMYmeXK9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC999401ED
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:42:02 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=eMYmeXK9XgbMWSw7/3vXlZOUCdirs6xJx6meWlQ/owrPJOkYoHsPgl7fCb4DhidU5YpybUoXBhrPrMkUW9uZJcUathJlu6CjUDnxwHziv/3XS5m3/+P1wregz4AV2ncRjdA/F6ltuW1TY20QTOaMR4xzna1+IK62GGiKwGLZrNZxc5zB8iwSrt7sCowvO3OkeAwf0vdSMYkyZp3I4QQoFz1ih5P6oIfzuXBkCwxJXwRhvkSQBU64Nqg1acBNfD4k/8EC21g/Yar9fidmRpneAan2AwIq+0Bkd96VF5u3w6RJeNj8lWfXYquy3hKsIjteKa9ZT/uOHmvU2+7Eik0ijQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=/ugvC9LjvyDsqO7pj3HKE2Uf8cMd07BVEje+G2qTgZM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 630523767; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 19:41:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1x1UMo-00000004O4A-0GJY;
 Tue, 01 Sep 2026 21:41:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  1 Sep 2026 21:41:55 +0200
Message-ID: <20260901194156.1045810-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/exiv2: security bump to version 0.28.9
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

Fixes the following vulnerabilities:

CVE-2026-68546: Heap out-of-bounds write in RemoteIo when reading from a
malicious remote server (WebReady/Curl builds)
https://github.com/Exiv2/exiv2/security/advisories/GHSA-3695-mjv8-3r52

CVE-2026-68547: Heap out-of-bounds read in RemoteIo when reading
block-aligned remote CRW files
https://github.com/Exiv2/exiv2/security/advisories/GHSA-jcgh-p9v3-pw6j

CVE-2026-49275: Out of bounds read in CrwMap::decodeBasic
https://github.com/Exiv2/exiv2/security/advisories/GHSA-hxph-pv7w-8649

Out-of-bounds write in RemoteIo::mmap
https://github.com/Exiv2/exiv2/security/advisories/GHSA-vg6c-9f6h-4x5q

Out of bounds write in http.cpp
https://github.com/Exiv2/exiv2/security/advisories/GHSA-9v3x-mhg4-wwv2

Infinite loop in QuickTimeVideo::userDataDecoder
https://github.com/Exiv2/exiv2/security/advisories/GHSA-fgw8-p7pr-37cp

For more details, see the announcement:
https://www.openwall.com/lists/oss-security/2026/08/30/1

Notice: the RemoteIo-related vulnerabilities are not applicable for
Buildroot as exiv2 is not built with libcurl support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exiv2/exiv2.hash | 2 +-
 package/exiv2/exiv2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index 7c497cf0eb..ff8e82333a 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ea51b0609f58a9afa063b60daa1539948b62247721e154f4fff0ad3aec9f9756  exiv2-0.28.8.tar.gz
+sha256  700b76b97695b2fab4ef8c79619c68ae57d09e0c130724791cafbd39e0eb4aef  exiv2-0.28.9.tar.gz
 sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index d45acae34e..7c9ac5c6cc 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.28.8
+EXIV2_VERSION = 0.28.9
 EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
