Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AE5C28B28
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 08:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46A9540BFA;
	Sun,  9 Mar 2025 08:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpcBa2_3nXGj; Sun,  9 Mar 2025 08:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0933E40C26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0933E40C26;
	Sun,  9 Mar 2025 08:32:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 418D4DC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30D704018D
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUb5vOQnrOns for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 08:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDF9D400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDF9D400AC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDF9D400AC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 08:32:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c397.dip0.t-ipconnect.de [79.214.195.151])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF030A4C1ACA;
 Sun,  9 Mar 2025 09:32:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49288)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1trC52-0000000020b-1FBP;
 Sun, 09 Mar 2025 08:32:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Mar 2025 09:32:16 +0100
Message-Id: <20250309083216.824179-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1741509136;
 bh=XBhJhH2Ak+Iv/+79mg04JpmjA05hoIcojczKCBX2OtQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ERnXgqIq4iG2w2MDfq8TE4xTnLGDMY5533SJ+IFkTVQwi08t3cIoWnDHIgyG9Q9k0
 4nrTKg948mUr7l/G7+C2skRhe8ZOglnTqkIa0UODQ60sA3LnNKWvE45Xqgez/4lsK8
 eUz3vosiH7NJp80Uk/3rmxc1pQd1Q+JHq3ilz93L/F71myVexevlPT6vPs2O2g3jWz
 js8kiKnvkoWAr46CfjcZDctp8eQJnAsISUI19HQMuyhSPO8s+An46MjcgbKG3+0QyS
 1fg4vdIdXvLh5Iz4r+X9fqsVAj9XzT3Wbd9jzo63J6wgbMMe/Wn5xzFy1fHx+WW0pR
 /7cJs28ldWWJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=ERnXgqIq
Subject: [Buildroot] [PATCH/next v2 1/1] package/dropbear: bump version to
 2025.87
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

Changelog: https://matt.ucc.asn.au/dropbear/CHANGES

Upstream disabled sha1 by default:
https://github.com/mkj/dropbear/commit/f3465a34eb4007ca3e45044ebdf863842e0346d5

Add the options to DROPBEAR_ENABLE_LEGACY_CRYPTO hook.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: optionally enable sha1 (Baruch)

 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index cf2dd18d61..777910da15 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e  dropbear-2024.86.tar.bz2
+sha256  738b7f358547f0c64c3e1a56bbc5ef98d34d9ec6adf9ccdf01dc0bf2caa2bc8d  dropbear-2025.87.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e043893aa1..b0f5dc7afe 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2024.86
+DROPBEAR_VERSION = 2025.87
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
@@ -69,6 +69,9 @@ define DROPBEAR_ENABLE_LEGACY_CRYPTO
 	echo '#define DROPBEAR_SHA1_96_HMAC 1'          >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_DH_GROUP1 1'             >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_DSS 1'                   >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_SHA1_HMAC 1'             >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_RSA_SHA1 1'              >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_DH_GROUP14_SHA1 1'       >> $(@D)/localoptions.h
 endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
