Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C6CE85376
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 15:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C24411EC;
	Fri,  3 Apr 2026 15:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bD1vzyFR1d1b; Fri,  3 Apr 2026 15:54:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD67411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775231674;
	bh=SBAB/lgdEh9TECFGOmcxRNVfyNZ55RN1tYmiMFlWpoM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rdEm/X7iXHs8M3siBuEDmyzQk31MpcUhJMHk/mbtFDYHG/BTNeA3XJWp43yxu873Z
	 5ORTK9Fl+HKVXm87FAEx0AERwDUc3GhIGM6l/Hi0QH78GnC+6ufiNxsEUeC1BW7GrM
	 Ty2onSb5l7Pg79tYQ2eITED4R2mGi+fJ0e7o6Fa7pcNG4m20p47qjlWFovvYObGH0W
	 nZj4pYfLaxXW4zb/HmpzOaLK5tGOcOJi9PTey0Z+z1Tfj6kBvYz9b+5YL+ZIptFgGi
	 ycQwcTkDo+j90Oz1VPUeTTjDCRCG25VCiQbOvvKm5WJCm+CIlT8St0metal3oftQC4
	 3v/gbq/XzdhOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD67411E2;
	Fri,  3 Apr 2026 15:54:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D3B2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 15:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62B99401EA
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 15:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXejjSlzRJAm for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 15:54:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81E5F4003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81E5F4003D
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81E5F4003D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 15:54:29 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8gqowr5zTRHsh8gqow9zjw; Fri, 03 Apr 2026 17:54:26 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  3 Apr 2026 17:54:25 +0200
Message-ID: <20260403155425.2878268-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFDGI11cAoyIybV5ULU06cF+om4a83lyOpolEA+oV8StYAy+AgWeCAkChCAttZQAIYrDH3JCz6tlFkmi+t1mRvOcMkKd0dG3b+8zjbJHvpBDN1om5CXR
 l9Bj+BPrn8Xpf+Lr4WDebIplccSgoad/vUti0gYbVu6FeTgAhSseaO0M8q1pMM1zwY4HcakvZvueIQVLxxxHSiuKyxPeNHOq4niUB1VzDoJEX39BFb7vuHv3
 fOozyFD1dYfVKNuuA/yVoz1QrgSHBoTHCRR/9zsbMNU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775231666; bh=3lwUwQEtK5N0wUYr74SIUjqCsQLaVvQMCatySjc4HyM=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ft7kS7OVNHQJHelINlPIo8YMwrGjjwuXaQZl4wZ7kUqJeaLMqUkhn7AKk74BBVPon
 mUQxX9XuR2S9Mi3GNzMLWPHIbXzr/6ibQYd6h09/6ysQgYrERKoQ8wuOe8mSHwEbRO
 2AjkW9vPZGwryIKFrSqIzbmOK6FgDTF+zGeA05J5IcPenkehS6iOtbk3ma09wRKftI
 963BjzKD00DabJ840cwukta1WBnTHkHY1GQBody/76RVbXLXQzhe/+8nLN8+eyhtAg
 5bT91P8OD3kKmmSPE0F6k51WlaT8Bb7aqF+UML4xnWTxbBxniCmBGIrRioUQfHXJwZ
 3aQWUYg4uYlKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Ft7kS7OV
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.6
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

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.6/docs/v2.8.6-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index c8e76bab9e..dada277347 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  46f7a5b5b228b28ce17f43bcb891b442dc0f1f56df2370646131131e4d702e92  cryptsetup-2.8.5.tar.xz
+sha256  8004265fd993885d08f7b633dbe056851de1a210307613a4ebddc743fccefe5a  cryptsetup-2.8.6.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 80abf88a94..716a244915 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).5
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
