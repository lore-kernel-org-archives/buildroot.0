Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C311E64013
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 11:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 572C98126E;
	Sun,  5 Apr 2026 11:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFaq9zXyO6Rw; Sun,  5 Apr 2026 11:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B7858125B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775390064;
	bh=hedsr1h/yvyfULkL+3m+Hh4EwIbngQ5InRuGK8m4FFM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fv2ehaK+jfz5nbusDPTnWZpRwPWYRCgwIyjlp9b8IXMCukoo9sk2FHMJLKeLvN1Os
	 TydoaNf+vWdf0I1UsGa8y7CCtruETpcsWUd5+a6HbxZXpVgRmp6OGOUIlnkD0aH2Gf
	 YmLuG+BRdKD6HFYHYM0lkK/uPKOum+4aym/MRmXAzJCzxNNgAiavo2AXGMB4mGFUtP
	 LbZhILBb/NV52PUaqdhOqKSU90bC9uco5VF1DVor9cYwD75pu7VFswhNaAutwnrMP2
	 +yW3k6K3LUm3yM9e3XUHGa44XZMjFYiCX4wIJwb4Y2T3dEv4UqCd/IYHhklnzSxGl+
	 kVw16KcbEOIIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B7858125B;
	Sun,  5 Apr 2026 11:54:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3A871EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1A5381253
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqhkpJCI8RD7 for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 11:54:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A4588125B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A4588125B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A4588125B
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 11:54:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2BF9DA4C38AE;
 Sun,  5 Apr 2026 13:53:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35810)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9M37-000000003vI-3Pjs;
 Sun, 05 Apr 2026 11:53:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  5 Apr 2026 13:53:53 +0200
Message-ID: <20260405115353.2468900-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260405115353.2468900-1-bernd@kuhls.net>
References: <20260405115353.2468900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775390034;
 bh=+c67xAwMfVfnvPw54JrOhX8nqQHmV7N944x3v9BYS6g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rAeDi4SGFMNZt7AqFFKxDmtwfK3z8uvC3HcW51jFa1vOsDHHY/l6JgOh0UcxYcwEo
 X/3CyUIqthDtYPaylO9D5DloNTGllOwTDa4HG7/8e6XxVDEU86mXM3ysXMXk6K6kW9
 q9rk5kD0x3HavGoG2IDUkNxsYS/poPQrQ2fBfZuQkUbRiTwadnJ6Av5sGYPLqpZ+re
 cFQGshui9g1FDbJpJ2AaMXwUkPlib7HmTQC6Q1sTpWHDfetrk/d8JOVe41QvG8oz1Y
 xUSmZAWDKyyv9ZUTblQ1nopZKGcySBwXn4psS8nZJtrqLFO0/PFqlydZDD1g4fYMM2
 v2Lm0E5eJd5Iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rAeDi4SG
Subject: [Buildroot] [PATCH 3/3] package/sord: bump version to 0.16.22
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

https://gitlab.com/drobilla/sord/-/blob/v0.16.22/NEWS

Added dependency to zix due to upstream commit:
https://gitlab.com/drobilla/sord/-/commit/ec186c111b2079aa2bb52f44b01b874e46ba4577
added in version 0.16.16.

Updated license hash due to upstream commits
https://gitlab.com/drobilla/sord/-/commit/53f071a571899faf27dd730ea24838c16887836c
https://gitlab.com/drobilla/sord/-/commit/5edcf18adfbc4240040c667c00884cbd049e3a84
https://gitlab.com/drobilla/sord/-/commit/fb728f8a6fb0e0410f15fa7a57f9ab7833db17ac

Package switched from pcre to pcre2 in version 0.16.16:
https://gitlab.com/drobilla/sord/-/commit/67bcd63bda9d7b095489a09b9880aa730ddb5488

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sord/Config.in | 1 +
 package/sord/sord.hash | 6 +++---
 package/sord/sord.mk   | 8 ++++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/sord/Config.in b/package/sord/Config.in
index 91dfb41d0b..f4877e43d7 100644
--- a/package/sord/Config.in
+++ b/package/sord/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SORD
 	bool "sord"
 	select BR2_PACKAGE_SERD
+	select BR2_PACKAGE_ZIX
 	help
 	  Sord is a lightweight C library for storing RDF data in
 	  memory.
diff --git a/package/sord/sord.hash b/package/sord/sord.hash
index ec5c88a43c..7ab940bae3 100644
--- a/package/sord/sord.hash
+++ b/package/sord/sord.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://download.drobilla.net/sord-0.16.12.tar.xz.sig
-sha256  fde269893cb24b2ab7b75708d7a349c6e760c47a0d967aeca5b1c651294ff9f2  sord-0.16.12.tar.xz
-sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
+# https://download.drobilla.net/sord-0.16.22.tar.xz.sig
+sha256  bb23b34b216579136795d518cffa73d91cf205594ce9accebfd408afb839173f  sord-0.16.22.tar.xz
+sha256  ae223adebe7cc1ee0716e0f926d1ecc8e42c6e4da7e1d7418c9c07fae244bbde  COPYING
diff --git a/package/sord/sord.mk b/package/sord/sord.mk
index 9fcf98858a..630be1c1c5 100644
--- a/package/sord/sord.mk
+++ b/package/sord/sord.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-SORD_VERSION = 0.16.12
+SORD_VERSION = 0.16.22
 SORD_SITE = https://download.drobilla.net
 SORD_SOURCE = sord-$(SORD_VERSION).tar.xz
 SORD_LICENSE = ISC
 SORD_LICENSE_FILES = COPYING
-SORD_DEPENDENCIES = host-pkgconf serd
+SORD_DEPENDENCIES = host-pkgconf serd zix
 SORD_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-SORD_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+SORD_DEPENDENCIES += pcre2
 endif
 
 SORD_CONF_OPTS += -Ddocs=disabled -Dtests=disabled
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
