Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDDBCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 19:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9914641321;
	Wed,  1 Oct 2025 19:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yZxCVA0ObWa; Wed,  1 Oct 2025 19:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84D814123D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84D814123D;
	Wed,  1 Oct 2025 19:44:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE77F1CE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E017381063
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAjJ-6m5tYsV for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 19:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22F4A80F1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22F4A80F1A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22F4A80F1A
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:44:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0767.dip0.t-ipconnect.de [91.58.7.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D85D7A4C5926
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:44:27 +0200 (CEST)
Received: from [192.168.1.144] (port=57520 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v42kV-000000004QC-0mD8
 for buildroot@buildroot.org; Wed, 01 Oct 2025 19:44:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  1 Oct 2025 21:44:26 +0200
Message-ID: <20251001194426.3261816-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759347867;
 bh=MX3VIgwr1Gk82fRQyqdtf4aXAj2CnkqYzL5orQBbDzM=;
 h=From:To:Subject:Date:From;
 b=ESCYJlbH7Ment6i8yTvHjGAI0kid6nLMJgfDhSBUlhYJLUcX9DiRicwVo+JoYBffL
 pTfl13Zm6qm9tPdCdODjZhLxuvBwhDQVv/jR6pkIj+VbgUh8b3bn03hDBfbaDt1VqA
 I4gbp5I9e5JV/d99Ovhr+7dCO2lo/Q7QeoLGQH64+ELH2n4SWBvaEJsJOtY+PEd1By
 /uUq/H19p4PNX1kN79JDudr3OrAi0CTbrgswkjW+aAMeW1pb+q28C1sbEKTONPKoL2
 GFRLZJHOgTy+T1aJGBL+cxZr2/QcYlsZtCbTZK+SrEe7RXeR2z64ywBEL1Hvw4YIPx
 U+MsETkIvK/iA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ESCYJlbH
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.5.5
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
https://sourceforge.net/p/fetchmail/mailman/message/59238340/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 71c0756b15..402fe2c299 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59196377/
-sha256  c859156e9bff841d4d984cb3fdcb8042b6b31789fc3387c2649baa95a88d698b  fetchmail-6.5.4.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59238340/
+sha256  f989b62729c76afbcd65ec43b9c477f2d990f0913da141ff8166aa4e2bf56025  fetchmail-6.5.5.tar.xz
 # Locally computed:
 sha256  e5768c44445cf051dd88e0cf8bfc16d81f7b1a7cc28f4e0204a4f8d81cd16977  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 90345edf62..3eec63f071 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.5
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).4
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).5
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
