Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F4AEED626
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 18:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA804046D;
	Thu,  1 Jan 2026 18:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDwdS2b18QbD; Thu,  1 Jan 2026 18:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BF74401DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767290451;
	bh=8dW16OD5PXJZ9foSB+v3qmS4zbD63sPvnbZNXW1lmNE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YERQLcfs+SuEQrj56K6uoL7/w9k/m7yWwAZGU8d4WRqepM3WkIzKCJ4JM0Q4ol2SR
	 3VGUYk/MHyPgwpjZjefDVRQdMHsCX6/SZ9oHzxD9UAEIKyd/fUiZZbKmC+L39FFQfb
	 OO5fQuSwg0dtK3vNcNuCkaN4jRgpEvxcN9ohhd1d2pelcfkat5eCU2T5byjz88q/UW
	 uvv1JBBSwRI8aqyLAmTzIdFnsZemBwrjQ1RDek485XvMBofdvjZNI1qNyQ7JGHnuyO
	 LHCACR0lVKGhbin2jfqA6+PHmiUAVaem5IYZEVdJOKYeQfnxGObABgoMb6mTPr8JLW
	 jrvQij8MlnIfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BF74401DE;
	Thu,  1 Jan 2026 18:00:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C38A206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E208401DE
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oMMKX5Ya_vp for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 18:00:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 514AF401C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 514AF401C7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 514AF401C7
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:00:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41B06A4C2A90;
 Thu,  1 Jan 2026 19:00:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33758)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbMyb-000000005MC-2gKc;
 Thu, 01 Jan 2026 18:00:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  1 Jan 2026 19:00:43 +0100
Message-ID: <20260101180045.247057-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767290446;
 bh=7t7qLmUk7/sgqwsdU4G1J0xuo7PFtQYyzfgjYji5BZA=;
 h=From:To:Cc:Subject:Date:From;
 b=O1dQkpZMp7IKxW1xO6VoHUA75/P6j1ecYwHoUnK+NV8yI3idmhJKpUzMlBbMljqgc
 +TbX1UYmXZRJ4WyOWw2gMnlK1LEWHCmKBEjZZGO+dz/z7E/GuwDGKJYLWcNMib8Ow5
 8Zmb6CTmtL8mY1VmHVotEdCmlgBsMtrEzQp6v8TK4hbJTcHe38aSX/msuukHXz0SiV
 wqSoH0Ng6vw5Bi1/ftPlbrz+8gZ/PNf575rR/y5wedGphJfv2+ec3xPbkSNZRxm5wp
 FiluRwMhTCT66bGRRNr2RQFmTxuKkCh+AT6xBP4q3QiJo2M0+bogK5SX8AKWXEN1pM
 d1U/fhIZiz/aQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=O1dQkpZM
Subject: [Buildroot] [PATCH 1/3] package/libdill: autoreconf needs
 host-pkgconf
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

Fixes error during autoreconf when openssl is not selected:

configure.ac:119: error: possibly undefined macro: AC_CHECK_LIB
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:127: error: possibly undefined macro: AC_MSG_ERROR

As it turns out adding host-pkgconf as mandatory dependency fixes the
problem.

Fixes:
https://autobuild.buildroot.net/results/05c/05c6a3f5a9290f1e5e4f62fea13a0f4cb1278c04/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdill/libdill.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index 9dda81d085..bea9aaeecb 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -10,6 +10,7 @@ LIBDILL_LICENSE = MIT
 LIBDILL_LICENSE_FILES = COPYING
 LIBDILL_INSTALL_STAGING = YES
 # Fetched from Github, with no configure script
+LIBDILL_DEPENDENCIES = host-pkgconf
 LIBDILL_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
@@ -19,7 +20,7 @@ LIBDILL_CONF_OPTS += --disable-threads
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBDILL_DEPENDENCIES += host-pkgconf openssl
+LIBDILL_DEPENDENCIES += openssl
 LIBDILL_CONF_OPTS += --enable-tls
 else
 LIBDILL_CONF_OPTS += --disable-tls
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
