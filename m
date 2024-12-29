Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A249E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 20:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C918E605A5;
	Sun, 29 Dec 2024 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-QCHQiOTr4T; Sun, 29 Dec 2024 20:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5E86068A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5E86068A;
	Sun, 29 Dec 2024 20:22:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F2E1CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C18E403DA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EVboENHv44v for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 20:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1892F404C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1892F404C5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1892F404C5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:22:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b064.dip0.t-ipconnect.de [84.161.176.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5691A4C418A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:22:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51946)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tRzo0-000000000Ic-2hlf
 for buildroot@buildroot.org; Sun, 29 Dec 2024 20:22:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 21:22:31 +0100
Message-Id: <20241229202232.1678307-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1735503752;
 bh=gY97VsFNYBeazE99q4elBujmksQDge6hpb73klp4dd8=;
 h=From:To:Subject:Date:From;
 b=TXZUVkWeN0q5FUkCR47uh11OAgp0Gk0AtRlBNFNyESn4oLo7oq5b26zOAFm+SVuo1
 D1nd6C10tpYEBOppKXst7OiEsglCzF91VoA6zxn9JgvyJHiRgH8EPZ+Jl2yZSdaxiJ
 bLrG1R3w5G89+fOsC5Pbd68qH+gkpnN6g+DJosGdzR0upODOOHqzC96TpeLcoB6yFv
 g6PfWMSRKPuME3InHUP79Mw108ljZyd2xWajJyCABrWP1dMZ+pYx/Pryyir1Q+glqt
 CgFQGIAcu79htc+5xFOv5IN9HrNluwg4s++YsBii0TtF55FXs7pIjDtmVMo1JOGr1V
 sGcqHmMRV8m8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=TXZUVkWe
Subject: [Buildroot] [PATCH 1/2] package/libvpl: bump version to 2.14.0
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
 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index 0e7abd1e19..b88972415e 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c740e2b58f7853f56b618bdb7d4a7e5d37f8c1a9b30105a0b79ba80873e1cbd  libvpl-2.13.0.tar.gz
+sha256  7c6bff1c1708d910032c2e6c44998ffff3f5fdbf06b00972bc48bf2dd9e5ac06  libvpl-2.14.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 8a75ce22df..0296cd7b5d 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2.13.0
+LIBVPL_VERSION = 2.14.0
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
