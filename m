Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAE6EFCE37
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 19:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEE9C8119A;
	Wed,  4 Mar 2026 19:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Ye1OmMvvyyU; Wed,  4 Mar 2026 19:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFFDD810B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772652204;
	bh=TZ8SydfgbqA8Ia31uHXqKFtPVHNdnBzCg79lFQMgKi4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TArTnmw1Kg/XwlYZU2TiHm6DlTRCqqI52ACL8qiHPQW+1m2mH1IQ6yrHBkdCVgaGL
	 B0ZUIDD5fNJPgAfMcf3UAooyJUIML+lT/VEexUQlTP1SKJsik5Hzj0t+wE8pSjgwth
	 VAncvn5xlindP0RnapxjH8VBkzWKa/T7jCpRPECkZvyOzPUBfP81tPsXsMJv816Uu6
	 zYmG+3pM+uz4Ts5GPspXgjkIzUOwdFdu7EXlcdtlnkAXBibtqefnvdeCgEaXUx4D0Q
	 ygmYPh4OfgBZPv1NLkYbkmYcC89BpGO/aRurYTsttYUDFlZ/nddnx87RMfWRG4rhnR
	 lPgK+G/oijEqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFFDD810B7;
	Wed,  4 Mar 2026 19:23:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1A13223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B32004048A
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPbxxxEtKbjl for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 19:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC029403FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC029403FE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC029403FE
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:23:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b996.dip0.t-ipconnect.de [84.161.185.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF16AA4C338E;
 Wed,  4 Mar 2026 20:23:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50454)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxroV-000000008Ks-3YgD;
 Wed, 04 Mar 2026 19:23:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 20:23:19 +0100
Message-ID: <20260304192319.3493151-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772652199;
 bh=IeX+qSfkZ6BEcNaE+UhDKMZYwTCBvo41dkEduUm41xg=;
 h=From:To:Cc:Subject:Date:From;
 b=HVpFw6bFb5aZfMz7wJ9PR8JyoMmbxUkCFfNE4NTLzs3hy9imKf2OepQwbwu8IWwAH
 REcGsgrwAv0WkOE6QU0db4INy4Ku3iNKjctcaTzQrLSe/O4QBRm3VlVXcmUcXRz2K8
 5ZAB4Y6Ti2hdbgUfz+TkTHShUjaZ25Wwh2cyi6AWpKN2GShuEpaMjp3pFyR5ETo95j
 0zLLH+dvQkqpk9FyAZeI2kL/id4DtLWb75h5ecTpE3frOUEZJi3Pj6SvdqmNOVCDle
 bcCsP7ghXyNM1VQOM6ONF7NWkPIq6v86q2vvBmyQqBetQ5nYPwzPodmhxoHhU7gSfe
 zLgsArAIqmA7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HVpFw6bF
Subject: [Buildroot] [PATCH 1/1] package/exiv2: security bump version to
 0.28.8
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

https://exiv2.org/whatsnew.html
https://github.com/Exiv2/exiv2/blob/v0.28.8/doc/ChangeLog

This release fixes three low-severity vulnerabilities:

CVE-2026-25884: Out-of-bounds read in CrwMap::decode0x0805
CVE-2026-27596: Integer overflow in LoaderNative::getData() causes out-of-bounds read
CVE-2026-27631: Uncaught exception: cannot create std::vector larger than max_size()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exiv2/exiv2.hash | 2 +-
 package/exiv2/exiv2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index 1c85f2e1db..7c497cf0eb 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5e292b02614dbc0cee40fe1116db2f42f63ef6b2ba430c77b614e17b8d61a638  exiv2-0.28.7.tar.gz
+sha256  ea51b0609f58a9afa063b60daa1539948b62247721e154f4fff0ad3aec9f9756  exiv2-0.28.8.tar.gz
 sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index e5b55ecde7..d45acae34e 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.28.7
+EXIV2_VERSION = 0.28.8
 EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
