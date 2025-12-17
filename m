Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDB4D637DF
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 01:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF5E40ABC;
	Wed, 17 Dec 2025 01:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3gUS9ocL6LX; Wed, 17 Dec 2025 01:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A805240B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765934879;
	bh=uhVgQ00jqDTrPSF8oH7dCWoJva0OZWilEfpJJK5J+wA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y+eMUCgGXtby420NER8j26Im/fK5ei11CVdkd9mwLN8I1GoSIIyFM49eUFRSCMMhL
	 4gEYfBImyYLPh4NukudrXivqfI+1+0NaGkMaAZdwZuLXVQF9xNR3AcQ15z7VDmL8kg
	 KuNhdM7ivtAsTk945fliE0fxQFXuIYHNAIY2AyUhStZOJjFOnMJnb0q2I6Og+8AMlh
	 diEOozQQIFyqa8VvI5S7IDcCynjAUgXGaiiqKFDgwgw8fXg07B9S0/xJIvOkVMTzZL
	 0zAl5ALprjuqbpCMAdZmnBhiQ5sge+SgjgVhOgRMsDmfu3A40F7MT/LJElvAF2hFa/
	 /AU7l/cEtC/Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A805240B0A;
	Wed, 17 Dec 2025 01:27:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CB02372
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 01:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E9D740B0A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 01:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NA39CMdUbGtu for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 01:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=matt@codeconstruct.com.au;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 206FA40ABC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 206FA40ABC
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 206FA40ABC
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 01:27:57 +0000 (UTC)
Received: by codeconstruct.com.au (Postfix, from userid 10001)
 id 8CC2E7DFD7; Wed, 17 Dec 2025 09:27:53 +0800 (AWST)
From: Matt Johnston <matt@codeconstruct.com.au>
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 09:27:51 +0800
Message-ID: <20251217012751.2602488-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1765934873;
 bh=EIXjdBsjC1N2Te3ERDcrbntdSKefxJo3KUVfyWbuWxs=;
 h=From:To:Cc:Subject:Date;
 b=UMNCAK0Z5V2l7c5/uuaXKqgIyt6ornIO5vIiBur4E57e+MXaXdH1U3nJTYDDnyZ+j
 epvCXmxSGfsUHdlHOR1Z8p0NFm4yvvrwOzfgN61CVz6KR4E7bAeRNblE04rthBsCDu
 N5+Qegwdjgym9AddRLvgRz5qCcUVW6fSZGOe6HnKHpCvq0a0BhqGf4MJNqlER/8RxI
 MRieoJ6YVFULkycdrlYE43//A59J7Ecv99bNgPDX1yjK2VvKT+jI5+RNxlosygAUJ3
 zwv+GzdUq4qjJ7m8KR6dBp9DdRna4ZYcJRTIJzreySqQvhCUMaY9OYeS0mrHVxdxyX
 4nB5sdga4dPpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=codeconstruct.com.au
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=codeconstruct.com.au
 header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a
 header.b=UMNCAK0Z
Subject: [Buildroot] [PATCH] package/dropbear: security bump to version
 2025.89
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

Fixes CVE-2025-14282
https://security-tracker.debian.org/tracker/CVE-2025-14282
CVE-2019-6111 for scp
https://security-tracker.debian.org/tracker/CVE-2019-6111

Release notes:
https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.89

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index b18aca3aab5d..b3f532b1b79e 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4  dropbear-2025.88.tar.bz2
+sha256  0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634  dropbear-2025.89.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index d57d6b6e372b..e4e42cf99442 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2025.88
+DROPBEAR_VERSION = 2025.89
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
