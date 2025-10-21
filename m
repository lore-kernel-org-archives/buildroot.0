Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E60CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 16:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2184A8025D;
	Tue, 21 Oct 2025 16:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ghsZtrj-Ix8; Tue, 21 Oct 2025 16:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 361D680EC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 361D680EC1;
	Tue, 21 Oct 2025 16:23:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2784243F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10CE3406CE
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHabBRVNTV9q for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 16:23:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE600406C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE600406C5
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE600406C5
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:23:43 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b660019ac2aso811939266b.3
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761063821; x=1761668621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HaH01Rcitre7jMxG9aVMOCjDQo4O2aXzF/uvZqK7pN4=;
 b=lLX8KGq5sGUlVApEg3qOxQW8hcAxcRDKM2slyZC/7QdLg3BGMkGmcvisBn6w04NYGa
 WOII6tjpILt7YiD+qfS2hEss+0MCu0AEgNpanFGuLopw1iQReNTBSLfHHVY+FNWRE384
 n1yTYHVwaY/no2DZnPwkp8lQHg8rAQKFuLPLawZLOuHu1dFF6JuGPxeFqe6dcsHxC9HO
 hlK9RLjolZ7z2iyKRB1XGm4MNhwGtqs54WkR1NOWL36oVrbVwTH6kWSURlydVqqKiD3d
 9GnkFsP4CSayV/gsUn38RFYE4DlnZSshJFH+S5dqXi5iQRTEae+X4i7bNFeTDRPGPWHQ
 I4tg==
X-Gm-Message-State: AOJu0YwCUpK3YARAEN2KGAALL+SjvE5G1JPcvE74kKW0gpfMnLMkPaaf
 k/EohkKzYOTOD6dphSqJqKcxNfEM8BNPehssjT+iCpKcvhIQ5XZ+7VZzdYlC9JS7j6N43pGv1vX
 TGEa+MHo=
X-Gm-Gg: ASbGncsC96C/O/S0mHb7N/JQGNCu9HtjerkAt7FIJOnwbUeabFGhw1zhtVxePBx+H4F
 UzP/lC8WOJjgtjVJ7V2KPEvONojoiiefeHlNzPUGNJePiLkTbAyKxN9sI/a8aY/G1BIzmZO5cjX
 aQLEWG6vJmfUhppNjXjGtkJqpYP9FEYyPEzFp86OeglW6NcNZt/Yl6nKF2pSsp7DMhSoQRtXFro
 n7ulHQ+bMkxG5Y85TOLvp9XCRET66WhRm9NIZI7Uj+GiEbu9tIlY+a3RaKxwRZXAZi1zeeHsBBA
 JXlyGFheiOgDBHwjXlg5uWwHQau9v7x3uFDFWPzhHftB8sguTBy125NDU14xtVT/x2uONA/EoP5
 GJIQqgpChpeolk5qyOFFcuRWlTaN1bZ3FUc+uZPC/E2NlLfeHC2QEDacIIGgDHMZ8YCPhuQ7pgV
 nS7bHD/WQYVqtHllNbIqRzfM1KAAGcedGgWsQ=
X-Google-Smtp-Source: AGHT+IGkPcZjddroufL5aiYw4SvegYXv1aDllUCOS+WQAW59SSLwCpu7Eao7dk3yFidXzVpwGt1ybg==
X-Received: by 2002:a17:907:c0d:b0:b3d:8fe0:536d with SMTP id
 a640c23a62f3a-b647304515fmr2117246166b.15.1761063821100; 
 Tue, 21 Oct 2025 09:23:41 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65ebb49a83sm1115285666b.72.2025.10.21.09.23.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 09:23:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 18:23:29 +0200
Message-ID: <20251021162330.106028-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761063821; x=1761668621; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=HaH01Rcitre7jMxG9aVMOCjDQo4O2aXzF/uvZqK7pN4=;
 b=AJYWe/i+hAMDDierx5bZHZjA6IUpQNPfWnuBXzDM6Ip6wzhwjlWMx1eK45rQjQfhmg
 1XybEjPAvTLQOT+sM4WuzJpqxhA0VeUSxjw0Lc989x74jnBKYkmrGRCS/nNx8c6XzCit
 Yn0tibxURxFWjlCriPuCgEQ49YW3SpEn8NXcv795vAXWKLVKdAvNcbK4wQBXcEvQ+Wqj
 RaBEGMJknIMJm4HynmyhwoaNIdfm/rIoB6GNZXaaO6pbGhSQG6UwisdNKOFtTyNRmoMp
 CS4jjuA0fI+CUeCwsz18sus2gVwqDyN9q1EkqAEVC+0pqyY3u3f+5AItUuJ+r+I6GTT7
 vjiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AJYWe/i+
Subject: [Buildroot] [PATCH 1/2] package/xerces: security bump to v3.2.5
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12352411&projectId=10510

Also update the download site to https

This fixes the following vulnerability:
- CVE-2024-23807:
    The Apache Xerces C++ XML parser on versions 3.0.0 before 3.2.5
    contains a use-after-free error triggered during the scanning of
    external DTDs.  Users are recommended to upgrade to version 3.2.5
    which fixes the issue, or mitigate the issue by disabling DTD
    processing. This can be accomplished via the DOM using a standard
    parser feature, or via SAX using the XERCES_DISABLE_DTD environment
    variable.  This issue has been disclosed before as CVE-2018-1311, but
    unfortunately that advisory incorrectly stated the issue would be
    fixed in version 3.2.3 or 3.2.4.
    https://www.cve.org/CVERecord?id=CVE-2024-23807

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/xerces/xerces.hash | 4 ++--
 package/xerces/xerces.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
index e6b5b922d2..52c22ee826 100644
--- a/package/xerces/xerces.hash
+++ b/package/xerces/xerces.hash
@@ -1,5 +1,5 @@
-# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.4.tar.xz.sha256
-sha256  075bc57940da0f9be6dd183c550c8ce0b9833e4550dc382048377a1a5e3b2bd9  xerces-c-3.2.4.tar.xz
+# From https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.5.tar.gz.sha256
+sha256  545cfcce6c4e755207bd1f27e319241e50e37c0c27250f11cda116018f1ef0f5  xerces-c-3.2.5.tar.gz
 
 # Hash for license file
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 08efa6fb5c..7734cff0d2 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.2.4
-XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
-XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
+XERCES_VERSION = 3.2.5
+XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
+XERCES_SITE = https://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
 XERCES_CPE_ID_VENDOR = apache
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
