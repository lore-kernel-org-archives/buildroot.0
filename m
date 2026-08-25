Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0410FC61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 07:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDB5880B42;
	Tue, 25 Aug 2026 07:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yd1rwEtJ9UHs; Tue, 25 Aug 2026 07:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787644305;
	bh=splCTnGRXs/8VYtmtB6jxY0nGXbndGctZ/05kr405uc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mV3p/1LFc3/sqY8jUgk0HkSJW/hvMX8oN/Abslz/S332/JtcUf3c0ZCvUQzVVU82X
	 W0R0bWVaZ6pEXtYV42+Jmv0PWF1khdhyshbkczO9kNczp3bnYKmDsc5sna7C0rB1wf
	 B04lfUvJGtoasGTjuj9F7Y7Kz0YBJ6JccSjPSSIoFaey8DytjaGSymB0UJRAi1pd+j
	 8Jq3W6znV/GeU/wohYnduTs9PwhUloHWOxRC+F1eB5zDfgT6741KKe5jBDCekW4Unf
	 zBINj4PwpGwSqGJLljw0cpHQtkEen74+cShvmQC+8UG5jJvx3PyaSPgHpE2nFZFenx
	 5+758EFT/zUqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49ED80CD9;
	Tue, 25 Aug 2026 07:51:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBAD4336
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D88366068D
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bH0D9W_ncAo for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 07:51:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=A8fhFBCx
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 266F960614
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1787644299;
 bh=bKnFcYNswXbjUDdkJBr2eOcIcplIuTeT4p722aSdNB4=;
 h=From:To:Cc:Subject:Date:From;
 b=A8fhFBCxdRR9XPvOji/EFXoSw6s17glOkPwN1/8X9vMdu70a0F4WW3YneyPs8pn8o
 jZu7by8VZCENyEgI9rNbCQDSMa933KV2oyWNOy7p5v6qnOt4VGjGdtZV+A6Wi/v8qf
 Le/993LmHBHLOoK7yvN0NWhA78CRV9bApikBnxg2tJBpXwYFRkiGd7WdFDDpKxERe0
 tKquizliYPRB+dJm7XeY+nToDAiKQNjYPXoGGJ/dOo2tA//Hwjoo6FWr/3xzEiLXA6
 jivWymkGS8q4njUHEkgFlZLJLyKNX3lql4NiGZ9PgPGoaNZw6BR9KrR3C0SbiNnh8O
 XVZDTCmXkhL0g==
Received: from fli4l.lan.fli4l (p54a1b0c8.dip0.t-ipconnect.de [84.161.176.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D41C8A4C20A9;
 Tue, 25 Aug 2026 09:51:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wylwZ-000000007yG-3AR3;
 Tue, 25 Aug 2026 07:51:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2026 09:51:39 +0200
Message-ID: <20260825075139.3470-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-27-gae9225d55
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

Fixes CVE-2026-19542:
https://gitlab.com/gnutools/glibc/-/commit/d6ff274313d79feb864cc10eb775b91c817a67e9
https://sourceware.org/bugzilla/show_bug.cgi?id=34506

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index c6eadd5334..bfeb5ab6bd 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  a818ca8450ef1e19a2413b2c9a2882f381f05be07b31e9b38085b6ba193d0af2  glibc-2.44-23-g11ac3d78fc5e4f7f2846002e099f773ad8ff82fc-git4.tar.gz
+sha256  028aa13d6c0737aecf0ec6ac0fa842e3a18c82bcdaeeb800d42a65a76dcbfe91  glibc-2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 726cfaa6c5..e0332dadc4 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-23-g11ac3d78fc5e4f7f2846002e099f773ad8ff82fc
+GLIBC_VERSION = 2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 7a3dbef9a2..c88f3f1fa6 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-23-g11ac3d78fc5e4f7f2846002e099f773ad8ff82fc
+LOCALEDEF_VERSION = 2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
