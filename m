Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228BAC4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC36D404D8;
	Sun, 11 Feb 2024 15:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4AewovPPcNU; Sun, 11 Feb 2024 15:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5528C40491
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5528C40491;
	Sun, 11 Feb 2024 15:32:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC151BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29E7A60709
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGQxHBNjfumZ for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:32:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A40F60782
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A40F60782
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A40F60782
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:32:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54B78A4C0132
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:32:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54678)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rZBoR-000000008Ls-0GQy
 for buildroot@buildroot.org; Sun, 11 Feb 2024 16:32:11 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:32:11 +0100
Message-Id: <20240211153211.2187231-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1707665531;
 bh=Op9iYn2OQsJTT6TpPSVm/u3rL1drtwvozBw8Cz2AZ4s=;
 h=From:To:Subject:Date:From;
 b=sOB8yqlBqkCiCaIKGPL6yeRQVXTP5DO+NtiAtPrPE5HqtHFbqgeoaraclgXtBsXql
 X56mPPtdVEEvs6P/QDm//NAzvLrwUDjzk8iZck1lAbyPUpjVjBciEc0OciV4ymAhUX
 yY4zdPxcV8G2h20Ae5ItdGwtphtvWSxMC/HBsUO3eatVYWUOSzTasOnZbxNlzCRpNC
 WdsEbZO4jULJ0Z3UAXEBhXfphWUVR+wNbcSwuUaN6qwj+ANCJv5ajpb0Jaeqn7dPKL
 07/eD1tgfVfSYdeTNtDOXOsmg8j9Uj7GzDX6lwP2rbm9LQC+epIFYndYPwM2ZRcHQz
 SSBsjsdzb6dWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=sOB8yqlB
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.4.38
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/58731594/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 9ca6b2c7a7..3c0403fa78 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37783197/
-sha256  4a182e5d893e9abe6ac37ae71e542651fce6d606234fc735c2aaae18657e69ea  fetchmail-6.4.37.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/58731594/
+sha256  a6cb4ea863ac61d242ffb2db564a39123761578d3e40d71ce7b6f2905be609d9  fetchmail-6.4.38.tar.xz
 # Locally computed:
 sha256  6d87443b61041067a5eddb2cabf8aebff15b8b40771ad6b5e4754e607ec21b39  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 6d418f9739..c74b259698 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).37
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).38
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
