Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EF9C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 17:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3918A80EDE;
	Sun,  5 Jul 2026 17:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z62_sqcVzty6; Sun,  5 Jul 2026 17:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C78080EDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783270890;
	bh=dAeLpPC5sQKKNILaEPp/aTcCjhGkWPhoPw80TOBspz4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R4WPNovQ9vV8dc3FOrC7Hv+XSUor/9ww2qf2kTM3tNsRKB7Fkm0wtnvZyJc9gzKV2
	 qrL5CNcLDkZuUo9s7YlN/vFRRTttop0iyLjQ4uGkg3gEUbsM1Iw84MAGTP3ve2PdqY
	 xq4e5y1ylvotQm6u055YibB2Y4Gc5/TjBy/iCAl2jQDIJ35Et7OjjRRRYfgnG/30zr
	 E7xNA5l41F9kX1ogfFkijgp+K2VVbW54HTN8zSc0PeoiKauCmlf3dpcZwPaT1Jz0JQ
	 YGSqEh/Jw3/cCExzvnEp1uOb1FQsnsaxpBO2ODexCkAwZ3grtYYmHWIChMlhF74J0C
	 IjkaN9QTaCALg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C78080EDF;
	Sun,  5 Jul 2026 17:01:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56A14F2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D14A400AB
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpgGuReK8jiz for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 17:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F2074008D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F2074008D
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F2074008D
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:01:28 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3225F31E08E3; Sun, 05 Jul 2026 19:01:26 +0200 (CEST)
Date: Sun, 5 Jul 2026 19:01:26 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <akqN5nYTLz7l3S9S@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1783270886; bh=j3vfdeMGHBy47y/odQk59Y87pX0+UHA4/4Xzyc26Bo4=;
 h=Date:From:To:Subject:From;
 b=eQtW7WQtKyjncEEIZ718lcknlNgnIDJ8zKaT8PNYHyPi7Ces1enr88YRq2Wi76t9D
 Fdb87tqybuH0D10Leb7S9NWdcal2cu3ueW6pCn7+WZ8SK1g1rLx8iYVNczYznEm3N+
 OEzupxtOpDSvc/Q05mdOs2jN+ovz6OCQJlyCYjfGPEyUrCT4XBAwcSRwdBFzVjOoVC
 ZHKLI1Pfo38//W7XnV1Lsx34AUrEk1YdfDu2k2K0fMW+R/K3aymOt4t8qGmPOAcO8J
 KTCKn4176dJ6rlNTl4W5Nhi7W5WiDzBIzKU5ZviqDmFcnz2yyg1Mrn7VVUOIg3SyKL
 kqDEnLSew5oQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/stunnel: update download site
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

Fix the download site, which seems to be changed after
a new release. Use the more permanent /archive.

Fixes:
 - https://autobuild.buildroot.net/results/a1a/a1a88bea6fdf5ae28d813f0a12d08e504b2fad06/
 - https://autobuild.buildroot.net/results/b3d/b3d0588fbc02ede6d5f82fb5d2fefcf610a69299/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/stunnel/stunnel.hash | 2 +-
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index dc61f6d5b9..572f226861 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,4 +1,4 @@
-# From https://www.stunnel.org/downloads/stunnel-5.78.tar.gz.sha256
+# From https://www.stunnel.org/archive/5.x/stunnel-5.78.tar.gz.sha256
 sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
 # Locally calculated
 sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 59321f910a..ef93dc6073 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION = 5.78
-STUNNEL_SITE = https://www.stunnel.org/downloads
+STUNNEL_SITE = https://www.stunnel.org/archive/5.x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
