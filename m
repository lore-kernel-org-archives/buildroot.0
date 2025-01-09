Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B45E77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 17:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E2E860B8F;
	Thu,  9 Jan 2025 17:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUm0BaMOhwvl; Thu,  9 Jan 2025 17:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BB2360B96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BB2360B96;
	Thu,  9 Jan 2025 17:03:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCD0376C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 17:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7951407DC
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 17:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mC4xklfhDmVq for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 17:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD3A3407D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD3A3407D7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD3A3407D7
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 17:03:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b1c1.dip0.t-ipconnect.de [84.161.177.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 45CFEA4C43A7
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 18:03:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58760)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tVvwM-000000007Ej-457P
 for buildroot@buildroot.org; Thu, 09 Jan 2025 17:03:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 18:03:26 +0100
Message-Id: <20250109170326.34279-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250109170326.34279-1-bernd@kuhls.net>
References: <20250109170326.34279-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1736442207;
 bh=ZDeJ57gw3Jk5F5OGH3quElICkaZDb6FsYuTnLHzAxcw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZhTdtMkaehYqpVyxaCI4NZZALEUWQq2iQjAXgZ7jBfNKoFlrLNdfh7EuHSbKeyb7Y
 ut9EvOe/or1ZLLsae68YRL1orsWmJ8ZQcOcUSYDHVp7C5pV3DNi0EVmS/qdfGK4+Ca
 EsG4buEIamjPCvYjhFlTj9fEPCFM+LgxvY+w6GPHf+/0IuV3+KhIjRLFJDVSMnygMI
 9+FAuZHDSkufIQUrcYnfpO3VwwO2MlodmkmbHr76YW3o/6u1KoBpAsi4PhHjczZtGY
 b8Puf+TP5DW1t2y8VOWg5kouGECRZbeP30ZMUvvNB3YFiwlNgz3Pnbn300XEaQLQxA
 e8McJwnSM1Lnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=ZhTdtMka
Subject: [Buildroot] [PATCH 3/3] package/kodi-skin-confluence: bump version
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
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 3cf17c5e13..be28fce8cd 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  61bded39800f751f4285c2e5bca26d4a4064fbeb3f90c253697b5aef07b1b328  kodi-skin-confluence-34e77d0122eab8c6e3fb502c623ba29749b19031.tar.gz
+sha256  826e37b0eca598dded0b83672365c2245a2a7b40fbfc3230969549f03f850eee  kodi-skin-confluence-d243118534c77d76ad3f188cf58cde8f34b145f5.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index dcff19793c..e5985ebed6 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = 34e77d0122eab8c6e3fb502c623ba29749b19031
+KODI_SKIN_CONFLUENCE_VERSION = d243118534c77d76ad3f188cf58cde8f34b145f5
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
