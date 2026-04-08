Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C741073C98
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 11:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17FB06083F;
	Wed,  8 Apr 2026 11:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_MlQnLLEVeN; Wed,  8 Apr 2026 11:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E458160810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775646760;
	bh=bFkWixuMeObMMlGtdrlyty+Oo/JG727UZ2jntBwa6BA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=F0TZIbURmm0k+MMmWPx/ocKyNJ6LnFYGS0ZCwV0a2B1/xgDig3XTxs7luj5Mzbcw8
	 k1QMNpxp7iSLLEBjuZQk3Gje/M5Dg9SAelse9THR/8X61yOdHMFxU5gl+HQSFwFQoS
	 FHkk+/Vep5vsSCjETx4/3/gQVEfw5f6ajQa7zF0adhS2oLUpqvhQV6Etc51/T8TEvQ
	 99itoIpdex6U9YsEz2QIHez1Xc4pI0W9OJH7r9hqdsXep8Qw4vxCXWyOiupiybp2HR
	 CWQviU+TNoRmR05aPxkLYp9+y3X6VkLpfaQNEPtO9Vh1/gYO0sZvLYEBrxrUAA0AiE
	 5OZRThDYnJVPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E458160810;
	Wed,  8 Apr 2026 11:12:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DB63237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 11:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E92560810
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 11:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8oGg2kl26vu for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 11:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A91BD60808
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A91BD60808
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A91BD60808
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 11:12:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B1261814BF; Wed,  8 Apr 2026 13:12:34 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 13:12:12 +0200
Message-ID: <20260408111214.4171863-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1775646755; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=dAzbnZA4GCJEX4fDUOA+Z91qfmhUaKlSw5xIP/shqNE=;
 b=TDD+PeB2BXbPalhSg/HCcYntSSHLP8fNiNGeBuDU3myJ40gJn0F1jSq51v6MCbsXMYGcjs
 qVu/AxlaRuruf0Aby6Lj4wVOMPAPVeMjOqR2aTkV7iGPFNjyLTuMYqjOAyutf0kcyjdEze
 Pb0qWouznJ6RUE0Xzyg4rSfT/YKbKck=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=TDD+PeB2
Subject: [Buildroot] [PATCH] package/libglib2: bump to version 2.86.5
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix several security vulnerabilities of varying severity.

Release Notes:
https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.3
https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.4
https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.5

Fixes:
- CVE-2025-13601
- CVE-2026-1484
- CVE-2026-1485
- CVE-2026-1489

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libglib2/libglib2.hash | 2 +-
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 6698db8389..bc85581418 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
 # https://download.gnome.org/sources/glib/2.86/glib-2.86.2.sha256sum
-sha256  8a724e970855357ea8101e27727202392a0ffd5410a98336aed54ec59113e611  glib-2.86.2.tar.xz
+sha256  ce85a947bb8b3c0204dbeff79aec39bcb46371c6fafb64ba5b8726c71e038d5f  glib-2.86.5.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 1c5109f4ec..cae8a85a28 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.86
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
