Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47832C0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 18:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C43942795;
	Thu, 30 Jan 2025 18:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moIPojfic9TZ; Thu, 30 Jan 2025 18:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDA6542591
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA6542591;
	Thu, 30 Jan 2025 18:22:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AE5012C
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0515C41297
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_T3M2guVEMN for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 18:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1809B41289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1809B41289
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1809B41289
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:22:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca57.dip0.t-ipconnect.de [79.214.202.87])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48822A4C042B
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 19:22:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48870)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tdZAv-000000001Gz-2C7p
 for buildroot@buildroot.org; Thu, 30 Jan 2025 18:22:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Jan 2025 19:22:01 +0100
Message-Id: <20250130182201.189109-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738261322;
 bh=yvGWET3DomXEUNszk1gtVnkcRj6vXZGmKZfksVZN34M=;
 h=From:To:Subject:Date:From;
 b=Fje6NXXquojdaFhXS2CFvEJL0QM9fA4k8jJREQsevkXZup02qYCDdECjmSFh9l0BF
 nzy0T55lGnri+UETqx1iafEFiEhgtcng/+3G0Pvq74IF4296EUGMDV8fGf/h8lNImx
 waMFvTBCtARadLWN9mTBVFJ4ch7aw0LRu4Inhr6G/W157VzyehshL/oqUwlpTKD1kc
 YcWTcuMlbC7EEZ05YOwCCeSU83BYgubDGku6sxGxtwR1S2NGWWa1OEwb4c+2EQzq2e
 vgLj4RDwI4dNlc8zB1e6hiVKBjI6lrO7z7i+3HMO2KfEybRAWZFdwQ+mKaKILIf0Rm
 bvLdz4rKzdAdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=Fje6NXXq
Subject: [Buildroot] [PATCH] package/libcdio: bump version to 2.2.0
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
https://github.com/libcdio/libcdio/releases/tag/2.1.1
https://github.com/libcdio/libcdio/releases/tag/2.2.0

Switched _SITE to github:
https://lists.gnu.org/archive/html/libcdio-devel/2025-01/msg00005.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcdio/libcdio.hash | 2 +-
 package/libcdio/libcdio.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index 1b157992b2..52d923a3d0 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-sha256  8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b  libcdio-2.1.0.tar.bz2
+sha256  6f8fbdf4d189cf63f2a7a1549c516cd720c7b222c7aaadbc924a26e745a48539  libcdio-2.2.0.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index df26d9a7ac..b84ae27759 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 2.1.0
+LIBCDIO_VERSION = 2.2.0
 LIBCDIO_SOURCE = libcdio-$(LIBCDIO_VERSION).tar.bz2
-LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
+LIBCDIO_SITE = https://github.com/libcdio/libcdio/releases/download/$(LIBCDIO_VERSION)
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPL-3.0+
 LIBCDIO_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
