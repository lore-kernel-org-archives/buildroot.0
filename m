Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9F1D2629F
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 22:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CBB182364;
	Tue, 20 Jan 2026 22:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6NlnD4Vlh60; Tue, 20 Jan 2026 22:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2B1382244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768948128;
	bh=gvelUfeT+AyvxuhHYDV4DWVpzpPkvrdJOg537WBJCko=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VTCqaRV012nKMIYOVQ6Rz1iGivxvw9yqyrn6jipSXSrYG4HXq7aMeBnH9LxNK3PEU
	 PuPSwEA+LfOQ1Dm2O56RhnvzI13lCRZv4u9WDv1PH49KGnwlXjAEVt2Aey0Ebh28m4
	 WmL4gEPeq3HpZ+77Lh2iR2alVGn7Z1JAYcBND5uNmLnY6xknQhAce0JQ1vHIr8gL26
	 nQcSSLaED/mWDxBPqObGolbPwS7QNmRLcGHyvtPF9QFZlJYedshw569Euik/YJRCsi
	 HATnYGyHQRfkphBAMElzTvU+qygxpBNW+cAxM5lsuW8fDyQV7CIKZpGlMcYyYnaLqf
	 YkBD/Jy1JS7+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2B1382244;
	Tue, 20 Jan 2026 22:28:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A37CF169
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 22:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 937F48223E
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 22:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vfexCmnlw2l for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 22:28:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EFC682245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EFC682245
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EFC682245
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 22:28:45 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8A1E919F5A5;
 Tue, 20 Jan 2026 23:28:41 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 20 Jan 2026 23:28:35 +0100
Message-ID: <20260120222835.29577-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768948122;
 bh=QqNzsX+aPMHv2XI06PxpJIUYpoAhlykg4kcj1Zp4KTA=;
 h=From:To:Cc:Subject:Date:From;
 b=E28MMfaGRbt+kT4gFiXB+Ea7tJcoy0kcl5/PfAFxUY/ej90zQUWNy2w7bASoCGUqx
 Bywzw3Qsp0l5CbD2ow0nbkSXq6sqSLI6+yDqa1cL/vLjNNBAo/QpMC8JVVNt2Z3O5b
 RywxaUpPYRtMoczZ+GyR1q7vVNS0OL6kQJijS7u2OstZqsJPdHX+V3QRBn5mfJUeNu
 +MUJU7Q04qrjeCtp9Z27oGwSf03EuIw+6/rwmHe+HzCa0psVV1Ckb6pqw/kyLW92lc
 nMOgkKOsxIp6JxDBauV/ZgFl0UEDseBDpFYe5SCTHbQP6b4ClpfAS8jqzz7znoTOT8
 HcyvdAJDBsuOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=E28MMfaG
Subject: [Buildroot] [PATCH 1/1] package/octave: bump to version 10.3.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://octave.org/news/release/2025/10/01/octave-10.3.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12788116046
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 4ae6ad4684..4c4c457b65 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-10.2.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-10.3.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  d0bf8992b6d4ac2bdae93590f8520882150a239cc260b43c632b4a9ad28e8991  octave-10.2.0.tar.lz
+sha256  68bc82885a3ae67a806debb14eb229506d2fe398c969dd42e2e38cc1c35f2aff  octave-10.3.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 2f9346138b..155dfc8427 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 10.2.0
+OCTAVE_VERSION = 10.3.0
 OCTAVE_SITE = $(BR2_GNU_MIRROR)/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
