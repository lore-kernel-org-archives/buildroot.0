Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F54FCA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 09:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A8E961618;
	Thu, 21 Aug 2025 09:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZWrirYYbhCn; Thu, 21 Aug 2025 09:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5237A61614
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5237A61614;
	Thu, 21 Aug 2025 09:16:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39BB3D8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 09:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BEA440CFC
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 09:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X46cVDRLDI8b for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 09:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94D3F40C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94D3F40C98
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94D3F40C98
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 09:16:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -788505844; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 Aug 2025 09:16:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1up1Ow-00Fptx-0G;
 Thu, 21 Aug 2025 11:16:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 11:16:00 +0200
Message-Id: <20250821091601.3774405-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Zi7UR+mp2GfNKP1XPyCJLJ2oJZooXA7dVCT4cvXqd9kV6TNqUWkRPmaonlGMrY4PrMGiHNya6hvSSQBZHIiQFOllylw4vN8Xf0j0UOb765RqRAVuk73gfeWwPhknW50CHZ63g4SNE3DH8XkieE7ZggD59G2bbr6G58iuL0whpyONHzw0cZavDJOVY8/kS3H3LeeapE8opxP1ksd2RQ/00AoYcUiTq3fcIyxmwzZAo1lcTC3wHy+PXmBg0sGvZvY8/jdrWLnY+LxC2TjrHw9k6hqsidFCSQousno/CMwi8DeHupuM7QC6jq4GrSk3HZ5lVZD9n9RLVAu5XoHL78yLDw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=tIHrnf5yEDmnPUnhZ01R8uv2TebkvZTNPfGlYR8/26M=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Zi7UR+mp
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 1/2] package/proftpd: bump to version 1.3.8d
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

Bugfix release, fixing the following issues:

1.3.8d - Released 14-Mar-2025
--------------------------------
- Issue 1855 - Use of HideNoAccess for SFTP sessions can lead to segfault
  and/or unexpected behavior.
- Issue 1876 - SFTP channel allocations can lead to high memory utilization
  over time.

1.3.8c - Released 11-Dec-2024
--------------------------------
- Issue 1770 - Using FTPS after upgrading from 1.3.8a to 1.3.8b leads to crash.
- Issue 1785 - Bad handling of lack of extended attributes leads to SFTP out of
  memory error.
- Issue 1529 - mod_sftp_sql logs "header value too long" due to unexpected key
  header text.
- Issue 1839 - SSH ECDSA host key algorithms not be used as expected despite
  configuring appropriate key.
- Issue 1840 - RADIUS Message-Authenticator verification failed with ProFTPD
  mod_radius.
- Issue 1830 - Supplemental group inheritance grants unintended access to
  GID 0 due to lack of supplemental groups from mod_sql.

https://github.com/proftpd/proftpd/blob/1.3.8/NEWS

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.hash | 2 +-
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 5a7d153a31..88b5906945 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  183ab7c6107de271a2959ff268f55c9b6c76b2cf0029e6584fccc019686601e0  proftpd-1.3.8b.tar.gz
+sha256  42ba40d8d5a5a9f28c9dcd7f15aa6b5368fe5efceaacb999041311b170f076d5  proftpd-1.3.8d.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 025fc46e45..84a499a5c0 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.8b
+PROFTPD_VERSION = 1.3.8d
 PROFTPD_SITE = https://github.com/proftpd/proftpd/archive/v$(PROFTPD_VERSION)
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
