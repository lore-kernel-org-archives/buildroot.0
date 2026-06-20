Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4839ECD4F26
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 15:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9914785C17;
	Sat, 20 Jun 2026 15:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaDca8tKx3nt; Sat, 20 Jun 2026 15:43:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23BA385C05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781970230;
	bh=XfcWyqP7MHfCRxV6YFey44p5J2/e+ABS+weVBLh78sg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PdFXhpACK/ma08H//YauCfPTlXUKq41Ekxi82D6g7ym66mwC/anr7X0iRpaxxJm2V
	 2250WLSG430HvAV9Gw8gzRF+tixAIW/T6uHCIs+CdelBIQDC5A4/QVr4D2aFf4MEEa
	 HzvEnnEkd9Zo02w7h6Yqpl0jmHmw2Gzj8ZEDIEDtYiKtyPp+dsZzwaxFp/giItmywP
	 G51E/m0izOuRLwVMqmSHP5DgKo7XNC1Zi88Y1R59ajtPkTKib+EBH8X7J+WJLtFXOs
	 USWsaNNA4buAFzQOnWqbFx7p1L+BZpdi+o+kXFQFYZ2EiyHGANR2QtZjjfJDvy/wWZ
	 RZTA4O8IGadBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23BA385C05;
	Sat, 20 Jun 2026 15:43:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D02F3367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5FFE4EBD2
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5T0MQTR7conk for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 15:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0121C4EBCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0121C4EBCE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0121C4EBCE
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:43:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C877AA4C0400;
 Sat, 20 Jun 2026 17:43:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37270)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waxrD-000000007U5-1wyv;
 Sat, 20 Jun 2026 15:43:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Theo Debrouwere <t.debrouwere@televic.com>
Date: Sat, 20 Jun 2026 17:43:43 +0200
Message-ID: <20260620154343.2708220-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781970223;
 bh=4AKluI+BuFrv2AJajwu7hfiTBo6DlJdVwMpysUHjong=;
 h=From:To:Cc:Subject:Date:From;
 b=VQ5vXJmbMt/dUh+arPrQcTQ48Mw3FHjLBKphu/ucLiOM1DHVxrgUGUDkC7ZD98s5Y
 AFSWP1FL2jepZQDm4XcC7LqRQIZdGHhbCMBf7SK3mjd/HlBOHZCldRZ6dM8UHeSmrj
 BNWHnzfWbIidFJg3zAvtJJ6qo3+vi+1IgzhbQlOxxsipY/SevKnfwS0gwaICVnqgr8
 q3a3FRDkeSyiDEJWmf4GFzn7DRf861HEYyFDmAZOUAITFZOdJIp06kMvC8avsjOlCe
 G1/21M6ibQBhfK3Tx3H+cenNWXT6VhiVnegaufSG2DOfOCQrpG5ncK3Ussn2oKrGCS
 3SPraXMTpnW+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VQ5vXJmb
Subject: [Buildroot] [PATCH 1/1] package/pugixml: bump version to 1.16
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

https://github.com/zeux/pugixml/releases/tag/v1.16
https://github.com/zeux/pugixml/releases/tag/v1.15

Switched tarball hash to sha256 hash provided by upstream.

Updated license hash due to copyright year bump:
https://github.com/zeux/pugixml/commit/710052066cc0a7210d7f554196ae43bd1cd9da3e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/0299d4e97dae9bd33113dd563e382e20695d9276

 package/pugixml/pugixml.hash | 5 +++--
 package/pugixml/pugixml.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
index 2446788d89..1ae3aba32d 100644
--- a/package/pugixml/pugixml.hash
+++ b/package/pugixml/pugixml.hash
@@ -1,3 +1,4 @@
+# From https://github.com/zeux/pugixml/releases/tag/v1.16
+sha256  4cee1ca4aad395170f4c7a07824f3bdd41f28316c6e1e1090a1425b278ec0b4b  pugixml-1.16.tar.gz
 # Locally computed:
-sha256  2f10e276870c64b1db6809050a75e11a897a8d7456c4be5c6b2e35a11168a015  pugixml-1.14.tar.gz
-sha256  01e13f39d058cca09968f18d423912a18f8bf61b9161c65f8e5bcc418a8aba28  LICENSE.md
+sha256  90974fbb120e966b452654eaae3ba6ee55f3647db3b28918a7649733ee99da97  LICENSE.md
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 3935526af6..aada1fb6c0 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUGIXML_VERSION = 1.14
+PUGIXML_VERSION = 1.16
 PUGIXML_SITE = https://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
