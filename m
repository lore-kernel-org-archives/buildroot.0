Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E405CE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A993E4066A;
	Wed, 11 Dec 2024 19:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9R4k_NSYKEHQ; Wed, 11 Dec 2024 19:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 776BA40794
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776BA40794;
	Wed, 11 Dec 2024 19:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA8D3962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC57D81FCA
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0N3RrBoZQHE for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:29:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3CD081FBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3CD081FBA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3CD081FBA
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:29:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D3272A4C2545
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:29:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54048)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tLSOx-000000005BA-0lWx
 for buildroot@buildroot.org; Wed, 11 Dec 2024 19:29:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 20:29:39 +0100
Message-Id: <20241211192939.1671829-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1733945379;
 bh=xiKO+J9YYVz3RKViBUIqPss/YeHx1Qm/mAKyv1wmCpc=;
 h=From:To:Subject:Date:From;
 b=Tmm5quFNONSgw+D4syfnAqXXK711Is5jVw94rZ+MgWNMLk5OQIYhDTmTbGeqOM7fs
 uSwTuP5HoU0aMxmlGCw6NOAGkqv4RyKpIaOilejCXayF6ZR2A8pJxIZLSFQVOuum4p
 mlvevGjziM/kP1UbifP1NTRJ5b/K/jn247iiWt1yR4vy8l7T84JCQQ6OCTx1LLrbGM
 LcVLHWqVCyhH7KmWo6LgjB6W4Nq8Mij7hdCxvJaoKFhSn2+cOYYdvhJ9vlFhT4C5AN
 sNb5hStgG6jRDyES6H/Rh/8GU1R4gun2reykoeOBX7NcXTs7pV8D03JWjjPhMCZqVX
 xAOaOca+UDjhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=Tmm5quFN
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.5.1
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

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/58835491/
https://sourceforge.net/p/fetchmail/mailman/message/58840916/

Updated license hash due to copyright year bump:
https://sourceforge.net/p/fetchmail/git/ci/62a11ca4064e5b59e57ca7a8fce08c82af259731/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fetchmail/fetchmail.hash | 6 +++---
 package/fetchmail/fetchmail.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 12612ecc48..52ad4856ca 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/58797299/
-sha256  75109a1f307b538155fa05f5ef298e8298cb4deae95aed24c16b38d36ff0a186  fetchmail-6.4.39.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/58840916/
+sha256  ca3fdb95141c277aca109be77f4d45b47e03ee010043058dd90bc182db518d4a  fetchmail-6.5.1.tar.xz
 # Locally computed:
-sha256  6d87443b61041067a5eddb2cabf8aebff15b8b40771ad6b5e4754e607ec21b39  COPYING
+sha256  1d5eb054414ceb75e018e2830d2c2b61d3ac0df02d5376330766237a091ea771  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index a9239d0855..077f395760 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).39
+FETCHMAIL_VERSION_MAJOR = 6.5
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).1
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
