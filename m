Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B036E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDBB580F88;
	Wed, 11 Dec 2024 19:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFyosL27ZMXv; Wed, 11 Dec 2024 19:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14E4782F96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14E4782F96;
	Wed, 11 Dec 2024 19:14:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F214F962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D170F41C6F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxJ17Df-TxzM for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE1FC40184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE1FC40184
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE1FC40184
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:14:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3A97EA4C3C9F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:14:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47754)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tLSA7-000000002tP-26gK
 for buildroot@buildroot.org; Wed, 11 Dec 2024 19:14:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 20:14:19 +0100
Message-Id: <20241211191419.1405439-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211191419.1405439-1-bernd@kuhls.net>
References: <20241211191419.1405439-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1733944460;
 bh=+Rv6QyMVEK7kbD4LMDQFhtmgqFwb/bCf0eN/GL51PP4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kHgJNqb7wIVCFrGfmlbu9JDq58IOvpxfFGeaHE73DlCFiTYTECUyNAmsYxz6OJX+d
 nsWk43+wT2LY9S1IC7h7JAUQuIIn64/Bq3EhFCa+ILduZsutlClKnxSvytpRUiTRuZ
 u7vHOSho63Ha4hX/qaSlG2CYf8teoBzPIBHY/J7w8cLCzjmBm6Zk9bK3UpUDgI7Tj3
 VsKLq5VMTRZZt0+jrYEmpgpvErgOjKxId51v4EHcsPVFHqmuNnVjJjPetemH9uqdiz
 lfy5rDaz2lEw8DcLDFwVs5LjGmm3qAMtvK/F7QI4/Gndk0nLzxy1F77FN9oAuzEi1x
 6oOEmTvvQhOyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=kHgJNqb7
Subject: [Buildroot] [PATCH 3/3] package/kodi-pvr-vuplus: bump version to
 21.3.1-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index f0bb4df7df..58d5316596 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b807baf970b034762d6bccb8be63c16a4a50508f3fc5b87d53d0804f4e94ac4d  kodi-pvr-vuplus-21.3.0-Omega.tar.gz
+sha256  6badfea5184aafe5808a0df2b8d668d04eb8b4eea2ef4586fd9d3a7d72514250  kodi-pvr-vuplus-21.3.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 21ccec410d..b3653a0d63 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 21.3.0-Omega
+KODI_PVR_VUPLUS_VERSION = 21.3.1-Omega
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
