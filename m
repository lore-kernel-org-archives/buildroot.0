Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3512C0218D
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 08:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DFDE4243F;
	Sat, 25 Jan 2025 08:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owoBBviPyN98; Sat, 25 Jan 2025 08:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17F1A42437
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F1A42437;
	Sat, 25 Jan 2025 08:50:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C7C0941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 08:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D7B560B1D
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 08:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXQzINEcaq-e for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 08:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 447AA60B13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 447AA60B13
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 447AA60B13
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 08:50:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c8f0.dip0.t-ipconnect.de [79.214.200.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4966BA4C475E
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 09:50:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43486)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tbbs5-000000002w9-329Z
 for buildroot@buildroot.org; Sat, 25 Jan 2025 08:50:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 09:50:29 +0100
Message-Id: <20250125085029.18171-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250125085029.18171-1-bernd@kuhls.net>
References: <20250125085029.18171-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737795030;
 bh=eRMbrIMc2qZh9B7PbcM4DPUyXLjCiarmsVoxd0OBnhc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FFxoZ9t/NaQMJ1wwHR6YiQ8l9N1E7FUiSGcwr3vzvIHRUYcecKFkhegcJ1s8M8GAy
 BdgEQRkgw6TfH3ea+fujLPYvFxwNAUAUlzYujvkmy5fKSamHDRdgz2vvDJjwfXuX1A
 nGIz6e6n2bCJ3DsWcb6qaKYbmehy6k0BBRrgLZ9K6Guwc1lHVoMziLNwN+qi8xUqCQ
 1eXfFb16GrvT59JVG3bqqbUtDHDsR8up1PplQcWPjpGf+QGwb6du4lqSmHAlp3n/LX
 sltGWO7xPZ1Rsr1mYOhJmMsrsGVjkUw50bsLzQMUDmsTmtWh+f+3SBJ+XHfI8AGTOu
 CJH5EVXogtf0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=FFxoZ9t/
Subject: [Buildroot] [PATCH] package/kodi-skin-confluence: bump version
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
index be28fce8cd..9cde584da2 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  826e37b0eca598dded0b83672365c2245a2a7b40fbfc3230969549f03f850eee  kodi-skin-confluence-d243118534c77d76ad3f188cf58cde8f34b145f5.tar.gz
+sha256  ae7177ad7f06fdb38ba0e217b2ac3e4375cf29a7792f2eaa70003286410521a0  kodi-skin-confluence-b049aa8b6bab50518de72783efd219680047d6d9.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index e5985ebed6..31d6b37380 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = d243118534c77d76ad3f188cf58cde8f34b145f5
+KODI_SKIN_CONFLUENCE_VERSION = b049aa8b6bab50518de72783efd219680047d6d9
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
